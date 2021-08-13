from awqx_app import mysql_connector as msc
import xlrd

#read in config file
cdir = ''
with open(cf_dir, 'r') as f:
    s = f.read()
    f.close()
config = [line.rsplit(',') for line in s.rsplit('\n')]  # chop up the text by the newline='\n and the delim
config_uid = config[0][1]
config_pw = config[1][1]

file = 'C:/Users/deepuser/Documents/Projects/wqDB_docs/testing_data/CombinedData_CESE_2020.xlsx'
with xlrd.open_workbook(file) as f:
    sheet = f.sheet_by_index(0)  # could also use sheet_by_name("Sheet1")
    raw = [[sheet.cell_value(r, c) for c in range(sheet.ncols)[0:]] for r in range(sheet.nrows)[0:]]

SQLselect = 'SELECT * FROM awqx.parameter_lookup;'

with msc.MYSQL('localhost', 'awqx', 3306, config_uid, config_pw) as dbo:
    sel = dbo.query(SQLselect)