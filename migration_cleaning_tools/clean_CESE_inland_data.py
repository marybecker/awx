from awqx_app import mysql_connector as msc
# import xlrd #Support for xlsx was removed, explore openpyxl
import pandas as pd
from datetime import datetime


lab = 'CESE'

# read in config file
cdir = ''
with open(cdir, 'r') as f:
    s = f.read()
    f.close()
config = [line.rsplit(',') for line in s.rsplit('\n')]  # chop up the text by the newline='\n and the delim
config_uid = config[0][1]
config_pw = config[1][1]

# Function to return column from DB as list
def db_field(table, field):
    p_name = [table[i][field] for i in range(len(table))]
    return p_name

# Open file with CESE data
file = 'C:/Users/deepuser/Documents/Projects/wqDB_docs/testing_data/CombinedData_CESE_2020.xlsx'
# usecols = (0,2) to define the number of columns to read in
raw_df = pd.read_excel(file, sheet_name=0, header=None, keep_default_na=False)
raw = raw_df.values.tolist()
header = raw[0]
header_idx = {header[i]: i for i in range(len(header))}
raw = raw[1:]


# with xlrd.open_workbook(file) as f:
#     sheet = f.sheet_by_index(0)  # could also use sheet_by_name("Sheet1")
#     raw = [[sheet.cell_value(r, c) for c in range(sheet.ncols)[0:]] for r in range(sheet.nrows)[0:]]
# header = raw[0]
# header_idx = {header[i]: i for i in range(len(header))}
# raw = raw[1:]

# Get lookup table and activities id from activities from awqx
SQL_select = 'SELECT * FROM awqx.parameter_lookup WHERE LaboratoryName = "' + lab + '"'
SQLdesc = 'DESC awqx.resultschem;'
SQL_ActID = 'SELECT ActivityIdentifier, LabAccession FROM awqx.activitychem;'
with msc.MYSQL('localhost', 'awqx', 3306, config_uid, config_pw) as dbo:
    sel = dbo.query(SQL_select)
    desc = dbo.query(SQLdesc)
    actid = dbo.query(SQL_ActID)

p_name = db_field(sel, 'ProbeLabName')
p_name_idx = {p_name[i]: i for i in range(len(p_name))}
actid_l = db_field(actid, 'ActivityIdentifier')
labid_l = db_field(actid, 'LabAccession')

# actid_l = [actid[i]['ActivityIdentifier'] for i in range(len(actid))]
# labid_l = [actid[i]['LabAccession'] for i in range(len(actid))]
labid_l_idx = {labid_l[i]: i for i in range(len(labid_l))}

# Check for incorrect values and flag for review.  Update raw for insert.
review = []
ins_d = []
for i in range(len(raw)):
    if type(raw[i][2]) == str and raw[i][2] != 'ND':
        review += [raw[i]]
    elif raw[i][1] not in p_name:
        review += [raw[i]]
    else:
        ins_d += [raw[i]]

# Clean up data for specific chemical parameters
for i in range(len(ins_d)):
    # Update non-detects to WQX detection condition
    if ins_d[i][2] == 'ND':
        ins_d[i][2] = None
        ins_d[i][3] = None
        ins_d[i][8] = 'Not Detected'
    # Add comment for values below PQL
    if type(ins_d[i][2]) == float and type(ins_d[i][9]) == float and type(ins_d[i][10]) == float:
        if ins_d[i][2] < ins_d[i][10] and ins_d[i][2] > ins_d[i][9]:
            ins_d[i][7] = ins_d[i][7] + 'Result value below PQL.'
    # Add WQX units for pH and Turbidity
    if ins_d[i][1] == 'pH':
        ins_d[i][3] = 'None'
    if ins_d[i][1] == 'Turbidity':
        ins_d[i][3] = 'NTU'
    if 'Organic Nitrogen' in ins_d[i][1]:
        ins_d[i][3] = 'ppm'
    if 'Kjeldahl Nitrogen' in ins_d[i][1]:
        ins_d[i][3] = 'ppm'
    # Update date from excel time to DB ISO-Format
    if len(str(ins_d[i][6])) != 0:
        # ins_d[i][6] = xlrd.xldate.xldate_as_datetime(ins_d[i][6], 0).strftime('%Y-%m-%d')
        ins_d[i][6] = ins_d[i][6].strftime('%Y-%m-%d')


