import requests
import datetime
import hmac
import base64

def binary_reader(path):
    s = b''
    with open(path, 'rb') as f: s = f.read()
    return bytearray(s)

# input wqx info and uri of data, returns a list of dict results
def wqx_request(requesttype, user_id, user_key, uri, data, routput):
    requesttype = requesttype
    contenttype = 'application/json'
    timestamp = datetime.datetime.utcnow()
    timestamp_mdy = timestamp.strftime("%m/%d/%Y").lstrip("0").replace(" 0", " ")
    timestamp_hms = timestamp.strftime("%I:%M:%S %p")
    timestamp = timestamp_mdy + " " + timestamp_hms
    private_key = bytearray(base64.b64decode(user_key))
    str_sig = user_id + timestamp + uri + requesttype
    signature = bytearray(str_sig, 'utf-8')
    encrypted = hmac.new(private_key, signature, digestmod='sha256').digest()
    encrypted = base64.b64encode(encrypted).decode()
    headers = {'X-UserID': user_id, 'X-Stamp': timestamp, 'X-Signature': encrypted, 'Content-Type': contenttype}
    print(headers)
    if requesttype == 'GET':
        r = requests.get(uri, headers=headers)
        print(r)
        try:
            routput += [r.json()]  # returns a list of dicts
        except Exception as E:
            print(E)
            pass
    if requesttype == 'POST':
        r = requests.post(uri, data=data, headers=headers)
        print(r)
        try:
            routput += [r.json()]  # returns a list of dicts
        except Exception as E:
            print(E)
            pass


#read in config file - Variables used for all WQX Web requests
cdir = ''
with open(cf_dir, 'r') as f:
    s = f.read()
    f.close()
config = [line.rsplit(',') for line in s.rsplit('\n')]  # chop up the text by the newline='\n and the delim
user_id = config[0][1]
user_key = config[1][1]

# Start file upload to web server #################################

uri = 'https://cdx.epa.gov/WQXWeb/api/Upload/Projects_TEST.csv'
datafile = 'wqx/data_upload/Projects_TEST.csv'
data = binary_reader(datafile)
fileID = []

wqx_request('POST', user_id, user_key, uri, data, fileID)

# Start Import to WQX Web  #########################################

base = 'https://cdx.epa.gov/WQXWeb/api/StartImport?' \
       'importConfigurationId='
config_id = '7108'
file_id = fileID[0]
end = 'fileType=CSV&' \
      'newOrExistingData=1&' \
      'uponCompletion=0&' \
      'uponCompletionCondition=0&' \
      'worksheetsToImport=1&' \
      'ignoreFirstRowOfFile=true'
import_uri = base + config_id + '&fileId=' + file_id + '&' + end
datasetID = []

wqx_request('GET', user_id, user_key, import_uri, None, datasetID)

# Get status of dataset  #########################################

status_uri = 'https://cdx.epa.gov/WQXWeb/api/GetStatus?datasetId=' + datasetID[0]
status = []

wqx_request('GET', user_id, user_key, status_uri, None, status)

uri = 'https://cdx.epa.gov/WQXWeb/api/Upload/CT_MonitoringLocation_Import_TEST.csv' #uri for post request to upload file type to the server
#uri = 'https://cdx.epa.gov/WQXWeb/api/CT_MonitoringLocation_Import_TEST?OrganizationIdentifiersCsv=WQXTEST'
#uri = 'https://cdx.epa.gov/WQXWeb/api/StartImport?importConfigurationId=6840&fileId=2917cf1d-8da8-4266-86c3-0fbeaef51c29&fileType=CSV&newOrExistingData=1&uponCompletion=0&uponCompletionCondition=0&worksheetsToImport=1&ignoreFirstRowOfFile=true'
datafile = 'wqx/data_upload/stations_20210120_131802.csv'
data = binary_reader(datafile)

wqx_get_json(user_id, user_key, uri)
#wqx_post_txt(user_id, user_key, uri, data)

###### GET Request to get data or info from WQX Web #####
#####################################################
print('============Python 3.6============')
requesttype = 'POST'  # use 'POST' if submitting data 'GET' to import data
timestamp = datetime.datetime.utcnow()
# to force to be the same as C# .NET 4.7
timestamp_mdy = timestamp.strftime("%m/%d/%Y").lstrip("0").replace(" 0", " ")
timestamp_hms = timestamp.strftime("%I:%M:%S %p")
timestamp = timestamp_mdy + " " + timestamp_hms
str_key = user_key  # add secret key created on WQX
print('::::::KEY::::::\n' + str_key)
private_key = bytearray(base64.b64decode(str_key))  # assume base64 str
# uri = 'https://cdx.epa.gov/WQXWeb/api/Upload/CT_MonitoringLocation_Import.csv'
# uri = 'https://cdx.epa.gov/WQXWeb/api/GetStatus?datasetId=62748' #Check on dataset example
uri = 'https://cdx.epa.gov/WQXWeb/api/Upload/CT_MonitoringLocation_Import_TEST?OrganizationIdentifiersCsv=WQXTEST'
str_sig = user_id + timestamp + uri + requesttype
print('::::::STR_SIG::::::\n' + str_sig)
signature = bytearray(str_sig, 'utf-8')
encrypted = hmac.new(private_key, signature, digestmod='sha256').digest()
print('::::::HMAC_SIG::::::\n' + base64.b64encode(encrypted).decode())
contenttype = 'application/json'  # use 'text/plain' if submitting excel or csv format

headers = {'X-UserID': user_id, 'X-Stamp': timestamp,
           'X-Signature': base64.b64encode(encrypted).decode(), 'Content-Type': contenttype}
h_print = ''
for h in headers: h_print += h + ': %s\n' % headers[h]
print('::::::HEADERS::::::\n%s' % h_print)

r = requests.get(uri, data=data, headers=headers)

file = r.json()
# file = json.loads(file)


