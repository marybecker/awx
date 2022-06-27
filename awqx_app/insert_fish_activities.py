import glob
# from awqx_app import mysql_connector as msc
import mysql_connector as msc
import pandas as pd
# import xlrd
from datetime import datetime
import pytz
import os
import argparse

des = """
------------------------------------------------------------------------------------------
Import Fish Activities into Ambient Water Monitoring Data Exchange (wmdX) water quality database  
Mary Becker - Last Updated 2021-11-29
------------------------------------------------------------------------------------------
Given input directory of excel template spreadsheets with new station information,
automatically checks for constraints with the database schema and produces an
error report for tuples that do not meet the constraints.  Tuples that do meet 
requirements are inserted into the Chem Activities table """

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
#                 raw = [[sheet.cell_value(r, c) for c in range(sheet.ncols)[0:27]] for r in range(sheet.nrows)[0:]]
#                 return raw
#         except FileNotFoundError as e:
#             print(e)
#     else:
#         errFile += [[file, 'Incorrect File Type']]

def readXlsx(file, errFile):
    if file.endswith(".xlsm") or file.endswith(".xlsx"):
        try:
            raw_df = pd.read_excel(file, sheet_name=0, header=None, keep_default_na=False, engine="openpyxl",
                                   usecols = "A:AD")
            raw = raw_df.values.tolist()
            return raw
        except FileNotFoundError as e:
            print(e)
    else:
        errFile += [[file, 'Incorrect File Type']]


def getActType(ActType):
    if ActType == 'Sample-Routine':
        return 'SR'
    if ActType == 'Field Msr/Obs':
        return 'FM'
    if ActType == 'Quality Control Sample-Field Blank':
        return 'QCFB'
    if ActType == 'Quality Control Sample-Field Replicate':
        return 'QCFR'
    else:
        return 'O'


def get_dst_change_points(y, zone='America/New_York'):
    tz = pytz.timezone(zone)
    trans = tz._utc_transition_times
    T = []
    for t in trans:
        if t.date().year == y:
            T += [t]
    return sorted(T)


# Input should be something like this: is_in_dst(datetime(2020,12,10,0),T)
def is_in_dst(t, T):
    if t >= T[0] and t <= T[1]:
        return 'EDT'
    else:
        return 'EST'


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
insert_type = 'Activities/'
fdir = glob.glob(ftp + '**/' + folder + insert_type + '*FishActivities*.xlsx')

header_list = ['LabAccession','ProjectIdentifier', 'staSeq', 'ActivityTypeCode', 'ActivityStartDate', 'ActivityTime',
              'SampleCollectionMethodIdentifier', 'SampleCollectionEquipmentName',
              'SampleCollectionEquipmentCommentText', 'ActivityConductingOrganizationText', 'ActivityCommentText',
              'ActContactLead', 'ActFieldCrew', 'CollectionDurationMeasureValue', 'CollectionDurationMeasureUnitCode',
              'ReachLengthMeasureValue', 'ReachLengthMeasureUnitCode', 'ReachWidthMeasureValue',
              'ReachWidthMeasureUnitCode', 'PassCount', 'Pass', 'ZoneCount', 'Zone', 'Amps', 'Pulses',
              'CollEffEst', 'TotalEnergizedMeasure', 'TotalEnergizedMeasureUnit', 'Volts', 'DutyCycle']

SQL_insert = 'INSERT INTO ' + db_scm + '.activitybio ' \
                                  '(LabAccession, ProjectIdentifier, staSeq, ActivityTypeCode, ActivityStartDate, ActivityTime, ' \
                                  'SampleCollectionMethodIdentifier, SampleCollectionEquipmentName, SampleCollectionEquipmentCommentText, ' \
                                  'ActivityConductingOrganizationText, ActivityCommentText, ActContactLead, ActFieldCrew, ' \
                                  'CollectionDurationMeasureValue, CollectionDurationMeasureUnitCode, ReachLengthMeasureValue, ' \
                                  'ReachLengthMeasureUnitCode, ReachWidthMeasureValue, ReachWidthMeasureUnitCode, ' \
                                  'PassCount, Pass, ZoneCount, Zone, Amps, Pulses, ' \
                                  'CollectionEfficiencyEst, TotalEnergizedMeasure, TotalEnergizedMeasureUnit, Volts, DutyCycle,' \
                                  'ActivityIdentifier, ActivityMediaName, ActivityTimeZoneCodetimezone, AssemblageSampledName, ' \
                                  'createDate, createUser, lastUpdateDate, lastUpdateUser) ' \
                                  'VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?);'
