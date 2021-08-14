from awqx_app import mysql_connector as msc

# TOOL to assist creating javascript for web services

#read in config file
cdir = 'C:/Users/deepuser/Documents/cnf/user.cnf.txt'
with open(cdir, 'r') as f:
    s = f.read()
    f.close()
config = [line.rsplit(',') for line in s.rsplit('\n')]  # chop up the text by the newline='\n and the delim
config_uid = config[0][1]
config_pw = config[1][1]

sql_table = 'desc awqx.activitybio;'

with msc.MYSQL('localhost', 'awqx', 3306, 'pyuser', 'test') as dbo:
    t = dbo.query(sql_table)

fields = []

for i in range(len(t)):
    fields += [[t[i]['Field'],t[i]['Type'][0:7]]]

# create json
field_str = ''
for i in range(len(fields)):
    if fields[i][1] == 'date' or fields[i][1] == 'datetim':
        field_str = field_str + 'response[i].' + fields[i][0] + '.toISOString().substring(0,10)' + ','
    else:
        field_str = field_str + 'response[i].' + fields[i][0] + '.toString()' + ','

# create header line
s = ''
for i in range(len(fields)):
    s = s + '"' + fields[i][0] + '"' + '+ delim +'

# each row of data to string
r = ''
for i in range(len(fields)):
    r = r + 'var ' + fields[i][0] + '= features[i][' + str(i) + '].toString()'

# add data to s
d = 's +='
for i in range(len(fields)):
    d = d + fields[i][0] + '+ delim +'




