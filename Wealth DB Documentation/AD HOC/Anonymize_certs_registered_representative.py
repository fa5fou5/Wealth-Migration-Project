# Script for anonymizong data
# Reference :  https://www.geeksforgeeks.org/pandas-strip-whitespace-from-entire-dataframe/
import pandas as pd
pd.set_option('display.max_columns', None)

names = ('CID','FIRST_NAME','LAST_NAME','FULL_NAME','PRIMARY_ROLE','RVP','BRANCH_NRD','BRANCH_NAME','PROVINCE','IS_ACTIVE','REP_CODE','TRADE_NAME','PORTAL_IDS','BEGIN_DT','END_DT','ADVISOR_BIRTH_DATE','REP_EMAIL','CBM','BRANCH_ADDRESS1','BRANCH_ADDRESS2','BRANCH_CITY','BRANCH_POSTAL_CODE')

df = pd.read_csv(r'C:\Users\li2jdc\Downloads\Test Data\cert_REGISTERED_REPRESENTATIVE__2022-11-30.csv',
				encoding='utf-16le',delimiter = '|',header = None, names=names\
				,skipinitialspace = True
				,parse_dates=True
				,converters = {'BRANCH_POSTAL_CODE' : str.strip}
				) #, index_col=0

df['FIRST_NAME'] = 'f_name_' + df['CID']
df['LAST_NAME'] = 'l_name_' + df['CID']
df['FULL_NAME'] = 'full_name_' + df['CID']
df['BRANCH_NAME'] = 'branch_name_' + df['CID']
df['RVP'].replace({'Wilkinson, Geoffrey': 'RVP_#1',
				   'Fisher, Stacie': 'RVP_#2',
				   'Dayan, Frederic Albert': 'RVP_#4',
				   'Morra, Mary Helen': 'RVP_#7'
				  	}, inplace = True)
df['REP_EMAIL'] =  '*******@ia.ca'

df['CBM'] = df['CBM'].str[:2]+'*****'+df['CBM'].str[-1:]
df['PORTAL_IDS'] = df['PORTAL_IDS'].str[:2]+'*****'+df['PORTAL_IDS'].str[-1:]
df['BRANCH_POSTAL_CODE'] = df['BRANCH_POSTAL_CODE'].str[:1]+'****'+df['BRANCH_POSTAL_CODE'].str[-1:]
df['BRANCH_CITY'] = df['BRANCH_CITY'].str[:1]+'****'+df['BRANCH_CITY'].str[-1:]
df['BRANCH_ADDRESS1'] = df['BRANCH_ADDRESS1'].str[:2]+'******'+df['BRANCH_ADDRESS1'].str[-1:]
df['BRANCH_ADDRESS2'] = df['BRANCH_ADDRESS2'].str[:2]+'******'+df['BRANCH_ADDRESS2'].str[-1:]
df['ADVISOR_BIRTH_DATE'] = pd.to_datetime(df.ADVISOR_BIRTH_DATE, format='%Y-%m-%d')#
df['ADVISOR_BIRTH_DATE'] = df['ADVISOR_BIRTH_DATE'] + pd.Timedelta(days=730)
df['BEGIN_DT'] = pd.to_datetime(df.BEGIN_DT, format='%Y-%m-%d')#
df['BEGIN_DT'] = df['BEGIN_DT'] + pd.Timedelta(days=730)
# print(df['RVP'].unique());
#print(df)
#print(df.iloc[1])
#print(df.dtypes)
df.to_csv(r'C:\Users\li2jdc\OneDrive - Industrial Alliance\TeamBits\IAS\CERTS\11\30\ANONYM_REGISTERED_REPRESENTATIVE__2022-11-30.csv', index= False, sep='|', header=False, encoding='utf-16le')
# 2016-11-07