# Script for anonymizong data
# Reference :  https://www.geeksforgeeks.org/pandas-strip-whitespace-from-entire-dataframe/
import pandas as pd
names = ('REPID','REPNAME','FIRSTNAME','LASTNAME','BRANCHCODE' ,'BRANCHNAME' ,'GROUPID' ,'GROUPDESCRIPTION' ,'FIXEDFEEIND' ,'MANAGEDIND' ,'REFIND' ,'ACTIVEIND' ,'SEGFUNDIND' ,'REVNO' ,'STAMP' ,'USERID' ,'ACTIVE' ,'ADVISOR_ID' ,'COMMRATEPCT' ,'SHAREGROSSCOMMIND' ,'STARTDATE' ,'MAINREPCODE' ,'MD_EXTRACT_DT' ,'MD_SRC_SYSTEM','ADVISOR_ROLE')
df = pd.read_csv(r'C:\Users\li2jdc\Downloads\Test Data\commission_REGISTERED_REPRESENTATIVE__2022-11-30.csv',
				encoding='utf-16le',delimiter = '|',header = None, names=names
				,skipinitialspace = True
				) #, index_col=0
# print('F_name_'+ df['CID'])
#print(df[0:3])

df['REPNAME'] = 'full_name_' + df['REPID']
df['FIRSTNAME'] = 'f_name_' + df['REPID']
df['LASTNAME'] = 'l_name_' + df['REPID']

# print(df)
# print(df.iloc[5])
df.to_csv(r'C:\Users\li2jdc\Downloads\Test Data\IAS\COMMISSION\2022\30\ANONYM_REGISTERED_REPRESENTATIVE__2022-11-30.csv', index= False, sep='|', header=False, encoding='utf-16le')
