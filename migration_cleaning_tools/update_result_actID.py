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

# Import stations from awqX
sql_select = "SELECT * FROM resultschem where ActivityIdentifier like '%17751-%';"

with msc.MYSQL('localhost', 'awqx', 3306, config_uid, config_pw) as dbo:
    sel = dbo.query(sql_select)

act_id = []
for i in range(len(sel)):
    act_id += [str(sel[i]['ActivityIdentifier'])]

for i in range(len(act_id)):
    sql_update = "UPDATE awqx.resultschem SET ActivityIdentifier = " \
                 "replace(ActivityIdentifier, '-O-', '-QCFB-'), " \
                 "lastUpdateDate = now(), lastUpdateUser = 'BeckerM' " \
                 "where ActivityIdentifier = " + "'" +act_id[i] + "'"
    with msc.MYSQL('localhost', 'awqx', 3306, config_uid, config_pw) as dbo:
        upd = dbo.query(sql_update)