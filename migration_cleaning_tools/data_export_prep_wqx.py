# Import modules
import pandas as pd
from datetime import datetime
from awqx_app import mysql_connector as msc

cf_dir = ''
db_scm = 'awqx'
t      = 'stations'

with open(cf_dir, 'r') as f:
    s = f.read()
    f.close()
config = [line.rsplit(',') for line in s.rsplit('\n')]  # chop up the text by the newline='\n and the delim
config_uid = config[0][1]
config_pw = config[1][1]

SQL_select = 'SELECT * FROM ' + db_scm + '.wqximp_' + t + ';'
SQL_lstupd = 'SELECT max(lastUpdateDate) FROM ' + db_scm + '.wqximp_' + t + ';'


with msc.MYSQL('localhost', db_scm, 3306, config_uid, config_pw) as dbo:
    data = dbo.query(SQL_select)
    lsdt = dbo.query(SQL_lstupd)

last_update = lsdt[0]['max(lastUpdateDate)'].strftime('%m%d%Y_%H%M%S')
uploadDate = datetime.today().strftime('%m%d%Y_%H%M%S_')

df = pd.DataFrame.from_dict(data)
df = df.drop(['lastUpdateDate'],axis=1)

f_path = 'wqx_imports/'+ t + '_' + uploadDate + 'lup_' + last_update + '.csv'
df.to_csv(f_path, index = False)