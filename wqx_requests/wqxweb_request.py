# python 3 target only
import requests
import datetime
import hmac
import base64
import json
import csv


def binary_reader(path):
    s = b''
    with open(path, 'rb') as f: s = f.read()
    return bytearray(s)


# input wqx info and uri of data, returns a list of dict results
def wqx_get_json(user_id, user_key, uri):
    file = []
    requesttype = 'GET'
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
    r = requests.get(uri, headers=headers)
    try:
        file = r.json()  # returns a list of dicts
    except Exception as E:
        print(E)
        pass
    return file


def wqx_post_txt(user_id, user_key, uri, data):
    requesttype = 'POST'
    contenttype = 'text/plain'
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
    r = requests.post(uri, data=data, headers=headers)


def wqx_startimport(user_id, user_key, uri, fileID):
    file = []
    requesttype = 'GET'
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
    r = requests.get(uri, headers=headers)

#read in config file - Variables used for all WQX Web requests
cdir = ''
with open(cf_dir, 'r') as f:
    s = f.read()
    f.close()
config = [line.rsplit(',') for line in s.rsplit('\n')]  # chop up the text by the newline='\n and the delim
user_id = config[0][1]
user_key = config[1][1]

# uri = 'https://cdx.epa.gov/WQXWeb/api/Upload/Projects.csv' #uri for post request to upload file type to the server
# uri = 'https://cdx.epa.gov/WQXWeb/api/MonitoringLocations?OrganizationIdentifiersCsv=CT_DEP01_WQX'
uri = 'https://cdx.epa.gov/WQXWeb/api/StartImport?importConfigurationId=6840&fileId=2917cf1d-8da8-4266-86c3-0fbeaef51c29&fileType=CSV&newOrExistingData=1&uponCompletion=0&uponCompletionCondition=0&worksheetsToImport=1&ignoreFirstRowOfFile=true'
datafile = '/home/mkozlak/Documents/Projects/2019/wqx/Project_Upload_092519.csv'
data = binary_reader(datafile)
fileID = '2917cf1d-8da8-4266-86c3-0fbeaef51c29'

###### GET Request to get data or info from WQX Web #####
#####################################################
print('============Python 3.6============')
requesttype = 'GET'  # use 'POST' if submitting data
timestamp = datetime.datetime.utcnow()
# to force to be the same as C# .NET 4.7
timestamp_mdy = timestamp.strftime("%m/%d/%Y").lstrip("0").replace(" 0", " ")
timestamp_hms = timestamp.strftime("%I:%M:%S %p")
timestamp = timestamp_mdy + " " + timestamp_hms
str_key = user_key  # add secret key created on WQX
print('::::::KEY::::::\n' + str_key)
private_key = bytearray(base64.b64decode(str_key))  # assume base64 str
# uri = 'https://cdx.epa.gov/WQXWeb/api/GetStatus?datasetId=62748' #Check on dataset example
uri = 'https://cdx.epa.gov/WQXWeb/api/MonitoringLocations?OrganizationIdentifiersCsv=CT_DEP01_WQX'
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

r = requests.get(uri, headers=headers)

file = r.json()
# file = json.loads(file)
