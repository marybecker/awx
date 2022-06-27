import glob
import mysql_connector as msc
import pandas as pd
from datetime import datetime
import os
import argparse

des = """
------------------------------------------------------------------------------------------
Get Activities and Results From Ambient Water Monitoring Data Exchange water quality database (awqX) 
Mary Becker - Last Updated 2021-12-01
------------------------------------------------------------------------------------------
Get Activities and Results from the DB """

parser = argparse.ArgumentParser(description=des.lstrip(" "), formatter_class=argparse.RawTextHelpFormatter)
parser.add_argument('-i', '--in_dir', type=str, help='input directory of ftp\t[None]')
parser.add_argument('-c', '--cf_dir', type=str, help='input directory of config file')
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


# function to read in xlsx file
def readXlsx(file, errFile):
    if file.endswith(".xlsx"):
        try:
            raw_df = pd.read_excel(file, sheet_name=0, header=None, keep_default_na=False, engine="openpyxl",
                                   usecols="A:E", nrows=2)
            raw = raw_df.values.tolist()
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

# insert data from excel into list.  generate an error rpt
ftp = in_dir
fdir = glob.glob(ftp + '**/' + '*get_activities_results*.xlsx')
header_list = ['Schema', 'Request', 'StartDate', 'EndDate', 'Project']

print('found %s files to process: %s' % (len(fdir), fdir))

try:
    for file in fdir:
        db_err = []
        print('processing file=%s' % file)
        request_date = datetime.today().strftime('%m%d%Y_%H%M%S_')
        fpath_base = file.rsplit('\\', 1)[0]
        fpath_in = file
        fpath_err = fpath_base + '\\ErrRpts\\' + request_date + file.rsplit('\\')[-1] + 'Err.txt'
        fpath_out = fpath_base + '\\ReceivedRequest\\' + request_date + file.rsplit('\\')[-1]
        fpath_result = fpath_base + '\\Results\\' + request_date
        delim = '\t'
        raw = readXlsx(fpath_in, db_err)
        header = raw[0]  # could use to check header names in the excel file
        raw = raw[1:]
        os.rename(fpath_in, fpath_out)

        if raw is not None and header == header_list:
            for i in range(len(raw)):
                try:
                    db_scm = raw[i][0]
                    request = raw[i][1]
                    s_date = raw[i][2]
                    e_date = raw[i][3]
                    prj = raw[i][4]
                    with msc.MYSQL('localhost', db_scm, 3306, config_uid, config_pw) as dbo:
                        sql_select = 'SELECT * FROM ' + db_scm +'.'+ request + \
                                     ' WHERE ActivityStartDate > "' + s_date + \
                                     '" AND ActivityStartDate < "' + e_date + \
                                     '" AND ProjectIdentifier = "' + prj + '";'
                        sel = dbo.query(sql_select)
                        sel_df = pd.DataFrame(sel)
                        file_out = fpath_result + \
                                   request + '_' + \
                                   s_date.replace('-','') + '_' + \
                                   e_date.replace('-','') + '_' + \
                                   prj + '.xlsx'
                        sel_df.to_excel(file_out)
                except ValueError:
                    print('issue with data selection')
                    db_err += [['Issue with input.  Make sure all fields are filled out and are strings.']]
                    s = '\n'.join([delim.join([str(e) for e in row]) for row in db_err])
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