SQL_errLog = 'INSERT INTO ' + db_scm + '.errlog VALUES (?,?,?,?,?,?,?);'

print('found %s files to process: %s' % (len(fdir), fdir))

try:
    for file in fdir:
        db_err = []
        print('processing file=%s' % file)
        uploadDate = datetime.today().strftime('%m%d%Y_%H%M%S_')
        fpath_base = file.rsplit('\\', 3)[0]
        fpath_in = file
        fpath_err = fpath_base + '\\ErrRpts\\' + uploadDate + file.rsplit('\\')[-1] + 'QcRpt.txt'
        fpath_out = fpath_base + '\\UploadedRpts\\' + uploadDate + file.rsplit('\\')[-1]
        delim = '\t'
        raw = readXlsx(fpath_in, db_err)
        header = raw[0]  # could use to check header names in the excel file
        raw = raw[1:]
        os.rename(fpath_in, fpath_out)

        if raw is not None and header == header_list:
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
                    # generate auto populated fields for fish
                    # Error Handling for Incorrect Date Format
                    if type(raw[i][4]) == str:
                        try:
                            t = datetime.fromisoformat(str(raw[i][4]))
                            T = get_dst_change_points(int(t.strftime('%Y')))
                            timezone = is_in_dst(t, T)
                        except ValueError:
                            print('incorrect date format')
                    else:
                        print('incorrect date format')
                        msg = 'Check activity date format on row %s.  It needs to be a string in iso-format (e.g. 2021-08-30). ' \
                              'You may need to reformat as text. All rows below %s not inserted.' % (i+2,i+2)
                        db_err += [[msg]]
                        s = '\n'.join([delim.join(row) for row in db_err])
                        with open(fpath_err, 'w') as f:
                            f.write(s)
                        raise TypeError
                    if type(raw[i][5]) != str:
                        print('incorrect time format')
                        msg = 'Check activity time format on row %s.  It needs to be a string in iso-format (e.g. 12:00:00). ' \
                              'You may need to reformat as text. All rows below %s not inserted.' % (i+2,i+2)
                        db_err += [[msg]]
                        s = '\n'.join([delim.join(row) for row in db_err])
                        with open(fpath_err, 'w') as f:
                            f.write(s)

                    # actID is sid-actType-date-time-prj-pass-zone
                    actID = str(str(int(raw[i][2])) + '-' + (getActType(raw[i][3])) + '-' + raw[i][4].replace('-', '')
                                + '-' + raw[i][5].replace(':', '') + '-' + raw[i][1] + '-' +
                                'P' + str(raw[i][20]) + 'Z' + str(raw[i][22]))
                    actMedia = 'Biological'
                    assemblage = 'Fish/Nekton'
                    user_name = fpath_base.rsplit('\\')[-1]
                    V_insert = raw[i][0:30] + [actID] + [actMedia] + [timezone] + [assemblage] + \
                               [insDate] + [user_name] + [insDate] + [user_name]
                    ins = dbo.query(SQL_insert, V_insert)
                    if ins != {}:
                        print('error with file %s on row %s, err=%s' % (file, i, ins[sorted(ins)[0]]))
                        # SQL insert
                        err = [folder[0:-1], insert_type[0:-1], file, insDate, i, ins[sorted(ins)[0]], user_name]
                        dbErr = dbo.query(SQL_errLog, err)
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
            db_err += [['File Error - Not uploaded.  Check file type column ordering and column names']]
            s = '\n'.join([delim.join([str(e) for e in row]) for row in db_err])
            with open(fpath_err, 'w') as f:
                f.write(s)
except FileNotFoundError as e:
    print(e)


