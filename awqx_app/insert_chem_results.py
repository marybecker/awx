import glob
from awqx_app import mysql_connector as msc
import pandas as pd
# import xlrd
from datetime import datetime
import os
import argparse

des = """
------------------------------------------------------------------------------------------
Import Chem Results into Ambient Water Data Exchange (awx) water quality database  
Mary Becker - Last Updated 2021-07-28
------------------------------------------------------------------------------------------
Given input directory of spreadsheets with new lab results,
automatically checks for constraints with the database schema and produces an
error report for tuples that do not meet the constraints.  Tuples that meet 
requirements are inserted into the Chem Results table """

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
# def readXlsx(file, errFile):
#     if file.endswith(".xlsm") or file.endswith(".xlsx"):
#         try:
#             with xlrd.open_workbook(file) as f:
#                 sheet = f.sheet_by_index(0)  # could also use sheet_by_name("Sheet1")
#                 raw = [[sheet.cell_value(r, c) for c in range(sheet.ncols)[0:17]] for r in range(sheet.nrows)[0:]]
#                 return raw
#         except FileNotFoundError as e:
#             print(e)
#     else:
#         errFile += [[file, 'Incorrect File Type']]

def readXlsx(file, errFile):
    if file.endswith(".xlsm") or file.endswith(".xlsx"):
        try:
            raw_df = pd.read_excel(file, sheet_name=0, header=None, keep_default_na=False)
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

# insert data from excel into table one line at a time.  generate an error rpt
ftp = in_dir
folder = 'Upload/'
insert_type = 'Results/'
fdir = glob.glob(ftp+'**/'+folder+insert_type+'*ChemResults*.xlsx')

headerList = ['ActivityIdentifier',	'lab_accession', 'characteristic_name',	'value', 'UOM', 'resultvaluetype',
              'analysis_start_date', 'Rslt_status', 'comment', 'methodSpeciationName', 'result_detection_condition',
              'sample_fraction', 'method_number', 'method_context', 'DetectionQuantitationTypeName',
              'MDL', 'DetectionQuantitationTypeNameUOM']
SQLinsert = 'INSERT INTO ' + db_scm + '.resultschem (`ActivityIdentifier`,`LabAccession`,`CharacteristicName`,' \
            '`ResultMeasureValue`,`ResultMeasureUnitCode`,`ResultValueTypeName`,`AnalysisStartDate`,' \
            '`ResultStatusIdentifier`,`ResultComment`,`MethodSpeciationName`,`ResultDetectionConditionText`,' \
            '`ResultSampleFractionText`,`ResultAnalyticalMethodIdentifier`,' '`ResultAnalyticalMethodContext`,' \
            '`DetectionQuantitationTypeName`,`DetectionQuantitationLimitMeasureValue`,' \
            '`DetectionLimitMeasureUnitCode`,`createUser`,`createDate`,`lastUpdateUser`,`lastUpdateDate`) ' \
            'VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?);'

SQLerrLog = 'INSERT INTO ' + db_scm + '.errlog VALUES (?,?,?,?,?,?);'

print('found %s files to process: %s' % (len(fdir), fdir))


try:
    for file in fdir:
        db_err = []
        print('processing file=%s' % file)
        uploadDate = datetime.today().strftime('%m%d%Y_%H%M%S_')
        fpath_base = file.rsplit('\\', 3)[0]
        fpathIn = file
        fpathErr = fpath_base + '\\ErrRpts\\' + uploadDate + file.rsplit('\\')[-1] + 'QcRpt.txt'
        fpathOut = fpath_base + '\\UploadedRpts\\' + uploadDate + file.rsplit('\\')[-1]
        delim = '\t'
        raw = readXlsx(fpathIn, db_err)
        header = raw[0]  # could use to check header names in the excel file
        raw = raw[1:]
        os.rename(fpathIn, fpathOut)

        if raw is not None and header == headerList:
            with msc.MYSQL('localhost', db_scm, 3306, config_uid, config_pw) as dbo:
                insDate = datetime.today().strftime('%Y-%m-%d %H:%M:%S')

                # Insert into the database line by line.  Append DB error if not caught by qc checks.
                for i in range(len(raw)):
                    # Any blank values change to None type
                    for j in range(len(raw[i])):
                        if len(str(raw[i][j])) < 1:
                            raw[i][j] = None
                        else:
                            raw[i][j] = raw[i][j]
                    if raw[i][3] == None:
                        raw[i][4] = None
                    user_name = fpath_base.rsplit('\\')[-1]
                    V_insert = raw[i] + [user_name] + [insDate] + [user_name] + [insDate]
                    ins = dbo.query(SQLinsert, V_insert)
                    if ins != {}:
                        print('error with file %s on row %s, err=%s' % (file, i, ins[sorted(ins)[0]]))
                        err = [folder[0:-1], insert_type[0:-1], file, insDate, i, ins[sorted(ins)[0]]]
                        dbErr = dbo.query(SQLerrLog, err)
                        table_row = delim.join([str(e) for e in raw[i]])
                        db_err += [[file, str(i + 2), ins[sorted(ins)[0]], table_row]]
                    else:
                        print('success with file %s on row %s' % (file, i))

                if len(db_err) < 1:
                    s = 'All rows successfully inserted'
                else:
                    s = '\n'.join([delim.join(row) for row in db_err])
                with open(fpathErr, 'w') as f:
                    f.write(s)
        else:
            print('File Error - Not uploaded')
            db_err += [['File Error - Not uploaded.  Check file type column ordering and column names']]
            s = '\n'.join([delim.join([str(e) for e in row]) for row in db_err])
            with open(fpathErr, 'w') as f:
                f.write(s)
except FileNotFoundError as e:
    print(e)
