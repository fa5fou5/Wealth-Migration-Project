# Script for anonymizong data
# Reference :  https://www.geeksforgeeks.org/pandas-strip-whitespace-from-entire-dataframe/
import pandas as pd
pd.set_option('display.max_columns', None)

names = ('A_C_CLIENT','SIN_HASH','CLIENT_BIRTH_DATE','CLIENT_TAX_RECIP_TYPE','CLIENT_RESIDENCE','CLIENT_RESIDENCE_REGION','CLIENT_ANNUAL_GROSS_INC','CLIENT_INIT_CONTRACT_DATE','MD_EXTRACT_DT','MD_SRC_SYSTEM','CLIENT_INV_KNOWLEDGE_LVL','A_C_NAME','A_C_FIRST_NAME','A_C_MIDDLE_NAME','A_C_LAST_NAME','CLIENT_FIRST_NAME','CLIENT_LAST_NAME')

df = pd.read_csv(r'C:\Users\li2jdc\Downloads\Test Data\nbin_CLIENTS__2022-11-30.csv',
				encoding='utf-16le',delimiter = '|',header = None, names=names
				,skipinitialspace = True
				,parse_dates = True) 
df['A_C_NAME'] = 'ac_name_' + df['A_C_CLIENT']
df['A_C_FIRST_NAME'] = 'ac_f_name_' + df['A_C_CLIENT']
df['A_C_MIDDLE_NAME'] = 'ac_mid_name_' + df['A_C_CLIENT']
df['A_C_LAST_NAME'] = 'ac_l_name_' + df['A_C_CLIENT']
df['CLIENT_FIRST_NAME'] = 'c_f_name_' + df['A_C_CLIENT']
df['CLIENT_LAST_NAME'] = 'c_l_name_' + df['A_C_CLIENT']
df['CLIENT_BIRTH_DATE'] = pd.to_datetime(df.CLIENT_BIRTH_DATE, format='%Y-%m-%d')#
df['CLIENT_BIRTH_DATE'] = df['CLIENT_BIRTH_DATE'] + pd.Timedelta(days=730)
# print(df.dtypes);
#print(df)
# print(df.iloc[5])
df.to_csv(r'C:\Users\li2jdc\OneDrive - Industrial Alliance\TeamBits\IAS\NBIN\11\30\ANONYM_CLIENTS__2022-11-30.csv', index= False, sep='|', header=False, encoding='utf-16le')
