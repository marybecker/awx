import requests
import zipfile
import io
from datetime import datetime
import unicodedata
from awqx_app import mysql_connector as msc

domain = ['FrequencyClassDescriptor']
f_type = '_CSV.zip'
uri = ('https://cdx.epa.gov/wqx/download/DomainValues/' + domain[0] + f_type)
r = requests.get(uri)
bytes = r.content

delim = '\t'  # set you delimiter => CSV=','
z = zipfile.ZipFile(io.BytesIO(bytes))  # setup an in memory zip decompressor
# z      = zipfile.ZipFile('C:/Users/deepuser/Desktop/Taxon_CSV.zip') # use if having request issues above
s = z.read(z.infolist()[0]).decode()  # read and decode the decompressed bytestring
raw = [line.rsplit(delim) for line in s.rsplit('\n')]  # chop up the text by the newline='\n and the delim
header = [name.replace(' ', '_').lower() for name in raw[0]]  # format the column names the way you want
pos = {header[i]: i for i in range(len(header))}  # setup column names for convience
data = raw[1:]  # slice off the data for access


# Write out csv
def write_delim(list_name, out_loc, delim):
    s = '\n'.join([delim.join([str(e) for e in row]) for row in list_name])
    with open(out_loc, 'w') as f:
        f.write(s)

def format_date(d,l_len, name_p, date_p):
    for i in range(len(d)):
        if len(d[i]) == l_len:
            d[i][name_p] = d[i][name_p].replace('","', '')
            d[i][name_p] = d[i][name_p].replace(',"', '')
            date_str = d[i][date_p]
            date_strp = datetime.strptime(date_str, '%m/%d/%Y %I:%M:%S %p')
            d[i][date_p] = date_strp.strftime('%Y-%m-%d %H:%M:%S')
            d[i] += [datetime.today().strftime('%Y-%m-%d %H:%M:%S')]

# zf = zipfile.ZipFile(r.text)
#
#
# tree = ET.parse('/home/mkozlak/Downloads/Organization.xml')
# root = tree.getroot()
# xmldict =


# Manipulate and Cleanup Domain Data - Tab and Comma Delimited
d_update = []

for i in range(len(data)):
    u = []
    for j in range(len(data[i])):
        if len(data[i][j]) > 0 and data[i][j][-1] == ',':
            u += [data[i][j][:-1]]
            # u += [unicodedata.normalize("NFKD",data[i][j][:-1])]
        else:
            u += [data[i][j]]
    d_update += [u]

format_date(d_update,6,3,5)

# Append header
for i in range(len(header)-1):
    header[i] = header[i][:-1] #remove comma from header

d_header = header + ['lastUpdateDate']
d = [d_header] + d_update

#######FOR TAXON DATA ONLY ####################################
d_update = []

for i in range(len(data)):
    u = []
    for j in range(len(data[i])):
        if len(data[i][j]) > 0 and data[i][j][-1] == ',':
            u += [data[i][j][:-1]]
            # u += [unicodedata.normalize("NFKD",data[i][j][:-1])]
        else:
            u += [data[i][j]]
    d_update += [u]

# Take first five columns of data needed for DB.  Charmap issues with remaining columns
d = []
for i in range(len(d_update)):
    d += [d_update[i][0:5]]

# More cleaning & Update date format and add last date updated
for i in range(len(d)):
    if len(d[i]) == 5:
        d[i][1] = d[i][1].replace(',"', '')
        date_str = d[i][4]
        date_p = datetime.strptime(date_str, '%m/%d/%Y %I:%M:%S %p')
        d[i][4] = date_p.strftime('%Y-%m-%d %H:%M:%S')
        d[i] += [datetime.today().strftime('%Y-%m-%d %H:%M:%S')]

# Append header
for i in range(0, 9):
    header[i] = header[i][:-1]

d_header = header[0:5] + ['lastUpdateDate']
d = [d_header] + d

# f_name = 'C:/Users/deepuser/Documents/Projects/wqDB_docs/domainTables/Taxon.csv'
#
# write_delim(d,f_name,',')