# Select lookup table parameters needed for CESE chem insert and format data for insert
results = []
m_results = []

for j in range(len(ins_d)):
    # j = 1000
    l = ins_d[j][1]
    p = p_name_idx[l]

    # Get fields in correct order from awqx lab parameter lookup table
    fields = ['CharacteristicName', 'ResultValueTypeName', 'MethodSpeciationName', 'SampleFractionName',
              'AnalyticalMethodID', 'AnalyticalMethodContextCode', 'quantitationlimittypeName',
              'DetectionQuantitationLimitMeasureValue', 'DetectionLimitMeasureUnitCode']
    b = [sel[p][col] for col in fields]  # projection is picking rows and changing order

    # Get fields in correct order from the lab data
    header_ins_fields = ['lab_accession', 'value', 'UOM', 'analysis_start_date', 'comment',
                         'result_detection_condition',
                         'Rslt_status']
    ins_d_f = [ins_d[j][header_idx[field]] for field in header_ins_fields]

    ins_f = fields + header_ins_fields
    ins_f_idx = {ins_f[i]: i for i in range(len(ins_f))}

    out_ord = ['lab_accession', 'CharacteristicName', 'value', 'UOM', 'ResultValueTypeName', 'analysis_start_date',
               'Rslt_status',
               'comment', 'MethodSpeciationName', 'result_detection_condition', 'SampleFractionName',
               'AnalyticalMethodID',
               'AnalyticalMethodContextCode', 'quantitationlimittypeName', 'DetectionQuantitationLimitMeasureValue',
               'DetectionLimitMeasureUnitCode']

    ins_out = b + ins_d_f
    ins_out = [ins_out[ins_f_idx[name]] for name in out_ord]

    if ins_out[0] in labid_l:
        aid = actid_l[labid_l_idx[ins_out[0]]]
        results += [[aid] + ins_out]
    else:
        m_results += [ins_out]


# Export data with correct header to excel format for upload
headerList = ['ActivityIdentifier',	'lab_accession', 'characteristic_name',	'value', 'UOM', 'resultvaluetype',
              'analysis_start_date', 'Rslt_status', 'comment', 'methodSpeciationName', 'result_detection_condition',
              'sample_fraction', 'method_number', 'method_context', 'DetectionQuantitationTypeName',
              'MDL', 'DetectionQuantitationTypeNameUOM']

df_results = pd.DataFrame(results, columns=headerList)
df_review_results = pd.DataFrame(review, columns=header)

df_results.to_excel('C:/Users/deepuser/Documents/Projects/wqDB_docs/testing_data/CESE_ResultForInsert_2020.xlsx',
                    index =  False)
df_review_results.to_excel('C:/Users/deepuser/Documents/Projects/wqDB_docs/testing_data/CESE_ReviewResults_2020.xlsx',
                           index = False)


# Get results missing activity info with field information from CESE data
m_laccession = []

for i in range(len(m_results)):
    if m_results[i][0] not in m_laccession:
        m_laccession += [m_results[i][0]]

field_info = []
for i in range(len(ins_d)):
    if ins_d[i][0] in m_laccession:
        field_info += [ins_d[i]]

df_missing_results = pd.DataFrame(field_info, columns=header)

df_missing_results.to_excel('C:/Users/deepuser/Documents/Projects/wqDB_docs/testing_data/'
                            'CESE_MissingActivityForResultsInsert_2020.xlsx',
                    index =  False)
