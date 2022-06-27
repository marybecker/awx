import mysql_connector as msc
import xlrd
from datetime import datetime
import os
import glob
import argparse

des = """
------------------------------------------------------------------------------------------
Import Stations into Ambient Water Monitoring Data Exchange (wmdX) water quality database  
Mary Becker - Last Updated 2021-03-15
------------------------------------------------------------------------------------------
Given input directory of excel template spreadsheets with new station information,
automatically checks for constraints with the database schema and produces an
error report for tuples that do not meet the constraints.  Tuples that do meet 
requirements are inserted into the Stations table """

parser = argparse.ArgumentParser(description=des.lstrip(" "), formatter_class=argparse.RawTextHelpFormatter)
parser.add_argument('-i', '--in_dir', type=str, help='input directory of ftp\t[None]')
parser.add_argument('-c', '--cf_dir', type=str, help='input directory of config file')
parser.add_argument('-d', '--db_scm', type=str, help='input database schema name')
args = parser.parse_args()

# build args into params...
if args.in_dir is not None:
    in_dir = args.in_dir
else:
    raise IOError

if args.cf_dir is not None:
    cf_dir = args.cf_dir
else:
    raise IOError

if args.db_scm is not None:
    db_scm = args.db_scm
else:
    raise IOError


# function to read in xlsx file
def readXlsx(file, errFile):
    if file.endswith(".xlsm") or file.endswith(".xlsx"):
        try:
            with xlrd.open_workbook(file) as f:
                sheet = f.sheet_by_index(0)  # could also use sheet_by_name("Sheet1")
                raw = [[sheet.cell_value(r, c) for c in range(sheet.ncols)[0:14]] for r in range(sheet.nrows)[0:]]
            return raw
        except FileNotFoundError as e:
            print(e)
    else:
        errFile += [[file, 'Incorrect File Type']]


# get data from config file
with open(cf_dir, 'r') as f:
    s = f.read()
    f.close()
config = [line.rsplit(',') for line in s.rsplit('\n')]  # chop up the text by the newline='\n and the delim
config_uid = config[0][1]
config_pw = config[1][1]

# insert data from excel into table one line at a time.  generate an error rpt
ftp = in_dir
folder = 'Upload/'
insert_type = 'Stations/'
fdir = glob.glob(ftp + '**/' + folder + insert_type + '*Stations*.xlsx')

headerList = ['locationName', 'locationDescription', 'locationType', 'ylat', 'xlong', 'sourceMapScale',
              'horizCollectMethod', 'horizRefDatum', 'stateCd', 'munName', 'subBasin', 'adbSegID', 'hydroID',
              'stationsCommentTxt']
SQLinsert = 'INSERT INTO ' + db_scm + '.stations' \
            ' (staSeq,locationName, locationDescription, locationType, ylat, xlong, ' \
            'sourceMapScale, horizCollectMethod, horizRefDatum, stateCd, munName, subBasin, ' \
            'adbSegID,hydroID,stationsCommentTxt, ' \
            'createUser, createDate, lastUpdateDate, lastUpdateUser)  VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?);'
SQLerrLog = 'INSERT INTO ' + db_scm + '.errlog VALUES (?,?,?,?,?,?,?);'
SQLselect = 'SELECT Max(staSeq) + 1 FROM ' + db_scm + '.stations;'

with msc.MYSQL('localhost', db_scm, 3306, config_uid, config_pw) as dbo:
    res = dbo.query(SQLselect)

print('found %s files to process: %s' % (len(fdir), fdir))

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

        if raw is not None and header == headerList:
            with msc.MYSQL('localhost', db_scm, 3306, config_uid, config_pw) as dbo:
                insDate = datetime.today().strftime('%Y-%m-%d %H:%M:%S')
                user_name = fpath_base.rsplit('\\')[-1]

                # Insert into the database line by line.  Append DB error if not caught by qc checks.
                for i in range(len(raw)):
                    # Any blank values change to None type
                    for j in range(len(raw[i])):
                        if len(str(raw[i][j])) < 1:
                            raw[i][j] = None
                        else:
                            raw[i][j] = raw[i][j]
                    # Generate auto-number
                    autoN = dbo.query(SQLselect)
                    V_insert = list(autoN[0].values()) + raw[i] + [user_name] + [insDate] + [insDate] + [user_name]
                    ins = dbo.query(SQLinsert, V_insert)
                    if ins != {}:
                        print('error with file %s on row %s, err=%s' % (file, i, ins[sorted(ins)[0]]))
                        err = [folder[0:-1], insert_type[0:-1], file_name, insDate, i, ins[sorted(ins)[0]], user_name]
                        dbErr = dbo.query(SQLerrLog, err)
                        table_row = delim.join([str(e) for e in raw[i]])
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
            db_err += [['File Error - Not uploaded.  Check file type, column ordering and column names']]
            s = '\n'.join([delim.join([str(e) for e in row]) for row in db_err])
            with open(fpath_err, 'w') as f:
                f.write(s)
except FileNotFoundError as e:
    print(e)
