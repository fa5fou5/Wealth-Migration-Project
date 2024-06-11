# Script for anonymizong data
# Reference :  https://www.geeksforgeeks.org/pandas-strip-whitespace-from-entire-dataframe/
import pandas as pd
import numpy as np
pd.set_option('display.max_columns', None)
names = ('MEMBER','TEAMTYPE','ACTIVE','USERTYPE','TEAMID','TEAMNAME','RVPID','RVPNAME','REPID','REPNAME','PROVINCE','MD_EXTRACT_DT','MD_SRC_SYSTEM')

df = pd.read_csv(r'C:\Users\li2jdc\Downloads\Test Data\iavm_REGISTERED_REPRESENTATIVE__2022-11-30.csv',
				encoding='utf-16le',delimiter = '|',header = None, names=names
				,skipinitialspace = True
				) 
df['MEMBER'] = 'member_' + df['REPID'];
df['REPNAME'] = 'rep_name_' + df['REPID'];
df['RVPNAME'].replace({'Geoff Wilkinson': 'RVP_#1',
				   'Stacie Fisher': 'RVP_#2',
				   'Mary Helen Morra': 'RVP_#7',
				   'Frederic Dayan': 'RVP_#4',
				   '(TERMINATED)': 'RVP_#5'
				   'National Branch': 'RVP_#6',
				  	}, inplace = True);
# print(df[['RVPID','RVPNAME']].unique());
df['RVPID']= df['RVPID'].astype(str)
#print(df['RVPID'].astype(str))
#print(df['RVPID'].dtypes);
print(np.unique(df[['RVPID','RVPNAME']].values))
# '(TERMINATED)' 'Mary Helen Morra' - 7 'Stacie Fisher' 'Geoff Wilkinson'
#  'Frederic Dayan' 'National Branch'
# print(df)
#print(df.iloc[5])
#df.to_csv(r'C:\Users\li2jdc\Downloads\Test Data\IAS\IAVM\11\30\ANONYM_REGISTERED_REPRESENTATIVE__2022-11-30.csv', index= False, sep='|', header=False, encoding='utf-16le')