# # example of data with char issues
# raw[1344]
# data[3257]
#
# # example of using reg ex to replace extra characters
# s = 'grabageA × garbageB'
# t = 'Alvania\xa0harpa'
# r = re.sub(r'[^\x00-\x7f]',' ',t)
# s==r
#
##Identifies any taxon 'name' values with extra characters
# char_issues = []
# for i in range(len(d)):
#     if len(d[i]) == 6 and '\xa0' in d[i][2]:
#         char_issues += [d[i]]
#
# dup_issues = []
# for i in range(len(d)):
#     if len(d[i]) == 6 and 'Oxyurostylis' in d[i][2]:
#         dup_issues += [d[i]]
#
# write_delim(char_issues,'C:/Users/deepuser/Desktop/WQX_Domain_Taxon_CharIssues.csv',',')
##########INSERT INTO DATABASE#######################################################
cf_dir = ''
# get data from config file
with open(cf_dir, 'r') as f:
    s = f.read()
    f.close()
config = [line.rsplit(',') for line in s.rsplit('\n')]  # chop up the text by the newline='\n and the delim
config_uid = config[0][1]
config_pw = config[1][1]

# insert data from excel into table one line at a time.  generate an error rpt
ftp = 'C:/Users/deepuser/Documents/testFTP/BeckerM'
folder = 'Upload/'
insert_type = 'Domain/'
db_scm = 'awqx'

# headerList = ['domain', 'unique_identifier', 'name', 'rank', 'last_change_date', 'lastUpdateDate']
# SQLinsert = 'INSERT INTO ' + db_scm + '.taxon (`domain`, `unique_identifier`, `name`, `rank`, ' \
#                                       '`last_change_date`, `lastUpdateDate`) ' \
#                                       'VALUES (?,?,?,?,?,?);'
# SQLerrLog = 'INSERT INTO ' + db_scm + '.errlog VALUES (?,?,?,?,?,?,?);'
# file_name = 'Taxon_Domain'

headerList = ['domain', 'unique_identifier', 'type','name', 'description', 'last_change_date', 'lastUpdateDate']
SQLinsert = 'INSERT INTO ' + db_scm + '.frequencyclassdescriptor (`domain`, `unique_identifier`,' \
                                      '`type`, `name`, `description`, `last_change_date`, `lastUpdateDate`) ' \
                                      'VALUES (?,?,?,?,?,?,?);'
SQLerrLog = 'INSERT INTO ' + db_scm + '.errlog VALUES (?,?,?,?,?,?,?);'
file_name = 'frequencyclassdescriptor'

db_err = []
uploadDate = datetime.today().strftime('%m%d%Y_%H%M%S_')
fpath_base = ftp
fpath_err = fpath_base + '\\ErrRpts\\' + uploadDate + file_name + 'QcRpt.txt'
delim = '\t'
raw = d
header = raw[0]  # use to check header names in the excel file
raw = raw[1:]

if raw is not None and header == headerList:
    with msc.MYSQL('localhost', db_scm, 3306, config_uid, config_pw) as dbo:
        insDate = datetime.today().strftime('%Y-%m-%d %H:%M:%S')
        user_name = 'BeckerM'

        # Insert into the database line by line.  Append DB error if not caught by qc checks.
        for i in range(len(raw)):
            V_insert = raw[i]
            ins = dbo.query(SQLinsert, V_insert)
            if ins != {}:
                print('error with file %s on row %s, err=%s' % (file_name, i, ins[sorted(ins)[0]]))
                err = [folder[0:-1], insert_type[0:-1], file_name, insDate, i, ins[sorted(ins)[0]], user_name]
                dbErr = dbo.query(SQLerrLog, err)
                table_row = delim.join([str(e) for e in raw[i]])
                db_err += [[file_name, str(i + 2), ins[sorted(ins)[0]], table_row]]
            else:
                print('success with file %s on row %s' % (file_name, i))

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


# FOR FUTURE INSERTS - GET TABLE FIELD NAMES TO CREATE SELECT OR INSERT QUERIES

sql_table = 'desc awqx.stations;'

with msc.MYSQL('localhost', 'awqx', 3306, config_uid, config_pw) as dbo:
    t = dbo.query(sql_table)

fields = []

for i in range(len(t)):
    fields += [t[i]['Field']]

sel_fields = ','.join(field for field in fields)

sql_select = 'SELECT ' + sel_fields + ' FROM awqx.stations';

with msc.MYSQL('localhost', 'awqx', 3306, config_uid, config_pw) as dbo:
    s = dbo.query(sql_select)

