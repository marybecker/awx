import glob
import mysql_connector as msc
import xlrd
from datetime import datetime
import pytz
import os
import argparse

des = """
------------------------------------------------------------------------------------------
Import Field Meter Data into Ambient Water Data Exchange (awX) water quality database  
Mary Becker - Last Updated 2021-05-04
------------------------------------------------------------------------------------------
Given input directory of excel template spreadsheets with new station information,
automatically checks for constraints with the database schema and produces an
error report for tuples that do not meet the constraints.  Tuples that do meet 
requirements are inserted into the Field Meter Results table """

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

# function to read in xlsx file as list
def readXlsx(file, errFile):
    if file.endswith(".xlsm") or file.endswith(".xlsx"):
        try:
            with xlrd.open_workbook(file) as f:
                sheet = f.sheet_by_index(0)  # could also use sheet_by_name("Sheet1")
                raw = [[sheet.cell_value(r, c) for c in range(sheet.ncols)[0:]] for r in range(sheet.nrows)[0:]]
                return raw
        except FileNotFoundError as e:
            print(e)
    else:
        errFile += [[file, 'Incorrect File Type']]


# function to reformat chemistry data from wide to long format
# data = list of data rows, data_header = list of headers from data, param_list = list of parameters from DB
# col_n = number of data rows to repeat for chem params, g = empty list
def format_ysi_data(data, data_header, param_list, col_n, g):
    l_idx = {data_header[i]: i for i in range(len(data_header))}  # setup column names for convenience
    for n in range(len(data)):
        for i in data_header:
            if i in param_list:
                j = l_idx.get(i)
                param_value = data[n][j]
                loc_id = data[n][0:col_n]
                g += [loc_id + [param_value] + [i]]
    return g

# Get est/edt dates for a given year in Connecticut
def get_dst_change_points(y, zone='America/New_York'):
    tz = pytz.timezone(zone)
    trans = tz._utc_transition_times
    T = []
    for t in trans:
        if t.date().year == y:
            T += [t]
    return sorted(T)

# Return timezone.  Input should be something like this: is_in_dst(datetime(2020,12,10,0),T)
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
fdir = glob.glob(ftp+'**/'+folder+insert_type+'*FieldMeter*.xlsx')

headerList = ['staSeq', 'ProjectIdentifier', 'ActivityStartDate', 'ActivityTime', 'InstreamLocation',
              'SampleCollectionMethod', 'ActivityDepthMeasureValue', 'ActivityDepthMeasureUnitCode',
              'ActivityCommentText', 'ActContactLead', 'ActivityYlat', 'ActivityXlong']

SQLinsert = 'INSERT INTO ' + db_scm + '.resultsmeter (staSeq, ProjectIdentifier,  ' \
            'ActivityStartDate, ActivityTime, InstreamLocation, SampleCollectionMethodIdentifier,' \
            'ActivityDepthMeasureValue, ActivityDepthMeasureUnitCode, ActivityCommentText, ActContactLead, ' \
            'ActivityYlat, ActivityXlong, ResultMeasureValue, CharacteristicName, ' \
            'ResultMeasureUnitCode, ResultValueTypeName, ResultComment,  ' \
            'ActivityhorizCollectMethod, ActivityhorizRefDatum, ' \
            'ActivityTimeZoneCodetimezone,' \
            'ActivityIdentifier, ActivityTypeCode, ActivityMediaName,SampleCollectionEquipmentName,' \
            'ActivityConductingOrganizationText, createDate, createUser, lastUpdateDate, lastUpdateUser)' \
            'VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)'

SQLerrLog = 'INSERT INTO ' + db_scm + '.errlog VALUES (?,?,?,?,?,?,?);'

# Select lookup table parameters needed for YSI insert and format data for insert
SQL_select_lookup = 'SELECT * FROM ' + db_scm + '.parameter_lookup WHERE parameter_lookup.LaboratoryName = "YSI";'
with msc.MYSQL('localhost', db_scm, 3306, config_uid, config_pw) as dbo:
    p_lu = dbo.query(SQL_select_lookup)

p_name = [p_lu[i]['ProbeLabName'] for i in range(len(p_lu))]
p_name_idx = {p_name[i]: i for i in range(len(p_name))}

with msc.MYSQL('localhost', db_scm, 3306, config_uid, config_pw) as dbo:
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

        # format probe data for insert (wide to long)
        G = []
        ysi_data = format_ysi_data(raw, header, p_name, 13, G)
        raw = []
        for p in range(len(ysi_data)):
            k = p_name_idx[ysi_data[p][-1]]
            k_values = list(p_lu[k].values())[3:7]
            raw += [ysi_data[p][1:-1] + k_values]

        if raw is not None and header[1:13] == headerList:
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
                    # generate auto populated fields for YSI
                    if raw[i][10] is None and raw[i][11] is None:
                        actHorizCollectMethod = None
                        actHorizDatum = None
                    else:
                        actHorizCollectMethod = 'GPS-Unspecified'
                        actHorizDatum = 'WGS84'
                    try:
                        actID = str(str(int(raw[i][0])) + '-FM-' + str(raw[i][2]).replace('-', '')
                                    + '-' + str(raw[i][3]).replace(':', '') + '-' + 'METER-' +
                                    str(raw[i][6]) + raw[i][7])
                    except TypeError:
                        print('None value in activity string')
                    actType = 'Field Msr/Obs'
                    actMedia = 'Water'
                    actOrg = 'ctdeepWplrAbm'
                    # Error Handling for Incorrect Date Format
                    if type(raw[i][2]) == str:
                        try:
                            t = datetime.fromisoformat(str(raw[i][2]))
                            T = get_dst_change_points(int(t.strftime('%Y')))
                            timezone = is_in_dst(t, T)
                        except ValueError:
                            print('incorrect date format')
                    else:
                        print('incorrect date format')
                        msg = 'Check activity date format on row %s.  It needs to be in iso-format (e.g. 2021-08-30). ' \
                              'You may need to reformat as text. All rows below %s not inserted.' % (i+2,i+2)
                        db_err += [[msg]]
                        s = '\n'.join([delim.join(row) for row in db_err])
                        with open(fpath_err, 'w') as f:
                            f.write(s)
                        raise TypeError
                    equipment = 'Probe/Sensor'
                    user_name = fpath_base.rsplit('\\')[-1]
                    V_insert = raw[i] + [actHorizCollectMethod] + [actHorizDatum] + \
                               [timezone] + [actID] + [actType] + [actMedia] +  \
                               [equipment] + [actOrg] +[insDate] + [user_name] + [insDate] + \
                               [user_name]
                    ins = dbo.query(SQLinsert, V_insert)
                    if ins != {}:
                        print('error with file %s on row %s, err=%s' % (file, i, ins[sorted(ins)[0]]))
                        # SQL insert
                        err = [folder[0:-1], insert_type[0:-1], file, insDate, i, ins[sorted(ins)[0]], user_name]
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
            db_err += [['File Error - Not uploaded.  Check file type column ordering and column names']]
            s = '\n'.join([delim.join([str(e) for e in row]) for row in db_err])
            with open(fpath_err, 'w') as f:
                f.write(s)
except FileNotFoundError as e:
    print(e)





