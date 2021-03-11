import requests
import zipfile
import io

domain = ['MonitoringLocationType']
uri = ('http://cdx.epa.gov/wqx/download/DomainValues/'+ domain[0] + '_CSV.zip')
r = requests.get(uri)
bytes = r.content

delim  = ','                                                 #set you delimiter => CSV=','
z      = zipfile.ZipFile(io.BytesIO(bytes))                  #setup an in memory zip decompressor
s      = z.read(z.infolist()[0]).decode()                    #read and decode the decompressed bytestring
raw    = [line.rsplit(delim) for line in s.rsplit('\n')]     #chop up the text by the newline='\n and the delim
header = [name.replace(' ','_').lower() for name in raw[0]]  #format the column names the way you want
pos    = {header[i]:i for i in range(len(header))}           #setup column names for convience
data   = raw[1:]                                             #slice off the data for access


# zf = zipfile.ZipFile(r.text)
#
#
# tree = ET.parse('/home/mkozlak/Downloads/Organization.xml')
# root = tree.getroot()
# xmldict =