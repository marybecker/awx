from awqx_app import mysql_connector as msc
import xlrd
from datetime import datetime

# read in config file
cdir = 'C:/Users/deepuser/Documents/cnf/user.cnf.txt'
with open(cdir, 'r') as f:
    s = f.read()
    f.close()
config = [line.rsplit(',') for line in s.rsplit('\n')]  # chop up the text by the newline='\n and the delim
config_uid = config[0][1]
config_pw = config[1][1]

# Function to return column from DB as list
def db_field(table, field):
    p_name = [table[i][field] for i in range(len(table))]
    return p_name

# Open file with CESE data
file = 'C:/Users/deepuser/Documents/Projects/wqDB_docs/testing_data/CombinedData_CESE_2020.xlsx'
with xlrd.open_workbook(file) as f:
    sheet = f.sheet_by_index(0)  # could also use sheet_by_name("Sheet1")
    raw = [[sheet.cell_value(r, c) for c in range(sheet.ncols)[0:]] for r in range(sheet.nrows)[0:]]
header = raw[0]
raw = raw[1:]

# Check for incorrect values and flag for review.  Update raw for insert.
review = []
ins_d = []
for i in range(len(raw)):
    if type(raw[i][2]) == str and raw[i][2] != 'ND':
        review += [raw[i]]
    elif raw[i][1] not in p_name:
        review += [raw[i]]
    else:
        ins_d += [raw[i]]

for i in range(len(ins_d)):
    # Update non-detects to WQX detection condition
    if ins_d[i][2] == 'ND':
        ins_d[i][2] = None
        ins_d[i][8] = 'Not Detected'
    # Add comment for values below PQL
    if type(ins_d[i][2]) == float and type(ins_d[i][9]) == float and type(ins_d[i][10]) == float:
        if ins_d[i][2] < ins_d[i][10] and ins_d[i][2] > ins_d[i][9]:
            ins_d[i][7] = ins_d[i][7] + 'Result value below PQL.'
    # Add WQX units for pH and Turbidity
    if ins_d[i][2] == 'pH':
        ins_d[i][4] = 'None'
    if ins_d[i][2] == 'Turbidity':
        ins_d[i][4] = 'NTU'
    # Update date from excel time to DB ISO-Format
    if len(str(ins_d[i][6])) != 0:
        ins_d[i][6] = xlrd.xldate.xldate_as_datetime(ins_d[i][6], 0).strftime('%Y-%m-%d')


# Get lookup table from awqx
SQL_select = 'SELECT * FROM awqx.parameter_lookup'
with msc.MYSQL('localhost', 'awqx', 3306, config_uid, config_pw) as dbo:
    sel = dbo.query(SQL_select)

p_name = db_field(sel, 'ProbeLabName')
p_name_idx = {p_name[i]: i for i in range(len(p_name))}

# Select lookup table parameters needed for CESE chem insert and format data for insert
j = 1
l = ins_d[j][1]
p = p_name_idx[l]
a = list(sel[p].values())[3:14]

xlrd.xldate.xldate_as_datetime(ins_d[j][6], 0).strftime('%Y-%m-%d %H:%M:%S')

