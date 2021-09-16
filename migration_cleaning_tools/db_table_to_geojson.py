from awqx_app import mysql_connector as msc
import json
from datetime import datetime

cf_dir = 'C:/Users/deepuser/Documents/cnf/user.cnf.txt'
db_scm = 'awqx'

with open(cf_dir, 'r') as f:
    s = f.read()
    f.close()
config = [line.rsplit(',') for line in s.rsplit('\n')]  # chop up the text by the newline='\n and the delim
config_uid = config[0][1]
config_pw = config[1][1]

SQL_select = 'SELECT * FROM awqx.stations;'

with msc.MYSQL('localhost', db_scm, 3306, config_uid, config_pw) as dbo:
    res = dbo.query(SQL_select)

features = []
for i in range(len(res)):
    point = {
      "type": "Feature",
        "properties": {
            "staseq": res[i]['staSeq'],
            "name": res[i]['locationName'],
            "descrip":res[i]['locationDescription'],
            "type":res[i]['locationType'],
            "siteID": str(res[i]['staSeq'])+'-'+res[i]['locationName'],
            "munName":res[i]['munName'],
            "subBasin":res[i]['subBasin'],
            "createDate":res[i]['createDate'].strftime('%Y_%m_%d')
        },
        "geometry": {
            "type": "Point",
            "coordinates": [float(res[i]['xlong']),float(res[i]['ylat'])]
        }
    }

    features += [point]


f_out = 'C:/inetpub/wwwroot/stations.json'
f_out = 'C:/Users/deepuser/Documents/Projects/wqDB_docs/testing_data/stations.json'

with open(f_out, 'w',encoding="utf-8") as f:
    json.dump(features,f)