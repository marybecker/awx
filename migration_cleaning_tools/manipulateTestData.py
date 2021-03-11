# Import modules
import pandas as pd
from awqx_app import mysql_connector as msc

#read in config file
cdir = ''
with open(cf_dir, 'r') as f:
    s = f.read()
    f.close()
config = [line.rsplit(',') for line in s.rsplit('\n')]  # chop up the text by the newline='\n and the delim
config_uid = config[0][1]
config_pw = config[1][1]

#######CSV to List Import and Export####################################################
# Read in csv
with open('awqx_app/activitiesTestFile_121620.csv', 'r') as f:
    s = f.read()
    f.close()
raw = [line.rsplit(',') for line in s.rsplit('\n')]  # chop up the text by the newline='\n and the delim
header = [name.replace(' ', '_').lower() for name in raw[0]]  # format the column names the way you want
pos = {header[i]: i for i in range(len(header))}  # setup column names for convenience
data = raw[1:]  # slice off the data for access

# Get unique
stations = []
for i in range(len(data)):
    station_i = data[i][10]
    if station_i not in stations:
        stations.append(station_i)

activities = []

for i in range(len(data)):
    act = data[i]
    if act not in activities:
        activities.append(act)

lab_id = []
for i in range(len(activities)):
    lab_id.append(activities[i][0])

#Write out csv
def write_csv(list_name, out_loc):
    s = '\n'.join([','.join([str(e) for e in row])for row in list_name])
    with open('out_loc', 'w') as f:
        f.write(s)


#######Pandas Import and Export####################################################
# Import csv files as a pandas dataframe
stations = pd.read_csv('C:/Users/deepuser/Documents/Projects/Stations.csv')
activities = pd.read_csv('awqx_app/ActivityTestData.csv')

# Get unique list of stations from the activities test file
act_stations = activities['STA_SEQ'].unique()

# Subset the stations in the activities test file
stations_out = stations[stations['staSeq'].isin(act_stations)]

#Export stations to csv
stations_out.to_csv('awqx_app/StationsTestData.csv', index=False)


# Import lab data and append files together
lab_data1 = pd.read_excel('C:/Users/deepuser/Documents/Projects/ProgramDev/awx/awqx_app/testData/190213-245_DB.xlsx')
lab_data2 = pd.read_excel('C:/Users/deepuser/Documents/Projects/ProgramDev/awx/awqx_app/testData/190270-284_DB.xlsx')
lab_data = lab_data1.append(lab_data2)

# Select from the DB
SQLselect = 'SELECT activitychem.LabAccession, activitychem.ActivityIdentifier FROM awqx.activitychem'
with msc.MYSQL('localhost', 'awqx', 3306, config_uid, config_pw) as dbo:
    act = dbo.query(SQLselect)

# Convert dictionary to a pandas dataframe
act_df = pd.DataFrame.from_dict(act)

# Merge results with activities info
act_results = lab_data.merge(act_df, right_on='LabAccession', left_on='lab_accession')

#Add needed column to dataframe and then update values based on another column
act_results['resultvaluetype'] = 'Actual'
act_results['Rslt_status'] = 'Preliminary'
act_results['DetectionQuantitationTypeName'] = 'Method Detection Level'
act_results['DetectionQuantitationTypeNameUOM'] = act_results['UOM'] # Have Chris add this column
act_results.loc[act_results['method_number'] == 'Calculation' , 'resultvaluetype'] = 'Calculated'
act_results['methodSpeciationName'] = 'None'
act_results.loc[act_results['value'] =='ND', 'result_detection_condition'] = 'Not Detected'
act_results.loc[act_results['value'] =='ND', 'value'] = ''
act_results.loc[act_results['result_detection_condition'] == '<', 'result_detection_condition'] \
    = 'Present Below Quantification Limit'
act_results.loc[act_results['result_detection_condition'] == '>', 'result_detection_condition'] \
    = 'Present Above Quantification Limit'
act_results.loc[act_results['sample_fraction'].isnull(), 'sample_fraction'] = 'None'
act_results['analysis_start_date'].dt.strftime('%Y-%m-%d')
act_results.loc[act_results['method_context'] == 'EPA', 'method_context'] = 'USEPA'


# Subset results just to get one characteristic for testing
alk_results = act_results[act_results['characteristic_name'] == 'Alkalinity']

# Order results in order needed for upload
export_results = alk_results[['ActivityIdentifier','lab_accession','characteristic_name','value',
                              'UOM', 'resultvaluetype', 'analysis_start_date', 'Rslt_status', 'comment',
                              'methodSpeciationName','result_detection_condition', 'sample_fraction',
                              'method_number','method_context','DetectionQuantitationTypeName', 'MDL',
                              'DetectionQuantitationTypeNameUOM']]

export_results.to_excel('C:/Users/deepuser/Documents/Projects/ProgramDev/awx/awqx_app/testData/alk_test_results.xlsx'
                        , index=False)


##Stations Import
# Import csv files as a pandas dataframe
stations = pd.read_excel('awqx_app/testData/Stations_021021.xlsx')
users_crosswalk = pd.read_excel('awqx_app/testData/updateCreateUser.xlsx')
users_crosswalk = stations.merge(users_crosswalk,how='left')
users_crosswalk.to_excel('awqx_app/testData/usersCrosswalk.xlsx')

current_create_users = pd.DataFrame(stations['createUser'].unique())

current_create_users.to_excel('awqx_app/testData/createUsers.xlsx')
