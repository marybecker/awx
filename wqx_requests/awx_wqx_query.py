from awqx_app import mysql_connector as msc
import pandas as pd

#read in config file
cdir = ''
with open(cf_dir, 'r') as f:
    s = f.read()
    f.close()
config = [line.rsplit(',') for line in s.rsplit('\n')]  # chop up the text by the newline='\n and the delim
config_uid = config[0][1]
config_pw = config[1][1]

SQLselect = 'SELECT staSeq, locationName, ylat, xlong,sourceMapScale, horizCollectMethod,horizRefDatum,' \
            'locationType, stateCd FROM awqx.stations;'
with msc.MYSQL('localhost', 'test', 3306, config_uid, config_pw) as dbo:
    select = dbo.query(SQLselect)

upload_date = datetime.datetime.today().strftime('%Y%m%d_%H%M%S')
stations = pd.DataFrame.from_dict(select)
file_loc = 'wqx/data_upload/stations_' + upload_date + '.csv'
stations.to_csv(file_loc, index=False)