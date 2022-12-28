import requests
import zipfile
import io
from datetime import datetime
from awqx_app import mysql_connector as msc

# Config
cf_dir = ''
# get data from config file
with open(cf_dir, 'r') as f:
    s = f.read()
    f.close()
config = [line.rsplit(',') for line in s.rsplit('\n')]  # chop up the text by the newline='\n and the delim
config_uid = config[0][1]
config_pw = config[1][1]

# Import stations data from the water quality portal
base   = 'https://www.waterqualitydata.us/data/Station/search?organization=CT_DEP01_WQX'
f_type = 'mimeType=csv'
z_type = 'zip=yes'
p_type = 'providers=STORET'
sep    = '&'

uri = sep.join([base,f_type,z_type,p_type])
r = requests.get(uri)
bytes = r.content

delim = ','  # set your delimiter => CSV=','
z = zipfile.ZipFile(io.BytesIO(bytes))  # setup an in memory zip decompressor
# z      = zipfile.ZipFile('C:/Users/deepuser/Desktop/Taxon_CSV.zip') # use if having request issues above
s = z.read(z.infolist()[0]).decode()  # read and decode the decompressed bytestring
raw = [line.rsplit(delim) for line in s.rsplit('\n')]  # chop up the text by the newline='\n and the delim
header = [name.replace(' ', '_').lower() for name in raw[0]]  # format the column names the way you want
pos = {header[i]: i for i in range(len(header))}  # setup column names for convience
data = raw[1:]  # slice off the data for access
data = data[47:6497] # slice off older LIS sites (still in as of 12/28/22)


# Import stations from awqX
sql_select = 'SELECT * FROM awqx.stations;'

with msc.MYSQL('localhost', 'awqx', 3306, config_uid, config_pw) as dbo:
    sel = dbo.query(sql_select)

# Check to see if there are any stations in WQX that are not in awX
s_awx = []
for i in range(len(sel)):
    s_awx += [str(sel[i]['staSeq'])]

s_wqx = []
for i in range(len(data)):
    s_wqx += [data[i][2].split('-')[-1]]

s_del = []
for i in range(len(s_wqx)):
    if s_wqx[i] not in s_awx:
         s_del += [s_wqx[i]]



