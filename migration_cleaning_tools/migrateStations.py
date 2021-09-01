from awqx_app import mysql_connector as msc
import xlrd
from datetime import datetime
import os

# read in config file
cdir = ''
with open(cdir, 'r') as f:
    s = f.read()
    f.close()
config = [line.rsplit(',') for line in s.rsplit('\n')]  # chop up the text by the newline='\n and the delim
config_uid = config[0][1]
config_pw = config[1][1]


# function to read in xlsx file
def readXlsx(file, errFile):
    if file.endswith(".xlsm") or file.endswith(".xlsx"):
        try:
            with xlrd.open_workbook(file) as f:
                sheet = f.sheet_by_index(0)  # could also use sheet_by_name("Sheet1")
                raw = [[sheet.cell_value(r, c) for c in range(sheet.ncols)] for r in range(sheet.nrows)[1:]]
            return raw
        except FileNotFoundError as e:
            print(e)
    else:
        errFile += [[file, 'Incorrect File Type']]


# insert data from excel into table one line at a time.  generate an error rpt
ftp = ''
folder = 'BeckerM/Migration/'
type = 'Stations/'
delim = '\t'
fdir = os.listdir(ftp + folder + type)

SQLinsert = 'INSERT INTO awqx.stations VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?);'
SQLupdate = 'UPDATE `awqx`.`stations` ' \
            'SET `locationName` = ?, `locationDescription` = ?, `locationType` = ?, ' \
            '`ylat` = ?, `xlong` = ?, `sourceMapScale` = ?, `horizCollectMethod` = ?, `horizRefDatum` = ?, ' \
            '`stateCd` = ?, `munName` = ?, `subBasin` = ?, `adbSegID` = ?, `hydroID` = ?, `stationsCommentTxt` = ?, ' \
            '`createDate` = ?, `createUser` = ?, `lastUpdateDate` = ?, `lastUpdateUser` = ? ' \
            'WHERE `staSeq` = ?;'
SQLerrLog = 'INSERT INTO awqx.errlog VALUES (?,?,?,?,?,?);'
SQLselect = 'SELECT max(createDate) as maxDate FROM awqx.stations;'

print('found %s files to process: %s' % (len(fdir), fdir))

with msc.MYSQL('localhost', 'awqx', 3306, config_uid, config_pw) as dbo:
    l_date = dbo.query(SQLselect)
    l_date = l_date[0]['maxDate']

try:
    for file in fdir:
        db_err = []
        print('processing file=%s' % file)
        uploadDate = datetime.today().strftime('%m%d%Y_%H%M%S_')
        fpathIn = ftp + folder + type + file
        fpathErr = ftp + 'BeckerM/ErrRpts/' + file + 'QcRpt.txt'
        fpathOut = ftp + 'BeckerM/UploadedRpts/' + uploadDate + file
        raw = readXlsx(fpathIn, db_err)
        os.rename(fpathIn, fpathOut)

        if raw is not None:
            with msc.MYSQL('localhost', 'awqx', 3306, config_uid, config_pw) as dbo:
                insDate = datetime.today().strftime('%Y-%m-%d %H:%M:%S')

                # Insert into the database line by line.  Append DB error if not caught by qc checks.
                for i in range(len(raw)):
                    c_date = datetime.strptime(raw[i][15], '%Y-%m-%d %H:%M:%S')
                    if c_date > l_date:
                        ins = dbo.query(SQLinsert, raw[i])
                        if ins != {}:
                            print('error with file %s on row %s, err=%s' % (file, i, ins[sorted(ins)[0]]))
                            err = [folder[0:-1], type[0:-1], file, insDate, i, ins[sorted(ins)[0]]]
                            dbErr = dbo.query(SQLerrLog, err)
                            table_row = delim.join([str(e) for e in raw[i]])
                            db_err += [[file, str(i + 2), ins[sorted(ins)[0]], table_row]]
                        else:
                            print('success with file %s on row %s' % (file, i))

                        s = '\n'.join([delim.join(row) for row in db_err])
                        with open(fpathErr, 'w') as f:
                            f.write(s)
                    else:
                        v_upd = raw[i][1:] + [int(raw[i][0])]
                        upd = dbo.query(SQLupdate, v_upd)
                        if upd != {}:
                            print('error with file %s on row %s, err=%s' % (file, i, upd[sorted(upd)[0]]))
                            err = [folder[0:-1], type[0:-1], file, insDate, i, upd[sorted(upd)[0]]]
                            dbErr = dbo.query(SQLerrLog, err)
                            table_row = delim.join([str(e) for e in raw[i]])
                            db_err += [[file, str(i + 2), upd[sorted(upd)[0]], table_row]]
                        else:
                            print('success with file %s on row %s' % (file, i))

                        s = '\n'.join([delim.join(row) for row in db_err])
                        with open(fpathErr, 'w') as f:
                            f.write(s)
        else:
            print('File Error - Not uploaded')
            s = '\n'.join([delim.join([str(e) for e in row]) for row in db_err])
            with open(fpathErr, 'w') as f:
                f.write(s)
except FileNotFoundError as e:
    print(e)
