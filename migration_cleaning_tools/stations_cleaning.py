e_file = 'C:/Users/deepuser/Documents/testFTP/BeckerM/ErrRpts/upload_stations_051721.xlsxQcRpt.txt'
with open(e_file, 'r') as f:
    s = f.read()
    f.close()
err = [line.rsplit('\t') for line in s.rsplit('\n')]  # chop up the text by the newline='\n and the delim

sc_file = 'C:/Users/deepuser/Documents/testFTP/BeckerM/Migration/Stations_Success_051721.csv'
with open(sc_file, 'r') as f:
    s = f.read()
    f.close()
sc = [line.rsplit(',') for line in s.rsplit('\n')]  # chop up the text by the newline='\n and the delim

err_dup = []

for i in range(len(err)):
    cd = err[i][2].split(':')[0]
    if cd == '1062 (23000)':
        err_dup += [err[i]]

for i in range(len(err_dup)):
    latlng = err_dup[i][7:9]
    l_lat = len(err_dup[i][7])
    l_lng = len(err_dup[i][8])
    for j in range(len(sc)):
        if len(sc[j])== 21:
            s_lat = sc[j][4][0:l_lat]
            s_long = sc[j][5][0:l_lng]
            s_latlng = [s_lat, s_long]
            if s_latlng == latlng:
                err_dup[i] += sc[j][0:-6]

s_out = '\n'.join(['\t'.join([str(e) for e in row])for row in err_dup])
    with open('C:/Users/deepuser/Documents/testFTP/BeckerM/Migration/Dup_Err_05172021.txt', 'w') as f:
        f.write(s_out)