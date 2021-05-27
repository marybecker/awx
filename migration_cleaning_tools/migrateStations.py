from awqx_app import mysql_connector as msc
import xlrd
from datetime import datetime
import os

# read in config file
cf_dir = 'C:/Users/deepuser/Documents/cnf/user.cnf.txt'
with open(cf_dir, 'r') as f:
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


# function to update values in a list from a lu table for db insert.
# data == list, lu == lu dict, n = list value position
def update_values(data, lu, n):
    for i in range(len(data)):
        l1 = lu.get(data[i][n])
        if l1 is not None:
            data[i][n] = l1
        else:
            data[i][n] = 'Unknown'

# insert data from excel into table one line at a time.  generate an error rpt
ftp = 'C:/Users/deepuser/Documents/testFTP/BeckerM/'
folder = 'Migration/'
type = 'Stations/'
delim = '\t'
fdir = os.listdir(ftp + folder + type)

c_file = 'C:/Users/deepuser/Documents/testFTP/BeckerM/Migration/updateCreateUser.csv'
with open(c_file, 'r') as f:
    s = f.read()
    f.close()
c_lu = [line.rsplit(',') for line in s.rsplit('\n')]  # chop up the text by the newline='\n and the delim
c_lu = dict(c_lu[1:72])

SQLinsert = 'INSERT INTO awqx.stations VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?);'
SQLerrLog = 'INSERT INTO awqx.errlog VALUES (?,?,?,?,?,?,?);'

print('found %s files to process: %s' % (len(fdir), fdir))

try:
    for file in fdir:
        db_err = []
        print('processing file=%s' % file)
        uploadDate = datetime.today().strftime('%m%d%Y_%H%M%S_')
        fpathIn = ftp + folder + type + file
        fpathErr = ftp + 'ErrRpts/' + file + 'QcRpt.txt'
        fpathOut = ftp + 'UploadedRpts/' + uploadDate + file
        raw = readXlsx(fpathIn, db_err)
        os.rename(fpathIn, fpathOut)

        if raw is not None:
            with msc.MYSQL('localhost', 'awqx', 3306, config_uid, config_pw) as dbo:
                insDate = datetime.today().strftime('%Y-%m-%d %H:%M:%S')

                # Insert into the database line by line.  Append DB error if not caught by qc checks.
                for i in range(len(raw)):
                    update_values(raw, c_lu, 16) # update create user name
                    update_values(raw, c_lu, 18) # update last update user name
                    ins = dbo.query(SQLinsert, raw[i])
                    if ins != {}:
                        print('error with file %s on row %s, err=%s' % (file, i, ins[sorted(ins)[0]]))
                        err = [folder[0:-1], type[0:-1], file, insDate, i, ins[sorted(ins)[0]], 'BeckerM']
                        dbErr = dbo.query(SQLerrLog, err)
                        table_row = delim.join([str(e) for e in raw[i]])
                        db_err += [[file, str(i + 2), ins[sorted(ins)[0]], table_row]]
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
