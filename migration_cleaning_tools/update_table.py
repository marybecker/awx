import glob
from awqx_app import mysql_connector as msc
import xlrd
from datetime import datetime
import os
import argparse

ftp_dir = 'D:\\awqXImport\\PRODUCTION\\'
cdir = ''
db_scm = 'awqx'
u_id = 'staSeq'

# read in config file
with open(cdir, 'r') as f:
    s = f.read()
    f.close()
config = [line.rsplit(',') for line in s.rsplit('\n')]  # chop up the text by the newline='\n and the delim
config_uid = config[0][1]
config_pw = config[1][1]

def readXlsx(file, errFile):
    if file.endswith(".xlsm") or file.endswith(".xlsx"):
        try:
            with xlrd.open_workbook(file) as f:
                sheet = f.sheet_by_index(0)  # could also use sheet_by_name("Sheet1")
                raw = [[sheet.cell_value(r, c) for c in range(sheet.ncols)] for r in range(sheet.nrows)[0:]]
            return raw
        except FileNotFoundError as e:
            print(e)
    else:
        errFile += [[file, 'Incorrect File Type']]

# Function to check if headers match database fields and remove garbage columns from excel file
def ck_desc(data,data_header,fields):
    D = []
    c_idx = {data_header[i]:i for i in range(len(data_header))}
    new_header = []
    for col in data_header:
        if col in fields: new_header += [col]
    for row in data:
        D += [[row[c_idx[col]] for col in new_header]]
    return new_header,D

# data,header = ck_desc(raw,header,p_name) # Example of use.  Note function returns two lists.

####IN PROGRESSS##########################################################
####Creating a data type check and transform based on the table schema####
# fields={ 'staSeq':int,
#          'locationName':str,
#          'locationDescription':str,
#          'locationType':str,
#          'ylat':float,
#          'xlong':float,
#          'sourceMapScale':int,
#          'horizCollectMethod':str,
#          'horizRefDatum':str,
#          'stateCd':str,
#          'munName':str,
#          'subBasin':int,
#          'adbSegID':str,
#          'hydroID': int,
#          'stationsCommentTxt': str,
#          'createDate': str,
#          'createUser': str,
#          'lastUpdateDate': str,
#          'lastUpdateUser': str
#         }
#
# fields['staSeq'](105.0)  # CAST a data type using a dictionary lookup
# try:
#     f = fields['ylat']('ttt')
# except ValueError as e:
#     print(e)


# insert data from excel into table one line at a time.  generate an error rpt
ftp = ftp_dir
folder = 'Update/'
insert_type = 'Stations/'
fdir = glob.glob(ftp+'**/'+folder+insert_type+'*StationsUpdate*.xlsx')

print('found %s files to process: %s' % (len(fdir), fdir))

SQLerrLog = 'INSERT INTO awqx.errlog VALUES (?,?,?,?,?,?);'
SQLdesc = 'DESC awqx.stations;'
with msc.MYSQL('localhost', db_scm, 3306, config_uid, config_pw) as dbo:
    desc = dbo.query(SQLdesc)

p_name = [desc[i]['Field'] for i in range(len(desc))]
# p_name = [[desc[i]['Field']] + [desc[i]['Type']] for i in range(len(desc))]

try:
    for file in fdir:
        db_err = []
        print('processing file=%s' % file)
        uploadDate = datetime.today().strftime('%m%d%Y_%H%M%S_')
        fpath_base = file.rsplit('\\', 3)[0]
        file_name = file.rsplit('\\')[-1]
        fpath_in = file
        fpath_err = fpath_base + '\\ErrRpts\\' + uploadDate + file_name + 'QcRpt.txt'
        fpath_out = fpath_base + '\\UploadedRpts\\' + uploadDate + file_name
        delim = '\t'
        raw = readXlsx(fpath_in, db_err)
        header = raw[0]  # use to check header names in the excel file
        raw = raw[1:]
        os.rename(fpath_in, fpath_out)
        header, data = ck_desc(raw, header, p_name)
        header_upd = header[1:]

        if data is not None and header[0] == u_id:
            set = ''
            for h in header_upd:
                set = set + h + ' = ?,'
            if len(header_upd) > 1:
                set = set[:-1]
            where = 'WHERE ' + u_id + ' = ?;'
            SQLupdate = 'UPDATE awqx.stations SET ' + set + ' lastUpdateDate = ?, lastUpdateUser = ? ' + where

            with msc.MYSQL('localhost', db_scm, 3306, config_uid, config_pw) as dbo:
                insDate = datetime.today().strftime('%Y-%m-%d %H:%M:%S')
                user_name = fpath_base.rsplit('\\')[-1]
                # Insert into the database line by line.  Append DB error if not caught by qc checks.
                for i in range(len(data)):
                    V_update = data[i][1:] + [insDate] + [user_name] + [data[i][0]]
                    ins = dbo.query(SQLupdate, V_update)
                    if ins != {}:
                        print('error with file %s on row %s, err=%s' % (file, i, ins[sorted(ins)[0]]))
                        err = [folder[0:-1], insert_type[0:-1], file_name, insDate, i, ins[sorted(ins)[0]], user_name]
                        dbErr = dbo.query(SQLerrLog, err)
                        table_row = delim.join([str(e) for e in data[i]])
                        db_err += [[file, str(i + 2), ins[sorted(ins)[0]], table_row]]
                    else:
                        print('success with file %s on row %s' % (file, i))

                if len(db_err) < 1:
                    s = 'All rows successfully inserted'
                else:
                    s = '\n'.join([delim.join(row) for row in db_err])

                with open(fpath_err, 'w') as f:
                    f.write(s)
        else:
            print('File Error - Not uploaded')
            db_err += [['File Error - Not uploaded.  Check file type column ordering and column names']]
            s = '\n'.join([delim.join([str(e) for e in row]) for row in db_err])
            with open(fpath_err, 'w') as f:
                f.write(s)
except FileNotFoundError as e:
    print(e)





