create or replace database DB_IAW_#env#_DM;

create or replace schema DB_IAW_#env#_DM.DATALAKE;

create or replace schema DB_IAW_#env#_DM.EXPLORATION;

create or replace TABLE DB_IAW_#env#_DM.EXPLORATION.IAS_COMMISSION_REVENUES (
	HK_LINK VARCHAR(40) COMMENT 'Hash of the business keys',
	HK_HUB_CONTRACT VARCHAR(40) COMMENT 'Hash key for PARTY_ROLE_ACCOUNT_HOLDER',
	HK_HUB_PARTY_ROLE_ADVISOR VARCHAR(40) COMMENT 'Hash key for the REGISTERED_REPRESENTATIVE_COMMISSION',
	MD_CREATION_DT TIMESTAMP_NTZ(9) DEFAULT CURRENT_TIMESTAMP() COMMENT 'Creation Date Time of the occurrence',
	MD_START_DT TIMESTAMP_NTZ(9) COMMENT 'Start Date of the image/version',
	MD_SOURCE VARCHAR(1000) COMMENT 'Represents the source system, file, etc. of the instance',
	MD_SRC_SYSTEM VARCHAR(100) COMMENT 'Source system',
	MD_EXTRACT_DT TIMESTAMP_NTZ(9) COMMENT 'Source extraction date',
	REPID VARCHAR(50) COMMENT 'Master code  code',
	ADVISOR_ID VARCHAR(512) COMMENT 'Advisor ID in commission portal',
	PROGRAM_TYPE VARCHAR(512) COMMENT 'Program type of the account',
	ACCOUNTID VARCHAR(100) COMMENT 'Account ID',
	PROCESSDATE DATE COMMENT 'Process Date',
	SOURCECODE VARCHAR(50) COMMENT 'Source Code / TRANSACTION_TYPE',
	QUANTITY NUMBER(38,0) COMMENT 'Transaction quantity',
	TRANSTYPE VARCHAR(10) COMMENT 'Transaction Type ([B]uy/[S]ell) / BUY_SELL_INDICATOR',
	REVENUE NUMBER(38,2) COMMENT 'Representative gross revenue',
	COMMISSION NUMBER(38,2) COMMENT 'Representative gross commission',
	NETCOMMISSION NUMBER(38,2) COMMENT 'Representative net commission',
	TRANSFEE NUMBER(38,2) COMMENT 'Representative transaction fees'
);
create or replace TABLE DB_IAW_#env#_DM.EXPLORATION.IAS_HOLDINGS (
	HK_LINK VARCHAR(40) COMMENT 'Hash key for the Link',
	HK_HUB_CONTRACT VARCHAR(40) COMMENT 'Hash key for HUB_CONTRACT',
	HK_HUB_REGISTERED_REPRESENTATIVE VARCHAR(40) COMMENT 'Hash key for HUB_REGISTERED_REPRESENTATIVE',
	HK_HUB_INVESTMENT_PRODUCT_TYPE VARCHAR(40) COMMENT 'Hash key for HUB_INVESTMENT_PRODUCT_TYPE',
	MD_SEQ VARCHAR(50) COMMENT 'The value of METADATA$FILE_ROW_NUMBER when loading using INFORMATICA',
	MD_START_DT TIMESTAMP_NTZ(9) COMMENT 'Start Date of the image/version',
	MD_HASHDIFF VARCHAR(40) COMMENT 'Represents the whole set of hashed attributes to be historized for an occurrence',
	MD_CREATION_DT TIMESTAMP_NTZ(9) COMMENT 'Creation Date Time of the occurrence',
	MD_SOURCE VARCHAR(1000) COMMENT 'Represents the source system, file, etc. of the instance',
	MD_SRC_SYSTEM VARCHAR(100) COMMENT 'Source system',
	MD_EXTRACT_DT TIMESTAMP_NTZ(9) COMMENT 'Extraction date of the occurrence',
	A_C_ID VARCHAR(100) COMMENT 'Account ID',
	A_C_REPRESENTATIVE VARCHAR(50) COMMENT 'Advisor RR code',
	TI_ALTERNATE_ID VARCHAR(50) COMMENT 'Financial product ID',
	TRAN_SUMM_CURR_MKT_VALUE NUMBER(38,2) COMMENT 'Market value of the holding in CAD or USD',
	TRAN_SUMM_BUSINESS_DATE DATE COMMENT 'Update business date',
	TI_ALTERNATE_TI_TYPE VARCHAR(50) COMMENT 'Financial product type ID',
	B_V_SECURITY_POSITION_VAL NUMBER(38,2) COMMENT 'Book value',
	B_V_SECURITY_POSITION_COS NUMBER(38,4) COMMENT 'Average cost base',
	TRAN_SUMM_AVG_UNIT_COST NUMBER(38,5) COMMENT 'Average cost base',
	TRAN_SUMM_NET_SETT_AMT NUMBER(38,2) COMMENT 'Cash position',
	TRAN_SUMM_CURRENCY VARCHAR(10) COMMENT 'Holding value currency',
	TRAN_SUMM_SETT_QTY NUMBER(38,4) COMMENT 'Units',
	TRAN_SUMM_TRADE_QTY NUMBER(38,4) COMMENT 'Units calculated by trade date'
);
create or replace TABLE DB_IAW_#env#_DM.EXPLORATION.REGISTERED_REPRESENTATIVES_ROLES (
	REPID VARCHAR(25) COMMENT 'Representant ID ',
	MAINREPID VARCHAR(25) COMMENT 'Holding value currency',
	USERID VARCHAR(250) COMMENT 'Active Directory User Id',
	ROLEID VARCHAR(250) COMMENT 'Role ID',
	FUNC VARCHAR(250) COMMENT 'Function in a role'
);
create or replace schema DB_IAW_#env#_DM.EXTERNAL_KPI;

create or replace TABLE DB_IAW_#env#_DM.EXTERNAL_KPI.MASTER_KPI_DATA_CLARINGTON (
	HK_HUB VARCHAR(40) COMMENT 'Hash key for the Hub',
	MD_START_DT TIMESTAMP_NTZ(9) COMMENT 'Start Date of the image/version',
	MD_CREATION_DT TIMESTAMP_NTZ(9) COMMENT 'Creation Date Time of the occurrence',
	MD_CREATION_AUDIT_ID VARCHAR(1000) COMMENT 'Task execution ID',
	MD_SOURCE VARCHAR(1000) COMMENT 'Represents the source system, file, etc. of the instance',
	MD_SRC_SYSTEM VARCHAR(100) COMMENT 'Source system',
	MD_EXTRACT_DT TIMESTAMP_NTZ(9) COMMENT 'Extraction date of the occurrence',
	KPI_DATE TIMESTAMP_NTZ(9) COMMENT 'Date',
	TRADE_ACCOUNT_PROCESSING_AUTOMATION_PCT_MF NUMBER(20,4) COMMENT 'Trade/Account Processing Automation % MF',
	TRADE_ACCOUNT_PROCESSING_AUTOMATION_PCT_GIF NUMBER(20,4) COMMENT 'Trade/Account Processing Automation % GIF',
	FTE NUMBER(20,4) COMMENT 'FTE',
	TOTAL_TRANSACTIONS_MF NUMBER(20,4) COMMENT 'Total Transactions MF',
	TOTAL_TRANSACTIONS_GIF NUMBER(20,4) COMMENT 'Total Transactions GIF',
	TOTAL_TRANSACTIONS_FTE_MF NUMBER(20,4) COMMENT 'Total Transactions/FTE MF',
	TOTAL_TRANSACTIONS_FTE_GIF NUMBER(20,4) COMMENT 'Total Transactions/FTE GIF',
	NO_OF_ACCOUNTS NUMBER(20,4) COMMENT 'No. of Accounts',
	ACCOUNTS_FTE NUMBER(20,4) COMMENT 'Accounts/FTE',
	ACCOUNTS_FTE_TARGET NUMBER(20,4) COMMENT 'Accounts/FTE Target',
	YOY_NEW_ACCOUNTS_CLIENT_NAME NUMBER(20,4) COMMENT 'YoY New Accounts Client Name',
	YOY_NEW_ACCOUNTS_CLIENT_NOMINEE NUMBER(20,4) COMMENT 'YoY New Accounts Client Nominee',
	TOTAL_ACCOUNTS_IN_NOMINEE NUMBER(20,4) COMMENT 'Total Account in Nominee %',
	EXPENSES NUMBER(20,4) COMMENT 'Expenses',
	REVENUES NUMBER(20,4) COMMENT 'Revenues',
	EFFICIENCY_RATIO NUMBER(20,4) COMMENT 'Efficiency Ratio',
	EXPENSES_TARGET NUMBER(20,4) COMMENT 'Expenses Target',
	REVENUE_TARGET NUMBER(20,4) COMMENT 'Revenue Target',
	EFFICIENCY_RATIO_TARGET NUMBER(20,4) COMMENT 'Efficiency Ratio Target',
	TOTAL_ASSETS NUMBER(20,4) COMMENT 'Total Assets',
	AFFILIATE_PENETRATION_IIROC NUMBER(20,4) COMMENT 'Affiliate Penetration IIROC',
	AFFILIATE_PENETRATION_IIROC_TARGET NUMBER(20,4) COMMENT 'Affiliate Penetration IIROC Target',
	AFFILIATE_PENETRATION_MFDA NUMBER(20,4) COMMENT 'Affiliate Penetration MFDA',
	AFFILIATE_PENETRATION_MFDA_TARGET NUMBER(20,4) COMMENT 'Affiliate Penetration MFDA Target',
	GROSS_MARGIN NUMBER(20,4) COMMENT 'Gross Margin',
	GROSS_MARGIN_TARGET NUMBER(20,4) COMMENT 'Gross Margin Target',
	NET_SALES NUMBER(20,4) COMMENT 'Net Sales'
);
create or replace TABLE DB_IAW_#env#_DM.EXTERNAL_KPI.MASTER_KPI_DATA_IAPW (
	HK_HUB VARCHAR(40) COMMENT 'Hash key for the Hub',
	MD_START_DT TIMESTAMP_NTZ(9) COMMENT 'Start Date of the image/version',
	MD_HASHDIFF VARCHAR(40) COMMENT 'Represents the whole set of hashed attributes to be historized for an occurrence',
	MD_CREATION_DT TIMESTAMP_NTZ(9) COMMENT 'Creation Date Time of the occurrence',
	MD_CREATION_AUDIT_ID VARCHAR(1000) COMMENT 'Task execution ID',
	MD_SOURCE VARCHAR(1000) COMMENT 'Represents the source system, file, etc. of the instance',
	MD_SRC_SYSTEM VARCHAR(100) COMMENT 'Source system',
	MD_EXTRACT_DT TIMESTAMP_NTZ(9) COMMENT 'Extraction date of the occurrence',
	KPI_DATE TIMESTAMP_NTZ(9) COMMENT 'KPI Date',
	NO_OF_ACTIVE_CLIENTS NUMBER(38,4) COMMENT 'No. of Active Clients',
	NO_OF_ACTIVE_ACCOUNTS NUMBER(38,4) COMMENT 'No. of Active Accounts',
	FTE NUMBER(38,4) COMMENT 'FTE',
	ACCOUNTS_FTE NUMBER(38,4) COMMENT 'Accounts/FTE',
	ACCOUNTS_FTE_TARGET NUMBER(38,4) COMMENT 'Accounts/FTE Target',
	APPWAY_REGISTRATION NUMBER(38,4) COMMENT 'Appway % Registration',
	APPWAY_REGISTRATION_TARGET NUMBER(38,4) COMMENT 'Appway % Registration Target',
	NO_OF_CLIENT_ID_REGISTERED NUMBER(38,4) COMMENT 'No. of Client ID registered',
	PORTAL_REGISTRATION NUMBER(38,4) COMMENT 'Portal % registration',
	PORTAL_REGISTRATION_TARGET NUMBER(38,4) COMMENT 'Portal % registration Target',
	MYPORTFOLIO_TO_NEW_CLIENT NUMBER(38,4) COMMENT 'MyPortfolio+ to new client',
	E_DELIVERY_PORTFOLIO_STATEMENTS NUMBER(38,4) COMMENT 'E-Delivery Portfolio Statements',
	E_DELIVERY_TAX_SLIPS NUMBER(38,4) COMMENT 'E-Delivery Tax Slips',
	E_DELIVERY_CONFIRMS NUMBER(38,4) COMMENT 'E-Delivery Confirms',
	AVG_E_DELIVERY_REGISTRATION NUMBER(38,4) COMMENT 'Avg. E-Delivery % registration',
	E_DELIVERY_REGISTRATION_TARGET NUMBER(38,4) COMMENT 'E-Delivery % registration Target',
	RETAIL_YTD_EXPENSES NUMBER(38,4) COMMENT 'Retail YTD Expenses',
	RETAIL_YTD_REVENUES NUMBER(38,4) COMMENT 'Retail YTD Revenues',
	RETAIL_FINANCIAL_EFFICIENCY_RATIO NUMBER(38,4) COMMENT 'Retail Financial Efficiency Ratio',
	RETAIL_YTD_EXPENSES_TARGET NUMBER(38,4) COMMENT 'Retail YTD Expenses Target',
	RETAIL_YTD_REVENUES_TARGET NUMBER(38,4) COMMENT 'Retail YTD Revenues Target',
	RETAIL_EFFICIENCY_RATIO_TARGET NUMBER(38,4) COMMENT 'Retail Efficiency Ratio Target',
	CAP_MRKTS_YTD_EXPENSES NUMBER(38,4) COMMENT 'Cap. Mrkts YTD Expenses',
	CAP_MKTS_YTD_REVENUES NUMBER(38,4) COMMENT 'Cap. Mkts YTD Revenues',
	CAP_MRKTS_EFFICIENCY_RATIO NUMBER(38,4) COMMENT 'Cap. Mrkts Efficiency Ratio',
	CAP_MRKTS_YTD_EXPENSES_TARGET NUMBER(38,4) COMMENT 'Cap. Mrkts YTD Expenses Target',
	CAP_MRKTS_YTD_REVENUES_TARGET NUMBER(38,4) COMMENT 'Cap. Mrkts YTD Revenues Target',
	CAP_MRKTS_EFFICIENCY_RATIO_TARGET NUMBER(38,4) COMMENT 'Cap. Mrkts Efficiency Ratio Target',
	TOTAL_ASSETS NUMBER(38,4) COMMENT 'Total Assets',
	NET_TOTAL_REVENUE NUMBER(38,4) COMMENT 'Net Total Revenue',
	NET_TOTAL_REVENUE_TARGET NUMBER(38,4) COMMENT 'Net Total Revenue Target',
	NET_BOND_DESK_REVENUE NUMBER(38,4) COMMENT 'Net Bond Desk Revenue',
	NET_BOND_DESK_REVENUE_TARGET NUMBER(38,4) COMMENT 'Net Bond Desk Revenue Target',
	CAPITAL_MKTS_REVENUE NUMBER(38,4) COMMENT 'Capital Mkts Revenue',
	CAPITAL_MKTS_REVENUE_TARGET NUMBER(38,4) COMMENT 'Capital Mkts Revenue Target',
	NET_RETAIL_REVENUE NUMBER(38,4) COMMENT 'Net Retail Revenue',
	NET_RETAIL_REVENUE_TARGET NUMBER(38,4) COMMENT 'Net Retail Revenue Target',
	RECRUITING NUMBER(38,4) COMMENT 'Recruiting',
	TERMINATED_ADVISORS NUMBER(38,4) COMMENT 'Terminated Advisors',
	ORGANIC_GROWTH NUMBER(38,4) COMMENT 'Organic Growth'
);
create or replace TABLE DB_IAW_#env#_DM.EXTERNAL_KPI.MASTER_KPI_DATA_INVESTIA (
	HK_HUB VARCHAR(40) COMMENT ' Hash key for the Hub ',
	MD_START_DT TIMESTAMP_NTZ(9) COMMENT ' Start Date of the image/version ',
	MD_CREATION_DT TIMESTAMP_NTZ(9) COMMENT ' Creation Date Time of the occurrence ',
	MD_CREATION_AUDIT_ID VARCHAR(1000) COMMENT 'Task execution ID',
	MD_SOURCE VARCHAR(1000) COMMENT ' Represents the source system, file, etc. of the instance ',
	MD_SRC_SYSTEM VARCHAR(100) COMMENT ' Source system ',
	MD_EXTRACT_DT TIMESTAMP_NTZ(9) COMMENT ' Extraction date of the occurrence ',
	KPI_DATE TIMESTAMP_NTZ(9) COMMENT ' KPI Date ',
	NO_CLIENT_ID NUMBER(20,4) COMMENT ' # Client ID ',
	E_DELIVERY NUMBER(20,4) COMMENT ' E-delivery ',
	E_DELIVERY_PCT NUMBER(20,4) COMMENT ' % E-delivery ',
	E_DELIVERY_TARGET_PCT NUMBER(20,4) COMMENT ' % E-delivery Target ',
	PORTAL_REGISTRATION NUMBER(20,4) COMMENT ' Portal Registration ',
	PORTAL_REGISTRATION_PCT NUMBER(20,4) COMMENT ' % Portal Registration ',
	PORTAL_REGISTRATION_TARGET NUMBER(20,4) COMMENT ' Portal Registration Target ',
	FTE NUMBER(20,4) COMMENT ' FTE ',
	CLIENTS_BY_FTE NUMBER(20,4) COMMENT ' Clients by FTE ',
	CLIENTS_BY_FTE_TARGET NUMBER(20,4) COMMENT ' Clients by FTE Target ',
	NO_OF_ACCOUNTS NUMBER(20,4) COMMENT ' No of accounts ',
	ACCOUNTS_BY_FTE NUMBER(20,4) COMMENT ' Accounts by FTE ',
	ACTUAL_YTD_EXPENSES NUMBER(20,4) COMMENT ' Actual YTD Expenses ',
	ACTUAL_YTD_REVENUES NUMBER(20,4) COMMENT ' Actual YTD Revenues ',
	EFFICIENCY_RATIO NUMBER(20,4) COMMENT ' Efficiency Ratio ',
	YTD_EXPENSES_TARGET NUMBER(20,4) COMMENT ' YTD Expenses Taregt ',
	YTD_REVENUES_TARGET NUMBER(20,4) COMMENT ' YTD Revenues Target ',
	EFFICIENCY_RATIO_TARGET NUMBER(20,4) COMMENT ' Efficiency Ratio Target ',
	AUA_IN_NOMINEE NUMBER(20,4) COMMENT ' AUA in Nominee ',
	AUA_IN_CLIENT_NAME NUMBER(20,4) COMMENT ' AUA in Client Name ',
	NO_OF_RPAS_IMPLEMENTED NUMBER(20,4) COMMENT ' # of RPAs implemented ',
	HOURS_SAVED_DUE_TO_RPAS NUMBER(20,4) COMMENT ' Hours Saved due to RPAs ',
	CONTINUOUS_IMPROVEMENT_QUICK_WINS NUMBER(20,4) COMMENT ' Continuous improvement/quick wins ',
	TOTAL_ASSETS NUMBER(20,4) COMMENT ' Total Assets  ',
	ORGANIC_GROWTH NUMBER(20,4) COMMENT ' Organic Growth  ',
	TOTAL_REVENUE NUMBER(20,4) COMMENT ' Total Revenue  ',
	TOTAL_REVENUE_TARGET NUMBER(20,4) COMMENT ' Total Revenue Target  ',
	RECRUITING NUMBER(20,4) COMMENT ' Recruiting  ',
	TERMINATED_ADVISORS NUMBER(20,4) COMMENT ' Terminated Advisors  '
);
create or replace view DB_IAW_#env#_DM.EXTERNAL_KPI.VW_MASTER_KPI_DATA_CLARINGTON(
	"Start Date of the image/version",
	"Extraction date of the occurrence",
	"KPI Date",
	"Trade/Account Processing Automation % MF",
	"Trade/Account Processing Automation % GIF",
	FTE,
	"Total Transactions MF",
	"Total Transactions GIF",
	"Total Transactions/FTE MF",
	"Total Transactions/FTE GIF",
	"No. of Accounts",
	"Accounts/FTE",
	"Accounts/FTE Target",
	"YoY New Accounts Client Name",
	"YoY New Accounts Client Nominee",
	"Total Account in Nominee %",
	"Expenses",
	"Revenues",
	"Efficiency Ratio",
	"Expenses Target",
	"Revenue Target",
	"Efficiency Ratio Target",
	"Total Assets",
	"Affiliate Penetration IIROC",
	"Affiliate Penetration IIROC Target",
	"Affiliate Penetration MFDA",
	"Affiliate Penetration MFDA Target",
	"Gross Margin",
	"Gross Margin Target",
	"Net Sales"
) as 
SELECT 
MD_START_DT	 AS "Start Date of the image/version" ,
MD_EXTRACT_DT	 AS "Extraction date of the occurrence" ,
KPI_DATE AS "KPI Date",
TRADE_ACCOUNT_PROCESSING_AUTOMATION_PCT_MF AS "Trade/Account Processing Automation % MF",
TRADE_ACCOUNT_PROCESSING_AUTOMATION_PCT_GIF AS "Trade/Account Processing Automation % GIF",
FTE AS "FTE",
TOTAL_TRANSACTIONS_MF AS "Total Transactions MF",
TOTAL_TRANSACTIONS_GIF AS "Total Transactions GIF",
TOTAL_TRANSACTIONS_FTE_MF AS "Total Transactions/FTE MF",
TOTAL_TRANSACTIONS_FTE_GIF AS "Total Transactions/FTE GIF",
NO_OF_ACCOUNTS AS "No. of Accounts",
ACCOUNTS_FTE AS "Accounts/FTE",
ACCOUNTS_FTE_TARGET AS "Accounts/FTE Target",
YOY_NEW_ACCOUNTS_CLIENT_NAME AS "YoY New Accounts Client Name",
YOY_NEW_ACCOUNTS_CLIENT_NOMINEE AS "YoY New Accounts Client Nominee",
TOTAL_ACCOUNTS_IN_NOMINEE AS "Total Account in Nominee %",
EXPENSES AS "Expenses",
REVENUES AS "Revenues",
EFFICIENCY_RATIO AS "Efficiency Ratio",
EXPENSES_TARGET AS "Expenses Target",
REVENUE_TARGET AS "Revenue Target",
EFFICIENCY_RATIO_TARGET AS "Efficiency Ratio Target",
TOTAL_ASSETS AS "Total Assets",
AFFILIATE_PENETRATION_IIROC AS "Affiliate Penetration IIROC",
AFFILIATE_PENETRATION_IIROC_TARGET AS "Affiliate Penetration IIROC Target",
AFFILIATE_PENETRATION_MFDA AS "Affiliate Penetration MFDA",
AFFILIATE_PENETRATION_MFDA_TARGET AS "Affiliate Penetration MFDA Target",
GROSS_MARGIN AS "Gross Margin",
GROSS_MARGIN_TARGET AS "Gross Margin Target",
NET_SALES AS "Net Sales"
from DB_IAW_#env#_DM.EXTERNAL_KPI.MASTER_KPI_DATA_CLARINGTON
where MD_START_DT = (select max(MD_START_DT) from DB_IAW_#env#_DM.EXTERNAL_KPI.MASTER_KPI_DATA_CLARINGTON)
;
create or replace view DB_IAW_#env#_DM.EXTERNAL_KPI.VW_MASTER_KPI_DATA_IAPW(
	"Start Date of the image/version",
	"Extraction date of the occurrence",
	"KPI Date",
	"No. of Active Clients",
	"No. of Active Accounts",
	FTE,
	"Accounts/FTE",
	"Accounts/FTE Target",
	"Appway % Registration",
	"Appway % Registration Target",
	"No. of Client ID registered",
	"Portal % registration",
	"Portal % registration Target",
	"MyPortfolio+ to new client ",
	"E-Delivery Portfolio Statements",
	"E-Delivery Tax Slips",
	"E-Delivery Confirms",
	"Avg. E-Delivery % registration",
	"E-Delivery % registration Target",
	"Retail YTD Expenses",
	"Retail YTD Revenues",
	"Retail Financial Efficiency Ratio",
	"Retail YTD Expenses Target",
	"Retail YTD Revenues Target",
	"Retail Efficiency Ratio Target",
	"Cap. Mrkts YTD Expenses",
	"Cap. Mkts YTD Revenues",
	"Cap. Mrkts Efficiency Ratio",
	"Cap. Mrkts YTD Expenses Target",
	"Cap. Mrkts YTD Revenues Target",
	"Cap. Mrkts Efficiency Ratio Target",
	"Total Assets",
	"Net Total Revenue",
	"Net Total Revenue Target",
	"Net Bond Desk Revenue",
	"Net Bond Desk Revenue Target",
	"Capital Mkts Revenue",
	"Capital Mkts Revenue Target",
	"Net Retail Revenue",
	"Net Retail Revenue Target",
	"Recruiting",
	"Terminated Advisors",
	"Organic Growth"
) as
SELECT 
MD_START_DT	 AS "Start Date of the image/version" ,
MD_EXTRACT_DT	 AS "Extraction date of the occurrence" ,
KPI_DATE as "KPI Date",
NO_OF_ACTIVE_CLIENTS as "No. of Active Clients",
NO_OF_ACTIVE_ACCOUNTS as "No. of Active Accounts",
FTE as "FTE",
ACCOUNTS_FTE as "Accounts/FTE",
ACCOUNTS_FTE_TARGET as "Accounts/FTE Target",
APPWAY_REGISTRATION as "Appway % Registration",
APPWAY_REGISTRATION_TARGET as "Appway % Registration Target",
NO_OF_CLIENT_ID_REGISTERED as "No. of Client ID registered",
PORTAL_REGISTRATION as "Portal % registration",
PORTAL_REGISTRATION_TARGET as "Portal % registration Target",
MYPORTFOLIO_TO_NEW_CLIENT as "MyPortfolio+ to new client",
E_DELIVERY_PORTFOLIO_STATEMENTS as "E-Delivery Portfolio Statements",
E_DELIVERY_TAX_SLIPS as "E-Delivery Tax Slips",
E_DELIVERY_CONFIRMS as "E-Delivery Confirms",
AVG_E_DELIVERY_REGISTRATION as "Avg. E-Delivery % registration",
E_DELIVERY_REGISTRATION_TARGET as "E-Delivery % registration Target",
RETAIL_YTD_EXPENSES as "Retail YTD Expenses",
RETAIL_YTD_REVENUES as "Retail YTD Revenues",
RETAIL_FINANCIAL_EFFICIENCY_RATIO as "Retail Financial Efficiency Ratio",
RETAIL_YTD_EXPENSES_TARGET as "Retail YTD Expenses Target",
RETAIL_YTD_REVENUES_TARGET as "Retail YTD Revenues Target",
RETAIL_EFFICIENCY_RATIO_TARGET as "Retail Efficiency Ratio Target",
CAP_MRKTS_YTD_EXPENSES as "Cap. Mrkts YTD Expenses",
CAP_MKTS_YTD_REVENUES as "Cap. Mkts YTD Revenues",
CAP_MRKTS_EFFICIENCY_RATIO as "Cap. Mrkts Efficiency Ratio",
CAP_MRKTS_YTD_EXPENSES_TARGET as "Cap. Mrkts YTD Expenses Target",
CAP_MRKTS_YTD_REVENUES_TARGET as "Cap. Mrkts YTD Revenues Target",
CAP_MRKTS_EFFICIENCY_RATIO_TARGET as "Cap. Mrkts Efficiency Ratio Target",
TOTAL_ASSETS as "Total Assets",
NET_TOTAL_REVENUE as "Net Total Revenue",
NET_TOTAL_REVENUE_TARGET as "Net Total Revenue Target",
NET_BOND_DESK_REVENUE as "Net Bond Desk Revenue",
NET_BOND_DESK_REVENUE_TARGET as "Net Bond Desk Revenue Target",
CAPITAL_MKTS_REVENUE as "Capital Mkts Revenue",
CAPITAL_MKTS_REVENUE_TARGET as "Capital Mkts Revenue Target",
NET_RETAIL_REVENUE as "Net Retail Revenue",
NET_RETAIL_REVENUE_TARGET as "Net Retail Revenue Target",
RECRUITING as "Recruiting",
TERMINATED_ADVISORS as "Terminated Advisors",
ORGANIC_GROWTH as "Organic Growth" 
FROM DB_IAW_#env#_DM.EXTERNAL_KPI.MASTER_KPI_DATA_IAPW
where MD_START_DT = (select max(MD_START_DT) from DB_IAW_#env#_DM.EXTERNAL_KPI.MASTER_KPI_DATA_IAPW)
;
create or replace view DB_IAW_#env#_DM.EXTERNAL_KPI.VW_MASTER_KPI_DATA_INVESTIA(
	"Start Date of the image/version",
	"Extraction date of the occurrence",
	"KPI Date",
	"# Client ID",
	"E-delivery",
	"% E-delivery",
	"% E-delivery Target",
	"Portal Registration",
	"% Portal Registration",
	"Portal Registration Target",
	FTE,
	"Clients by FTE",
	"Clients by FTE Target",
	"No of accounts",
	"Accounts by FTE",
	"Actual YTD Expenses",
	"Actual YTD Revenues",
	"Efficiency Ratio",
	"YTD Expenses Taregt",
	"YTD Revenues Target",
	"Efficiency Ratio Target",
	"AUA in Nominee",
	"AUA in Client Name",
	"# of RPAs implemented",
	"Hours Saved due to RPAs",
	"Continuous improvement/quick wins",
	"Total Assets ",
	"Organic Growth ",
	"Total Revenue ",
	"Total Revenue Target ",
	" Recruiting ",
	"Terminated Advisors"
) as
SELECT 
MD_START_DT	 AS "Start Date of the image/version" ,
MD_EXTRACT_DT	 AS "Extraction date of the occurrence" ,
KPI_DATE	 AS "KPI Date" ,
No_CLIENT_ID	 AS "# Client ID" ,
E_DELIVERY	 AS "E-delivery" ,
E_DELIVERY_PCT	 AS "% E-delivery" ,
E_DELIVERY_TARGET_PCT	 AS "% E-delivery Target" ,
PORTAL_REGISTRATION	 AS "Portal Registration" ,
PORTAL_REGISTRATION_PCT	 AS "% Portal Registration" ,
PORTAL_REGISTRATION_TARGET	 AS "Portal Registration Target" ,
FTE	 AS "FTE" ,
CLIENTS_BY_FTE	 AS "Clients by FTE" ,
CLIENTS_BY_FTE_TARGET	 AS "Clients by FTE Target" ,
NO_OF_ACCOUNTS	 AS "No of accounts" ,
ACCOUNTS_BY_FTE	 AS "Accounts by FTE" ,
ACTUAL_YTD_EXPENSES	 AS "Actual YTD Expenses" ,
ACTUAL_YTD_REVENUES	 AS "Actual YTD Revenues" ,
EFFICIENCY_RATIO	 AS "Efficiency Ratio" ,
YTD_EXPENSES_TARGET	 AS "YTD Expenses Taregt" ,
YTD_REVENUES_TARGET	 AS "YTD Revenues Target" ,
EFFICIENCY_RATIO_TARGET	 AS "Efficiency Ratio Target" ,
AUA_IN_NOMINEE	 AS "AUA in Nominee" ,
AUA_IN_CLIENT_NAME	 AS "AUA in Client Name" ,
No_OF_RPAS_IMPLEMENTED	 AS "# of RPAs implemented" ,
HOURS_SAVED_DUE_TO_RPAS	 AS "Hours Saved due to RPAs" ,
CONTINUOUS_IMPROVEMENT_QUICK_WINS	 AS "Continuous improvement/quick wins" ,
TOTAL_ASSETS	 AS "Total Assets " ,
ORGANIC_GROWTH	 AS "Organic Growth " ,
TOTAL_REVENUE	 AS "Total Revenue " ,
TOTAL_REVENUE_TARGET	 AS "Total Revenue Target " ,
RECRUITING	 AS " Recruiting " ,
TERMINATED_ADVISORS	 AS "Terminated Advisors" 
FROM DB_IAW_#env#_DM.EXTERNAL_KPI.MASTER_KPI_DATA_INVESTIA
where MD_START_DT = (select max(MD_START_DT) from DB_IAW_#env#_DM.EXTERNAL_KPI.MASTER_KPI_DATA_INVESTIA);
CREATE OR REPLACE PROCEDURE DB_IAW_#env#_DM.EXTERNAL_KPI.SP_CONV_INVESTIA_STG_TO_DM_MASTER_KPI_DATA_CLARINGTON("ENV" VARCHAR(1000), "DATA_START_DATE" VARCHAR(20), "JOB_NAME" VARCHAR(16777216), "JOB_AUDIT_ID" VARCHAR(16777216), "RUN_ID" VARCHAR(16777216))
RETURNS VARCHAR(16777216)
LANGUAGE SQL
EXECUTE AS OWNER
AS '
DECLARE
DEL_QUERY STRING;
INS_QUERY STRING;
BEGIN
DATA_START_DATE :=CHAR(39)||DATA_START_DATE||CHAR(39);
DEL_QUERY := ''DELETE FROM DB_IAW_''||ENV||''_DM.EXTERNAL_KPI.MASTER_KPI_DATA_CLARINGTON WHERE MD_START_DT IN (SELECT MD_START_DT FROM DB_IAW_''||ENV||''_STG.EXTERNAL_KPI.REF_MASTER_KPI_DATA_CLARINGTON GROUP BY MD_START_DT HAVING COUNT(1)>=1)'';
INS_QUERY := ''
INSERT INTO DB_IAW_''||ENV||''_DM.EXTERNAL_KPI.MASTER_KPI_DATA_CLARINGTON(
	HK_HUB	
,MD_START_DT	
,MD_CREATION_DT		
,MD_CREATION_AUDIT_ID		
,MD_SOURCE	
,MD_SRC_SYSTEM	
,MD_EXTRACT_DT	
,KPI_DATE	
,TRADE_ACCOUNT_PROCESSING_AUTOMATION_PCT_MF		
,TRADE_ACCOUNT_PROCESSING_AUTOMATION_PCT_GIF	
,FTE		
,TOTAL_TRANSACTIONS_MF		
,TOTAL_TRANSACTIONS_GIF	
,TOTAL_TRANSACTIONS_FTE_MF		
,TOTAL_TRANSACTIONS_FTE_GIF		
,NO_OF_ACCOUNTS		
,ACCOUNTS_FTE		
,ACCOUNTS_FTE_TARGET		
,YOY_NEW_ACCOUNTS_CLIENT_NAME		
,YOY_NEW_ACCOUNTS_CLIENT_NOMINEE		
,TOTAL_ACCOUNTS_IN_NOMINEE
,EXPENSES		
,REVENUES	
,EFFICIENCY_RATIO		
,EXPENSES_TARGET		
,REVENUE_TARGET		
,EFFICIENCY_RATIO_TARGET		
,TOTAL_ASSETS		
,AFFILIATE_PENETRATION_IIROC	
,AFFILIATE_PENETRATION_IIROC_TARGET		
,AFFILIATE_PENETRATION_MFDA		
,AFFILIATE_PENETRATION_MFDA_TARGET		
,GROSS_MARGIN	
,GROSS_MARGIN_TARGET		
,NET_SALES		
)
	(SELECT
	src.HK_HUB	
	,TO_DATE(''||DATA_START_DATE||'',''''YYYY-MM-DD'''')	
	,CURRENT_TIMESTAMP
	,CONCAT(''||CHAR(39)||JOB_AUDIT_ID||CHAR(39)||'',''''#'''',''||CHAR(39)||JOB_NAME||CHAR(39)||'',''''-'''',''||CHAR(39)||RUN_ID||CHAR(39)||'')	
	,src.MD_SOURCE	
	,src.MD_SRC_SYSTEM	
	,src.MD_EXTRACT_DT	
	,src.KPI_DATE	
	,src.TRADE_ACCOUNT_PROCESSING_AUTOMATION_PCT_MF	
	,src.TRADE_ACCOUNT_PROCESSING_AUTOMATION_PCT_GIF	
	,src.FTE	
	,src.TOTAL_TRANSACTIONS_MF	
	,src.TOTAL_TRANSACTIONS_GIF
	,src.TOTAL_TRANSACTIONS_FTE_MF	
	,src.TOTAL_TRANSACTIONS_FTE_GIF	
	,src.NO_OF_ACCOUNTS	
	,src.ACCOUNTS_FTE	
	,src.ACCOUNTS_FTE_TARGET	
	,src.YOY_NEW_ACCOUNTS_CLIENT_NAME	
	,src.YOY_NEW_ACCOUNTS_CLIENT_NOMINEE
    ,src.TOTAL_ACCOUNTS_IN_NOMINEE
	,src.EXPENSES	
	,src.REVENUES
	,src.EFFICIENCY_RATIO	
	,src.EXPENSES_TARGET	
	,src.REVENUE_TARGET	
	,src.EFFICIENCY_RATIO_TARGET	
	,src.TOTAL_ASSETS	
	,src.AFFILIATE_PENETRATION_IIROC	
	,src.AFFILIATE_PENETRATION_IIROC_TARGET	
	,src.AFFILIATE_PENETRATION_MFDA	
	,src.AFFILIATE_PENETRATION_MFDA_TARGET	
	,src.GROSS_MARGIN
	,src.GROSS_MARGIN_TARGET	
	,src.NET_SALES	
	FROM DB_IAW_''||ENV||''_STG.EXTERNAL_KPI.REF_MASTER_KPI_DATA_CLARINGTON src)'';
EXECUTE IMMEDIATE :DEL_QUERY;
EXECUTE IMMEDIATE :INS_QUERY;
END
';
CREATE OR REPLACE PROCEDURE DB_IAW_#env#_DM.EXTERNAL_KPI.SP_CONV_LOADDM_IAPW_STG_TO_DM_MASTER_KPI_DATA_IAPW("ENV" VARCHAR(1000), "DATA_START_DATE" VARCHAR(20), "JOB_NAME" VARCHAR(16777216), "JOB_AUDIT_ID" VARCHAR(16777216), "RUN_ID" VARCHAR(16777216))
RETURNS VARCHAR(16777216)
LANGUAGE SQL
EXECUTE AS OWNER
AS '
DECLARE
DEL_QUERY STRING;
INS_QUERY STRING;
BEGIN
DATA_START_DATE :=CHAR(39)||DATA_START_DATE||CHAR(39);
DEL_QUERY := ''DELETE FROM DB_IAW_''||ENV||''_DM.EXTERNAL_KPI.MASTER_KPI_DATA_IAPW WHERE MD_START_DT IN (SELECT MD_START_DT FROM DB_IAW_''||ENV||''_STG.EXTERNAL_KPI.REF_MASTER_KPI_DATA_IAPW GROUP BY MD_START_DT HAVING COUNT(1)>=1)'';
INS_QUERY := ''
INSERT INTO DB_IAW_''||ENV||''_DM.EXTERNAL_KPI.MASTER_KPI_DATA_IAPW(
HK_HUB	
,MD_START_DT	
,MD_HASHDIFF	
,MD_CREATION_DT		
,MD_CREATION_AUDIT_ID		
,MD_SOURCE	
,MD_SRC_SYSTEM		
,MD_EXTRACT_DT		
,KPI_DATE		
,NO_OF_ACTIVE_CLIENTS		
,NO_OF_ACTIVE_ACCOUNTS	
,FTE		
,ACCOUNTS_FTE	
,ACCOUNTS_FTE_TARGET		
,APPWAY_REGISTRATION	
,APPWAY_REGISTRATION_TARGET	
,NO_OF_CLIENT_ID_REGISTERED		
,PORTAL_REGISTRATION	
,PORTAL_REGISTRATION_TARGET		
,MYPORTFOLIO_TO_NEW_CLIENT		
,E_DELIVERY_PORTFOLIO_STATEMENTS	
,E_DELIVERY_TAX_SLIPS		
,E_DELIVERY_CONFIRMS		
,AVG_E_DELIVERY_REGISTRATION	
,E_DELIVERY_REGISTRATION_TARGET	
,RETAIL_YTD_EXPENSES		
,RETAIL_YTD_REVENUES		
,RETAIL_FINANCIAL_EFFICIENCY_RATIO		
,RETAIL_YTD_EXPENSES_TARGET		
,RETAIL_YTD_REVENUES_TARGET		
,RETAIL_EFFICIENCY_RATIO_TARGET		
,CAP_MRKTS_YTD_EXPENSES		
,CAP_MKTS_YTD_REVENUES		
,CAP_MRKTS_EFFICIENCY_RATIO		
,CAP_MRKTS_YTD_EXPENSES_TARGET		
,CAP_MRKTS_YTD_REVENUES_TARGET	
,CAP_MRKTS_EFFICIENCY_RATIO_TARGET		
,TOTAL_ASSETS		
,NET_TOTAL_REVENUE		
,NET_TOTAL_REVENUE_TARGET		
,NET_BOND_DESK_REVENUE		
,NET_BOND_DESK_REVENUE_TARGET		
,CAPITAL_MKTS_REVENUE		
,CAPITAL_MKTS_REVENUE_TARGET		
,NET_RETAIL_REVENUE		
,NET_RETAIL_REVENUE_TARGET		
,RECRUITING		
,TERMINATED_ADVISORS
,ORGANIC_GROWTH)
	(SELECT
src.HK_HUB	
	,src.MD_START_DT	
	,src.MD_HASHDIFF	
	,CURRENT_TIMESTAMP	
	,CONCAT(''||CHAR(39)||JOB_AUDIT_ID||CHAR(39)||'',''''#'''',''||CHAR(39)||JOB_NAME||CHAR(39)||'',''''-'''',''||CHAR(39)||RUN_ID||CHAR(39)||'')
	,src.MD_SOURCE	
	,src.MD_SRC_SYSTEM	
	,src.MD_EXTRACT_DT	
	,src.KPI_DATE	
	,src.NO_OF_ACTIVE_CLIENTS	
	,src.NO_OF_ACTIVE_ACCOUNTS	
	,src.FTE	
	,src.ACCOUNTS_FTE
	,src.ACCOUNTS_FTE_TARGET	
	,src.APPWAY_REGISTRATION	
	,src.APPWAY_REGISTRATION_TARGET	
	,src.NO_OF_CLIENT_ID_REGISTERED	
	,src.PORTAL_REGISTRATION	
	,src.PORTAL_REGISTRATION_TARGET	
	,src.MYPORTFOLIO_TO_NEW_CLIENT	
	,src.E_DELIVERY_PORTFOLIO_STATEMENTS	
	,src.E_DELIVERY_TAX_SLIPS	
	,src.E_DELIVERY_CONFIRMS	
	,src.AVG_E_DELIVERY_REGISTRATION	
	,src.E_DELIVERY_REGISTRATION_TARGET
	,src.RETAIL_YTD_EXPENSES	
	,src.RETAIL_YTD_REVENUES	
	,src.RETAIL_FINANCIAL_EFFICIENCY_RATIO	
	,src.RETAIL_YTD_EXPENSES_TARGET	
	,src.RETAIL_YTD_REVENUES_TARGET	
	,src.RETAIL_EFFICIENCY_RATIO_TARGET	
	,src.CAP_MRKTS_YTD_EXPENSES	
	,src.CAP_MKTS_YTD_REVENUES	
	,src.CAP_MRKTS_EFFICIENCY_RATIO	
	,src.CAP_MRKTS_YTD_EXPENSES_TARGET	
	,src.CAP_MRKTS_YTD_REVENUES_TARGET
	,src.CAP_MRKTS_EFFICIENCY_RATIO_TARGET	
	,src.TOTAL_ASSETS	
	,src.NET_TOTAL_REVENUE	
	,src.NET_TOTAL_REVENUE_TARGET	
	,src.NET_BOND_DESK_REVENUE	
	,src.NET_BOND_DESK_REVENUE_TARGET	
	,src.CAPITAL_MKTS_REVENUE	
	,src.CAPITAL_MKTS_REVENUE_TARGET	
	,src.NET_RETAIL_REVENUE	
	,src.NET_RETAIL_REVENUE_TARGET	
	,src.RECRUITING	
	,src.TERMINATED_ADVISORS
    ,src.ORGANIC_GROWTH
	FROM DB_IAW_''||ENV||''_STG.EXTERNAL_KPI.REF_MASTER_KPI_DATA_IAPW src)'';
EXECUTE IMMEDIATE :DEL_QUERY;
EXECUTE IMMEDIATE :INS_QUERY;
END
';
CREATE OR REPLACE PROCEDURE DB_IAW_#env#_DM.EXTERNAL_KPI.SP_CONV_LOADDM_INVESTIA_STG_TO_DM_MASTER_KPI_DATA_INVESTIA("ENV" VARCHAR(1000), "DATA_START_DATE" VARCHAR(20), "JOB_NAME" VARCHAR(16777216), "JOB_AUDIT_ID" VARCHAR(16777216), "RUN_ID" VARCHAR(16777216))
RETURNS VARCHAR(16777216)
LANGUAGE SQL
EXECUTE AS OWNER
AS '
DECLARE
DEL_QUERY STRING;
INS_QUERY STRING;
BEGIN
DATA_START_DATE :=CHAR(39)||DATA_START_DATE||CHAR(39);
DEL_QUERY := ''DELETE FROM DB_IAW_''||ENV||''_DM.EXTERNAL_KPI.MASTER_KPI_DATA_INVESTIA WHERE MD_START_DT IN (SELECT MD_START_DT FROM DB_IAW_''||ENV||''_STG.EXTERNAL_KPI.REF_MASTER_KPI_DATA_INVESTIA GROUP BY MD_START_DT HAVING COUNT(1)>=1)'';
INS_QUERY := ''
INSERT INTO DB_IAW_''||ENV||''_DM.EXTERNAL_KPI.MASTER_KPI_DATA_INVESTIA(
HK_HUB	
,MD_START_DT	
,MD_CREATION_DT		
,MD_CREATION_AUDIT_ID		
,MD_SOURCE		
,MD_SRC_SYSTEM		
,MD_EXTRACT_DT		
,KPI_DATE		
,NO_CLIENT_ID		
,E_DELIVERY	
,E_DELIVERY_PCT		
,E_DELIVERY_TARGET_PCT		
,PORTAL_REGISTRATION	
,PORTAL_REGISTRATION_PCT		
,PORTAL_REGISTRATION_TARGET		
,FTE		
,CLIENTS_BY_FTE		
,CLIENTS_BY_FTE_TARGET		
,NO_OF_ACCOUNTS		
,ACCOUNTS_BY_FTE		
,ACTUAL_YTD_EXPENSES		
,ACTUAL_YTD_REVENUES	
,EFFICIENCY_RATIO		
,YTD_EXPENSES_TARGET		
,YTD_REVENUES_TARGET		
,EFFICIENCY_RATIO_TARGET		
,AUA_IN_NOMINEE		
,AUA_IN_CLIENT_NAME		
,NO_OF_RPAS_IMPLEMENTED		
,HOURS_SAVED_DUE_TO_RPAS		
,CONTINUOUS_IMPROVEMENT_QUICK_WINS	
,TOTAL_ASSETS		
,ORGANIC_GROWTH		
,TOTAL_REVENUE		
,TOTAL_REVENUE_TARGET		
,RECRUITING	
,TERMINATED_ADVISORS)
	(SELECT
	sat.HK_HUB	
	,TO_DATE(''||DATA_START_DATE||'',''''YYYY-MM-DD'''')	
	,CURRENT_TIMESTAMP	
	,CONCAT(''||CHAR(39)||JOB_AUDIT_ID||CHAR(39)||'',''''#'''',''||CHAR(39)||JOB_NAME||CHAR(39)||'',''''-'''',''||CHAR(39)||RUN_ID||CHAR(39)||'')
	,sat.MD_SOURCE	
	,sat.MD_SRC_SYSTEM	
	,sat.MD_EXTRACT_DT	
	,sat.KPI_DATE	
	,sat.NO_CLIENT_ID	
	,sat.E_DELIVERY	
	,sat.E_DELIVERY_PCT	
	,sat.E_DELIVERY_TARGET_PCT	
	,sat.PORTAL_REGISTRATION
	,sat.PORTAL_REGISTRATION_PCT	
	,sat.PORTAL_REGISTRATION_TARGET	
	,sat.FTE	
	,sat.CLIENTS_BY_FTE	
	,sat.CLIENTS_BY_FTE_TARGET	
	,sat.NO_OF_ACCOUNTS	
	,sat.ACCOUNTS_BY_FTE	
	,sat.ACTUAL_YTD_EXPENSES	
	,sat.ACTUAL_YTD_REVENUES
	,sat.EFFICIENCY_RATIO	
	,sat.YTD_EXPENSES_TARGET	
	,sat.YTD_REVENUES_TARGET	
	,sat.EFFICIENCY_RATIO_TARGET	
	,sat.AUA_IN_NOMINEE	
	,sat.AUA_IN_CLIENT_NAME	
	,sat.NO_OF_RPAS_IMPLEMENTED	
	,sat.HOURS_SAVED_DUE_TO_RPAS	
	,sat.CONTINUOUS_IMPROVEMENT_QUICK_WINS
	,sat.TOTAL_ASSETS	
	,sat.ORGANIC_GROWTH	
	,sat.TOTAL_REVENUE	
	,sat.TOTAL_REVENUE_TARGET	
	,sat.RECRUITING	
	,sat.TERMINATED_ADVISORS
	FROM DB_IAW_''||ENV||''_STG.EXTERNAL_KPI.REF_MASTER_KPI_DATA_INVESTIA sat)'';
EXECUTE IMMEDIATE :DEL_QUERY;
EXECUTE IMMEDIATE :INS_QUERY;
END
';
create or replace schema DB_IAW_#env#_DM.EXTRACTIONS;

create or replace TRANSIENT TABLE DB_IAW_#env#_DM.EXTRACTIONS.WT_COMMISSION_ORGANIC_GROWTH (
	TEAM_RANK NUMBER(18,0),
	TEAM_NAME VARCHAR(512) MASKING POLICY #unknown_policy,
	MONTHLY_NET_ORGANIC_GROWTH_BY_TEAM NUMBER(38,2),
	YTD_NET_ORGANIC_GROWTH_BY_TEAM NUMBER(38,2)
);
CREATE OR REPLACE FILE FORMAT DB_IAW_#env#_DM.EXTRACTIONS.COMMISSION_EXPORT_CSV
	FIELD_DELIMITER = ';'
	COMPRESSION = NONE
;
CREATE OR REPLACE PROCEDURE DB_IAW_#env#_DM.EXTRACTIONS.SP_CONV_COMMISSION_EXTRACT("ENV" VARCHAR(1000), "I_DATA_START_DATE" VARCHAR(1000))
RETURNS VARCHAR(16777216)
LANGUAGE JAVASCRIPT
EXECUTE AS OWNER
AS '

var INS_PRE_QUERY = "CALL DB_IAW_"+ ENV +"_DM.EXTRACTIONS.USP_COMMISSION_ORGANIC_GROWTH(''"+ I_DATA_START_DATE +"'');";
var PATH = "SELECT TO_VARCHAR(''"+ I_DATA_START_DATE +"''::DATE, ''YYYY/MM/DD'');";

   var sql_statement = snowflake.createStatement(
          {
          sqlText: INS_PRE_QUERY
          }
       );
   var result_scan = sql_statement.execute();
   
      var sql_statement = snowflake.createStatement(
          {
          sqlText: PATH
          }
       );
   var result_scan = sql_statement.execute();   
   var op='''';
   while (result_scan.next())  {
       var op = result_scan.getColumnValue(1);
       
       }
   var COPY_QUERY = "COPY INTO  @DATALAKE.OUT/IAPW/"+op+"/COMMISSION_ORGANIC_GROWTH_REPORT.csv FROM DB_IAW_"+ENV+"_DM.EXTRACTIONS.WT_COMMISSION_ORGANIC_GROWTH File_format = (format_name = ''DB_IAW_"+ENV+"_DM.EXTRACTIONS.COMMISSION_EXPORT_CSV'') SINGLE = TRUE OVERWRITE = TRUE;";
   
   var sql_statement = snowflake.createStatement(
          {
          sqlText: COPY_QUERY
          }
       );
   var result_scan = sql_statement.execute();
';
CREATE OR REPLACE PROCEDURE DB_IAW_#env#_DM.EXTRACTIONS.USP_COMMISSION_ORGANIC_GROWTH("p_START_DATE" VARCHAR(10))
RETURNS VARCHAR(10000)
LANGUAGE JAVASCRIPT
EXECUTE AS OWNER
AS '
var vSQLSelectCmd = `
INSERT INTO EXTRACTIONS.WT_COMMISSION_ORGANIC_GROWTH SELECT * FROM (
WITH LatestVersionAdvisors AS (
		SELECT distinct 
			team_name,team_code
		FROM SHARED.DIM_ADVISOR
		WHERE (
            HK_HUB <> ''0''
            AND new_advisor <> 1
			AND team_code <> ''0''
			AND TEAM_NAME <> ''''
			AND team_code IS NOT NULL
            --AND month(md_start_dt) = month(dateadd(months, - 1, to_date(''@START_DATE@'')))
			AND year (md_start_dt) = year(to_date(''@START_DATE@'')) -- Consider only the team members of this year
            )
            OR  (md_end_dt is null and HK_HUB <> ''0'' AND team_code IS NOT NULL)
			qualify row_number() over (partition by team_code order by md_start_dt desc) = 1
		)
	,ThisMonthReport AS (
		SELECT A.TEAM_CODE
			,coalesce(sum(DECODE(FT.CASH_FLOW_TYPE, ''IN FLOW'', FT.GROSS_AMOUNT)), 0) InflowGrossAmt
			,coalesce(sum(DECODE(FT.CASH_FLOW_TYPE, ''OUT FLOW'', FT.GROSS_AMOUNT)), 0) OutflowGrossAmt
			,InflowGrossAmt + OutflowGrossAmt AS NetOrganicGrowth
		FROM SHARED.DIM_ADVISOR A
		JOIN TRANSACTIONS.FACT_TRANSACTIONS FT ON FT.SK_DIM_ADVISORS = A.ID
		WHERE month(FT.TRADE_DATE) = month(dateadd(months, - 1, to_date(''@START_DATE@'')))
			AND year(FT.trade_date) = year(to_date(''@START_DATE@''))
			AND A.new_advisor <> 1
			AND ft.departed_advisor_ind <> 1
		GROUP BY A.TEAM_CODE
		)
	,LastMonthReport AS (
		SELECT
            A.TEAM_CODE
			,coalesce(sum(DECODE(FT.CASH_FLOW_TYPE, ''IN FLOW'', FT.GROSS_AMOUNT)), 0) InflowGrossAmt
			,coalesce(sum(DECODE(FT.CASH_FLOW_TYPE, ''OUT FLOW'', FT.GROSS_AMOUNT)), 0) OutflowGrossAmt
			,InflowGrossAmt + OutflowGrossAmt AS NetOrganicGrowth
		FROM SHARED.DIM_ADVISOR A
		JOIN TRANSACTIONS.FACT_TRANSACTIONS FT ON FT.SK_DIM_ADVISORS = A.ID
		WHERE month(FT.TRADE_DATE) = month(dateadd(months, - 2, to_date(''@START_DATE@'')))
			AND year(FT.trade_date) = year(dateadd(months, - 2, to_date(''@START_DATE@'')))
			AND A.new_advisor <> 1
			AND ft.departed_advisor_ind <> 1
		GROUP BY A.TEAM_CODE
		)
	,YTDReport AS (
		SELECT 
            A.TEAM_CODE
			,coalesce(sum(DECODE(FT.CASH_FLOW_TYPE, ''IN FLOW'', FT.GROSS_AMOUNT)), 0) YTD_Inflow_GrossAmt
			,coalesce(sum(DECODE(FT.CASH_FLOW_TYPE, ''OUT FLOW'', FT.GROSS_AMOUNT)), 0) YTD_Outflow_GrossAmt
			,YTD_Inflow_GrossAmt + YTD_Outflow_GrossAmt AS YTDNetOrganicGrowth
		FROM SHARED.DIM_ADVISOR A
		JOIN TRANSACTIONS.FACT_TRANSACTIONS FT ON FT.SK_DIM_ADVISORS = A.ID
		WHERE month(FT.TRADE_DATE) <= month(dateadd(months, - 1, to_date(''@START_DATE@'')))
			AND year(FT.trade_date) = year(to_date(''@START_DATE@''))
			AND A.new_advisor <> 1
			AND ft.departed_advisor_ind <> 1
		GROUP BY A.TEAM_CODE
		)
	,PrevYTDReport AS (
		SELECT 
            A.TEAM_CODE
			,coalesce(sum(DECODE(FT.CASH_FLOW_TYPE, ''IN FLOW'', FT.GROSS_AMOUNT)), 0) YTD_Inflow_GrossAmt
			,coalesce(sum(DECODE(FT.CASH_FLOW_TYPE, ''OUT FLOW'', FT.GROSS_AMOUNT)), 0) YTD_Outflow_GrossAmt
			,YTD_Inflow_GrossAmt + YTD_Outflow_GrossAmt AS YTDNetOrganicGrowth
		FROM SHARED.DIM_ADVISOR A
		JOIN TRANSACTIONS.FACT_TRANSACTIONS FT ON FT.SK_DIM_ADVISORS = A.ID
		WHERE month(FT.TRADE_DATE) <= month(dateadd(months, - 1, to_date(''@START_DATE@'')))
			AND year(FT.trade_date) = year(dateadd(years, - 1, to_date(''@START_DATE@'')))
			AND A.new_advisor <> 1
			AND ft.departed_advisor_ind <> 1
		GROUP BY A.TEAM_CODE 
		)

SELECT DISTINCT dense_rank() OVER (
		ORDER BY YTD_Net_Organic_Growth_By_Team DESC
		) AS Team_Rank
	,resultat.team_name
	,resultat.Monthly_Net_Organic_Growth_By_Team
	,resultat.YTD_Net_Organic_Growth_By_Team
FROM (
	SELECT
		LTV.TEAM_NAME
		,LTV.TEAM_CODE
		,coalesce(TM.InflowGrossAmt, 0) AS MONTH_IN_FLOW
		,coalesce(TM.OutFlowGrossAmt, 0) AS MONTH_OUT_FLOW
		,coalesce(TM.NetOrganicGrowth, 0) AS Actual_Monthly_Net_Organic_Growth
		,coalesce(LM.NetOrganicGrowth, 0) AS Prev_Monthly_Net_Organic_Growth
		,Actual_Monthly_Net_Organic_Growth - Prev_Monthly_Net_Organic_Growth AS Month_over_Month_growth
		,coalesce(round(((Actual_Monthly_Net_Organic_Growth - Prev_Monthly_Net_Organic_Growth) / nullif(abs(Prev_Monthly_Net_Organic_Growth), 0) * 100), 2), 0) AS Month_over_Month_growth_Percentage
		,coalesce(YTD.YTD_Inflow_GrossAmt, 0) AS YTD_Inflow_GrossAmt
		,coalesce(YTD.YTD_Outflow_GrossAmt, 0) AS YTD_Outflow_GrossAmt
		,coalesce(YTD.YTDNetOrganicGrowth, 0) AS YTD_Net_Organic_Growth
		,coalesce(PYTD.YTDNetOrganicGrowth, 0) AS Previous_YTD_Net_Organic_Growth
		,YTD_Net_Organic_Growth - Previous_YTD_Net_Organic_Growth AS YTD_Period_over_period_growth
		,coalesce(round(((YTD_Net_Organic_Growth - Previous_YTD_Net_Organic_Growth) / nullif(abs(Previous_YTD_Net_Organic_Growth), 0) * 100), 2), 0) AS YTD_Period_over_period_growth_Percentage
		,round(sum(YTD_Net_Organic_Growth) OVER (PARTITION BY LTV.team_name), 2) AS YTD_Net_Organic_Growth_By_Team
		,round(sum(Actual_Monthly_Net_Organic_Growth) OVER (PARTITION BY LTV.team_name), 2) AS Monthly_Net_Organic_Growth_By_Team
	FROM LatestVersionAdvisors LTV
	LEFT JOIN THISMONTHREPORT TM    ON   LTV.TEAM_CODE = TM.TEAM_CODE  
	LEFT JOIN LASTMONTHREPORT LM    ON   LTV.TEAM_CODE = LM.TEAM_CODE  
	LEFT JOIN YTDReport YTD         ON   LTV.TEAM_CODE = YTD.TEAM_CODE  
	LEFT JOIN PREVYTDREPORT PYTD    ON   LTV.TEAM_CODE = PYTD.TEAM_CODE
	) AS resultat
WHERE resultat.YTD_Net_Organic_Growth_By_Team <> 0
	AND COALESCE(resultat.TEAM_CODE,-1) NOT IN (-1,100513,124131)  
ORDER BY Team_Rank
) AS T;
`; 
vSQLSelectCmd = vSQLSelectCmd.replace(/@START_DATE@/g, p_START_DATE);
var selectStatement = snowflake.createStatement({sqlText: vSQLSelectCmd});
var vSQLResult = selectStatement.execute();
return "SUCCESS";
';
CREATE OR REPLACE PROCEDURE DB_IAW_#env#_DM.EXTRACTIONS.USP_EXECUTE_COPY_IF_THIRD_WORKING_DAY("p_PROCESS_DATE" VARCHAR(10), "p_FILE_PATH" VARCHAR(10))
RETURNS VARCHAR(16777216)
LANGUAGE JAVASCRIPT
EXECUTE AS OWNER
AS '
var vSQLCopyIntoCMD =  "COPY INTO @DATALAKE.OUT/IAPW/NBIN/" + p_FILE_PATH + "/COMMISSION_ORGANIC_GROWTH_REPORT.csv"
                       + " FROM (SELECT * FROM EXTRACTIONS.WT_COMMISSION_ORGANIC_GROWTH  ORDER BY TEAM_RANK)"
                        + " File_format = (format_name = ''EXTRACTIONS.COMMISSION_EXPORT_CSV'', ENCODING = ''UTF8'')"
                        + " SINGLE = TRUE header = TRUE OVERWRITE = TRUE ";
var vSQLIfThirdMonthDay = `
SELECT	iff(
			iff(  DAYNAME(date_trunc(''MONTH'', TO_DATE(''@START_DATE@''))) = ''Sat''
                 ,  dateadd(''DAY'', 4, date_trunc(''MONTH'', TO_DATE(TO_DATE(''@START_DATE@''))))
                 ,  iff(  DAYNAME(date_trunc(''MONTH'', TO_DATE(''@START_DATE@''))) = ''Sun''
                        ,   dateadd(''DAY'', 3, date_trunc(''MONTH'', TO_DATE(TO_DATE(''@START_DATE@''))))
                        ,   iff(	DAYNAME(dateadd( ''DAY'' ,2,date_trunc(''MONTH'', TO_DATE(''@START_DATE@'')))) = ''Sat''
	                        ,  	dateadd(''DAY'', 4, date_trunc(''MONTH'', TO_DATE(TO_DATE(''@START_DATE@''))))
	                            ,	iff(	DAYNAME(dateadd(''DAY'',2, date_trunc(''MONTH'', TO_DATE(TO_DATE(''@START_DATE@''))))) = ''Sun''
		                                ,	iff(	DAYNAME(date_trunc(''MONTH'', TO_DATE(''@START_DATE@''))) = ''Fri''
												,	dateadd(''DAY'', 4, date_trunc(''MONTH'', TO_DATE(TO_DATE(''@START_DATE@''))))
												,	dateadd(''DAY'', 3, date_trunc(''MONTH'', TO_DATE(TO_DATE(''@START_DATE@''))))
											)	
		                                ,	dateadd(''DAY'', 2, date_trunc(''MONTH'', TO_DATE(TO_DATE(''@START_DATE@''))))
											
									)
	                        )
					)
            ) = TO_DATE(TO_DATE(''@START_DATE@''))
	     ,	TRUE
	     ,	FALSE
        )
`; 
vSQLIfThirdMonthDay = vSQLIfThirdMonthDay.replace(/@START_DATE@/g, p_PROCESS_DATE);
var vExecuteThirdDay = snowflake.createStatement({sqlText: vSQLIfThirdMonthDay, binds: [p_PROCESS_DATE]});
var vExecuteThirdDay = snowflake.createStatement({sqlText: vSQLIfThirdMonthDay});
var vSQLThirdDayvExecuteCopyIntoResul = vExecuteThirdDay.execute();
vSQLThirdDayvExecuteCopyIntoResul.next();
var vReturnRows = [];
if (vSQLThirdDayvExecuteCopyIntoResul.getColumnValue(1)==true){
        //      Ecexute Sp EXTRACTIONS.USP_COMMISSION_ORGANIC_GROWTH
        var vSQLCallUSPCommision = " CALL  EXTRACTIONS.USP_COMMISSION_ORGANIC_GROWTH (''"+ p_PROCESS_DATE + "'');"
        var vExecuteCallSP = snowflake.createStatement({sqlText: vSQLCallUSPCommision});
        var vExecuteCallSPResul = vExecuteCallSP.execute();
        vExecuteCallSPResul.next();     
        //      rxecute Copy Into DataLake
        var vExecuteCopyInto = snowflake.createStatement({sqlText: vSQLCopyIntoCMD});
        var vExecuteCopyIntoResul = vExecuteCopyInto.execute();
        vExecuteCopyIntoResul.next();
        vReturnRows.push(vExecuteCopyIntoResul.getColumnValue(1));
        return vReturnRows + '' rows exported'';
}
';
create or replace schema DB_IAW_#env#_DM.HOLDINGS;

create or replace TABLE DB_IAW_#env#_DM.HOLDINGS.FACT_HOLDINGS (
	ID NUMBER(38,0) autoincrement COMMENT 'ID of fact holdings',
	HK_LINK VARCHAR(40) COMMENT 'Hash key for the Link',
	MD_START_DT TIMESTAMP_NTZ(9) COMMENT 'Start Date of the image/version',
	MD_CREATION_DT TIMESTAMP_NTZ(9) COMMENT 'Creation Date Time of the occurrence',
	MD_CREATION_AUDIT_ID VARCHAR(1000) COMMENT 'Task execution ID',
	MD_SOURCE VARCHAR(1000) COMMENT 'Represents the source system, file, etc. of the instance',
	MD_SRC_SYSTEM VARCHAR(100) COMMENT 'Source system',
	MD_EXTRACT_DT TIMESTAMP_NTZ(9) COMMENT 'Source extraction date',
	MD_SECURITY_TYPE VARCHAR(1000) COMMENT 'Capabilities for RLS',
	SK_DIM_ACCOUNTS NUMBER(38,0) COMMENT 'Surrogate key of the dimension DIM_ACCOUNTS',
	SK_DIM_MARKETPRODUCTS NUMBER(38,0) COMMENT 'Surrogate key of the dimension DIM_MARKETPRODUCTS',
	SK_DIM_ADVISORS NUMBER(38,0) COMMENT 'Surrogate key of the dimension DIM_ADVISORS',
	SK_DIM_CLIENTS NUMBER(38,0) COMMENT 'Surrogate key of the dimension DIM_CLIENTS',
	SK_DIM_PLANS NUMBER(38,0) COMMENT 'Surrogate key of the dimension DIM_PLANS',
	RR_CD VARCHAR(50) COMMENT 'Advisor RR code',
	PLN_SYSID VARCHAR(1000) COMMENT 'UNIVERIS Plan system Identifier',
	BALANCE_DATE TIMESTAMP_NTZ(9) COMMENT 'BALANCE DATE',
	HOLDING_VALUE NUMBER(38,9) COMMENT 'HOLDING Value',
	AUA NUMBER(38,12) COMMENT 'AUA Value',
	AUM NUMBER(38,12) COMMENT 'AUM Value',
	AUM_CLARINGTON NUMBER(38,12) COMMENT 'AUA CLARINGTON Value',
	AUM_IA NUMBER(38,12) COMMENT 'AUA IA Value',
	CASH_POSITION NUMBER(38,12) COMMENT 'CASH POSITION Value',
	PROGRAM_TYPE VARCHAR(50) COMMENT 'PROGRAM TYPE',
	ACCOUNT_PROGRAM_TYPE VARCHAR(50) COMMENT 'ACCOUNT PROGRAM TYPE',
	ADMINISTRATORY_TYPE VARCHAR(1000) COMMENT 'ADMINISTRATORY TYPE',
	AUA_ACCRUED_INTEREST NUMBER(38,2)
);
create or replace TABLE DB_IAW_#env#_DM.HOLDINGS.WT_FACT_HOLDINGS (
	HK_LINK VARCHAR(40) COMMENT 'Hash key for the Link',
	HK_HUB_CONTRACT VARCHAR(40) COMMENT 'Hash key for CONTRACT',
	HK_HUB_INVESTMENT_PRODUCT_TYPE VARCHAR(40) COMMENT 'Hash key for the REF_MAPPING_PRODUCT_TYPE',
	HK_HUB_PARTY_ROLE_ADVISOR VARCHAR(40) COMMENT 'Hash key for the HUB_PARTY_ROLE_ADVISOR',
	HK_HUB_PARTY_ROLE_ACCOUNT_HOLDER VARCHAR(40) COMMENT 'Hash key for HUB_PARTY_ROLE_ACCOUNT_HOLDER',
	HK_HUB_INVESTMENT_SAVING_PROGRAM_TYPES VARCHAR(40) COMMENT 'Hash key for the REF_INVESTMENT_SAVING_PROGRAM_TYPES',
	MD_START_DT TIMESTAMP_NTZ(9) COMMENT 'Start Date of the image/version',
	MD_SOURCE VARCHAR(1000) COMMENT 'Represents the source system, file, etc. of the instance',
	MD_SRC_SYSTEM VARCHAR(100) COMMENT 'Source system',
	MD_EXTRACT_DT TIMESTAMP_NTZ(9) COMMENT 'Source extraction date',
	MD_SECURITY_TYPE VARCHAR(1000) COMMENT 'Capabilities for RLS',
	SK_DIM_ACCOUNTS NUMBER(38,0) COMMENT 'Surrogate key of the dimension DIM_ACCOUNTS',
	SK_DIM_MARKETPRODUCTS NUMBER(38,0) COMMENT 'Surrogate key of the dimension DIM_MARKETPRODUCTS',
	SK_DIM_ADVISORS NUMBER(38,0) COMMENT 'Surrogate key of the dimension DIM_ADVISORS',
	SK_DIM_CLIENTS NUMBER(38,0) COMMENT 'Surrogate key of the dimension DIM_CLIENTS',
	SK_DIM_PLANS NUMBER(38,0) COMMENT 'Surrogate key of the dimension DIM_PLANS',
	RR_CD VARCHAR(50) COMMENT 'Advisor RR code',
	PLN_SYSID VARCHAR(1000) COMMENT 'UNIVERIS Plan System Identifier',
	BALANCE_DATE TIMESTAMP_NTZ(9) COMMENT 'BALANCE DATE',
	HOLDING_VALUE NUMBER(38,9) COMMENT 'HOLDING Value',
	AUA NUMBER(38,12) COMMENT 'AUA Value',
	AUM NUMBER(38,12) COMMENT 'AUM Value',
	AUM_CLARINGTON NUMBER(38,12) COMMENT 'AUA CLARINGTON Value',
	AUM_IA NUMBER(38,12) COMMENT 'AUA IA Value',
	CASH_POSITION NUMBER(38,12) COMMENT 'CASH POSITION Value',
	PROGRAM_TYPE VARCHAR(50) COMMENT 'PROGRAM TYPE',
	ACCOUNT_PROGRAM_TYPE VARCHAR(50) COMMENT 'ACCOUNT PROGRAM TYPE',
	ADMINISTRATORY_TYPE VARCHAR(1000) COMMENT 'ADMINISTRATORY TYPE',
	AUA_ACCRUED_INTEREST NUMBER(38,2)
);
create or replace view DB_IAW_#env#_DM.HOLDINGS.VW_FACT_HOLDINGS(
	MD_START_DT,
	MD_SRCSYSTEM,
	SK_DIM_ACCOUNTS,
	SK_DIM_MARKETPRODUCTS,
	"Rep code",
	SK_DIM_ADVISORS,
	SK_DIM_CLIENTS,
	PLN_SYSID,
	SK_DIM_PLANS,
	"Balance date",
	"Market value",
	AUA,
	AUM,
	"AUM Clarington",
	"AUM iA",
	"Cash position",
	"Program type",
	"Account program type",
	"Administratory type",
	AUA_ACCRUED_INTEREST
) as 
	SELECT 
	MD_START_DT ,
	MD_SRC_SYSTEM ,
	SK_DIM_ACCOUNTS ,
	SK_DIM_MARKETPRODUCTS ,
	RR_CD ,
	SK_DIM_ADVISORS,
	SK_DIM_CLIENTS,
	PLN_SYSID ,
	SK_DIM_PLANS,
	BALANCE_DATE ,
	HOLDING_VALUE ,
	AUA ,
	AUM ,
	AUM_CLARINGTON ,
	AUM_IA ,
	CASH_POSITION ,
	PROGRAM_TYPE ,
	ACCOUNT_PROGRAM_TYPE ,
	ADMINISTRATORY_TYPE,
AUA_ACCRUED_INTEREST	
	FROM DB_IAW_#env#_DM.HOLDINGS.FACT_HOLDINGS
	WHERE DATE(BALANCE_DATE) >= (SELECT DATE(DATEADD(MONTH, -1,MAX(BALANCE_DATE) ))  FROM HOLDINGS.FACT_HOLDINGS);
create or replace view DB_IAW_#env#_DM.HOLDINGS.VW_INITIAL_LOADING_WT_FACT_HOLDINGS(
	HK_LINK,
	HK_HUB_CONTRACT,
	HK_HUB_INVESTMENT_PRODUCT_TYPE,
	HK_HUB_PARTY_ROLE_ADVISOR,
	HK_HUB_PARTY_ROLE_ACCOUNT_HOLDER,
	HK_HUB_INVESTMENT_SAVING_PROGRAM_TYPES,
	MD_START_DT,
	MD_SOURCE,
	MD_SRC_SYSTEM,
	MD_EXTRACT_DT,
	SK_DIM_ACCOUNTS,
	SK_DIM_MARKETPRODUCTS,
	SK_DIM_ADVISORS,
	SK_DIM_CLIENTS,
	SK_DIM_PLANS,
	RR_CD,
	PLN_SYSID,
	BALANCE_DATE,
	HOLDING_VALUE,
	AUA,
	AUM,
	AUM_CLARINGTON,
	AUM_IA,
	CASH_POSITION,
	PROGRAM_TYPE,
	ACCOUNT_PROGRAM_TYPE,
	ADMINISTRATORY_TYPE,
	AUA_ACCRUED_INTEREST
) as
SELECT
	DB_IAW_#env#_DWH.HOLDINGS_BDV.SAT_LINK_INVESTMENT.HK_LINK,
	DB_IAW_#env#_DWH.HOLDINGS_BDV.LINK_INVESTMENT.HK_HUB_CONTRACT,
	DB_IAW_#env#_DWH.HOLDINGS_BDV.LINK_INVESTMENT.HK_HUB_INVESTMENT_PRODUCT_TYPE,
	DB_IAW_#env#_DWH.HOLDINGS_BDV.LINK_INVESTMENT.HK_HUB_PARTY_ROLE_ADVISOR,
	DB_IAW_#env#_DWH.HOLDINGS_BDV.LINK_INVESTMENT.HK_HUB_PARTY_ROLE_ACCOUNT_HOLDER,
	DB_IAW_#env#_DWH.HOLDINGS_BDV.LINK_INVESTMENT.HK_HUB_INVESTMENT_SAVING_PROGRAM_TYPES,
	DB_IAW_#env#_DWH.HOLDINGS_BDV.SAT_LINK_INVESTMENT.MD_START_DT,
	DB_IAW_#env#_DWH.HOLDINGS_BDV.SAT_LINK_INVESTMENT.MD_SOURCE,
	DB_IAW_#env#_DWH.HOLDINGS_BDV.LINK_INVESTMENT.MD_SRC_SYSTEM,
	DB_IAW_#env#_DWH.HOLDINGS_BDV.LINK_INVESTMENT.MD_EXTRACT_DT,
	CAST(CAST(
	(CASE WHEN SHARED.DIM_ACCOUNTS.ID IS NULL THEN -1
	ELSE SHARED.DIM_ACCOUNTS.ID
END) AS VARCHAR(252)) AS FLOAT) AS SK_DIM_ACCOUNTS,
	CAST(CAST(
	(CASE WHEN SHARED.DIM_FINANCIAL_INSTRUMENTS.ID IS NULL THEN -1
	ELSE SHARED.DIM_FINANCIAL_INSTRUMENTS.ID
END) AS VARCHAR(252)) AS FLOAT) AS SK_DIM_MARKETPRODUCTS,
	CAST(CAST(
	(CASE WHEN SHARED.DIM_ADVISOR.ID IS NULL THEN -1
	ELSE SHARED.DIM_ADVISOR.ID
END) AS VARCHAR(252)) AS FLOAT) AS SK_DIM_ADVISORS,
	CAST(CAST(
	(CASE WHEN SHARED.DIM_CLIENTS.ID IS NULL THEN -1
	ELSE SHARED.DIM_CLIENTS.ID
END) AS VARCHAR(252)) AS FLOAT) AS SK_DIM_CLIENTS,
	CAST(CAST(
	(CASE WHEN SHARED.DIM_PLANS.ID IS NULL THEN -1
	ELSE SHARED.DIM_PLANS.ID
END) AS VARCHAR(251)) AS FLOAT) AS SK_DIM_PLANS,
	DB_IAW_#env#_DWH.HOLDINGS_BDV.SAT_LINK_INVESTMENT.RR_CD,
	DB_IAW_#env#_DWH.HOLDINGS_BDV.SAT_LINK_INVESTMENT.PLN_SYSID,
	DB_IAW_#env#_DWH.HOLDINGS_BDV.SAT_LINK_INVESTMENT.BALANCE_DATE,
	DB_IAW_#env#_DWH.HOLDINGS_BDV.SAT_LINK_INVESTMENT.HOLDING_VALUE,
	DB_IAW_#env#_DWH.HOLDINGS_BDV.SAT_LINK_INVESTMENT.AUA,
	DB_IAW_#env#_DWH.HOLDINGS_BDV.SAT_LINK_INVESTMENT.AUM,
	DB_IAW_#env#_DWH.HOLDINGS_BDV.SAT_LINK_INVESTMENT.AUM_CLARINGTON,
	DB_IAW_#env#_DWH.HOLDINGS_BDV.SAT_LINK_INVESTMENT.AUM_IA,
	DB_IAW_#env#_DWH.HOLDINGS_BDV.SAT_LINK_INVESTMENT.CASH_POSITION,
	DB_IAW_#env#_DWH.HOLDINGS_BDV.SAT_LINK_INVESTMENT.PROGRAM_TYPE,
	DB_IAW_#env#_DWH.HOLDINGS_BDV.SAT_LINK_INVESTMENT.ACCOUNT_PROGRAM_TYPE,
	DB_IAW_#env#_DWH.HOLDINGS_BDV.SAT_LINK_INVESTMENT.ADMINISTRATORY_TYPE,
	DB_IAW_#env#_DWH.HOLDINGS_BDV.SAT_LINK_INVESTMENT.AUA_ACCRUED_INTEREST
FROM
	(SHARED.DIM_ACCOUNTS
RIGHT OUTER JOIN (SHARED.DIM_CLIENTS
RIGHT OUTER JOIN (SHARED.DIM_PLANS
RIGHT OUTER JOIN (SHARED.DIM_ADVISOR
RIGHT OUTER JOIN (SHARED.DIM_FINANCIAL_INSTRUMENTS
RIGHT OUTER JOIN (HOLDINGS.FACT_HOLDINGS
RIGHT OUTER JOIN (DB_IAW_#env#_DWH.HOLDINGS_BDV.LINK_INVESTMENT
INNER JOIN DB_IAW_#env#_DWH.HOLDINGS_BDV.SAT_LINK_INVESTMENT ON
	(DB_IAW_#env#_DWH.HOLDINGS_BDV.SAT_LINK_INVESTMENT.HK_LINK = DB_IAW_#env#_DWH.HOLDINGS_BDV.LINK_INVESTMENT.HK_LINK)) ON
	(DB_IAW_#env#_DWH.HOLDINGS_BDV.LINK_INVESTMENT.HK_LINK = HOLDINGS.FACT_HOLDINGS.HK_LINK)) ON
	(DB_IAW_#env#_DWH.HOLDINGS_BDV.LINK_INVESTMENT.HK_HUB_INVESTMENT_PRODUCT_TYPE = SHARED.DIM_FINANCIAL_INSTRUMENTS.HK_HUB)
	AND ((SHARED.DIM_FINANCIAL_INSTRUMENTS.MD_START_DT <= DB_IAW_#env#_DWH.HOLDINGS_BDV.SAT_LINK_INVESTMENT.MD_START_DT)
		AND ((SHARED.DIM_FINANCIAL_INSTRUMENTS.MD_END_DT > DB_IAW_#env#_DWH.HOLDINGS_BDV.SAT_LINK_INVESTMENT.MD_START_DT)
			OR SHARED.DIM_FINANCIAL_INSTRUMENTS.MD_END_DT IS NULL))) ON
	(DB_IAW_#env#_DWH.HOLDINGS_BDV.LINK_INVESTMENT.HK_HUB_PARTY_ROLE_ADVISOR = SHARED.DIM_ADVISOR.HK_HUB)
	AND ((SHARED.DIM_ADVISOR.MD_START_DT <= DB_IAW_#env#_DWH.HOLDINGS_BDV.SAT_LINK_INVESTMENT.MD_START_DT)
		AND ((SHARED.DIM_ADVISOR.MD_END_DT > DB_IAW_#env#_DWH.HOLDINGS_BDV.SAT_LINK_INVESTMENT.MD_START_DT)
			OR SHARED.DIM_ADVISOR.MD_END_DT IS NULL))) ON
	(DB_IAW_#env#_DWH.HOLDINGS_BDV.LINK_INVESTMENT.HK_HUB_INVESTMENT_SAVING_PROGRAM_TYPES = SHARED.DIM_PLANS.HK_HUB)
	AND ((SHARED.DIM_PLANS.MD_START_DT <= DB_IAW_#env#_DWH.HOLDINGS_BDV.SAT_LINK_INVESTMENT.MD_START_DT)
		AND ((SHARED.DIM_PLANS.MD_END_DT > DB_IAW_#env#_DWH.HOLDINGS_BDV.SAT_LINK_INVESTMENT.MD_START_DT)
			OR SHARED.DIM_PLANS.MD_END_DT IS NULL))) ON
	(DB_IAW_#env#_DWH.HOLDINGS_BDV.LINK_INVESTMENT.HK_HUB_PARTY_ROLE_ACCOUNT_HOLDER = SHARED.DIM_CLIENTS.HK_HUB)
	AND ((SHARED.DIM_CLIENTS.MD_START_DT <= DB_IAW_#env#_DWH.HOLDINGS_BDV.SAT_LINK_INVESTMENT.MD_START_DT)
		AND ((SHARED.DIM_CLIENTS.MD_END_DT > DB_IAW_#env#_DWH.HOLDINGS_BDV.SAT_LINK_INVESTMENT.MD_START_DT)
			OR SHARED.DIM_CLIENTS.MD_END_DT IS NULL))) ON
	(DB_IAW_#env#_DWH.HOLDINGS_BDV.LINK_INVESTMENT.HK_HUB_CONTRACT = SHARED.DIM_ACCOUNTS.HK_HUB)
	AND ((SHARED.DIM_ACCOUNTS.MD_START_DT <= DB_IAW_#env#_DWH.HOLDINGS_BDV.SAT_LINK_INVESTMENT.MD_START_DT)
		AND ((SHARED.DIM_ACCOUNTS.MD_END_DT > DB_IAW_#env#_DWH.HOLDINGS_BDV.SAT_LINK_INVESTMENT.MD_START_DT)
			OR SHARED.DIM_ACCOUNTS.MD_END_DT IS NULL)));
CREATE OR REPLACE PROCEDURE DB_IAW_#env#_DM.HOLDINGS.SP_CONV_LOADDM_BDV_HOLDINGS_TO_DM_WT_FACT_HOLDINGS("ENV" VARCHAR(1000), "I_DATA_START_DATE" VARCHAR(1000))
RETURNS VARCHAR(16777216)
LANGUAGE SQL
EXECUTE AS OWNER
AS '
DECLARE
INS_PRE_DEL STRING;
INS_INSERT STRING;
BEGIN
i_DATA_START_DATE :=CHAR(39)||i_DATA_START_DATE||CHAR(39);
INS_PRE_DEL := ''DELETE FROM DB_IAW_''||ENV||''_DM.HOLDINGS.WT_FACT_HOLDINGS WHERE 1=1'';
INS_INSERT := ''
INSERT INTO DB_IAW_''||ENV||''_DM.HOLDINGS.WT_FACT_HOLDINGS (HK_LINK,HK_HUB_CONTRACT,HK_HUB_INVESTMENT_PRODUCT_TYPE,HK_HUB_PARTY_ROLE_ADVISOR,HK_HUB_PARTY_ROLE_ACCOUNT_HOLDER,HK_HUB_INVESTMENT_SAVING_PROGRAM_TYPES,MD_START_DT,MD_SOURCE,MD_SRC_SYSTEM,MD_EXTRACT_DT,SK_DIM_ACCOUNTS,SK_DIM_MARKETPRODUCTS,SK_DIM_ADVISORS,SK_DIM_CLIENTS,SK_DIM_PLANS,RR_CD,PLN_SYSID,BALANCE_DATE,HOLDING_VALUE,AUA,AUM,AUM_CLARINGTON,AUM_IA,CASH_POSITION,PROGRAM_TYPE,ACCOUNT_PROGRAM_TYPE,ADMINISTRATORY_TYPE,AUA_ACCRUED_INTEREST)
SELECT sat_link.HK_LINK,
link.HK_HUB_CONTRACT,
link.HK_HUB_INVESTMENT_PRODUCT_TYPE,
link.HK_HUB_PARTY_ROLE_ADVISOR,
link.HK_HUB_PARTY_ROLE_ACCOUNT_HOLDER,
link.HK_HUB_INVESTMENT_SAVING_PROGRAM_TYPES,
sat_link.MD_START_DT,
sat_link.MD_SOURCE,
link.MD_SRC_SYSTEM,
link.MD_EXTRACT_DT,
COALESCE(acc.ID,''''-1''''),
COALESCE(prd.ID,''''-1''''),
COALESCE(adv.ID,''''-1''''),
COALESCE(clt.ID,''''-1''''),
COALESCE(pln.ID,''''-1''''),
sat_link.RR_CD,
sat_link.PLN_SYSID,
sat_link.BALANCE_DATE,
sat_link.HOLDING_VALUE,
sat_link.AUA,
sat_link.AUM,
sat_link.AUM_CLARINGTON,
sat_link.AUM_IA,
sat_link.CASH_POSITION,
sat_link.PROGRAM_TYPE,
sat_link.ACCOUNT_PROGRAM_TYPE,
sat_link.ADMINISTRATORY_TYPE,
sat_link.AUA_ACCRUED_INTEREST
FROM DB_IAW_''||ENV||''_DWH.HOLDINGS_BDV.SAT_LINK_INVESTMENT sat_link
JOIN DB_IAW_''||ENV||''_DWH.HOLDINGS_BDV.LINK_INVESTMENT link on sat_link.MD_START_DT = TO_DATE(''||i_DATA_START_DATE||'', ''''YYYY-MM-DD'''') and sat_link.HK_LINK = link.HK_LINK
LEFT JOIN DB_IAW_''||ENV||''_DM.HOLDINGS.FACT_HOLDINGS fact on link.HK_LINK = fact.HK_LINK and fact.HK_LINK is null
LEFT JOIN DB_IAW_''||ENV||''_DM.SHARED.DIM_FINANCIAL_INSTRUMENTS prd on (prd.MD_START_DT <= TO_DATE(''||i_DATA_START_DATE||'', ''''YYYY-MM-DD'''') AND (prd.MD_END_DT> TO_DATE(''||i_DATA_START_DATE||'', ''''YYYY-MM-DD'''') OR (prd.MD_END_DT is null))) AND link.HK_HUB_INVESTMENT_PRODUCT_TYPE = prd.HK_HUB
LEFT JOIN DB_IAW_''||ENV||''_DM.SHARED.DIM_ADVISOR adv on (adv.MD_START_DT <= TO_DATE(''||i_DATA_START_DATE||'', ''''YYYY-MM-DD'''') AND (adv.MD_END_DT> TO_DATE(''||i_DATA_START_DATE||'', ''''YYYY-MM-DD'''') OR (adv.MD_END_DT is null))) and link.HK_HUB_PARTY_ROLE_ADVISOR = adv.HK_HUB
LEFT JOIN DB_IAW_''||ENV||''_DM.SHARED.DIM_PLANS pln on (pln.MD_START_DT <= TO_DATE(''||i_DATA_START_DATE||'', ''''YYYY-MM-DD'''') AND (pln.MD_END_DT> TO_DATE(''||i_DATA_START_DATE||'', ''''YYYY-MM-DD'''') OR (pln.MD_END_DT is null))) and link.HK_HUB_INVESTMENT_SAVING_PROGRAM_TYPES = pln.HK_HUB
LEFT JOIN DB_IAW_''||ENV||''_DM.SHARED.DIM_CLIENTS clt on (clt.MD_START_DT <= TO_DATE(''||i_DATA_START_DATE||'', ''''YYYY-MM-DD'''') AND (clt.MD_END_DT> TO_DATE(''||i_DATA_START_DATE||'', ''''YYYY-MM-DD'''') OR (clt.MD_END_DT is null))) and link.HK_HUB_PARTY_ROLE_ACCOUNT_HOLDER = clt.HK_HUB
LEFT JOIN DB_IAW_''||ENV||''_DM.SHARED.DIM_ACCOUNTS acc on (acc.MD_START_DT <= TO_DATE(''||i_DATA_START_DATE||'', ''''YYYY-MM-DD'''') AND (acc.MD_END_DT> TO_DATE(''||i_DATA_START_DATE||'', ''''YYYY-MM-DD'''') OR (acc.MD_END_DT is null))) and link.HK_HUB_CONTRACT = acc.HK_HUB
              '';
EXECUTE IMMEDIATE :INS_PRE_DEL;
EXECUTE IMMEDIATE :INS_INSERT;
END
';
CREATE OR REPLACE PROCEDURE DB_IAW_#env#_DM.HOLDINGS.SP_CONV_LOADDM_DM_WT_TO_DM_DIM_FACT_REVENUES_INSERT("ENV" VARCHAR(1000), "JOB_NAME" VARCHAR(16777216), "JOB_AUDIT_ID" VARCHAR(16777216), "RUN_ID" VARCHAR(16777216))
RETURNS VARCHAR(16777216)
LANGUAGE JAVASCRIPT
EXECUTE AS OWNER
AS '
DECLARE
INS_QUERY STRING;
BEGIN
INS_QUERY = "INSERT INTO DB_IAW_"+ENV+"_DM.REVENUES.FACT_REVENUE(
HK_LINK,
MD_START_DT,
MD_CREATION_DT,
MD_CREATION_AUDIT_ID,
MD_SOURCE,
MD_SRC_SYSTEM,
MD_EXTRACT_DT,
MD_SECURITY_TYPE,
SK_DIM_CLIENTS,
SK_DIM_ADVISORS,
SK_DIM_PLANS,
SK_DIM_MARKETPRODUCTS,
SK_DIM_ACCOUNTS,
PAYMENT_DATE,
REVENUE_AMOUNT,
REVENUE_TYPE,
REVENUE_SUBTYPE,
AUA)
VALUES(
SELECT 
M.HK_LINK, 
M.MD_START_DT, 
CURRENT_TIMESTAMP(), 
CONCAT("+JOB_AUDIT_ID+",''#'',"+JOB_NAME+","+RUN_ID+"),
M.MD_SOURCE,
M.MD_SRC_SYSTEM,
M.MD_EXTRACT_DT,
M.MD_SECURITY_TYPE,
M.SK_DIM_CLIENTS,
M.SK_DIM_ADVISORS,
M.SK_DIM_PLANS,
M.SK_DIM_MARKETPRODUCTS,
M.SK_DIM_ACCOUNTS,
M.PAYMENT_DATE,
M.REVENUE_AMOUNT,
M.REVENUE_TYPE,
M.REVENUE_SUBTYPE,
M.AUA
FROM DB_IAW_"+ENV+"_DM.REVENUES.WT_FACT_REVENUE M
RIGHT OUTER JOIN DB_IAW_"+ENV+"_DM.REVENUES.FACT_REVENUE D
ON M.HK_LINK = D.HK_LINK
WHERE D.HK_LINK IS NULL);";

EXECUTE IMMEDIATE :INS_QUERY;
END
';
CREATE OR REPLACE PROCEDURE DB_IAW_#env#_DM.HOLDINGS.SP_CONV_LOADDM_DM_WT_TO_DM_FACT_HOLDINGS_INSERT("ENV" VARCHAR(1000), "JOB_NAME" VARCHAR(16777216), "JOB_AUDIT_ID" VARCHAR(16777216), "DATA_START_DATE" VARCHAR(10), "RUN_ID" VARCHAR(16777216))
RETURNS VARCHAR(16777216)
LANGUAGE JAVASCRIPT
EXECUTE AS OWNER
AS '
DECLARE
INS_QUERY STRING;
BEGIN
INS_QUERY = "INSERT INTO DB_IAW_"+ENV+"_DM.HOLDINGS.FACT_HOLDINGS(
HK_LINK,
MD_START_DT,
MD_CREATION_DT,
MD_CREATION_AUDIT_ID,
MD_SOURCE,
MD_SRC_SYSTEM,
MD_EXTRACT_DT,
MD_SECURITY_TYPE,
SK_DIM_ACCOUNTS,
SK_DIM_MARKETPRODUCTS,
SK_DIM_ADVISORS,
SK_DIM_CLIENTS,
SK_DIM_PLANS,
RR_CD,
PLN_SYSID,
BALANCE_DATE,
HOLDING_VALUE,
AUA,
AUM,
AUM_CLARINGTON,
AUM_IA,
CASH_POSITION,
PROGRAM_TYPE,
ACCOUNT_PROGRAM_TYPE,
ADMINISTRATORY_TYPE)
VALUES(
SELECT 
M.HK_LINK, 
TO_DATE("+ DATA_START_DATE +",''YYYY-MM-DD''), 
CURRENT_TIMESTAMP(), 
CONCAT("+JOB_AUDIT_ID+",''#'',"+JOB_NAME+","+RUN_ID+"),
M.MD_SOURCE,
M.MD_SRC_SYSTEM,
M.MD_EXTRACT_DT,
M.MD_SECURITY_TYPE,
M.SK_DIM_ACCOUNTS,
M.SK_DIM_MARKETPRODUCTS,
M.SK_DIM_ADVISORS,
M.SK_DIM_CLIENTS,
M.SK_DIM_PLANS,
M.RR_CD,
M.PLN_SYSID,
M.BALANCE_DATE,
M.HOLDING_VALUE,
M.AUA,
M.AUM,
M.AUM_CLARINGTON,
M.AUM_IA,
M.CASH_POSITION,
M.PROGRAM_TYPE,
M.ACCOUNT_PROGRAM_TYPE,
M.ADMINISTRATORY_TYPE
FROM DB_IAW_"+ENV+"_DM.HOLDINGS.WT_FACT_HOLDINGS M
RIGHT OUTER JOIN DB_IAW_"+ENV+"_DM.HOLDINGS.FACT_HOLDINGS D
ON M.HK_LINK = D.HK_LINK
WHERE D.HK_LINK IS NULL);";
EXECUTE IMMEDIATE :INS_QUERY;
END
';
CREATE OR REPLACE PROCEDURE DB_IAW_#env#_DM.HOLDINGS.SP_CONV_M_FACT_INSERT("INSERT_COLS" VARCHAR(16777216), "SELECT_COLS" VARCHAR(16777216), "SRC_TBL" VARCHAR(16777216), "TGT_TBL" VARCHAR(16777216), "JOB_NAME" VARCHAR(16777216), "JOB_AUDIT_ID" VARCHAR(16777216), "RUN_ID" VARCHAR(16777216))
RETURNS VARCHAR(16777216)
LANGUAGE JAVASCRIPT
EXECUTE AS OWNER
AS '
DECLARE
INS_QUERY STRING;
BEGIN
INS_QUERY = "INSERT INTO "+ TGT_TBL + "(" + INSERT_COLS + ",MD_CREATION_AUDIT_ID)
VALUES(
SELECT 
" +  SELECT_COLS + ",
CONCAT("+JOB_AUDIT_ID+",''#'',"+JOB_NAME+","+RUN_ID+")
FROM "+SRC_TBL+" M
RIGHT OUTER JOIN "+TGT_TBL+" D
ON M.HK_LINK = D.HK_LINK
WHERE D.HK_LINK IS NULL);";
EXECUTE IMMEDIATE :INS_QUERY;
END
';
CREATE OR REPLACE PROCEDURE DB_IAW_#env#_DM.HOLDINGS.SP_CONV_M_LOADDM_BDV_HOLDINGS_TO_DM_WT_FACT_HOLDINGS("ENV" VARCHAR(1000), "DATA_START_DATE" VARCHAR(20))
RETURNS VARCHAR(16777216)
LANGUAGE SQL
EXECUTE AS OWNER
AS '
DECLARE
TRUNC_QUERY STRING;
INS_QUERY STRING;
BEGIN
DATA_START_DATE :=CHAR(39)||DATA_START_DATE||CHAR(39);
TRUNC_QUERY := ''TRUNCATE TABLE DB_IAW_''||ENV||''_DM.HOLDINGS.WT_FACT_HOLDINGS'';
INS_QUERY := ''
INSERT INTO
	DB_IAW_''||ENV||''_DM.HOLDINGS.WT_FACT_HOLDINGS (
		HK_LINK,
		HK_HUB_CONTRACT,
		HK_HUB_INVESTMENT_PRODUCT_TYPE,
		HK_HUB_PARTY_ROLE_ADVISOR,
		HK_HUB_PARTY_ROLE_ACCOUNT_HOLDER,
		HK_HUB_INVESTMENT_SAVING_PROGRAM_TYPES,
		MD_START_DT,
		MD_SOURCE,
		MD_SRC_SYSTEM,
		MD_EXTRACT_DT,
		SK_DIM_ACCOUNTS,
		SK_DIM_MARKETPRODUCTS,
		SK_DIM_ADVISORS,
		SK_DIM_CLIENTS,
		SK_DIM_PLANS,
		RR_CD,
		PLN_SYSID,
		BALANCE_DATE,
		HOLDING_VALUE,
		AUA,
		AUM,
		AUM_CLARINGTON,
		AUM_IA,
		CASH_POSITION,
		PROGRAM_TYPE,
		ACCOUNT_PROGRAM_TYPE,
		ADMINISTRATORY_TYPE )

	(
	SELECT 
	SLI.HK_LINK,
	LI.HK_HUB_CONTRACT,
	LI.HK_HUB_INVESTMENT_PRODUCT_TYPE,
	LI.HK_HUB_PARTY_ROLE_ADVISOR,
	LI.HK_HUB_PARTY_ROLE_ACCOUNT_HOLDER,
	LI.HK_HUB_INVESTMENT_SAVING_PROGRAM_TYPES,
	SLI.MD_START_DT,
	SLI.MD_SOURCE,
	LI.MD_SRC_SYSTEM,
	LI.MD_EXTRACT_DT,
	CASE WHEN DAC.ID IS NULL THEN ''''-1'''' ELSE DAC.ID END AS O_ACNT_ID,
	CASE WHEN DFI.ID IS NULL THEN ''''-1'''' ELSE DFI.ID END AS O_PRODUCT_ID,
	CASE WHEN DA.ID IS NULL THEN ''''-1'''' ELSE DA.ID END AS O_ADV_ID,
	CASE WHEN DC.ID IS NULL THEN ''''-1'''' ELSE DC.ID END AS O_CLIENT_ID,
	CASE WHEN DP.ID IS NULL THEN ''''-1'''' ELSE DP.ID END AS O_PLAN_ID,
	SLI.RR_CD,
	SLI.PLN_SYSID,
	SLI.BALANCE_DATE,
	SLI.HOLDING_VALUE,
	SLI.AUA,
	SLI.AUM,
	SLI.AUM_CLARINGTON,
	SLI.AUM_IA,
	SLI.CASH_POSITION,
	SLI.PROGRAM_TYPE,
	SLI.ACCOUNT_PROGRAM_TYPE,
	SLI.ADMINISTRATORY_TYPE
	FROM DB_IAW_''||ENV||''_DWH.HOLDINGS_BDV.SAT_LINK_INVESTMENT SLI 
	JOIN DB_IAW_''||ENV||''_DWH.HOLDINGS_BDV.LINK_INVESTMENT LI
	ON SLI.HK_LINK = LI.HK_LINK 
	JOIN DB_IAW_''||ENV||''_DM.HOLDINGS.FACT_HOLDINGS FH
	ON LI.HK_LINK = FH.HK_LINK
	RIGHT OUTER JOIN DB_IAW_''||ENV||''_DM.SHARED.DIM_FINANCIAL_INSTRUMENTS DFI
	ON LI.HK_HUB_INVESTMENT_PRODUCT_TYPE = DFI.HK_HUB
	RIGHT OUTER JOIN DB_IAW_''||ENV||''_DM.SHARED.DIM_ADVISOR DA
	ON LI.HK_HUB_PARTY_ROLE_ADVISOR = DA.HK_HUB
	RIGHT OUTER JOIN DB_IAW_''||ENV||''_DM.SHARED.DIM_PLANS DP
	ON LI.HK_HUB_INVESTMENT_SAVING_PROGRAM_TYPES = DP.HK_HUB
	RIGHT OUTER JOIN DB_IAW_''||ENV||''_DM.SHARED.DIM_CLIENTS DC
	ON LI.HK_HUB_PARTY_ROLE_ACCOUNT_HOLDER = DC.HK_HUB
	RIGHT OUTER JOIN DB_IAW_''||ENV||''_DM.SHARED.DIM_ACCOUNTS DAC
	ON LI.HK_HUB_CONTRACT = DAC.HK_HUB
	WHERE 
	SLI.MD_START_DT = TO_DATE(''||DATA_START_DATE||'',''''YYYY-MM-DD'''') 
	AND FH.HK_LINK IS NULL
	AND (DFI.MD_START_DT <= TO_DATE(''||DATA_START_DATE||'',''''YYYY-MM-DD'''') AND (DFI.MD_END_DT> TO_DATE(''||DATA_START_DATE||'',''''YYYY-MM-DD'''') OR DFI.MD_END_DT IS NULL))
	AND (DA.MD_START_DT <= TO_DATE(''||DATA_START_DATE||'',''''YYYY-MM-DD'''') AND (DA.MD_END_DT> TO_DATE(''||DATA_START_DATE||'',''''YYYY-MM-DD'''') OR DA.MD_END_DT IS NULL))
	AND (DP.MD_START_DT <= TO_DATE(''||DATA_START_DATE||'',''''YYYY-MM-DD'''') AND (DP.MD_END_DT> TO_DATE(''||DATA_START_DATE||'',''''YYYY-MM-DD'''') OR DP.MD_END_DT IS NULL))
	AND (DC.MD_START_DT <= TO_DATE(''||DATA_START_DATE||'',''''YYYY-MM-DD'''') AND (DC.MD_END_DT> TO_DATE(''||DATA_START_DATE||'',''''YYYY-MM-DD'''') OR DC.MD_END_DT IS NULL))
	AND (DAC.MD_START_DT <= TO_DATE(''||DATA_START_DATE||'',''''YYYY-MM-DD'''') AND (DAC.MD_END_DT> TO_DATE(''||DATA_START_DATE||'',''''YYYY-MM-DD'''') OR DAC.MD_END_DT IS NULL)))
              '';
EXECUTE IMMEDIATE :TRUNC_QUERY;
EXECUTE IMMEDIATE :INS_QUERY;
END
';
create or replace schema DB_IAW_#env#_DM.PUBLIC;

create or replace schema DB_IAW_#env#_DM.RECONCILIATION;

create or replace TABLE DB_IAW_#env#_DM.RECONCILIATION.RECONCILE_RESULTS (
	NAME VARCHAR(1000),
	MD_START_DT TIMESTAMP_NTZ(9),
	MD_CREATION_DT TIMESTAMP_NTZ(9),
	MD_CREATION_AUDIT_ID VARCHAR(1000),
	RESULT VARCHAR(2),
	DESCRIPTION VARCHAR(1000),
	DETAILS VARCHAR(200000)
);
create or replace TABLE DB_IAW_#env#_DM.RECONCILIATION.RECONCILE_RULE_ENGINE (
	NAME VARCHAR(1000) COMMENT '[VERIFICATION LAYER]_[DATA ENTITY]_[VALIDATION]',
	MD_START_DT TIMESTAMP_NTZ(9),
	MD_END_DT TIMESTAMP_NTZ(9),
	MD_CREATION_DT TIMESTAMP_NTZ(9),
	MD_MODIFY_DT TIMESTAMP_NTZ(9),
	DESCRIPTION VARCHAR(5000) COMMENT 'validation',
	QUERY VARCHAR(200000) COMMENT 'INSERT SELECT INTO DB_IAW_#env#_DM.VALIDATIONS.RECON_RESULTS TABLE'
);
CREATE OR REPLACE PROCEDURE DB_IAW_#env#_DM.RECONCILIATION.SP_CONV_RECONCILIATION("ENV" VARCHAR(1000), "AUDIT_ID" VARCHAR(1000), "IO_DATA_START_DATE" VARCHAR(1000), "IO_NAME" VARCHAR(1000), "IO_PATTERN" VARCHAR(1000))
RETURNS VARCHAR(16777216)
LANGUAGE SQL
EXECUTE AS OWNER
AS '
DECLARE
INS_PRE_DEL STRING;
INS_CALL STRING;
BEGIN
IO_DATA_START_DATE :=CHAR(39)||IO_DATA_START_DATE||CHAR(39);
INS_PRE_DEL := ''DELETE FROM DB_IAW_''||ENV||''_DM.RECONCILIATION.RECONCILE_RESULTS WHERE MD_START_DT = to_date(''||IO_DATA_START_DATE||'') AND NAME LIKE COALESCE(''''%''||IO_PATTERN||''%'''', ''''''||IO_NAME||'''''')'';
INS_CALL := ''CALL DB_IAW_''||ENV||''_DM.RECONCILIATION.USP_RECONCILE_CHECK(''''''||IO_NAME||'''''', ''||IO_DATA_START_DATE||'', ''''''||AUDIT_ID||'''''', ''''''||IO_PATTERN||'''''')'';
EXECUTE IMMEDIATE :INS_PRE_DEL;
EXECUTE IMMEDIATE :INS_CALL;

END
';
CREATE OR REPLACE PROCEDURE DB_IAW_#env#_DM.RECONCILIATION.USP_RECONCILE_CHECK("pNAME" VARCHAR(1000), "pDATA_START_DT" VARCHAR(20), "pAUDIT_ID" VARCHAR(1000), "pUSE_PATTERN" VARCHAR(10))
RETURNS VARCHAR(5000)
LANGUAGE JAVASCRIPT
EXECUTE AS OWNER
AS '
var vExceptionId;
var vExceptionMsg;
var vSQLExcpCmd;

//Stage 1: Check the Arguments Signature are Valid for the process to continue.
if ( pNAME.length <= 0 || pDATA_START_DT.length <= 0 || pAUDIT_ID.length <= 0 )
{
vExceptionId = "EXCEPTION:-1";
vExceptionMsg = " Signature Argument Missing";
return vExceptionId + "-" + vExceptionMsg;
}

//Stage 2: Compose the string based on Use Pattern
var vSQLCmd;
if ( pUSE_PATTERN==null )
{
vSQLCmd = " SELECT NAME, DESCRIPTION, QUERY FROM DB_IAW_#env#_DM.RECONCILIATION.RECONCILE_RULE_ENGINE WHERE NAME = ''" + pNAME + "'' AND MD_END_DT IS NULL ";
}
else
{
vSQLCmd = " SELECT NAME, DESCRIPTION, QUERY FROM DB_IAW_#env#_DM.RECONCILIATION.RECONCILE_RULE_ENGINE WHERE NAME LIKE ''%" + pUSE_PATTERN + "%'' AND MD_END_DT IS NULL ";
}
pUSE_PATTERN="N/A";

//Stage 3: Get the Rule query from the table object.
var vSQLStmt = snowflake.createStatement( { sqlText: vSQLCmd } );
var vSQLResult = vSQLStmt.execute();
var vName;

while (vSQLResult.next())
{
//try {
vName = vSQLResult.getColumnValue(1);
var desc = vSQLResult.getColumnValue(2);
var query = vSQLResult.getColumnValue(3); 	

//Stage 3: Search and replace place holder for Audit and Data Start Date.
query = query.replace(/@NAME@/g, vName);
query = query.replace(/@DATA_START_DT@/g, pDATA_START_DT);
query = query.replace(/@AUDIT_ID@/g,pAUDIT_ID); 
// Line Feed and CR elimination 
// If comments needs in query for rule engine use /* */ Do not use the -- comment style.
query = query.replace(/\\r/g," ");
query = query.replace(/\\n/g," ");

//Stage 4: Query fetched will be used to be executed for the final results.
var vSQLCmd2 = query;
var vSQLStmt2 = snowflake.createStatement( { sqlText: vSQLCmd2 } );
var vSQLResult2 = vSQLStmt2.execute();
//}
//catch(err)
//{
//vExceptionId = "-99";
//vExceptionMsg = " Fetch While Loop Not Successful" + "  Query Statement: " + vName + err;
//return err;
//}
}

vExceptionId = "EXCEPTION:0";
vExceptionMsg = " " + pNAME + " " + pDATA_START_DT + " With Pattern if Any  "  + pUSE_PATTERN +  " Successful";
return vExceptionId + "-" + vExceptionMsg;
';
create or replace schema DB_IAW_#env#_DM.REVENUES;

create or replace TABLE DB_IAW_#env#_DM.REVENUES.FACT_REVENUE (
	ID NUMBER(38,0) autoincrement COMMENT 'Surrogate key of the dimension',
	HK_LINK VARCHAR(40) COMMENT 'Hash key for the Link',
	MD_START_DT TIMESTAMP_NTZ(9) COMMENT 'Start Date of the image/version',
	MD_CREATION_DT TIMESTAMP_NTZ(9) COMMENT 'Creation Date Time of the occurrence',
	MD_CREATION_AUDIT_ID VARCHAR(1000) COMMENT 'Task execution ID',
	MD_SOURCE VARCHAR(1000) COMMENT 'Represents the source system, file, etc. of the instance',
	MD_SRC_SYSTEM VARCHAR(100) COMMENT 'Source system',
	MD_EXTRACT_DT TIMESTAMP_NTZ(9) COMMENT 'Source extraction date',
	MD_SECURITY_TYPE VARCHAR(1000) COMMENT 'Capabilities for RLS',
	SK_DIM_CLIENTS NUMBER(38,0) COMMENT 'Surrogate key of the dimension DIM_CLIENTS',
	SK_DIM_ADVISORS NUMBER(38,0) COMMENT 'Surrogate key of the dimension DIM_ADVISORS',
	SK_DIM_PLANS NUMBER(38,0) COMMENT 'Surrogate key of the dimension DIM_PLANS',
	SK_DIM_MARKETPRODUCTS NUMBER(38,0) COMMENT 'Surrogate key of the dimension DIM_MARKETPRODUCTS',
	SK_DIM_ACCOUNTS NUMBER(38,0) COMMENT 'Surrogate key of the dimension DIM_ACCOUNTS',
	PAYMENT_DATE TIMESTAMP_NTZ(9) COMMENT 'PAYMENT Date',
	REVENUE_AMOUNT NUMBER(38,12) COMMENT 'REVENUE AMOUNT',
	REVENUE_TYPE VARCHAR(512) COMMENT 'REVENUE TYPE',
	REVENUE_SUBTYPE VARCHAR(512) COMMENT 'REVENUE SUBTYPE',
	AUA NUMBER(38,12) COMMENT 'AUA Value',
	INSURANCE_REVENUE NUMBER(38,12) COMMENT 'Insurance Revenues'
);

create or replace TABLE DB_IAW_#env#_DM.REVENUES.WT_FACT_REVENUE (
	HK_LINK VARCHAR(40) COMMENT 'Hash key for the Link',
	MD_START_DT TIMESTAMP_NTZ(9) COMMENT 'Start Date of the image/version',
	MD_SOURCE VARCHAR(1000) COMMENT 'Represents the source system, file, etc. of the instance',
	MD_SRC_SYSTEM VARCHAR(100) COMMENT 'Source system',
	MD_EXTRACT_DT TIMESTAMP_NTZ(9) COMMENT 'Source extraction date',
	MD_SECURITY_TYPE VARCHAR(1000) COMMENT 'Capabilities for RLS',
	HK_HUB_PARTY_ROLE_ACCOUNT_HOLDER VARCHAR(40) COMMENT 'Hash key HUB_PARTY_ROLE_ACCOUNT_HOLDER',
	HK_HUB_PARTY_ROLE_ADVISOR VARCHAR(40) COMMENT 'Hash key for HUB_REGISTERED_REPRESENTATIVE_COMMISSION',
	HK_HUB_REF_INVESTMENT_SAVING_PROGRAM_TYPES VARCHAR(40) COMMENT 'Hash key for REF_INVESTMENT_SAVING_PROGRAM_TYPES',
	HK_HUB_INVESTMENT_PRODUCT_TYPE VARCHAR(40) COMMENT 'Hash key for REF_MAPPING_PRODUCT_TYPE',
	HK_HUB_CONTRACT VARCHAR(40) COMMENT 'Hash key for HUB_CONTRACT',
	SK_DIM_CLIENTS NUMBER(38,0) COMMENT 'Surrogate key of the dimension DIM_CLIENTS',
	SK_DIM_ADVISORS NUMBER(38,0) COMMENT 'Surrogate key of the dimension DIM_ADVISORS',
	SK_DIM_PLANS NUMBER(38,0) COMMENT 'Surrogate key of the dimension DIM_PLANS',
	SK_DIM_MARKETPRODUCTS NUMBER(38,0) COMMENT 'Surrogate key of the dimension DIM_MARKETPRODUCTS',
	SK_DIM_ACCOUNTS NUMBER(38,0) COMMENT 'Surrogate key of the dimension DIM_ACCOUNTS',
	PAYMENT_DATE TIMESTAMP_NTZ(9) COMMENT 'Process Date',
	REVENUE_AMOUNT NUMBER(38,12) COMMENT 'REVENUE AMOUNT',
	REVENUE_TYPE VARCHAR(512) COMMENT 'REVENUE TYPE',
	REVENUE_SUBTYPE VARCHAR(512) COMMENT 'REVENUE SUBTYPE',
	AUA NUMBER(38,12) COMMENT 'AUA Value',
	INSURANCE_REVENUE NUMBER(38,12) COMMENT 'Insurance Revenues'
);
create or replace view DB_IAW_#env#_DM.REVENUES.VW_FACT_REVENUES(
	MD_SRCSYSTEM,
	SK_DIM_ACCOUNTS,
	SK_DIM_MARKETPRODUCTS,
	SK_ADVISORS,
	SK_DIM_CLIENTS,
	SK_DIM_PLANS,
	"Payment date",
	"Revenue type",
	"Revenue amount",
	REVENUE_SUBTYPE,
	AUA,
	"Insurance revenue"
) as 
SELECT  
	MD_SRC_SYSTEM ,
	SK_DIM_ACCOUNTS ,
	SK_DIM_MARKETPRODUCTS ,
	SK_DIM_ADVISORS ,
	SK_DIM_CLIENTS ,
	SK_DIM_PLANS ,
	PAYMENT_DATE ,
	REVENUE_TYPE ,
	REVENUE_AMOUNT ,
	REVENUE_SUBTYPE ,
	AUA,
	INSURANCE_REVENUE
FROM REVENUES.FACT_REVENUE
WHERE DATE(PAYMENT_DATE) >= (SELECT DATE(DATEADD(YEAR, -2,MAX(PAYMENT_DATE) ))  FROM REVENUES.FACT_REVENUE) 
order by SK_DIM_MARKETPRODUCTS,SK_DIM_ADVISORS,SK_DIM_CLIENTS,SK_DIM_PLANS,REVENUE_TYPE;
create or replace view DB_IAW_#env#_DM.REVENUES.VW_INITIAL_LOADING_WT_FACT_REVENUES(
	HK_LINK,
	MD_START_DT,
	MD_SRC_SYSTEM,
	MD_EXTRACT_DT,
	MD_SOURCE,
	HK_HUB_PARTY_ROLE_ACCOUNT_HOLDER,
	HK_HUB_PARTY_ROLE_ADVISOR,
	HK_HUB_REF_INVESTMENT_SAVING_PROGRAM_TYPES,
	HK_HUB_INVESTMENT_PRODUCT_TYPE,
	HK_HUB_CONTRACT,
	SK_DIM_CLIENTS,
	SK_DIM_ADVISORS,
	SK_DIM_PLANS,
	SK_DIM_MARKETPRODUCTS,
	SK_DIM_ACCOUNTS,
	PAYMENT_DATE,
	REVENUE,
	REVENUE_TYPE,
	REVENUE_SUBTYPE,
	INSURANCE_REVENUE
) as
SELECT
    -- Add a column HK_LINK--
    DB_IAW_#env#_DWH.REVENUES_BDV.LINK_REVENUE.HK_LINK,
	DB_IAW_#env#_DWH.REVENUES_BDV.LINK_REVENUE.MD_START_DT,
	DB_IAW_#env#_DWH.REVENUES_BDV.LINK_REVENUE.MD_SRC_SYSTEM,
	DB_IAW_#env#_DWH.REVENUES_BDV.LINK_REVENUE.MD_EXTRACT_DT,
	DB_IAW_#env#_DWH.REVENUES_BDV.LINK_REVENUE.MD_SOURCE,
	DB_IAW_#env#_DWH.REVENUES_BDV.LINK_REVENUE.HK_HUB_PARTY_ROLE_ACCOUNT_HOLDER,
	DB_IAW_#env#_DWH.REVENUES_BDV.LINK_REVENUE.HK_HUB_PARTY_ROLE_ADVISOR,
	DB_IAW_#env#_DWH.REVENUES_BDV.LINK_REVENUE.HK_HUB_REF_INVESTMENT_SAVING_PROGRAM_TYPES,
	DB_IAW_#env#_DWH.REVENUES_BDV.LINK_REVENUE.HK_HUB_INVESTMENT_PRODUCT_TYPE,
	DB_IAW_#env#_DWH.REVENUES_BDV.LINK_REVENUE.HK_HUB_CONTRACT,
	CAST(CAST(
	(CASE WHEN SHARED.DIM_CLIENTS.ID IS NULL THEN -1
	ELSE SHARED.DIM_CLIENTS.ID
END) AS VARCHAR(252)) AS FLOAT) SK_DIM_CLIENTS,
	CAST(CAST(
	(CASE WHEN SHARED.DIM_ADVISOR.ID IS NULL THEN -1
	ELSE SHARED.DIM_ADVISOR.ID
END) AS VARCHAR(252)) AS FLOAT) AS SK_DIM_ADVISORS,
	CAST(CAST(
	(CASE WHEN SHARED.DIM_PLANS.ID IS NULL THEN -1
	ELSE SHARED.DIM_PLANS.ID
END) AS VARCHAR(251)) AS FLOAT) AS SK_DIM_PLANS,
	CAST(CAST(
	(CASE WHEN SHARED.DIM_FINANCIAL_INSTRUMENTS.ID IS NULL THEN -1
	ELSE SHARED.DIM_FINANCIAL_INSTRUMENTS.ID
END) AS VARCHAR(252)) AS FLOAT) AS SK_DIM_MARKETPRODUCTS,
	CAST(CAST(
	(CASE WHEN SHARED.DIM_ACCOUNTS.ID IS NULL THEN -1
	ELSE SHARED.DIM_ACCOUNTS.ID
END) AS VARCHAR(252)) AS FLOAT) AS SK_DIM_ACCOUNTS,
	DB_IAW_#env#_DWH.REVENUES_BDV.LINK_REVENUE.PAYMENT_DATE,
	DB_IAW_#env#_DWH.REVENUES_BDV.LINK_REVENUE.REVENUE,
	DB_IAW_#env#_DWH.REVENUES_BDV.LINK_REVENUE.REVENUE_TYPE,
	DB_IAW_#env#_DWH.REVENUES_BDV.LINK_REVENUE.REVENUE_SUBTYPE,
	DB_IAW_#env#_DWH.REVENUES_BDV.LINK_REVENUE.INSURANCE_REVENUE
FROM
	(SHARED.DIM_ACCOUNTS
RIGHT OUTER JOIN (SHARED.DIM_CLIENTS
RIGHT OUTER JOIN (SHARED.DIM_PLANS
RIGHT OUTER JOIN (SHARED.DIM_ADVISOR
RIGHT OUTER JOIN (SHARED.DIM_FINANCIAL_INSTRUMENTS
RIGHT OUTER JOIN DB_IAW_#env#_DWH.REVENUES_BDV.LINK_REVENUE ON
	(DB_IAW_#env#_DWH.REVENUES_BDV.LINK_REVENUE.HK_HUB_INVESTMENT_PRODUCT_TYPE = SHARED.DIM_FINANCIAL_INSTRUMENTS.HK_HUB)
	AND ((SHARED.DIM_FINANCIAL_INSTRUMENTS.MD_START_DT <= DB_IAW_#env#_DWH.REVENUES_BDV.LINK_REVENUE.MD_START_DT)
		AND ((SHARED.DIM_FINANCIAL_INSTRUMENTS.MD_END_DT > DB_IAW_#env#_DWH.REVENUES_BDV.LINK_REVENUE.MD_START_DT)
			OR SHARED.DIM_FINANCIAL_INSTRUMENTS.MD_END_DT IS NULL))) ON
	(DB_IAW_#env#_DWH.REVENUES_BDV.LINK_REVENUE.HK_HUB_PARTY_ROLE_ADVISOR = SHARED.DIM_ADVISOR.HK_HUB)
	AND ((SHARED.DIM_ADVISOR.MD_START_DT <= DB_IAW_#env#_DWH.REVENUES_BDV.LINK_REVENUE.MD_START_DT)
		AND ((SHARED.DIM_ADVISOR.MD_END_DT > DB_IAW_#env#_DWH.REVENUES_BDV.LINK_REVENUE.MD_START_DT)
			OR SHARED.DIM_ADVISOR.MD_END_DT IS NULL))) ON
	(DB_IAW_#env#_DWH.REVENUES_BDV.LINK_REVENUE.HK_HUB_REF_INVESTMENT_SAVING_PROGRAM_TYPES = SHARED.DIM_PLANS.HK_HUB)
	AND ((SHARED.DIM_PLANS.MD_START_DT <= DB_IAW_#env#_DWH.REVENUES_BDV.LINK_REVENUE.MD_START_DT)
		AND ((SHARED.DIM_PLANS.MD_END_DT > DB_IAW_#env#_DWH.REVENUES_BDV.LINK_REVENUE.MD_START_DT)
			OR SHARED.DIM_PLANS.MD_END_DT IS NULL))) ON
	(DB_IAW_#env#_DWH.REVENUES_BDV.LINK_REVENUE.HK_HUB_PARTY_ROLE_ACCOUNT_HOLDER = SHARED.DIM_CLIENTS.HK_HUB)
	AND ((SHARED.DIM_CLIENTS.MD_START_DT <= DB_IAW_#env#_DWH.REVENUES_BDV.LINK_REVENUE.MD_START_DT)
		AND ((SHARED.DIM_CLIENTS.MD_END_DT > DB_IAW_#env#_DWH.REVENUES_BDV.LINK_REVENUE.MD_START_DT)
			OR SHARED.DIM_CLIENTS.MD_END_DT IS NULL))) ON
	(DB_IAW_#env#_DWH.REVENUES_BDV.LINK_REVENUE.HK_HUB_CONTRACT = SHARED.DIM_ACCOUNTS.HK_HUB)
	AND ((SHARED.DIM_ACCOUNTS.MD_START_DT <= DB_IAW_#env#_DWH.REVENUES_BDV.LINK_REVENUE.MD_START_DT)
		AND ((SHARED.DIM_ACCOUNTS.MD_END_DT > DB_IAW_#env#_DWH.REVENUES_BDV.LINK_REVENUE.MD_START_DT)
			OR SHARED.DIM_ACCOUNTS.MD_END_DT IS NULL)));
CREATE OR REPLACE PROCEDURE DB_IAW_#env#_DM.REVENUES.SP_CONV_LOADDM_BDV_HOLDINGS_TO_DM_WT_FACT_HOLDINGS("ENV" VARCHAR(1000), "DATA_START_DATE" VARCHAR(10))
RETURNS VARCHAR(16777216)
LANGUAGE JAVASCRIPT
EXECUTE AS OWNER
AS '
DECLARE
TRUNC_QUERY STRING;
INS_QUERY STRING;
UPD_QUERY STRING;
BEGIN
TRUNC_QUERY := "TRUNCATE TABLE DB_IAW_"+ENV+"_DM.HOLDINGS.WT_FACT_HOLDINGS;";
INS_QUERY := "
INSERT INTO
	DB_IAW_"+ENV+"_DM.HOLDINGS.WT_FACT_HOLDINGS (
		HK_LINK,
		HK_HUB_CONTRACT,
		HK_HUB_INVESTMENT_PRODUCT_TYPE,
		HK_HUB_PARTY_ROLE_ADVISOR,
		HK_HUB_PARTY_ROLE_ACCOUNT_HOLDER,
		HK_HUB_INVESTMENT_SAVING_PROGRAM_TYPES,
		MD_START_DT,
		MD_SOURCE,
		MD_SRC_SYSTEM,
		MD_EXTRACT_DT,
		MD_SECURITY_TYPE,
		SK_DIM_ACCOUNTS,
		SK_DIM_MARKETPRODUCTS,
		SK_DIM_ADVISORS,
		SK_DIM_CLIENTS,
		SK_DIM_PLANS,
		RR_CD,
		PLN_SYSID,
		BALANCE_DATE,
		HOLDING_VALUE,
		AUA,
		AUM,
		AUM_CLARINGTON,
		AUM_IA,
		CASH_POSITION,
		PROGRAM_TYPE,
		ACCOUNT_PROGRAM_TYPE,
		ADMINISTRATORY_TYPE )
VALUES
	(
	SELECT 
	SLI.HK_LINK,
	LI.HK_HUB_CONTRACT,
	LI.HK_HUB_INVESTMENT_PRODUCT_TYPE,
	LI.HK_HUB_PARTY_ROLE_ADVISOR,
	LI.HK_HUB_PARTY_ROLE_ACCOUNT_HOLDER,
	LI.HK_HUB_INVESTMENT_SAVING_PROGRAM_TYPES,
	SLI.MD_START_DT,
	SLI.MD_SOURCE,
	LI.MD_SRC_SYSTEM,
	LI.MD_EXTRACT_DT,
	CASE WHEN DAC.ID IS NULL THEN ''-1'' ELSE DAC.ID END AS O_ACNT_ID,
	CASE WHEN DFI.ID IS NULL THEN ''-1'' ELSE DFI.ID END AS O_PRODUCT_ID,
	CASE WHEN DA.ID IS NULL THEN ''-1'' ELSE DA.ID END AS O_ADV_ID,
	CASE WHEN DC.ID IS NULL THEN ''-1'' ELSE DC.ID END AS O_CLIENT_ID,
	CASE WHEN DP.ID IS NULL THEN ''-1'' ELSE DP.ID END AS O_PLAN_ID,
	SLI.RR_CD,
	SLI.PLN_SYSID,
	SLI.BALANCE_DATE,
	SLI.HOLDING_VALUE,
	SLI.AUA,
	SLI.AUM,
	SLI.AUM_CLARINGTON,
	SLI.AUM_IA,
	SLI.CASH_POSITION,
	SLI.PROGRAM_TYPE,
	SLI.ACCOUNT_PROGRAM_TYPE,
	SLI.ADMINISTRATORY_TYPE
	FROM DB_IAW_"+ENV+"_DWH.HOLDINGS_BDV.SAT_LINK_INVESTMENT SLI 
	JOIN DB_IAW_"+ENV+"_DWH.HOLDINGS_BDV.LINK_INVESTMENT LI
	ON SLI.HK_LINK = LI.HK_LINK 
	JOIN DB_IAW_"+ENV+"_DM.HOLDINGS.FACT_HOLDINGS FH
	ON LI.HK_LINK = FH.HK_LINK
	RIGHT OUTER JOIN DB_IAW_"+ENV+"_DM.SHARED.DIM_FINANCIAL_INSTRUMENTS DFI
	ON LI.HK_HUB_INVESTMENT_PRODUCT_TYPE = DFI.HK_HUB
	RIGHT OUTER JOIN DB_IAW_"+ENV+"_DM.SHARED.DIM_ADVISOR DA
	ON LI.HK_HUB_PARTY_ROLE_ADVISOR = DA.HK_HUB
	RIGHT OUTER JOIN DB_IAW_"+ENV+"_DM.SHARED.DIM_PLANS DP
	ON LI.HK_HUB_INVESTMENT_SAVING_PROGRAM_TYPES = DP.HK_HUB
	RIGHT OUTER JOIN DB_IAW_"+ENV+"_DM.SHARED.DIM_CLIENTS DC
	ON LI.HK_HUB_PARTY_ROLE_ACCOUNT_HOLDER = DC.HK_HUB
	RIGHT OUTER JOIN DB_IAW_"+ENV+"_DM.SHARED.DIM_ACCOUNTS DAC
	ON LI.HK_HUB_CONTRACT = DAC.HK_HUB
	WHERE 
	SLI.MD_START_DT = TO_DATE("+ DATA_START_DATE +",''YYYY-MM-DD'') 
	AND FH.HK_LINK IS NULL
	AND (DFI.MD_START_DT <= TO_DATE("+ DATA_START_DATE +",''YYYY-MM-DD'') AND (DFI.MD_END_DT> TO_DATE("+ DATA_START_DATE +",''YYYY-MM-DD'') OR DFI.MD_END_DT = ''''))
	AND (DA.MD_START_DT <= TO_DATE("+ DATA_START_DATE +",''YYYY-MM-DD'') AND (DA.MD_END_DT> TO_DATE("+ DATA_START_DATE +",''YYYY-MM-DD'') OR DA.MD_END_DT = ''''))
	AND (DP.MD_START_DT <= TO_DATE("+ DATA_START_DATE +",''YYYY-MM-DD'') AND (DP.MD_END_DT> TO_DATE("+ DATA_START_DATE +",''YYYY-MM-DD'') OR DP.MD_END_DT = ''''))
	AND (DC.MD_START_DT <= TO_DATE("+ DATA_START_DATE +",''YYYY-MM-DD'') AND (DC.MD_END_DT> TO_DATE("+ DATA_START_DATE +",''YYYY-MM-DD'') OR DC.MD_END_DT = ''''))
	AND (DAC.MD_START_DT <= TO_DATE("+ DATA_START_DATE +",''YYYY-MM-DD'') AND (DAC.MD_END_DT> TO_DATE("+ DATA_START_DATE +",''YYYY-MM-DD'') OR DAC.MD_END_DT = ''''));
              ";
EXECUTE IMMEDIATE :TRUNC_QUERY;
EXECUTE IMMEDIATE :INS_QUERY;
END
';
CREATE OR REPLACE PROCEDURE DB_IAW_#env#_DM.REVENUES.SP_CONV_LOADDM_BDV_REVENUES_TO_DM_WT_FACT_REVENUES("ENV" VARCHAR(1000), "I_DATA_START_DATE" VARCHAR(1000))
RETURNS VARCHAR(16777216)
LANGUAGE SQL
EXECUTE AS OWNER
AS '
DECLARE
INS_PRE_DEL STRING;
INS_INSERT STRING;
INS_UPDATE STRING;

BEGIN
i_DATA_START_DATE :=CHAR(39)||i_DATA_START_DATE||CHAR(39);
INS_PRE_DEL := ''TRUNCATE TABLE DB_IAW_''||ENV||''_DM.REVENUES.WT_FACT_REVENUE  '';
INS_INSERT := ''
INSERT INTO DB_IAW_''||ENV||''_DM.REVENUES.WT_FACT_REVENUE(
 HK_LINK
,MD_START_DT
,MD_SRC_SYSTEM
,MD_EXTRACT_DT
,MD_SOURCE
,HK_HUB_PARTY_ROLE_ACCOUNT_HOLDER
,HK_HUB_PARTY_ROLE_ADVISOR
,HK_HUB_REF_INVESTMENT_SAVING_PROGRAM_TYPES
,HK_HUB_INVESTMENT_PRODUCT_TYPE
,HK_HUB_CONTRACT
,SK_DIM_CLIENTS
,SK_DIM_ADVISORS
,SK_DIM_PLANS
,SK_DIM_MARKETPRODUCTS
,SK_DIM_ACCOUNTS
,PAYMENT_DATE
,REVENUE_AMOUNT
,REVENUE_TYPE
,REVENUE_SUBTYPE
,AUA
,INSURANCE_REVENUE
)
SELECT
 REV.HK_LINK
,REV.MD_START_DT
,REV.MD_SRC_SYSTEM
,REV.MD_EXTRACT_DT
,REV.MD_SOURCE
,REV.HK_HUB_PARTY_ROLE_ACCOUNT_HOLDER
,REV.HK_HUB_PARTY_ROLE_ADVISOR
,REV.HK_HUB_REF_INVESTMENT_SAVING_PROGRAM_TYPES
,REV.HK_HUB_INVESTMENT_PRODUCT_TYPE
,REV.HK_HUB_CONTRACT
,COALESCE (REV.O_CLIENT_ID,-1)
,COALESCE (REV.O_ADV_ID,-1)
,COALESCE (REV.O_PLAN_ID,-1)
,COALESCE (REV.O_PRODUCT_ID,-1)
,COALESCE (REV.O_ACNT_ID,-1)
,REV.PAYMENT_DATE
,REV.REVENUE
,REV.REVENUE_TYPE
,REV.REVENUE_SUBTYPE
,REV.AUA
,REV.INSURANCE_REVENUE
FROM
(
SELECT * FROM (SELECT * FROM DB_IAW_''||ENV||''_DWH.REVENUES_BDV.LINK_REVENUE WHERE MD_START_DT = TO_DATE(''||i_DATA_START_DATE||'',''''YYYY-MM-DD'''')) LNK_REV
LEFT JOIN
(SELECT  ID AS O_PRODUCT_ID , HK_HUB FROM (SELECT * FROM DB_IAW_''||ENV||''_DM.SHARED.DIM_FINANCIAL_INSTRUMENTS WHERE (MD_START_DT <= TO_DATE(''||i_DATA_START_DATE||'',''''YYYY-MM-DD'''') AND (MD_END_DT> TO_DATE(''||i_DATA_START_DATE||'',''''YYYY-MM-DD'''') OR (MD_END_DT IS NULL)))) PROD) PROD
ON LNK_REV.HK_HUB_INVESTMENT_PRODUCT_TYPE = PROD.HK_HUB
LEFT JOIN
(SELECT  ID AS O_ADV_ID , HK_HUB  FROM (SELECT * FROM DB_IAW_''||ENV||''_DM.SHARED.DIM_ADVISOR WHERE (MD_START_DT <= TO_DATE(''||i_DATA_START_DATE||'',''''YYYY-MM-DD'''') AND (MD_END_DT> TO_DATE(''||i_DATA_START_DATE||'',''''YYYY-MM-DD'''') OR (MD_END_DT IS NULL)))) ADV ) ADV
ON LNK_REV.HK_HUB_PARTY_ROLE_ADVISOR = ADV.HK_HUB
LEFT JOIN
(SELECT  ID AS O_PLAN_ID , HK_HUB  FROM (SELECT * FROM DB_IAW_''||ENV||''_DM.SHARED.DIM_PLANS WHERE (MD_START_DT <= TO_DATE(''||i_DATA_START_DATE||'',''''YYYY-MM-DD'''') AND (MD_END_DT> TO_DATE(''||i_DATA_START_DATE||'',''''YYYY-MM-DD'''') OR (MD_END_DT IS NULL)))) PLAN) PLAN
ON LNK_REV.HK_HUB_REF_INVESTMENT_SAVING_PROGRAM_TYPES = PLAN.HK_HUB
LEFT JOIN
(SELECT  ID AS O_CLIENT_ID , HK_HUB  FROM (SELECT * FROM DB_IAW_''||ENV||''_DM.SHARED.DIM_CLIENTS WHERE (MD_START_DT <= TO_DATE(''||i_DATA_START_DATE||'',''''YYYY-MM-DD'''') AND (MD_END_DT> TO_DATE(''||i_DATA_START_DATE||'',''''YYYY-MM-DD'''') OR (MD_END_DT IS NULL)))) CLT) CLT
ON LNK_REV.HK_HUB_PARTY_ROLE_ACCOUNT_HOLDER = CLT.HK_HUB
LEFT JOIN
(SELECT  ID AS O_ACNT_ID , HK_HUB  FROM (SELECT * FROM DB_IAW_''||ENV||''_DM.SHARED.DIM_ACCOUNTS WHERE (MD_START_DT <= TO_DATE(''||i_DATA_START_DATE||'',''''YYYY-MM-DD'''') AND (MD_END_DT> TO_DATE(''||i_DATA_START_DATE||'',''''YYYY-MM-DD'''') OR (MD_END_DT IS NULL)))) ACT) ACT
ON LNK_REV.HK_HUB_CONTRACT = ACT.HK_HUB
)REV 
			
              '';
/*INS_UPDATE :='' UPDATE DB_IAW_''||ENV||''_DM.REVENUES.WT_FACT_REVENUE
SET
HK_LINK = SHA1(UPPER(CONCAT(
	  COALESCE(TRIM(MD_SRC_SYSTEM), ''''#NULL#''''), ''''|''''
	, COALESCE(TRIM(HK_HUB_PARTY_ROLE_ACCOUNT_HOLDER), ''''#NULL#''''), ''''|''''
	, COALESCE(TRIM(HK_HUB_PARTY_ROLE_ADVISOR), ''''#NULL#''''), ''''|''''
	, COALESCE(TRIM(HK_HUB_REF_INVESTMENT_SAVING_PROGRAM_TYPES), ''''#NULL#''''), ''''|''''
	, COALESCE(TRIM(HK_HUB_INVESTMENT_PRODUCT_TYPE), ''''#NULL#''''), ''''|''''
	, COALESCE(TRIM(HK_HUB_CONTRACT), ''''#NULL#''''), ''''|''''
	, COALESCE(TRIM(PAYMENT_DATE), ''''#NULL#''''), ''''|''''
	, COALESCE(TRIM(REVENUE_TYPE), ''''#NULL#''''), ''''|''''
	, COALESCE(TRIM(REVENUE_SUBTYPE), ''''#NULL#'''')
	)))
Where 1=1;
'';*/

EXECUTE IMMEDIATE :INS_PRE_DEL;
EXECUTE IMMEDIATE :INS_INSERT;
/*EXECUTE IMMEDIATE :INS_UPDATE;*/

END
';
CREATE OR REPLACE PROCEDURE DB_IAW_#env#_DM.REVENUES.SP_CONV_LOADDM_BDV_REVENUES_TO_DM_WT_FACT_REVENUES("ENV" VARCHAR(1000), "JOB_NAME" VARCHAR(16777216), "DATA_START_DT" VARCHAR(10), "JOB_AUDIT_ID" VARCHAR(16777216), "RUN_ID" VARCHAR(16777216))
RETURNS VARCHAR(16777216)
LANGUAGE JAVASCRIPT
EXECUTE AS OWNER
AS '
DECLARE
TRUNC_QUERY STRING;
INS_QUERY STRING;
UPD_QUERY STRING;
BEGIN
TRUNC_QUERY := "TRUNCATE TABLE DB_IAW_"+ENV+"_DM.REVENUES.WT_FACT_REVENUE;";
INS_COPY_QUERY := "
INSERT INTO
	DB_IAW_"+ENV+"_DM.REVENUES.WT_FACT_REVENUE (
		MD_START_DT, 
		MD_SRC_SYSTEM, 
		MD_EXTRACT_DT, 
		MD_SOURCE, 
		HK_HUB_PARTY_ROLE_ACCOUNT_HOLDER, 
		HK_HUB_PARTY_ROLE_ADVISOR, 
		HK_HUB_REF_INVESTMENT_SAVING_PROGRAM_TYPES, 
		HK_HUB_INVESTMENT_PRODUCT_TYPE, 
		HK_HUB_CONTRACT, SK_DIM_CLIENTS, 
		SK_DIM_ADVISORS, SK_DIM_PLANS, 
		SK_DIM_MARKETPRODUCTS, 
		SK_DIM_ACCOUNTS, 
		PAYMENT_DATE, 
		REVENUE_AMOUNT, 
		REVENUE_TYPE, 
		REVENUE_SUBTYPE )
VALUES
	(
	SELECT 
	MAX(LR.MD_START_DT) AS o_MAX_START_DATE,
	MAX(LR.MD_SRC_SYSTEM) AS o_MAX_MD_SRC_SYSTEM,
	MAX(LR.MD_EXTRACT_DT) AS o_MAX_MD_EXTRACT_DT,
	MAX(LR.MD_SOURCE) AS o_MAX_MD_SOURCE,
	LR.HK_HUB_PARTY_ROLE_ACCOUNT_HOLDER,
	LR.HK_HUB_PARTY_ROLE_ADVISOR, 
	LR.HK_HUB_REF_INVESTMENT_SAVING_PROGRAM_TYPES,
	LR.HK_HUB_INVESTMENT_PRODUCT_TYPE,
	LR.HK_HUB_CONTRACT,
	CASE WHEN DC.ID IS NULL THEN ''-1'' ELSE DC.ID END AS o_CLIENT_ID,
	CASE WHEN DA.ID IS NULL THEN ''-1'' ELSE DFI.ID END AS o_ADV_ID,
	CASE WHEN DP.ID IS NULL THEN ''-1'' ELSE DP.ID END AS o_PLAN_ID,
	CASE WHEN DFI.ID IS NULL THEN ''-1'' ELSE DFI.ID END AS o_Product_ID,
	CASE WHEN DAC.ID IS NULL THEN ''-1'' ELSE DAC.ID END AS o_ACNT_ID,
	LR.PAYMENT_DATE,
	SUM(LR.REVENUE) AS o_SUM_REVENUE,
	LR.REVENUE_TYPE,
	LR.REVENUE_SUBTYPE
	FROM DB_IAW_"+ENV+"_DWH.REVENUES_BDV.LINK_REVENUE LR 
	LEFT JOIN DB_IAW_"+ENV+"_DM.SHARED.DIM_FINANCIAL_INSTRUMENTS DFI
	ON LR.HK_HUB_INVESTMENT_PRODUCT_TYPE = DFI.HK_HUB 
	LEFT JOIN DB_IAW_"+ENV+"_DM.SHARED.DIM_ADVISOR DA
	ON LR.HK_HUB_PARTY_ROLE_ADVISOR = DA.HK_HUB
	LEFT JOIN DB_IAW_"+ENV+"_DM.SHARED.DIM_PLANS DP
	ON LR.HK_HUB_REF_INVESTMENT_SAVING_PROGRAM_TYPES = DP.HK_HUB
	LEFT JOIN DB_IAW_"+ENV+"_DM.SHARED.DIM_CLIENTS DC
	ON LR.HK_HUB_PARTY_ROLE_ACCOUNT_HOLDER = DC.HK_HUB
	LEFT JOIN DB_IAW_"+ENV+"_DM.SHARED.DIM_ACCOUNTS DAC
	ON LR.HK_HUB_CONTRACT = DAC.HK_HUB
	WHERE 
	LR.MD_START_DT = TO_DATE("+ DATA_START_DATE +",''YYYY-MM-DD'') 
	AND (DFI.MD_START_DT <= TO_DATE("+ DATA_START_DATE +",''YYYY-MM-DD'') AND (DFI.MD_END_DT> TO_DATE("+ DATA_START_DATE +",''YYYY-MM-DD'') OR DFI.MD_END_DT = ''''))
	AND (DA.MD_START_DT <= TO_DATE("+ DATA_START_DATE +",''YYYY-MM-DD'') AND (DA.MD_END_DT> TO_DATE("+ DATA_START_DATE +",''YYYY-MM-DD'') OR DA.MD_END_DT = ''''))
	AND (DP.MD_START_DT <= TO_DATE("+ DATA_START_DATE +",''YYYY-MM-DD'') AND (DP.MD_END_DT> TO_DATE("+ DATA_START_DATE +",''YYYY-MM-DD'') OR DP.MD_END_DT = ''''))
	AND (DC.MD_START_DT <= TO_DATE("+ DATA_START_DATE +",''YYYY-MM-DD'') AND (DC.MD_END_DT> TO_DATE("+ DATA_START_DATE +",''YYYY-MM-DD'') OR DC.MD_END_DT = ''''))
	AND (DAC.MD_START_DT <= TO_DATE("+ DATA_START_DATE +",''YYYY-MM-DD'') AND (DAC.MD_END_DT> TO_DATE("+ DATA_START_DATE +",''YYYY-MM-DD'') OR DAC.MD_END_DT = ''''))
	GROUP BY 
	LR.HK_HUB_PARTY_ROLE_ACCOUNT_HOLDER, LR.HK_HUB_PARTY_ROLE_ADVISOR, LR.HK_HUB_REF_INVESTMENT_SAVING_PROGRAM_TYPES, LR.HK_HUB_INVESTMENT_PRODUCT_TYPE, LR.HK_HUB_CONTRACT, o_ACNT_ID, o_CLIENT_ID, o_PLAN_ID, o_ADV_ID, o_PRODUCT_ID, LR.REVENUE_TYPE, LR.REVENUE_SUBTYPE, LR.PAYMENT_DATE, LR.REVENUE;
              ";

UPD_QUERY := "UPDATE DB_IAW_"+ENV+"_DM.REVENUES.WT_FACT_REVENUE SET
	HK_LINK = SHA1(UPPER(CONCAT(
	  COALESCE(TRIM(MD_SRC_SYSTEM), ''#NULL#''), ''|''
	, COALESCE(TRIM(HK_HUB_PARTY_ROLE_ACCOUNT_HOLDER), ''#NULL#''), ''|''
	, COALESCE(TRIM(HK_HUB_PARTY_ROLE_ADVISOR), ''#NULL#''), ''|''
	, COALESCE(TRIM(HK_HUB_REF_INVESTMENT_SAVING_PROGRAM_TYPES), ''#NULL#''), ''|''
	, COALESCE(TRIM(HK_HUB_INVESTMENT_PRODUCT_TYPE), ''#NULL#''), ''|''
	, COALESCE(TRIM(HK_HUB_CONTRACT), ''#NULL#''), ''|''
	, COALESCE(TRIM(PAYMENT_DATE), ''#NULL#''), ''|''
	, COALESCE(TRIM(REVENUE_TYPE), ''#NULL#''), ''|''
	, COALESCE(TRIM(REVENUE_SUBTYPE), ''#NULL#'')
	)))
	Where 1=1";

EXECUTE IMMEDIATE :INS_PRE_QUERY;
EXECUTE IMMEDIATE :INS_COPY_QUERY;
END
';
CREATE OR REPLACE PROCEDURE DB_IAW_#env#_DM.REVENUES.SP_CONV_LOADDM_BDV_REVENUES_TO_DM_WT_FACT_REVENUES_UNIVERIS("ENV" VARCHAR(1000), "I_DATA_START_DATE" VARCHAR(1000))
RETURNS VARCHAR(16777216)
LANGUAGE SQL
EXECUTE AS OWNER
AS '
DECLARE
INS_PRE_DEL STRING;
INS_INSERT STRING;
INS_UPDATE STRING;

BEGIN
i_DATA_START_DATE :=CHAR(39)||i_DATA_START_DATE||CHAR(39);
INS_PRE_DEL := ''TRUNCATE TABLE DB_IAW_''||ENV||''_DM.REVENUES.WT_FACT_REVENUE  '';
INS_INSERT := ''
INSERT INTO DB_IAW_''||ENV||''_DM.REVENUES.WT_FACT_REVENUE(
MD_START_DT
,MD_SRC_SYSTEM
,MD_EXTRACT_DT
,MD_SOURCE
,HK_HUB_PARTY_ROLE_ACCOUNT_HOLDER
,HK_HUB_PARTY_ROLE_ADVISOR
,HK_HUB_REF_INVESTMENT_SAVING_PROGRAM_TYPES
,HK_HUB_INVESTMENT_PRODUCT_TYPE
,HK_HUB_CONTRACT
,SK_DIM_CLIENTS
,SK_DIM_ADVISORS
,SK_DIM_PLANS
,SK_DIM_MARKETPRODUCTS
,SK_DIM_ACCOUNTS
,PAYMENT_DATE
,REVENUE_AMOUNT
,REVENUE_TYPE
,REVENUE_SUBTYPE
)
SELECT
MAX(REV.MD_START_DT)
,MAX(REV.MD_SRC_SYSTEM)
,MAX(REV.MD_EXTRACT_DT)
,MAX(REV.MD_SOURCE)
,REV.HK_HUB_PARTY_ROLE_ACCOUNT_HOLDER
,REV.HK_HUB_PARTY_ROLE_ADVISOR
,REV.HK_HUB_REF_INVESTMENT_SAVING_PROGRAM_TYPES
,REV.HK_HUB_INVESTMENT_PRODUCT_TYPE
,REV.HK_HUB_CONTRACT
,REV.O_CLIENT_ID
,REV.O_ADV_ID
,REV.O_PLAN_ID
,REV.O_PRODUCT_ID
,REV.O_ACNT_ID
,REV.PAYMENT_DATE
,SUM(REV.REVENUE)
,REV.REVENUE_TYPE
,REV.REVENUE_SUBTYPE
FROM
(
SELECT * FROM (SELECT * FROM DB_IAW_''||ENV||''_DWH.REVENUES_BDV.LINK_REVENUE WHERE MD_START_DT <= TO_DATE(''||i_DATA_START_DATE||'',''''YYYY-MM-DD'''') AND (MD_SRC_SYSTEM = ''''IAS-UNIVERIS'''')) LNK_REV
LEFT JOIN
(SELECT (CASE WHEN ID IS NULL THEN -1 ELSE ID END) O_PRODUCT_ID , HK_HUB FROM (SELECT * FROM DB_IAW_''||ENV||''_DM.SHARED.DIM_FINANCIAL_INSTRUMENTS WHERE (MD_START_DT <= TO_DATE(''||i_DATA_START_DATE||'',''''YYYY-MM-DD'''') AND (MD_END_DT> TO_DATE(''||i_DATA_START_DATE||'',''''YYYY-MM-DD'''') OR (MD_END_DT IS NULL)))) PROD) PROD
ON LNK_REV.HK_HUB_INVESTMENT_PRODUCT_TYPE = PROD.HK_HUB
LEFT JOIN
(SELECT (CASE WHEN ID IS NULL THEN -1 ELSE ID END) O_ADV_ID , HK_HUB  FROM (SELECT * FROM DB_IAW_''||ENV||''_DM.SHARED.DIM_ADVISOR WHERE (MD_START_DT <= TO_DATE(''||i_DATA_START_DATE||'',''''YYYY-MM-DD'''') AND (MD_END_DT> TO_DATE(''||i_DATA_START_DATE||'',''''YYYY-MM-DD'''') OR (MD_END_DT IS NULL)))) ADV ) ADV
ON LNK_REV.HK_HUB_PARTY_ROLE_ADVISOR = ADV.HK_HUB
LEFT JOIN
(SELECT (CASE WHEN ID IS NULL THEN -1 ELSE ID END) O_PLAN_ID , HK_HUB  FROM (SELECT * FROM DB_IAW_''||ENV||''_DM.SHARED.DIM_PLANS WHERE (MD_START_DT <= TO_DATE(''||i_DATA_START_DATE||'',''''YYYY-MM-DD'''') AND (MD_END_DT> TO_DATE(''||i_DATA_START_DATE||'',''''YYYY-MM-DD'''') OR (MD_END_DT IS NULL)))) PLAN) PLAN
ON LNK_REV.HK_HUB_REF_INVESTMENT_SAVING_PROGRAM_TYPES = PLAN.HK_HUB
LEFT JOIN
(SELECT (CASE WHEN ID IS NULL THEN -1 ELSE ID END) O_CLIENT_ID , HK_HUB  FROM (SELECT * FROM DB_IAW_''||ENV||''_DM.SHARED.DIM_CLIENTS WHERE (MD_START_DT <= TO_DATE(''||i_DATA_START_DATE||'',''''YYYY-MM-DD'''') AND (MD_END_DT> TO_DATE(''||i_DATA_START_DATE||'',''''YYYY-MM-DD'''') OR (MD_END_DT IS NULL)))) CLT) CLT
ON LNK_REV.HK_HUB_PARTY_ROLE_ACCOUNT_HOLDER = CLT.HK_HUB
LEFT JOIN
(SELECT (CASE WHEN ID IS NULL THEN -1 ELSE ID END) O_ACNT_ID , HK_HUB  FROM (SELECT * FROM DB_IAW_''||ENV||''_DM.SHARED.DIM_ACCOUNTS WHERE (MD_START_DT <= TO_DATE(''||i_DATA_START_DATE||'',''''YYYY-MM-DD'''') AND (MD_END_DT> TO_DATE(''||i_DATA_START_DATE||'',''''YYYY-MM-DD'''') OR (MD_END_DT IS NULL)))) ACT) ACT
ON LNK_REV.HK_HUB_CONTRACT = ACT.HK_HUB
)REV 
GROUP BY (REV.HK_HUB_PARTY_ROLE_ACCOUNT_HOLDER,REV.HK_HUB_PARTY_ROLE_ADVISOR,REV.HK_HUB_REF_INVESTMENT_SAVING_PROGRAM_TYPES,REV.HK_HUB_INVESTMENT_PRODUCT_TYPE,REV.HK_HUB_CONTRACT,REV.O_CLIENT_ID,REV.O_ADV_ID,REV.O_PLAN_ID,REV.O_PRODUCT_ID,REV.O_ACNT_ID ,REV.PAYMENT_DATE,REV.REVENUE_TYPE,REV.REVENUE_SUBTYPE)
			
              '';
INS_UPDATE :='' UPDATE DB_IAW_''||ENV||''_DM.REVENUES.WT_FACT_REVENUE
SET
HK_LINK = SHA1(UPPER(CONCAT(
	  COALESCE(TRIM(MD_SRC_SYSTEM), ''''#NULL#''''), ''''|''''
	, COALESCE(TRIM(HK_HUB_PARTY_ROLE_ACCOUNT_HOLDER), ''''#NULL#''''), ''''|''''
	, COALESCE(TRIM(HK_HUB_PARTY_ROLE_ADVISOR), ''''#NULL#''''), ''''|''''
	, COALESCE(TRIM(HK_HUB_REF_INVESTMENT_SAVING_PROGRAM_TYPES), ''''#NULL#''''), ''''|''''
	, COALESCE(TRIM(HK_HUB_INVESTMENT_PRODUCT_TYPE), ''''#NULL#''''), ''''|''''
	, COALESCE(TRIM(HK_HUB_CONTRACT), ''''#NULL#''''), ''''|''''
	, COALESCE(TRIM(PAYMENT_DATE), ''''#NULL#''''), ''''|''''
	, COALESCE(TRIM(REVENUE_TYPE), ''''#NULL#''''), ''''|''''
	, COALESCE(TRIM(REVENUE_SUBTYPE), ''''#NULL#'''')
	)))
Where 1=1;
'';
EXECUTE IMMEDIATE :INS_PRE_DEL;
EXECUTE IMMEDIATE :INS_INSERT;
EXECUTE IMMEDIATE :INS_UPDATE;

END
';
CREATE OR REPLACE PROCEDURE DB_IAW_#env#_DM.REVENUES.SP_CONV_LOADDM_DM_WT_TO_DM_DIM_FACT_REVENUES_INSERT("ENV" VARCHAR(1000), "JOB_NAME" VARCHAR(16777216), "JOB_AUDIT_ID" VARCHAR(16777216), "RUN_ID" VARCHAR(16777216))
RETURNS VARCHAR(16777216)
LANGUAGE JAVASCRIPT
EXECUTE AS OWNER
AS '
DECLARE
INS_QUERY STRING;
BEGIN
INS_QUERY = "INSERT INTO DB_IAW_"+ENV+"_DM.REVENUES.FACT_REVENUE(
HK_LINK,
MD_START_DT,
MD_CREATION_DT,
MD_CREATION_AUDIT_ID,
MD_SOURCE,
MD_SRC_SYSTEM,
MD_EXTRACT_DT,
MD_SECURITY_TYPE,
SK_DIM_CLIENTS,
SK_DIM_ADVISORS,
SK_DIM_PLANS,
SK_DIM_MARKETPRODUCTS,
SK_DIM_ACCOUNTS,
PAYMENT_DATE,
REVENUE_AMOUNT,
REVENUE_TYPE,
REVENUE_SUBTYPE,
AUA)
VALUES(
SELECT 
M.HK_LINK, 
M.MD_START_DT, 
CURRENT_TIMESTAMP(), 
CONCAT("+JOB_AUDIT_ID+",''#'',"+JOB_NAME+","+RUN_ID+"),
M.MD_SOURCE,
M.MD_SRC_SYSTEM,
M.MD_EXTRACT_DT,
M.MD_SECURITY_TYPE,
M.SK_DIM_CLIENTS,
M.SK_DIM_ADVISORS,
M.SK_DIM_PLANS,
M.SK_DIM_MARKETPRODUCTS,
M.SK_DIM_ACCOUNTS,
M.PAYMENT_DATE,
M.REVENUE_AMOUNT,
M.REVENUE_TYPE,
M.REVENUE_SUBTYPE,
M.AUA
FROM DB_IAW_"+ENV+"_DM.REVENUES.WT_FACT_REVENUE M
RIGHT OUTER JOIN DB_IAW_"+ENV+"_DM.REVENUES.FACT_REVENUE D
ON M.HK_LINK = D.HK_LINK
WHERE D.HK_LINK IS NULL);";

EXECUTE IMMEDIATE :INS_QUERY;
END
';
CREATE OR REPLACE PROCEDURE DB_IAW_#env#_DM.REVENUES.SP_CONV_LOADDM_DM_WT_TO_DM_FACT_HOLDINGS_INSERT("ENV" VARCHAR(1000), "JOB_NAME" VARCHAR(16777216), "JOB_AUDIT_ID" VARCHAR(16777216), "DATA_START_DATE" VARCHAR(10), "RUN_ID" VARCHAR(16777216))
RETURNS VARCHAR(16777216)
LANGUAGE JAVASCRIPT
EXECUTE AS OWNER
AS '
DECLARE
INS_QUERY STRING;
BEGIN
INS_QUERY = "INSERT INTO DB_IAW_"+ENV+"_DM.HOLDINGS.FACT_HOLDINGS(
HK_LINK,
MD_START_DT,
MD_CREATION_DT,
MD_CREATION_AUDIT_ID,
MD_SOURCE,
MD_SRC_SYSTEM,
MD_EXTRACT_DT,
MD_SECURITY_TYPE,
SK_DIM_ACCOUNTS,
SK_DIM_MARKETPRODUCTS,
SK_DIM_ADVISORS,
SK_DIM_CLIENTS,
SK_DIM_PLANS,
RR_CD,
PLN_SYSID,
BALANCE_DATE,
HOLDING_VALUE,
AUA,
AUM,
AUM_CLARINGTON,
AUM_IA,
CASH_POSITION,
PROGRAM_TYPE,
ACCOUNT_PROGRAM_TYPE,
ADMINISTRATORY_TYPE)
VALUES(
SELECT 
M.HK_LINK, 
TO_DATE("+ DATA_START_DATE +",''YYYY-MM-DD''), 
CURRENT_TIMESTAMP(), 
CONCAT("+JOB_AUDIT_ID+",''#'',"+JOB_NAME+","+RUN_ID+"),
M.MD_SOURCE,
M.MD_SRC_SYSTEM,
M.MD_EXTRACT_DT,
M.MD_SECURITY_TYPE,
M.SK_DIM_ACCOUNTS,
M.SK_DIM_MARKETPRODUCTS,
M.SK_DIM_ADVISORS,
M.SK_DIM_CLIENTS,
M.SK_DIM_PLANS,
M.RR_CD,
M.PLN_SYSID,
M.BALANCE_DATE,
M.HOLDING_VALUE,
M.AUA,
M.AUM,
M.AUM_CLARINGTON,
M.AUM_IA,
M.CASH_POSITION,
M.PROGRAM_TYPE,
M.ACCOUNT_PROGRAM_TYPE,
M.ADMINISTRATORY_TYPE
FROM DB_IAW_"+ENV+"_DM.HOLDINGS.WT_FACT_HOLDINGS M
RIGHT OUTER JOIN DB_IAW_"+ENV+"_DM.HOLDINGS.FACT_HOLDINGS D
ON M.HK_LINK = D.HK_LINK
WHERE D.HK_LINK IS NULL);";
EXECUTE IMMEDIATE :INS_QUERY;
END
';
CREATE OR REPLACE PROCEDURE DB_IAW_#env#_DM.REVENUES.SP_CONV_M_LOADDM_BDV_REVENUES_TO_DM_WT_FACT_REVENUES("ENV" VARCHAR(1000), "DATA_START_DATE" VARCHAR(20))
RETURNS VARCHAR(16777216)
LANGUAGE SQL
EXECUTE AS OWNER
AS '
DECLARE
TRUNC_QUERY STRING;
INS_QUERY STRING;
UPD_QUERY STRING;
BEGIN
DATA_START_DATE :=CHAR(39)||DATA_START_DATE||CHAR(39);
TRUNC_QUERY := ''TRUNCATE TABLE DB_IAW_''||ENV||''_DM.REVENUES.WT_FACT_REVENUE'';
INS_QUERY := ''
INSERT INTO
	DB_IAW_''||ENV||''_DM.REVENUES.WT_FACT_REVENUE (
		MD_START_DT, 
		MD_SRC_SYSTEM, 
		MD_EXTRACT_DT, 
		MD_SOURCE, 
		HK_HUB_PARTY_ROLE_ACCOUNT_HOLDER, 
		HK_HUB_PARTY_ROLE_ADVISOR, 
		HK_HUB_REF_INVESTMENT_SAVING_PROGRAM_TYPES, 
		HK_HUB_INVESTMENT_PRODUCT_TYPE, 
		HK_HUB_CONTRACT, 
		SK_DIM_CLIENTS, 
		SK_DIM_ADVISORS, 
		SK_DIM_PLANS, 
		SK_DIM_MARKETPRODUCTS, 
		SK_DIM_ACCOUNTS, 
		PAYMENT_DATE, 
		REVENUE_AMOUNT, 
		REVENUE_TYPE, 
		REVENUE_SUBTYPE )
	(
	SELECT 
	MAX(LR.MD_START_DT) AS O_MAX_START_DATE,
	MAX(LR.MD_SRC_SYSTEM) AS O_MAX_MD_SRC_SYSTEM,
	MAX(LR.MD_EXTRACT_DT) AS O_MAX_MD_EXTRACT_DT,
	MAX(LR.MD_SOURCE) AS O_MAX_MD_SOURCE,
	LR.HK_HUB_PARTY_ROLE_ACCOUNT_HOLDER,
	LR.HK_HUB_PARTY_ROLE_ADVISOR, 
	LR.HK_HUB_REF_INVESTMENT_SAVING_PROGRAM_TYPES,
	LR.HK_HUB_INVESTMENT_PRODUCT_TYPE,
	LR.HK_HUB_CONTRACT,
	CASE WHEN DC.ID IS NULL THEN ''''-1'''' ELSE DC.ID END AS O_CLIENT_ID,
	CASE WHEN DA.ID IS NULL THEN ''''-1'''' ELSE DFI.ID END AS O_ADV_ID,
	CASE WHEN DP.ID IS NULL THEN ''''-1'''' ELSE DP.ID END AS O_PLAN_ID,
	CASE WHEN DFI.ID IS NULL THEN ''''-1'''' ELSE DFI.ID END AS O_PRODUCT_ID,
	CASE WHEN DAC.ID IS NULL THEN ''''-1'''' ELSE DAC.ID END AS O_ACNT_ID,
	LR.PAYMENT_DATE,
	SUM(LR.REVENUE) AS O_SUM_REVENUE,
	LR.REVENUE_TYPE,
	LR.REVENUE_SUBTYPE
	FROM DB_IAW_''||ENV||''_DWH.REVENUES_BDV.LINK_REVENUE LR 
	LEFT JOIN DB_IAW_''||ENV||''_DM.SHARED.DIM_FINANCIAL_INSTRUMENTS DFI
	ON LR.HK_HUB_INVESTMENT_PRODUCT_TYPE = DFI.HK_HUB 
	LEFT JOIN DB_IAW_''||ENV||''_DM.SHARED.DIM_ADVISOR DA
	ON LR.HK_HUB_PARTY_ROLE_ADVISOR = DA.HK_HUB
	LEFT JOIN DB_IAW_''||ENV||''_DM.SHARED.DIM_PLANS DP
	ON LR.HK_HUB_REF_INVESTMENT_SAVING_PROGRAM_TYPES = DP.HK_HUB
	LEFT JOIN DB_IAW_''||ENV||''_DM.SHARED.DIM_CLIENTS DC
	ON LR.HK_HUB_PARTY_ROLE_ACCOUNT_HOLDER = DC.HK_HUB
	LEFT JOIN DB_IAW_''||ENV||''_DM.SHARED.DIM_ACCOUNTS DAC
	ON LR.HK_HUB_CONTRACT = DAC.HK_HUB
	WHERE 
	LR.MD_START_DT = TO_DATE(''||DATA_START_DATE||'',''''YYYY-MM-DD'''') 
	AND (DFI.MD_START_DT <= TO_DATE(''||DATA_START_DATE||'',''''YYYY-MM-DD'''') AND (DFI.MD_END_DT> TO_DATE(''||DATA_START_DATE||'',''''YYYY-MM-DD'''') OR DFI.MD_END_DT = ''''''''))
	AND (DA.MD_START_DT <= TO_DATE(''||DATA_START_DATE||'',''''YYYY-MM-DD'''') AND (DA.MD_END_DT> TO_DATE(''||DATA_START_DATE||'',''''YYYY-MM-DD'''') OR DA.MD_END_DT = ''''''''))
	AND (DP.MD_START_DT <= TO_DATE(''||DATA_START_DATE||'',''''YYYY-MM-DD'''') AND (DP.MD_END_DT> TO_DATE(''||DATA_START_DATE||'',''''YYYY-MM-DD'''') OR DP.MD_END_DT = ''''''''))
	AND (DC.MD_START_DT <= TO_DATE(''||DATA_START_DATE||'',''''YYYY-MM-DD'''') AND (DC.MD_END_DT> TO_DATE(''||DATA_START_DATE||'',''''YYYY-MM-DD'''') OR DC.MD_END_DT = ''''''''))
	AND (DAC.MD_START_DT <= TO_DATE(''||DATA_START_DATE||'',''''YYYY-MM-DD'''') AND (DAC.MD_END_DT> TO_DATE(''||DATA_START_DATE||'',''''YYYY-MM-DD'''') OR DAC.MD_END_DT = ''''''''))
	GROUP BY 
	LR.HK_HUB_PARTY_ROLE_ACCOUNT_HOLDER, LR.HK_HUB_PARTY_ROLE_ADVISOR, LR.HK_HUB_REF_INVESTMENT_SAVING_PROGRAM_TYPES, LR.HK_HUB_INVESTMENT_PRODUCT_TYPE, LR.HK_HUB_CONTRACT, O_ACNT_ID, O_CLIENT_ID, O_PLAN_ID, O_ADV_ID, O_PRODUCT_ID, LR.REVENUE_TYPE, LR.REVENUE_SUBTYPE, LR.PAYMENT_DATE, LR.REVENUE
              )'';

UPD_QUERY := ''UPDATE DB_IAW_''||ENV||''_DM.REVENUES.WT_FACT_REVENUE SET
	HK_LINK = SHA1(UPPER(CONCAT(
	  COALESCE(TRIM(MD_SRC_SYSTEM), ''''NULL''''), ''''|''''
	, COALESCE(TRIM(HK_HUB_PARTY_ROLE_ACCOUNT_HOLDER), ''''NULL''''), ''''|''''
	, COALESCE(TRIM(HK_HUB_PARTY_ROLE_ADVISOR), ''''NULL''''), ''''|''''
	, COALESCE(TRIM(HK_HUB_REF_INVESTMENT_SAVING_PROGRAM_TYPES), ''''NULL''''), ''''|''''
	, COALESCE(TRIM(HK_HUB_INVESTMENT_PRODUCT_TYPE), ''''NULL''''), ''''|''''
	, COALESCE(TRIM(HK_HUB_CONTRACT), ''''NULL''''), ''''|''''
	, COALESCE(TRIM(PAYMENT_DATE), ''''NULL''''), ''''|''''
	, COALESCE(TRIM(REVENUE_TYPE), ''''NULL''''), ''''|''''
	, COALESCE(TRIM(REVENUE_SUBTYPE), ''''NULL'''')
	)))
	WHERE 1=1'';

EXECUTE IMMEDIATE :TRUNC_QUERY;
EXECUTE IMMEDIATE :INS_QUERY;
EXECUTE IMMEDIATE :UPD_QUERY;
END
';
create or replace schema DB_IAW_#env#_DM.SHARED;

create or replace TABLE DB_IAW_#env#_DM.SHARED.DIM_ACCOUNTS (
	ID NUMBER(38,0) autoincrement COMMENT 'Surrogate key of the dimension',
	HK_HUB VARCHAR(40) COMMENT 'Hash key for the Hub',
	MD_START_DT TIMESTAMP_NTZ(9) COMMENT 'Start Date of the image/version',
	MD_END_DT TIMESTAMP_NTZ(9) COMMENT 'End Date of the image/version',
	MD_HASH_NAT_KEYS VARCHAR(64) DEFAULT '0' COMMENT 'Represents the whole set of hashed natural keys to be historized for an occurrence',
	MD_HASHDIFF_TYPE1 VARCHAR(40) DEFAULT '0' COMMENT 'Represents the whole set of hashed type 1 attributes to be historized for an occurrence',
	MD_HASHDIFF_TYPE2 VARCHAR(40) DEFAULT '0' COMMENT 'Represents the whole set of hashed type 2 attributes to be historized for an occurrence',
	MD_CREATION_DT TIMESTAMP_NTZ(9) COMMENT 'Creation Date Time of the occurrence',
	MD_CREATION_AUDIT_ID VARCHAR(1000) COMMENT 'Task execution ID',
	MD_MODIFY_DT TIMESTAMP_NTZ(9) COMMENT 'Modification Date Time of the occurrence',
	MD_MODIFY_AUDIT_ID VARCHAR(1000) COMMENT 'Task execution ID',
	MD_SOURCE VARCHAR(1000) COMMENT 'Represents the source system, file, etc. of the instance',
	MD_SRC_SYSTEM VARCHAR(100) COMMENT 'Source system',
	MD_EXTRACT_DT TIMESTAMP_NTZ(9) COMMENT 'Source extraction date',
	MD_SECURITY_TYPE VARCHAR(1000) COMMENT 'Capabilities for RLS',
	CONTRACT_ID VARCHAR(1000) COMMENT 'Capabilities for RLS',
	UNIVERIS_PLAN_ID NUMBER(38,0) COMMENT 'Univeris Plan ID',
	UNIVERIS_CLIENT_ID NUMBER(38,0) COMMENT 'Univeris Client ID',
	PLAN_CODE VARCHAR(8000) COMMENT 'The plan mnemonic code',
	PLAN_LABEL VARCHAR(8000) COMMENT 'The plan mnemonic label',
	ACCOUNT_TYPE VARCHAR(14) COMMENT 'The type of the account Registered or not registered',
	OPEN_DATE TIMESTAMP_NTZ(9) COMMENT 'The setup date UNIVERIS and open date NBIN of the account',
	CLOSE_DATE TIMESTAMP_NTZ(9) COMMENT 'The close date of the account',
	GROUP_TYPE_CODE VARCHAR(8000) COMMENT 'The group type code such as RRSP,LEV,RRSP,LIRA...',
	ACCUMULATION_TYPE VARCHAR(1000) COMMENT 'Accumulation type',
	ADMINISTRATOR_TYPE VARCHAR(8000) COMMENT 'Client Name, Broker/Nominee or Third party',
	ACCOUNT_AUA_SEGMENT VARCHAR(512) COMMENT 'Advisor AUA Segment : 25k-100k',
	ACCOUNT_AUA_SEGMENT_ORDER NUMBER(38,0) COMMENT 'Advisor AUA Segment ORDER',
	ACCOUNT_IND NUMBER(1,0) COMMENT 'Total Number of Client Accounts Flag',
	CASH_EQLT_PROFILE_PCT VARCHAR(3) COMMENT 'Cash or Equivalent Profile %',
	INCOME_PROFILE_PCT VARCHAR(3) COMMENT 'Income Profile %',
	GROWTH_PROFILE_PCT VARCHAR(3) COMMENT 'Growth Profile %',
	SPECULATION_PROFILE_PCT VARCHAR(3) COMMENT 'Speculation Profile %',
	UNKNOWN_PROFILE_PCT VARCHAR(3) COMMENT 'Unknown Profile %',
	LOW_RISK_PCT VARCHAR(3) COMMENT 'Low Risk %',
	MEDIUM_RISK_PCT VARCHAR(3) COMMENT 'Medium Risk %',
	HIGH_RISK_PCT VARCHAR(3) COMMENT 'High Risk %',
	UNKNOWN_RISK_PCT VARCHAR(3) COMMENT 'Unknown Risk %',
	NBIN_CLIENT_ID VARCHAR(50) COMMENT 'NBIN Clients Id.'
);
create or replace TABLE DB_IAW_#env#_DM.SHARED.DIM_ADVISOR (
	ID NUMBER(38,0) autoincrement COMMENT 'Surrogate key of the dimension',
	HK_HUB VARCHAR(40) COMMENT 'Hash key for the Hub',
	MD_START_DT TIMESTAMP_NTZ(9) COMMENT 'Start Date of the image/version',
	MD_END_DT TIMESTAMP_NTZ(9) COMMENT 'End Date of the image/version',
	MD_HASH_NAT_KEYS VARCHAR(64) DEFAULT '0' COMMENT 'Represents the whole set of hashed natural keys to be historized for an occurrence',
	MD_HASHDIFF_TYPE1 VARCHAR(40) DEFAULT '0' COMMENT 'Represents the whole set of hashed type 1 attributes to be historized for an occurrence',
	MD_HASHDIFF_TYPE2 VARCHAR(40) DEFAULT '0' COMMENT 'Represents the whole set of hashed type 2 attributes to be historized for an occurrence',
	MD_CREATION_DT TIMESTAMP_NTZ(9) COMMENT 'Creation Date Time of the occurrence',
	MD_CREATION_AUDIT_ID VARCHAR(1000) COMMENT 'Task execution ID',
	MD_MODIFY_DT TIMESTAMP_NTZ(9) COMMENT 'Modification Date Time of the occurrence',
	MD_MODIFY_AUDIT_ID VARCHAR(1000) COMMENT 'Task execution ID',
	MD_SOURCE VARCHAR(1000) COMMENT 'Represents the source system, file, etc. of the instance',
	MD_SRC_SYSTEM VARCHAR(100) COMMENT 'Source system',
	MD_EXTRACT_DT TIMESTAMP_NTZ(9) COMMENT 'Source extraction date',
	MD_SECURITY_TYPE VARCHAR(1000) COMMENT 'Capabilities for RLS',
	SRC_ID VARCHAR(50) COMMENT 'Not used TBD ?',
	MASTER_CODE VARCHAR(50) COMMENT 'Master code of the advisor',
	COMPANY_CODE VARCHAR(50) COMMENT 'Company code of the advisor',
	COMPANY_NAME VARCHAR(512) COMMENT 'Company name of the advisor',
	REGULATORY_ORGANIZATION_NAME VARCHAR(512) COMMENT 'REGULATORY ORGANIZATION NAME of the advisor',
	REGULATORY_ORGANIZATION_CODE VARCHAR(50) COMMENT 'REGULATORY ORGANIZATION CODE of the advisor',
	DEALER_CODE VARCHAR(50) COMMENT 'Dealer code',
	DEALER_NAME VARCHAR(512) COMMENT 'Dealer name',
	REGION_CODE VARCHAR(512) COMMENT 'Region code',
	REGION_NAME VARCHAR(512) COMMENT 'Region name',
	REGION_VP VARCHAR(16777216) COMMENT 'full name of the RVP',
	BRANCHCODE VARCHAR(50) COMMENT 'Code of the representative branch code',
	BRANCHNAME VARCHAR(512) COMMENT 'Name of the representative branch',
	TEAM_CODE NUMBER(38,0) COMMENT 'Representant Group ID',
	TEAM_NAME VARCHAR(512) COMMENT 'Advisor team description',
	ADVISOR_FULLNAME VARCHAR(512) COMMENT 'Representative name',
	FIRSTNAME VARCHAR(512) COMMENT 'Representative first name',
	LASTNAME VARCHAR(512) COMMENT 'Representative last name',
	ADVISOR_CORPORATION_NAME VARCHAR(512) COMMENT 'Representative corporation name',
	STATUS VARCHAR(512) COMMENT 'Active RR code indicator',
	GROUP_RSP_INDICATOR VARCHAR(512) COMMENT 'Group Retirement Savings Plan (RSP) indicator',
	PROVINCE_CODE VARCHAR(16777216) COMMENT 'province code',
	PROVINCE VARCHAR(16777216) COMMENT 'province name',
	ADVISOR_AUA_SEGMENT VARCHAR(512) COMMENT 'Advisor AUA Segment : 25k-100k',
	ADVISOR_AUA_SEGMENT_ORDER NUMBER(38,0) COMMENT 'Advisor AUA Segment ORDER',
	ADVISOR_START_DATE TIMESTAMP_NTZ(9) COMMENT 'the starting date of the advisor',
	NEW_ADVISOR NUMBER(38,0) COMMENT 'New advisor indicator (0 or 1)',
	ADVISOR_EFFECIVENESS_DT TIMESTAMP_NTZ(9) COMMENT 'Its the date after one year of advisor joining date , implemented as part of Organic growth',
	DEPARTED_ADVISOR_IND NUMBER(1,0) COMMENT 'DEPARTED ADVISOR INDICATOR',
	END_DATE TIMESTAMP_NTZ(9) COMMENT 'Departure date of the advisor (TBD)',
	REASON VARCHAR(1000) COMMENT 'Reason of departure',
	NEW_FIRM VARCHAR(1000) COMMENT 'Departure destination',
	NEW_FIRM_TYPE VARCHAR(1000) COMMENT 'Departure destination Type',
	NEW_FIRM_BACK_OFFICE VARCHAR(1000) COMMENT 'Departure destination Back-Office',
	PRESTIGE_STATUS VARCHAR(100) COMMENT 'Prestige Status',
	PRIMARY_ROLE VARCHAR(500) COMMENT 'PRIMARY ROLE',
	TRANSITION_PERIOD_END_DATE TIMESTAMP_NTZ(9) COMMENT 'Advisor transition end date',
	DEAL_ASSESTS NUMBER(11,0) COMMENT 'Deal assets',
	EXPECTED_ASSESTS NUMBER(11,0) COMMENT 'Expected assets',
	PREVIOUS_FIRM VARCHAR(100) COMMENT 'Previous Firm of the Advisor',
	PREVIOUS_FIRM_TYPE VARCHAR(100) COMMENT 'Previous Firm type of the Advisor',
	AGE_SEGMENT VARCHAR(50) COMMENT 'Advisor Age Segment : 25-34',
	AGE_SEGMENT_ORD NUMBER(2,0) COMMENT 'Advisor Age Segment ORDER',
	SUSPENDED_IND NUMBER(1,0) COMMENT 'suspended Flag, if an advisor is deleted in certs but still have AUA, will be considered as suspended',
	ADVISOR_AGE NUMBER(38,0) COMMENT 'Age of the dealer',
	REP_EMAIL VARCHAR(1000) COMMENT 'Advisor repemail',
	CBM VARCHAR(1000) COMMENT 'Advisor cbm',
	BRANCH_NRD VARCHAR(1000) COMMENT 'Advisor branch nrd',
	BRANCH_ADDRESS1 VARCHAR(1000) COMMENT 'Advisor branch ADDRESS1',
	BRANCH_ADDRESS2 VARCHAR(1000) COMMENT 'Advisor branch ADDRESS2',
	BRANCH_CITY VARCHAR(1000) COMMENT 'Advisor branch city',
	BRANCH_POSTAL_CODE VARCHAR(1000) COMMENT 'Advisor branch postal code'
);
create or replace TABLE DB_IAW_#env#_DM.SHARED.DIM_CLIENTS (
	ID NUMBER(38,0) autoincrement COMMENT 'Surrogate key of the dimension',
	HK_HUB VARCHAR(64) COMMENT 'Hash key for the Hub',
	MD_START_DT TIMESTAMP_NTZ(9) COMMENT 'Start Date of the image/version',
	MD_END_DT TIMESTAMP_NTZ(9) COMMENT 'End Date of the image/version',
	MD_HASH_NAT_KEYS VARCHAR(64) DEFAULT '0' COMMENT 'Represents the whole set of hashed natural keys to be historized for an occurrence',
	MD_HASHDIFF_TYPE1 VARCHAR(40) DEFAULT '0' COMMENT 'Represents the whole set of hashed type 1 attributes to be historized for an occurrence',
	MD_HASHDIFF_TYPE2 VARCHAR(40) DEFAULT '0' COMMENT 'Represents the whole set of hashed type 2 attributes to be historized for an occurrence',
	MD_CREATION_DT TIMESTAMP_NTZ(9) COMMENT 'Creation Date Time of the occurrence',
	MD_CREATION_AUDIT_ID VARCHAR(1000) COMMENT 'Task execution ID',
	MD_MODIFY_DT TIMESTAMP_NTZ(9) COMMENT 'Modification Date Time of the occurrence',
	MD_MODIFY_AUDIT_ID VARCHAR(1000) COMMENT 'Task execution ID',
	MD_SOURCE VARCHAR(1000) COMMENT 'Represents the source system, file, etc. of the instance',
	MD_SRC_SYSTEM VARCHAR(100) COMMENT 'Source system',
	MD_EXTRACT_DT TIMESTAMP_NTZ(9) COMMENT 'Source extraction date',
	MD_SECURITY_TYPE VARCHAR(1000) COMMENT 'Capabilities for RLS',
	CLIENT_ID VARCHAR(100) COMMENT 'Client ID',
	PROVINCE_DESC VARCHAR(100) COMMENT 'Client province description',
	PROVINCE_CODE VARCHAR(10) COMMENT 'Client province code',
	COUNTRY_DESC VARCHAR(100) COMMENT 'Client country description',
	COUNTRY_CODE VARCHAR(10) COMMENT 'Client country code',
	INCOME_AMT NUMBER(38,2) COMMENT 'Client income',
	INCOME_LEVEL_1_SEGMENT VARCHAR(50) COMMENT 'Client level 1 income Segment : $30k - $50k',
	INCOME_LEVEL_1_SEGMENT_ORD NUMBER(2,0) COMMENT 'Client level 1 income Segment ORDER',
	INCOME_LEVEL_2_SEGMENT VARCHAR(50) COMMENT 'Client level 2 income Segment : Lower Income',
	INCOME_LEVEL_2_SEGMENT_ORD NUMBER(2,0) COMMENT 'Client level 2 income Segment ORDER',
	CLIENT_AUA_SEGMENT VARCHAR(50) COMMENT 'Client AUA Segment : 25k-100k',
	CLIENT_AUA_SEGMENT_ORD NUMBER(2,0) COMMENT 'Client AUA Segment ORDER',
	AGE_SEGMENT VARCHAR(50) COMMENT 'Client Age Segment : 25-34',
	AGE_SEGMENT_ORD NUMBER(2,0) COMMENT 'Client Age Segment ORDER',
	NEW_CLIENT_IND VARCHAR(16777216) COMMENT 'New client indicator',
	CLIENT_START_DT TIMESTAMP_NTZ(9) COMMENT 'Client Start Date',
	CLIENT_INV_KNOWLEDGE_LVL VARCHAR(10) COMMENT 'Clients Account Investment Knowledge',
	CLIENT_NAME VARCHAR(2000) COMMENT 'Client name',
	CLIENT_AGE NUMBER(38,0) COMMENT 'Client Age'
);
create or replace TABLE DB_IAW_#env#_DM.SHARED.DIM_DATE (
	ID NUMBER(38,0) COMMENT 'Day identifier ex: 20210408',
	DATE DATE NOT NULL COMMENT 'Date ex: 2021-04-08',
	FULL_DATE_DESC VARCHAR(64) NOT NULL COMMENT 'Full date description ex: Thursday, Apr 08, 2021',
	DAY_NUM_IN_WEEK NUMBER(1,0) NOT NULL COMMENT 'Day number in a week (Monday=1, Sunday=7)',
	DAY_NUM_IN_MONTH NUMBER(2,0) NOT NULL COMMENT 'Day number in a month (1 to 31)',
	DAY_NUM_IN_YEAR NUMBER(3,0) NOT NULL COMMENT 'Day number in a year (1 to 366)',
	DAY_NAME VARCHAR(10) NOT NULL COMMENT 'Day name ex: Thursday',
	DAY_ABBREV VARCHAR(3) NOT NULL COMMENT 'Day abreviation ex: Thu',
	WEEKDAY_IND VARCHAR(64) NOT NULL COMMENT 'Weekday indicator (Weekday, Not a weekday)',
	US_HOLIDAY_IND VARCHAR(64) COMMENT 'United State holiday Indicator',
	_HOLIDAY_IND VARCHAR(64) COMMENT 'holiday indicator',
	MONTH_END_IND VARCHAR(64) NOT NULL COMMENT 'Month end indicator (Not-Month-end, Month-end)',
	WEEK_BEGIN_DATE_NKEY NUMBER(9,0) NOT NULL COMMENT 'Week begin date nkey ex: 20210405',
	WEEK_BEGIN_DATE DATE NOT NULL COMMENT 'Week begin date ex: 2021-04-05',
	WEEK_END_DATE_NKEY NUMBER(9,0) NOT NULL COMMENT 'Week end date nkey ex: 20210411',
	WEEK_END_DATE DATE NOT NULL COMMENT 'Week end date ex: 2021-04-11',
	WEEK_NUM_IN_YEAR NUMBER(9,0) NOT NULL COMMENT 'Week number in a year (1 to 53)',
	MONTH_NAME VARCHAR(10) NOT NULL COMMENT 'Month name ex: April',
	MONTH_ABBREV VARCHAR(3) NOT NULL COMMENT 'Month abreviation ex: Apr',
	MONTH_NUM_IN_YEAR NUMBER(2,0) NOT NULL COMMENT 'Month number in a year (1 to 12)',
	YEARMONTH VARCHAR(10) NOT NULL COMMENT 'Year and month ex: 2021-04',
	QUARTER NUMBER(1,0) NOT NULL COMMENT 'Quarter number (1 to 4)',
	YEARQUARTER VARCHAR(10) NOT NULL COMMENT 'Year and Quarter ex: 2021-02',
	YEAR NUMBER(5,0) NOT NULL COMMENT 'Year ex: 2021',
	FISCAL_WEEK_NUM NUMBER(2,0) NOT NULL COMMENT 'Fiscal week number (1 to 53)',
	FISCAL_MONTH_NUM NUMBER(2,0) NOT NULL COMMENT 'Fiscal month number (1 to 12)',
	FISCAL_YEARMONTH VARCHAR(10) NOT NULL COMMENT 'Fiscal year and month ex: 2021-04',
	FISCAL_QUARTER NUMBER(1,0) NOT NULL COMMENT 'Fiscal quarter number (1 to 4)',
	FISCAL_YEARQUARTER VARCHAR(10) NOT NULL COMMENT 'Fiscal year and quarter ex: 2021-02',
	FISCAL_HALFYEAR NUMBER(1,0) NOT NULL COMMENT 'Fiscal half year  (1 or 2)',
	FISCAL_YEAR NUMBER(5,0) NOT NULL COMMENT 'Fiscal year ex: 2021',
	SQL_TIMESTAMP TIMESTAMP_NTZ(9) COMMENT 'Day timestamp ex: 2021-04-08 00:00:00',
	CURRENT_ROW_IND VARCHAR(1) DEFAULT 'Y' COMMENT 'BI indicator, is it a current row or not (Y,N)',
	EFFECTIVE_DATE DATE DEFAULT CAST(CURRENT_TIMESTAMP() AS DATE) COMMENT 'BI date, day of creation ex: 2021-04-06',
	EXPIRATION_DATE DATE DEFAULT CAST('9999-12-31' AS DATE) COMMENT 'BI date, day of expiration, by default the vaue is: 9999-12-31',
	MONTH_NAME_YEAR VARCHAR(100) COMMENT 'Month name and year ex: April 2021',
	MONTH_NAME_YEAR_ORD NUMBER(38,0) COMMENT 'Month name and year order ex:202104'
)COMMENT='Type 0 Dimension Table Housing Calendar and Fiscal Year Date Attributes'
;
create or replace TABLE DB_IAW_#env#_DM.SHARED.DIM_FINANCIAL_INSTRUMENTS (
	ID NUMBER(38,0) autoincrement COMMENT 'Surrogate key of the dimension',
	HK_HUB VARCHAR(40) COMMENT 'Hash key for the Hub',
	MD_START_DT TIMESTAMP_NTZ(9) COMMENT 'Start Date of the image/version',
	MD_END_DT TIMESTAMP_NTZ(9) COMMENT 'End Date of the image/version',
	MD_HASH_NAT_KEYS VARCHAR(64) DEFAULT '0' COMMENT 'Represents the whole set of hashed natural keys to be historized for an occurrence',
	MD_HASHDIFF_TYPE1 VARCHAR(40) DEFAULT '0' COMMENT 'Represents the whole set of hashed type 1 attributes to be historized for an occurrence',
	MD_HASHDIFF_TYPE2 VARCHAR(40) DEFAULT '0' COMMENT 'Represents the whole set of hashed type 2 attributes to be historized for an occurrence',
	MD_CREATION_DT TIMESTAMP_NTZ(9) COMMENT 'Creation Date Time of the occurrence',
	MD_CREATION_AUDIT_ID VARCHAR(1000) COMMENT 'Task execution ID',
	MD_MODIFY_DT TIMESTAMP_NTZ(9) COMMENT 'Modification Date Time of the occurrence',
	MD_MODIFY_AUDIT_ID VARCHAR(1000) COMMENT 'Task execution ID',
	MD_SOURCE VARCHAR(1000) COMMENT 'Represents the source system, file, etc. of the instance',
	MD_SRC_SYSTEM VARCHAR(100) COMMENT 'Source system',
	MD_EXTRACT_DT TIMESTAMP_NTZ(9) COMMENT 'Source extraction date',
	MD_SECURITY_TYPE VARCHAR(1000) COMMENT 'Capabilities for RLS',
	INVESTMENT_PRODUCT_ID VARCHAR(16777216) COMMENT 'The product identifier',
	SYMBOL VARCHAR(512) COMMENT 'The product symbol (product code)',
	NAME VARCHAR(1000) COMMENT 'The product name',
	ASSET_CATEGORY VARCHAR(512) COMMENT 'The product asset category',
	CATEGORY VARCHAR(512) COMMENT 'The product category',
	PRODUCT_GROUP VARCHAR(512) COMMENT 'The product group name',
	ISSUER_COMPANY_CODE VARCHAR(4) COMMENT 'The issuer company code',
	ISSUER_COMPANY_NAME VARCHAR(1000) COMMENT 'The issuer company name'
);
create or replace TABLE DB_IAW_#env#_DM.SHARED.DIM_PLANS (
	ID NUMBER(38,0) autoincrement COMMENT 'Column description',
	HK_HUB VARCHAR(40) COMMENT 'Hash key for the Hub',
	MD_START_DT TIMESTAMP_NTZ(9) COMMENT 'Start Date of the image/version',
	MD_END_DT TIMESTAMP_NTZ(9) COMMENT 'End Date of the image/version',
	MD_HASH_NAT_KEYS VARCHAR(64) DEFAULT '0' COMMENT 'Represents the whole set of hashed natural keys to be historized for an occurrence',
	MD_HASHDIFF_TYPE1 VARCHAR(40) DEFAULT '0' COMMENT 'Represents the whole set of hashed type 1 attributes to be historized for an occurrence',
	MD_HASHDIFF_TYPE2 VARCHAR(40) DEFAULT '0' COMMENT 'Represents the whole set of hashed type 2 attributes to be historized for an occurrence',
	MD_CREATION_DT TIMESTAMP_NTZ(9) COMMENT 'Creation Date Time of the occurrence',
	MD_CREATION_AUDIT_ID VARCHAR(1000) COMMENT 'Task execution ID',
	MD_MODIFY_DT TIMESTAMP_NTZ(9) COMMENT 'Modification Date Time of the occurrence',
	MD_MODIFY_AUDIT_ID VARCHAR(1000) COMMENT 'Task execution ID',
	MD_SOURCE VARCHAR(1000) COMMENT 'Represents the source system, file, etc. of the instance',
	MD_SRC_SYSTEM VARCHAR(100) COMMENT 'Source system',
	MD_EXTRACT_DT TIMESTAMP_NTZ(9) COMMENT 'Source extraction date',
	MD_SECURITY_TYPE VARCHAR(1000) COMMENT 'Capabilities for RLS',
	PLAN_CODE VARCHAR(8000) COMMENT 'The Plan code',
	PLAN_LABEL VARCHAR(8000) COMMENT 'The Plan label',
	ACCOUNT_TYPE VARCHAR(16777216) COMMENT 'The account type',
	GROUP_TYPE_CODE VARCHAR(8000) COMMENT 'The group type code',
	ACCUMULATION_TYPE VARCHAR(8000) COMMENT 'Accumulation type'
);
create or replace TABLE DB_IAW_#env#_DM.SHARED.WT_DIM_ACCOUNTS (
	HK_HUB VARCHAR(40) COMMENT 'Hash key for the Hub',
	MD_START_DT TIMESTAMP_NTZ(9) COMMENT 'Start Date of the image/version',
	MD_END_DT TIMESTAMP_NTZ(9) COMMENT 'End Date of the image/version',
	MD_HASH_NAT_KEYS VARCHAR(64) DEFAULT '0' COMMENT 'Represents the whole set of hashed natural keys to be historized for an occurrence',
	MD_HASHDIFF_TYPE1 VARCHAR(40) DEFAULT '0' COMMENT 'Represents the whole set of hashed type 1 attributes to be historized for an occurrence',
	MD_HASHDIFF_TYPE2 VARCHAR(40) DEFAULT '0' COMMENT 'Represents the whole set of hashed type 2 attributes to be historized for an occurrence',
	MD_CREATION_DT TIMESTAMP_NTZ(9) COMMENT 'Creation Date Time of the occurrence',
	MD_CREATION_AUDIT_ID VARCHAR(1000) COMMENT 'Task execution ID',
	MD_MODIFY_DT TIMESTAMP_NTZ(9) COMMENT 'Modification Date Time of the occurrence',
	MD_MODIFY_AUDIT_ID VARCHAR(1000) COMMENT 'Task execution ID',
	MD_SOURCE VARCHAR(1000) COMMENT 'Represents the source system, file, etc. of the instance',
	MD_SRC_SYSTEM VARCHAR(100) COMMENT 'Source system',
	MD_EXTRACT_DT TIMESTAMP_NTZ(9) COMMENT 'Source extraction date',
	MD_SECURITY_TYPE VARCHAR(1000) COMMENT 'Capabilities for RLS',
	CONTRACT_ID VARCHAR(1000) COMMENT 'Capabilities for RLS',
	UNIVERIS_PLAN_ID NUMBER(38,0) COMMENT 'Univeris Plan ID',
	UNIVERIS_CLIENT_ID NUMBER(38,0) COMMENT 'Univeris Client ID',
	PLAN_CODE VARCHAR(8000) COMMENT 'The plan mnemonic code',
	PLAN_LABEL VARCHAR(8000) COMMENT 'The plan mnemonic label',
	ACCOUNT_TYPE VARCHAR(14) COMMENT 'The type of the account Registered or not registered',
	OPEN_DATE TIMESTAMP_NTZ(9) COMMENT 'The setup date UNIVERIS and open date NBIN of the account',
	CLOSE_DATE TIMESTAMP_NTZ(9) COMMENT 'The close date of the account',
	GROUP_TYPE_CODE VARCHAR(8000) COMMENT 'The group type code such as RRSP,LEV,RRSP,LIRA...',
	ACCUMULATION_TYPE VARCHAR(1000) COMMENT 'Accumulation type',
	ADMINISTRATOR_TYPE VARCHAR(8000) COMMENT 'Client Name, Broker/Nominee or Third party',
	ACCOUNT_AUA_SEGMENT VARCHAR(512) COMMENT 'Advisor AUA Segment : 25k-100k',
	ACCOUNT_AUA_SEGMENT_ORDER NUMBER(38,0) COMMENT 'Advisor AUA Segment ORDER',
	ACCOUNT_IND NUMBER(1,0) COMMENT 'Total Number of Client Accounts Flag',
	CASH_EQLT_PROFILE_PCT VARCHAR(3) COMMENT 'Cash or Equivalent Profile %',
	INCOME_PROFILE_PCT VARCHAR(3) COMMENT 'Income Profile %',
	GROWTH_PROFILE_PCT VARCHAR(3) COMMENT 'Growth Profile %',
	SPECULATION_PROFILE_PCT VARCHAR(3) COMMENT 'Speculation Profile %',
	UNKNOWN_PROFILE_PCT VARCHAR(3) COMMENT 'Unknown Profile %',
	LOW_RISK_PCT VARCHAR(3) COMMENT 'Low Risk %',
	MEDIUM_RISK_PCT VARCHAR(3) COMMENT 'Medium Risk %',
	HIGH_RISK_PCT VARCHAR(3) COMMENT 'High Risk %',
	UNKNOWN_RISK_PCT VARCHAR(3) COMMENT 'Unknown Risk %',
	NBIN_CLIENT_ID VARCHAR(50) COMMENT 'NBIN Clients Id.'
);
create or replace TABLE DB_IAW_#env#_DM.SHARED.WT_DIM_ADVISOR (
	HK_HUB VARCHAR(40) COMMENT 'Hash key for the Hub',
	MD_START_DT TIMESTAMP_NTZ(9) COMMENT 'Start Date of the image/version',
	MD_END_DT TIMESTAMP_NTZ(9) COMMENT 'End Date of the image/version',
	MD_HASH_NAT_KEYS VARCHAR(64) COMMENT 'Represents the whole set of hashed natural keys to be historized for an occurrence',
	MD_HASHDIFF_TYPE1 VARCHAR(40) COMMENT 'Represents the whole set of hashed type 1 attributes to be historized for an occurrence',
	MD_HASHDIFF_TYPE2 VARCHAR(40) COMMENT 'Represents the whole set of hashed type 2 attributes to be historized for an occurrence',
	MD_CREATION_DT TIMESTAMP_NTZ(9) COMMENT 'Creation Date Time of the occurrence',
	MD_CREATION_AUDIT_ID VARCHAR(1000) COMMENT 'Task execution ID',
	MD_MODIFY_DT TIMESTAMP_NTZ(9) COMMENT 'Modification Date Time of the occurrence',
	MD_MODIFY_AUDIT_ID VARCHAR(1000) COMMENT 'Task execution ID',
	MD_SOURCE VARCHAR(1000) COMMENT 'Represents the source system, file, etc. of the instance',
	MD_SRC_SYSTEM VARCHAR(100) COMMENT 'Source system',
	MD_EXTRACT_DT TIMESTAMP_NTZ(9) COMMENT 'Source extraction date',
	MD_SECURITY_TYPE VARCHAR(1000) COMMENT 'Capabilities for RLS',
	ID VARCHAR(50) COMMENT 'Surrogate key of the dimension DIM_ADVISORS',
	MASTER_CODE VARCHAR(50) COMMENT 'Master code of the advisor',
	COMPANY_CODE VARCHAR(50) COMMENT 'Company code of the advisor',
	COMPANY_NAME VARCHAR(512) COMMENT 'Company name of the advisor',
	REGULATORY_ORGANIZATION_NAME VARCHAR(512) COMMENT 'REGULATORY ORGANIZATION NAME of the advisor',
	REGULATORY_ORGANIZATION_CODE VARCHAR(50) COMMENT 'REGULATORY ORGANIZATION CODE of the advisor',
	DEALER_CODE VARCHAR(50) COMMENT 'Dealer code',
	DEALER_NAME VARCHAR(512) COMMENT 'Dealer name',
	REGION_CODE VARCHAR(512) COMMENT 'Region code',
	REGION_NAME VARCHAR(512) COMMENT 'Region name',
	REGION_VP VARCHAR(16777216) COMMENT 'full name of the RVP',
	BRANCHCODE VARCHAR(50) COMMENT 'Code of the representative branch code',
	BRANCHNAME VARCHAR(512) COMMENT 'Name of the representative branch',
	TEAM_CODE NUMBER(38,0) COMMENT 'Representant Group ID',
	TEAM_NAME VARCHAR(512) COMMENT 'Advisor team description',
	ADVISOR_FULLNAME VARCHAR(512) COMMENT 'Representative name',
	FIRSTNAME VARCHAR(512) COMMENT 'Representative first name',
	LASTNAME VARCHAR(512) COMMENT 'Representative last name',
	ADVISOR_CORPORATION_NAME VARCHAR(512) COMMENT 'Representative corporation name',
	STATUS VARCHAR(512) COMMENT 'Active RR code indicator',
	GROUP_RSP_INDICATOR VARCHAR(512) COMMENT 'Group Retirement Savings Plan (RSP) indicator',
	PROVINCE_CODE VARCHAR(16777216) COMMENT 'province code',
	PROVINCE VARCHAR(16777216) COMMENT 'province name',
	ADVISOR_AUA_SEGMENT VARCHAR(512) COMMENT 'Advisor AUA Segment : 25k-100k',
	ADVISOR_AUA_SEGMENT_ORDER NUMBER(38,0) COMMENT 'Advisor AUA Segment ORDER',
	ADVISOR_START_DATE TIMESTAMP_NTZ(9) COMMENT 'the starting date of the advisor',
	NEW_ADVISOR NUMBER(38,0) COMMENT 'New advisor indicator (0 or 1)',
	ADVISOR_EFFECTIVENESS_DT TIMESTAMP_NTZ(9) COMMENT 'Its the date after one year of advisor joining date , implemented as part of Organic growth',
	DEPARTED_ADVISOR_IND NUMBER(1,0) COMMENT 'DEPARTED ADVISOR INDICATOR',
	END_DATE TIMESTAMP_NTZ(9) COMMENT 'Departure date of the advisor (TBD)',
	REASON VARCHAR(1000) COMMENT 'Reason of departure',
	NEW_FIRM VARCHAR(1000) COMMENT 'Departure destination',
	NEW_FIRM_TYPE VARCHAR(1000) COMMENT 'Departure destination Type',
	NEW_FIRM_BACK_OFFICE VARCHAR(1000) COMMENT 'Departure destination Back-Office',
	PRESTIGE_STATUS VARCHAR(100) COMMENT 'Prestige Status',
	PRIMARY_ROLE VARCHAR(500) COMMENT 'PRIMARY ROLE',
	TRANSITION_PERIOD_END_DATE TIMESTAMP_NTZ(9) COMMENT 'Advisor transition end date',
	DEAL_ASSESTS NUMBER(11,0) COMMENT 'Deal assets',
	EXPECTED_ASSESTS NUMBER(11,0) COMMENT 'Expected assets',
	PREVIOUS_FIRM VARCHAR(100) COMMENT 'Previous Firm of the Advisor',
	PREVIOUS_FIRM_TYPE VARCHAR(100) COMMENT 'Previous Firm type of the Advisor',
	AGE_SEGMENT VARCHAR(50) COMMENT 'Advisor Age Segment : 25-34',
	AGE_SEGMENT_ORD NUMBER(2,0) COMMENT 'Advisor Age Segment ORDER',
	SUSPENDED_IND NUMBER(1,0) COMMENT 'suspended Flag, if an advisor is deleted in certs but still have AUA, will be considered as suspended',
	ADVISOR_AGE NUMBER(38,0) COMMENT 'Age of the dealer',
	REP_EMAIL VARCHAR(1000) COMMENT 'Advisor repemail',
	CBM VARCHAR(1000) COMMENT 'Advisor cbm',
	BRANCH_NRD VARCHAR(1000) COMMENT 'Advisor branch nrd',
	BRANCH_ADDRESS1 VARCHAR(1000) COMMENT 'Advisor branch ADDRESS1',
	BRANCH_ADDRESS2 VARCHAR(1000) COMMENT 'Advisor branch ADDRESS2',
	BRANCH_CITY VARCHAR(1000) COMMENT 'Advisor branch city',
	BRANCH_POSTAL_CODE VARCHAR(1000) COMMENT 'Advisor branch postal code'
);
create or replace TABLE DB_IAW_#env#_DM.SHARED.WT_DIM_CLIENTS (
	HK_HUB VARCHAR(64) COMMENT 'Hash key for the Hub',
	MD_START_DT TIMESTAMP_NTZ(9) COMMENT 'Start Date of the image/version',
	MD_END_DT TIMESTAMP_NTZ(9) COMMENT 'End Date of the image/version',
	MD_HASH_NAT_KEYS VARCHAR(64) COMMENT 'Represents the whole set of hashed natural keys to be historized for an occurrence',
	MD_HASHDIFF_TYPE1 VARCHAR(40) COMMENT 'Represents the whole set of hashed type 1 attributes to be historized for an occurrence',
	MD_HASHDIFF_TYPE2 VARCHAR(40) COMMENT 'Represents the whole set of hashed type 2 attributes to be historized for an occurrence',
	MD_CREATION_DT TIMESTAMP_NTZ(9) COMMENT 'Creation Date Time of the occurrence',
	MD_CREATION_AUDIT_ID VARCHAR(1000) COMMENT 'Task execution ID',
	MD_MODIFY_DT TIMESTAMP_NTZ(9) COMMENT 'Modification Date Time of the occurrence',
	MD_MODIFY_AUDIT_ID VARCHAR(1000) COMMENT 'Task execution ID',
	MD_SOURCE VARCHAR(1000) COMMENT 'Represents the source system, file, etc. of the instance',
	MD_SRC_SYSTEM VARCHAR(100) COMMENT 'Source system',
	MD_EXTRACT_DT TIMESTAMP_NTZ(9) COMMENT 'Source extraction date',
	MD_SECURITY_TYPE VARCHAR(1000) COMMENT 'Capabilities for RLS',
	CLIENT_ID VARCHAR(100) COMMENT 'Client ID',
	PROVINCE_DESC VARCHAR(100) COMMENT 'Client province description',
	PROVINCE_CODE VARCHAR(10) COMMENT 'Client province code',
	COUNTRY_DESC VARCHAR(100) COMMENT 'Client country description',
	COUNTRY_CODE VARCHAR(10) COMMENT 'Client country code',
	INCOME_AMT NUMBER(38,2) COMMENT 'Client income',
	INCOME_LEVEL_1_SEGMENT VARCHAR(50) COMMENT 'Client level 1 income Segment : $30k - $50k',
	INCOME_LEVEL_1_SEGMENT_ORD NUMBER(2,0) COMMENT 'Client level 1 income Segment ORDER',
	INCOME_LEVEL_2_SEGMENT VARCHAR(50) COMMENT 'Client level 2 income Segment : Lower Income',
	INCOME_LEVEL_2_SEGMENT_ORD NUMBER(2,0) COMMENT 'Client level 2 income Segment ORDER',
	CLIENT_AUA_SEGMENT VARCHAR(50) COMMENT 'Client AUA Segment : 25k-100k',
	CLIENT_AUA_SEGMENT_ORD NUMBER(2,0) COMMENT 'Client AUA Segment ORDER',
	AGE_SEGMENT VARCHAR(50) COMMENT 'Client Age Segment : 25-34',
	AGE_SEGMENT_ORD NUMBER(2,0) COMMENT 'Client Age Segment ORDER',
	NEW_CLIENT_IND VARCHAR(16777216) COMMENT 'New client indicator',
	CLIENT_START_DT TIMESTAMP_NTZ(9) COMMENT 'Client Start Date',
	CLIENT_INV_KNOWLEDGE_LVL VARCHAR(10) COMMENT 'Clients Account Investment Knowledge',
	CLIENT_NAME VARCHAR(2000) COMMENT 'Client name',
	CLIENT_AGE NUMBER(38,0) COMMENT 'Client Age'
);
create or replace TABLE DB_IAW_#env#_DM.SHARED.WT_DIM_FINANCIAL_INSTRUMENTS (
	HK_HUB VARCHAR(40) COMMENT 'Hash key for the Hub',
	MD_START_DT TIMESTAMP_NTZ(9) COMMENT 'Start Date of the image/version',
	MD_END_DT TIMESTAMP_NTZ(9) COMMENT 'End Date of the image/version',
	MD_HASH_NAT_KEYS VARCHAR(64) COMMENT 'Represents the whole set of hashed natural keys to be historized for an occurrence',
	MD_HASHDIFF_TYPE1 VARCHAR(40) COMMENT 'Represents the whole set of hashed type 1 attributes to be historized for an occurrence',
	MD_HASHDIFF_TYPE2 VARCHAR(40) COMMENT 'Represents the whole set of hashed type 2 attributes to be historized for an occurrence',
	MD_CREATION_DT TIMESTAMP_NTZ(9) COMMENT 'Creation Date Time of the occurrence',
	MD_CREATION_AUDIT_ID VARCHAR(1000) COMMENT 'Task execution ID',
	MD_MODIFY_DT TIMESTAMP_NTZ(9) COMMENT 'Modification Date Time of the occurrence',
	MD_MODIFY_AUDIT_ID VARCHAR(1000) COMMENT 'Task execution ID',
	MD_SOURCE VARCHAR(1000) COMMENT 'Represents the source system, file, etc. of the instance',
	MD_SRC_SYSTEM VARCHAR(100) COMMENT 'Source system',
	MD_EXTRACT_DT TIMESTAMP_NTZ(9) COMMENT 'Source extraction date',
	MD_SECURITY_TYPE VARCHAR(1000) COMMENT 'Capabilities for RLS',
	INVESTMENT_PRODUCT_ID VARCHAR(16777216) COMMENT 'The product identifier',
	SYMBOL VARCHAR(512) COMMENT 'The product symbol (product code)',
	NAME VARCHAR(1000) COMMENT 'The product name',
	ASSET_CATEGORY VARCHAR(512) COMMENT 'The product asset category',
	CATEGORY VARCHAR(512) COMMENT 'The product category',
	PRODUCT_GROUP VARCHAR(512) COMMENT 'The product group',
	ISSUER_COMPANY_CODE VARCHAR(4) COMMENT 'The issuer company code',
	ISSUER_COMPANY_NAME VARCHAR(1000) COMMENT 'The issuer company name'
);
create or replace TABLE DB_IAW_#env#_DM.SHARED.WT_DIM_PLANS (
	HK_HUB VARCHAR(40) COMMENT 'Hash key for the Hub',
	MD_START_DT TIMESTAMP_NTZ(9) COMMENT 'Start Date of the image/version',
	MD_HASH_NAT_KEYS VARCHAR(64) COMMENT 'Represents the whole set of hashed natural keys to be historized for an occurrence',
	MD_HASHDIFF_TYPE2 VARCHAR(40) COMMENT 'Represents the whole set of hashed type 2 attributes to be historized for an occurrence',
	MD_CREATION_DT TIMESTAMP_NTZ(9) COMMENT 'Creation Date Time of the occurrence',
	MD_SOURCE VARCHAR(1000) COMMENT 'Represents the source system, file, etc. of the instance',
	MD_SRC_SYSTEM VARCHAR(100) COMMENT 'Source system',
	MD_EXTRACT_DT TIMESTAMP_NTZ(9) COMMENT 'Source extraction date',
	MD_SECURITY_TYPE VARCHAR(1000) COMMENT 'Capabilities for RLS',
	PLAN_CODE VARCHAR(8000) COMMENT 'The Plan code',
	PLAN_LABEL VARCHAR(8000) COMMENT 'The Plan label',
	ACCOUNT_TYPE VARCHAR(16777216) COMMENT 'The account type',
	GROUP_TYPE_CODE VARCHAR(8000) COMMENT 'The group type code',
	ACCUMULATION_TYPE VARCHAR(8000) COMMENT 'Accumulation type'
);
create or replace view DB_IAW_#env#_DM.SHARED.VW_DIM_ACCOUNTS(
	ID,
	"Source system",
	"Contract ID",
	"Univeris Plan ID",
	"Univeris Client ID",
	"Plan CD",
	"Plan LBL",
	"Account type",
	"Open date",
	"Close date",
	"Group type CD",
	"Accumulation Type",
	"Administrator type",
	"Account AUA segment",
	"Account AUA segment order",
	"Account Indicator",
	"Cash And Equivalent Profile %",
	"Income Profile %",
	"Growth Profile %",
	"Speculation Profile %",
	"Unknown Profile %",
	"Low Risk %",
	"Medium Risk %",
	"High Risk %",
	"Unknown Risk %",
	"NBIN Client ID"
) as 
SELECT  
	ID,
	MD_SRC_SYSTEM AS "Source system",
	CONTRACT_ID AS "Contract ID",
	UNIVERIS_PLAN_ID AS "Univeris Plan ID",
	UNIVERIS_CLIENT_ID AS "Univeris Client ID",
	PLAN_CODE AS "Plan CD",
	PLAN_LABEL AS "Plan LBL",
	ACCOUNT_TYPE AS "Account type",
	OPEN_DATE AS "Open date",
	CLOSE_DATE  AS "Close date",
	GROUP_TYPE_CODE AS "Group type CD",
	ACCUMULATION_TYPE AS "Accumulation Type",
	ADMINISTRATOR_TYPE AS "Administrator type",
	ACCOUNT_AUA_SEGMENT as "Account AUA segment",
    ACCOUNT_AUA_SEGMENT_ORDER as "Account AUA segment order",
	ACCOUNT_IND	AS "Account Indicator",
	CASH_EQLT_PROFILE_PCT AS "Cash And Equivalent Profile %",
	INCOME_PROFILE_PCT  AS "Income Profile %",
	GROWTH_PROFILE_PCT  AS "Growth Profile %",
	SPECULATION_PROFILE_PCT  AS "Speculation Profile %",
	UNKNOWN_PROFILE_PCT  AS "Unknown Profile %",
	LOW_RISK_PCT  AS "Low Risk %",
	MEDIUM_RISK_PCT  AS "Medium Risk %",
	HIGH_RISK_PCT  AS "High Risk %",
	UNKNOWN_RISK_PCT  AS "Unknown Risk %",
	NBIN_CLIENT_ID AS "NBIN Client ID"
FROM DB_IAW_#env#_DM."SHARED".DIM_ACCOUNTS;
create or replace view DB_IAW_#env#_DM.SHARED.VW_DIM_ADVISORS(
	MD_SRCSYSTEM,
	ID,
	"Master code",
	"Company code",
	"Company name",
	"Regulatory organization code",
	"Regulatory organization name",
	"Dealer code",
	"Dealer name",
	"Region code",
	"Region name",
	"Region VP",
	"Branch code",
	"Branch name",
	"Team code",
	"Team name",
	"Advisor fullname",
	"Last name",
	"First name",
	"Advisor corporation name",
	"Status",
	"Group RSP indicator",
	"Province code",
	"Province",
	"Advisor AUA segment",
	"Advisor AUA segment order",
	"Advisor starting date",
	"New Advisor",
	"Advisor effectiveness date",
	"Primary Role",
	"End date",
	"Departure reason",
	"New Firm",
	"New firm type",
	"New firm back office",
	"Prestige Status",
	"Advisor Age Segment",
	"Advisor Age Segment Order",
	"Transition Period End",
	"Deal Assets",
	"Expected Assets",
	"Previous Firm Name",
	"Previous Firm Type",
	"Suspended indicator",
	"Advisor age",
	"Rep email",
	"Branch Manager",
	"Branch address 1",
	"Branch address 2",
	"Branch city",
	"Branch postal code",
	"Branch NRD"
) as
SELECT
MD_SRC_SYSTEM AS MD_SRCSYSTEM ,
ID AS ID ,
MASTER_CODE AS 	"Master code" ,
COMPANY_CODE AS "Company code" ,
COMPANY_NAME AS	"Company name" ,
REGULATORY_ORGANIZATION_CODE AS	"Regulatory organization code",
REGULATORY_ORGANIZATION_NAME AS	"Regulatory organization name" ,
DEALER_CODE AS "Dealer code" ,
DEALER_NAME AS	"Dealer name" ,
REGION_CODE AS	"Region code",
REGION_NAME AS	"Region name" ,
REGION_VP AS "Region VP" ,
BRANCHCODE AS "Branch code" ,
BRANCHNAME AS	"Branch name" ,
TEAM_CODE AS	"Team code" ,
TEAM_NAME AS	"Team name" ,
ADVISOR_FULLNAME AS	"Advisor fullname",
LASTNAME AS	"Last name" ,
FIRSTNAME AS	"First name" ,
ADVISOR_CORPORATION_NAME as	"Advisor corporation name" ,
STATUS AS 	"Status" ,
GROUP_RSP_INDICATOR AS 	"Group RSP indicator" ,
PROVINCE_CODE as	"Province code" ,
PROVINCE AS 	"Province" ,
ADVISOR_AUA_SEGMENT as	"Advisor AUA segment" ,
ADVISOR_AUA_SEGMENT_ORDER as	"Advisor AUA segment order" , 	
ADVISOR_START_DATE as	"Advisor starting date" ,
NEW_ADVISOR as	"New Advisor" ,
CASE WHEN ADVISOR_EFFECIVENESS_DT='10000-12-31 00:00:00' THEN '9999-12-31 00:00:00' ELSE ADVISOR_EFFECIVENESS_DT END as	"Advisor effectiveness date",   --otherwise PowerBI won't accept this date	
PRIMARY_ROLE as "Primary Role",
END_DATE AS "End date",
REASON AS "Departure reason",
NEW_FIRM AS "New Firm",
NEW_FIRM_TYPE AS "New firm type",
NEW_FIRM_BACK_OFFICE AS "New firm back office",
PRESTIGE_STATUS AS "Prestige Status",
AGE_SEGMENT AS "Advisor Age Segment",
AGE_SEGMENT_ORD AS "Advisor Age Segment Order",
TRANSITION_PERIOD_END_DATE AS "Transition Period End",
DEAL_ASSESTS AS "Deal Assets",
EXPECTED_ASSESTS AS "Expected Assets",
PREVIOUS_FIRM AS "Previous Firm Name",
PREVIOUS_FIRM_TYPE AS "Previous Firm Type",
SUSPENDED_IND AS "Suspended indicator",
ADVISOR_AGE AS "Advisor age",
REP_EMAIL AS "Rep email",
CBM AS "Branch Manager",
BRANCH_ADDRESS1 AS "Branch address 1",
BRANCH_ADDRESS2 AS "Branch address 2",
BRANCH_CITY AS "Branch city",
BRANCH_POSTAL_CODE AS "Branch postal code",
BRANCH_NRD AS "Branch NRD"

FROM "SHARED".DIM_ADVISOR;
create or replace view DB_IAW_#env#_DM.SHARED.VW_DIM_CLIENTS(
	MD_SRCSYSTEM,
	ID,
	"Client ID",
	"Client type",
	"Province",
	"Country",
	"Income Segmentation",
	"Income Seg ORD",
	"Salary",
	"Salary ORD",
	"Client AUA segment",
	"Client AUA segment order",
	"Age segmentation",
	"Age segmentation ORD",
	"New Client",
	"Client Start Date",
	"Client Knowledge",
	"Client Name",
	"Client Age"
) as 
SELECT
MD_SRC_SYSTEM AS MD_SRCSYSTEM ,
ID ,
CLIENT_ID as  "Client ID",
NULL as	"Client type" ,
PROVINCE_DESC AS 	"Province" ,
COUNTRY_DESC as	"Country" ,
INCOME_LEVEL_2_SEGMENT as	"Income Segmentation" ,
INCOME_LEVEL_2_SEGMENT_ORD as	"Income Seg ORD" ,
INCOME_LEVEL_1_SEGMENT AS 	"Salary" ,
INCOME_LEVEL_1_SEGMENT_ORD as	"Salary ORD" ,
CLIENT_AUA_SEGMENT as	"Client AUA segment" ,
CLIENT_AUA_SEGMENT_ORD as	"Client AUA segment order" ,
AGE_SEGMENT as	"Age segmentation" ,
AGE_SEGMENT_ORD as	"Age segmentation ORD" ,
NEW_CLIENT_IND as	"New Client",
CLIENT_START_DT AS "Client Start Date",
CLIENT_INV_KNOWLEDGE_LVL AS "Client Knowledge",
CLIENT_NAME AS "Client Name",
CLIENT_AGE AS "Client Age"
FROM "SHARED".DIM_CLIENTS;
create or replace view DB_IAW_#env#_DM.SHARED.VW_DIM_MARKETPRODUCTS(
	MD_SRCSYSTEM,
	ID,
	"PRODUCT ID",
	"Symbol",
	"Name",
	"Asset category",
	"Category",
	"Group",
	"Issuer company code",
	"Issuer company name"
) as 
SELECT
MD_SRC_SYSTEM AS MD_SRCSYSTEM ,
	ID ,
INVESTMENT_PRODUCT_ID AS "PRODUCT ID",
SYMBOL as	"Symbol"  ,
NAME as	"Name" ,
ASSET_CATEGORY AS "Asset category" ,
CATEGORY as	"Category",
PRODUCT_GROUP as	"Group" ,
ISSUER_COMPANY_CODE as	"Issuer company code",
ISSUER_COMPANY_NAME as	"Issuer company name" 
--MD_START_DT as	MD_LOADDATE 
FROM  SHARED.DIM_FINANCIAL_INSTRUMENTS;
create or replace view DB_IAW_#env#_DM.SHARED.VW_DIM_PLANS(
	MD_SRCSYSTEM,
	ID,
	"Plan code",
	"Plan label",
	"Account type",
	"Group type code",
	"Accumulation type"
) as 
SELECT
MD_SRC_SYSTEM AS MD_SRCSYSTEM ,
	ID ,
PLAN_CODE AS "Plan code" ,
PLAN_LABEL AS	"Plan label" ,
ACCOUNT_TYPE AS	"Account type" ,
GROUP_TYPE_CODE AS	"Group type code" ,
ACCUMULATION_TYPE AS	"Accumulation type" 
--MD_START_DT AS	MD_LOADDATE 
FROM  SHARED.DIM_PLANS;
CREATE OR REPLACE PROCEDURE DB_IAW_#env#_DM.SHARED.SP_CONV_LOADDM_BDV_SHARED_TO_DM_WT_DIMADVISOR("ENV" VARCHAR(1000), "I_DATA_START_DATE" VARCHAR(1000))
RETURNS VARCHAR(16777216)
LANGUAGE SQL
EXECUTE AS OWNER
AS '
DECLARE
INS_PRE_DEL STRING;
INS_INSERT STRING;
INS_UPDATE STRING;
BEGIN
i_DATA_START_DATE :=CHAR(39)||i_DATA_START_DATE||CHAR(39);
INS_PRE_DEL := ''DELETE FROM DB_IAW_''||ENV||''_DM.SHARED.WT_DIM_ADVISOR WHERE 1=1 '';
INS_INSERT := ''
INSERT INTO DB_IAW_''||ENV||''_DM.SHARED.WT_DIM_ADVISOR (HK_HUB,MD_START_DT,MD_HASH_NAT_KEYS,MD_CREATION_DT,MD_CREATION_AUDIT_ID,MD_SOURCE,MD_SRC_SYSTEM,MD_EXTRACT_DT,MASTER_CODE,COMPANY_CODE,COMPANY_NAME,REGULATORY_ORGANIZATION_NAME,REGULATORY_ORGANIZATION_CODE,DEALER_CODE,DEALER_NAME,REGION_CODE,REGION_NAME,REGION_VP,BRANCHCODE,BRANCHNAME,TEAM_CODE,TEAM_NAME,ADVISOR_FULLNAME,FIRSTNAME,LASTNAME,ADVISOR_CORPORATION_NAME,STATUS,GROUP_RSP_INDICATOR,PROVINCE_CODE,PROVINCE,ADVISOR_AUA_SEGMENT,ADVISOR_AUA_SEGMENT_ORDER,ADVISOR_START_DATE,NEW_ADVISOR,ADVISOR_EFFECTIVENESS_DT,DEPARTED_ADVISOR_IND,PRIMARY_ROLE,END_DATE,REASON,NEW_FIRM,NEW_FIRM_TYPE,NEW_FIRM_BACK_OFFICE,PRESTIGE_STATUS,TRANSITION_PERIOD_END_DATE,DEAL_ASSESTS,EXPECTED_ASSESTS,PREVIOUS_FIRM,PREVIOUS_FIRM_TYPE,AGE_SEGMENT,AGE_SEGMENT_ORD,SUSPENDED_IND,ADVISOR_AGE,REP_EMAIL,CBM,BRANCH_ADDRESS1,BRANCH_ADDRESS2,BRANCH_CITY,BRANCH_POSTAL_CODE,BRANCH_NRD)
select rdv.HK_HUB,
TO_DATE(''||i_DATA_START_DATE||'', ''''YYYY-MM-DD''''),
rdv.HK_HUB,
CURRENT_TIMESTAMP,
''''-1'''',
rdv.MD_SOURCE,
rdv.MD_SRC_SYSTEM,
rdv.MD_EXTRACT_DT,
lv1.MASTER_CODE,
rdv.COMPANY_CODE,
rdv.COMPANY_NAME,
rdv.REGULATORY_ORGANIZATION_NAME,
rdv.REGULATORY_ORGANIZATION_CODE,
rdv.DEALER_CODE,
rdv.DEALER_NAME,
rdv.REGION_CODE,
rdv.REGION_NAME,
rdv.REGION_VP,
rdv.BRANCHCODE,
rdv.BRANCHNAME,
rdv.TEAM_CODE,
rdv.TEAM_NAME,
rdv.ADVISOR_FULLNAME,
rdv.FIRSTNAME,
rdv.LASTNAME,
rdv.ADVISOR_CORPORATION_NAME,
rdv.STATUS,
rdv.GROUP_RSP_INDICATOR,
rdv.PROVINCE_CODE,
rdv.PROVINCE,
lv3.ADVISOR_AUA_SEGMENT,
lv3.ADVISOR_AUA_SEGMENT_ORDER,
rdv.ADVISOR_START_DATE,
rdv.NEW_ADVISOR,
DATEADD(''''YY'''',1,rdv.ADVISOR_START_DATE),
rdv.DEPARTED_ADVISOR_IND,
rdv.PRIMARY_ROLE,
rdv.END_DATE,
rdv.REASON,
rdv.NEW_FIRM,
rdv.NEW_FIRM_TYPE,
rdv.NEW_FIRM_BACK_OFFICE,
rdv.PRESTIGE_STATUS,
rdv.TRANSITION_PERIOD_END_DATE,
rdv.DEAL_ASSESTS,
rdv.EXPECTED_ASSESTS,
rdv.PREVIOUS_FIRM,
rdv.PREVIOUS_FIRM_TYPE,
rdv.AGE_SEGMENT,
rdv.AGE_SEGMENT_ORD,
lv3.SUSPENDED_IND,
rdv.ADVISOR_AGE,
rdv.REP_EMAIL,
rdv.CBM,
rdv.BRANCH_ADDRESS1,
rdv.BRANCH_ADDRESS2,
rdv.BRANCH_CITY,
rdv.BRANCH_POSTAL_CODE,
rdv.BRANCH_NRD
	FROM (
		SELECT *
		FROM DB_IAW_''||ENV||''_DWH.SHARED_BDV.SAT_PARTY_ROLE_ADVISOR_COMPUTE_IAS_WEALTH
		) rdv
		JOIN (
		SELECT *
		FROM (
			SELECT *
				,ROW_NUMBER() OVER (
					PARTITION BY HK_HUB ORDER BY MD_START_DT DESC
					) RN
			FROM DB_IAW_''||ENV||''_DWH.SHARED_BDV.SAT_PARTY_ROLE_ADVISOR_COMPUTE_IAS_WEALTH lv
            WHERE lv.MD_START_DT <= TO_DATE(''||i_DATA_START_DATE||'', ''''YYYY-MM-DD'''')
			) SATHUB
		WHERE SATHUB.RN = 1
		) lv ON lv.HK_HUB = rdv.HK_HUB  AND lv.MD_ACTIVE =''''A'''' AND lv.MD_START_DT  = rdv.MD_START_DT 
	JOIN DB_IAW_''||ENV||''_DWH.SHARED_BDV.HUB_PARTY_ROLE_ADVISOR lv1 ON lv1.HK_HUB = rdv.HK_HUB
	LEFT JOIN (
		SELECT rdv2.*
		FROM (
			SELECT *
			FROM DB_IAW_''||ENV||''_DWH.SHARED_BDV.SAT_PARTY_ROLE_ADVISOR_AUA_SEG_COMPUTE
			) rdv2
			JOIN (
			SELECT *
			FROM (
				SELECT *
					,ROW_NUMBER() OVER (
						PARTITION BY HK_HUB ORDER BY MD_START_DT DESC
						) RN1
				FROM DB_IAW_''||ENV||''_DWH.SHARED_BDV.SAT_PARTY_ROLE_ADVISOR_AUA_SEG_COMPUTE lv2
				WHERE lv2.MD_START_DT <= TO_DATE(''||i_DATA_START_DATE||'', ''''YYYY-MM-DD'''')
				) SATHUB1
			WHERE SATHUB1.RN1 = 1
			) lv2 ON lv2.HK_HUB = rdv2.HK_HUB  AND rdv2.MD_ACTIVE =''''A'''' AND lv2.MD_START_DT = rdv2.MD_START_DT
		) lv3 ON lv3.HK_HUB = rdv.HK_HUB
		WHERE lv3.ADVISOR_AUA_SEGMENT != ''''0''''
		'';
INS_UPDATE :=''UPDATE DB_IAW_''||ENV||''_DM.SHARED.WT_DIM_ADVISOR
SET
	MD_HASHDIFF_TYPE2=SHA1(
				CONCAT(
				COALESCE(COMPANY_CODE,''''#NULL#''''), ''''|'''',
				COALESCE(COMPANY_NAME,''''#NULL#''''), ''''|'''',
				COALESCE(REGULATORY_ORGANIZATION_NAME,''''#NULL#'''') ,''''|'''',
				COALESCE(REGULATORY_ORGANIZATION_CODE,''''#NULL#''''), ''''|'''',
				COALESCE(DEALER_CODE,''''#NULL#''''), ''''|'''',
				COALESCE(DEALER_NAME,''''#NULL#''''), ''''|'''',
				COALESCE(REGION_CODE,''''#NULL#''''), ''''|'''',
				COALESCE(REGION_NAME,''''#NULL#'''') ,''''|'''',
				COALESCE(REGION_VP,''''#NULL#''''), ''''|'''',
				COALESCE(BRANCHCODE,''''#NULL#''''), ''''|'''',
				COALESCE(BRANCHNAME,''''#NULL#''''), ''''|'''',
				COALESCE(TO_VARCHAR(TEAM_CODE),''''#NULL#''''), ''''|'''',
				COALESCE(TEAM_NAME,''''#NULL#'''') ,''''|'''',
				COALESCE(ADVISOR_FULLNAME,''''#NULL#''''), ''''|'''',
				COALESCE(FIRSTNAME,''''#NULL#''''), ''''|'''',
				COALESCE(LASTNAME,''''#NULL#''''), ''''|'''',
				COALESCE(ADVISOR_CORPORATION_NAME,''''#NULL#''''), ''''|'''',
				COALESCE(TO_VARCHAR(STATUS),''''#NULL#'''') ,''''|'''',
				COALESCE(GROUP_RSP_INDICATOR,''''#NULL#''''), ''''|'''',
				COALESCE(PROVINCE_CODE,''''#NULL#''''), ''''|'''',
				COALESCE(PROVINCE,''''#NULL#''''), ''''|'''',
				COALESCE(ADVISOR_AUA_SEGMENT,''''#NULL#''''), ''''|'''',
				COALESCE(TO_VARCHAR(ADVISOR_AUA_SEGMENT_ORDER),''''#NULL#'''') ,''''|'''',
				COALESCE(TO_VARCHAR(ADVISOR_START_DATE),''''#NULL#''''), ''''|'''',
				COALESCE(TO_VARCHAR(NEW_ADVISOR),''''#NULL#''''), ''''|'''',
				COALESCE(TO_VARCHAR(DEPARTED_ADVISOR_IND),''''#NULL#''''), ''''|'''',
				COALESCE(PRIMARY_ROLE,''''#NULL#'''')
				,''''|'''',COALESCE(TRIM(AGE_SEGMENT),''''#NULL#'''')
				,''''|'''',COALESCE(TRIM(AGE_SEGMENT_ORD),''''#NULL#'''')
				,''''|'''',COALESCE(TO_VARCHAR(SUSPENDED_IND),''''#NULL#'''')
				,''''|'''',COALESCE(TO_VARCHAR(ADVISOR_AGE),''''#NULL#'''')
,''''|'''',COALESCE(REP_EMAIL,''''#NULL#'''')
,''''|'''',COALESCE(CBM,''''#NULL#'''')
,''''|'''',COALESCE(BRANCH_ADDRESS1,''''#NULL#'''')
,''''|'''',COALESCE(BRANCH_ADDRESS2,''''#NULL#'''')
,''''|'''',COALESCE(BRANCH_CITY,''''#NULL#'''')
,''''|'''',COALESCE(BRANCH_POSTAL_CODE,''''#NULL#'''')
,''''|'''',COALESCE(BRANCH_NRD,''''#NULL#'''')
				)),
	MD_HASHDIFF_TYPE1 = SHA1(
				CONCAT(COALESCE(TRIM(TO_VARCHAR(END_DATE)),''''#NULL#''''), ''''|''''
				,  COALESCE(to_varchar(REASON) , ''''#NULL#''''), ''''|''''
				,  COALESCE(to_varchar(NEW_FIRM) , ''''#NULL#''''), ''''|''''
				,  COALESCE(to_varchar(NEW_FIRM_TYPE) , ''''#NULL#''''), ''''|''''
				,  COALESCE(to_varchar(NEW_FIRM_BACK_OFFICE) , ''''#NULL#''''), ''''|''''
				,  COALESCE(to_varchar(PRESTIGE_STATUS) , ''''#NULL#''''), ''''|''''
				,  COALESCE(to_varchar(TRANSITION_PERIOD_END_DATE) , ''''#NULL#''''), ''''|''''
				,  COALESCE(to_varchar(DEAL_ASSESTS) , ''''#NULL#''''), ''''|''''
				,  COALESCE(to_varchar(EXPECTED_ASSESTS) , ''''#NULL#''''), ''''|''''
				,  COALESCE(PREVIOUS_FIRM , ''''#NULL#''''), ''''|''''
				,  COALESCE(PREVIOUS_FIRM_TYPE, ''''#NULL#'''')				
				))
Where HK_HUB <> ''''0'''';
	'';
EXECUTE IMMEDIATE :INS_PRE_DEL;
EXECUTE IMMEDIATE :INS_INSERT;
EXECUTE IMMEDIATE :INS_UPDATE;
END
';
CREATE OR REPLACE PROCEDURE DB_IAW_#env#_DM.SHARED.SP_CONV_LOADDM_IAS_NBIN_TO_DM_WTPLAN("ENV" VARCHAR(1000), "I_DATA_START_DATE" VARCHAR(1000))
RETURNS VARCHAR(16777216)
LANGUAGE SQL
EXECUTE AS OWNER
AS '
DECLARE
INS_PRE_DEL STRING;
INS_INSERT STRING;
INS_UPDATE STRING;
BEGIN
i_DATA_START_DATE :=CHAR(39)||i_DATA_START_DATE||CHAR(39);
INS_PRE_DEL := ''DELETE FROM DB_IAW_''||ENV||''_DM.SHARED.WT_DIM_PLANS WHERE MD_SRC_SYSTEM = ''''IAS'''' '';
INS_INSERT := ''
INSERT INTO DB_IAW_''||ENV||''_DM.SHARED.WT_DIM_PLANS (HK_HUB,MD_HASH_NAT_KEYS,MD_SOURCE,MD_SRC_SYSTEM,MD_EXTRACT_DT,PLAN_CODE,PLAN_LABEL,ACCOUNT_TYPE,GROUP_TYPE_CODE,ACCUMULATION_TYPE,MD_CREATION_DT,MD_START_DT)
SELECT RDV.HK_HUB,
	RDV.HK_HUB,
	RDV.MD_SOURCE,
	RDV.MD_SRC_SYSTEM,
	RDV.MD_EXTRACT_DT,
	RDV.PLAN_CODE,
	RDV.PLAN_LABEL,
	RDV.ACCOUNT_TYPE,
	RDV.GROUP_TYPE_CODE,
	RDV.ACCUMULATION_TYPE,
	CURRENT_TIMESTAMP,
	TO_DATE(''||i_DATA_START_DATE||'',''''YYYY-MM-DD'''')
FROM (
	SELECT *
	FROM DB_IAW_''||ENV||''_DWH.SHARED_BDV.SAT_REF_INVESTMENT_SAVING_PROGRAM_TYPES_COMPUTE
	) rdv
	JOIN (
	SELECT *
	FROM (
		SELECT *
			,ROW_NUMBER() OVER (
				PARTITION BY HK_HUB ORDER BY MD_START_DT DESC
				) RN
		FROM DB_IAW_''||ENV||''_DWH.SHARED_BDV.SAT_REF_INVESTMENT_SAVING_PROGRAM_TYPES_COMPUTE lv
		WHERE MD_START_DT <= TO_DATE(''||i_DATA_START_DATE||'', ''''YYYY-MM-DD'''')
		) SATHUB
	WHERE SATHUB.RN = 1
	) lv ON lv.HK_HUB = rdv.HK_HUB AND lv.MD_START_DT = rdv.MD_START_DT
WHERE rdv.MD_ACTIVE = ''''A''''  AND rdv.MD_SRC_SYSTEM = ''''IAS''''
              '';
INS_UPDATE :=''
UPDATE DB_IAW_''||ENV||''_DM.SHARED.WT_DIM_PLANS
SET
	MD_HASHDIFF_TYPE2=SHA1(
				CONCAT(
				COALESCE(PLAN_LABEL,''''#NULL#''''), ''''|'''',
				COALESCE(ACCOUNT_TYPE,''''#NULL#''''), ''''|'''',
				COALESCE(GROUP_TYPE_CODE,''''#NULL#''''), ''''|'''',
				COALESCE(ACCUMULATION_TYPE,''''#NULL#''''), ''''|''''
				))
Where HK_HUB <> ''''0''''
AND MD_SRC_SYSTEM = ''''IAS''''
'';
EXECUTE IMMEDIATE :INS_PRE_DEL;
EXECUTE IMMEDIATE :INS_INSERT;
EXECUTE IMMEDIATE :INS_UPDATE;
END
';
CREATE OR REPLACE PROCEDURE DB_IAW_#env#_DM.SHARED.SP_CONV_LOADDM_NBIN_BDV_SHARED_TO_DM_WT_DIMFINANCIALINSTRUMENTS("ENV" VARCHAR(1000), "I_DATA_START_DATE" VARCHAR(1000))
RETURNS VARCHAR(16777216)
LANGUAGE SQL
EXECUTE AS OWNER
AS '
DECLARE
INS_PRE_DEL STRING;
INS_INSERT STRING;
INS_UPDATE STRING;

BEGIN
i_DATA_START_DATE :=CHAR(39)||i_DATA_START_DATE||CHAR(39);
INS_PRE_DEL := ''TRUNCATE TABLE DB_IAW_''||ENV||''_DM.SHARED.WT_DIM_FINANCIAL_INSTRUMENTS  '';
INS_INSERT := ''
INSERT INTO DB_IAW_''||ENV||''_DM.SHARED.WT_DIM_FINANCIAL_INSTRUMENTS(
HK_HUB
,MD_START_DT
,MD_HASH_NAT_KEYS
,MD_CREATION_DT
,MD_SOURCE
,MD_CREATION_AUDIT_ID
,MD_SRC_SYSTEM
,MD_EXTRACT_DT
,INVESTMENT_PRODUCT_ID
,SYMBOL
,NAME
,ASSET_CATEGORY
,CATEGORY
,PRODUCT_GROUP
,ISSUER_COMPANY_CODE
,ISSUER_COMPANY_NAME
)
SELECT 
HUB.HK_HUB
,TO_DATE(''||i_DATA_START_DATE||'',''''YYYY-MM-DD'''')
,HUB.HK_HUB
,CURRENT_TIMESTAMP
,HUB.MD_SOURCE
,''''-1''''
,CVBDV.MD_SRC_SYSTEM
,CVBDV.MD_EXTRACT_DT
,HUB.INVESTMENT_PRODUCT_ID
,CVBDV.SYMBOL
,CVBDV.NAME
,CVBDV.ASSET_CATEGORY
,CVBDV.CATEGORY
,CVBDV.PRODUCT_GROUP
,CVBDV.ISSUER_COMPANY_CODE
,CVBDV.ISSUER_COMPANY_NAME
FROM (SELECT * FROM  (SELECT *, ROW_NUMBER() OVER(PARTITION BY HK_HUB ORDER BY MD_START_DT DESC) RN FROM DB_IAW_''||ENV||''_DWH.SHARED_BDV.SAT_INVESTMENT_PRODUCT_TYPE_COMPUTE WHERE MD_START_DT <= TO_DATE(''||i_DATA_START_DATE||'',''''YYYY-MM-DD'''')) BDV WHERE BDV.RN = 1 AND BDV.MD_ACTIVE =''''A'''') CVBDV JOIN DB_IAW_''||ENV||''_DWH.SHARED_RDV.HUB_INVESTMENT_PRODUCT_TYPE HUB ON CVBDV.HK_HUB = HUB.HK_HUB
			
              '';
INS_UPDATE :='' UPDATE DB_IAW_''||ENV||''_DM.SHARED.WT_DIM_FINANCIAL_INSTRUMENTS
SET
	MD_HASHDIFF_TYPE2=SHA1(
				CONCAT(
				COALESCE(SYMBOL ,''''#NULL#''''), ''''|'''',
				COALESCE("NAME" ,''''#NULL#''''), ''''|'''',
				COALESCE(ASSET_CATEGORY ,''''#NULL#''''), ''''|'''',
				COALESCE(CATEGORY ,''''#NULL#''''), ''''|'''',
				COALESCE(PRODUCT_GROUP ,''''#NULL#''''), ''''|'''',
				COALESCE(ISSUER_COMPANY_CODE ,''''#NULL#''''), ''''|'''',
				COALESCE(ISSUER_COMPANY_NAME ,''''#NULL#'''')
				))
Where HK_HUB <> ''''0'''';
'';
EXECUTE IMMEDIATE :INS_PRE_DEL;
EXECUTE IMMEDIATE :INS_INSERT;
EXECUTE IMMEDIATE :INS_UPDATE;

END
';
CREATE OR REPLACE PROCEDURE DB_IAW_#env#_DM.SHARED.SP_CONV_LOADDM_RDV_BDV_IAS_SHARED_TO_DM_WT_DIMACCOUNT("ENV" VARCHAR(1000), "I_DATA_START_DATE" VARCHAR(1000), "I_AUDIT_ID" VARCHAR(1000))
RETURNS VARCHAR(16777216)
LANGUAGE SQL
EXECUTE AS OWNER
AS '
DECLARE
INS_PRE_DEL STRING;
INS_INSERT STRING;
INS_UPDATE STRING;

BEGIN
i_DATA_START_DATE :=CHAR(39)||i_DATA_START_DATE||CHAR(39);
I_AUDIT_ID :=CHAR(39)||I_AUDIT_ID||CHAR(39);
INS_PRE_DEL := ''DELETE FROM DB_IAW_''||ENV||''_DM.SHARED.WT_DIM_ACCOUNTS WHERE MD_SRC_SYSTEM = ''''IAS-UNIVERIS'''' '';
INS_INSERT := ''
INSERT INTO DB_IAW_''||ENV||''_DM.SHARED.WT_DIM_ACCOUNTS (
HK_HUB
,MD_START_DT
,MD_HASH_NAT_KEYS
,MD_CREATION_DT
,MD_CREATION_AUDIT_ID
,MD_SOURCE
,MD_SRC_SYSTEM
,MD_EXTRACT_DT
,CONTRACT_ID
,UNIVERIS_PLAN_ID
,UNIVERIS_CLIENT_ID
,PLAN_CODE
,PLAN_LABEL
,ACCOUNT_TYPE
,OPEN_DATE
,CLOSE_DATE
,GROUP_TYPE_CODE
,ACCUMULATION_TYPE
,ADMINISTRATOR_TYPE
,ACCOUNT_AUA_SEGMENT
,ACCOUNT_AUA_SEGMENT_ORDER
,ACCOUNT_IND )
SELECT hub.HK_HUB
,TO_DATE(''||i_DATA_START_DATE||'',''''YYYY-MM-DD'''')
,hub.HK_HUB
,CURRENT_TIMESTAMP
,''||I_AUDIT_ID||''
,rdv.MD_SOURCE
,rdv.MD_SRC_SYSTEM
,rdv.MD_EXTRACT_DT
,hub.CONTRACT_ID
,hub.UNIVERIS_PLAN_ID
,hub.UNIVERIS_CLIENT_ID
,bdv2.PLAN_CODE
,bdv2.PLAN_LABEL
,bdv2.ACCOUNT_TYPE
,rdv.SETUP_DT
,rdv.CLOSE_DT
,bdv2.GROUP_TYPE_CODE
,bdv2.ACCUMULATION_TYPE
,rdv.ADMINISTRATOR_TYPE
,satseg2.ACCOUNT_AUA_SEGMENT
,satseg2.ACCOUNT_AUA_SEGMENT_ORDER
,bdv2.ACCOUNT_IND
	FROM (
	SELECT *
			FROM DB_IAW_''||ENV||''_DWH.SHARED_RDV.SAT_CONTRACT_IAS_UNIVERIS
			)rdv
		JOIN (
		SELECT *
			FROM (
				SELECT *
					,ROW_NUMBER() OVER (
						PARTITION BY HK_HUB ORDER BY MD_START_DT DESC
						) RN
				FROM DB_IAW_''||ENV||''_DWH.SHARED_RDV.SAT_CONTRACT_IAS_UNIVERIS
				WHERE MD_START_DT <= TO_DATE(''||i_DATA_START_DATE||'', ''''YYYY-MM-DD'''')
				) SATHUB
			WHERE SATHUB.RN = 1
			) rdvcv ON rdvcv.HK_HUB = rdv.HK_HUB AND rdvcv.MD_START_DT = rdv.MD_START_DT
		JOIN
		(
			SELECT bdv.*
			FROM (
				SELECT *
				FROM DB_IAW_''||ENV||''_DWH.SHARED_BDV.SAT_CONTRACT_COMPUTE
				) bdv
			JOIN (
				SELECT *
				FROM (
					SELECT *
						,ROW_NUMBER() OVER (
							PARTITION BY HK_HUB ORDER BY MD_START_DT DESC
							) RN1
					FROM DB_IAW_''||ENV||''_DWH.SHARED_BDV.SAT_CONTRACT_COMPUTE
					WHERE MD_START_DT <= TO_DATE(''||i_DATA_START_DATE||'', ''''YYYY-MM-DD'''')
					) SATHUB1
				WHERE SATHUB1.RN1 = 1
				) bdvcv ON bdvcv.HK_HUB = bdv.HK_HUB AND bdvcv.MD_START_DT = bdv.MD_START_DT
			
			)bdv2 ON bdv2.HK_HUB = rdv.HK_HUB AND bdv2.MD_ACTIVE = ''''A'''' AND bdv2.MD_SRC_SYSTEM = ''''IAS-UNIVERIS''''
			JOIN DB_IAW_''||ENV||''_DWH.SHARED_RDV.HUB_CONTRACT hub ON hub.HK_HUB = rdv.HK_HUB
			INNER JOIN
			(
			SELECT satseg.*
			FROM (
				SELECT *
				FROM DB_IAW_''||ENV||''_DWH.SHARED_BDV.SAT_CONTRACT_AUA_SEG_COMPUTE
				) satseg
			JOIN (
				SELECT *
				FROM (
					SELECT *
						,ROW_NUMBER() OVER (
							PARTITION BY HK_HUB ORDER BY MD_START_DT DESC
							) RN2
					FROM DB_IAW_''||ENV||''_DWH.SHARED_BDV.SAT_CONTRACT_AUA_SEG_COMPUTE
					WHERE MD_START_DT <= TO_DATE(''||i_DATA_START_DATE||'', ''''YYYY-MM-DD'''')
					) SATHUB2
				WHERE SATHUB2.RN2 = 1 
				) satsegcv ON satsegcv.HK_HUB = satseg.HK_HUB and satsegcv.MD_START_DT = satseg.MD_START_DT
			)satseg2 ON satseg2.HK_HUB = hub.HK_HUB	AND satseg2.MD_ACTIVE = ''''A''''
			WHERE rdv.MD_ACTIVE = ''''A''''	AND satseg2.ACCOUNT_AUA_SEGMENT != ''''0''''			
              '';
INS_UPDATE :='' UPDATE DB_IAW_''||ENV||''_DM.SHARED.WT_DIM_ACCOUNTS
SET
	MD_HASHDIFF_TYPE2=SHA1(
				CONCAT(
				COALESCE(PLAN_CODE,''''#NULL#''''), ''''|'''',
				COALESCE(PLAN_LABEL,''''#NULL#''''), ''''|'''',
				COALESCE(ACCOUNT_TYPE,''''#NULL#''''), ''''|'''',
				COALESCE(TO_VARCHAR(OPEN_DATE),''''#NULL#''''), ''''|'''',
				COALESCE(TO_VARCHAR(CLOSE_DATE),''''#NULL#''''), ''''|'''',
				COALESCE(GROUP_TYPE_CODE,''''#NULL#''''), ''''|'''',
				COALESCE(ACCUMULATION_TYPE,''''#NULL#''''), ''''|'''',
				COALESCE(ADMINISTRATOR_TYPE,''''#NULL#''''), ''''|'''',
				COALESCE(ACCOUNT_AUA_SEGMENT,''''#NULL#''''), ''''|'''',
				COALESCE(TO_VARCHAR(ACCOUNT_AUA_SEGMENT_ORDER),''''#NULL#''''), ''''|'''',
				COALESCE(TO_VARCHAR(ACCOUNT_IND),''''#NULL#'''')
				))
Where HK_HUB <> ''''0'''' and MD_SRC_SYSTEM = ''''IAS-UNIVERIS'''';
'';

EXECUTE IMMEDIATE :INS_PRE_DEL;
EXECUTE IMMEDIATE :INS_INSERT;
EXECUTE IMMEDIATE :INS_UPDATE;

END
';
CREATE OR REPLACE PROCEDURE DB_IAW_#env#_DM.SHARED.SP_CONV_LOADDM_RDV_BDV_INVESTIA_SHARED_TO_DM_WT_DIMACCOUNT("ENV" VARCHAR(1000), "I_DATA_START_DATE" VARCHAR(1000), "I_AUDIT_ID" VARCHAR(1000))
RETURNS VARCHAR(16777216)
LANGUAGE SQL
EXECUTE AS OWNER
AS '
DECLARE
INS_PRE_DEL STRING;
INS_INSERT STRING;
INS_UPDATE STRING;

BEGIN
i_DATA_START_DATE :=CHAR(39)||i_DATA_START_DATE||CHAR(39);
I_AUDIT_ID :=CHAR(39)||I_AUDIT_ID||CHAR(39);
INS_PRE_DEL := ''DELETE FROM DB_IAW_''||ENV||''_DM.SHARED.WT_DIM_ACCOUNTS WHERE MD_SRC_SYSTEM = ''''INVESTIA-UNIVERIS'''' '';
INS_INSERT := ''
INSERT INTO DB_IAW_''||ENV||''_DM.SHARED.WT_DIM_ACCOUNTS (
HK_HUB
,MD_START_DT
,MD_HASH_NAT_KEYS
,MD_CREATION_DT
,MD_CREATION_AUDIT_ID
,MD_SOURCE
,MD_SRC_SYSTEM
,MD_EXTRACT_DT
,CONTRACT_ID
,UNIVERIS_PLAN_ID
,UNIVERIS_CLIENT_ID
,PLAN_CODE
,PLAN_LABEL
,ACCOUNT_TYPE
,OPEN_DATE
,CLOSE_DATE
,GROUP_TYPE_CODE
,ACCUMULATION_TYPE
,ADMINISTRATOR_TYPE
,ACCOUNT_AUA_SEGMENT
,ACCOUNT_AUA_SEGMENT_ORDER
,ACCOUNT_IND )
SELECT hub.HK_HUB
,TO_DATE(''||i_DATA_START_DATE||'',''''YYYY-MM-DD'''')
,hub.HK_HUB
,CURRENT_TIMESTAMP
,''||I_AUDIT_ID||''
,bdv2.MD_SOURCE
,rdv.MD_SRC_SYSTEM
,bdv2.MD_EXTRACT_DT
,hub.CONTRACT_ID
,hub.UNIVERIS_PLAN_ID
,hub.UNIVERIS_CLIENT_ID
,bdv2.PLAN_CODE
,bdv2.PLAN_LABEL
,bdv2.ACCOUNT_TYPE
,rdv.SETUP_DT
,rdv.CLOSE_DT
,bdv2.GROUP_TYPE_CODE
,bdv2.ACCUMULATION_TYPE
,rdv.ADMINISTRATOR_TYPE
,satseg2.ACCOUNT_AUA_SEGMENT
,satseg2.ACCOUNT_AUA_SEGMENT_ORDER
,bdv2.ACCOUNT_IND
	FROM (
	SELECT *
			FROM DB_IAW_''||ENV||''_DWH.SHARED_RDV.SAT_CONTRACT_INVESTIA_UNIVERIS
			)rdv
		JOIN (
		SELECT *
			FROM (
				SELECT *
					,ROW_NUMBER() OVER (
						PARTITION BY HK_HUB ORDER BY MD_START_DT DESC
						) RN
				FROM DB_IAW_''||ENV||''_DWH.SHARED_RDV.SAT_CONTRACT_INVESTIA_UNIVERIS
				WHERE MD_START_DT <= TO_DATE(''||i_DATA_START_DATE||'', ''''YYYY-MM-DD'''')
				) SATHUB
			WHERE SATHUB.RN = 1
			) rdvcv ON rdvcv.HK_HUB = rdv.HK_HUB AND rdvcv.MD_START_DT = rdv.MD_START_DT
		JOIN
		(
			SELECT bdv.*
			FROM (
				SELECT *
				FROM DB_IAW_''||ENV||''_DWH.SHARED_BDV.SAT_CONTRACT_COMPUTE
				) bdv
			JOIN (
				SELECT *
				FROM (
					SELECT *
						,ROW_NUMBER() OVER (
							PARTITION BY HK_HUB ORDER BY MD_START_DT DESC
							) RN1
					FROM DB_IAW_''||ENV||''_DWH.SHARED_BDV.SAT_CONTRACT_COMPUTE
					WHERE MD_START_DT <= TO_DATE(''||i_DATA_START_DATE||'', ''''YYYY-MM-DD'''')
					) SATHUB1
				WHERE SATHUB1.RN1 = 1
				) bdvcv ON bdvcv.HK_HUB = bdv.HK_HUB AND bdvcv.MD_START_DT = bdv.MD_START_DT
			
			)bdv2 ON bdv2.HK_HUB = rdv.HK_HUB AND bdv2.MD_ACTIVE = ''''A'''' AND bdv2.MD_SRC_SYSTEM = ''''INVESTIA-UNIVERIS''''
			JOIN DB_IAW_''||ENV||''_DWH.SHARED_RDV.HUB_CONTRACT hub ON hub.HK_HUB = rdv.HK_HUB
			LEFT JOIN
			(
			SELECT satseg.*
			FROM (
				SELECT *
				FROM DB_IAW_''||ENV||''_DWH.SHARED_BDV.SAT_CONTRACT_AUA_SEG_COMPUTE
				) satseg
			JOIN (
				SELECT *
				FROM (
					SELECT *
						,ROW_NUMBER() OVER (
							PARTITION BY HK_HUB ORDER BY MD_START_DT DESC
							) RN2
					FROM DB_IAW_''||ENV||''_DWH.SHARED_BDV.SAT_CONTRACT_AUA_SEG_COMPUTE
					WHERE MD_START_DT <= TO_DATE(''||i_DATA_START_DATE||'', ''''YYYY-MM-DD'''')
					) SATHUB2
				WHERE SATHUB2.RN2 = 1 
				) satsegcv ON satsegcv.HK_HUB = satseg.HK_HUB and satsegcv.MD_START_DT = satseg.MD_START_DT
			)satseg2 ON satseg2.HK_HUB = hub.HK_HUB	AND satseg2.MD_ACTIVE = ''''A''''
			WHERE rdv.MD_ACTIVE = ''''A''''	AND satseg2.ACCOUNT_AUA_SEGMENT != ''''0'''' 		
              '';
INS_UPDATE :='' UPDATE DB_IAW_''||ENV||''_DM.SHARED.WT_DIM_ACCOUNTS
SET
	MD_HASHDIFF_TYPE2=SHA1(
				CONCAT(
				COALESCE(PLAN_CODE,''''#NULL#''''), ''''|'''',
				COALESCE(PLAN_LABEL,''''#NULL#''''), ''''|'''',
				COALESCE(ACCOUNT_TYPE,''''#NULL#''''), ''''|'''',
				COALESCE(TO_VARCHAR(OPEN_DATE),''''#NULL#''''), ''''|'''',
				COALESCE(TO_VARCHAR(CLOSE_DATE),''''#NULL#''''), ''''|'''',
				COALESCE(GROUP_TYPE_CODE,''''#NULL#''''), ''''|'''',
				COALESCE(ACCUMULATION_TYPE,''''#NULL#''''), ''''|'''',
				COALESCE(ADMINISTRATOR_TYPE,''''#NULL#''''), ''''|'''',
				COALESCE(ACCOUNT_AUA_SEGMENT,''''#NULL#''''), ''''|'''',
				COALESCE(TO_VARCHAR(ACCOUNT_AUA_SEGMENT_ORDER),''''#NULL#''''), ''''|'''',
				COALESCE(TO_VARCHAR(ACCOUNT_IND),''''#NULL#'''')
				))
Where HK_HUB <> ''''0'''' and MD_SRC_SYSTEM = ''''INVESTIA-UNIVERIS'''';
'';

EXECUTE IMMEDIATE :INS_PRE_DEL;
EXECUTE IMMEDIATE :INS_INSERT;
EXECUTE IMMEDIATE :INS_UPDATE;

END
';
CREATE OR REPLACE PROCEDURE DB_IAW_#env#_DM.SHARED.SP_CONV_LOADDM_RDV_BDV_INVESTIA_UNIVERIS_SHARED_TO_DM_WT_DIMCLIENTS("ENV" VARCHAR(1000), "I_DATA_START_DATE" VARCHAR(1000))
RETURNS VARCHAR(16777216)
LANGUAGE SQL
EXECUTE AS OWNER
AS '
DECLARE
INS_PRE_DEL STRING;
INS_INSERT STRING;
INS_UPDATE STRING;

BEGIN
i_DATA_START_DATE :=CHAR(39)||i_DATA_START_DATE||CHAR(39);
INS_PRE_DEL := ''DELETE FROM DB_IAW_''||ENV||''_DM.SHARED.WT_DIM_CLIENTS WHERE MD_SRC_SYSTEM = ''''INVESTIA-UNIVERIS'''' '';
INS_INSERT := ''
INSERT INTO DB_IAW_''||ENV||''_DM.SHARED.WT_DIM_CLIENTS (
HK_HUB
,MD_START_DT
,MD_HASH_NAT_KEYS
,MD_CREATION_DT
,MD_SOURCE
,MD_SRC_SYSTEM
,MD_EXTRACT_DT
,CLIENT_ID
,PROVINCE_DESC
,PROVINCE_CODE
,COUNTRY_DESC
,COUNTRY_CODE
,INCOME_AMT
,INCOME_LEVEL_1_SEGMENT
,INCOME_LEVEL_1_SEGMENT_ORD
,INCOME_LEVEL_2_SEGMENT
,INCOME_LEVEL_2_SEGMENT_ORD
,CLIENT_AUA_SEGMENT
,CLIENT_AUA_SEGMENT_ORD
,AGE_SEGMENT
,AGE_SEGMENT_ORD
,NEW_CLIENT_IND
,CLIENT_NAME	 	
,CLIENT_AGE )
SELECT hub.HK_HUB
	,TO_DATE(''||i_DATA_START_DATE||'',''''YYYY-MM-DD'''')
	,hub.HK_HUB
	,CURRENT_TIMESTAMP
	,rdv.MD_SOURCE
	,rdv.MD_SRC_SYSTEM
	,rdv.MD_EXTRACT_DT
	,hub.CLIENT_ID
	,DB_IAW_''||ENV||''_DWH.BUSINESS_RULES.UDF_CONV_BR_ALL_CLIENTS_PROVINCE_005(rdv.IVR_RES_CD,CASE WHEN rdv.IVR_RES_CD IN (''''SK'''',''''MB'''',''''NS'''',''''NL'''',''''PE'''',''''QC'''',''''ON'''',''''BC'''',''''NB'''',''''AB'''',''''NT'''',''''YT'''',''''NU'''') THEN ''''CAN'''' WHEN LEN(rdv.IVR_RES_CD) = 3 THEN rdv.IVR_RES_CD ELSE ''''Unknown'''' END)
	,rdv.IVR_RES_CD
	,CASE WHEN rdv.IVR_RES_CD IN (''''SK'''',''''MB'''',''''NS'''',''''NL'''',''''PE'''',''''QC'''',''''ON'''',''''BC'''',''''NB'''',''''AB'''',''''NT'''',''''YT'''',''''NU'''') THEN ''''CAN'''' WHEN LEN(rdv.IVR_RES_CD) = 3 THEN rdv.IVR_RES_CD ELSE ''''Unknown'''' END
	,CASE WHEN rdv.IVR_RES_CD IN (''''SK'''',''''MB'''',''''NS'''',''''NL'''',''''PE'''',''''QC'''',''''ON'''',''''BC'''',''''NB'''',''''AB'''',''''NT'''',''''YT'''',''''NU'''') THEN ''''CAN'''' WHEN LEN(rdv.IVR_RES_CD) = 3 THEN rdv.IVR_RES_CD ELSE ''''Unknown'''' END
	,bdv2.INCOME_AMT
	,bdv2.INCOME_LEVEL_1_SEGMENT
	,bdv2.INCOME_LEVEL_1_SEGMENT_ORD
	,bdv2.INCOME_LEVEL_2_SEGMENT
	,bdv2.INCOME_LEVEL_2_SEGMENT_ORD
	,satseg2.CLIENT_AUA_SEGMENT
	,satseg2.CLIENT_AUA_SEGMENT_ORDER
	,bdv2.AGE_SEGMENT
	,bdv2.AGE_SEGMENT_ORD
	,bdv2.NEW_CLIENT_IND
	,bdv2.CLIENT_NAME	 	
	,bdv2.CLIENT_AGE
	FROM (
	SELECT *
			FROM DB_IAW_''||ENV||''_DWH.SHARED_RDV.SAT_PARTY_ROLE_ACCOUNT_HOLDER_INVESTIA_UNIVERIS
			)rdv
		JOIN (
		SELECT *
			FROM (
				SELECT *
					,ROW_NUMBER() OVER (
						PARTITION BY HK_HUB ORDER BY MD_START_DT DESC
						) RN
				FROM DB_IAW_''||ENV||''_DWH.SHARED_RDV.SAT_PARTY_ROLE_ACCOUNT_HOLDER_INVESTIA_UNIVERIS
				WHERE MD_START_DT <= TO_DATE(''||i_DATA_START_DATE||'', ''''YYYY-MM-DD'''')
				) SATHUB
			WHERE SATHUB.RN = 1 
			) rdvcv ON rdvcv.HK_HUB = rdv.HK_HUB AND rdvcv.MD_START_DT = rdv.MD_START_DT
		JOIN
		(
			SELECT bdv.*
			FROM (
				SELECT *
				FROM DB_IAW_''||ENV||''_DWH.SHARED_BDV.SAT_PARTY_ROLE_ACCOUNT_HOLDER_COMPUTE
				) bdv
			JOIN (
				SELECT *
				FROM (
					SELECT *
						,ROW_NUMBER() OVER (
							PARTITION BY HK_HUB ORDER BY MD_START_DT DESC
							) RN1
					FROM DB_IAW_''||ENV||''_DWH.SHARED_BDV.SAT_PARTY_ROLE_ACCOUNT_HOLDER_COMPUTE
					WHERE MD_START_DT <= TO_DATE(''||i_DATA_START_DATE||'', ''''YYYY-MM-DD'''')
					) SATHUB1
				WHERE SATHUB1.RN1 = 1 
				) bdvcv ON bdvcv.HK_HUB = bdv.HK_HUB AND bdvcv.MD_START_DT = bdv.MD_START_DT
			
			)bdv2 ON bdv2.HK_HUB = rdv.HK_HUB AND bdv2.MD_ACTIVE = ''''A'''' AND bdv2.MD_SRC_SYSTEM = ''''INVESTIA-UNIVERIS''''
			JOIN DB_IAW_''||ENV||''_DWH.SHARED_RDV.HUB_PARTY_ROLE_ACCOUNT_HOLDER hub ON hub.HK_HUB = rdv.HK_HUB
			LEFT JOIN
			(
			SELECT satseg.*
			FROM (
				SELECT *
				FROM DB_IAW_''||ENV||''_DWH.SHARED_BDV.SAT_PARTY_ROLE_ACCOUNT_HOLDER_AUA_SEG_COMPUTE
				) satseg
			JOIN (
				SELECT *
				FROM (
					SELECT *
						,ROW_NUMBER() OVER (
							PARTITION BY HK_HUB ORDER BY MD_START_DT DESC
							) RN2
					FROM DB_IAW_''||ENV||''_DWH.SHARED_BDV.SAT_PARTY_ROLE_ACCOUNT_HOLDER_AUA_SEG_COMPUTE
					WHERE MD_START_DT <= TO_DATE(''||i_DATA_START_DATE||'', ''''YYYY-MM-DD'''')
					) SATHUB2
				WHERE SATHUB2.RN2 = 1 
				) satsegcv ON satsegcv.HK_HUB = satseg.HK_HUB AND satsegcv.MD_START_DT = satseg.MD_START_DT
			)satseg2 ON satseg2.HK_HUB = hub.HK_HUB	AND	 satseg2.MD_ACTIVE = ''''A''''	AND	 satseg2.MD_SRC_SYSTEM = ''''INVESTIA-UNIVERIS''''
			WHERE rdv.MD_ACTIVE = ''''A''''	
              '';
			  
INS_UPDATE :='' UPDATE DB_IAW_''||ENV||''_DM.SHARED.WT_DIM_CLIENTS
SET
	MD_HASHDIFF_TYPE2=SHA1(
				CONCAT(
				COALESCE(PROVINCE_DESC,''''#NULL#''''), ''''|'''',
				COALESCE(PROVINCE_CODE,''''#NULL#''''), ''''|'''',
				COALESCE(COUNTRY_DESC,''''#NULL#''''), ''''|'''',
				COALESCE(COUNTRY_CODE,''''#NULL#''''), ''''|'''',
				COALESCE(TO_VARCHAR(INCOME_AMT),''''#NULL#''''), ''''|'''',
				COALESCE(INCOME_LEVEL_1_SEGMENT,''''#NULL#''''), ''''|'''',
				COALESCE(TO_VARCHAR(INCOME_LEVEL_1_SEGMENT_ORD),''''#NULL#''''), ''''|'''',
				COALESCE(INCOME_LEVEL_2_SEGMENT,''''#NULL#''''), ''''|'''',
				COALESCE(TO_VARCHAR(INCOME_LEVEL_2_SEGMENT_ORD),''''#NULL#''''), ''''|'''',
				COALESCE(CLIENT_AUA_SEGMENT,''''#NULL#''''), ''''|'''',
				COALESCE(TO_VARCHAR(CLIENT_AUA_SEGMENT_ORD),''''#NULL#''''), ''''|'''',
				COALESCE(AGE_SEGMENT,''''#NULL#''''), ''''|'''',
				COALESCE(TO_VARCHAR(AGE_SEGMENT_ORD),''''#NULL#''''), ''''|'''',
				COALESCE(NEW_CLIENT_IND,''''#NULL#'''')
				))
Where HK_HUB <> ''''0'''' AND MD_SRC_SYSTEM = ''''INVESTIA-UNIVERIS'''';
'';

EXECUTE IMMEDIATE :INS_PRE_DEL;
EXECUTE IMMEDIATE :INS_INSERT;
EXECUTE IMMEDIATE :INS_UPDATE;

END
';
CREATE OR REPLACE PROCEDURE DB_IAW_#env#_DM.SHARED.SP_CONV_LOADDM_RDV_BDV_NBIN_SHARED_TO_DM_WT_DIMACCOUNT("ENV" VARCHAR(1000), "I_DATA_START_DATE" VARCHAR(1000), "I_AUDIT_ID" VARCHAR(1000))
RETURNS VARCHAR(16777216)
LANGUAGE SQL
EXECUTE AS OWNER
AS '
DECLARE
INS_PRE_DEL STRING;
INS_INSERT STRING;
INS_UPDATE STRING;

BEGIN
i_DATA_START_DATE :=CHAR(39)||i_DATA_START_DATE||CHAR(39);
I_AUDIT_ID :=CHAR(39)||I_AUDIT_ID||CHAR(39);
INS_PRE_DEL := ''DELETE FROM DB_IAW_''||ENV||''_DM.SHARED.WT_DIM_ACCOUNTS WHERE MD_SRC_SYSTEM = ''''IAS'''' '';
INS_INSERT := ''
INSERT INTO DB_IAW_''||ENV||''_DM.SHARED.WT_DIM_ACCOUNTS (
HK_HUB
,MD_START_DT
,MD_HASH_NAT_KEYS
,MD_CREATION_DT
,MD_CREATION_AUDIT_ID
,MD_SOURCE
,MD_SRC_SYSTEM
,MD_EXTRACT_DT
,CONTRACT_ID
,UNIVERIS_PLAN_ID
,UNIVERIS_CLIENT_ID
,PLAN_CODE
,PLAN_LABEL
,ACCOUNT_TYPE
,OPEN_DATE
,CLOSE_DATE
,GROUP_TYPE_CODE
,ACCUMULATION_TYPE
,ADMINISTRATOR_TYPE
,ACCOUNT_AUA_SEGMENT
,ACCOUNT_AUA_SEGMENT_ORDER
,ACCOUNT_IND
,CASH_EQLT_PROFILE_PCT
,INCOME_PROFILE_PCT
,GROWTH_PROFILE_PCT
,SPECULATION_PROFILE_PCT
,UNKNOWN_PROFILE_PCT
,LOW_RISK_PCT
,MEDIUM_RISK_PCT
,HIGH_RISK_PCT
,UNKNOWN_RISK_PCT
,NBIN_CLIENT_ID  )
SELECT hub.HK_HUB
,TO_DATE(''||i_DATA_START_DATE||'',''''YYYY-MM-DD'''')
,hub.HK_HUB
,CURRENT_TIMESTAMP
,''||I_AUDIT_ID||''
,rdv.MD_SOURCE
,rdv.MD_SRC_SYSTEM
,rdv.MD_EXTRACT_DT
,hub.CONTRACT_ID
,hub.UNIVERIS_PLAN_ID
,hub.UNIVERIS_CLIENT_ID
,bdv2.PLAN_CODE
,bdv2.PLAN_LABEL
,bdv2.ACCOUNT_TYPE
,rdv.A_C_OPEN_DATE
,rdv.A_C_CLOSING_DATE
,bdv2.GROUP_TYPE_CODE
,bdv2.ACCUMULATION_TYPE
,rdv.ADMINISTRATOR_TYPE
,satseg2.ACCOUNT_AUA_SEGMENT
,satseg2.ACCOUNT_AUA_SEGMENT_ORDER
,bdv2.ACCOUNT_IND
,bdv2.CASH_EQLT_PROFILE_PCT
,bdv2.INCOME_PROFILE_PCT
,bdv2.GROWTH_PROFILE_PCT
,bdv2.SPECULATION_PROFILE_PCT
,bdv2.UNKNOWN_PROFILE_PCT
,bdv2.LOW_RISK_PCT
,bdv2.MEDIUM_RISK_PCT
,bdv2.HIGH_RISK_PCT
,bdv2.UNKNOWN_RISK_PCT
,bdv2.NBIN_CLIENT_ID 
	FROM (
	SELECT *
			FROM DB_IAW_''||ENV||''_DWH.SHARED_RDV.SAT_CONTRACT_IAS_NBIN
			)rdv
		JOIN (
		SELECT *
			FROM (
				SELECT *
					,ROW_NUMBER() OVER (
						PARTITION BY HK_HUB ORDER BY MD_START_DT DESC
						) RN
				FROM DB_IAW_''||ENV||''_DWH.SHARED_RDV.SAT_CONTRACT_IAS_NBIN
				WHERE MD_START_DT <= TO_DATE(''||i_DATA_START_DATE||'', ''''YYYY-MM-DD'''')
				) SATHUB
			WHERE SATHUB.RN = 1
			) rdvcv ON rdvcv.HK_HUB = rdv.HK_HUB AND rdvcv.MD_START_DT = rdv.MD_START_DT
		JOIN
		(
			SELECT bdv.*
			FROM (
				SELECT *
				FROM DB_IAW_''||ENV||''_DWH.SHARED_BDV.SAT_CONTRACT_COMPUTE
				) bdv
			JOIN (
				SELECT *
				FROM (
					SELECT *
						,ROW_NUMBER() OVER (
							PARTITION BY HK_HUB ORDER BY MD_START_DT DESC
							) RN1
					FROM DB_IAW_''||ENV||''_DWH.SHARED_BDV.SAT_CONTRACT_COMPUTE
					WHERE MD_START_DT <= TO_DATE(''||i_DATA_START_DATE||'', ''''YYYY-MM-DD'''')
					) SATHUB1
				WHERE SATHUB1.RN1 = 1 
				) bdvcv ON bdvcv.HK_HUB = bdv.HK_HUB AND bdvcv.MD_START_DT = bdv.MD_START_DT
			
			)bdv2 ON bdv2.HK_HUB = rdv.HK_HUB AND bdv2.MD_ACTIVE = ''''A'''' AND bdv2.MD_SRC_SYSTEM = ''''IAS''''	
			JOIN DB_IAW_''||ENV||''_DWH.SHARED_RDV.HUB_CONTRACT hub ON hub.HK_HUB = rdv.HK_HUB
			LEFT JOIN
			(
			SELECT satseg.*
			FROM (
				SELECT *
				FROM DB_IAW_''||ENV||''_DWH.SHARED_BDV.SAT_CONTRACT_AUA_SEG_COMPUTE
				) satseg
			JOIN (
				SELECT *
				FROM (
					SELECT *
						,ROW_NUMBER() OVER (
							PARTITION BY HK_HUB ORDER BY MD_START_DT DESC
							) RN2
					FROM DB_IAW_''||ENV||''_DWH.SHARED_BDV.SAT_CONTRACT_AUA_SEG_COMPUTE
					WHERE MD_START_DT <= TO_DATE(''||i_DATA_START_DATE||'', ''''YYYY-MM-DD'''')
					) SATHUB2
				WHERE SATHUB2.RN2 = 1 
				) satsegcv ON satsegcv.HK_HUB = satseg.HK_HUB AND satsegcv.MD_START_DT = satseg.MD_START_DT
			)satseg2 ON satseg2.HK_HUB = hub.HK_HUB	AND satseg2.MD_ACTIVE = ''''A''''
			WHERE rdv.MD_ACTIVE = ''''A''''			
              '';
INS_UPDATE :='' UPDATE DB_IAW_''||ENV||''_DM.SHARED.WT_DIM_ACCOUNTS
SET
	MD_HASHDIFF_TYPE2=SHA1(
				CONCAT(
				COALESCE(PLAN_CODE,''''#NULL#''''), ''''|'''',
				COALESCE(PLAN_LABEL,''''#NULL#''''), ''''|'''',
				COALESCE(ACCOUNT_TYPE,''''#NULL#''''), ''''|'''',
				COALESCE(TO_VARCHAR(OPEN_DATE),''''#NULL#''''), ''''|'''',
				COALESCE(TO_VARCHAR(CLOSE_DATE),''''#NULL#''''), ''''|'''',
				COALESCE(GROUP_TYPE_CODE,''''#NULL#''''), ''''|'''',
				COALESCE(ACCUMULATION_TYPE,''''#NULL#''''), ''''|'''',
				COALESCE(ADMINISTRATOR_TYPE,''''#NULL#''''), ''''|'''',
				COALESCE(ACCOUNT_AUA_SEGMENT,''''#NULL#''''), ''''|'''',
				COALESCE(TO_VARCHAR(ACCOUNT_AUA_SEGMENT_ORDER),''''#NULL#''''), ''''|'''',
				COALESCE(TO_VARCHAR(ACCOUNT_IND),''''#NULL#''''), ''''|'''',
				COALESCE(CASH_EQLT_PROFILE_PCT,''''#NULL#''''), ''''|'''',
				COALESCE(INCOME_PROFILE_PCT,''''#NULL#''''), ''''|'''',
				COALESCE(GROWTH_PROFILE_PCT,''''#NULL#''''), ''''|'''',
				COALESCE(SPECULATION_PROFILE_PCT,''''#NULL#''''), ''''|'''',
				COALESCE(UNKNOWN_PROFILE_PCT,''''#NULL#''''), ''''|'''',
				COALESCE(LOW_RISK_PCT,''''#NULL#''''), ''''|'''',
				COALESCE(MEDIUM_RISK_PCT,''''#NULL#''''), ''''|'''',
				COALESCE(HIGH_RISK_PCT,''''#NULL#''''), ''''|'''',
				COALESCE(UNKNOWN_RISK_PCT,''''#NULL#''''), ''''|'''',
				COALESCE(NBIN_CLIENT_ID,''''#NULL#'''')
				))
Where HK_HUB <> ''''0'''' and MD_SRC_SYSTEM = ''''IAS'''';
'';

EXECUTE IMMEDIATE :INS_PRE_DEL;
EXECUTE IMMEDIATE :INS_INSERT;
EXECUTE IMMEDIATE :INS_UPDATE;

END
';
CREATE OR REPLACE PROCEDURE DB_IAW_#env#_DM.SHARED.SP_CONV_LOADDM_RDV_BDV_SHARED_TO_DM_WT_DIMCLIENTS("ENV" VARCHAR(1000), "I_DATA_START_DATE" VARCHAR(1000))
RETURNS VARCHAR(16777216)
LANGUAGE SQL
EXECUTE AS OWNER
AS '
DECLARE
INS_PRE_DEL STRING;
INS_INSERT STRING;
INS_UPDATE STRING;

BEGIN
i_DATA_START_DATE :=CHAR(39)||i_DATA_START_DATE||CHAR(39);
INS_PRE_DEL := ''DELETE FROM DB_IAW_''||ENV||''_DM.SHARED.WT_DIM_CLIENTS WHERE MD_SRC_SYSTEM = ''''IAS'''' '';
INS_INSERT := ''
INSERT INTO DB_IAW_''||ENV||''_DM.SHARED.WT_DIM_CLIENTS (
HK_HUB
,MD_START_DT
,MD_HASH_NAT_KEYS
,MD_CREATION_DT
,MD_SOURCE
,MD_CREATION_AUDIT_ID
,MD_SRC_SYSTEM
,MD_EXTRACT_DT
,CLIENT_ID
,PROVINCE_DESC
,PROVINCE_CODE
,COUNTRY_DESC
,COUNTRY_CODE
,INCOME_AMT
,INCOME_LEVEL_1_SEGMENT
,INCOME_LEVEL_1_SEGMENT_ORD
,INCOME_LEVEL_2_SEGMENT
,INCOME_LEVEL_2_SEGMENT_ORD
,CLIENT_AUA_SEGMENT
,CLIENT_AUA_SEGMENT_ORD
,AGE_SEGMENT
,AGE_SEGMENT_ORD
,NEW_CLIENT_IND
,CLIENT_START_DT 
,CLIENT_INV_KNOWLEDGE_LVL		
,CLIENT_NAME		
,CLIENT_AGE	
)
SELECT hub.HK_HUB
	,TO_DATE(''||i_DATA_START_DATE||'',''''YYYY-MM-DD'''')
	,hub.HK_HUB
	,CURRENT_TIMESTAMP
	,rdv.MD_SOURCE
	,CURRENT_TIMESTAMP
	,rdv.MD_SRC_SYSTEM
	,rdv.MD_EXTRACT_DT
	,hub.CLIENT_ID
	,DB_IAW_''||ENV||''_DWH.BUSINESS_RULES.UDF_CONV_BR_ALL_CLIENTS_PROVINCE_005(rdv.CLIENT_RESIDENCE_REGION,rdv.CLIENT_RESIDENCE)
	,rdv.CLIENT_RESIDENCE_REGION
	,rdv.CLIENT_RESIDENCE
	,rdv.CLIENT_RESIDENCE
	,bdv2.INCOME_AMT
	,bdv2.INCOME_LEVEL_1_SEGMENT
	,bdv2.INCOME_LEVEL_1_SEGMENT_ORD
	,bdv2.INCOME_LEVEL_2_SEGMENT
	,bdv2.INCOME_LEVEL_2_SEGMENT_ORD
	,satseg2.CLIENT_AUA_SEGMENT
	,satseg2.CLIENT_AUA_SEGMENT_ORDER
	,bdv2.AGE_SEGMENT
	,bdv2.AGE_SEGMENT_ORD
	,bdv2.NEW_CLIENT_IND
	,bdv2.CLIENT_START_DT
	,bdv2.CLIENT_INV_KNOWLEDGE_LVL	 	
	,bdv2.CLIENT_NAME	 	
	,bdv2.CLIENT_AGE	 
	FROM (
	SELECT *
			FROM DB_IAW_''||ENV||''_DWH.SHARED_RDV.SAT_PARTY_ROLE_ACCOUNT_HOLDER_IAS_NBIN
			)rdv
		JOIN (
		SELECT *
			FROM (
				SELECT *
					,ROW_NUMBER() OVER (
						PARTITION BY HK_HUB ORDER BY MD_START_DT DESC
						) RN
				FROM DB_IAW_''||ENV||''_DWH.SHARED_RDV.SAT_PARTY_ROLE_ACCOUNT_HOLDER_IAS_NBIN
				WHERE MD_START_DT <= TO_DATE(''||i_DATA_START_DATE||'', ''''YYYY-MM-DD'''')
				) SATHUB
			WHERE SATHUB.RN = 1 
			) rdvcv ON rdvcv.HK_HUB = rdv.HK_HUB AND rdvcv.MD_START_DT = rdv.MD_START_DT
		JOIN
		(
			SELECT bdv.*
			FROM (
				SELECT *
				FROM DB_IAW_''||ENV||''_DWH.SHARED_BDV.SAT_PARTY_ROLE_ACCOUNT_HOLDER_COMPUTE
				) bdv
			JOIN (
				SELECT *
				FROM (
					SELECT *
						,ROW_NUMBER() OVER (
							PARTITION BY HK_HUB ORDER BY MD_START_DT DESC
							) RN1
					FROM DB_IAW_''||ENV||''_DWH.SHARED_BDV.SAT_PARTY_ROLE_ACCOUNT_HOLDER_COMPUTE
					WHERE MD_START_DT <= TO_DATE(''||i_DATA_START_DATE||'', ''''YYYY-MM-DD'''')
					) SATHUB1
				WHERE SATHUB1.RN1 = 1 
				) bdvcv ON bdvcv.HK_HUB = bdv.HK_HUB AND bdvcv.MD_START_DT = bdv.MD_START_DT		
			)bdv2 ON bdv2.HK_HUB = rdv.HK_HUB AND bdv2.MD_ACTIVE = ''''A'''' AND bdv2.MD_SRC_SYSTEM = ''''IAS''''
			JOIN DB_IAW_''||ENV||''_DWH.SHARED_RDV.HUB_PARTY_ROLE_ACCOUNT_HOLDER hub ON hub.HK_HUB = rdv.HK_HUB
			LEFT JOIN
			(
			SELECT satseg.*
			FROM (
				SELECT *
				FROM DB_IAW_''||ENV||''_DWH.SHARED_BDV.SAT_PARTY_ROLE_ACCOUNT_HOLDER_AUA_SEG_COMPUTE
				) satseg
			JOIN (
				SELECT *
				FROM (
					SELECT *
						,ROW_NUMBER() OVER (
							PARTITION BY HK_HUB ORDER BY MD_START_DT DESC
							) RN2
					FROM DB_IAW_''||ENV||''_DWH.SHARED_BDV.SAT_PARTY_ROLE_ACCOUNT_HOLDER_AUA_SEG_COMPUTE
					WHERE MD_START_DT <= TO_DATE(''||i_DATA_START_DATE||'', ''''YYYY-MM-DD'''')
					) SATHUB2
				WHERE SATHUB2.RN2 = 1
				) satsegcv ON satsegcv.HK_HUB = satseg.HK_HUB AND satsegcv.MD_START_DT = satseg.MD_START_DT
			)satseg2 ON satseg2.HK_HUB = hub.HK_HUB	AND	 satseg2.MD_ACTIVE = ''''A''''	AND	 satseg2.MD_SRC_SYSTEM = ''''IAS''''
			WHERE rdv.MD_ACTIVE = ''''A''''			
              '';
INS_UPDATE :='' UPDATE DB_IAW_''||ENV||''_DM.SHARED.WT_DIM_CLIENTS
SET
	MD_HASHDIFF_TYPE2=SHA1(
				CONCAT(
				COALESCE(PROVINCE_DESC,''''#NULL#''''), ''''|'''', 
				COALESCE(PROVINCE_CODE,''''#NULL#''''), ''''|'''', 
				COALESCE(COUNTRY_DESC,''''#NULL#''''), ''''|'''', 
				COALESCE(COUNTRY_CODE,''''#NULL#''''), ''''|'''', 
				COALESCE(TO_VARCHAR(INCOME_AMT),''''#NULL#''''), ''''|'''', 
				COALESCE(INCOME_LEVEL_1_SEGMENT,''''#NULL#''''), ''''|'''',
				COALESCE(TO_VARCHAR(INCOME_LEVEL_1_SEGMENT_ORD),''''#NULL#''''), ''''|'''',
				COALESCE(INCOME_LEVEL_2_SEGMENT,''''#NULL#''''), ''''|'''',
				COALESCE(TO_VARCHAR(INCOME_LEVEL_2_SEGMENT_ORD),''''#NULL#''''), ''''|'''',
				COALESCE(CLIENT_AUA_SEGMENT,''''#NULL#''''), ''''|'''',
				COALESCE(TO_VARCHAR(CLIENT_AUA_SEGMENT_ORD),''''#NULL#''''), ''''|'''',
				COALESCE(AGE_SEGMENT,''''#NULL#''''), ''''|'''',
				COALESCE(TO_VARCHAR(AGE_SEGMENT_ORD),''''#NULL#''''), ''''|'''',
				COALESCE(NEW_CLIENT_IND,''''#NULL#'''') , ''''|'''',
				COALESCE(TO_VARCHAR(CLIENT_START_DT),''''#NULL#''''), ''''|'''',
				COALESCE(CLIENT_INV_KNOWLEDGE_LVL,''''#NULL#''''), ''''|'''',
				COALESCE(CLIENT_NAME,''''#NULL#'''') , ''''|'''',
				COALESCE(TO_VARCHAR(CLIENT_AGE),''''#NULL#'''')
				))
Where HK_HUB <> ''''0'''' AND MD_SRC_SYSTEM = ''''IAS'''';
'';

EXECUTE IMMEDIATE :INS_PRE_DEL;
EXECUTE IMMEDIATE :INS_INSERT;
EXECUTE IMMEDIATE :INS_UPDATE;

END
';
CREATE OR REPLACE PROCEDURE DB_IAW_#env#_DM.SHARED.SP_CONV_LOADDM_RDV_BDV_UNIVERIS_SHARED_TO_DM_WT_DIMCLIENTS("ENV" VARCHAR(1000), "I_DATA_START_DATE" VARCHAR(1000))
RETURNS VARCHAR(16777216)
LANGUAGE SQL
EXECUTE AS OWNER
AS '
DECLARE
INS_PRE_DEL STRING;
INS_INSERT STRING;
INS_UPDATE STRING;

BEGIN
i_DATA_START_DATE :=CHAR(39)||i_DATA_START_DATE||CHAR(39);
INS_PRE_DEL := ''DELETE FROM DB_IAW_''||ENV||''_DM.SHARED.WT_DIM_CLIENTS WHERE MD_SRC_SYSTEM = ''''IAS-UNIVERIS'''' '';
INS_INSERT := ''
INSERT INTO DB_IAW_''||ENV||''_DM.SHARED.WT_DIM_CLIENTS (
HK_HUB
,MD_START_DT
,MD_HASH_NAT_KEYS
,MD_CREATION_DT
,MD_SOURCE
,MD_SRC_SYSTEM
,MD_EXTRACT_DT
,CLIENT_ID
,PROVINCE_DESC
,PROVINCE_CODE
,COUNTRY_DESC
,COUNTRY_CODE
,INCOME_AMT
,INCOME_LEVEL_1_SEGMENT
,INCOME_LEVEL_1_SEGMENT_ORD
,INCOME_LEVEL_2_SEGMENT
,INCOME_LEVEL_2_SEGMENT_ORD
,CLIENT_AUA_SEGMENT
,CLIENT_AUA_SEGMENT_ORD
,AGE_SEGMENT
,AGE_SEGMENT_ORD
,NEW_CLIENT_IND 
,CLIENT_NAME	 	
,CLIENT_AGE
)
SELECT hub.HK_HUB
	,TO_DATE(''||i_DATA_START_DATE||'',''''YYYY-MM-DD'''')
	,hub.HK_HUB
	,CURRENT_TIMESTAMP
	,rdv.MD_SOURCE
	,rdv.MD_SRC_SYSTEM
	,rdv.MD_EXTRACT_DT
	,hub.CLIENT_ID
	,DB_IAW_''||ENV||''_DWH.BUSINESS_RULES.UDF_CONV_BR_ALL_CLIENTS_PROVINCE_005(rdv.IVR_RES_CD,CASE WHEN rdv.IVR_RES_CD IN (''''SK'''',''''MB'''',''''NS'''',''''NL'''',''''PE'''',''''QC'''',''''ON'''',''''BC'''',''''NB'''',''''AB'''',''''NT'''',''''YT'''',''''NU'''') THEN ''''CAN'''' WHEN LEN(rdv.IVR_RES_CD) = 3 THEN rdv.IVR_RES_CD ELSE ''''Unknown'''' END)
	,rdv.IVR_RES_CD
	,CASE WHEN rdv.IVR_RES_CD IN (''''SK'''',''''MB'''',''''NS'''',''''NL'''',''''PE'''',''''QC'''',''''ON'''',''''BC'''',''''NB'''',''''AB'''',''''NT'''',''''YT'''',''''NU'''') THEN ''''CAN'''' WHEN LEN(rdv.IVR_RES_CD) = 3 THEN rdv.IVR_RES_CD ELSE ''''Unknown'''' END
	,CASE WHEN rdv.IVR_RES_CD IN (''''SK'''',''''MB'''',''''NS'''',''''NL'''',''''PE'''',''''QC'''',''''ON'''',''''BC'''',''''NB'''',''''AB'''',''''NT'''',''''YT'''',''''NU'''') THEN ''''CAN'''' WHEN LEN(rdv.IVR_RES_CD) = 3 THEN rdv.IVR_RES_CD ELSE ''''Unknown'''' END
	,bdv2.INCOME_AMT
	,bdv2.INCOME_LEVEL_1_SEGMENT
	,bdv2.INCOME_LEVEL_1_SEGMENT_ORD
	,bdv2.INCOME_LEVEL_2_SEGMENT
	,bdv2.INCOME_LEVEL_2_SEGMENT_ORD
	,satseg2.CLIENT_AUA_SEGMENT
	,satseg2.CLIENT_AUA_SEGMENT_ORDER
	,bdv2.AGE_SEGMENT
	,bdv2.AGE_SEGMENT_ORD
	,bdv2.NEW_CLIENT_IND	
	,bdv2.CLIENT_NAME	 	
	,bdv2.CLIENT_AGE	 
	FROM (
	SELECT *
			FROM DB_IAW_''||ENV||''_DWH.SHARED_RDV.SAT_PARTY_ROLE_ACCOUNT_HOLDER_IAS_UNIVERIS
			)rdv
		JOIN (
		SELECT *
			FROM (
				SELECT *
					,ROW_NUMBER() OVER (
						PARTITION BY HK_HUB ORDER BY MD_START_DT DESC
						) RN
				FROM DB_IAW_''||ENV||''_DWH.SHARED_RDV.SAT_PARTY_ROLE_ACCOUNT_HOLDER_IAS_UNIVERIS
				WHERE MD_START_DT <= TO_DATE(''||i_DATA_START_DATE||'', ''''YYYY-MM-DD'''')
				) SATHUB
			WHERE SATHUB.RN = 1 
			) rdvcv ON rdvcv.HK_HUB = rdv.HK_HUB AND rdvcv.MD_START_DT = rdv.MD_START_DT
		JOIN
		(
			SELECT bdv.*
			FROM (
				SELECT *
				FROM DB_IAW_''||ENV||''_DWH.SHARED_BDV.SAT_PARTY_ROLE_ACCOUNT_HOLDER_COMPUTE
				) bdv
			JOIN (
				SELECT *
				FROM (
					SELECT *
						,ROW_NUMBER() OVER (
							PARTITION BY HK_HUB ORDER BY MD_START_DT DESC
							) RN1
					FROM DB_IAW_''||ENV||''_DWH.SHARED_BDV.SAT_PARTY_ROLE_ACCOUNT_HOLDER_COMPUTE
					WHERE MD_START_DT <= TO_DATE(''||i_DATA_START_DATE||'', ''''YYYY-MM-DD'''')
					) SATHUB1
				WHERE SATHUB1.RN1 = 1 
				) bdvcv ON bdvcv.HK_HUB = bdv.HK_HUB AND bdvcv.MD_START_DT = bdv.MD_START_DT
			
			)bdv2 ON bdv2.HK_HUB = rdv.HK_HUB AND bdv2.MD_ACTIVE = ''''A'''' AND bdv2.MD_SRC_SYSTEM = ''''IAS-UNIVERIS''''	
			JOIN DB_IAW_''||ENV||''_DWH.SHARED_RDV.HUB_PARTY_ROLE_ACCOUNT_HOLDER hub ON hub.HK_HUB = rdv.HK_HUB
			LEFT JOIN
			(
			SELECT satseg.*
			FROM (
				SELECT *
				FROM DB_IAW_''||ENV||''_DWH.SHARED_BDV.SAT_PARTY_ROLE_ACCOUNT_HOLDER_AUA_SEG_COMPUTE
				) satseg
			JOIN (
				SELECT *
				FROM (
					SELECT *
						,ROW_NUMBER() OVER (
							PARTITION BY HK_HUB ORDER BY MD_START_DT DESC
							) RN2
					FROM DB_IAW_''||ENV||''_DWH.SHARED_BDV.SAT_PARTY_ROLE_ACCOUNT_HOLDER_AUA_SEG_COMPUTE
					WHERE MD_START_DT <= TO_DATE(''||i_DATA_START_DATE||'', ''''YYYY-MM-DD'''')
					) SATHUB2
				WHERE SATHUB2.RN2 = 1 
				) satsegcv ON satsegcv.HK_HUB = satseg.HK_HUB AND satsegcv.MD_START_DT = satseg.MD_START_DT
			)satseg2 ON satseg2.HK_HUB = hub.HK_HUB	AND	 satseg2.MD_ACTIVE = ''''A''''	AND	 satseg2.MD_SRC_SYSTEM = ''''IAS-UNIVERIS''''
			WHERE rdv.MD_ACTIVE = ''''A''''
              '';
			  
INS_UPDATE :='' UPDATE DB_IAW_''||ENV||''_DM.SHARED.WT_DIM_CLIENTS
SET
	MD_HASHDIFF_TYPE2=SHA1(
				CONCAT(
				COALESCE(PROVINCE_DESC,''''#NULL#''''), ''''|'''',
				COALESCE(PROVINCE_CODE,''''#NULL#''''), ''''|'''',
				COALESCE(COUNTRY_DESC,''''#NULL#''''), ''''|'''',
				COALESCE(COUNTRY_CODE,''''#NULL#''''), ''''|'''',
				COALESCE(TO_VARCHAR(INCOME_AMT),''''#NULL#''''), ''''|'''',
				COALESCE(INCOME_LEVEL_1_SEGMENT,''''#NULL#''''), ''''|'''',
				COALESCE(TO_VARCHAR(INCOME_LEVEL_1_SEGMENT_ORD),''''#NULL#''''), ''''|'''',
				COALESCE(INCOME_LEVEL_2_SEGMENT,''''#NULL#''''), ''''|'''',
				COALESCE(TO_VARCHAR(INCOME_LEVEL_2_SEGMENT_ORD),''''#NULL#''''), ''''|'''',
				COALESCE(CLIENT_AUA_SEGMENT,''''#NULL#''''), ''''|'''',
				COALESCE(TO_VARCHAR(CLIENT_AUA_SEGMENT_ORD),''''#NULL#''''), ''''|'''',
				COALESCE(AGE_SEGMENT,''''#NULL#''''), ''''|'''',
				COALESCE(TO_VARCHAR(AGE_SEGMENT_ORD),''''#NULL#''''), ''''|'''',
				COALESCE(NEW_CLIENT_IND,''''#NULL#'''')
				))
Where HK_HUB <> ''''0'''' AND MD_SRC_SYSTEM = ''''IAS-UNIVERIS'''';
'';

EXECUTE IMMEDIATE :INS_PRE_DEL;
EXECUTE IMMEDIATE :INS_INSERT;
EXECUTE IMMEDIATE :INS_UPDATE;

END
';
CREATE OR REPLACE PROCEDURE DB_IAW_#env#_DM.SHARED.SP_CONV_LOADDM_UNIVERIS_BDV_SHARED_TO_DM_WT_DIMPLANS("ENV" VARCHAR(1000), "I_DATA_START_DATE" VARCHAR(1000))
RETURNS VARCHAR(16777216)
LANGUAGE SQL
EXECUTE AS OWNER
AS '
DECLARE
INS_PRE_DEL STRING;
INS_INSERT STRING;
INS_UPDATE STRING;
BEGIN
i_DATA_START_DATE :=CHAR(39)||i_DATA_START_DATE||CHAR(39);
INS_PRE_DEL := ''DELETE FROM DB_IAW_''||ENV||''_DM.SHARED.WT_DIM_PLANS WHERE MD_SRC_SYSTEM = ''''IAS-UNIVERIS'''' '';
INS_INSERT := ''
INSERT INTO DB_IAW_''||ENV||''_DM.SHARED.WT_DIM_PLANS (HK_HUB,MD_HASH_NAT_KEYS,MD_SOURCE,MD_SRC_SYSTEM,MD_EXTRACT_DT,PLAN_CODE,PLAN_LABEL,ACCOUNT_TYPE,GROUP_TYPE_CODE,ACCUMULATION_TYPE,MD_CREATION_DT,MD_START_DT)
SELECT RDV.HK_HUB,
	RDV.HK_HUB,
	RDV.MD_SOURCE,
	RDV.MD_SRC_SYSTEM,
	RDV.MD_EXTRACT_DT,
	RDV.PLAN_CODE,
	RDV.PLAN_LABEL,
	RDV.ACCOUNT_TYPE,
	RDV.GROUP_TYPE_CODE,
	RDV.ACCUMULATION_TYPE,
	CURRENT_TIMESTAMP,
	TO_DATE(''||i_DATA_START_DATE||'',''''YYYY-MM-DD'''')
FROM (
	SELECT *
	FROM DB_IAW_''||ENV||''_DWH.SHARED_BDV.SAT_REF_INVESTMENT_SAVING_PROGRAM_TYPES_COMPUTE
	) rdv
	JOIN (
	SELECT *
	FROM (
		SELECT *
			,ROW_NUMBER() OVER (
				PARTITION BY HK_HUB ORDER BY MD_START_DT DESC
				) RN
		FROM DB_IAW_''||ENV||''_DWH.SHARED_BDV.SAT_REF_INVESTMENT_SAVING_PROGRAM_TYPES_COMPUTE lv
		WHERE MD_START_DT <= TO_DATE(''||i_DATA_START_DATE||'', ''''YYYY-MM-DD'''')
		) SATHUB
	WHERE SATHUB.RN = 1
	) lv ON lv.HK_HUB = rdv.HK_HUB AND lv.MD_START_DT = rdv.MD_START_DT
WHERE rdv.MD_ACTIVE = ''''A''''  AND rdv.MD_SRC_SYSTEM = ''''IAS-UNIVERIS''''
              '';
INS_UPDATE :=''
UPDATE DB_IAW_''||ENV||''_DM.SHARED.WT_DIM_PLANS
SET
	MD_HASHDIFF_TYPE2=SHA1(
				CONCAT(
				COALESCE(PLAN_LABEL,''''#NULL#''''), ''''|'''',
				COALESCE(ACCOUNT_TYPE,''''#NULL#''''), ''''|'''',
				COALESCE(GROUP_TYPE_CODE,''''#NULL#''''), ''''|'''',
				COALESCE(ACCUMULATION_TYPE,''''#NULL#'''')
				))
Where HK_HUB <> ''''0''''
AND MD_SRC_SYSTEM = ''''IAS-UNIVERIS''''
'';
EXECUTE IMMEDIATE :INS_PRE_DEL;
EXECUTE IMMEDIATE :INS_INSERT;
EXECUTE IMMEDIATE :INS_UPDATE;
END
';
create or replace schema DB_IAW_#env#_DM.STEWARDSHIP;

create or replace TABLE DB_IAW_#env#_DM.STEWARDSHIP.TABLES_LOADING_INFORMATION (
	ID NUMBER(38,0) autoincrement COMMENT 'Surrogate key of the dimension',
	LOADING_DATE TIMESTAMP_NTZ(9) COMMENT 'Creation Date Time of the occurrence',
	SRC_TABLE VARCHAR(100) COMMENT 'Source Schema and Table',
	TOTAL_ROWS NUMBER(38,0) COMMENT 'Count of The Rows by The Loading Date',
	TOTAL NUMBER(38,2) COMMENT 'Sum Of A Metric Column',
	METRIC_COLUMN VARCHAR(100) COMMENT 'Column Used for Total Calculation'
);
CREATE OR REPLACE PROCEDURE DB_IAW_#env#_DM.STEWARDSHIP.USP_TABLES_LOADING_INFORMATION("p_START_DATE" VARCHAR(10))
RETURNS VARCHAR(100)
LANGUAGE JAVASCRIPT
EXECUTE AS OWNER
AS '
var strSQLDeleteCmd = ` delete from STEWARDSHIP.TABLES_LOADING_INFORMATION where LOADING_DATE = ''@START_DATE@''
`
var strSQLSelectCmd = `
      INSERT INTO STEWARDSHIP.TABLES_LOADING_INFORMATION (LOADING_DATE, SRC_TABLE, TOTAL_ROWS, TOTAL, METRIC_COLUMN)
    (
    
--EXTERNAL_KPI

    SELECT ''@START_DATE@'' AS LOADING_DATE ,''EXTERNAL_KPI.MASTER_KPI_DATA_CLARINGTON'' SRC_TABLE ,
    coalesce(COUNT(*),0) TOTAL_ROWSTOTAL_ROWS, coalesce(SUM(NET_SALES), 0) TOTAL, ''NET_SALES''  METRIC_COLUMN
    FROM EXTERNAL_KPI.MASTER_KPI_DATA_CLARINGTON 
    WHERE TO_DATE(MD_START_DT) = ''@START_DATE@''
    UNION
    SELECT ''@START_DATE@'' AS LOADING_DATE ,''EXTERNAL_KPI.MASTER_KPI_DATA_IAPW'' SRC_TABLE ,COUNT(*) TOTAL_ROWS, coalesce(SUM(NET_TOTAL_REVENUE), 0) TOTAL, ''NET_TOTAL_REVENUE''  METRIC_COLUMN
    FROM EXTERNAL_KPI.MASTER_KPI_DATA_IAPW 
    WHERE TO_DATE(MD_START_DT) = ''@START_DATE@''
    UNION
    SELECT ''@START_DATE@'' AS LOADING_DATE ,''EXTERNAL_KPI.MASTER_KPI_DATA_INVESTIA'' SRC_TABLE ,COUNT(*) TOTAL_ROWS, coalesce(SUM(TOTAL_REVENUE), 0) TOTAL, ''TOTAL_REVENUE''  METRIC_COLUMN 
    FROM EXTERNAL_KPI.MASTER_KPI_DATA_INVESTIA
    WHERE TO_DATE(MD_START_DT) = ''@START_DATE@''
    
--STRATEGIC
    
    UNION
    SELECT ''@START_DATE@'' AS LOADING_DATE ,''STRATEGIC.ACCOUNTS_CLIENTS_SUMMARY_DAILY'' SRC_TABLE ,COUNT(*) TOTAL_ROWS, coalesce(SUM(NB_COMMISSION), 0) TOTAL, ''NB_COMMISSION''  METRIC_COLUMN
    FROM STRATEGIC.ACCOUNTS_CLIENTS_SUMMARY_DAILY 
    WHERE TO_DATE(MD_START_DT) = ''@START_DATE@''
    UNION
    SELECT ''@START_DATE@'' AS LOADING_DATE ,''STRATEGIC.ACCOUNTS_CLIENTS_SUMMARY_RVP_DAILY'' SRC_TABLE ,COUNT(*) TOTAL_ROWS, coalesce(SUM(NB_COMMISSION), 0) TOTAL, ''NB_COMMISSION''  METRIC_COLUMN 
    FROM STRATEGIC.ACCOUNTS_CLIENTS_SUMMARY_RVP_DAILY
    WHERE TO_DATE(MD_START_DT) = ''@START_DATE@''
    UNION 
    SELECT ''@START_DATE@'' AS LOADING_DATE ,''STRATEGIC.ASSETS_SUMMARY_BYACCOUNTTYPE_DAILY'' SRC_TABLE , COUNT(*) TOTAL_ROWS, coalesce(SUM(VALUE), 0) TOTAL, ''VALUE''  METRIC_COLUMN
    FROM STRATEGIC.ASSETS_SUMMARY_BYACCOUNTTYPE_DAILY 
    WHERE TO_DATE(MD_START_DT)= ''@START_DATE@''
    UNION
    SELECT ''@START_DATE@'' AS LOADING_DATE ,''STRATEGIC.ASSETS_SUMMARY_BYACCOUNTTYPE_RVP_DAILY'' SRC_TABLE ,COUNT(*) TOTAL_ROWS, coalesce(SUM(VALUE), 0) TOTAL, ''VALUE''  METRIC_COLUMN 
    FROM STRATEGIC.ASSETS_SUMMARY_BYACCOUNTTYPE_RVP_DAILY
    WHERE TO_DATE(MD_START_DT) = ''@START_DATE@''
    UNION
    SELECT ''@START_DATE@'' AS LOADING_DATE ,''STRATEGIC.ASSETS_SUMMARY_BYCOMMISSIONTYPE'' SRC_TABLE , COUNT(*) TOTAL_ROWS, coalesce(SUM(VALUE), 0) TOTAL, ''VALUE''  METRIC_COLUMN  
    FROM STRATEGIC.ASSETS_SUMMARY_BYCOMMISSIONTYPE
    WHERE TO_DATE(MD_START_DT) = ''@START_DATE@''
    UNION
    SELECT ''@START_DATE@'' AS LOADING_DATE ,''STRATEGIC.ASSETS_SUMMARY_BYCOMMISSIONTYPE_AND_PRODUCT_DAILY'' SRC_TABLE , COUNT(*) TOTAL_ROWS, coalesce(SUM(TOTAL), 0) TOTAL, ''TOTAL''  METRIC_COLUMN 
    FROM STRATEGIC.ASSETS_SUMMARY_BYCOMMISSIONTYPE_AND_PRODUCT_DAILY
    WHERE TO_DATE(MD_START_DT) = ''@START_DATE@''
    UNION
    SELECT ''@START_DATE@'' AS LOADING_DATE ,''STRATEGIC.ASSETS_SUMMARY_BYCOMMISSIONTYPE_AND_PRODUCT_RVP_DAILY'' SRC_TABLE , COUNT(*) TOTAL_ROWS, coalesce(SUM(TOTAL), 0) TOTAL, ''TOTAL''  METRIC_COLUMN 
    FROM STRATEGIC.ASSETS_SUMMARY_BYCOMMISSIONTYPE_AND_PRODUCT_RVP_DAILY 
    WHERE TO_DATE(MD_START_DT) = ''@START_DATE@''
    UNION
    SELECT ''@START_DATE@'' AS LOADING_DATE ,''STRATEGIC.ASSETS_SUMMARY_BYCOMMISSIONTYPE_DAILY'' SRC_TABLE ,COUNT(*) TOTAL_ROWS, coalesce(SUM(VALUE), 0) TOTAL, ''VALUE''  METRIC_COLUMN 
    FROM STRATEGIC.ASSETS_SUMMARY_BYCOMMISSIONTYPE_DAILY                  
    WHERE TO_DATE(MD_START_DT) = ''@START_DATE@''
    UNION 
    SELECT ''@START_DATE@'' AS LOADING_DATE ,''STRATEGIC.ASSETS_SUMMARY_BYCOMMISSIONTYPE_RVP_DAILY'' SRC_TABLE ,COUNT(*) TOTAL_ROWS, coalesce(SUM(VALUE), 0) TOTAL, ''VALUE''  METRIC_COLUMN 
    FROM STRATEGIC.ASSETS_SUMMARY_BYCOMMISSIONTYPE_RVP_DAILY             
    WHERE TO_DATE(MD_START_DT) = ''@START_DATE@''
    UNION 
    SELECT ''@START_DATE@'' AS LOADING_DATE ,''STRATEGIC.ASSETS_SUMMARY_BYPRODUCT_DAILY'' SRC_TABLE ,COUNT(*) TOTAL_ROWS, coalesce(SUM(VALUE), 0) TOTAL, ''VALUE''  METRIC_COLUMN 
    FROM STRATEGIC.ASSETS_SUMMARY_BYPRODUCT_DAILY                         
    WHERE TO_DATE(MD_START_DT) = ''@START_DATE@''
    UNION 
    SELECT ''@START_DATE@'' AS LOADING_DATE ,''STRATEGIC.ASSETS_SUMMARY_BYPRODUCT_RVP_DAILY'' SRC_TABLE ,COUNT(*) TOTAL_ROWS, coalesce(SUM(VALUE), 0) TOTAL, ''VALUE''  METRIC_COLUMN 
    FROM STRATEGIC.ASSETS_SUMMARY_BYPRODUCT_RVP_DAILY                   
    WHERE TO_DATE(MD_START_DT) = ''@START_DATE@''
    UNION
    SELECT ''@START_DATE@'' AS LOADING_DATE ,''STRATEGIC.ASSETS_SUMMARY_BYPROVINCE_DAILY'' SRC_TABLE ,COUNT(*) TOTAL_ROWS, coalesce(SUM(VALUE), 0) TOTAL, ''VALUE''  METRIC_COLUMN 
    FROM STRATEGIC.ASSETS_SUMMARY_BYPROVINCE_DAILY                       
    WHERE TO_DATE(MD_START_DT) = ''@START_DATE@''
    UNION 
    SELECT ''@START_DATE@'' AS LOADING_DATE ,''STRATEGIC.ASSETS_SUMMARY_BYPROVINCE_RVP_DAILY'' SRC_TABLE ,COUNT(*) TOTAL_ROWS, coalesce(SUM(VALUE), 0) TOTAL, ''VALUE''  METRIC_COLUMN 
    FROM STRATEGIC.ASSETS_SUMMARY_BYPROVINCE_RVP_DAILY
    WHERE TO_DATE(MD_START_DT) = ''@START_DATE@''
    UNION

--FACT                                                                           

    SELECT ''@START_DATE@'' AS LOADING_DATE ,''HOLDINGS.FACT_HOLDINGS'' SRC_TABLE ,COUNT(*) TOTAL_ROWS, coalesce(SUM(HOLDING_VALUE), 0) TOTAL, ''HOLDING_VALUE''  METRIC_COLUMN
    FROM HOLDINGS.FACT_HOLDINGS 
    WHERE TO_DATE(MD_START_DT) = ''@START_DATE@''
    UNION
    SELECT ''@START_DATE@'' AS LOADING_DATE , ''REVENUES.FACT_REVENUE'' SRC_TABLE,   COUNT(*) TOTAL_ROWS, coalesce(SUM(REVENUE_AMOUNT), 0) TOTAL, ''REVENUE_AMOUNT''  METRIC_COLUMN 
    FROM REVENUES.FACT_REVENUE 
    WHERE TO_DATE(MD_START_DT) = ''@START_DATE@''
    UNION
    SELECT ''@START_DATE@'' AS LOADING_DATE ,''TRANSACTIONS.FACT_TRANSACTIONS'' SRC_TABLE ,COUNT(*) TOTAL_ROWS, coalesce(SUM(GROSS_AMOUNT), 0) TOTAL, ''GROSS_AMOUNT''  METRIC_COLUMN   
    FROM TRANSACTIONS.FACT_TRANSACTIONS
    WHERE TO_DATE(MD_START_DT) = ''@START_DATE@''
    )
`; 
strSQLDeleteCmd = strSQLDeleteCmd.replace(/@START_DATE@/g, p_START_DATE);
var stmtDelete = snowflake.createStatement({sqlText: strSQLDeleteCmd});
var resDelete = stmtDelete.execute();

strSQLSelectCmd = strSQLSelectCmd.replace(/@START_DATE@/g, p_START_DATE);
var stmtSelect = snowflake.createStatement({sqlText: strSQLSelectCmd});
var resSelect = stmtSelect.execute();
return "SUCCESS";
';
CREATE OR REPLACE PROCEDURE DB_IAW_#env#_DM.STEWARDSHIP.USP_VALIDATE_JOB_EXECUTION("p_START_DATE" VARCHAR(10))
RETURNS VARCHAR(100)
LANGUAGE JAVASCRIPT
EXECUTE AS OWNER
AS '
var strSQLSelectCmd = `
    WITH HOLIDAYS
AS(
    SELECT DISTINCT HOLIDAY_DATE  
    FROM DB_IAW_#env#_DWH.SHARED_RDV.REF_HOLIDAYS_IAS_IAVM R
    INNER JOIN DB_IAW_#env#_DWH.SHARED_RDV.SAT_REF_HOLIDAYS_IAS_IAVM S
    ON S.HK_HUB = R.HK_HUB
    WHERE S.MD_ACTIVE = ''A'' AND HOLIDAY_DATE IS NOT NULL
    ORDER BY 1 DESC
),
LAOD_INFO AS 
(
    SELECT  COUNT(*) nmb 
    FROM    STEWARDSHIP.TABLES_LOADING_INFORMATION
    WHERE   (TOTAL_ROWS = 0 OR TOTAL = 0) AND LOADING_DATE = ''@START_DATE@''
)

--  If the date is holiday or Week-end AND we have some rows in the 
--  table TABLES_LOADING_INFORMATION with TOTAL_ROWS = 0 OR TOTAL = 0 we throw Error failing.
SELECT   IFF( dayname(''@START_DATE@'') IN (''Sat'', ''Sun'')
                OR ''@START_DATE@''  IN (SELECT * FROM HOLIDAYS)
                OR  (SELECT * FROM LAOD_INFO) = 0
             ,  true
             ,  false
            ) AS IS_HOLIDAY
`;
    
strSQLSelectCmd = strSQLSelectCmd.replace(/@START_DATE@/g, p_START_DATE);
var stmtSelect = snowflake.createStatement({sqlText: strSQLSelectCmd});
var resSelect = stmtSelect.execute();
resSelect.next();
 if ( resSelect.getColumnValue(1) == true ) {
    return "SUCCESS" ; 
 } else {
    return "Data load is missing for: " + p_START_DATE + ", please investigate in the table STEWARDSHIP.TABLES_LOADING_INFORMATION to have moreinformation!";
    throw "Error";
 }
';
create or replace schema DB_IAW_#env#_DM.STRATEGIC;

create or replace TABLE DB_IAW_#env#_DM.STRATEGIC.ACCOUNTS_CLIENTS_SUMMARY_DAILY (
	MD_START_DT TIMESTAMP_NTZ(9) COMMENT 'Start Date of the image/version',
	MD_SOURCE VARCHAR(1000) COMMENT 'Represents the source system, file, etc. of the instance',
	MD_CREATION_DT TIMESTAMP_NTZ(9) DEFAULT CURRENT_TIMESTAMP() COMMENT 'Creation Date Time of the occurrence',
	MD_CREATION_AUDIT_ID VARCHAR(1000) COMMENT 'Task execution ID',
	MD_SRC_SYSTEM VARCHAR(100) COMMENT 'Source system',
	MD_EXTRACT_DT TIMESTAMP_NTZ(9) COMMENT 'Source extraction date',
	NB_MANAGED NUMBER(20,2) COMMENT 'Number of managed accounts',
	NB_FEE_BASED NUMBER(20,2) COMMENT 'Number of fee based accounts',
	NB_COMMISSION NUMBER(20,2) COMMENT 'Number of commision based accounts',
	NB_CLIENT NUMBER(20,2) COMMENT 'Number of Clientss',
	NB_ACCOUNT NUMBER(20,2) COMMENT 'Number of accounts',
	PROCESS_DATE TIMESTAMP_NTZ(9) COMMENT 'process date'
);
create or replace TABLE DB_IAW_#env#_DM.STRATEGIC.ACCOUNTS_CLIENTS_SUMMARY_RVP_DAILY (
	MD_START_DT TIMESTAMP_NTZ(9) COMMENT 'Start Date of the image/version',
	MD_SOURCE VARCHAR(1000) COMMENT 'Represents the source system, file, etc. of the instance',
	MD_CREATION_DT TIMESTAMP_NTZ(9) DEFAULT CURRENT_TIMESTAMP() COMMENT 'Creation Date Time of the occurrence',
	MD_CREATION_AUDIT_ID VARCHAR(1000) COMMENT 'Task execution ID',
	MD_SRC_SYSTEM VARCHAR(100) COMMENT 'Source system',
	MD_EXTRACT_DT TIMESTAMP_NTZ(9) COMMENT 'Source extraction date',
	RVPID NUMBER(10,0) COMMENT 'RVP ID',
	NB_MANAGED NUMBER(20,2) COMMENT 'Number of managed accounts',
	NB_FEE_BASED NUMBER(20,2) COMMENT 'Number of fee based accounts',
	NB_COMMISSION NUMBER(20,2) COMMENT 'Number of commision based accounts',
	NB_CLIENT NUMBER(20,2) COMMENT 'Number of Clientss',
	NB_ACCOUNT NUMBER(20,2) COMMENT 'Number of accounts',
	PROCESS_DATE TIMESTAMP_NTZ(9) COMMENT 'process date'
);
create or replace TABLE DB_IAW_#env#_DM.STRATEGIC.ASSETS_SUMMARY_BYACCOUNTTYPE_DAILY (
	MD_START_DT TIMESTAMP_NTZ(9) COMMENT 'Start Date of the image/version',
	MD_SOURCE VARCHAR(1000) COMMENT 'Represents the source system, file, etc. of the instance',
	MD_CREATION_DT TIMESTAMP_NTZ(9) DEFAULT CURRENT_TIMESTAMP() COMMENT 'Creation Date Time of the occurrence',
	MD_CREATION_AUDIT_ID VARCHAR(1000) COMMENT 'Task execution ID',
	MD_SRC_SYSTEM VARCHAR(100) COMMENT 'Source system',
	MD_EXTRACT_DT TIMESTAMP_NTZ(9) COMMENT 'Source extraction date',
	VALUE NUMBER(20,2) COMMENT 'Asset Summary Value for Account Type',
	ACCOUNT_TYPE VARCHAR(1000) COMMENT 'Account Type'
);
create or replace TABLE DB_IAW_#env#_DM.STRATEGIC.ASSETS_SUMMARY_BYACCOUNTTYPE_RVP_DAILY (
	MD_START_DT TIMESTAMP_NTZ(9) COMMENT 'Start Date of the image/version',
	MD_SOURCE VARCHAR(1000) COMMENT 'Represents the source system, file, etc. of the instance',
	MD_CREATION_DT TIMESTAMP_NTZ(9) DEFAULT CURRENT_TIMESTAMP() COMMENT 'Creation Date Time of the occurrence',
	MD_CREATION_AUDIT_ID VARCHAR(1000) COMMENT 'Task execution ID',
	MD_SRC_SYSTEM VARCHAR(100) COMMENT 'Source system',
	MD_EXTRACT_DT TIMESTAMP_NTZ(9) COMMENT 'Source extraction date',
	RVPID NUMBER(10,0) COMMENT 'RVP Ids',
	VALUE NUMBER(20,2) COMMENT 'Asset Summary Value for Account Type',
	ACCOUNT_TYPE VARCHAR(1000) COMMENT 'Account Types'
);
create or replace TABLE DB_IAW_#env#_DM.STRATEGIC.ASSETS_SUMMARY_BYCOMMISSIONTYPE_AND_PRODUCT_DAILY (
	MD_START_DT TIMESTAMP_NTZ(9) COMMENT 'Start Date of the image/version',
	MD_SOURCE VARCHAR(1000) COMMENT 'Represents the source system, file, etc. of the instance',
	MD_CREATION_DT TIMESTAMP_NTZ(9) DEFAULT CURRENT_TIMESTAMP() COMMENT 'Creation Date Time of the occurrence',
	MD_CREATION_AUDIT_ID VARCHAR(1000) COMMENT 'Task execution ID',
	MD_SRC_SYSTEM VARCHAR(100) COMMENT 'Source system',
	MD_EXTRACT_DT TIMESTAMP_NTZ(9) COMMENT 'Source extraction date',
	PROCESS_DATE TIMESTAMP_NTZ(9) COMMENT 'process date',
	COMMISSION_TYPE VARCHAR(16777216) COMMENT 'Commission type',
	EQT NUMBER(20,2) COMMENT 'EQT',
	MUT NUMBER(20,2) COMMENT 'MUT',
	FIX NUMBER(20,2) COMMENT 'FIX',
	OFF NUMBER(20,2) COMMENT 'OFF',
	CASH NUMBER(20,2) COMMENT 'CASH',
	TOTAL NUMBER(20,2) COMMENT 'TOTAL'
);
create or replace TABLE DB_IAW_#env#_DM.STRATEGIC.ASSETS_SUMMARY_BYCOMMISSIONTYPE_AND_PRODUCT_RVP_DAILY (
	MD_START_DT TIMESTAMP_NTZ(9) COMMENT 'Start Date of the image/version',
	MD_SOURCE VARCHAR(1000) COMMENT 'Represents the source system, file, etc. of the instance',
	MD_CREATION_DT TIMESTAMP_NTZ(9) DEFAULT CURRENT_TIMESTAMP() COMMENT 'Creation Date Time of the occurrence',
	MD_CREATION_AUDIT_ID VARCHAR(1000) COMMENT 'Task execution ID',
	MD_SRC_SYSTEM VARCHAR(100) COMMENT 'Source system',
	MD_EXTRACT_DT TIMESTAMP_NTZ(9) COMMENT 'Source extraction date',
	RVPID NUMBER(10,0),
	PROCESS_DATE TIMESTAMP_NTZ(9) COMMENT 'process date',
	COMMISSION_TYPE VARCHAR(16777216) COMMENT 'Commission type',
	EQT NUMBER(20,2) COMMENT 'EQT',
	MUT NUMBER(20,2) COMMENT 'MUT',
	FIX NUMBER(20,2) COMMENT 'FIX',
	OFF NUMBER(20,2) COMMENT 'OFF',
	CASH NUMBER(20,2) COMMENT 'CASH',
	TOTAL NUMBER(20,2) COMMENT 'TOTAL'
);
create or replace TABLE DB_IAW_#env#_DM.STRATEGIC.ASSETS_SUMMARY_BYCOMMISSIONTYPE_DAILY (
	MD_START_DT TIMESTAMP_NTZ(9) COMMENT 'Start Date of the image/version',
	MD_SOURCE VARCHAR(1000) COMMENT 'Represents the source system, file, etc. of the instance',
	MD_CREATION_DT TIMESTAMP_NTZ(9) DEFAULT CURRENT_TIMESTAMP() COMMENT 'Creation Date Time of the occurrence',
	MD_CREATION_AUDIT_ID VARCHAR(1000) COMMENT 'Task execution ID',
	MD_SRC_SYSTEM VARCHAR(100) COMMENT 'Source system',
	MD_EXTRACT_DT TIMESTAMP_NTZ(9) COMMENT 'Source extraction date',
	PROCESS_DATE TIMESTAMP_NTZ(9) COMMENT 'process date',
	VALUE VARCHAR(16777216) COMMENT 'value',
	COMMISSION_TYPE VARCHAR(16777216) COMMENT 'Commission type'
);
create or replace TABLE DB_IAW_#env#_DM.STRATEGIC.ASSETS_SUMMARY_BYCOMMISSIONTYPE_RVP_DAILY (
	MD_START_DT TIMESTAMP_NTZ(9) COMMENT 'Start Date of the image/version',
	MD_SOURCE VARCHAR(1000) COMMENT 'Represents the source system, file, etc. of the instance',
	MD_CREATION_DT TIMESTAMP_NTZ(9) DEFAULT CURRENT_TIMESTAMP() COMMENT 'Creation Date Time of the occurrence',
	MD_CREATION_AUDIT_ID VARCHAR(1000) COMMENT 'Task execution ID',
	MD_SRC_SYSTEM VARCHAR(100) COMMENT 'Source system',
	MD_EXTRACT_DT TIMESTAMP_NTZ(9) COMMENT 'Source extraction date',
	RVPID NUMBER(10,0) COMMENT 'RVP ID',
	PROCESS_DATE TIMESTAMP_NTZ(9) COMMENT 'process date',
	VALUE VARCHAR(16777216) COMMENT 'value',
	COMMISSION_TYPE VARCHAR(16777216) COMMENT 'Commission type'
);
create or replace TABLE DB_IAW_#env#_DM.STRATEGIC.ASSETS_SUMMARY_BYPRODUCT_DAILY (
	MD_START_DT TIMESTAMP_NTZ(9) COMMENT 'Start Date of the image/version',
	MD_SOURCE VARCHAR(1000) COMMENT 'Represents the source system, file, etc. of the instance',
	MD_CREATION_DT TIMESTAMP_NTZ(9) DEFAULT CURRENT_TIMESTAMP() COMMENT 'Creation Date Time of the occurrence',
	MD_CREATION_AUDIT_ID VARCHAR(1000) COMMENT 'Task execution ID',
	MD_SRC_SYSTEM VARCHAR(100) COMMENT 'Source system',
	MD_EXTRACT_DT TIMESTAMP_NTZ(9) COMMENT 'Source extraction date',
	PROCESS_DATE TIMESTAMP_NTZ(9),
	VALUE VARCHAR(16777216),
	PRODUCT_CODE VARCHAR(16777216)
);
create or replace TABLE DB_IAW_#env#_DM.STRATEGIC.ASSETS_SUMMARY_BYPRODUCT_RVP_DAILY (
	MD_START_DT TIMESTAMP_NTZ(9) COMMENT 'Start Date of the image/version',
	MD_SOURCE VARCHAR(1000) COMMENT 'Represents the source system, file, etc. of the instance',
	MD_CREATION_DT TIMESTAMP_NTZ(9) DEFAULT CURRENT_TIMESTAMP() COMMENT 'Creation Date Time of the occurrence',
	MD_CREATION_AUDIT_ID VARCHAR(1000) COMMENT 'Task execution ID',
	MD_SRC_SYSTEM VARCHAR(100) COMMENT 'Source system',
	MD_EXTRACT_DT TIMESTAMP_NTZ(9) COMMENT 'Source extraction date',
	RVPID NUMBER(10,0),
	PROCESS_DATE TIMESTAMP_NTZ(9),
	VALUE VARCHAR(16777216),
	PRODUCT_CODE VARCHAR(16777216)
);
create or replace TABLE DB_IAW_#env#_DM.STRATEGIC.ASSETS_SUMMARY_BYPROVINCE_DAILY (
	MD_START_DT TIMESTAMP_NTZ(9) COMMENT 'Start Date of the image/version',
	MD_SOURCE VARCHAR(1000) COMMENT 'Represents the source system, file, etc. of the instance',
	MD_CREATION_DT TIMESTAMP_NTZ(9) DEFAULT CURRENT_TIMESTAMP() COMMENT 'Creation Date Time of the occurrence',
	MD_CREATION_AUDIT_ID VARCHAR(1000) COMMENT 'Task execution ID',
	MD_SRC_SYSTEM VARCHAR(100) COMMENT 'Source system',
	MD_EXTRACT_DT TIMESTAMP_NTZ(9) COMMENT 'Source extraction date',
	PROCESS_DATE TIMESTAMP_NTZ(9) COMMENT 'Processed Date',
	VALUE NUMBER(20,2) COMMENT 'Asset Summary Value for Province Code',
	PROVINCE_CODE VARCHAR(1000) COMMENT 'Province Code'
);
create or replace TABLE DB_IAW_#env#_DM.STRATEGIC.ASSETS_SUMMARY_BYPROVINCE_RVP_DAILY (
	MD_START_DT TIMESTAMP_NTZ(9) COMMENT 'Start Date of the image/version',
	MD_SOURCE VARCHAR(1000) COMMENT 'Represents the source system, file, etc. of the instance',
	MD_CREATION_DT TIMESTAMP_NTZ(9) DEFAULT CURRENT_TIMESTAMP() COMMENT 'Creation Date Time of the occurrence',
	MD_CREATION_AUDIT_ID VARCHAR(1000) COMMENT 'Task execution ID',
	MD_SRC_SYSTEM VARCHAR(100) COMMENT 'Source system',
	MD_EXTRACT_DT TIMESTAMP_NTZ(9) COMMENT 'Source extraction date',
	RVPID NUMBER(10,0) COMMENT 'RVP Ids',
	PROCESS_DATE TIMESTAMP_NTZ(9) COMMENT 'Processed Date',
	VALUE NUMBER(20,2) COMMENT 'Asset Summary Value for Province',
	PROVINCE_CODE VARCHAR(1000) COMMENT 'Province Code'
);
create or replace view DB_IAW_#env#_DM.STRATEGIC.VW_ACCOUNTS_CLIENTS_SUMMARY_DAILY(
	"Load Date",
	"nb Managed",
	"nb Feebased",
	"nb Commission",
	"nb Client",
	"nb Account",
	"Balance Date"
) as select 	MD_START_DT as "Load Date",
NB_MANAGED as "nb Managed",
	NB_FEE_BASED as "nb Feebased",
	NB_COMMISSION as "nb Commission",
	NB_CLIENT as "nb Client",
	NB_ACCOUNT as "nb Account",
	PROCESS_DATE as "Balance Date"
from DB_IAW_#env#_DM.STRATEGIC.ACCOUNTS_CLIENTS_SUMMARY_DAILY;
create or replace view DB_IAW_#env#_DM.STRATEGIC.VW_ACCOUNTS_CLIENTS_SUMMARY_FROM_STG(
	MD_START_DT,
	MD_SOURCE,
	MD_CREATION_DT,
	MD_SRC_SYSTEM,
	MD_EXTRACT_DT,
	NB_MANAGED,
	NB_FEE_BASED,
	NB_COMMISSION,
	NB_CLIENT,
	NB_ACCOUNT,
	PROCESS_DATE
) as 
SELECT * FROM DB_IAW_#env#_STG.IAPW_PORTAL_API.VW_ACCOUNTS_CLIENTS_SUMMARY;
create or replace view DB_IAW_#env#_DM.STRATEGIC.VW_ACCOUNTS_CLIENTS_SUMMARY_RVP_DAILY(
	"Load Date",
	RVP,
	"nb Managed",
	"nb Feebased",
	"nb Commission",
	"nb Client",
	"nb Account",
	"Balance Date"
) as select 	MD_START_DT as "Load Date",
RVPID as "RVP",
	NB_MANAGED  as "nb Managed",
	NB_FEE_BASED as "nb Feebased",
	NB_COMMISSION as "nb Commission",
	NB_CLIENT as "nb Client",
	NB_ACCOUNT as "nb Account",
	PROCESS_DATE as "Balance Date"
from DB_IAW_#env#_DM.STRATEGIC.ACCOUNTS_CLIENTS_SUMMARY_RVP_DAILY;
create or replace view DB_IAW_#env#_DM.STRATEGIC.VW_ACCOUNTS_CLIENTS_SUMMARY_RVP_FROM_STG(
	MD_START_DT,
	MD_SOURCE,
	MD_CREATION_DT,
	MD_SRC_SYSTEM,
	MD_EXTRACT_DT,
	RVPID,
	NB_MANAGED,
	NB_FEE_BASED,
	NB_COMMISSION,
	NB_CLIENT,
	NB_ACCOUNT,
	PROCESS_DATE
) as 
SELECT * FROM DB_IAW_#env#_STG.IAPW_PORTAL_API.VW_ACCOUNTS_CLIENTS_SUMMARY_RVP;
create or replace view DB_IAW_#env#_DM.STRATEGIC.VW_ASSETS_SUMMARY_BYACCOUNTTYPE_DAILY(
	"Load Date",
	AUA,
	"Program Type"
) as select 	MD_START_DT as "Load Date",
VALUE as "AUA",
	ACCOUNT_TYPE as "Program Type"
from DB_IAW_#env#_DM.STRATEGIC.ASSETS_SUMMARY_BYACCOUNTTYPE_DAILY;
create or replace view DB_IAW_#env#_DM.STRATEGIC.VW_ASSETS_SUMMARY_BYACCOUNTTYPE_FROM_STG(
	MD_START_DT,
	MD_SOURCE,
	MD_CREATION_DT,
	MD_SRC_SYSTEM,
	MD_EXTRACT_DT,
	VALUE,
	ACCOUNT_TYPE
) as 
SELECT * FROM DB_IAW_#env#_STG.IAPW_PORTAL_API.VW_ASSETS_SUMMARY_BYACCOUNTTYPE;
create or replace view DB_IAW_#env#_DM.STRATEGIC.VW_ASSETS_SUMMARY_BYACCOUNTTYPE_RVP_DAILY(
	"Load Date",
	RVP,
	AUA,
	"Program Type"
) as select 	MD_START_DT as "Load Date",
RVPID as "RVP",
	VALUE as "AUA",
	ACCOUNT_TYPE as "Program Type"
from DB_IAW_#env#_DM.STRATEGIC.ASSETS_SUMMARY_BYACCOUNTTYPE_RVP_DAILY;
create or replace view DB_IAW_#env#_DM.STRATEGIC.VW_ASSETS_SUMMARY_BYACCOUNTTYPE_RVP_FROM_STG(
	MD_START_DT,
	MD_SOURCE,
	MD_CREATION_DT,
	MD_SRC_SYSTEM,
	MD_EXTRACT_DT,
	RVPID,
	VALUE,
	ACCOUNT_TYPE
) as 
SELECT * FROM DB_IAW_#env#_STG.IAPW_PORTAL_API.VW_ASSETS_SUMMARY_BYACCOUNTTYPE_RVP;
create or replace view DB_IAW_#env#_DM.STRATEGIC.VW_ASSETS_SUMMARY_BYCOMMISSIONTYPE_AND_PRODUCT_DAILY(
	"Load Date",
	"Balance Date",
	"Commission type",
	"Equity",
	"Mutual Funds",
	"Fixed Income",
	"Offbook Assets",
	"Cash",
	AUA
) as select 	MD_START_DT as "Load Date",
PROCESS_DATE as "Balance Date",
	COMMISSION_TYPE as "Commission type",
	EQT as "Equity",
	MUT as "Mutual Funds",
	FIX as "Fixed Income",
	OFF as "Offbook Assets",
	CASH as "Cash",
	TOTAL as "AUA"
from DB_IAW_#env#_DM.STRATEGIC.ASSETS_SUMMARY_BYCOMMISSIONTYPE_AND_PRODUCT_DAILY;
create or replace view DB_IAW_#env#_DM.STRATEGIC.VW_ASSETS_SUMMARY_BYCOMMISSIONTYPE_AND_PRODUCT_FROM_STG(
	MD_START_DT,
	MD_SOURCE,
	MD_CREATION_DT,
	MD_SRC_SYSTEM,
	MD_EXTRACT_DT,
	PROCESS_DATE,
	COMMISSION_TYPE,
	EQT,
	MUT,
	FIX,
	OFF,
	CASH,
	TOTAL
) as 
SELECT * FROM DB_IAW_#env#_STG.IAPW_PORTAL_API.VW_ASSETS_SUMMARY_BYCOMMISSIONTYPE_AND_PRODUCT;
create or replace view DB_IAW_#env#_DM.STRATEGIC.VW_ASSETS_SUMMARY_BYCOMMISSIONTYPE_AND_PRODUCT_RVP_DAILY(
	"Load Date",
	RVP,
	"Balance Date",
	"Commission type",
	"Equity",
	"Mutual Funds",
	"Fixed Income",
	"Offbook Assets",
	"Cash",
	AUA
) as select 	MD_START_DT as "Load Date",
RVPID as "RVP",
	PROCESS_DATE as "Balance Date",
	COMMISSION_TYPE as "Commission type",
	EQT as "Equity",
	MUT as "Mutual Funds",
	FIX as "Fixed Income",
	OFF as "Offbook Assets",
	CASH as "Cash",
	TOTAL as "AUA"
from DB_IAW_#env#_DM.STRATEGIC.ASSETS_SUMMARY_BYCOMMISSIONTYPE_AND_PRODUCT_RVP_DAILY;
create or replace view DB_IAW_#env#_DM.STRATEGIC.VW_ASSETS_SUMMARY_BYCOMMISSIONTYPE_AND_PRODUCT_RVP_FROM_STG(
	MD_START_DT,
	MD_SOURCE,
	MD_CREATION_DT,
	MD_SRC_SYSTEM,
	MD_EXTRACT_DT,
	RVPID,
	PROCESS_DATE,
	COMMISSION_TYPE,
	EQT,
	MUT,
	FIX,
	OFF,
	CASH,
	TOTAL
) as 
SELECT * FROM DB_IAW_#env#_STG.IAPW_PORTAL_API.VW_ASSETS_SUMMARY_BYCOMMISSIONTYPE_AND_PRODUCT_RVP;
create or replace view DB_IAW_#env#_DM.STRATEGIC.VW_ASSETS_SUMMARY_BYCOMMISSIONTYPE_DAILY(
	"Load Date",
	"Balance Date",
	AUA,
	"Commission type"
) as select 	MD_START_DT as "Load Date",
PROCESS_DATE as "Balance Date",
	VALUE as "AUA",
	COMMISSION_TYPE as "Commission type"
from DB_IAW_#env#_DM.STRATEGIC.ASSETS_SUMMARY_BYCOMMISSIONTYPE_DAILY;
create or replace view DB_IAW_#env#_DM.STRATEGIC.VW_ASSETS_SUMMARY_BYCOMMISSIONTYPE_FROM_STG(
	MD_START_DT,
	MD_SOURCE,
	MD_CREATION_DT,
	MD_SRC_SYSTEM,
	MD_EXTRACT_DT,
	PROCESS_DATE,
	VALUE,
	COMMISSION_TYPE
) as 
SELECT * FROM DB_IAW_#env#_STG.IAPW_PORTAL_API.VW_ASSETS_SUMMARY_BYCOMMISSIONTYPE;
create or replace view DB_IAW_#env#_DM.STRATEGIC.VW_ASSETS_SUMMARY_BYCOMMISSIONTYPE_RVP_DAILY(
	"Load Date",
	RVP,
	"Balance Date",
	AUA,
	"Commission type"
) as select 	MD_START_DT as "Load Date",
RVPID as "RVP",
	PROCESS_DATE as "Balance Date",
	VALUE as "AUA",
	COMMISSION_TYPE as "Commission type"
from DB_IAW_#env#_DM.STRATEGIC.ASSETS_SUMMARY_BYCOMMISSIONTYPE_RVP_DAILY;
create or replace view DB_IAW_#env#_DM.STRATEGIC.VW_ASSETS_SUMMARY_BYCOMMISSIONTYPE_RVP_FROM_STG(
	MD_START_DT,
	MD_SOURCE,
	MD_CREATION_DT,
	MD_SRC_SYSTEM,
	MD_EXTRACT_DT,
	RVPID,
	PROCESS_DATE,
	VALUE,
	COMMISSION_TYPE
) as 
SELECT * FROM DB_IAW_#env#_STG.IAPW_PORTAL_API.VW_ASSETS_SUMMARY_BYCOMMISSIONTYPE_RVP;
create or replace view DB_IAW_#env#_DM.STRATEGIC.VW_ASSETS_SUMMARY_BYPRODUCT_DAILY(
	"Load Date",
	"Balance Date",
	AUA,
	"Product Type"
) as select 	MD_START_DT as "Load Date",
PROCESS_DATE as "Balance Date",
	VALUE as "AUA",
	PRODUCT_CODE as "Product Type"
from DB_IAW_#env#_DM.STRATEGIC.ASSETS_SUMMARY_BYPRODUCT_DAILY;
create or replace view DB_IAW_#env#_DM.STRATEGIC.VW_ASSETS_SUMMARY_BYPRODUCT_FROM_STG(
	MD_START_DT,
	MD_SOURCE,
	MD_CREATION_DT,
	MD_SRC_SYSTEM,
	MD_EXTRACT_DT,
	PROCESS_DATE,
	VALUE,
	PRODUCT_CODE
) as 
SELECT * FROM DB_IAW_#env#_STG.IAPW_PORTAL_API.VW_ASSETS_SUMMARY_BYPRODUCT;
create or replace view DB_IAW_#env#_DM.STRATEGIC.VW_ASSETS_SUMMARY_BYPRODUCT_RVP_DAILY(
	"Load Date",
	RVP,
	"Balance Date",
	AUA,
	"Product Type"
) as select 	MD_START_DT as "Load Date",
RVPID as "RVP",
	PROCESS_DATE as "Balance Date",
	VALUE as "AUA",
	PRODUCT_CODE as "Product Type"
from DB_IAW_#env#_DM.STRATEGIC.ASSETS_SUMMARY_BYPRODUCT_RVP_DAILY;
create or replace view DB_IAW_#env#_DM.STRATEGIC.VW_ASSETS_SUMMARY_BYPRODUCT_RVP_FROM_STG(
	MD_START_DT,
	MD_SOURCE,
	MD_CREATION_DT,
	MD_SRC_SYSTEM,
	MD_EXTRACT_DT,
	RVPID,
	PROCESS_DATE,
	VALUE,
	PRODUCT_CODE
) as 
SELECT * FROM DB_IAW_#env#_STG.IAPW_PORTAL_API.VW_ASSETS_SUMMARY_BYPRODUCT_RVP;
create or replace view DB_IAW_#env#_DM.STRATEGIC.VW_ASSETS_SUMMARY_BYPROVINCE_DAILY(
	"Load Date",
	"Balance Date",
	AUA,
	"Province"
) as select 	MD_START_DT as "Load Date",
PROCESS_DATE as "Balance Date",
	VALUE as "AUA",
	PROVINCE_CODE as "Province"
from DB_IAW_#env#_DM.STRATEGIC.ASSETS_SUMMARY_BYPROVINCE_DAILY;
create or replace view DB_IAW_#env#_DM.STRATEGIC.VW_ASSETS_SUMMARY_BYPROVINCE_FROM_STG(
	MD_START_DT,
	MD_SOURCE,
	MD_CREATION_DT,
	MD_SRC_SYSTEM,
	MD_EXTRACT_DT,
	PROCESS_DATE,
	VALUE,
	PROVINCE_CODE
) as 
SELECT * FROM DB_IAW_#env#_STG.IAPW_PORTAL_API.VW_ASSETS_SUMMARY_BYPROVINCE;
create or replace view DB_IAW_#env#_DM.STRATEGIC.VW_ASSETS_SUMMARY_BYPROVINCE_RVP_DAILY(
	"Load Date",
	RVP,
	"Balance Date",
	AUA,
	"Province"
) as select 	MD_START_DT as "Load Date",
RVPID as "RVP",
	PROCESS_DATE as "Balance Date",
	VALUE as "AUA",
	PROVINCE_CODE as "Province"
from DB_IAW_#env#_DM.STRATEGIC.ASSETS_SUMMARY_BYPROVINCE_RVP_DAILY;
create or replace view DB_IAW_#env#_DM.STRATEGIC.VW_ASSETS_SUMMARY_BYPROVINCE_RVP_FROM_STG(
	MD_START_DT,
	MD_SOURCE,
	MD_CREATION_DT,
	MD_SRC_SYSTEM,
	MD_EXTRACT_DT,
	RVPID,
	PROCESS_DATE,
	VALUE,
	PROVINCE_CODE
) as 
SELECT * FROM DB_IAW_#env#_STG.IAPW_PORTAL_API.VW_ASSETS_SUMMARY_BYPROVINCE_RVP;
create or replace view DB_IAW_#env#_DM.STRATEGIC.VW_MONTHLY_KPI_FIRM(
	"KPI date",
	"Metric name",
	VALUE,
	TARGET
) as
WITH TARGET_FIRM AS 
(
SELECT  
YEAR(H_TARGET.KPI_DATE) AS V_YEAR,
MONTH(H_TARGET.KPI_DATE) AS V_MONTH,
H_TARGET.KPI_DATE,
H_TARGET.METRIC_NAME,
S_TARGET.TARGET
FROM DB_IAW_#env#_DWH.STEWARDSHIP_RDV.REF_KPI_TARGET_FIRM H_TARGET
INNER JOIN DB_IAW_#env#_DWH.STEWARDSHIP_RDV.SAT_REF_KPI_TARGET_FIRM S_TARGET
ON H_TARGET.HK_HUB = S_TARGET.HK_HUB 
INNER JOIN (SELECT HK_HUB, MAX(MD_START_DT) AS MAX_MD_START_DT FROM DB_IAW_#env#_DWH.STEWARDSHIP_RDV.SAT_REF_KPI_TARGET_FIRM GROUP BY HK_HUB) LV_TARGET
ON LV_TARGET.HK_HUB = S_TARGET.HK_HUB AND S_TARGET.MD_START_DT = LV_TARGET.MAX_MD_START_DT
),
AUA AS 
(
    SELECT 
	TARGET_FIRM.V_YEAR,
    TARGET_FIRM.V_MONTH,
	SUM(VALUE) AS VALUE
	FROM STRATEGIC.ASSETS_SUMMARY_BYACCOUNTTYPE_DAILY F
	INNER JOIN TARGET_FIRM 
        ON F.MD_START_DT = DATEADD(DAY,1,TARGET_FIRM.KPI_DATE) 
        AND TARGET_FIRM.METRIC_NAME = 'AUA' 
	GROUP BY V_YEAR,V_MONTH
),
SMA AS 
(
	SELECT 
	TARGET_FIRM.V_YEAR,
    TARGET_FIRM.V_MONTH,
	SUM(VALUE) AS VALUE
	FROM STRATEGIC.ASSETS_SUMMARY_BYACCOUNTTYPE_DAILY F
    INNER JOIN TARGET_FIRM 
        ON F.MD_START_DT = DATEADD(DAY,1,TARGET_FIRM.KPI_DATE) 
        AND TARGET_FIRM.METRIC_NAME = 'SMA'
	WHERE ACCOUNT_TYPE IN ('diversiflex','iasStrategic','iaWealthAssist','vintage')
	GROUP BY V_YEAR,V_MONTH
),
AUM AS 
(
	SELECT
    TARGET_FIRM.V_YEAR,
    TARGET_FIRM.V_MONTH,
    SUM(AUM) AS VALUE
    FROM HOLDINGS.FACT_HOLDINGS F
    INNER JOIN TARGET_FIRM
        ON F.MD_START_DT = DATEADD(DAY,1,TARGET_FIRM.KPI_DATE) AND TARGET_FIRM.METRIC_NAME = 'AUM'
    WHERE F.MD_SRC_SYSTEM = 'IAS'
    GROUP BY V_YEAR,V_MONTH
),
APPWAY_REGISTRATION  AS 
(
   SELECT 
   TARGET_FIRM.V_YEAR,
   TARGET_FIRM.V_MONTH,
   "Appway % Registration" AS VALUE
   FROM EXTERNAL_KPI.VW_MASTER_KPI_DATA_IAPW F
   INNER JOIN TARGET_FIRM
   ON F."KPI Date" = TARGET_FIRM.KPI_DATE AND TARGET_FIRM.METRIC_NAME = 'Appway Registration'  
),
E_DELIVERY  AS 
(
   SELECT 
   TARGET_FIRM.V_YEAR,
   TARGET_FIRM.V_MONTH,
   "Avg. E-Delivery % registration" AS VALUE
   FROM EXTERNAL_KPI.VW_MASTER_KPI_DATA_IAPW F
   INNER JOIN TARGET_FIRM
   ON F."KPI Date" = TARGET_FIRM.KPI_DATE AND TARGET_FIRM.METRIC_NAME = 'E-Delivery'
),
CLIENT_PORTAL_REGISTRATION  AS 
(
   SELECT 
   TARGET_FIRM.V_YEAR,
   TARGET_FIRM.V_MONTH,
   "Portal % registration" AS VALUE
   FROM EXTERNAL_KPI.VW_MASTER_KPI_DATA_IAPW F
   INNER JOIN TARGET_FIRM
   ON F."KPI Date" = TARGET_FIRM.KPI_DATE AND TARGET_FIRM.METRIC_NAME = 'Client Portal Registration'
),
FEE_BASED_MANAGED AS 
(
	SELECT 
	YEAR(F.PAYMENT_DATE) AS V_YEAR, 
	MONTH (F.PAYMENT_DATE) AS V_MONTH,
	SUM(REVENUE_AMOUNT) AS VALUE
	FROM REVENUES.FACT_REVENUE F 
	WHERE F.MD_SRC_SYSTEM = 'IAS-COMMISSION'
	AND F.REVENUE_TYPE = 'Fee based/Managed'
	GROUP BY V_YEAR,V_MONTH
),
RETAIL_REVENUE AS 
(
	SELECT 
	YEAR(F.PAYMENT_DATE) AS V_YEAR, 
	MONTH (F.PAYMENT_DATE) AS V_MONTH,
	SUM(REVENUE_AMOUNT) AS VALUE
	FROM REVENUES.FACT_REVENUE F 
	WHERE F.MD_SRC_SYSTEM = 'IAS-COMMISSION' AND F.REVENUE_SUBTYPE IN ('Fixed fees','Managed','OffBook commission','Others','Trade commissions','Trailer fees and GIC')
	GROUP BY V_YEAR,V_MONTH
),
INSURANCE_REVENUE AS 
(
	SELECT 
	YEAR(F.PAYMENT_DATE) AS V_YEAR, 
	MONTH (F.PAYMENT_DATE) AS V_MONTH,
	SUM(INSURANCE_REVENUE) AS VALUE
	FROM REVENUES.FACT_REVENUE F 
	WHERE F.MD_SRC_SYSTEM = 'IAS-COMMISSION' AND F.REVENUE_SUBTYPE = 'Insurance'
	GROUP BY V_YEAR,V_MONTH
),
NUMBER_ADVISOR_TEAMS AS 
(
	SELECT 
	TARGET_FIRM.V_YEAR, 
	TARGET_FIRM.V_MONTH,
	COUNT(DISTINCT TEAM_NAME) AS VALUE
	FROM SHARED.DIM_ADVISOR D
	INNER JOIN TARGET_FIRM ON D.MD_START_DT <= TARGET_FIRM.KPI_DATE AND COALESCE(D.MD_END_DT,'9999-12-31') > TARGET_FIRM.KPI_DATE AND TARGET_FIRM.METRIC_NAME = 'Number of advisor Team'
	WHERE D.MD_SRC_SYSTEM = 'IAS' AND D.HK_HUB <> '0'
	GROUP BY V_YEAR,V_MONTH
),
ORGANIC_GROWTH AS 
(
	SELECT 
	YEAR(F.TRADE_DATE) AS V_YEAR, 
	MONTH (F.TRADE_DATE) AS V_MONTH,
	SUM(GROSS_AMOUNT) AS VALUE
	FROM TRANSACTIONS.FACT_TRANSACTIONS F 
	INNER JOIN SHARED.DIM_ADVISOR D
		ON D.ID = F.SK_DIM_ADVISORS 
	WHERE F.MD_SRC_SYSTEM = 'IAS' 
		AND F.CASH_FLOW_TYPE <> 'OTHER' 
		AND COALESCE(D.TEAM_CODE,-1) NOT IN (-1,100513,124131) -- We need to remove these teams 'iA House','National Branch','iA Wealth Advice Centre','House (CMZ7)' 
		AND F.DEPARTED_ADVISOR_IND = 0 
		AND D.NEW_ADVISOR = 0
	GROUP BY V_YEAR,V_MONTH
),
RECRUIMENT AS 
(
	SELECT 
	YEAR(F.TRADE_DATE) AS V_YEAR, 
	MONTH (F.TRADE_DATE) AS V_MONTH,
	SUM(GROSS_AMOUNT) AS VALUE
	FROM TRANSACTIONS.FACT_TRANSACTIONS F 
	INNER JOIN SHARED.DIM_ADVISOR D
		ON D.ID = F.SK_DIM_ADVISORS 
	WHERE F.MD_SRC_SYSTEM = 'IAS' 
		AND F.CASH_FLOW_TYPE <> 'OTHER' 
		AND COALESCE(D.TEAM_CODE,-1) NOT IN (-1,100513,124131)
		AND D.NEW_ADVISOR = 1
        AND F.DEPARTED_ADVISOR_IND <> 1
	GROUP BY V_YEAR,V_MONTH
),
DEPARTED_AUA AS 
(
	SELECT 
	YEAR(F.TRADE_DATE) AS V_YEAR, 
	MONTH (F.TRADE_DATE) AS V_MONTH,
	SUM(GROSS_AMOUNT) AS VALUE
	FROM TRANSACTIONS.FACT_TRANSACTIONS F 
	INNER JOIN SHARED.DIM_ADVISOR D
		ON D.ID = F.SK_DIM_ADVISORS 
    INNER JOIN SHARED.DIM_ADVISOR DP
		ON DP.ID = F.SK_DEPARTED_ADVISOR
	WHERE F.MD_SRC_SYSTEM = 'IAS' 
		AND F.CASH_FLOW_TYPE <> 'OTHER' 
		AND COALESCE(D.TEAM_CODE,-1) NOT IN (-1,100513,124131)
		AND F.DEPARTED_ADVISOR_IND = 1
        AND DP.ADVISOR_FULLNAME IS NOT NULL 
        AND F.TRADE_DATE >= DP.END_DATE
        AND F.TRADE_DATE < DATEADD(YEAR,1,DP.END_DATE)
	GROUP BY V_YEAR,V_MONTH
) 
SELECT 
  LV_T.KPI_DATE AS "KPI date", -- KPI date (end of month date) gotten from target table 
  LV_T.METRIC_NAME AS "Metric name", -- KPI name mentioned in the target table
CASE 
	WHEN LV_T.METRIC_NAME = 'AUA' THEN  AUA.VALUE 
	WHEN LV_T.METRIC_NAME = 'SMA' THEN  SMA.VALUE
    WHEN LV_T.METRIC_NAME = 'AUM' THEN  AUM.VALUE
	WHEN LV_T.METRIC_NAME = 'Organic Growth' THEN ORGANIC_GROWTH.VALUE 
	WHEN LV_T.METRIC_NAME = 'Retail Revenue' THEN RETAIL_REVENUE.VALUE
	WHEN LV_T.METRIC_NAME = 'Insurance Revenue' THEN INSURANCE_REVENUE.VALUE
	WHEN LV_T.METRIC_NAME = 'Number of advisor Team' THEN NUMBER_ADVISOR_TEAMS.VALUE
	WHEN LV_T.METRIC_NAME = 'Recruitment' THEN RECRUIMENT.VALUE
	WHEN LV_T.METRIC_NAME = 'Departed AUA' THEN DEPARTED_AUA.VALUE
	WHEN LV_T.METRIC_NAME = 'Fee Based / Managed Revenues' THEN FEE_BASED_MANAGED.VALUE
	WHEN LV_T.METRIC_NAME = 'Appway Registration' THEN APPWAY_REGISTRATION.VALUE
	WHEN LV_T.METRIC_NAME = 'E-Delivery' THEN E_DELIVERY.VALUE
	WHEN LV_T.METRIC_NAME = 'Client Portal Registration' THEN CLIENT_PORTAL_REGISTRATION.VALUE
	ELSE NULL END AS Value -- The value of the KPI for that end of month (KPI DATE)
, LV_T.TARGET  AS Target -- The target value of the KPI that we seek to rich for that end of month 
FROM TARGET_FIRM LV_T
LEFT JOIN AUA  
	ON AUA.V_YEAR = LV_T.V_YEAR 
	AND AUA.V_MONTH = LV_T.V_MONTH
LEFT JOIN SMA  
	ON SMA.V_YEAR = LV_T.V_YEAR 
	AND SMA.V_MONTH = LV_T.V_MONTH
LEFT JOIN AUM  
	ON AUM.V_YEAR = LV_T.V_YEAR 
	AND AUM.V_MONTH = LV_T.V_MONTH
LEFT JOIN APPWAY_REGISTRATION  
	ON APPWAY_REGISTRATION.V_YEAR = LV_T.V_YEAR 
	AND APPWAY_REGISTRATION.V_MONTH = LV_T.V_MONTH
LEFT JOIN E_DELIVERY  
	ON E_DELIVERY.V_YEAR = LV_T.V_YEAR 
	AND E_DELIVERY.V_MONTH = LV_T.V_MONTH
LEFT JOIN CLIENT_PORTAL_REGISTRATION  
	ON CLIENT_PORTAL_REGISTRATION.V_YEAR = LV_T.V_YEAR 
	AND CLIENT_PORTAL_REGISTRATION.V_MONTH = LV_T.V_MONTH
LEFT JOIN FEE_BASED_MANAGED  
	ON FEE_BASED_MANAGED.V_YEAR = LV_T.V_YEAR 
	AND FEE_BASED_MANAGED.V_MONTH = LV_T.V_MONTH
LEFT JOIN RETAIL_REVENUE  
	ON RETAIL_REVENUE.V_YEAR = LV_T.V_YEAR 
	AND RETAIL_REVENUE.V_MONTH = LV_T.V_MONTH
LEFT JOIN INSURANCE_REVENUE  
	ON INSURANCE_REVENUE.V_YEAR = LV_T.V_YEAR 
	AND INSURANCE_REVENUE.V_MONTH = LV_T.V_MONTH
LEFT JOIN NUMBER_ADVISOR_TEAMS  
	ON NUMBER_ADVISOR_TEAMS.V_YEAR = LV_T.V_YEAR 
	AND NUMBER_ADVISOR_TEAMS.V_MONTH = LV_T.V_MONTH
LEFT JOIN ORGANIC_GROWTH  
	ON ORGANIC_GROWTH.V_YEAR = LV_T.V_YEAR 
	AND ORGANIC_GROWTH.V_MONTH = LV_T.V_MONTH
LEFT JOIN RECRUIMENT  
	ON RECRUIMENT.V_YEAR = LV_T.V_YEAR 
	AND RECRUIMENT.V_MONTH = LV_T.V_MONTH
LEFT JOIN DEPARTED_AUA  
	ON DEPARTED_AUA.V_YEAR = LV_T.V_YEAR 
	AND DEPARTED_AUA.V_MONTH = LV_T.V_MONTH;
create or replace view DB_IAW_#env#_DM.STRATEGIC.VW_MONTHLY_KPI_RVP(
	"KPI date",
	RVP,
	"Metric name",
	"Value",
	"Target"
) as
WITH REF_RVP AS
(
	      SELECT 1 AS RVPID , 'Wilkinson, Geoffrey' AS RVP_NAME
	UNION SELECT 2 AS RVPID , 'Fisher, Stacie' AS RVP_NAME
	UNION SELECT 3 AS RVPID , 'Neale, Mark Kenneth' AS RVP_NAME
	UNION SELECT 4 AS RVPID , 'Dayan, Frederic Albert' AS RVP_NAME
	UNION SELECT 5 AS RVPID , '(TERMINATED)' AS RVP_NAME
	UNION SELECT 6 AS RVPID , 'National Branch' AS RVP_NAME
	UNION SELECT 7 AS RVPID , 'Morra, Mary Helen' AS RVP_NAME
),
TARGET_RVP AS 
(
SELECT  
	 YEAR(H_TARGET.KPI_DATE) AS V_YEAR
	,MONTH(H_TARGET.KPI_DATE) AS V_MONTH
	,H_TARGET.KPI_DATE
	,S_TARGET.RVP_NAME AS RVP
	,H_TARGET.RVP_ID AS RVPID
	,H_TARGET.METRIC_NAME
	,S_TARGET.TARGET
	FROM DB_IAW_#env#_DWH.STEWARDSHIP_RDV.REF_KPI_TARGET_RVP H_TARGET
	INNER JOIN DB_IAW_#env#_DWH.STEWARDSHIP_RDV.SAT_REF_KPI_TARGET_RVP  S_TARGET
		ON H_TARGET.HK_HUB = S_TARGET.HK_HUB 
	INNER JOIN (SELECT HK_HUB, MAX(MD_START_DT) AS MAX_MD_START_DT FROM DB_IAW_#env#_DWH.STEWARDSHIP_RDV.SAT_REF_KPI_TARGET_RVP GROUP BY HK_HUB) LV_TARGET
		ON LV_TARGET.HK_HUB = S_TARGET.HK_HUB 
		AND S_TARGET.MD_START_DT = LV_TARGET.MAX_MD_START_DT
),
AUA_RVP AS 
(
	SELECT 
	TARGET_RVP.V_YEAR, 
	TARGET_RVP.V_MONTH,
	F.RVPID,
	SUM(VALUE) AS VALUE
	FROM STRATEGIC.ASSETS_SUMMARY_BYACCOUNTTYPE_RVP_DAILY F
    INNER JOIN TARGET_RVP 
        ON F.MD_START_DT = DATEADD(DAY,1,TARGET_RVP.KPI_DATE) 
        AND TARGET_RVP.RVPID = F.RVPID 
        AND TARGET_RVP.METRIC_NAME = 'AUA'
	GROUP BY V_YEAR,V_MONTH,F.RVPID
),
SMA_RVP AS 
(
	SELECT 
	TARGET_RVP.V_YEAR, 
	TARGET_RVP.V_MONTH,
	F.RVPID,
	SUM(VALUE) AS VALUE
	FROM STRATEGIC.ASSETS_SUMMARY_BYACCOUNTTYPE_RVP_DAILY F
    INNER JOIN TARGET_RVP 
        ON F.MD_START_DT = DATEADD(DAY,1,TARGET_RVP.KPI_DATE) 
        AND TARGET_RVP.RVPID = F.RVPID 
        AND TARGET_RVP.METRIC_NAME = 'SMA'
	WHERE ACCOUNT_TYPE IN ('diversiflex','iasStrategic','iaWealthAssist','vintage')
	GROUP BY V_YEAR,V_MONTH,F.RVPID
),
AUM_RVP AS 
(
	SELECT
	TARGET_RVP.V_YEAR, 
	TARGET_RVP.V_MONTH,
	REF_RVP.RVPID,
	SUM(AUM) AS VALUE
	FROM HOLDINGS.FACT_HOLDINGS F 
	INNER JOIN SHARED.DIM_ADVISOR D
		ON D.ID = F.SK_DIM_ADVISORS 
    LEFT JOIN REF_RVP 
		ON REF_RVP.RVP_NAME = D.REGION_VP
    INNER JOIN TARGET_RVP 
        ON F.MD_START_DT = DATEADD(DAY,1,TARGET_RVP.KPI_DATE) 
        AND TARGET_RVP.RVPID = REF_RVP.RVPID 
        AND TARGET_RVP.METRIC_NAME = 'AUM'
	WHERE F.MD_SRC_SYSTEM = 'IAS'
	GROUP BY V_YEAR,V_MONTH,REF_RVP.RVPID
),
FEE_BASED_MANAGED_RVP AS 
(
	SELECT 
	YEAR(F.PAYMENT_DATE) AS V_YEAR, 
	MONTH (F.PAYMENT_DATE) AS V_MONTH,
	REF_RVP.RVPID,
	SUM(REVENUE_AMOUNT) AS VALUE
	FROM REVENUES.FACT_REVENUE F 
	INNER JOIN SHARED.DIM_ADVISOR D
		ON D.ID = F.SK_DIM_ADVISORS 
	LEFT JOIN REF_RVP 
	    ON REF_RVP.RVP_NAME = D.REGION_VP
	WHERE F.MD_SRC_SYSTEM = 'IAS-COMMISSION' AND F.REVENUE_TYPE = 'Fee based/Managed'
	GROUP BY V_YEAR,V_MONTH,RVPID
),
RETAIL_REVENUE_RVP AS 
(
	SELECT 
	YEAR(F.PAYMENT_DATE) AS V_YEAR, 
	MONTH (F.PAYMENT_DATE) AS V_MONTH,
	REF_RVP.RVPID,
	SUM(REVENUE_AMOUNT) AS VALUE
	FROM REVENUES.FACT_REVENUE F 
	INNER JOIN SHARED.DIM_ADVISOR D
		ON D.ID = F.SK_DIM_ADVISORS
	LEFT JOIN REF_RVP 
		ON REF_RVP.RVP_NAME = D.REGION_VP
	WHERE F.MD_SRC_SYSTEM = 'IAS-COMMISSION' AND F.REVENUE_SUBTYPE IN ('Fixed fees','Managed','OffBook commission','Others','Trade commissions','Trailer fees and GIC')
	GROUP BY V_YEAR,V_MONTH,RVPID
),
INSURANCE_REVENUE_RVP AS 
(
	SELECT 
	YEAR(F.PAYMENT_DATE) AS V_YEAR, 
	MONTH (F.PAYMENT_DATE) AS V_MONTH,
	REF_RVP.RVPID,
	SUM(INSURANCE_REVENUE) AS VALUE
	FROM REVENUES.FACT_REVENUE F 
	INNER JOIN SHARED.DIM_ADVISOR D
		ON D.ID = F.SK_DIM_ADVISORS 
	LEFT JOIN REF_RVP 
		ON REF_RVP.RVP_NAME = D.REGION_VP
	WHERE F.MD_SRC_SYSTEM = 'IAS-COMMISSION' AND F.REVENUE_SUBTYPE = 'Insurance'
	GROUP BY V_YEAR,V_MONTH,RVPID
),
NUMBER_ADVISOR_TEAMS_RVP AS 
(
    SELECT 
	TARGET_RVP.V_YEAR, 
	TARGET_RVP.V_MONTH,
	TARGET_RVP.RVPID,
	COUNT(DISTINCT TEAM_NAME) AS VALUE
	FROM SHARED.DIM_ADVISOR D
    LEFT JOIN REF_RVP 
		ON REF_RVP.RVP_NAME = D.REGION_VP
	INNER JOIN TARGET_RVP 
        ON D.MD_START_DT <= TARGET_RVP.KPI_DATE 
        AND COALESCE(D.MD_END_DT,'9999-12-31') > TARGET_RVP.KPI_DATE 
        AND TARGET_RVP.RVPID = REF_RVP.RVPID 
        AND TARGET_RVP.METRIC_NAME = 'Number of advisor Team'
	WHERE D.MD_SRC_SYSTEM = 'IAS' AND D.HK_HUB <> '0'
	GROUP BY V_YEAR,V_MONTH,TARGET_RVP.RVPID
),
ORGANIC_GROWTH_RVP AS 
(
	SELECT 
	YEAR(F.TRADE_DATE) AS V_YEAR, 
	MONTH (F.TRADE_DATE) AS V_MONTH,
	REF_RVP.RVPID,
	SUM(GROSS_AMOUNT) AS VALUE
	FROM TRANSACTIONS.FACT_TRANSACTIONS F 
	INNER JOIN SHARED.DIM_ADVISOR D
		ON D.ID = F.SK_DIM_ADVISORS 
	LEFT JOIN REF_RVP 
		ON REF_RVP.RVP_NAME = D.REGION_VP
	WHERE F.MD_SRC_SYSTEM = 'IAS' 
		AND F.CASH_FLOW_TYPE <> 'OTHER' 
		AND COALESCE(D.TEAM_CODE,-1) NOT IN (-1,100513,124131) 
		AND F.DEPARTED_ADVISOR_IND = 0 
		AND D.NEW_ADVISOR = 0
	GROUP BY V_YEAR,V_MONTH,REF_RVP.RVPID
),
RECRUIMENT_RVP AS 
(
	SELECT 
	YEAR(F.TRADE_DATE) AS V_YEAR, 
	MONTH (F.TRADE_DATE) AS V_MONTH,
	REF_RVP.RVPID,
	SUM(GROSS_AMOUNT) AS VALUE
	FROM TRANSACTIONS.FACT_TRANSACTIONS F 
	INNER JOIN SHARED.DIM_ADVISOR D
		ON D.ID = F.SK_DIM_ADVISORS 
	LEFT JOIN REF_RVP 
		ON REF_RVP.RVP_NAME = D.REGION_VP
	WHERE F.MD_SRC_SYSTEM = 'IAS' 
		AND F.CASH_FLOW_TYPE <> 'OTHER' 
		AND COALESCE(D.TEAM_CODE,-1) NOT IN (-1,100513,124131)
		AND D.NEW_ADVISOR = 1
        AND F.DEPARTED_ADVISOR_IND <> 1
	GROUP BY V_YEAR,V_MONTH,REF_RVP.RVPID
),
DEPARTED_AUA_RVP AS 
(
	SELECT 
	YEAR(F.TRADE_DATE) AS V_YEAR, 
	MONTH (F.TRADE_DATE) AS V_MONTH,
	REF_RVP.RVPID,
	SUM(GROSS_AMOUNT) AS VALUE
	FROM TRANSACTIONS.FACT_TRANSACTIONS F 
	INNER JOIN SHARED.DIM_ADVISOR D
		ON D.ID = F.SK_DIM_ADVISORS 
    INNER JOIN SHARED.DIM_ADVISOR DP
		ON DP.ID = F.SK_DEPARTED_ADVISOR
	LEFT JOIN REF_RVP 
		ON REF_RVP.RVP_NAME = D.REGION_VP
	WHERE F.MD_SRC_SYSTEM = 'IAS' 
		AND F.CASH_FLOW_TYPE <> 'OTHER' 
		AND COALESCE(D.TEAM_CODE,-1) NOT IN (-1,100513,124131)
		AND F.DEPARTED_ADVISOR_IND = 1
        AND DP.ADVISOR_FULLNAME IS NOT NULL 
        AND F.TRADE_DATE >= DP.END_DATE
        AND F.TRADE_DATE < DATEADD(YEAR,1,DP.END_DATE)
	GROUP BY V_YEAR,V_MONTH,REF_RVP.RVPID
) 
SELECT 
  LV_T.KPI_DATE AS "KPI date" -- KPI date (end of month date) gotten from target table 
, LV_T.RVP -- Name of region vice-president 
, LV_T.METRIC_NAME AS "Metric name" -- KPI name mentionned in the target table
, 
CASE 
	WHEN LV_T.METRIC_NAME = 'AUA' THEN  AUA_RVP.VALUE 
	WHEN LV_T.METRIC_NAME = 'SMA' THEN  SMA_RVP.VALUE
    WHEN LV_T.METRIC_NAME = 'AUM' THEN  AUM_RVP.VALUE
	WHEN LV_T.METRIC_NAME = 'Organic Growth' THEN ORGANIC_GROWTH_RVP.VALUE 
	WHEN LV_T.METRIC_NAME = 'Retail Revenue' THEN RETAIL_REVENUE_RVP.VALUE
	WHEN LV_T.METRIC_NAME = 'Insurance Revenue' THEN INSURANCE_REVENUE_RVP.VALUE
	WHEN LV_T.METRIC_NAME = 'Number of advisor Team' THEN NUMBER_ADVISOR_TEAMS_RVP.VALUE
	WHEN LV_T.METRIC_NAME = 'Recruitment' THEN RECRUIMENT_RVP.VALUE
	WHEN LV_T.METRIC_NAME = 'Departed AUA' THEN DEPARTED_AUA_RVP.VALUE
	WHEN LV_T.METRIC_NAME = 'Fee Based / Managed Revenues' THEN FEE_BASED_MANAGED_RVP.VALUE
	ELSE NULL END AS "Value" -- The value of the KPI for that end of month (KPI DATE)
, LV_T.TARGET  AS "Target" -- The target value of the KPI that we seek to rich for that end of month 
FROM TARGET_RVP LV_T
LEFT JOIN AUA_RVP  
	ON AUA_RVP.V_YEAR = LV_T.V_YEAR 
	AND AUA_RVP.V_MONTH = LV_T.V_MONTH
	AND AUA_RVP.RVPID = LV_T.RVPID
LEFT JOIN SMA_RVP  
	ON SMA_RVP.V_YEAR = LV_T.V_YEAR 
	AND SMA_RVP.V_MONTH = LV_T.V_MONTH
	AND SMA_RVP.RVPID = LV_T.RVPID
LEFT JOIN AUM_RVP  
	ON AUM_RVP.V_YEAR = LV_T.V_YEAR 
	AND AUM_RVP.V_MONTH = LV_T.V_MONTH
	AND AUM_RVP.RVPID = LV_T.RVPID
LEFT JOIN FEE_BASED_MANAGED_RVP  
	ON FEE_BASED_MANAGED_RVP.V_YEAR = LV_T.V_YEAR 
	AND FEE_BASED_MANAGED_RVP.V_MONTH = LV_T.V_MONTH
	AND FEE_BASED_MANAGED_RVP.RVPID = LV_T.RVPID
LEFT JOIN RETAIL_REVENUE_RVP  
	ON RETAIL_REVENUE_RVP.V_YEAR = LV_T.V_YEAR 
	AND RETAIL_REVENUE_RVP.V_MONTH = LV_T.V_MONTH
	AND RETAIL_REVENUE_RVP.RVPID = LV_T.RVPID
LEFT JOIN INSURANCE_REVENUE_RVP  
	ON INSURANCE_REVENUE_RVP.V_YEAR = LV_T.V_YEAR 
	AND INSURANCE_REVENUE_RVP.V_MONTH = LV_T.V_MONTH
	AND INSURANCE_REVENUE_RVP.RVPID = LV_T.RVPID
LEFT JOIN NUMBER_ADVISOR_TEAMS_RVP  
	ON NUMBER_ADVISOR_TEAMS_RVP.V_YEAR = LV_T.V_YEAR 
	AND NUMBER_ADVISOR_TEAMS_RVP.V_MONTH = LV_T.V_MONTH
	AND NUMBER_ADVISOR_TEAMS_RVP.RVPID = LV_T.RVPID
LEFT JOIN ORGANIC_GROWTH_RVP  
	ON ORGANIC_GROWTH_RVP.V_YEAR = LV_T.V_YEAR 
	AND ORGANIC_GROWTH_RVP.V_MONTH = LV_T.V_MONTH
	AND ORGANIC_GROWTH_RVP.RVPID = LV_T.RVPID
LEFT JOIN RECRUIMENT_RVP  
	ON RECRUIMENT_RVP.V_YEAR = LV_T.V_YEAR 
	AND RECRUIMENT_RVP.V_MONTH = LV_T.V_MONTH
	AND RECRUIMENT_RVP.RVPID = LV_T.RVPID
LEFT JOIN DEPARTED_AUA_RVP  
	ON DEPARTED_AUA_RVP.V_YEAR = LV_T.V_YEAR 
	AND DEPARTED_AUA_RVP.V_MONTH = LV_T.V_MONTH
	AND DEPARTED_AUA_RVP.RVPID = LV_T.RVPID;
create or replace view DB_IAW_#env#_DM.STRATEGIC.VW_NUMBER_OF_ACCOUNTS(
	"Balance Date",
	"Account Type",
	"Nb Accounts",
	"Nb Active Accounts",
	"Nb Clients",
	"Nb Active Clients"
) as
WITH DATES AS
(
    SELECT DISTINCT DATE
    FROM SHARED.DIM_DATE 
    WHERE DATE BETWEEN (SELECT MIN(md_start_dt) FROM HOLDINGS.FACT_HOLDINGS) AND (SELECT MAX(md_start_dt) FROM HOLDINGS.FACT_HOLDINGS )
)
,LATEST_VERSION_INVESTMENT_CONTRACT AS 
(
    SELECT 
        D.DATE, 
        LIC.HK_HUB_CONTRACT,
        LIC.HK_HUB_PARTY_ROLE_ACCOUNT_HOLDER,
        SLIC.MD_START_DT,
        COALESCE (SLIC.MD_ACTIVE,'A') AS MD_ACTIVE,
	    COALESCE (ROW_NUMBER() OVER (PARTITION BY D.DATE,LIC.HK_LINK ORDER BY SLIC.MD_START_DT DESC ),1) AS RANK_SLIC
    FROM DATES D
    LEFT JOIN DB_IAW_#env#_DWH.SHARED_BDV.SAT_LINK_INVESTMENT_CONTRACT SLIC 
    ON SLIC.MD_START_DT <= D.DATE
    LEFT JOIN DB_IAW_#env#_DWH.SHARED_BDV.LINK_INVESTMENT_CONTRACT LIC
    ON LIC.HK_LINK = SLIC.HK_LINK
)
SELECT 
    DATEADD(DAY,-1,D.DATE)                                 AS "Balance Date" , 
    ACC.ACCOUNT_TYPE                                       AS "Account Type", 
    COUNT(DISTINCT ACC.CONTRACT_ID) AS "Nb Accounts" ,
    COUNT(DISTINCT ACC_AUA.CONTRACT_ID) AS "Nb Active Accounts" ,
    0 AS "Nb Clients",
    0 AS "Nb Active Clients"
FROM DATES D
LEFT JOIN LATEST_VERSION_INVESTMENT_CONTRACT LVIC
    ON D.DATE = LVIC.DATE
    AND LVIC.RANK_SLIC = 1
    AND LVIC.MD_ACTIVE = 'A' 
LEFT JOIN SHARED.DIM_ACCOUNTS ACC
    ON ACC.HK_HUB = LVIC.HK_HUB_CONTRACT
    AND D.DATE BETWEEN ACC.MD_START_DT AND COALESCE (ACC.MD_END_DT,'9999-12-31')
    AND ACC.HK_HUB <> '0'
LEFT JOIN SHARED.DIM_ACCOUNTS ACC_AUA
    ON ACC_AUA.HK_HUB = LVIC.HK_HUB_CONTRACT
    AND D.DATE BETWEEN ACC_AUA.MD_START_DT AND COALESCE (ACC_AUA.MD_END_DT,'9999-12-31')
    AND ACC_AUA.ACCOUNT_AUA_SEGMENT <> '0'
WHERE ACC.ACCOUNT_IND = 1
GROUP BY 
    "Balance Date", 
    "Account Type"
--
UNION ALL 
--
SELECT 
    DATEADD(DAY,-1,D.DATE)                                 AS "Balance Date" , 
    ''                                                     AS "Account Type", 
    0 AS "Nb Accounts" ,
    0 AS "Nb Active Accounts" ,
    COUNT(DISTINCT DC.CLIENT_ID) AS "Nb Clients",
    COUNT(DISTINCT DC_AUA.CLIENT_ID) AS "Nb Active Clients"
FROM DATES D
LEFT JOIN LATEST_VERSION_INVESTMENT_CONTRACT LVIC
    ON D.DATE = LVIC.DATE
    AND LVIC.RANK_SLIC = 1
    AND LVIC.MD_ACTIVE = 'A' 
LEFT JOIN SHARED.DIM_ACCOUNTS ACC
    ON ACC.HK_HUB = LVIC.HK_HUB_CONTRACT
    AND D.DATE BETWEEN ACC.MD_START_DT AND COALESCE (ACC.MD_END_DT,'9999-12-31')
    AND ACC.HK_HUB <> '0'
LEFT JOIN SHARED.DIM_CLIENTS DC
    ON DC.HK_HUB = LVIC.HK_HUB_PARTY_ROLE_ACCOUNT_HOLDER
    AND D.DATE BETWEEN DC.MD_START_DT AND COALESCE (DC.MD_END_DT,'9999-12-31')
    AND DC.HK_HUB <> '0'
LEFT JOIN SHARED.dim_clients DC_AUA
    ON DC_AUA.HK_HUB = LVIC.HK_HUB_PARTY_ROLE_ACCOUNT_HOLDER
    AND D.DATE BETWEEN DC_AUA.MD_START_DT AND COALESCE (DC_AUA.MD_END_DT,'9999-12-31')
    AND DC_AUA.CLIENT_AUA_SEGMENT <> '0'
WHERE ACC.ACCOUNT_IND = 1
GROUP BY 
    "Balance Date", 
    "Account Type";
create or replace view DB_IAW_#env#_DM.STRATEGIC.VW_NUMBER_OF_ACCOUNTS_BY_RVP(
	"Balance Date",
	"Account Type",
	RVP,
	"Nb Accounts",
	"Nb Active Accounts",
	"Nb Clients",
	"Nb Active Clients"
) as
WITH DATES AS
(
    SELECT DISTINCT DATE
    FROM SHARED.DIM_DATE 
    WHERE DATE BETWEEN (SELECT MIN(md_start_dt) FROM HOLDINGS.FACT_HOLDINGS) AND (SELECT MAX(md_start_dt) FROM HOLDINGS.FACT_HOLDINGS )
)
,LATEST_VERSION_INVESTMENT_CONTRACT AS 
(
    SELECT 
        D.DATE, 
        LIC.HK_HUB_CONTRACT,
        LIC.HK_HUB_PARTY_ROLE_ADVISOR,
        LIC.HK_HUB_PARTY_ROLE_ACCOUNT_HOLDER,
        SLIC.MD_START_DT,
        COALESCE (SLIC.MD_ACTIVE,'A') AS MD_ACTIVE,
	    COALESCE (ROW_NUMBER() OVER (PARTITION BY D.DATE,LIC.HK_LINK ORDER BY SLIC.MD_START_DT DESC ),1) AS RANK_SLIC
    FROM DATES D
    LEFT JOIN DB_IAW_#env#_DWH.SHARED_BDV.SAT_LINK_INVESTMENT_CONTRACT SLIC 
    ON SLIC.MD_START_DT <= D.DATE
    LEFT JOIN DB_IAW_#env#_DWH.SHARED_BDV.LINK_INVESTMENT_CONTRACT LIC
    ON LIC.HK_LINK = SLIC.HK_LINK
)
SELECT 
    DATEADD(DAY,-1,D.DATE)                                 AS "Balance Date" , 
    ACC.ACCOUNT_TYPE                                       AS "Account Type", 
    DA.REGION_VP                                           AS RVP, 
    COUNT(DISTINCT ACC.CONTRACT_ID) AS "Nb Accounts" ,
    COUNT(DISTINCT ACC_AUA.CONTRACT_ID) AS "Nb Active Accounts" ,
    0 AS "Nb Clients",
    0 AS "Nb Active Clients"
FROM DATES D
LEFT JOIN LATEST_VERSION_INVESTMENT_CONTRACT LVIC
    ON D.DATE = LVIC.DATE
    AND LVIC.RANK_SLIC = 1
    AND LVIC.MD_ACTIVE = 'A' 
LEFT JOIN SHARED.DIM_ACCOUNTS ACC
    ON ACC.HK_HUB = LVIC.HK_HUB_CONTRACT
    AND D.DATE BETWEEN ACC.MD_START_DT AND COALESCE (ACC.MD_END_DT,'9999-12-31')
    AND ACC.HK_HUB <> '0'
LEFT JOIN SHARED.DIM_ADVISOR DA
    ON DA.HK_HUB = LVIC.HK_HUB_PARTY_ROLE_ADVISOR
    AND D.DATE BETWEEN DA.MD_START_DT AND COALESCE (DA.MD_END_DT,'9999-12-31')
    AND DA.HK_HUB <> '0'
LEFT JOIN SHARED.DIM_ACCOUNTS ACC_AUA
    ON ACC_AUA.HK_HUB = LVIC.HK_HUB_CONTRACT
    AND D.DATE BETWEEN ACC_AUA.MD_START_DT AND COALESCE (ACC_AUA.MD_END_DT,'9999-12-31')
    AND ACC_AUA.ACCOUNT_AUA_SEGMENT <> '0'
WHERE ACC.ACCOUNT_IND = 1
GROUP BY 
    "Balance Date", 
    "Account Type", 
    RVP
--
UNION ALL 
--
SELECT 
    DATEADD(DAY,-1,D.DATE)                                 AS "Balance Date" , 
    ''                                                     AS "Account Type", 
    DA.REGION_VP                                           AS RVP, 
    0 AS "Nb Accounts" ,
    0 AS "Nb Active Accounts" ,
    COUNT(DISTINCT DC.CLIENT_ID) AS "Nb Clients",
    COUNT(DISTINCT DC_AUA.CLIENT_ID) AS "Nb Active Clients"
FROM DATES D
LEFT JOIN LATEST_VERSION_INVESTMENT_CONTRACT LVIC
    ON D.DATE = LVIC.DATE
    AND LVIC.RANK_SLIC = 1
    AND LVIC.MD_ACTIVE = 'A' 
LEFT JOIN SHARED.DIM_ACCOUNTS ACC
    ON ACC.HK_HUB = LVIC.HK_HUB_CONTRACT
    AND D.DATE BETWEEN ACC.MD_START_DT AND COALESCE (ACC.MD_END_DT,'9999-12-31')
    AND ACC.HK_HUB <> '0'
LEFT JOIN SHARED.DIM_ADVISOR DA
    ON DA.HK_HUB = LVIC.HK_HUB_PARTY_ROLE_ADVISOR
    AND D.DATE BETWEEN DA.MD_START_DT AND COALESCE (DA.MD_END_DT,'9999-12-31')
    AND DA.HK_HUB <> '0'
LEFT JOIN SHARED.DIM_CLIENTS DC
    ON DC.HK_HUB = LVIC.HK_HUB_PARTY_ROLE_ACCOUNT_HOLDER
    AND D.DATE BETWEEN DC.MD_START_DT AND COALESCE (DC.MD_END_DT,'9999-12-31')
    AND DC.HK_HUB <> '0'
LEFT JOIN SHARED.dim_clients DC_AUA
    ON DC_AUA.HK_HUB = LVIC.HK_HUB_PARTY_ROLE_ACCOUNT_HOLDER
    AND D.DATE BETWEEN DC_AUA.MD_START_DT AND COALESCE (DC_AUA.MD_END_DT,'9999-12-31')
    AND DC_AUA.CLIENT_AUA_SEGMENT <> '0'
WHERE ACC.ACCOUNT_IND = 1
GROUP BY 
    "Balance Date", 
    "Account Type", 
    RVP;
CREATE OR REPLACE PROCEDURE DB_IAW_#env#_DM.STRATEGIC.SP_CONV_LOADDM_ACCOUNTS_CLIENTS_SUMMARY_DAILY("ENV" VARCHAR(1000), "DATA_START_DATE" VARCHAR(20), "JOB_AUDIT_ID" VARCHAR(16777216))
RETURNS VARCHAR(16777216)
LANGUAGE SQL
EXECUTE AS OWNER
AS '
DECLARE
DEL_QUERY STRING;
INS_QUERY STRING;
BEGIN
DATA_START_DATE :=CHAR(39)||DATA_START_DATE||CHAR(39);
DEL_QUERY := ''DELETE FROM DB_IAW_''||ENV||''_DM.STRATEGIC.ACCOUNTS_CLIENTS_SUMMARY_DAILY WHERE MD_START_DT = TO_DATE(''||DATA_START_DATE||'',''''YYYY-MM-DD'''')'';
INS_QUERY := ''
INSERT INTO DB_IAW_''||ENV||''_DM.STRATEGIC.ACCOUNTS_CLIENTS_SUMMARY_DAILY(
	MD_START_DT,
	MD_SOURCE,	
	MD_CREATION_DT,
	MD_CREATION_AUDIT_ID,
	MD_SRC_SYSTEM,
	MD_EXTRACT_DT,
	NB_MANAGED,
	NB_FEE_BASED,
	NB_COMMISSION,
	NB_CLIENT,
	NB_ACCOUNT,
	PROCESS_DATE)
	(SELECT
	V.MD_START_DT,
	V.MD_SOURCE,
	CURRENT_DATE,
	''||CHAR(39)||JOB_AUDIT_ID||CHAR(39)||'',
	V.MD_SRC_SYSTEM,
	V.MD_EXTRACT_DT,
	V.NB_MANAGED,
	V.NB_FEE_BASED,
	V.NB_COMMISSION,
	V.NB_CLIENT,
	V.NB_ACCOUNT,
	V.PROCESS_DATE
	FROM DB_IAW_''||ENV||''_STG.IAPW_PORTAL_API.VW_ACCOUNTS_CLIENTS_SUMMARY V)'';

EXECUTE IMMEDIATE :DEL_QUERY;
EXECUTE IMMEDIATE :INS_QUERY;
END
';
CREATE OR REPLACE PROCEDURE DB_IAW_#env#_DM.STRATEGIC.SP_CONV_LOADDM_ACCOUNTS_CLIENTS_SUMMARY_DAILY("ENV" VARCHAR(1000), "DATA_START_DATE" VARCHAR(20), "JOB_NAME" VARCHAR(16777216), "JOB_AUDIT_ID" VARCHAR(16777216), "RUN_ID" VARCHAR(16777216))
RETURNS VARCHAR(16777216)
LANGUAGE SQL
EXECUTE AS OWNER
AS '
DECLARE
DEL_QUERY STRING;
INS_QUERY STRING;
BEGIN
DATA_START_DATE :=CHAR(39)||DATA_START_DATE||CHAR(39);
DEL_QUERY := ''DELETE FROM DB_IAW_''||ENV||''_DM.STRATEGIC.ACCOUNTS_CLIENTS_SUMMARY_DAILY WHERE MD_START_DT = TO_DATE(''||DATA_START_DATE||'',''''YYYY-MM-DD'''')'';
INS_QUERY := ''
INSERT INTO DB_IAW_''||ENV||''_DM.STRATEGIC.ACCOUNTS_CLIENTS_SUMMARY_DAILY(
	MD_START_DT,
	MD_SOURCE,	
	MD_CREATION_DT,
	MD_CREATION_AUDIT_ID,
	MD_SRC_SYSTEM,
	MD_EXTRACT_DT,
	NB_MANAGED,
	NB_FEE_BASED,
	NB_COMMISSION,
	NB_CLIENT,
	NB_ACCOUNT,
	PROCESS_DATE)
	(SELECT
	V.MD_START_DT,
	V.MD_SOURCE,
	CURRENT_DATE,
	CONCAT(''||CHAR(39)||JOB_AUDIT_ID||CHAR(39)||'',''''#'''',''||CHAR(39)||JOB_NAME||CHAR(39)||'',''''-'''',''||CHAR(39)||RUN_ID||CHAR(39)||''),
	V.MD_SRC_SYSTEM,
	V.MD_EXTRACT_DT,
	V.NB_MANAGED,
	V.NB_FEE_BASED,
	V.NB_COMMISSION,
	V.NB_CLIENT,
	V.NB_ACCOUNT,
	V.PROCESS_DATE
	FROM DB_IAW_''||ENV||''_STG.IAPW_PORTAL_API.VW_ACCOUNTS_CLIENTS_SUMMARY V)'';

	
EXECUTE IMMEDIATE :DEL_QUERY;
EXECUTE IMMEDIATE :INS_QUERY;
END
';
CREATE OR REPLACE PROCEDURE DB_IAW_#env#_DM.STRATEGIC.SP_CONV_LOADDM_ACCOUNTS_CLIENTS_SUMMARY_RVP_DAILY("ENV" VARCHAR(1000), "DATA_START_DATE" VARCHAR(20), "JOB_AUDIT_ID" VARCHAR(16777216))
RETURNS VARCHAR(16777216)
LANGUAGE SQL
EXECUTE AS OWNER
AS '
DECLARE
DEL_QUERY STRING;
INS_QUERY STRING;
BEGIN
DATA_START_DATE :=CHAR(39)||DATA_START_DATE||CHAR(39);
DEL_QUERY := ''DELETE FROM DB_IAW_''||ENV||''_DM.STRATEGIC.ACCOUNTS_CLIENTS_SUMMARY_RVP_DAILY WHERE MD_START_DT = TO_DATE(''||DATA_START_DATE||'',''''YYYY-MM-DD'''')'';
INS_QUERY := ''
INSERT INTO DB_IAW_''||ENV||''_DM.STRATEGIC.ACCOUNTS_CLIENTS_SUMMARY_RVP_DAILY(
	MD_START_DT,
	MD_SOURCE,
	MD_CREATION_DT,
	MD_CREATION_AUDIT_ID,
	MD_SRC_SYSTEM,
	MD_EXTRACT_DT,
	RVPID,
	NB_MANAGED,
	NB_FEE_BASED,
	NB_COMMISSION,
	NB_CLIENT,
	NB_ACCOUNT,
	PROCESS_DATE)
	(SELECT
	V.MD_START_DT,
	V.MD_SOURCE,
	CURRENT_DATE,
	''||CHAR(39)||JOB_AUDIT_ID||CHAR(39)||'',
	V.MD_SRC_SYSTEM,
	V.MD_EXTRACT_DT,
	V.RVPID,
	V.NB_MANAGED,
	V.NB_FEE_BASED,
	V.NB_COMMISSION,
	V.NB_CLIENT,
	V.NB_ACCOUNT,
	V.PROCESS_DATE
	FROM DB_IAW_''||ENV||''_STG.IAPW_PORTAL_API.VW_ACCOUNTS_CLIENTS_SUMMARY_RVP V)'';
EXECUTE IMMEDIATE :DEL_QUERY;
EXECUTE IMMEDIATE :INS_QUERY;
END
';
CREATE OR REPLACE PROCEDURE DB_IAW_#env#_DM.STRATEGIC.SP_CONV_LOADDM_ACCOUNTS_CLIENTS_SUMMARY_RVP_DAILY("ENV" VARCHAR(1000), "DATA_START_DATE" VARCHAR(20), "JOB_NAME" VARCHAR(16777216), "JOB_AUDIT_ID" VARCHAR(16777216), "RUN_ID" VARCHAR(16777216))
RETURNS VARCHAR(16777216)
LANGUAGE SQL
EXECUTE AS OWNER
AS '
DECLARE
DEL_QUERY STRING;
INS_QUERY STRING;
BEGIN
DATA_START_DATE :=CHAR(39)||DATA_START_DATE||CHAR(39);
DEL_QUERY := ''DELETE FROM DB_IAW_''||ENV||''_DM.STRATEGIC.ACCOUNTS_CLIENTS_SUMMARY_RVP_DAILY WHERE MD_START_DT = TO_DATE(''||DATA_START_DATE||'',''''YYYY-MM-DD'''')'';
INS_QUERY := ''
INSERT INTO DB_IAW_''||ENV||''_DM.STRATEGIC.ACCOUNTS_CLIENTS_SUMMARY_RVP_DAILY(
	MD_START_DT,
	MD_SOURCE,
	MD_CREATION_DT,
	MD_CREATION_AUDIT_ID,
	MD_SRC_SYSTEM,
	MD_EXTRACT_DT,
	RVPID,
	NB_MANAGED,
	NB_FEE_BASED,
	NB_COMMISSION,
	NB_CLIENT,
	NB_ACCOUNT,
	PROCESS_DATE)
	(SELECT
	V.MD_START_DT,
	V.MD_SOURCE,
	CURRENT_DATE,
	CONCAT(''||CHAR(39)||JOB_AUDIT_ID||CHAR(39)||'',''''#'''',''||CHAR(39)||JOB_NAME||CHAR(39)||'',''''-'''',''||CHAR(39)||RUN_ID||CHAR(39)||''),
	V.MD_SRC_SYSTEM,
	V.MD_EXTRACT_DT,
	V.RVPID,
	V.NB_MANAGED,
	V.NB_FEE_BASED,
	V.NB_COMMISSION,
	V.NB_CLIENT,
	V.NB_ACCOUNT,
	V.PROCESS_DATE
	FROM DB_IAW_''||ENV||''_STG.IAPW_PORTAL_API.VW_ACCOUNTS_CLIENTS_SUMMARY_RVP V)'';
EXECUTE IMMEDIATE :DEL_QUERY;
EXECUTE IMMEDIATE :INS_QUERY;
END
';
CREATE OR REPLACE PROCEDURE DB_IAW_#env#_DM.STRATEGIC.SP_CONV_LOADDM_ASSEST_SUMMARY_BYACCOUNTTYPE_DAILY("ENV" VARCHAR(1000), "DATA_START_DATE" VARCHAR(20), "JOB_AUDIT_ID" VARCHAR(16777216))
RETURNS VARCHAR(16777216)
LANGUAGE SQL
EXECUTE AS OWNER
AS '
DECLARE
DEL_QUERY STRING;
INS_QUERY STRING;
BEGIN
DATA_START_DATE :=CHAR(39)||DATA_START_DATE||CHAR(39);
DEL_QUERY := ''DELETE FROM DB_IAW_''||ENV||''_DM.STRATEGIC.ASSETS_SUMMARY_BYACCOUNTTYPE_DAILY WHERE MD_START_DT = TO_DATE(''||DATA_START_DATE||'',''''YYYY-MM-DD'''')'';
INS_QUERY := ''
INSERT INTO DB_IAW_''||ENV||''_DM.STRATEGIC.ASSETS_SUMMARY_BYACCOUNTTYPE_DAILY(
	MD_START_DT,
	MD_SOURCE,
	MD_CREATION_DT,
	MD_CREATION_AUDIT_ID,
	MD_SRC_SYSTEM,
	MD_EXTRACT_DT,
	VALUE,
	ACCOUNT_TYPE)
	(SELECT
	V.MD_START_DT,
	V.MD_SOURCE,
	CURRENT_DATE,
	''||CHAR(39)||JOB_AUDIT_ID||CHAR(39)||'',
	V.MD_SRC_SYSTEM,
	V.MD_EXTRACT_DT,
	V.VALUE,
	V.ACCOUNT_TYPE
	FROM DB_IAW_''||ENV||''_STG.IAPW_PORTAL_API.VW_ASSETS_SUMMARY_BYACCOUNTTYPE V)'';

	
EXECUTE IMMEDIATE :DEL_QUERY;
EXECUTE IMMEDIATE :INS_QUERY;
END
';
CREATE OR REPLACE PROCEDURE DB_IAW_#env#_DM.STRATEGIC.SP_CONV_LOADDM_ASSEST_SUMMARY_BYACCOUNTTYPE_DAILY("ENV" VARCHAR(1000), "DATA_START_DATE" VARCHAR(20), "JOB_NAME" VARCHAR(16777216), "JOB_AUDIT_ID" VARCHAR(16777216), "RUN_ID" VARCHAR(16777216))
RETURNS VARCHAR(16777216)
LANGUAGE SQL
EXECUTE AS OWNER
AS '
DECLARE
DEL_QUERY STRING;
INS_QUERY STRING;
BEGIN
DATA_START_DATE :=CHAR(39)||DATA_START_DATE||CHAR(39);
DEL_QUERY := ''DELETE FROM DB_IAW_''||ENV||''_DM.STRATEGIC.ASSETS_SUMMARY_BYACCOUNTTYPE_DAILY WHERE MD_START_DT = TO_DATE(''||DATA_START_DATE||'',''''YYYY-MM-DD'''')'';
INS_QUERY := ''
INSERT INTO DB_IAW_''||ENV||''_DM.STRATEGIC.ASSETS_SUMMARY_BYACCOUNTTYPE_DAILY(
	MD_START_DT,
	MD_SOURCE,
	MD_CREATION_DT,
	MD_CREATION_AUDIT_ID,
	MD_SRC_SYSTEM,
	MD_EXTRACT_DT,
	VALUE,
	ACCOUNT_TYPE)
	(SELECT
	V.MD_START_DT,
	V.MD_SOURCE,
	CURRENT_DATE,
	CONCAT(''||CHAR(39)||JOB_AUDIT_ID||CHAR(39)||'',''''#'''',''||CHAR(39)||JOB_NAME||CHAR(39)||'',''''-'''',''||CHAR(39)||RUN_ID||CHAR(39)||''),
	V.MD_SRC_SYSTEM,
	V.MD_EXTRACT_DT,
	V.VALUE,
	V.ACCOUNT_TYPE
	FROM DB_IAW_''||ENV||''_STG.IAPW_PORTAL_API.VW_ASSETS_SUMMARY_BYACCOUNTTYPE V)'';

	
EXECUTE IMMEDIATE :DEL_QUERY;
EXECUTE IMMEDIATE :INS_QUERY;
END
';
CREATE OR REPLACE PROCEDURE DB_IAW_#env#_DM.STRATEGIC.SP_CONV_LOADDM_ASSEST_SUMMARY_BYACCOUNTTYPE_RVP_DAILY("ENV" VARCHAR(1000), "DATA_START_DATE" VARCHAR(20), "JOB_AUDIT_ID" VARCHAR(16777216))
RETURNS VARCHAR(16777216)
LANGUAGE SQL
EXECUTE AS OWNER
AS '
DECLARE
DEL_QUERY STRING;
INS_QUERY STRING;
BEGIN
DATA_START_DATE :=CHAR(39)||DATA_START_DATE||CHAR(39);
DEL_QUERY := ''DELETE FROM DB_IAW_''||ENV||''_DM.STRATEGIC.ASSETS_SUMMARY_BYACCOUNTTYPE_RVP_DAILY WHERE MD_START_DT = TO_DATE(''||DATA_START_DATE||'',''''YYYY-MM-DD'''')'';
INS_QUERY := ''
INSERT INTO DB_IAW_''||ENV||''_DM.STRATEGIC.ASSETS_SUMMARY_BYACCOUNTTYPE_RVP_DAILY(
	MD_START_DT,
	MD_SOURCE,
	MD_CREATION_DT,
	MD_CREATION_AUDIT_ID,
	MD_SRC_SYSTEM,
	MD_EXTRACT_DT,
	RVPID,
	VALUE,
	ACCOUNT_TYPE)
	(SELECT
	V.MD_START_DT,
	V.MD_SOURCE,
	CURRENT_DATE,
	''||CHAR(39)||JOB_AUDIT_ID||CHAR(39)||'',
	V.MD_SRC_SYSTEM,
	V.MD_EXTRACT_DT,
	V.RVPID,
	V.VALUE,
	V.ACCOUNT_TYPE
	FROM DB_IAW_''||ENV||''_STG.IAPW_PORTAL_API.VW_ASSETS_SUMMARY_BYACCOUNTTYPE_RVP V)'';
EXECUTE IMMEDIATE :DEL_QUERY;
EXECUTE IMMEDIATE :INS_QUERY;
END
';
CREATE OR REPLACE PROCEDURE DB_IAW_#env#_DM.STRATEGIC.SP_CONV_LOADDM_ASSEST_SUMMARY_BYACCOUNTTYPE_RVP_DAILY("ENV" VARCHAR(1000), "DATA_START_DATE" VARCHAR(20), "JOB_NAME" VARCHAR(16777216), "JOB_AUDIT_ID" VARCHAR(16777216), "RUN_ID" VARCHAR(16777216))
RETURNS VARCHAR(16777216)
LANGUAGE SQL
EXECUTE AS OWNER
AS '
DECLARE
DEL_QUERY STRING;
INS_QUERY STRING;
BEGIN
DATA_START_DATE :=CHAR(39)||DATA_START_DATE||CHAR(39);
DEL_QUERY := ''DELETE FROM DB_IAW_''||ENV||''_DM.STRATEGIC.ASSETS_SUMMARY_BYACCOUNTTYPE_RVP_DAILY WHERE MD_START_DT = TO_DATE(''||DATA_START_DATE||'',''''YYYY-MM-DD'''')'';
INS_QUERY := ''
INSERT INTO DB_IAW_''||ENV||''_DM.STRATEGIC.ASSETS_SUMMARY_BYACCOUNTTYPE_RVP_DAILY(
	MD_START_DT,
	MD_SOURCE,
	MD_CREATION_DT,
	MD_CREATION_AUDIT_ID,
	MD_SRC_SYSTEM,
	MD_EXTRACT_DT,
	RVPID,
	VALUE,
	ACCOUNT_TYPE)
	(SELECT
	V.MD_START_DT,
	V.MD_SOURCE,
	CURRENT_DATE,
	CONCAT(''||CHAR(39)||JOB_AUDIT_ID||CHAR(39)||'',''''#'''',''||CHAR(39)||JOB_NAME||CHAR(39)||'',''''-'''',''||CHAR(39)||RUN_ID||CHAR(39)||''),
	V.MD_SRC_SYSTEM,
	V.MD_EXTRACT_DT,
	V.RVPID,
	V.VALUE,
	V.ACCOUNT_TYPE
	FROM DB_IAW_''||ENV||''_STG.IAPW_PORTAL_API.VW_ASSETS_SUMMARY_BYACCOUNTTYPE_RVP V)'';
EXECUTE IMMEDIATE :DEL_QUERY;
EXECUTE IMMEDIATE :INS_QUERY;
END
';
CREATE OR REPLACE PROCEDURE DB_IAW_#env#_DM.STRATEGIC.SP_CONV_LOADDM_ASSEST_SUMMARY_BYCOMMISSIONTYPE_AND_PRODUCT_DAILY("ENV" VARCHAR(1000), "DATA_START_DATE" VARCHAR(20), "JOB_AUDIT_ID" VARCHAR(16777216))
RETURNS VARCHAR(16777216)
LANGUAGE SQL
EXECUTE AS OWNER
AS '
DECLARE
DEL_QUERY STRING;
INS_QUERY STRING;
BEGIN
DATA_START_DATE :=CHAR(39)||DATA_START_DATE||CHAR(39);
DEL_QUERY := ''DELETE FROM DB_IAW_''||ENV||''_DM.STRATEGIC.ASSETS_SUMMARY_BYCOMMISSIONTYPE_AND_PRODUCT_DAILY WHERE MD_START_DT = TO_DATE(''||DATA_START_DATE||'',''''YYYY-MM-DD'''')'';
INS_QUERY := ''
INSERT INTO DB_IAW_''||ENV||''_DM.STRATEGIC.ASSETS_SUMMARY_BYCOMMISSIONTYPE_AND_PRODUCT_DAILY(
	MD_START_DT,
	MD_SOURCE,
	MD_CREATION_DT,
	MD_CREATION_AUDIT_ID,
	MD_SRC_SYSTEM,
	MD_EXTRACT_DT,
	PROCESS_DATE,
	COMMISSION_TYPE,
	EQT,
	MUT,
	FIX,
	OFF,
	CASH,
	TOTAL)
	(SELECT
	V.MD_START_DT,
	V.MD_SOURCE,
	CURRENT_DATE,
	''||CHAR(39)||JOB_AUDIT_ID||CHAR(39)||'',
	V.MD_SRC_SYSTEM,
	V.MD_EXTRACT_DT,
	V.PROCESS_DATE,
	V.COMMISSION_TYPE,
	V.EQT,
	V.MUT,
	V.FIX,
	V.OFF,
	V.CASH,
	V.TOTAL
	FROM DB_IAW_''||ENV||''_STG.IAPW_PORTAL_API.VW_ASSETS_SUMMARY_BYCOMMISSIONTYPE_AND_PRODUCT V)'';

EXECUTE IMMEDIATE :DEL_QUERY;
EXECUTE IMMEDIATE :INS_QUERY;
END
';
CREATE OR REPLACE PROCEDURE DB_IAW_#env#_DM.STRATEGIC.SP_CONV_LOADDM_ASSEST_SUMMARY_BYCOMMISSIONTYPE_AND_PRODUCT_DAILY("ENV" VARCHAR(1000), "DATA_START_DATE" VARCHAR(20), "JOB_NAME" VARCHAR(16777216), "JOB_AUDIT_ID" VARCHAR(16777216), "RUN_ID" VARCHAR(16777216))
RETURNS VARCHAR(16777216)
LANGUAGE SQL
EXECUTE AS OWNER
AS '
DECLARE
DEL_QUERY STRING;
INS_QUERY STRING;
BEGIN
DATA_START_DATE :=CHAR(39)||DATA_START_DATE||CHAR(39);
DEL_QUERY := ''DELETE FROM DB_IAW_''||ENV||''_DM.STRATEGIC.ASSETS_SUMMARY_BYCOMMISSIONTYPE_AND_PRODUCT_DAILY WHERE MD_START_DT = TO_DATE(''||DATA_START_DATE||'',''''YYYY-MM-DD'''')'';
INS_QUERY := ''
INSERT INTO DB_IAW_''||ENV||''_DM.STRATEGIC.ASSETS_SUMMARY_BYCOMMISSIONTYPE_AND_PRODUCT_DAILY(
	MD_START_DT,
	MD_SOURCE,
	MD_CREATION_DT,
	MD_CREATION_AUDIT_ID,
	MD_SRC_SYSTEM,
	MD_EXTRACT_DT,
	PROCESS_DATE,
	COMMISSION_TYPE,
	EQT,
	MUT,
	FIX,
	OFF,
	CASH,
	TOTAL)
	(SELECT
	V.MD_START_DT,
	V.MD_SOURCE,
	CURRENT_DATE,
	CONCAT(''||CHAR(39)||JOB_AUDIT_ID||CHAR(39)||'',''''#'''',''||CHAR(39)||JOB_NAME||CHAR(39)||'',''''-'''',''||CHAR(39)||RUN_ID||CHAR(39)||''),
	V.MD_SRC_SYSTEM,
	V.MD_EXTRACT_DT,
	V.PROCESS_DATE,
	V.COMMISSION_TYPE,
	V.EQT,
	V.MUT,
	V.FIX,
	V.OFF,
	V.CASH,
	V.TOTAL
	FROM DB_IAW_''||ENV||''_STG.IAPW_PORTAL_API.VW_ASSETS_SUMMARY_BYCOMMISSIONTYPE_AND_PRODUCT V)'';

	
EXECUTE IMMEDIATE :DEL_QUERY;
EXECUTE IMMEDIATE :INS_QUERY;
END
';
CREATE OR REPLACE PROCEDURE DB_IAW_#env#_DM.STRATEGIC.SP_CONV_LOADDM_ASSEST_SUMMARY_BYCOMMISSIONTYPE_AND_PRODUCT_RVP_DAILY("ENV" VARCHAR(1000), "DATA_START_DATE" VARCHAR(20), "JOB_AUDIT_ID" VARCHAR(16777216))
RETURNS VARCHAR(16777216)
LANGUAGE SQL
EXECUTE AS OWNER
AS '
DECLARE
DEL_QUERY STRING;
INS_QUERY STRING;
BEGIN
DATA_START_DATE :=CHAR(39)||DATA_START_DATE||CHAR(39);
DEL_QUERY := ''DELETE FROM DB_IAW_''||ENV||''_DM.STRATEGIC.ASSETS_SUMMARY_BYCOMMISSIONTYPE_AND_PRODUCT_RVP_DAILY WHERE MD_START_DT = TO_DATE(''||DATA_START_DATE||'',''''YYYY-MM-DD'''')'';
INS_QUERY := ''
INSERT INTO DB_IAW_''||ENV||''_DM.STRATEGIC.ASSETS_SUMMARY_BYCOMMISSIONTYPE_AND_PRODUCT_RVP_DAILY(
	MD_START_DT,
	MD_SOURCE,
	MD_CREATION_DT,
	MD_CREATION_AUDIT_ID,
	MD_SRC_SYSTEM,
	MD_EXTRACT_DT,
	RVPID,
	PROCESS_DATE,
	COMMISSION_TYPE,
	EQT,
	MUT,
	FIX,
	OFF,
	CASH,
	TOTAL)
	(SELECT
	V.MD_START_DT,
	V.MD_SOURCE,
	CURRENT_DATE,
	''||CHAR(39)||JOB_AUDIT_ID||CHAR(39)||'',
	V.MD_SRC_SYSTEM,
	V.MD_EXTRACT_DT,
	V.RVPID,
	V.PROCESS_DATE,
	V.COMMISSION_TYPE,
	V.EQT,
	V.MUT,
	V.FIX,
	V.OFF,
	V.CASH,
	V.TOTAL
	FROM DB_IAW_''||ENV||''_STG.IAPW_PORTAL_API.VW_ASSETS_SUMMARY_BYCOMMISSIONTYPE_AND_PRODUCT_RVP V)'';
EXECUTE IMMEDIATE :DEL_QUERY;
EXECUTE IMMEDIATE :INS_QUERY;
END
';
CREATE OR REPLACE PROCEDURE DB_IAW_#env#_DM.STRATEGIC.SP_CONV_LOADDM_ASSEST_SUMMARY_BYCOMMISSIONTYPE_AND_PRODUCT_RVP_DAILY("ENV" VARCHAR(1000), "DATA_START_DATE" VARCHAR(20), "JOB_NAME" VARCHAR(16777216), "JOB_AUDIT_ID" VARCHAR(16777216), "RUN_ID" VARCHAR(16777216))
RETURNS VARCHAR(16777216)
LANGUAGE SQL
EXECUTE AS OWNER
AS '
DECLARE
DEL_QUERY STRING;
INS_QUERY STRING;
BEGIN
DATA_START_DATE :=CHAR(39)||DATA_START_DATE||CHAR(39);
DEL_QUERY := ''DELETE FROM DB_IAW_''||ENV||''_DM.STRATEGIC.ASSETS_SUMMARY_BYCOMMISSIONTYPE_AND_PRODUCT_RVP_DAILY WHERE MD_START_DT = TO_DATE(''||DATA_START_DATE||'',''''YYYY-MM-DD'''')'';
INS_QUERY := ''
INSERT INTO DB_IAW_''||ENV||''_DM.STRATEGIC.ASSETS_SUMMARY_BYCOMMISSIONTYPE_AND_PRODUCT_RVP_DAILY(
	MD_START_DT,
	MD_SOURCE,
	MD_CREATION_DT,
	MD_CREATION_AUDIT_ID,
	MD_SRC_SYSTEM,
	MD_EXTRACT_DT,
	RVPID,
	PROCESS_DATE,
	COMMISSION_TYPE,
	EQT,
	MUT,
	FIX,
	OFF,
	CASH,
	TOTAL)
	(SELECT
	V.MD_START_DT,
	V.MD_SOURCE,
	CURRENT_DATE,
	CONCAT(''||CHAR(39)||JOB_AUDIT_ID||CHAR(39)||'',''''#'''',''||CHAR(39)||JOB_NAME||CHAR(39)||'',''''-'''',''||CHAR(39)||RUN_ID||CHAR(39)||''),
	V.MD_SRC_SYSTEM,
	V.MD_EXTRACT_DT,
	V.RVPID,
	V.PROCESS_DATE,
	V.COMMISSION_TYPE,
	V.EQT,
	V.MUT,
	V.FIX,
	V.OFF,
	V.CASH,
	V.TOTAL
	FROM DB_IAW_''||ENV||''_STG.IAPW_PORTAL_API.VW_ASSETS_SUMMARY_BYCOMMISSIONTYPE_AND_PRODUCT_RVP V)'';
EXECUTE IMMEDIATE :DEL_QUERY;
EXECUTE IMMEDIATE :INS_QUERY;
END
';
CREATE OR REPLACE PROCEDURE DB_IAW_#env#_DM.STRATEGIC.SP_CONV_LOADDM_ASSEST_SUMMARY_BYCOMMISSIONTYPE_DAILY("ENV" VARCHAR(1000), "DATA_START_DATE" VARCHAR(20), "JOB_AUDIT_ID" VARCHAR(16777216))
RETURNS VARCHAR(16777216)
LANGUAGE SQL
EXECUTE AS OWNER
AS '
DECLARE
DEL_QUERY STRING;
INS_QUERY STRING;
BEGIN
DATA_START_DATE :=CHAR(39)||DATA_START_DATE||CHAR(39);
DEL_QUERY := ''DELETE FROM DB_IAW_''||ENV||''_DM.STRATEGIC.ASSETS_SUMMARY_BYCOMMISSIONTYPE_DAILY WHERE MD_START_DT = TO_DATE(''||DATA_START_DATE||'',''''YYYY-MM-DD'''')'';
INS_QUERY := ''
INSERT INTO DB_IAW_''||ENV||''_DM.STRATEGIC.ASSETS_SUMMARY_BYCOMMISSIONTYPE_DAILY(
	MD_START_DT,
	MD_SOURCE,
	MD_CREATION_DT,
	MD_CREATION_AUDIT_ID,
	MD_SRC_SYSTEM,
	MD_EXTRACT_DT,
	PROCESS_DATE,
	VALUE,
	COMMISSION_TYPE)
	(SELECT
	V.MD_START_DT,
	V.MD_SOURCE,
	CURRENT_DATE,
	''||CHAR(39)||JOB_AUDIT_ID||CHAR(39)||'',
	V.MD_SRC_SYSTEM,
	V.MD_EXTRACT_DT,
	V.PROCESS_DATE,
	V.VALUE,
	V.COMMISSION_TYPE
	FROM DB_IAW_''||ENV||''_STG.IAPW_PORTAL_API.VW_ASSETS_SUMMARY_BYCOMMISSIONTYPE V)'';

EXECUTE IMMEDIATE :DEL_QUERY;
EXECUTE IMMEDIATE :INS_QUERY;
END
';
CREATE OR REPLACE PROCEDURE DB_IAW_#env#_DM.STRATEGIC.SP_CONV_LOADDM_ASSEST_SUMMARY_BYCOMMISSIONTYPE_DAILY("ENV" VARCHAR(1000), "DATA_START_DATE" VARCHAR(20), "JOB_NAME" VARCHAR(16777216), "JOB_AUDIT_ID" VARCHAR(16777216), "RUN_ID" VARCHAR(16777216))
RETURNS VARCHAR(16777216)
LANGUAGE SQL
EXECUTE AS OWNER
AS '
DECLARE
DEL_QUERY STRING;
INS_QUERY STRING;
BEGIN
DATA_START_DATE :=CHAR(39)||DATA_START_DATE||CHAR(39);
DEL_QUERY := ''DELETE FROM DB_IAW_''||ENV||''_DM.STRATEGIC.ASSETS_SUMMARY_BYCOMMISSIONTYPE_DAILY WHERE MD_START_DT = TO_DATE(''||DATA_START_DATE||'',''''YYYY-MM-DD'''')'';
INS_QUERY := ''
INSERT INTO DB_IAW_''||ENV||''_DM.STRATEGIC.ASSETS_SUMMARY_BYCOMMISSIONTYPE_DAILY(
	MD_START_DT,
	MD_SOURCE,
	MD_CREATION_DT,
	MD_CREATION_AUDIT_ID,
	MD_SRC_SYSTEM,
	MD_EXTRACT_DT,
	PROCESS_DATE,
	VALUE,
	COMMISSION_TYPE)
	(SELECT
	V.MD_START_DT,
	V.MD_SOURCE,
	CURRENT_DATE,
	CONCAT(''||CHAR(39)||JOB_AUDIT_ID||CHAR(39)||'',''''#'''',''||CHAR(39)||JOB_NAME||CHAR(39)||'',''''-'''',''||CHAR(39)||RUN_ID||CHAR(39)||''),
	V.MD_SRC_SYSTEM,
	V.MD_EXTRACT_DT,
	V.PROCESS_DATE,
	V.VALUE,
	V.COMMISSION_TYPE
	FROM DB_IAW_''||ENV||''_STG.IAPW_PORTAL_API.VW_ASSETS_SUMMARY_BYCOMMISSIONTYPE V)'';

	
EXECUTE IMMEDIATE :DEL_QUERY;
EXECUTE IMMEDIATE :INS_QUERY;
END
';
CREATE OR REPLACE PROCEDURE DB_IAW_#env#_DM.STRATEGIC.SP_CONV_LOADDM_ASSEST_SUMMARY_BYCOMMISSIONTYPE_RVP_DAILY("ENV" VARCHAR(1000), "DATA_START_DATE" VARCHAR(20), "JOB_AUDIT_ID" VARCHAR(16777216))
RETURNS VARCHAR(16777216)
LANGUAGE SQL
EXECUTE AS OWNER
AS '
DECLARE
DEL_QUERY STRING;
INS_QUERY STRING;
BEGIN
DATA_START_DATE :=CHAR(39)||DATA_START_DATE||CHAR(39);
DEL_QUERY := ''DELETE FROM DB_IAW_''||ENV||''_DM.STRATEGIC.ASSETS_SUMMARY_BYCOMMISSIONTYPE_RVP_DAILY WHERE MD_START_DT = TO_DATE(''||DATA_START_DATE||'',''''YYYY-MM-DD'''')'';
INS_QUERY := ''
INSERT INTO DB_IAW_''||ENV||''_DM.STRATEGIC.ASSETS_SUMMARY_BYCOMMISSIONTYPE_RVP_DAILY(
	MD_START_DT,
	MD_SOURCE,
	MD_CREATION_DT,
	MD_CREATION_AUDIT_ID,
	MD_SRC_SYSTEM,
	MD_EXTRACT_DT,
	RVPID,
	PROCESS_DATE,
	VALUE,
	COMMISSION_TYPE)
	(SELECT
	V.MD_START_DT,
	V.MD_SOURCE,
	CURRENT_DATE,
	''||CHAR(39)||JOB_AUDIT_ID||CHAR(39)||'',
	V.MD_SRC_SYSTEM,
	V.MD_EXTRACT_DT,
	V.RVPID,
	V.PROCESS_DATE,
	V.VALUE,
	V.COMMISSION_TYPE
	FROM DB_IAW_''||ENV||''_STG.IAPW_PORTAL_API.VW_ASSETS_SUMMARY_BYCOMMISSIONTYPE_RVP V)'';
EXECUTE IMMEDIATE :DEL_QUERY;
EXECUTE IMMEDIATE :INS_QUERY;
END
';
CREATE OR REPLACE PROCEDURE DB_IAW_#env#_DM.STRATEGIC.SP_CONV_LOADDM_ASSEST_SUMMARY_BYCOMMISSIONTYPE_RVP_DAILY("ENV" VARCHAR(1000), "DATA_START_DATE" VARCHAR(20), "JOB_NAME" VARCHAR(16777216), "JOB_AUDIT_ID" VARCHAR(16777216), "RUN_ID" VARCHAR(16777216))
RETURNS VARCHAR(16777216)
LANGUAGE SQL
EXECUTE AS OWNER
AS '
DECLARE
DEL_QUERY STRING;
INS_QUERY STRING;
BEGIN
DATA_START_DATE :=CHAR(39)||DATA_START_DATE||CHAR(39);
DEL_QUERY := ''DELETE FROM DB_IAW_''||ENV||''_DM.STRATEGIC.ASSETS_SUMMARY_BYCOMMISSIONTYPE_RVP_DAILY WHERE MD_START_DT = TO_DATE(''||DATA_START_DATE||'',''''YYYY-MM-DD'''')'';
INS_QUERY := ''
INSERT INTO DB_IAW_''||ENV||''_DM.STRATEGIC.ASSETS_SUMMARY_BYCOMMISSIONTYPE_RVP_DAILY(
	MD_START_DT,
	MD_SOURCE,
	MD_CREATION_DT,
	MD_CREATION_AUDIT_ID,
	MD_SRC_SYSTEM,
	MD_EXTRACT_DT,
	RVPID,
	PROCESS_DATE,
	VALUE,
	COMMISSION_TYPE)
	(SELECT
	V.MD_START_DT,
	V.MD_SOURCE,
	CURRENT_DATE,
	CONCAT(''||CHAR(39)||JOB_AUDIT_ID||CHAR(39)||'',''''#'''',''||CHAR(39)||JOB_NAME||CHAR(39)||'',''''-'''',''||CHAR(39)||RUN_ID||CHAR(39)||''),
	V.MD_SRC_SYSTEM,
	V.MD_EXTRACT_DT,
	V.RVPID,
	V.PROCESS_DATE,
	V.VALUE,
	V.COMMISSION_TYPE
	FROM DB_IAW_''||ENV||''_STG.IAPW_PORTAL_API.VW_ASSETS_SUMMARY_BYCOMMISSIONTYPE_RVP V)'';
EXECUTE IMMEDIATE :DEL_QUERY;
EXECUTE IMMEDIATE :INS_QUERY;
END
';
CREATE OR REPLACE PROCEDURE DB_IAW_#env#_DM.STRATEGIC.SP_CONV_LOADDM_ASSEST_SUMMARY_BYPRODUCT_DAILY("ENV" VARCHAR(1000), "DATA_START_DATE" VARCHAR(20), "JOB_AUDIT_ID" VARCHAR(16777216))
RETURNS VARCHAR(16777216)
LANGUAGE SQL
EXECUTE AS OWNER
AS '
DECLARE
DEL_QUERY STRING;
INS_QUERY STRING;
BEGIN
DATA_START_DATE :=CHAR(39)||DATA_START_DATE||CHAR(39);
DEL_QUERY := ''DELETE FROM DB_IAW_''||ENV||''_DM.STRATEGIC.ASSETS_SUMMARY_BYPRODUCT_DAILY WHERE MD_START_DT = TO_DATE(''||DATA_START_DATE||'',''''YYYY-MM-DD'''')'';
INS_QUERY := ''
INSERT INTO DB_IAW_''||ENV||''_DM.STRATEGIC.ASSETS_SUMMARY_BYPRODUCT_DAILY(
	MD_START_DT,
	MD_SOURCE,
	MD_CREATION_DT,
	MD_CREATION_AUDIT_ID,
	MD_SRC_SYSTEM,
	MD_EXTRACT_DT,
	PROCESS_DATE,
	VALUE,
	PRODUCT_CODE)
	(SELECT
	V.MD_START_DT,
	V.MD_SOURCE,
	CURRENT_DATE,
	''||CHAR(39)||JOB_AUDIT_ID||CHAR(39)||'',
	V.MD_SRC_SYSTEM,
	V.MD_EXTRACT_DT,
	V.PROCESS_DATE,
	V.VALUE,
	V.PRODUCT_CODE
	FROM DB_IAW_''||ENV||''_STG.IAPW_PORTAL_API.VW_ASSETS_SUMMARY_BYPRODUCT V)'';

EXECUTE IMMEDIATE :DEL_QUERY;
EXECUTE IMMEDIATE :INS_QUERY;
END
';
CREATE OR REPLACE PROCEDURE DB_IAW_#env#_DM.STRATEGIC.SP_CONV_LOADDM_ASSEST_SUMMARY_BYPRODUCT_DAILY("ENV" VARCHAR(1000), "DATA_START_DATE" VARCHAR(20), "JOB_NAME" VARCHAR(16777216), "JOB_AUDIT_ID" VARCHAR(16777216), "RUN_ID" VARCHAR(16777216))
RETURNS VARCHAR(16777216)
LANGUAGE SQL
EXECUTE AS OWNER
AS '
DECLARE
DEL_QUERY STRING;
INS_QUERY STRING;
BEGIN
DATA_START_DATE :=CHAR(39)||DATA_START_DATE||CHAR(39);
DEL_QUERY := ''DELETE FROM DB_IAW_''||ENV||''_DM.STRATEGIC.ASSETS_SUMMARY_BYPRODUCT_DAILY WHERE MD_START_DT = TO_DATE(''||DATA_START_DATE||'',''''YYYY-MM-DD'''')'';
INS_QUERY := ''
INSERT INTO DB_IAW_''||ENV||''_DM.STRATEGIC.ASSETS_SUMMARY_BYPRODUCT_DAILY(
	MD_START_DT,
	MD_SOURCE,
	MD_CREATION_DT,
	MD_CREATION_AUDIT_ID,
	MD_SRC_SYSTEM,
	MD_EXTRACT_DT,
	PROCESS_DATE,
	VALUE,
	PRODUCT_CODE)
	(SELECT
	V.MD_START_DT,
	V.MD_SOURCE,
	CURRENT_DATE,
	CONCAT(''||CHAR(39)||JOB_AUDIT_ID||CHAR(39)||'',''''#'''',''||CHAR(39)||JOB_NAME||CHAR(39)||'',''''-'''',''||CHAR(39)||RUN_ID||CHAR(39)||''),
	V.MD_SRC_SYSTEM,
	V.MD_EXTRACT_DT,
	V.PROCESS_DATE,
	V.VALUE,
	V.PRODUCT_CODE
	FROM DB_IAW_''||ENV||''_STG.IAPW_PORTAL_API.VW_ASSETS_SUMMARY_BYPRODUCT V)'';

	
EXECUTE IMMEDIATE :DEL_QUERY;
EXECUTE IMMEDIATE :INS_QUERY;
END
';
CREATE OR REPLACE PROCEDURE DB_IAW_#env#_DM.STRATEGIC.SP_CONV_LOADDM_ASSEST_SUMMARY_BYPRODUCT_RVP_DAILY("ENV" VARCHAR(1000), "DATA_START_DATE" VARCHAR(20), "JOB_AUDIT_ID" VARCHAR(16777216))
RETURNS VARCHAR(16777216)
LANGUAGE SQL
EXECUTE AS OWNER
AS '
DECLARE
DEL_QUERY STRING;
INS_QUERY STRING;
BEGIN
DATA_START_DATE :=CHAR(39)||DATA_START_DATE||CHAR(39);
DEL_QUERY := ''DELETE FROM DB_IAW_''||ENV||''_DM.STRATEGIC.ASSETS_SUMMARY_BYPRODUCT_RVP_DAILY WHERE MD_START_DT = TO_DATE(''||DATA_START_DATE||'',''''YYYY-MM-DD'''')'';
INS_QUERY := ''
INSERT INTO DB_IAW_''||ENV||''_DM.STRATEGIC.ASSETS_SUMMARY_BYPRODUCT_RVP_DAILY(
	MD_START_DT,
	MD_SOURCE,
	MD_CREATION_DT,
	MD_CREATION_AUDIT_ID,
	MD_SRC_SYSTEM,
	MD_EXTRACT_DT,
	RVPID,
	PROCESS_DATE,
	VALUE,
	PRODUCT_CODE)
	(SELECT
	V.MD_START_DT,
	V.MD_SOURCE,
	CURRENT_DATE,
	''||CHAR(39)||JOB_AUDIT_ID||CHAR(39)||'',
	V.MD_SRC_SYSTEM,
	V.MD_EXTRACT_DT,
	V.RVPID,
	V.PROCESS_DATE,
	V.VALUE,
	V.PRODUCT_CODE
	FROM DB_IAW_''||ENV||''_STG.IAPW_PORTAL_API.VW_ASSETS_SUMMARY_BYPRODUCT_RVP V)'';
EXECUTE IMMEDIATE :DEL_QUERY;
EXECUTE IMMEDIATE :INS_QUERY;
END
';
CREATE OR REPLACE PROCEDURE DB_IAW_#env#_DM.STRATEGIC.SP_CONV_LOADDM_ASSEST_SUMMARY_BYPRODUCT_RVP_DAILY("ENV" VARCHAR(1000), "DATA_START_DATE" VARCHAR(20), "JOB_NAME" VARCHAR(16777216), "JOB_AUDIT_ID" VARCHAR(16777216), "RUN_ID" VARCHAR(16777216))
RETURNS VARCHAR(16777216)
LANGUAGE SQL
EXECUTE AS OWNER
AS '
DECLARE
DEL_QUERY STRING;
INS_QUERY STRING;
BEGIN
DATA_START_DATE :=CHAR(39)||DATA_START_DATE||CHAR(39);
DEL_QUERY := ''DELETE FROM DB_IAW_''||ENV||''_DM.STRATEGIC.ASSETS_SUMMARY_BYPRODUCT_RVP_DAILY WHERE MD_START_DT = TO_DATE(''||DATA_START_DATE||'',''''YYYY-MM-DD'''')'';
INS_QUERY := ''
INSERT INTO DB_IAW_''||ENV||''_DM.STRATEGIC.ASSETS_SUMMARY_BYPRODUCT_RVP_DAILY(
	MD_START_DT,
	MD_SOURCE,
	MD_CREATION_DT,
	MD_CREATION_AUDIT_ID,
	MD_SRC_SYSTEM,
	MD_EXTRACT_DT,
	RVPID,
	PROCESS_DATE,
	VALUE,
	PRODUCT_CODE)
	(SELECT
	V.MD_START_DT,
	V.MD_SOURCE,
	CURRENT_DATE,
	CONCAT(''||CHAR(39)||JOB_AUDIT_ID||CHAR(39)||'',''''#'''',''||CHAR(39)||JOB_NAME||CHAR(39)||'',''''-'''',''||CHAR(39)||RUN_ID||CHAR(39)||''),
	V.MD_SRC_SYSTEM,
	V.MD_EXTRACT_DT,
	V.RVPID,
	V.PROCESS_DATE,
	V.VALUE,
	V.PRODUCT_CODE
	FROM DB_IAW_''||ENV||''_STG.IAPW_PORTAL_API.VW_ASSETS_SUMMARY_BYPRODUCT_RVP V)'';
EXECUTE IMMEDIATE :DEL_QUERY;
EXECUTE IMMEDIATE :INS_QUERY;
END
';
CREATE OR REPLACE PROCEDURE DB_IAW_#env#_DM.STRATEGIC.SP_CONV_LOADDM_ASSEST_SUMMARY_BYPROVINCE_DAILY("ENV" VARCHAR(1000), "DATA_START_DATE" VARCHAR(20), "JOB_AUDIT_ID" VARCHAR(16777216))
RETURNS VARCHAR(16777216)
LANGUAGE SQL
EXECUTE AS OWNER
AS '
DECLARE
DEL_QUERY STRING;
INS_QUERY STRING;
BEGIN
DATA_START_DATE :=CHAR(39)||DATA_START_DATE||CHAR(39);
DEL_QUERY := ''DELETE FROM DB_IAW_''||ENV||''_DM.STRATEGIC.ASSETS_SUMMARY_BYPROVINCE_DAILY WHERE MD_START_DT = TO_DATE(''||DATA_START_DATE||'',''''YYYY-MM-DD'''')'';
INS_QUERY := ''
INSERT INTO DB_IAW_''||ENV||''_DM.STRATEGIC.ASSETS_SUMMARY_BYPROVINCE_DAILY(
	MD_START_DT,
	MD_SOURCE,
	MD_CREATION_DT,
	MD_CREATION_AUDIT_ID,
	MD_SRC_SYSTEM,
	MD_EXTRACT_DT,
	PROCESS_DATE,
	VALUE,
	PROVINCE_CODE)
	(SELECT
	V.MD_START_DT,
	V.MD_SOURCE,
	CURRENT_DATE,
	''||CHAR(39)||JOB_AUDIT_ID||CHAR(39)||'',
	V.MD_SRC_SYSTEM,
	V.MD_EXTRACT_DT,
	V.PROCESS_DATE,
	V.VALUE,
	V.PROVINCE_CODE
	FROM DB_IAW_''||ENV||''_STG.IAPW_PORTAL_API.VW_ASSETS_SUMMARY_BYPROVINCE V)'';

	
EXECUTE IMMEDIATE :DEL_QUERY;
EXECUTE IMMEDIATE :INS_QUERY;
END
';
CREATE OR REPLACE PROCEDURE DB_IAW_#env#_DM.STRATEGIC.SP_CONV_LOADDM_ASSEST_SUMMARY_BYPROVINCE_DAILY("ENV" VARCHAR(1000), "DATA_START_DATE" VARCHAR(20), "JOB_NAME" VARCHAR(16777216), "JOB_AUDIT_ID" VARCHAR(16777216), "RUN_ID" VARCHAR(16777216))
RETURNS VARCHAR(16777216)
LANGUAGE SQL
EXECUTE AS OWNER
AS '
DECLARE
DEL_QUERY STRING;
INS_QUERY STRING;
BEGIN
DATA_START_DATE :=CHAR(39)||DATA_START_DATE||CHAR(39);
DEL_QUERY := ''DELETE FROM DB_IAW_''||ENV||''_DM.STRATEGIC.ASSETS_SUMMARY_BYPROVINCE_DAILY WHERE MD_START_DT = TO_DATE(''||DATA_START_DATE||'',''''YYYY-MM-DD'''')'';
INS_QUERY := ''
INSERT INTO DB_IAW_''||ENV||''_DM.STRATEGIC.ASSETS_SUMMARY_BYPROVINCE_DAILY(
	MD_START_DT,
	MD_SOURCE,
	MD_CREATION_DT,
	MD_CREATION_AUDIT_ID,
	MD_SRC_SYSTEM,
	MD_EXTRACT_DT,
	PROCESS_DATE,
	VALUE,
	PROVINCE_CODE)
	(SELECT
	V.MD_START_DT,
	V.MD_SOURCE,
	CURRENT_DATE,
	CONCAT(''||CHAR(39)||JOB_AUDIT_ID||CHAR(39)||'',''''#'''',''||CHAR(39)||JOB_NAME||CHAR(39)||'',''''-'''',''||CHAR(39)||RUN_ID||CHAR(39)||''),
	V.MD_SRC_SYSTEM,
	V.MD_EXTRACT_DT,
	V.PROCESS_DATE,
	V.VALUE,
	V.PROVINCE_CODE
	FROM DB_IAW_''||ENV||''_STG.IAPW_PORTAL_API.VW_ASSETS_SUMMARY_BYPROVINCE V)'';

	
EXECUTE IMMEDIATE :DEL_QUERY;
EXECUTE IMMEDIATE :INS_QUERY;
END
';
CREATE OR REPLACE PROCEDURE DB_IAW_#env#_DM.STRATEGIC.SP_CONV_LOADDM_ASSEST_SUMMARY_BYPROVINCE_RVP_DAILY("ENV" VARCHAR(1000), "DATA_START_DATE" VARCHAR(20), "JOB_AUDIT_ID" VARCHAR(16777216))
RETURNS VARCHAR(16777216)
LANGUAGE SQL
EXECUTE AS OWNER
AS '
DECLARE
DEL_QUERY STRING;
INS_QUERY STRING;
BEGIN
DATA_START_DATE :=CHAR(39)||DATA_START_DATE||CHAR(39);
DEL_QUERY := ''DELETE FROM DB_IAW_''||ENV||''_DM.STRATEGIC.ASSETS_SUMMARY_BYPROVINCE_RVP_DAILY WHERE MD_START_DT = TO_DATE(''||DATA_START_DATE||'',''''YYYY-MM-DD'''')'';
INS_QUERY := ''
INSERT INTO DB_IAW_''||ENV||''_DM.STRATEGIC.ASSETS_SUMMARY_BYPROVINCE_RVP_DAILY(
	MD_START_DT,
	MD_SOURCE,
	MD_CREATION_DT,
	MD_CREATION_AUDIT_ID,
	MD_SRC_SYSTEM,
	MD_EXTRACT_DT,
	RVPID,
	PROCESS_DATE,
	VALUE,
	PROVINCE_CODE)
	(SELECT
	V.MD_START_DT,
	V.MD_SOURCE,
	CURRENT_DATE,
	''||CHAR(39)||JOB_AUDIT_ID||CHAR(39)||'',
	V.MD_SRC_SYSTEM,
	V.MD_EXTRACT_DT,
	V.RVPID,
	V.PROCESS_DATE,
	V.VALUE,
	V.PROVINCE_CODE
	FROM DB_IAW_''||ENV||''_STG.IAPW_PORTAL_API.VW_ASSETS_SUMMARY_BYPROVINCE_RVP V)'';
EXECUTE IMMEDIATE :DEL_QUERY;
EXECUTE IMMEDIATE :INS_QUERY;
END
';
CREATE OR REPLACE PROCEDURE DB_IAW_#env#_DM.STRATEGIC.SP_CONV_LOADDM_ASSEST_SUMMARY_BYPROVINCE_RVP_DAILY("ENV" VARCHAR(1000), "DATA_START_DATE" VARCHAR(20), "JOB_NAME" VARCHAR(16777216), "JOB_AUDIT_ID" VARCHAR(16777216), "RUN_ID" VARCHAR(16777216))
RETURNS VARCHAR(16777216)
LANGUAGE SQL
EXECUTE AS OWNER
AS '
DECLARE
DEL_QUERY STRING;
INS_QUERY STRING;
BEGIN
DATA_START_DATE :=CHAR(39)||DATA_START_DATE||CHAR(39);
DEL_QUERY := ''DELETE FROM DB_IAW_''||ENV||''_DM.STRATEGIC.ASSETS_SUMMARY_BYPROVINCE_RVP_DAILY WHERE MD_START_DT = TO_DATE(''||DATA_START_DATE||'',''''YYYY-MM-DD'''')'';
INS_QUERY := ''
INSERT INTO DB_IAW_''||ENV||''_DM.STRATEGIC.ASSETS_SUMMARY_BYPROVINCE_RVP_DAILY(
	MD_START_DT,
	MD_SOURCE,
	MD_CREATION_DT,
	MD_CREATION_AUDIT_ID,
	MD_SRC_SYSTEM,
	MD_EXTRACT_DT,
	RVPID,
	PROCESS_DATE,
	VALUE,
	PROVINCE_CODE)
	(SELECT
	V.MD_START_DT,
	V.MD_SOURCE,
	CURRENT_DATE,
	CONCAT(''||CHAR(39)||JOB_AUDIT_ID||CHAR(39)||'',''''#'''',''||CHAR(39)||JOB_NAME||CHAR(39)||'',''''-'''',''||CHAR(39)||RUN_ID||CHAR(39)||''),
	V.MD_SRC_SYSTEM,
	V.MD_EXTRACT_DT,
	V.RVPID,
	V.PROCESS_DATE,
	V.VALUE,
	V.PROVINCE_CODE
	FROM DB_IAW_''||ENV||''_STG.IAPW_PORTAL_API.VW_ASSETS_SUMMARY_BYPROVINCE_RVP V)'';
EXECUTE IMMEDIATE :DEL_QUERY;
EXECUTE IMMEDIATE :INS_QUERY;
END
';
CREATE OR REPLACE PROCEDURE DB_IAW_#env#_DM.STRATEGIC.SP_CONV_LOADDM_BDV_SHARED_TO_DM_WT_DIMADVISOR("ENV" VARCHAR(1000), "I_DATA_START_DATE" VARCHAR(1000))
RETURNS VARCHAR(16777216)
LANGUAGE SQL
EXECUTE AS OWNER
AS '
DECLARE
INS_PRE_DEL STRING;
INS_INSERT STRING;
INS_UPDATE STRING;
BEGIN
i_DATA_START_DATE :=CHAR(39)||i_DATA_START_DATE||CHAR(39);
INS_PRE_DEL := ''DELETE FROM DB_IAW_''||ENV||''_DM.SHARED.WT_DIM_ADVISOR WHERE 1=1 '';
INS_INSERT := ''
INSERT INTO DB_IAW_''||ENV||''_DM.SHARED.WT_DIM_ADVISOR (HK_HUB,MD_START_DT,MD_HASH_NAT_KEYS,MD_CREATION_DT,MD_CREATION_AUDIT_ID,MD_SOURCE,MD_SRC_SYSTEM,MD_EXTRACT_DT,MASTER_CODE,COMPANY_CODE,COMPANY_NAME,REGULATORY_ORGANIZATION_NAME,REGULATORY_ORGANIZATION_CODE,DEALER_CODE,DEALER_NAME,REGION_CODE,REGION_NAME,REGION_VP,BRANCHCODE,BRANCHNAME,TEAM_CODE,TEAM_NAME,ADVISOR_FULLNAME,FIRSTNAME,LASTNAME,ADVISOR_CORPORATION_NAME,STATUS,GROUP_RSP_INDICATOR,PROVINCE_CODE,PROVINCE,ADVISOR_AUA_SEGMENT,ADVISOR_AUA_SEGMENT_ORDER,ADVISOR_START_DATE,NEW_ADVISOR,ADVISOR_EFFECTIVENESS_DT,DEPARTED_ADVISOR_IND,PRIMARY_ROLE,END_DATE,REASON,NEW_FIRM,NEW_FIRM_TYPE,NEW_FIRM_BACK_OFFICE,PRESTIGE_STATUS,TRANSITION_PERIOD_END_DATE,DEAL_ASSESTS,EXPECTED_ASSESTS,PREVIOUS_FIRM,PREVIOUS_FIRM_TYPE,AGE_SEGMENT,AGE_SEGMENT_ORD,SUSPENDED_IND)
select rdv.HK_HUB,
TO_DATE(''||i_DATA_START_DATE||'', ''''YYYY-MM-DD''''),
rdv.HK_HUB,
CURRENT_TIMESTAMP,
''''-1'''',
rdv.MD_SOURCE,
rdv.MD_SRC_SYSTEM,
rdv.MD_EXTRACT_DT,
lv1.MASTER_CODE,
rdv.COMPANY_CODE,
rdv.COMPANY_NAME,
rdv.REGULATORY_ORGANIZATION_NAME,
rdv.REGULATORY_ORGANIZATION_CODE,
rdv.DEALER_CODE,
rdv.DEALER_NAME,
rdv.REGION_CODE,
rdv.REGION_NAME,
rdv.REGION_VP,
rdv.BRANCHCODE,
rdv.BRANCHNAME,
rdv.TEAM_CODE,
rdv.TEAM_NAME,
rdv.ADVISOR_FULLNAME,
rdv.FIRSTNAME,
rdv.LASTNAME,
rdv.ADVISOR_CORPORATION_NAME,
rdv.STATUS,
rdv.GROUP_RSP_INDICATOR,
rdv.PROVINCE_CODE,
rdv.PROVINCE,
lv3.ADVISOR_AUA_SEGMENT,
lv3.ADVISOR_AUA_SEGMENT_ORDER,
rdv.ADVISOR_START_DATE,
rdv.NEW_ADVISOR,
DATEADD(''''YY'''',1,rdv.ADVISOR_START_DATE),
rdv.DEPARTED_ADVISOR_IND,
rdv.PRIMARY_ROLE,
rdv.END_DATE,
rdv.REASON,
rdv.NEW_FIRM,
rdv.NEW_FIRM_TYPE,
rdv.NEW_FIRM_BACK_OFFICE,
rdv.PRESTIGE_STATUS,
rdv.TRANSITION_PERIOD_END_DATE,
rdv.DEAL_ASSESTS,
rdv.EXPECTED_ASSESTS,
rdv.PREVIOUS_FIRM,
rdv.PREVIOUS_FIRM_TYPE,
rdv.AGE_SEGMENT,
rdv.AGE_SEGMENT_ORD,
lv3.SUSPENDED_IND
	FROM (
		SELECT *
		FROM DB_IAW_''||ENV||''_DWH.SHARED_BDV.SAT_PARTY_ROLE_ADVISOR_COMPUTE_IAS_WEALTH
		) rdv
		JOIN (
		SELECT *
		FROM (
			SELECT *
				,ROW_NUMBER() OVER (
					PARTITION BY HK_HUB ORDER BY MD_START_DT DESC
					) RN
			FROM DB_IAW_''||ENV||''_DWH.SHARED_BDV.SAT_PARTY_ROLE_ADVISOR_COMPUTE_IAS_WEALTH lv
			) SATHUB
		WHERE SATHUB.RN = 1
		) lv ON lv.HK_HUB = rdv.HK_HUB AND lv.MD_START_DT <= TO_DATE(''||i_DATA_START_DATE||'', ''''YYYY-MM-DD'''') AND lv.MD_ACTIVE =''''A''''
	JOIN DB_IAW_''||ENV||''_DWH.SHARED_BDV.HUB_PARTY_ROLE_ADVISOR lv1 ON lv1.HK_HUB = rdv.HK_HUB
	LEFT JOIN (
		SELECT rdv2.*
		FROM (
			SELECT *
			FROM DB_IAW_''||ENV||''_DWH.SHARED_BDV.SAT_PARTY_ROLE_ADVISOR_AUA_SEG_COMPUTE
			) rdv2
			JOIN (
			SELECT *
			FROM (
				SELECT *
					,ROW_NUMBER() OVER (
						PARTITION BY HK_HUB ORDER BY MD_START_DT DESC
						) RN1
				FROM DB_IAW_''||ENV||''_DWH.SHARED_BDV.SAT_PARTY_ROLE_ADVISOR_AUA_SEG_COMPUTE lv2
				) SATHUB1
			WHERE SATHUB1.RN1 = 1
			) lv2 ON lv2.HK_HUB = rdv2.HK_HUB AND lv2.MD_START_DT <= TO_DATE(''||i_DATA_START_DATE||'', ''''YYYY-MM-DD'''') AND rdv2.MD_ACTIVE =''''A''''
		) lv3 ON lv3.HK_HUB = rdv.HK_HUB
		WHERE lv3.ADVISOR_AUA_SEGMENT != 0
		'';
INS_UPDATE :=''UPDATE DB_IAW_''||ENV||''_DM.SHARED.WT_DIM_ADVISOR
SET
	MD_HASHDIFF_TYPE2=SHA1(
				CONCAT(
				COALESCE(COMPANY_CODE,''''#NULL#''''), ''''|'''',
				COALESCE(COMPANY_NAME,''''#NULL#''''), ''''|'''',
				COALESCE(REGULATORY_ORGANIZATION_NAME,''''#NULL#'''') ,''''|'''',
				COALESCE(REGULATORY_ORGANIZATION_CODE,''''#NULL#''''), ''''|'''',
				COALESCE(DEALER_CODE,''''#NULL#''''), ''''|'''',
				COALESCE(DEALER_NAME,''''#NULL#''''), ''''|'''',
				COALESCE(REGION_CODE,''''#NULL#''''), ''''|'''',
				COALESCE(REGION_NAME,''''#NULL#'''') ,''''|'''',
				COALESCE(REGION_VP,''''#NULL#''''), ''''|'''',
				COALESCE(BRANCHCODE,''''#NULL#''''), ''''|'''',
				COALESCE(BRANCHNAME,''''#NULL#''''), ''''|'''',
				COALESCE(TO_VARCHAR(TEAM_CODE),''''#NULL#''''), ''''|'''',
				COALESCE(TEAM_NAME,''''#NULL#'''') ,''''|'''',
				COALESCE(ADVISOR_FULLNAME,''''#NULL#''''), ''''|'''',
				COALESCE(FIRSTNAME,''''#NULL#''''), ''''|'''',
				COALESCE(LASTNAME,''''#NULL#''''), ''''|'''',
				COALESCE(ADVISOR_CORPORATION_NAME,''''#NULL#''''), ''''|'''',
				COALESCE(TO_VARCHAR(STATUS),''''#NULL#'''') ,''''|'''',
				COALESCE(GROUP_RSP_INDICATOR,''''#NULL#''''), ''''|'''',
				COALESCE(PROVINCE_CODE,''''#NULL#''''), ''''|'''',
				COALESCE(PROVINCE,''''#NULL#''''), ''''|'''',
				COALESCE(ADVISOR_AUA_SEGMENT,''''#NULL#''''), ''''|'''',
				COALESCE(TO_VARCHAR(ADVISOR_AUA_SEGMENT_ORDER),''''#NULL#'''') ,''''|'''',
				COALESCE(TO_VARCHAR(ADVISOR_START_DATE),''''#NULL#''''), ''''|'''',
				COALESCE(TO_VARCHAR(NEW_ADVISOR),''''#NULL#''''), ''''|'''',
				COALESCE(TO_VARCHAR(DEPARTED_ADVISOR_IND),''''#NULL#''''), ''''|'''',
				COALESCE(PRIMARY_ROLE,''''#NULL#'''')
				,''''|'''',COALESCE(TRIM(AGE_SEGMENT),''''#NULL#'''')
				,''''|'''',COALESCE(TRIM(AGE_SEGMENT_ORD),''''#NULL#'''')
				,''''|'''',COALESCE(TO_VARCHAR(SUSPENDED_IND),''''#NULL#'''')
				)),
	MD_HASHDIFF_TYPE1 = SHA1(
				CONCAT(COALESCE(TRIM(TO_VARCHAR(END_DATE)),''''#NULL#''''), ''''|''''
				,  COALESCE(to_varchar(REASON) , ''''#NULL#''''), ''''|''''
				,  COALESCE(to_varchar(NEW_FIRM) , ''''#NULL#''''), ''''|''''
				,  COALESCE(to_varchar(NEW_FIRM_TYPE) , ''''#NULL#''''), ''''|''''
				,  COALESCE(to_varchar(NEW_FIRM_BACK_OFFICE) , ''''#NULL#''''), ''''|''''
				,  COALESCE(to_varchar(PRESTIGE_STATUS) , ''''#NULL#''''), ''''|''''
				,  COALESCE(to_varchar(TRANSITION_PERIOD_END_DATE) , ''''#NULL#''''), ''''|''''
				,  COALESCE(to_varchar(DEAL_ASSESTS) , ''''#NULL#''''), ''''|''''
				,  COALESCE(to_varchar(EXPECTED_ASSESTS) , ''''#NULL#''''), ''''|''''
				,  COALESCE(PREVIOUS_FIRM , ''''#NULL#''''), ''''|''''
				,  COALESCE(PREVIOUS_FIRM_TYPE, ''''#NULL#'''')				
				))
Where HK_HUB <> ''''0'''';
	'';
EXECUTE IMMEDIATE :INS_PRE_DEL;
EXECUTE IMMEDIATE :INS_INSERT;
EXECUTE IMMEDIATE :INS_UPDATE;
END
';
create or replace schema DB_IAW_#env#_DM.TOOLS;

create or replace schema DB_IAW_#env#_DM.TRANSACTIONS;

create or replace TABLE DB_IAW_#env#_DM.TRANSACTIONS.FACT_TRANSACTIONS (
	ID NUMBER(38,0) autoincrement COMMENT 'Surrogate key of the dimension',
	HK_LINK VARCHAR(40) COMMENT 'Hash key for the Hub',
	MD_START_DT TIMESTAMP_NTZ(9) COMMENT 'Start Date of the image/version',
	MD_CREATION_DT TIMESTAMP_NTZ(9) COMMENT 'Creation Date Time of the occurrence',
	MD_CREATION_AUDIT_ID VARCHAR(1000) COMMENT 'Task execution ID',
	MD_SOURCE VARCHAR(1000) COMMENT 'Represents the source system, file, etc. of the instance',
	MD_SRC_SYSTEM VARCHAR(100) COMMENT 'Source system',
	MD_EXTRACT_DT TIMESTAMP_NTZ(9) COMMENT 'Source extraction date',
	MD_SECURITY_TYPE VARCHAR(1000) COMMENT 'Capabilities for RLS',
	SK_DIM_CLIENTS NUMBER(38,0) COMMENT 'Surrogate key of the dimension DIM_CLIENTS',
	SK_DIM_ADVISORS NUMBER(38,0) COMMENT 'Surrogate key of the dimension DIM_ADVISORS',
	SK_DIM_PLANS NUMBER(38,0) COMMENT 'Surrogate key of the dimension DIM_PLANS',
	SK_DIM_MARKETPRODUCTS NUMBER(38,0) COMMENT 'Surrogate key of the dimension DIM_MARKETPRODUCTS',
	TRADE_DATE TIMESTAMP_NTZ(9) COMMENT 'Transaction Trade date',
	GROSS_AMOUNT NUMBER(38,12) COMMENT 'Gross amount value',
	CASH_FLOW VARCHAR(16777216) COMMENT 'CASH FLOW indicator (yes, no or Unknown)',
	CASH_FLOW_TYPE VARCHAR(8) COMMENT 'Cash flow type ex: INFLOW, OUTFLOW, etc..',
	ADMINISTRATORY_TYPE VARCHAR(8000) COMMENT 'ADMINISTRATORY TYPE',
	DEPARTED_ADVISOR_IND NUMBER(1,0) COMMENT 'DEPARTED ADVISOR INDICATOR ',
	DAYS_LAST_PRICED NUMBER(4,0),
	TRANSACTION_ID VARCHAR(100) COMMENT 'The ID of the transaction',
	SK_DEPARTED_ADVISOR NUMBER(38,0),
	SK_DIM_ACCOUNTS NUMBER(38,0),
	A_C_REPRESENTATIVE VARCHAR(50),
	DEPARTED_ADVISOR_12M_IND NUMBER(1,0) COMMENT 'Departed advisor''s indicator for the last 12 months'
);
create or replace TABLE DB_IAW_#env#_DM.TRANSACTIONS.WT_FACT_TRANSACTIONS (
	HK_LINK VARCHAR(40) COMMENT 'Hash key for the Link',
	MD_START_DT TIMESTAMP_NTZ(9) COMMENT 'Start Date of the image/version',
	MD_SOURCE VARCHAR(1000) COMMENT 'Represents the source system, file, etc. of the instance',
	MD_SRC_SYSTEM VARCHAR(100) COMMENT 'Source system',
	MD_EXTRACT_DT TIMESTAMP_NTZ(9) COMMENT 'Source extraction date',
	MD_SECURITY_TYPE VARCHAR(1000) COMMENT 'Capabilities for RLS',
	HK_HUB_PARTY_ROLE_ACCOUNT_HOLDER VARCHAR(40) COMMENT 'Hash key for PARTY_ROLE_ACCOUNT_HOLDER',
	HK_HUB_PARTY_ROLE_ADVISOR VARCHAR(40) COMMENT 'Hash key for the REGISTERED_REPRESENTATIVE_COMMISSION',
	HK_HUB_INVESTMENT_SAVING_PROGRAM_TYPES VARCHAR(40) COMMENT 'Hash key for the REF_INVESTMENT_SAVING_PROGRAM_TYPES',
	HK_HUB_INVESTMENT_PRODUCT_TYPE VARCHAR(40) COMMENT 'Hash key for the REF_MAPPING_PRODUCT_TYPE',
	SK_DIM_CLIENTS NUMBER(38,0) COMMENT 'Surrogate key of the dimension DIM_CLIENTS',
	SK_DIM_ADVISORS NUMBER(38,0) COMMENT 'Surrogate key of the dimension DIM_ADVISORS',
	SK_DIM_PLANS NUMBER(38,0) COMMENT 'Surrogate key of the dimension DIM_PLANS',
	SK_DIM_MARKETPRODUCTS NUMBER(38,0) COMMENT 'Surrogate key of the dimension DIM_MARKETPRODUCTS',
	TRADE_DATE TIMESTAMP_NTZ(9) COMMENT 'Transaction Trade date',
	GROSS_AMOUNT NUMBER(38,12) COMMENT 'Gross amount value',
	CASH_FLOW VARCHAR(16777216) COMMENT 'CASH FLOW indicator (yes, no or Unknown)',
	CASH_FLOW_TYPE VARCHAR(8) COMMENT 'Cash flow type',
	ADMINISTRATORY_TYPE VARCHAR(8000) COMMENT 'ADMINISTRATORY TYPE',
	DEPARTED_ADVISOR_IND NUMBER(1,0) COMMENT 'DEPARTED ADVISOR INDICATOR',
	DAYS_LAST_PRICED NUMBER(4,0),
	TRANSACTION_ID VARCHAR(100) COMMENT 'The ID of the transaction',
	SK_DEPARTED_ADVISOR NUMBER(38,0),
	SK_DIM_ACCOUNTS NUMBER(38,0),
	A_C_REPRESENTATIVE VARCHAR(50),
	DEPARTED_ADVISOR_12M_IND NUMBER(1,0) COMMENT 'Departed advisor''s indicator for the last 12 months'
);
create or replace view DB_IAW_#env#_DM.TRANSACTIONS.VW_FACT_TRANSACTIONS(
	ID,
	SK_DIM_CLIENTS,
	SK_DIM_ADVISORS,
	SK_DIM_PLANS,
	SK_DIM_MARKETPRODUCTS,
	"Trade date",
	"Gross amount",
	CASH_FLOW,
	CASH_FLOW_TYPE,
	"Administratory type",
	"Departed advisor indicator",
	MD_SRCSYSTEM,
	SK_DEPARTED_ADVISOR,
	"Rep code",
	"Advisor indicator 12 months"
) as 
SELECT  
    ID ,
    SK_DIM_CLIENTS ,
    SK_DIM_ADVISORS ,
    SK_DIM_PLANS ,
    SK_DIM_MARKETPRODUCTS ,
    TRADE_DATE  AS "Trade date",
    GROSS_AMOUNT AS "Gross amount",
    CASH_FLOW ,
    CASH_FLOW_TYPE ,
    ADMINISTRATORY_TYPE AS "Administratory type",
    DEPARTED_ADVISOR_IND  AS "Departed advisor indicator",
    MD_SRC_SYSTEM  AS MD_SRCSYSTEM,
    SK_DEPARTED_ADVISOR,
    A_C_REPRESENTATIVE AS "Rep code",
    DEPARTED_ADVISOR_12M_IND AS "Advisor indicator 12 months"
FROM DB_IAW_#env#_DM.TRANSACTIONS.FACT_TRANSACTIONS
WHERE DATE(TRADE_DATE) >= (SELECT DATE(DATEADD(YEAR, -2,MAX(TRADE_DATE) ))  FROM DB_IAW_#env#_DM.TRANSACTIONS.FACT_TRANSACTIONS)
order by SK_DIM_MARKETPRODUCTS,SK_DIM_ADVISORS,SK_DIM_CLIENTS,SK_DIM_PLANS, SK_DEPARTED_ADVISOR, A_C_REPRESENTATIVE;
create or replace view DB_IAW_#env#_DM.TRANSACTIONS.VW_INITIAL_LOADING_WT_FACT_TRANSACTIONS(
	MD_START_DT,
	MD_SOURCE,
	MD_SRC_SYSTEM,
	MD_EXTRACT_DT,
	HK_HUB_PARTY_ROLE_ACCOUNT_HOLDER,
	HK_HUB_PARTY_ROLE_ADVISOR,
	HK_HUB_INVESTMENT_SAVING_PROGRAM_TYPES,
	HK_HUB_INVESTMENT_PRODUCT_TYPE,
	SK_DIM_CLIENTS,
	SK_DIM_ADVISORS,
	SK_DIM_PLANS,
	SK_DIM_MARKETPRODUCTS,
	TRADE_DATE,
	GROSS_AMOUNT,
	CASH_FLOW,
	CASH_FLOW_TYPE,
	ADMINISTRATORY_TYPE,
	DEPARTED_ADVISOR_IND,
	DAYS_LAST_PRICED,
	TRANSACTION_ID,
	SK_DEPARTED_ADVISOR,
	SK_DIM_ACCOUNTS,
	A_C_REPRESENTATIVE
) as
SELECT
	DB_IAW_#env#_DWH.TRANSACTIONS_BDV.TRANSLINK_FINANCIAL_TRANSACTION.MD_START_DT,
	DB_IAW_#env#_DWH.TRANSACTIONS_BDV.TRANSLINK_FINANCIAL_TRANSACTION.MD_SOURCE,
	DB_IAW_#env#_DWH.TRANSACTIONS_BDV.TRANSLINK_FINANCIAL_TRANSACTION.MD_SRC_SYSTEM,
	DB_IAW_#env#_DWH.TRANSACTIONS_BDV.TRANSLINK_FINANCIAL_TRANSACTION.MD_EXTRACT_DT,
	DB_IAW_#env#_DWH.TRANSACTIONS_BDV.TRANSLINK_FINANCIAL_TRANSACTION.HK_HUB_PARTY_ROLE_ACCOUNT_HOLDER,
	DB_IAW_#env#_DWH.TRANSACTIONS_BDV.TRANSLINK_FINANCIAL_TRANSACTION.HK_HUB_PARTY_ROLE_ADVISOR,
	DB_IAW_#env#_DWH.TRANSACTIONS_BDV.TRANSLINK_FINANCIAL_TRANSACTION.HK_HUB_INVESTMENT_SAVING_PROGRAM_TYPES,
	DB_IAW_#env#_DWH.TRANSACTIONS_BDV.TRANSLINK_FINANCIAL_TRANSACTION.HK_HUB_INVESTMENT_PRODUCT_TYPE,
	CAST(CAST(
	(CASE WHEN SHARED.DIM_CLIENTS.ID IS NULL THEN -1
	ELSE SHARED.DIM_CLIENTS.ID
END) AS VARCHAR(252)) AS FLOAT) AS SK_DIM_CLIENTS,
	CAST(CAST(
	(CASE WHEN SHARED.DIM_ADVISOR.ID IS NULL THEN -1
	ELSE SHARED.DIM_ADVISOR.ID
END) AS VARCHAR(252)) AS FLOAT) AS SK_DIM_ADVISORS,
	CAST(CAST(
	(CASE WHEN SHARED.DIM_PLANS.ID IS NULL THEN -1
	ELSE SHARED.DIM_PLANS.ID
END) AS VARCHAR(251)) AS FLOAT) SK_DIM_PLANS,
	CAST(CAST(
	(CASE WHEN SHARED.DIM_FINANCIAL_INSTRUMENTS.ID IS NULL THEN -1
	ELSE SHARED.DIM_FINANCIAL_INSTRUMENTS.ID
END) AS VARCHAR(252)) AS FLOAT) SK_DIM_MARKETPRODUCTS,
	DB_IAW_#env#_DWH.TRANSACTIONS_BDV.TRANSLINK_FINANCIAL_TRANSACTION.TRADE_DATE,
	DB_IAW_#env#_DWH.TRANSACTIONS_BDV.TRANSLINK_FINANCIAL_TRANSACTION.GROSS_AMOUNT,
	DB_IAW_#env#_DWH.TRANSACTIONS_BDV.TRANSLINK_FINANCIAL_TRANSACTION.CASH_FLOW,
	DB_IAW_#env#_DWH.TRANSACTIONS_BDV.TRANSLINK_FINANCIAL_TRANSACTION.CASH_FLOW_TYPE,
	DB_IAW_#env#_DWH.TRANSACTIONS_BDV.TRANSLINK_FINANCIAL_TRANSACTION.ADMINISTRATORY_TYPE,
	DB_IAW_#env#_DWH.TRANSACTIONS_BDV.TRANSLINK_FINANCIAL_TRANSACTION.DEPARTED_ADVISOR_IND,
	DB_IAW_#env#_DWH.TRANSACTIONS_BDV.TRANSLINK_FINANCIAL_TRANSACTION.DAYS_LAST_PRICED,
	DB_IAW_#env#_DWH.TRANSACTIONS_BDV.TRANSLINK_FINANCIAL_TRANSACTION.TRANSACTION_ID,
	CAST(CAST(
	(CASE WHEN DIM_DEPARTED_ADVISOR.ID IS NULL THEN -1
	ELSE DIM_DEPARTED_ADVISOR.ID
END) AS VARCHAR(252)) AS FLOAT),
	CAST(CAST(
	(CASE WHEN DB_IAW_#env#_DM.SHARED.DIM_ACCOUNTS.ID IS NULL THEN -1
	ELSE DB_IAW_#env#_DM.SHARED.DIM_ACCOUNTS.ID
END) AS VARCHAR(251)) AS FLOAT),
	DB_IAW_#env#_DWH.TRANSACTIONS_BDV.TRANSLINK_FINANCIAL_TRANSACTION.A_C_REPRESENTATIVE
FROM
	(--DB_IAW_#env#_DM.SHARED.DIM_ADVISOR DIM_DEPARTED_ADVISOR
	(SELECT MASTER_CODE, MAX(ID) AS ID FROM DB_IAW_#env#_DM.SHARED.DIM_ADVISOR WHERE MD_SRC_SYSTEM = 'IAS' GROUP BY MASTER_CODE ) DIM_DEPARTED_ADVISOR
RIGHT OUTER JOIN (DB_IAW_#env#_DM.SHARED.DIM_ACCOUNTS
RIGHT OUTER JOIN (DB_IAW_#env#_DM.SHARED.DIM_CLIENTS
RIGHT OUTER JOIN (DB_IAW_#env#_DM.SHARED.DIM_PLANS
RIGHT OUTER JOIN (DB_IAW_#env#_DM.SHARED.DIM_ADVISOR
RIGHT OUTER JOIN (DB_IAW_#env#_DM.SHARED.DIM_FINANCIAL_INSTRUMENTS
RIGHT OUTER JOIN DB_IAW_#env#_DWH.TRANSACTIONS_BDV.TRANSLINK_FINANCIAL_TRANSACTION ON
	(DB_IAW_#env#_DWH.TRANSACTIONS_BDV.TRANSLINK_FINANCIAL_TRANSACTION.HK_HUB_INVESTMENT_PRODUCT_TYPE = DB_IAW_#env#_DM.SHARED.DIM_FINANCIAL_INSTRUMENTS.HK_HUB)
	AND ((DB_IAW_#env#_DM.SHARED.DIM_FINANCIAL_INSTRUMENTS.MD_START_DT <= DB_IAW_#env#_DWH.TRANSACTIONS_BDV.TRANSLINK_FINANCIAL_TRANSACTION.MD_START_DT)
		AND ((DB_IAW_#env#_DM.SHARED.DIM_FINANCIAL_INSTRUMENTS.MD_END_DT > DB_IAW_#env#_DWH.TRANSACTIONS_BDV.TRANSLINK_FINANCIAL_TRANSACTION.MD_START_DT)
			OR DB_IAW_#env#_DM.SHARED.DIM_FINANCIAL_INSTRUMENTS.MD_END_DT IS NULL))) ON
	(DB_IAW_#env#_DWH.TRANSACTIONS_BDV.TRANSLINK_FINANCIAL_TRANSACTION.HK_HUB_PARTY_ROLE_ADVISOR = DB_IAW_#env#_DM.SHARED.DIM_ADVISOR.HK_HUB)
	AND ((DB_IAW_#env#_DM.SHARED.DIM_ADVISOR.MD_START_DT <= DB_IAW_#env#_DWH.TRANSACTIONS_BDV.TRANSLINK_FINANCIAL_TRANSACTION.MD_START_DT)
		AND ((DB_IAW_#env#_DM.SHARED.DIM_ADVISOR.MD_END_DT > DB_IAW_#env#_DWH.TRANSACTIONS_BDV.TRANSLINK_FINANCIAL_TRANSACTION.MD_START_DT)
			OR DB_IAW_#env#_DM.SHARED.DIM_ADVISOR.MD_END_DT IS NULL))) ON
	(DB_IAW_#env#_DWH.TRANSACTIONS_BDV.TRANSLINK_FINANCIAL_TRANSACTION.HK_HUB_INVESTMENT_SAVING_PROGRAM_TYPES = DB_IAW_#env#_DM.SHARED.DIM_PLANS.HK_HUB)
	AND ((DB_IAW_#env#_DM.SHARED.DIM_PLANS.MD_START_DT <= DB_IAW_#env#_DWH.TRANSACTIONS_BDV.TRANSLINK_FINANCIAL_TRANSACTION.MD_START_DT)
		AND ((DB_IAW_#env#_DM.SHARED.DIM_PLANS.MD_END_DT > DB_IAW_#env#_DWH.TRANSACTIONS_BDV.TRANSLINK_FINANCIAL_TRANSACTION.MD_START_DT)
			OR DB_IAW_#env#_DM.SHARED.DIM_PLANS.MD_END_DT IS NULL))) ON
	(DB_IAW_#env#_DWH.TRANSACTIONS_BDV.TRANSLINK_FINANCIAL_TRANSACTION.HK_HUB_PARTY_ROLE_ACCOUNT_HOLDER = DB_IAW_#env#_DM.SHARED.DIM_CLIENTS.HK_HUB)
	AND ((DB_IAW_#env#_DM.SHARED.DIM_CLIENTS.MD_START_DT <= DB_IAW_#env#_DWH.TRANSACTIONS_BDV.TRANSLINK_FINANCIAL_TRANSACTION.MD_START_DT)
		AND ((DB_IAW_#env#_DM.SHARED.DIM_CLIENTS.MD_END_DT > DB_IAW_#env#_DWH.TRANSACTIONS_BDV.TRANSLINK_FINANCIAL_TRANSACTION.MD_START_DT)
			OR DB_IAW_#env#_DM.SHARED.DIM_CLIENTS.MD_END_DT IS NULL))) ON
	(DB_IAW_#env#_DWH.TRANSACTIONS_BDV.TRANSLINK_FINANCIAL_TRANSACTION.HK_HUB_CONTRACT = DB_IAW_#env#_DM.SHARED.DIM_ACCOUNTS.HK_HUB)
	AND ((DB_IAW_#env#_DM.SHARED.DIM_ACCOUNTS.MD_START_DT <= DB_IAW_#env#_DWH.TRANSACTIONS_BDV.TRANSLINK_FINANCIAL_TRANSACTION.MD_START_DT)
		AND ((DB_IAW_#env#_DM.SHARED.DIM_ACCOUNTS.MD_END_DT > DB_IAW_#env#_DWH.TRANSACTIONS_BDV.TRANSLINK_FINANCIAL_TRANSACTION.MD_START_DT)
			OR DB_IAW_#env#_DM.SHARED.DIM_ACCOUNTS.MD_END_DT IS NULL))) ON
	(DB_IAW_#env#_DWH.TRANSACTIONS_BDV.TRANSLINK_FINANCIAL_TRANSACTION.DEPARTED_ADVISOR_MASTER_CODE = DIM_DEPARTED_ADVISOR.MASTER_CODE)
	);
CREATE OR REPLACE PROCEDURE DB_IAW_#env#_DM.TRANSACTIONS.SP_CONV_LOADDM_BDV_TRANSACTIONS_TO_DM_WT_FACT_TRANSACTIONS("ENV" VARCHAR(1000), "DATA_START_DATE" VARCHAR(20))
RETURNS VARCHAR(16777216)
LANGUAGE SQL
EXECUTE AS OWNER
AS '
DECLARE
TRUNC_QUERY STRING;
INS_QUERY STRING;
UPD_QUERY STRING;
BEGIN 
DATA_START_DATE :=CHAR(39)||DATA_START_DATE||CHAR(39);
TRUNC_QUERY := '' TRUNCATE TABLE DB_IAW_''||ENV||''_DM.TRANSACTIONS.WT_FACT_TRANSACTIONS '';
INS_QUERY := ''
INSERT INTO DB_IAW_''||ENV||''_DM.TRANSACTIONS.WT_FACT_TRANSACTIONS(
    MD_START_DT,
	MD_SOURCE,
	MD_SRC_SYSTEM,
	MD_EXTRACT_DT,
	HK_HUB_PARTY_ROLE_ACCOUNT_HOLDER,
	HK_HUB_PARTY_ROLE_ADVISOR,
	HK_HUB_INVESTMENT_SAVING_PROGRAM_TYPES,
	HK_HUB_INVESTMENT_PRODUCT_TYPE,
	SK_DIM_CLIENTS,  
	SK_DIM_ADVISORS,
	SK_DIM_PLANS,
	SK_DIM_MARKETPRODUCTS,
	TRADE_DATE,
	GROSS_AMOUNT,
	CASH_FLOW,
	CASH_FLOW_TYPE,
	ADMINISTRATORY_TYPE,
	DEPARTED_ADVISOR_IND,
	DAYS_LAST_PRICED,
	TRANSACTION_ID,
	SK_DIM_ACCOUNTS,
	SK_DEPARTED_ADVISOR,
	A_C_REPRESENTATIVE,
	DEPARTED_ADVISOR_12M_IND)
	(     SELECT
    REV.MD_START_DT,
	REV.MD_SOURCE,
	REV.MD_SRC_SYSTEM,
	REV.MD_EXTRACT_DT,
	REV.HK_HUB_PARTY_ROLE_ACCOUNT_HOLDER,
	REV.HK_HUB_PARTY_ROLE_ADVISOR,
	REV.HK_HUB_INVESTMENT_SAVING_PROGRAM_TYPES,
	REV.HK_HUB_INVESTMENT_PRODUCT_TYPE,
	(CASE WHEN REV.o_CLIENT_ID IS NULL THEN -1 ELSE REV.o_CLIENT_ID END) AS o_CLIENT_ID,
	(CASE WHEN REV.O_ADV_ID IS NULL THEN -1 ELSE REV.O_ADV_ID END) AS O_ADV_ID,
	(CASE WHEN REV.o_PLAN_ID IS NULL THEN -1 ELSE REV.o_PLAN_ID END) AS o_PLAN_ID,
	(CASE WHEN REV.o_PRODUCT_ID IS NULL THEN -1 ELSE REV.o_PRODUCT_ID END) AS  o_PRODUCT_ID,
	REV.TRADE_DATE,
	REV.GROSS_AMOUNT,
	REV.CASH_FLOW,
	REV.CASH_FLOW_TYPE,
	REV.ADMINISTRATORY_TYPE,
	REV.DEPARTED_ADVISOR_IND,
	REV.DAYS_LAST_PRICED,
	REV.TRANSACTION_ID,
	(CASE WHEN REV.o_CONTRACT_ID IS NULL THEN -1 ELSE REV.o_CONTRACT_ID END) AS DIM_ACCT_ID,
	(CASE WHEN REV.o_DEPARTED_ID IS NULL THEN -1 ELSE REV.o_DEPARTED_ID END) AS DEPARTEDADV_ID,
	A_C_REPRESENTATIVE,
	DEPARTED_ADVISOR_12M_IND
	FROM 
	( 
		SELECT * FROM (SELECT * FROM DB_IAW_''||ENV||''_DWH.TRANSACTIONS_BDV.TRANSLINK_FINANCIAL_TRANSACTION WHERE MD_START_DT = TO_DATE(''||DATA_START_DATE||'',''''YYYY-MM-DD'''')) TFT
		LEFT JOIN
		(SELECT ID AS o_PRODUCT_ID , HK_HUB FROM (SELECT * FROM DB_IAW_''||ENV||''_DM.SHARED.DIM_FINANCIAL_INSTRUMENTS WHERE (MD_START_DT <= TO_DATE(''||DATA_START_DATE||'',''''YYYY-MM-DD'''') AND (MD_END_DT> TO_DATE(''||DATA_START_DATE||'',''''YYYY-MM-DD'''') OR (MD_END_DT IS NULL)))) PRD) PRD
		ON TFT.HK_HUB_INVESTMENT_PRODUCT_TYPE = PRD.HK_HUB
		LEFT JOIN
		( SELECT ID AS O_ADV_ID, HK_HUB  FROM (SELECT * FROM DB_IAW_''||ENV||''_DM.SHARED.DIM_ADVISOR WHERE (MD_START_DT <= TO_DATE(''||DATA_START_DATE||'',''''YYYY-MM-DD'''') AND (MD_END_DT> TO_DATE(''||DATA_START_DATE||'',''''YYYY-MM-DD'''') OR (MD_END_DT IS NULL)))) ADV ) ADV
		ON TFT.HK_HUB_PARTY_ROLE_ADVISOR = ADV.HK_HUB
		LEFT JOIN
		(SELECT ID AS o_PLAN_ID, HK_HUB  FROM (SELECT * FROM DB_IAW_''||ENV||''_DM.SHARED.DIM_PLANS WHERE (MD_START_DT <= TO_DATE(''||DATA_START_DATE||'',''''YYYY-MM-DD'''') AND (MD_END_DT> TO_DATE(''||DATA_START_DATE||'',''''YYYY-MM-DD'''') OR (MD_END_DT IS NULL)))) PLAN) PLAN
		ON TFT.HK_HUB_INVESTMENT_SAVING_PROGRAM_TYPES = PLAN.HK_HUB
		LEFT JOIN
		(SELECT ID AS o_CLIENT_ID , HK_HUB  FROM (SELECT * FROM DB_IAW_''||ENV||''_DM.SHARED.DIM_CLIENTS WHERE (MD_START_DT <= TO_DATE(''||DATA_START_DATE||'',''''YYYY-MM-DD'''') AND (MD_END_DT> TO_DATE(''||DATA_START_DATE||'',''''YYYY-MM-DD'''') OR (MD_END_DT IS NULL)))) CLT) CLT
		ON TFT.HK_HUB_PARTY_ROLE_ACCOUNT_HOLDER = CLT.HK_HUB
		LEFT JOIN
		(SELECT ID AS o_CONTRACT_ID , HK_HUB  FROM (SELECT * FROM DB_IAW_''||ENV||''_DM.SHARED.DIM_ACCOUNTS WHERE (MD_START_DT <= TO_DATE(''||DATA_START_DATE||'',''''YYYY-MM-DD'''') AND (MD_END_DT> TO_DATE(''||DATA_START_DATE||'',''''YYYY-MM-DD'''') OR (MD_END_DT IS NULL)))) ACT) ACT
		ON TFT.HK_HUB_CONTRACT = ACT.HK_HUB	
		LEFT JOIN
		(SELECT ID AS o_DEPARTED_ID , MASTER_CODE , HK_HUB  FROM 
			(SELECT HK_HUB AS HK_HUB_LV, MAX(MD_START_DT) AS MD_START_DT_LV FROM DB_IAW_''||ENV||''_DM.SHARED.DIM_ADVISOR WHERE (MD_START_DT <= TO_DATE(''||DATA_START_DATE||'',''''YYYY-MM-DD'''') ) GROUP BY HK_HUB) DAD_LV INNER JOIN  DB_IAW_''||ENV||''_DM.SHARED.DIM_ADVISOR DAD ON DAD.HK_HUB = DAD_LV.HK_HUB_LV ) DAD
		ON TFT.DEPARTED_ADVISOR_MASTER_CODE = DAD.MASTER_CODE 
	) REV )
              '';
UPD_QUERY := ''UPDATE DB_IAW_''||ENV||''_DM.TRANSACTIONS.WT_FACT_TRANSACTIONS SET
	HK_LINK = SHA1(UPPER(CONCAT(
	  COALESCE(TRIM(MD_SRC_SYSTEM), ''''#NULL#''''), ''''|''''
	, COALESCE(TRIM(TRANSACTION_ID), ''''#NULL#''''), ''''|''''
	, COALESCE(TRIM(HK_HUB_PARTY_ROLE_ACCOUNT_HOLDER), ''''#NULL#''''), ''''|''''
	, COALESCE(TRIM(HK_HUB_PARTY_ROLE_ADVISOR), ''''#NULL#''''), ''''|''''
	, COALESCE(TRIM(HK_HUB_INVESTMENT_SAVING_PROGRAM_TYPES), ''''#NULL#''''), ''''|''''
	, COALESCE(TRIM(HK_HUB_INVESTMENT_PRODUCT_TYPE), ''''#NULL#''''), ''''|''''
	, COALESCE(TRIM(TRADE_DATE), ''''#NULL#''''), ''''|''''
	, COALESCE(TRIM(CASH_FLOW), ''''#NULL#''''), ''''|''''
	, COALESCE(TRIM(CASH_FLOW_TYPE), ''''#NULL#''''), ''''|''''
	, COALESCE(TRIM(ADMINISTRATORY_TYPE), ''''#NULL#''''), ''''|''''
	, COALESCE(TO_VARCHAR(DEPARTED_ADVISOR_IND),''''#NULL#'''')
	, COALESCE(TO_VARCHAR(DAYS_LAST_PRICED),''''#NULL#'''')
	)))
Where 1=1'';

EXECUTE IMMEDIATE :TRUNC_QUERY;
EXECUTE IMMEDIATE :INS_QUERY;
EXECUTE IMMEDIATE :UPD_QUERY;
END
';
CREATE OR REPLACE PROCEDURE DB_IAW_#env#_DM.TRANSACTIONS.SP_CONV_LOADDM_BDV_TRANSACTION_TO_DM_WT_FACT_TRANSACTIONS("ENV" VARCHAR(1000), "DATA_START_DATE" VARCHAR(20))
RETURNS VARCHAR(16777216)
LANGUAGE SQL
EXECUTE AS OWNER
AS '
DECLARE
TRUNC_QUERY STRING;
INS_QUERY STRING;
UPD_QUERY STRING;
BEGIN
DATA_START_DATE :=CHAR(39)||DATA_START_DATE||CHAR(39);
TRUNC_QUERY := ''TRUNCATE TABLE  DB_IAW_''||ENV||''_DM.TRANSACTIONS.WT_FACT_TRANSACTIONS'';
INS_QUERY := ''INSERT INTO DB_IAW_''||ENV||''_DM.TRANSACTIONS.WT_FACT_TRANSACTIONS(
MD_START_DT,
MD_SOURCE,
MD_SRC_SYSTEM,
MD_EXTRACT_DT,
HK_HUB_PARTY_ROLE_ACCOUNT_HOLDER,
HK_HUB_PARTY_ROLE_ADVISOR,
HK_HUB_INVESTMENT_SAVING_PROGRAM_TYPES,
HK_HUB_INVESTMENT_PRODUCT_TYPE,
SK_DIM_CLIENTS,
SK_DIM_ADVISORS,
SK_DIM_PLANS,
SK_DIM_MARKETPRODUCTS,
TRADE_DATE,
GROSS_AMOUNT,
CASH_FLOW,
CASH_FLOW_TYPE,
ADMINISTRATORY_TYPE
)
(
WITH 
	JNR_BDVLINKTRANS_LEFTJOIN_FACTTRANS AS (
	SELECT
	A.HK_LINK											AS FACT_HK_LINK,
	B.ACCOUNT_RAP_CODE 									AS 	ACCOUNT_RAP_CODE,
	B.ADMINISTRATORY_TYPE 								AS 	ADMINISTRATORY_TYPE,
	B.CASH_FLOW 										AS 	CASH_FLOW,
	B.CASH_FLOW_TYPE 									AS 	CASH_FLOW_TYPE,
	B.CLIENT_ID 										AS 	CLIENT_ID,
	B.CONTRACT_ID 										AS 	CONTRACT_ID,
	B.GROSS_AMOUNT 										AS 	GROSS_AMOUNT,
	B.HK_HUB_CONTRACT 									AS 	HK_HUB_CONTRACT,
	B.HK_HUB_INVESTMENT_PRODUCT_TYPE 					AS 	HK_HUB_INVESTMENT_PRODUCT_TYPE,
	B.HK_HUB_INVESTMENT_SAVING_PROGRAM_TYPES 			AS 	HK_HUB_INVESTMENT_SAVING_PROGRAM_TYPES,
	B.HK_HUB_PARTY_ROLE_ACCOUNT_HOLDER 					AS 	HK_HUB_PARTY_ROLE_ACCOUNT_HOLDER,
	B.HK_HUB_PARTY_ROLE_ADVISOR 						AS 	HK_HUB_PARTY_ROLE_ADVISOR,
	B.HK_LINK 											AS 	HK_LINK,
	B.INVESTMENT_PRODUCT_ID 							AS 	INVESTMENT_PRODUCT_ID,
	B.MASTER_CODE 										AS 	MASTER_CODE,
	B.MD_CREATION_AUDIT_ID 								AS 	MD_CREATION_AUDIT_ID,
	B.MD_CREATION_DT 									AS 	MD_CREATION_DT,
	B.MD_EXTRACT_DT 									AS 	MD_EXTRACT_DT,
	B.MD_SOURCE 										AS 	MD_SOURCE,
	B.MD_SRC_SYSTEM 									AS 	MD_SRC_SYSTEM,
	B.MD_START_DT 										AS 	MD_START_DT,
	B.ORD_TRANSACTION_TYPE 								AS 	ORD_TRANSACTION_TYPE,
	B.RETAIL_PLAN 										AS 	RETAIL_PLAN,
	B.TRADE_DATE 										AS 	TRADE_DATE,
	B.TRANSACTION_ID 									AS 	TRANSACTION_ID,
	B.TRANSACTION_TYPE 									AS 	TRANSACTION_TYPE
	FROM  DB_IAW_''||ENV||''_DWH.TRANSACTIONS_BDV.TRANSLINK_FINANCIAL_TRANSACTION B
	LEFT JOIN DB_IAW_''||ENV||''_DM.TRANSACTIONS.FACT_TRANSACTIONS A
	ON B.HK_LINK=A.HK_LINK
	WHERE B.MD_START_DT <= TO_DATE(''||DATA_START_DATE||'',''''YYYY-MM-DD'''')and (B.MD_SRC_SYSTEM = ''''INVESTIA-UNIVERIS'''')
	AND A.HK_LINK IS NULL
	),
	JOINER_TRAN_PRODUCT AS (
	SELECT
	A.HK_HUB											AS 	PRODUCT_HK_HUB,
	A.ID												AS 	PRODUCT_ID,
	CASE WHEN A.ID IS NULL THEN ''''-1'''' ELSE A.ID END 	AS 	O_PRODUCT_ID,
	B.ACCOUNT_RAP_CODE 									AS 	ACCOUNT_RAP_CODE,
	B.ADMINISTRATORY_TYPE 								AS 	ADMINISTRATORY_TYPE,
	B.CASH_FLOW 										AS 	CASH_FLOW,
	B.CASH_FLOW_TYPE 									AS 	CASH_FLOW_TYPE,
	B.CLIENT_ID 										AS 	CLIENT_ID,
	B.CONTRACT_ID 										AS 	CONTRACT_ID,
	B.GROSS_AMOUNT 										AS 	GROSS_AMOUNT,
	B.HK_HUB_CONTRACT 									AS 	HK_HUB_CONTRACT,
	B.HK_HUB_INVESTMENT_PRODUCT_TYPE 					AS 	HK_HUB_INVESTMENT_PRODUCT_TYPE,
	B.HK_HUB_INVESTMENT_SAVING_PROGRAM_TYPES 			AS 	HK_HUB_INVESTMENT_SAVING_PROGRAM_TYPES,
	B.HK_HUB_PARTY_ROLE_ACCOUNT_HOLDER 					AS 	HK_HUB_PARTY_ROLE_ACCOUNT_HOLDER,
	B.HK_HUB_PARTY_ROLE_ADVISOR 						AS 	HK_HUB_PARTY_ROLE_ADVISOR,
	B.HK_LINK 											AS 	HK_LINK,
	B.INVESTMENT_PRODUCT_ID 							AS 	INVESTMENT_PRODUCT_ID,
	B.MASTER_CODE 										AS 	MASTER_CODE,
	B.MD_CREATION_AUDIT_ID 								AS 	MD_CREATION_AUDIT_ID,
	B.MD_CREATION_DT 									AS 	MD_CREATION_DT,
	B.MD_EXTRACT_DT 									AS 	MD_EXTRACT_DT,
	B.MD_SOURCE 										AS 	MD_SOURCE,
	B.MD_SRC_SYSTEM 									AS 	MD_SRC_SYSTEM,
	B.MD_START_DT 										AS 	MD_START_DT,
	B.ORD_TRANSACTION_TYPE 								AS 	ORD_TRANSACTION_TYPE,
	B.RETAIL_PLAN 										AS 	RETAIL_PLAN,
	B.TRADE_DATE 										AS 	TRADE_DATE,
	B.TRANSACTION_ID 									AS 	TRANSACTION_ID,
	B.TRANSACTION_TYPE 									AS 	TRANSACTION_TYPE
	FROM JNR_BDVLINKTRANS_LEFTJOIN_FACTTRANS B
	LEFT JOIN DB_IAW_''||ENV||''_DM.SHARED.DIM_FINANCIAL_INSTRUMENTS A
	ON B.HK_HUB_INVESTMENT_PRODUCT_TYPE = A.HK_HUB
	WHERE (A.MD_START_DT <= TO_DATE(''||DATA_START_DATE||'',''''YYYY-MM-DD'''') AND (A.MD_END_DT> TO_DATE(''||DATA_START_DATE||'',''''YYYY-MM-DD'''') OR A.MD_END_DT IS NULL))
	),
	JOINER_PRODUCT_TRAN_ACCOUNT AS (
	SELECT
	A.HK_HUB 											AS 	ADV_HK_HUB,
	A.ID												AS 	ADV_ID,
	CASE WHEN A.ID IS NULL THEN ''''-1'''' ELSE A.ID END 	AS 	O_ADV_ID,
	B.PRODUCT_HK_HUB									AS 	PRODUCT_HK_HUB,
	B.PRODUCT_ID										AS 	PRODUCT_ID,
	B.O_PRODUCT_ID										AS 	O_PRODUCT_ID,
	B.ACCOUNT_RAP_CODE 									AS 	ACCOUNT_RAP_CODE,
	B.ADMINISTRATORY_TYPE 								AS 	ADMINISTRATORY_TYPE,
	B.CASH_FLOW 										AS 	CASH_FLOW,
	B.CASH_FLOW_TYPE 									AS 	CASH_FLOW_TYPE,
	B.CLIENT_ID 										AS 	CLIENT_ID,
	B.CONTRACT_ID 										AS 	CONTRACT_ID,
	B.GROSS_AMOUNT 										AS 	GROSS_AMOUNT,
	B.HK_HUB_CONTRACT 									AS 	HK_HUB_CONTRACT,
	B.HK_HUB_INVESTMENT_PRODUCT_TYPE 					AS 	HK_HUB_INVESTMENT_PRODUCT_TYPE,
	B.HK_HUB_INVESTMENT_SAVING_PROGRAM_TYPES 			AS 	HK_HUB_INVESTMENT_SAVING_PROGRAM_TYPES,
	B.HK_HUB_PARTY_ROLE_ACCOUNT_HOLDER 					AS 	HK_HUB_PARTY_ROLE_ACCOUNT_HOLDER,
	B.HK_HUB_PARTY_ROLE_ADVISOR 						AS 	HK_HUB_PARTY_ROLE_ADVISOR,
	B.HK_LINK 											AS 	HK_LINK,
	B.INVESTMENT_PRODUCT_ID 							AS 	INVESTMENT_PRODUCT_ID,
	B.MASTER_CODE 										AS 	MASTER_CODE,
	B.MD_CREATION_AUDIT_ID 								AS 	MD_CREATION_AUDIT_ID,
	B.MD_CREATION_DT 									AS 	MD_CREATION_DT,
	B.MD_EXTRACT_DT 									AS 	MD_EXTRACT_DT,
	B.MD_SOURCE 										AS 	MD_SOURCE,
	B.MD_SRC_SYSTEM 									AS 	MD_SRC_SYSTEM,
	B.MD_START_DT 										AS 	MD_START_DT,
	B.ORD_TRANSACTION_TYPE 								AS 	ORD_TRANSACTION_TYPE,
	B.RETAIL_PLAN 										AS 	RETAIL_PLAN,
	B.TRADE_DATE 										AS 	TRADE_DATE,
	B.TRANSACTION_ID 									AS 	TRANSACTION_ID,
	B.TRANSACTION_TYPE 									AS 	TRANSACTION_TYPE
	FROM JOINER_TRAN_PRODUCT B 
	LEFT JOIN DB_IAW_''||ENV||''_DM.SHARED.DIM_ADVISOR A
	ON B.HK_HUB_PARTY_ROLE_ADVISOR = A.HK_HUB
	WHERE (A.MD_START_DT <= TO_DATE(''||DATA_START_DATE||'',''''YYYY-MM-DD'''') AND (A.MD_END_DT> TO_DATE(''||DATA_START_DATE||'',''''YYYY-MM-DD'''') OR A.MD_END_DT IS NULL))
	),
	JOINER_PRODUCT_TRAN_ADVISOR_PLAN AS (
	SELECT 
	A.HK_HUB											AS 	PLAN_HK_HUB,
	A.ID 												AS 	PLAN_ID,
	CASE WHEN A.ID IS NULL THEN ''''-1'''' ELSE A.ID END 	AS 	O_PLAN_ID,
	B.ADV_HK_HUB 										AS 	ADV_HK_HUB,
	B.ADV_ID											AS 	ADV_ID,
	B.O_ADV_ID 											AS 	O_ADV_ID,
	B.PRODUCT_HK_HUB									AS 	PRODUCT_HK_HUB,
	B.PRODUCT_ID										AS 	PRODUCT_ID,
	B.O_PRODUCT_ID										AS 	O_PRODUCT_ID,
	B.ACCOUNT_RAP_CODE 									AS 	ACCOUNT_RAP_CODE,
	B.ADMINISTRATORY_TYPE 								AS 	ADMINISTRATORY_TYPE,
	B.CASH_FLOW 										AS 	CASH_FLOW,
	B.CASH_FLOW_TYPE 									AS 	CASH_FLOW_TYPE,
	B.CLIENT_ID 										AS 	CLIENT_ID,
	B.CONTRACT_ID 										AS 	CONTRACT_ID,
	B.GROSS_AMOUNT 										AS 	GROSS_AMOUNT,
	B.HK_HUB_CONTRACT 									AS 	HK_HUB_CONTRACT,
	B.HK_HUB_INVESTMENT_PRODUCT_TYPE 					AS 	HK_HUB_INVESTMENT_PRODUCT_TYPE,
	B.HK_HUB_INVESTMENT_SAVING_PROGRAM_TYPES 			AS 	HK_HUB_INVESTMENT_SAVING_PROGRAM_TYPES,
	B.HK_HUB_PARTY_ROLE_ACCOUNT_HOLDER 					AS 	HK_HUB_PARTY_ROLE_ACCOUNT_HOLDER,
	B.HK_HUB_PARTY_ROLE_ADVISOR 						AS 	HK_HUB_PARTY_ROLE_ADVISOR,
	B.HK_LINK 											AS 	HK_LINK,
	B.INVESTMENT_PRODUCT_ID 							AS 	INVESTMENT_PRODUCT_ID,
	B.MASTER_CODE 										AS 	MASTER_CODE,
	B.MD_CREATION_AUDIT_ID 								AS 	MD_CREATION_AUDIT_ID,
	B.MD_CREATION_DT 									AS 	MD_CREATION_DT,
	B.MD_EXTRACT_DT 									AS 	MD_EXTRACT_DT,
	B.MD_SOURCE 										AS 	MD_SOURCE,
	B.MD_SRC_SYSTEM 									AS 	MD_SRC_SYSTEM,
	B.MD_START_DT 										AS 	MD_START_DT,
	B.ORD_TRANSACTION_TYPE 								AS 	ORD_TRANSACTION_TYPE,
	B.RETAIL_PLAN 										AS 	RETAIL_PLAN,
	B.TRADE_DATE 										AS 	TRADE_DATE,
	B.TRANSACTION_ID 									AS 	TRANSACTION_ID,
	B.TRANSACTION_TYPE 									AS 	TRANSACTION_TYPE
	FROM JOINER_PRODUCT_TRAN_ACCOUNT B 
	LEFT JOIN DB_IAW_''||ENV||''_DM.SHARED.DIM_PLANS A
	ON B.HK_HUB_INVESTMENT_SAVING_PROGRAM_TYPES = A.HK_HUB
	WHERE (A.MD_START_DT <= TO_DATE(''||DATA_START_DATE||'',''''YYYY-MM-DD'''') AND (A.MD_END_DT> TO_DATE(''||DATA_START_DATE||'',''''YYYY-MM-DD'''') OR A.MD_END_DT IS NULL))
	),
	JOINER_PRODUCT_TRAN_ADVISOR_PLAN_CLIENT AS (
	SELECT
	A.HK_HUB											AS 	CLT_HK_HUB,
	A.ID 												AS 	CLT_ID,
	CASE WHEN A.ID IS NULL THEN ''''-1'''' ELSE A.ID END 	AS 	O_CLIENT_ID,
	B.PLAN_HK_HUB										AS 	PLAN_HK_HUB,
	B.PLAN_ID 											AS 	PLAN_ID,
	B.O_PLAN_ID  										AS 	O_PLAN_ID,
	B.ADV_HK_HUB 										AS 	ADV_HK_HUB,
	B.ADV_ID											AS 	ADV_ID,
	B.O_ADV_ID 											AS 	O_ADV_ID,
	B.PRODUCT_HK_HUB									AS 	PRODUCT_HK_HUB,
	B.PRODUCT_ID										AS 	PRODUCT_ID,
	B.O_PRODUCT_ID										AS 	O_PRODUCT_ID,
	B.ACCOUNT_RAP_CODE 									AS 	ACCOUNT_RAP_CODE,
	B.ADMINISTRATORY_TYPE 								AS 	ADMINISTRATORY_TYPE,
	B.CASH_FLOW 										AS 	CASH_FLOW,
	B.CASH_FLOW_TYPE 									AS 	CASH_FLOW_TYPE,
	B.CLIENT_ID 										AS 	CLIENT_ID,
	B.CONTRACT_ID 										AS 	CONTRACT_ID,
	B.GROSS_AMOUNT 										AS 	GROSS_AMOUNT,
	B.HK_HUB_CONTRACT 									AS 	HK_HUB_CONTRACT,
	B.HK_HUB_INVESTMENT_PRODUCT_TYPE 					AS 	HK_HUB_INVESTMENT_PRODUCT_TYPE,
	B.HK_HUB_INVESTMENT_SAVING_PROGRAM_TYPES 			AS 	HK_HUB_INVESTMENT_SAVING_PROGRAM_TYPES,
	B.HK_HUB_PARTY_ROLE_ACCOUNT_HOLDER 					AS 	HK_HUB_PARTY_ROLE_ACCOUNT_HOLDER,
	B.HK_HUB_PARTY_ROLE_ADVISOR 						AS 	HK_HUB_PARTY_ROLE_ADVISOR,
	B.HK_LINK 											AS 	HK_LINK,
	B.INVESTMENT_PRODUCT_ID 							AS 	INVESTMENT_PRODUCT_ID,
	B.MASTER_CODE 										AS 	MASTER_CODE,
	B.MD_CREATION_AUDIT_ID 								AS 	MD_CREATION_AUDIT_ID,
	B.MD_CREATION_DT 									AS 	MD_CREATION_DT,
	B.MD_EXTRACT_DT 									AS 	MD_EXTRACT_DT,
	B.MD_SOURCE 										AS 	MD_SOURCE,
	B.MD_SRC_SYSTEM 									AS 	MD_SRC_SYSTEM,
	B.MD_START_DT 										AS 	MD_START_DT,
	B.ORD_TRANSACTION_TYPE 								AS 	ORD_TRANSACTION_TYPE,
	B.RETAIL_PLAN 										AS 	RETAIL_PLAN,
	B.TRADE_DATE 										AS 	TRADE_DATE,
	B.TRANSACTION_ID 									AS 	TRANSACTION_ID,
	B.TRANSACTION_TYPE 									AS 	TRANSACTION_TYPE
	FROM JOINER_PRODUCT_TRAN_ADVISOR_PLAN B 
	LEFT JOIN DB_IAW_''||ENV||''_DM.SHARED.DIM_CLIENTS A 
	ON B.HK_HUB_PARTY_ROLE_ACCOUNT_HOLDER = A.HK_HUB
	WHERE (A.MD_START_DT <= TO_DATE(''||DATA_START_DATE||'',''''YYYY-MM-DD'''') AND (A.MD_END_DT> TO_DATE(''||DATA_START_DATE||'',''''YYYY-MM-DD'''') OR A.MD_END_DT IS NULL))
	),
	AGG_TRANSACTION AS (
	SELECT
	SUM(GROSS_AMOUNT)										AS 	O_SUM_GROSS_AMOUNT,
	MAX(MD_START_DT)										AS 	O_MAX_MD_START_DT,
	MAX(MD_EXTRACT_DT)										AS  o_MAX_MD_EXTRACT_DT,
	MAX(MD_SOURCE)											AS 	o_MAX_MD_SOURCE,
	MAX(MD_SRC_SYSTEM)										AS 	O_MAX_MD_SRC_SYSTEM,
	HK_HUB_PARTY_ROLE_ACCOUNT_HOLDER,
	HK_HUB_PARTY_ROLE_ADVISOR,
	HK_HUB_INVESTMENT_SAVING_PROGRAM_TYPES,
	HK_HUB_INVESTMENT_PRODUCT_TYPE,
	O_CLIENT_ID,
	O_ADV_ID,
	O_PLAN_ID,
	O_PRODUCT_ID,
	TRADE_DATE,
	CASH_FLOW,
	CASH_FLOW_TYPE,
	ADMINISTRATORY_TYPE
	FROM JOINER_PRODUCT_TRAN_ADVISOR_PLAN_CLIENT 
	GROUP BY HK_HUB_PARTY_ROLE_ACCOUNT_HOLDER,HK_HUB_PARTY_ROLE_ADVISOR,HK_HUB_INVESTMENT_SAVING_PROGRAM_TYPES,HK_HUB_INVESTMENT_PRODUCT_TYPE,O_CLIENT_ID,O_ADV_ID,O_PLAN_ID,O_PRODUCT_ID,TRADE_DATE,CASH_FLOW,CASH_FLOW_TYPE,ADMINISTRATORY_TYPE
	)
	SELECT 
	O_MAX_MD_START_DT,
	O_MAX_MD_SOURCE,
	O_MAX_MD_SRC_SYSTEM,
	O_MAX_MD_EXTRACT_DT,
	HK_HUB_PARTY_ROLE_ACCOUNT_HOLDER,
	HK_HUB_PARTY_ROLE_ADVISOR,
	HK_HUB_INVESTMENT_SAVING_PROGRAM_TYPES,
	HK_HUB_INVESTMENT_PRODUCT_TYPE,
	O_CLIENT_ID,
	O_ADV_ID,
	O_PLAN_ID,
	O_PRODUCT_ID,
	TRADE_DATE,
	O_SUM_GROSS_AMOUNT,
	CASH_FLOW,
	CASH_FLOW_TYPE,
	ADMINISTRATORY_TYPE
	FROM AGG_TRANSACTION)'';
UPD_QUERY := ''UPDATE DB_IAW_''||ENV||''_DM.TRANSACTIONS.WT_FACT_TRANSACTIONS
SET
HK_LINK = SHA1(UPPER(CONCAT(
	  COALESCE(TRIM(MD_SRC_SYSTEM), ''''NULL''''), ''''|''''
	, COALESCE(TRIM(HK_HUB_PARTY_ROLE_ACCOUNT_HOLDER), ''''NULL''''), ''''|''''
	, COALESCE(TRIM(HK_HUB_PARTY_ROLE_ADVISOR), ''''NULL''''), ''''|''''
	, COALESCE(TRIM(HK_HUB_INVESTMENT_SAVING_PROGRAM_TYPES), ''''NULL''''), ''''|''''
	, COALESCE(TRIM(HK_HUB_INVESTMENT_PRODUCT_TYPE), ''''NULL''''), ''''|''''
	, COALESCE(TRIM(TRADE_DATE), ''''NULL''''), ''''|''''
	, COALESCE(TRIM(CASH_FLOW), ''''NULL''''), ''''|''''
	, COALESCE(TRIM(CASH_FLOW_TYPE), ''''NULL''''), ''''|''''
	, COALESCE(TRIM(ADMINISTRATORY_TYPE), ''''NULL'''')
	)))
Where 1=1'';
EXECUTE IMMEDIATE :TRUNC_QUERY;
EXECUTE IMMEDIATE :INS_QUERY;
EXECUTE IMMEDIATE :UPD_QUERY;
END

';
CREATE OR REPLACE PROCEDURE DB_IAW_#env#_DM.TRANSACTIONS.SP_CONV_LOADDM_BDV_TRANSACTION_TO_DM_WT_FACT_TRANSACTIONS_UNIVERIS("ENV" VARCHAR(1000), "I_DATA_START_DATE" VARCHAR(1000))
RETURNS VARCHAR(16777216)
LANGUAGE SQL
EXECUTE AS OWNER
AS '
DECLARE
INS_PRE_DEL STRING;
INS_INSERT STRING;
INS_UPDATE STRING;

BEGIN
i_DATA_START_DATE :=CHAR(39)||i_DATA_START_DATE||CHAR(39);
INS_PRE_DEL := ''TRUNCATE TABLE DB_IAW_''||ENV||''_DM.TRANSACTIONS.WT_FACT_TRANSACTIONS  '';
INS_INSERT := ''
INSERT INTO DB_IAW_''||ENV||''_DM.TRANSACTIONS.WT_FACT_TRANSACTIONS(
MD_START_DT	
,MD_SOURCE	
,MD_SRC_SYSTEM	
,MD_EXTRACT_DT	 	
,HK_HUB_PARTY_ROLE_ACCOUNT_HOLDER		
,HK_HUB_PARTY_ROLE_ADVISOR
,HK_HUB_INVESTMENT_SAVING_PROGRAM_TYPES		
,HK_HUB_INVESTMENT_PRODUCT_TYPE		
,SK_DIM_CLIENTS		
,SK_DIM_ADVISORS		
,SK_DIM_PLANS	
,SK_DIM_MARKETPRODUCTS		
,TRADE_DATE		
,GROSS_AMOUNT		
,CASH_FLOW		
,CASH_FLOW_TYPE	
,ADMINISTRATORY_TYPE
)
SELECT
MAX(TR.MD_START_DT)	
,MAX(TR.MD_SOURCE)	
,MAX(TR.MD_SRC_SYSTEM)	
,MAX(TR.MD_EXTRACT_DT)	 	
,TR.HK_HUB_PARTY_ROLE_ACCOUNT_HOLDER	
,TR.HK_HUB_PARTY_ROLE_ADVISOR	
,TR.HK_HUB_INVESTMENT_SAVING_PROGRAM_TYPES	
,TR.HK_HUB_INVESTMENT_PRODUCT_TYPE	
,TR.o_CLIENT_ID	
,TR.o_ADV_ID	
,TR.o_PLAN_ID
,TR.o_PRODUCT_ID	
,TR.TRADE_DATE	
,SUM(TR.GROSS_AMOUNT)	
,TR.CASH_FLOW	
,TR.CASH_FLOW_TYPE	
,TR.ADMINISTRATORY_TYPE
FROM
(
SELECT * FROM (SELECT * FROM DB_IAW_''||ENV||''_DWH.TRANSACTIONS_BDV.TRANSLINK_FINANCIAL_TRANSACTION WHERE MD_START_DT <= TO_DATE(''||i_DATA_START_DATE||'',''''YYYY-MM-DD'''') AND (MD_SRC_SYSTEM = ''''IAS-UNIVERIS'''')) TRF
LEFT JOIN
(SELECT HK_LINK FROM DB_IAW_''||ENV||''_DM.TRANSACTIONS.FACT_TRANSACTIONS ) FACT
ON TRF.HK_LINK = FACT.HK_LINK
LEFT JOIN
(SELECT (CASE WHEN ID IS NULL THEN -1 ELSE ID END) o_PRODUCT_ID, HK_HUB  FROM (SELECT * FROM DB_IAW_''||ENV||''_DM.SHARED.DIM_FINANCIAL_INSTRUMENTS WHERE (MD_START_DT <= TO_DATE(''||i_DATA_START_DATE||'',''''YYYY-MM-DD'''') AND (MD_END_DT> TO_DATE(''||i_DATA_START_DATE||'',''''YYYY-MM-DD'''') OR (MD_END_DT IS NULL)))) PROD ) PROD
ON TRF.HK_HUB_INVESTMENT_PRODUCT_TYPE = PROD.HK_HUB
LEFT JOIN
(SELECT (CASE WHEN ID IS NULL THEN -1 ELSE ID END) O_ADV_ID , HK_HUB  FROM (SELECT * FROM DB_IAW_''||ENV||''_DM.SHARED.DIM_ADVISOR WHERE (MD_START_DT <= TO_DATE(''||i_DATA_START_DATE||'',''''YYYY-MM-DD'''') AND (MD_END_DT> TO_DATE(''||i_DATA_START_DATE||'',''''YYYY-MM-DD'''') OR (MD_END_DT IS NULL)))) ADV) ADV
ON TRF.HK_HUB_PARTY_ROLE_ADVISOR = ADV.HK_HUB
LEFT JOIN
(SELECT (CASE WHEN ID IS NULL THEN -1 ELSE ID END) O_PLAN_ID , HK_HUB  FROM (SELECT * FROM DB_IAW_''||ENV||''_DM.SHARED.DIM_PLANS WHERE (MD_START_DT <= TO_DATE(''||i_DATA_START_DATE||'',''''YYYY-MM-DD'''') AND (MD_END_DT> TO_DATE(''||i_DATA_START_DATE||'',''''YYYY-MM-DD'''') OR (MD_END_DT IS NULL)))) PLN) PLN
ON TRF.HK_HUB_INVESTMENT_SAVING_PROGRAM_TYPES= PLN.HK_HUB
LEFT JOIN
(SELECT (CASE WHEN ID IS NULL THEN -1 ELSE ID END) O_CLIENT_ID , HK_HUB  FROM (SELECT * FROM DB_IAW_''||ENV||''_DM.SHARED.DIM_CLIENTS WHERE (MD_START_DT <= TO_DATE(''||i_DATA_START_DATE||'',''''YYYY-MM-DD'''') AND (MD_END_DT> TO_DATE(''||i_DATA_START_DATE||'',''''YYYY-MM-DD'''') OR (MD_END_DT IS NULL)))) CLT) CLT
ON TRF.HK_HUB_PARTY_ROLE_ACCOUNT_HOLDER = CLT.HK_HUB
WHERE FACT.HK_LINK IS NULL)TR 

GROUP BY (TR.HK_HUB_PARTY_ROLE_ACCOUNT_HOLDER,TR.HK_HUB_PARTY_ROLE_ADVISOR,TR.HK_HUB_INVESTMENT_SAVING_PROGRAM_TYPES,TR.HK_HUB_INVESTMENT_PRODUCT_TYPE,TR.o_CLIENT_ID,TR.o_ADV_ID,TR.o_PLAN_ID,TR.o_PRODUCT_ID,TR.TRADE_DATE,TR.CASH_FLOW,TR.CASH_FLOW_TYPE,TR.ADMINISTRATORY_TYPE)	
              '';
INS_UPDATE :='' UPDATE DB_IAW_''||ENV||''_DM.TRANSACTIONS.WT_FACT_TRANSACTIONS
SET 
HK_LINK = SHA1(UPPER(CONCAT(
	  COALESCE(TRIM(MD_SRC_SYSTEM), ''''#NULL#''''), ''''|'''' 
	, COALESCE(TRIM(HK_HUB_PARTY_ROLE_ACCOUNT_HOLDER), ''''#NULL#''''), ''''|'''' 
	, COALESCE(TRIM(HK_HUB_PARTY_ROLE_ADVISOR), ''''#NULL#''''), ''''|'''' 
	, COALESCE(TRIM(HK_HUB_INVESTMENT_SAVING_PROGRAM_TYPES), ''''#NULL#''''), ''''|'''' 
	, COALESCE(TRIM(HK_HUB_INVESTMENT_PRODUCT_TYPE), ''''#NULL#''''), ''''|'''' 
	, COALESCE(TRIM(TRADE_DATE), ''''#NULL#''''), ''''|'''' 
	, COALESCE(TRIM(CASH_FLOW), ''''#NULL#''''), ''''|'''' 
	, COALESCE(TRIM(CASH_FLOW_TYPE), ''''#NULL#''''), ''''|'''' 
	, COALESCE(TRIM(ADMINISTRATORY_TYPE), ''''#NULL#'''')
	)))
Where 1=1;
'';
EXECUTE IMMEDIATE :INS_PRE_DEL;
EXECUTE IMMEDIATE :INS_INSERT;
EXECUTE IMMEDIATE :INS_UPDATE;

END
';
CREATE OR REPLACE PROCEDURE DB_IAW_#env#_DM.TRANSACTIONS.SP_CONV_M_LOADDM_BDV_TRANSACTIONS_TO_DM_WT_FACT_TRANSACTIONS("ENV" VARCHAR(1000))
RETURNS VARCHAR(16777216)
LANGUAGE SQL
EXECUTE AS OWNER
AS '
DECLARE
TRUNC_QUERY STRING;
INS_QUERY STRING;
UPD_QUERY STRING;
BEGIN
DATA_START_DATE :=CHAR(39)||DATA_START_DATE||CHAR(39);
TRUNC_QUERY := ''TRUNCATE TABLE  DB_IAW_''||ENV||''_DM.TRANSACTIONS.WT_FACT_TRANSACTIONS'';
INS_QUERY := ''INSERT INTO DB_IAW_''||ENV||''_DM.TRANSACTIONS.WT_FACT_TRANSACTIONS
MD_START_DT,
MD_SOURCE,
MD_SRC_SYSTEM,
MD_EXTRACT_DT,
HK_HUB_PARTY_ROLE_ACCOUNT_HOLDER,
HK_HUB_PARTY_ROLE_ADVISOR,
HK_HUB_INVESTMENT_SAVING_PROGRAM_TYPES,
HK_HUB_INVESTMENT_PRODUCT_TYPE,
SK_DIM_CLIENTS,
SK_DIM_ADVISORS,
SK_DIM_PLANS,
SK_DIM_MARKETPRODUCTS,
TRADE_DATE,
GROSS_AMOUNT,
CASH_FLOW,
CASH_FLOW_TYPE,
ADMINISTRATORY_TYPE)
(WITH 
	JNR_BDVLINKTRANS_LEFTJOIN_FACTTRANS AS (
	SELECT
	A.HK_LINK 										AS 	fact_HK_LINK,
	B.ACCOUNT_RAP_CODE 								AS 	ACCOUNT_RAP_CODE,
	B.ADMINISTRATORY_TYPE 							AS 	ADMINISTRATORY_TYPE,
	B.CASH_FLOW 									AS 	CASH_FLOW,
	B.CASH_FLOW_TYPE 								AS 	CASH_FLOW_TYPE,
	B.CLIENT_ID 									AS 	CLIENT_ID,
	B.CONTRACT_ID 									AS 	CONTRACT_ID,
	B.GROSS_AMOUNT 									AS 	GROSS_AMOUNT,
	B.HK_HUB_CONTRACT 								AS 	HK_HUB_CONTRACT,
	B.HK_HUB_INVESTMENT_PRODUCT_TYPE 				AS 	HK_HUB_INVESTMENT_PRODUCT_TYPE,
	B.HK_HUB_INVESTMENT_SAVING_PROGRAM_TYPES 		AS 	HK_HUB_INVESTMENT_SAVING_PROGRAM_TYPES,
	B.HK_HUB_PARTY_ROLE_ACCOUNT_HOLDER 				AS 	HK_HUB_PARTY_ROLE_ACCOUNT_HOLDER,
	B.HK_HUB_PARTY_ROLE_ADVISOR 					AS 	HK_HUB_PARTY_ROLE_ADVISOR,
	B.HK_LINK 										AS 	HK_LINK,
	B.INVESTMENT_PRODUCT_ID 						AS 	INVESTMENT_PRODUCT_ID,
	B.MASTER_CODE 									AS 	MASTER_CODE,
	B.MD_CREATION_AUDIT_ID 							AS 	MD_CREATION_AUDIT_ID,
	B.MD_CREATION_DT 								AS 	MD_CREATION_DT,
	B.MD_EXTRACT_DT 								AS 	MD_EXTRACT_DT,
	B.MD_SOURCE 									AS 	MD_SOURCE,
	B.MD_SRC_SYSTEM 								AS 	MD_SRC_SYSTEM,
	B.MD_START_DT 									AS 	MD_START_DT,
	B.ORD_TRANSACTION_TYPE 							AS 	ORD_TRANSACTION_TYPE,
	B.RETAIL_PLAN 									AS 	RETAIL_PLAN,
	B.TRADE_DATE 									AS 	TRADE_DATE,
	B.TRANSACTION_ID 								AS 	TRANSACTION_ID,
	B.TRANSACTION_TYPE								AS 	TRANSACTION_TYPE
	FROM DB_IAW_''||ENV||''_DWH.TRANSACTIONS_BDV.TRANSLINK_FINANCIAL_TRANSACTION B 
	LEFT JOIN DB_IAW_''||ENV||''_DM.TRANSACTIONS.FACT_TRANSACTIONS A 
	ON B.HK_LINK = A.HK_LINK
	WHERE B.MD_START_DT <= TO_DATE(''||DATA_START_DATE||'',''''YYYY-MM-DD'''')
	),
	Joiner_TRAN_PRODUCT AS (
	SELECT 
	A.HK_HUB 											AS 	Product_HK_HUB,
	A.ID 												AS 	Product_ID,
	CASE WHEN A.ID IS NULL THEN ''''-1'''' ELSE A.ID END 	AS 	O_PRODUCT_ID,
	B.ACCOUNT_RAP_CODE 									AS 	ACCOUNT_RAP_CODE,
	B.ADMINISTRATORY_TYPE 								AS 	ADMINISTRATORY_TYPE,
	B.CASH_FLOW 										AS 	CASH_FLOW,
	B.CASH_FLOW_TYPE 									AS 	CASH_FLOW_TYPE,
	B.CLIENT_ID 										AS 	CLIENT_ID,
	B.CONTRACT_ID 										AS 	CONTRACT_ID,
	B.fact_HK_LINK 										AS 	fact_HK_LINK,
	B.GROSS_AMOUNT 										AS 	GROSS_AMOUNT,
	B.HK_HUB_CONTRACT 									AS 	HK_HUB_CONTRACT,
	B.HK_HUB_INVESTMENT_PRODUCT_TYPE 					AS 	HK_HUB_INVESTMENT_PRODUCT_TYPE,
	B.HK_HUB_INVESTMENT_SAVING_PROGRAM_TYPES 			AS 	HK_HUB_INVESTMENT_SAVING_PROGRAM_TYPES,
	B.HK_HUB_PARTY_ROLE_ACCOUNT_HOLDER 					AS 	HK_HUB_PARTY_ROLE_ACCOUNT_HOLDER,
	B.HK_HUB_PARTY_ROLE_ADVISOR 						AS 	HK_HUB_PARTY_ROLE_ADVISOR,
	B.HK_LINK 											AS 	HK_LINK,
	B.INVESTMENT_PRODUCT_ID 							AS 	INVESTMENT_PRODUCT_ID,
	B.MASTER_CODE 										AS 	MASTER_CODE,
	B.MD_CREATION_AUDIT_ID 								AS 	MD_CREATION_AUDIT_ID,
	B.MD_CREATION_DT 									AS 	MD_CREATION_DT,
	B.MD_EXTRACT_DT 									AS 	MD_EXTRACT_DT,
	B.MD_SOURCE 										AS 	MD_SOURCE,
	B.MD_SRC_SYSTEM 									AS 	MD_SRC_SYSTEM,
	B.MD_START_DT 										AS 	MD_START_DT,
	B.ORD_TRANSACTION_TYPE 								AS 	ORD_TRANSACTION_TYPE,
	B.RETAIL_PLAN 										AS 	RETAIL_PLAN,
	B.TRADE_DATE 										AS 	TRADE_DATE,
	B.TRANSACTION_ID 									AS 	TRANSACTION_ID,
	B.TRANSACTION_TYPE 									AS 	TRANSACTION_TYPE
	FROM JNR_BDVLINKTRANS_LEFTJOIN_FACTTRANS B 
	LEFT JOIN DB_IAW_''||ENV||''_DM.SHARED.DIM_FINANCIAL_INSTRUMENTS A
	ON B.HK_HUB_INVESTMENT_PRODUCT_TYPE = A.HK_HUB
	WHERE (A.MD_START_DT <= TO_DATE(''||DATA_START_DATE||'',''''YYYY-MM-DD'''') AND (A.MD_END_DT> TO_DATE(''||DATA_START_DATE||'',''''YYYY-MM-DD'''') OR A.MD_END_DT IS NULL))
	),
	Joiner_PRODUCT_TRAN_ACCOUNT AS (
	SELECT
		A.HK_HUB 												AS 	ADV_HK_HUB,
		A.ID													AS 	ADV_ID,
		CASE WHEN A.ID IS NULL THEN ''''-1'''' ELSE A.ID END 		AS 	O_ADV_ID,
		B.Product_HK_HUB 										AS 	Product_HK_HUB,
		B.Product_ID 											AS 	Product_ID,
		B.O_PRODUCT_ID 											AS 	O_PRODUCT_ID,
		B.ACCOUNT_RAP_CODE 										AS 	ACCOUNT_RAP_CODE,
		B.ADMINISTRATORY_TYPE 									AS 	ADMINISTRATORY_TYPE,
		B.CASH_FLOW 											AS 	CASH_FLOW,
		B.CASH_FLOW_TYPE 										AS 	CASH_FLOW_TYPE,
		B.CLIENT_ID 											AS 	CLIENT_ID,
		B.CONTRACT_ID 											AS 	CONTRACT_ID,
		B.fact_HK_LINK 											AS 	fact_HK_LINK,
		B.GROSS_AMOUNT 											AS 	GROSS_AMOUNT,
		B.HK_HUB_CONTRACT 										AS 	HK_HUB_CONTRACT,
		B.HK_HUB_INVESTMENT_PRODUCT_TYPE	 					AS 	HK_HUB_INVESTMENT_PRODUCT_TYPE,
		B.HK_HUB_INVESTMENT_SAVING_PROGRAM_TYPES 				AS 	HK_HUB_INVESTMENT_SAVING_PROGRAM_TYPES,
		B.HK_HUB_PARTY_ROLE_ACCOUNT_HOLDER 						AS 	HK_HUB_PARTY_ROLE_ACCOUNT_HOLDER,
		B.HK_HUB_PARTY_ROLE_ADVISOR 							AS 	HK_HUB_PARTY_ROLE_ADVISOR,
		B.HK_LINK 												AS 	HK_LINK,
		B.INVESTMENT_PRODUCT_ID 								AS 	INVESTMENT_PRODUCT_ID,
		B.MASTER_CODE 											AS 	MASTER_CODE,
		B.MD_CREATION_AUDIT_ID 									AS 	MD_CREATION_AUDIT_ID,
		B.MD_CREATION_DT 										AS 	MD_CREATION_DT,
		B.MD_EXTRACT_DT 										AS 	MD_EXTRACT_DT,
		B.MD_SOURCE 											AS 	MD_SOURCE,
		B.MD_SRC_SYSTEM 										AS 	MD_SRC_SYSTEM,
		B.MD_START_DT 											AS 	MD_START_DT,
		B.ORD_TRANSACTION_TYPE 									AS 	ORD_TRANSACTION_TYPE,
		B.RETAIL_PLAN 											AS 	RETAIL_PLAN,
		B.TRADE_DATE 											AS 	TRADE_DATE,
		B.TRANSACTION_ID 										AS 	TRANSACTION_ID,
		B.TRANSACTION_TYPE 										AS 	TRANSACTION_TYPE
		FROM Joiner_TRAN_PRODUCT B
		LEFT JOIN DB_IAW_''||ENV||''_DM.SHARED.DIM_ADVISOR A
		ON B.HK_HUB_PARTY_ROLE_ADVISOR = A.HK_HUB
		WHERE (A.MD_START_DT <= TO_DATE(''||DATA_START_DATE||'',''''YYYY-MM-DD'''') AND (A.MD_END_DT> TO_DATE(''||DATA_START_DATE||'',''''YYYY-MM-DD'''') OR A.MD_END_DT IS NULL))
		),
		Joiner_PRODUCT_TRAN_ADVISOR_PLAN AS (
		SELECT
		A.HK_HUB												AS 	PLAN_HK_HUB,
		A.ID 													AS 	PLAN_ID,
		CASE WHEN A.ID IS NULL THEN ''''-1'''' ELSE A.ID END 		AS 	O_PLAN_ID,
		B.ADV_HK_HUB											AS 	ADV_HK_HUB,
		B.ADV_ID 												AS 	ADV_ID,
		B.O_ADV_ID 												AS 	O_ADV_ID,
		B.Product_HK_HUB 										AS 	Product_HK_HUB,
		B.Product_ID 											AS 	Product_ID,
		B.O_PRODUCT_ID 											AS 	O_PRODUCT_ID,
		B.ACCOUNT_RAP_CODE 										AS 	ACCOUNT_RAP_CODE,
		B.ADMINISTRATORY_TYPE 									AS 	ADMINISTRATORY_TYPE,
		B.CASH_FLOW 											AS 	CASH_FLOW,
		B.CASH_FLOW_TYPE 										AS 	CASH_FLOW_TYPE,
		B.CLIENT_ID 											AS 	CLIENT_ID,
		B.CONTRACT_ID 											AS 	CONTRACT_ID,
		B.fact_HK_LINK 											AS 	fact_HK_LINK,
		B.GROSS_AMOUNT 											AS 	GROSS_AMOUNT,
		B.HK_HUB_CONTRACT 										AS 	HK_HUB_CONTRACT,
		B.HK_HUB_INVESTMENT_PRODUCT_TYPE	 					AS 	HK_HUB_INVESTMENT_PRODUCT_TYPE,
		B.HK_HUB_INVESTMENT_SAVING_PROGRAM_TYPES 				AS 	HK_HUB_INVESTMENT_SAVING_PROGRAM_TYPES,
		B.HK_HUB_PARTY_ROLE_ACCOUNT_HOLDER 						AS 	HK_HUB_PARTY_ROLE_ACCOUNT_HOLDER,
		B.HK_HUB_PARTY_ROLE_ADVISOR 							AS 	HK_HUB_PARTY_ROLE_ADVISOR,
		B.HK_LINK 												AS 	HK_LINK,
		B.INVESTMENT_PRODUCT_ID 								AS 	INVESTMENT_PRODUCT_ID,
		B.MASTER_CODE 											AS 	MASTER_CODE,
		B.MD_CREATION_AUDIT_ID 									AS 	MD_CREATION_AUDIT_ID,
		B.MD_CREATION_DT 										AS 	MD_CREATION_DT,
		B.MD_EXTRACT_DT 										AS 	MD_EXTRACT_DT,
		B.MD_SOURCE 											AS 	MD_SOURCE,
		B.MD_SRC_SYSTEM 										AS 	MD_SRC_SYSTEM,
		B.MD_START_DT 											AS 	MD_START_DT,
		B.ORD_TRANSACTION_TYPE 									AS 	ORD_TRANSACTION_TYPE,
		B.RETAIL_PLAN 											AS 	RETAIL_PLAN,
		B.TRADE_DATE 											AS 	TRADE_DATE,
		B.TRANSACTION_ID 										AS 	TRANSACTION_ID,
		B.TRANSACTION_TYPE 										AS 	TRANSACTION_TYPE
		FROM Joiner_PRODUCT_TRAN_ACCOUNT B
		LEFT JOIN DB_IAW_''||ENV||''_DM.SHARED.DIM_PLANS A
		ON B.HK_HUB_INVESTMENT_SAVING_PROGRAM_TYPES = A.HK_HUB
		WHERE (A.MD_START_DT <= TO_DATE(''||DATA_START_DATE||'',''''YYYY-MM-DD'''') AND (A.MD_END_DT> TO_DATE(''||DATA_START_DATE||'',''''YYYY-MM-DD'''') OR A.MD_END_DT IS NULL))
		),
		Joiner_PRODUCT_TRAN_ADVISOR_PLAN_CLIENT AS (
		SELECT
		A.HK_HUB												AS 	CLT_HK_HUB,
		A.ID 													AS 	CLT_ID,
		CASE WHEN A.ID IS NULL THEN ''''-1'''' ELSE A.ID END 		AS 	O_CLT_ID,
		B.PLAN_HK_HUB 											AS 	PLAN_HK_HUB,
		B.PLAN_ID 												AS 	PLAN_ID,
		B.O_PLAN_ID 											AS 	O_PLAN_ID,
		B.ADV_HK_HUB											AS 	ADV_HK_HUB,
		B.ADV_ID 												AS 	ADV_ID,
		B.O_ADV_ID 												AS 	O_ADV_ID,
		B.Product_HK_HUB 										AS 	PRODUCT_HK_HUB,
		B.Product_ID 											AS 	PRODUCT_ID,
		B.O_PRODUCT_ID 											AS 	O_PRODUCT_ID,
		B.ACCOUNT_RAP_CODE 										AS 	ACCOUNT_RAP_CODE,
		B.ADMINISTRATORY_TYPE 									AS 	ADMINISTRATORY_TYPE,
		B.CASH_FLOW 											AS 	CASH_FLOW,
		B.CASH_FLOW_TYPE 										AS 	CASH_FLOW_TYPE,
		B.CLIENT_ID 											AS 	CLIENT_ID,
		B.CONTRACT_ID 											AS 	CONTRACT_ID,
		B.fact_HK_LINK 											AS 	FACT_HK_LINK,
		B.GROSS_AMOUNT 											AS 	GROSS_AMOUNT,
		B.HK_HUB_CONTRACT 										AS 	HK_HUB_CONTRACT,
		B.HK_HUB_INVESTMENT_PRODUCT_TYPE	 					AS 	HK_HUB_INVESTMENT_PRODUCT_TYPE,
		B.HK_HUB_INVESTMENT_SAVING_PROGRAM_TYPES 				AS 	HK_HUB_INVESTMENT_SAVING_PROGRAM_TYPES,
		B.HK_HUB_PARTY_ROLE_ACCOUNT_HOLDER 						AS 	HK_HUB_PARTY_ROLE_ACCOUNT_HOLDER,
		B.HK_HUB_PARTY_ROLE_ADVISOR 							AS 	HK_HUB_PARTY_ROLE_ADVISOR,
		B.HK_LINK 												AS 	HK_LINK,
		B.INVESTMENT_PRODUCT_ID 								AS 	INVESTMENT_PRODUCT_ID,
		B.MASTER_CODE 											AS 	MASTER_CODE,
		B.MD_CREATION_AUDIT_ID 									AS 	MD_CREATION_AUDIT_ID,
		B.MD_CREATION_DT 										AS 	MD_CREATION_DT,
		B.MD_EXTRACT_DT 										AS 	MD_EXTRACT_DT,
		B.MD_SOURCE 											AS 	MD_SOURCE,
		B.MD_SRC_SYSTEM 										AS 	MD_SRC_SYSTEM,
		B.MD_START_DT 											AS 	MD_START_DT,
		B.ORD_TRANSACTION_TYPE 									AS 	ORD_TRANSACTION_TYPE,
		B.RETAIL_PLAN 											AS 	RETAIL_PLAN,
		B.TRADE_DATE 											AS 	TRADE_DATE,
		B.TRANSACTION_ID 										AS 	TRANSACTION_ID,
		B.TRANSACTION_TYPE 										AS 	TRANSACTION_TYPE
		FROM Joiner_PRODUCT_TRAN_ADVISOR_PLAN B
		LEFT JOIN DB_IAW_''||ENV||''_DM.SHARED.DIM_CLIENTS A 
		ON B.HK_HUB_PARTY_ROLE_ACCOUNT_HOLDER = A.HK_HUB
		WHERE (A.MD_START_DT <= TO_DATE(''||DATA_START_DATE||'',''''YYYY-MM-DD'''') AND (A.MD_END_DT> TO_DATE(''||DATA_START_DATE||'',''''YYYY-MM-DD'''') OR A.MD_END_DT IS NULL))
		),
		Agg_Transaction AS (
		SELECT 
		SUM(GROSS_AMOUNT)										AS 	O_SUM_GROSS_AMOUNT,
		MAX(MD_START_DT)										AS 	O_MAX_MD_START_DT,
		MAX(MD_EXTRACT_DT)										AS  o_MAX_MD_EXTRACT_DT,
		MAX(MD_SOURCE)											AS 	o_MAX_MD_SOURCE,
		MAX(MD_SRC_SYSTEM)										AS 	O_MAX_MD_SRC_SYSTEM,
		CLT_HK_HUB,
		CLT_ID,
		O_CLT_ID,
		PLAN_HK_HUB,
		PLAN_ID,
		O_PLAN_ID,
		ADV_HK_HUB,
		ADV_ID,
		O_ADV_ID,
		Product_HK_HUB,
		Product_ID,
		O_PRODUCT_ID,
		ACCOUNT_RAP_CODE,
		ADMINISTRATORY_TYPE,
		CASH_FLOW,
		CASH_FLOW_TYPE,
		CLIENT_ID,
		CONTRACT_ID,
		fact_HK_LINK,
		GROSS_AMOUNT,
		HK_HUB_CONTRACT,
		HK_HUB_INVESTMENT_PRODUCT_TYPE,
		HK_HUB_INVESTMENT_SAVING_PROGRAM_TYPES,
		HK_HUB_PARTY_ROLE_ACCOUNT_HOLDER,
		HK_HUB_PARTY_ROLE_ADVISOR,
		HK_LINK,
		INVESTMENT_PRODUCT_ID,
		MASTER_CODE,
		MD_CREATION_AUDIT_ID,
		MD_CREATION_DT,
		MD_EXTRACT_DT,
		MD_SOURCE,
		MD_SRC_SYSTEM,
		MD_START_DT,
		ORD_TRANSACTION_TYPE,
		RETAIL_PLAN,
		TRADE_DATE,
		TRANSACTION_ID,
		TRANSACTION_TYPE
		FROM Joiner_PRODUCT_TRAN_ADVISOR_PLAN_CLIENT
		GROUP BY CLT_HK_HUB,CLT_ID,O_CLT_ID,PLAN_HK_HUB,PLAN_ID,O_PLAN_ID,ADV_HK_HUB,ADV_ID,O_ADV_ID,PRODUCT_HK_HUB,PRODUCT_ID,O_PRODUCT_ID,ACCOUNT_RAP_CODE,ADMINISTRATORY_TYPE,CASH_FLOW,CASH_FLOW_TYPE,CLIENT_ID,CONTRACT_ID,FACT_HK_LINK,GROSS_AMOUNT,HK_HUB_CONTRACT,HK_HUB_INVESTMENT_PRODUCT_TYPE,HK_HUB_INVESTMENT_SAVING_PROGRAM_TYPES,HK_HUB_PARTY_ROLE_ACCOUNT_HOLDER,HK_HUB_PARTY_ROLE_ADVISOR,HK_LINK,INVESTMENT_PRODUCT_ID,MASTER_CODE,MD_CREATION_AUDIT_ID,MD_CREATION_DT,MD_EXTRACT_DT,MD_SOURCE,MD_SRC_SYSTEM,MD_START_DT,ORD_TRANSACTION_TYPE,RETAIL_PLAN,TRADE_DATE,TRANSACTION_ID,TRANSACTION_TYPE
		)
		SELECT
		O_MAX_MD_START_DT,
		O_MAX_MD_SOURCE,
		O_MAX_MD_SRC_SYSTEM,
		O_MAX_MD_EXTRACT_DT,
		HK_HUB_PARTY_ROLE_ACCOUNT_HOLDER,
		HK_HUB_PARTY_ROLE_ADVISOR,
		HK_HUB_INVESTMENT_SAVING_PROGRAM_TYPES,
		HK_HUB_INVESTMENT_PRODUCT_TYPE,
		O_CLT_ID,
		O_ADV_ID,
		O_PLAN_ID,
		O_PRODUCT_ID,
		TRADE_DATE,
		O_SUM_GROSS_AMOUNT,
		CASH_FLOW,
		CASH_FLOW_TYPE,
		ADMINISTRATORY_TYPE
		FROM Agg_Transaction)'';
UPD_QUERY := ''UPDATE DB_IAW_''||ENV||''_DM.TRANSACTIONS.WT_FACT_TRANSACTIONS
SET
HK_LINK = SHA1(UPPER(CONCAT(
	  COALESCE(TRIM(MD_SRC_SYSTEM), ''''NULL''''), ''''|''''
	, COALESCE(TRIM(HK_HUB_PARTY_ROLE_ACCOUNT_HOLDER), ''''NULL''''), ''''|''''
	, COALESCE(TRIM(HK_HUB_PARTY_ROLE_ADVISOR), ''''NULL''''), ''''|''''
	, COALESCE(TRIM(HK_HUB_INVESTMENT_SAVING_PROGRAM_TYPES), ''''NULL''''), ''''|''''
	, COALESCE(TRIM(HK_HUB_INVESTMENT_PRODUCT_TYPE), ''''NULL''''), ''''|''''
	, COALESCE(TRIM(TRADE_DATE), ''''NULL''''), ''''|''''
	, COALESCE(TRIM(CASH_FLOW), ''''NULL''''), ''''|''''
	, COALESCE(TRIM(CASH_FLOW_TYPE), ''''NULL''''), ''''|''''
	, COALESCE(TRIM(ADMINISTRATORY_TYPE), ''''NULL'''')
	)))
Where 1=1'';
EXECUTE IMMEDIATE :TRUNC_QUERY;
EXECUTE IMMEDIATE :INS_QUERY;
EXECUTE IMMEDIATE :UPD_QUERY;
END

';
CREATE OR REPLACE PROCEDURE DB_IAW_#env#_DM.TRANSACTIONS.SP_CONV_M_LOADDM_BDV_TRANSACTIONS_TO_DM_WT_FACT_TRANSACTIONS("ENV" VARCHAR(1000), "DATA_START_DATE" VARCHAR(20))
RETURNS VARCHAR(16777216)
LANGUAGE SQL
EXECUTE AS OWNER
AS '
DECLARE
TRUNC_QUERY STRING;
INS_QUERY STRING;
UPD_QUERY STRING;
BEGIN
DATA_START_DATE :=CHAR(39)||DATA_START_DATE||CHAR(39);
TRUNC_QUERY := ''TRUNCATE TABLE  DB_IAW_''||ENV||''_DM.TRANSACTIONS.WT_FACT_TRANSACTIONS'';
INS_QUERY := ''INSERT INTO DB_IAW_''||ENV||''_DM.TRANSACTIONS.WT_FACT_TRANSACTIONS(
MD_START_DT,
MD_SOURCE,
MD_SRC_SYSTEM,
MD_EXTRACT_DT,
HK_HUB_PARTY_ROLE_ACCOUNT_HOLDER,
HK_HUB_PARTY_ROLE_ADVISOR,
HK_HUB_INVESTMENT_SAVING_PROGRAM_TYPES,
HK_HUB_INVESTMENT_PRODUCT_TYPE,
SK_DIM_CLIENTS,
SK_DIM_ADVISORS,
SK_DIM_PLANS,
SK_DIM_MARKETPRODUCTS,
TRADE_DATE,
GROSS_AMOUNT,
CASH_FLOW,
CASH_FLOW_TYPE,
ADMINISTRATORY_TYPE)
(WITH 
	JNR_BDVLINKTRANS_LEFTJOIN_FACTTRANS AS (
	SELECT
	A.HK_LINK 										AS 	fact_HK_LINK,
	B.ACCOUNT_RAP_CODE 								AS 	ACCOUNT_RAP_CODE,
	B.ADMINISTRATORY_TYPE 							AS 	ADMINISTRATORY_TYPE,
	B.CASH_FLOW 									AS 	CASH_FLOW,
	B.CASH_FLOW_TYPE 								AS 	CASH_FLOW_TYPE,
	B.CLIENT_ID 									AS 	CLIENT_ID,
	B.CONTRACT_ID 									AS 	CONTRACT_ID,
	B.GROSS_AMOUNT 									AS 	GROSS_AMOUNT,
	B.HK_HUB_CONTRACT 								AS 	HK_HUB_CONTRACT,
	B.HK_HUB_INVESTMENT_PRODUCT_TYPE 				AS 	HK_HUB_INVESTMENT_PRODUCT_TYPE,
	B.HK_HUB_INVESTMENT_SAVING_PROGRAM_TYPES 		AS 	HK_HUB_INVESTMENT_SAVING_PROGRAM_TYPES,
	B.HK_HUB_PARTY_ROLE_ACCOUNT_HOLDER 				AS 	HK_HUB_PARTY_ROLE_ACCOUNT_HOLDER,
	B.HK_HUB_PARTY_ROLE_ADVISOR 					AS 	HK_HUB_PARTY_ROLE_ADVISOR,
	B.HK_LINK 										AS 	HK_LINK,
	B.INVESTMENT_PRODUCT_ID 						AS 	INVESTMENT_PRODUCT_ID,
	B.MASTER_CODE 									AS 	MASTER_CODE,
	B.MD_CREATION_AUDIT_ID 							AS 	MD_CREATION_AUDIT_ID,
	B.MD_CREATION_DT 								AS 	MD_CREATION_DT,
	B.MD_EXTRACT_DT 								AS 	MD_EXTRACT_DT,
	B.MD_SOURCE 									AS 	MD_SOURCE,
	B.MD_SRC_SYSTEM 								AS 	MD_SRC_SYSTEM,
	B.MD_START_DT 									AS 	MD_START_DT,
	B.ORD_TRANSACTION_TYPE 							AS 	ORD_TRANSACTION_TYPE,
	B.RETAIL_PLAN 									AS 	RETAIL_PLAN,
	B.TRADE_DATE 									AS 	TRADE_DATE,
	B.TRANSACTION_ID 								AS 	TRANSACTION_ID,
	B.TRANSACTION_TYPE								AS 	TRANSACTION_TYPE
	FROM DB_IAW_''||ENV||''_DWH.TRANSACTIONS_BDV.TRANSLINK_FINANCIAL_TRANSACTION B 
	LEFT JOIN DB_IAW_''||ENV||''_DM.TRANSACTIONS.FACT_TRANSACTIONS A 
	ON B.HK_LINK = A.HK_LINK
	WHERE B.MD_START_DT <= TO_DATE(''||DATA_START_DATE||'',''''YYYY-MM-DD'''')
	),
	Joiner_TRAN_PRODUCT AS (
	SELECT 
	A.HK_HUB 											AS 	Product_HK_HUB,
	A.ID 												AS 	Product_ID,
	CASE WHEN A.ID IS NULL THEN ''''-1'''' ELSE A.ID END 	AS 	O_PRODUCT_ID,
	B.ACCOUNT_RAP_CODE 									AS 	ACCOUNT_RAP_CODE,
	B.ADMINISTRATORY_TYPE 								AS 	ADMINISTRATORY_TYPE,
	B.CASH_FLOW 										AS 	CASH_FLOW,
	B.CASH_FLOW_TYPE 									AS 	CASH_FLOW_TYPE,
	B.CLIENT_ID 										AS 	CLIENT_ID,
	B.CONTRACT_ID 										AS 	CONTRACT_ID,
	B.fact_HK_LINK 										AS 	fact_HK_LINK,
	B.GROSS_AMOUNT 										AS 	GROSS_AMOUNT,
	B.HK_HUB_CONTRACT 									AS 	HK_HUB_CONTRACT,
	B.HK_HUB_INVESTMENT_PRODUCT_TYPE 					AS 	HK_HUB_INVESTMENT_PRODUCT_TYPE,
	B.HK_HUB_INVESTMENT_SAVING_PROGRAM_TYPES 			AS 	HK_HUB_INVESTMENT_SAVING_PROGRAM_TYPES,
	B.HK_HUB_PARTY_ROLE_ACCOUNT_HOLDER 					AS 	HK_HUB_PARTY_ROLE_ACCOUNT_HOLDER,
	B.HK_HUB_PARTY_ROLE_ADVISOR 						AS 	HK_HUB_PARTY_ROLE_ADVISOR,
	B.HK_LINK 											AS 	HK_LINK,
	B.INVESTMENT_PRODUCT_ID 							AS 	INVESTMENT_PRODUCT_ID,
	B.MASTER_CODE 										AS 	MASTER_CODE,
	B.MD_CREATION_AUDIT_ID 								AS 	MD_CREATION_AUDIT_ID,
	B.MD_CREATION_DT 									AS 	MD_CREATION_DT,
	B.MD_EXTRACT_DT 									AS 	MD_EXTRACT_DT,
	B.MD_SOURCE 										AS 	MD_SOURCE,
	B.MD_SRC_SYSTEM 									AS 	MD_SRC_SYSTEM,
	B.MD_START_DT 										AS 	MD_START_DT,
	B.ORD_TRANSACTION_TYPE 								AS 	ORD_TRANSACTION_TYPE,
	B.RETAIL_PLAN 										AS 	RETAIL_PLAN,
	B.TRADE_DATE 										AS 	TRADE_DATE,
	B.TRANSACTION_ID 									AS 	TRANSACTION_ID,
	B.TRANSACTION_TYPE 									AS 	TRANSACTION_TYPE
	FROM JNR_BDVLINKTRANS_LEFTJOIN_FACTTRANS B 
	LEFT JOIN DB_IAW_''||ENV||''_DM.SHARED.DIM_FINANCIAL_INSTRUMENTS A
	ON B.HK_HUB_INVESTMENT_PRODUCT_TYPE = A.HK_HUB
	WHERE (A.MD_START_DT <= TO_DATE(''||DATA_START_DATE||'',''''YYYY-MM-DD'''') AND (A.MD_END_DT> TO_DATE(''||DATA_START_DATE||'',''''YYYY-MM-DD'''') OR A.MD_END_DT IS NULL))
	),
	Joiner_PRODUCT_TRAN_ACCOUNT AS (
	SELECT
		A.HK_HUB 												AS 	ADV_HK_HUB,
		A.ID													AS 	ADV_ID,
		CASE WHEN A.ID IS NULL THEN ''''-1'''' ELSE A.ID END 		AS 	O_ADV_ID,
		B.Product_HK_HUB 										AS 	Product_HK_HUB,
		B.Product_ID 											AS 	Product_ID,
		B.O_PRODUCT_ID 											AS 	O_PRODUCT_ID,
		B.ACCOUNT_RAP_CODE 										AS 	ACCOUNT_RAP_CODE,
		B.ADMINISTRATORY_TYPE 									AS 	ADMINISTRATORY_TYPE,
		B.CASH_FLOW 											AS 	CASH_FLOW,
		B.CASH_FLOW_TYPE 										AS 	CASH_FLOW_TYPE,
		B.CLIENT_ID 											AS 	CLIENT_ID,
		B.CONTRACT_ID 											AS 	CONTRACT_ID,
		B.fact_HK_LINK 											AS 	fact_HK_LINK,
		B.GROSS_AMOUNT 											AS 	GROSS_AMOUNT,
		B.HK_HUB_CONTRACT 										AS 	HK_HUB_CONTRACT,
		B.HK_HUB_INVESTMENT_PRODUCT_TYPE	 					AS 	HK_HUB_INVESTMENT_PRODUCT_TYPE,
		B.HK_HUB_INVESTMENT_SAVING_PROGRAM_TYPES 				AS 	HK_HUB_INVESTMENT_SAVING_PROGRAM_TYPES,
		B.HK_HUB_PARTY_ROLE_ACCOUNT_HOLDER 						AS 	HK_HUB_PARTY_ROLE_ACCOUNT_HOLDER,
		B.HK_HUB_PARTY_ROLE_ADVISOR 							AS 	HK_HUB_PARTY_ROLE_ADVISOR,
		B.HK_LINK 												AS 	HK_LINK,
		B.INVESTMENT_PRODUCT_ID 								AS 	INVESTMENT_PRODUCT_ID,
		B.MASTER_CODE 											AS 	MASTER_CODE,
		B.MD_CREATION_AUDIT_ID 									AS 	MD_CREATION_AUDIT_ID,
		B.MD_CREATION_DT 										AS 	MD_CREATION_DT,
		B.MD_EXTRACT_DT 										AS 	MD_EXTRACT_DT,
		B.MD_SOURCE 											AS 	MD_SOURCE,
		B.MD_SRC_SYSTEM 										AS 	MD_SRC_SYSTEM,
		B.MD_START_DT 											AS 	MD_START_DT,
		B.ORD_TRANSACTION_TYPE 									AS 	ORD_TRANSACTION_TYPE,
		B.RETAIL_PLAN 											AS 	RETAIL_PLAN,
		B.TRADE_DATE 											AS 	TRADE_DATE,
		B.TRANSACTION_ID 										AS 	TRANSACTION_ID,
		B.TRANSACTION_TYPE 										AS 	TRANSACTION_TYPE
		FROM Joiner_TRAN_PRODUCT B
		LEFT JOIN DB_IAW_''||ENV||''_DM.SHARED.DIM_ADVISOR A
		ON B.HK_HUB_PARTY_ROLE_ADVISOR = A.HK_HUB
		WHERE (A.MD_START_DT <= TO_DATE(''||DATA_START_DATE||'',''''YYYY-MM-DD'''') AND (A.MD_END_DT> TO_DATE(''||DATA_START_DATE||'',''''YYYY-MM-DD'''') OR A.MD_END_DT IS NULL))
		),
		Joiner_PRODUCT_TRAN_ADVISOR_PLAN AS (
		SELECT
		A.HK_HUB												AS 	PLAN_HK_HUB,
		A.ID 													AS 	PLAN_ID,
		CASE WHEN A.ID IS NULL THEN ''''-1'''' ELSE A.ID END 		AS 	O_PLAN_ID,
		B.ADV_HK_HUB											AS 	ADV_HK_HUB,
		B.ADV_ID 												AS 	ADV_ID,
		B.O_ADV_ID 												AS 	O_ADV_ID,
		B.Product_HK_HUB 										AS 	Product_HK_HUB,
		B.Product_ID 											AS 	Product_ID,
		B.O_PRODUCT_ID 											AS 	O_PRODUCT_ID,
		B.ACCOUNT_RAP_CODE 										AS 	ACCOUNT_RAP_CODE,
		B.ADMINISTRATORY_TYPE 									AS 	ADMINISTRATORY_TYPE,
		B.CASH_FLOW 											AS 	CASH_FLOW,
		B.CASH_FLOW_TYPE 										AS 	CASH_FLOW_TYPE,
		B.CLIENT_ID 											AS 	CLIENT_ID,
		B.CONTRACT_ID 											AS 	CONTRACT_ID,
		B.fact_HK_LINK 											AS 	fact_HK_LINK,
		B.GROSS_AMOUNT 											AS 	GROSS_AMOUNT,
		B.HK_HUB_CONTRACT 										AS 	HK_HUB_CONTRACT,
		B.HK_HUB_INVESTMENT_PRODUCT_TYPE	 					AS 	HK_HUB_INVESTMENT_PRODUCT_TYPE,
		B.HK_HUB_INVESTMENT_SAVING_PROGRAM_TYPES 				AS 	HK_HUB_INVESTMENT_SAVING_PROGRAM_TYPES,
		B.HK_HUB_PARTY_ROLE_ACCOUNT_HOLDER 						AS 	HK_HUB_PARTY_ROLE_ACCOUNT_HOLDER,
		B.HK_HUB_PARTY_ROLE_ADVISOR 							AS 	HK_HUB_PARTY_ROLE_ADVISOR,
		B.HK_LINK 												AS 	HK_LINK,
		B.INVESTMENT_PRODUCT_ID 								AS 	INVESTMENT_PRODUCT_ID,
		B.MASTER_CODE 											AS 	MASTER_CODE,
		B.MD_CREATION_AUDIT_ID 									AS 	MD_CREATION_AUDIT_ID,
		B.MD_CREATION_DT 										AS 	MD_CREATION_DT,
		B.MD_EXTRACT_DT 										AS 	MD_EXTRACT_DT,
		B.MD_SOURCE 											AS 	MD_SOURCE,
		B.MD_SRC_SYSTEM 										AS 	MD_SRC_SYSTEM,
		B.MD_START_DT 											AS 	MD_START_DT,
		B.ORD_TRANSACTION_TYPE 									AS 	ORD_TRANSACTION_TYPE,
		B.RETAIL_PLAN 											AS 	RETAIL_PLAN,
		B.TRADE_DATE 											AS 	TRADE_DATE,
		B.TRANSACTION_ID 										AS 	TRANSACTION_ID,
		B.TRANSACTION_TYPE 										AS 	TRANSACTION_TYPE
		FROM Joiner_PRODUCT_TRAN_ACCOUNT B
		LEFT JOIN DB_IAW_''||ENV||''_DM.SHARED.DIM_PLANS A
		ON B.HK_HUB_INVESTMENT_SAVING_PROGRAM_TYPES = A.HK_HUB
		WHERE (A.MD_START_DT <= TO_DATE(''||DATA_START_DATE||'',''''YYYY-MM-DD'''') AND (A.MD_END_DT> TO_DATE(''||DATA_START_DATE||'',''''YYYY-MM-DD'''') OR A.MD_END_DT IS NULL))
		),
		Joiner_PRODUCT_TRAN_ADVISOR_PLAN_CLIENT AS (
		SELECT
		A.HK_HUB												AS 	CLT_HK_HUB,
		A.ID 													AS 	CLT_ID,
		CASE WHEN A.ID IS NULL THEN ''''-1'''' ELSE A.ID END 		AS 	O_CLT_ID,
		B.PLAN_HK_HUB 											AS 	PLAN_HK_HUB,
		B.PLAN_ID 												AS 	PLAN_ID,
		B.O_PLAN_ID 											AS 	O_PLAN_ID,
		B.ADV_HK_HUB											AS 	ADV_HK_HUB,
		B.ADV_ID 												AS 	ADV_ID,
		B.O_ADV_ID 												AS 	O_ADV_ID,
		B.Product_HK_HUB 										AS 	PRODUCT_HK_HUB,
		B.Product_ID 											AS 	PRODUCT_ID,
		B.O_PRODUCT_ID 											AS 	O_PRODUCT_ID,
		B.ACCOUNT_RAP_CODE 										AS 	ACCOUNT_RAP_CODE,
		B.ADMINISTRATORY_TYPE 									AS 	ADMINISTRATORY_TYPE,
		B.CASH_FLOW 											AS 	CASH_FLOW,
		B.CASH_FLOW_TYPE 										AS 	CASH_FLOW_TYPE,
		B.CLIENT_ID 											AS 	CLIENT_ID,
		B.CONTRACT_ID 											AS 	CONTRACT_ID,
		B.fact_HK_LINK 											AS 	FACT_HK_LINK,
		B.GROSS_AMOUNT 											AS 	GROSS_AMOUNT,
		B.HK_HUB_CONTRACT 										AS 	HK_HUB_CONTRACT,
		B.HK_HUB_INVESTMENT_PRODUCT_TYPE	 					AS 	HK_HUB_INVESTMENT_PRODUCT_TYPE,
		B.HK_HUB_INVESTMENT_SAVING_PROGRAM_TYPES 				AS 	HK_HUB_INVESTMENT_SAVING_PROGRAM_TYPES,
		B.HK_HUB_PARTY_ROLE_ACCOUNT_HOLDER 						AS 	HK_HUB_PARTY_ROLE_ACCOUNT_HOLDER,
		B.HK_HUB_PARTY_ROLE_ADVISOR 							AS 	HK_HUB_PARTY_ROLE_ADVISOR,
		B.HK_LINK 												AS 	HK_LINK,
		B.INVESTMENT_PRODUCT_ID 								AS 	INVESTMENT_PRODUCT_ID,
		B.MASTER_CODE 											AS 	MASTER_CODE,
		B.MD_CREATION_AUDIT_ID 									AS 	MD_CREATION_AUDIT_ID,
		B.MD_CREATION_DT 										AS 	MD_CREATION_DT,
		B.MD_EXTRACT_DT 										AS 	MD_EXTRACT_DT,
		B.MD_SOURCE 											AS 	MD_SOURCE,
		B.MD_SRC_SYSTEM 										AS 	MD_SRC_SYSTEM,
		B.MD_START_DT 											AS 	MD_START_DT,
		B.ORD_TRANSACTION_TYPE 									AS 	ORD_TRANSACTION_TYPE,
		B.RETAIL_PLAN 											AS 	RETAIL_PLAN,
		B.TRADE_DATE 											AS 	TRADE_DATE,
		B.TRANSACTION_ID 										AS 	TRANSACTION_ID,
		B.TRANSACTION_TYPE 										AS 	TRANSACTION_TYPE
		FROM Joiner_PRODUCT_TRAN_ADVISOR_PLAN B
		LEFT JOIN DB_IAW_''||ENV||''_DM.SHARED.DIM_CLIENTS A 
		ON B.HK_HUB_PARTY_ROLE_ACCOUNT_HOLDER = A.HK_HUB
		WHERE (A.MD_START_DT <= TO_DATE(''||DATA_START_DATE||'',''''YYYY-MM-DD'''') AND (A.MD_END_DT> TO_DATE(''||DATA_START_DATE||'',''''YYYY-MM-DD'''') OR A.MD_END_DT IS NULL))
		),
		Agg_Transaction AS (
		SELECT 
		SUM(GROSS_AMOUNT)										AS 	O_SUM_GROSS_AMOUNT,
		MAX(MD_START_DT)										AS 	O_MAX_MD_START_DT,
		MAX(MD_EXTRACT_DT)										AS  o_MAX_MD_EXTRACT_DT,
		MAX(MD_SOURCE)											AS 	o_MAX_MD_SOURCE,
		MAX(MD_SRC_SYSTEM)										AS 	O_MAX_MD_SRC_SYSTEM,
		CLT_HK_HUB,
		CLT_ID,
		O_CLT_ID,
		PLAN_HK_HUB,
		PLAN_ID,
		O_PLAN_ID,
		ADV_HK_HUB,
		ADV_ID,
		O_ADV_ID,
		Product_HK_HUB,
		Product_ID,
		O_PRODUCT_ID,
		ACCOUNT_RAP_CODE,
		ADMINISTRATORY_TYPE,
		CASH_FLOW,
		CASH_FLOW_TYPE,
		CLIENT_ID,
		CONTRACT_ID,
		fact_HK_LINK,
		GROSS_AMOUNT,
		HK_HUB_CONTRACT,
		HK_HUB_INVESTMENT_PRODUCT_TYPE,
		HK_HUB_INVESTMENT_SAVING_PROGRAM_TYPES,
		HK_HUB_PARTY_ROLE_ACCOUNT_HOLDER,
		HK_HUB_PARTY_ROLE_ADVISOR,
		HK_LINK,
		INVESTMENT_PRODUCT_ID,
		MASTER_CODE,
		MD_CREATION_AUDIT_ID,
		MD_CREATION_DT,
		MD_EXTRACT_DT,
		MD_SOURCE,
		MD_SRC_SYSTEM,
		MD_START_DT,
		ORD_TRANSACTION_TYPE,
		RETAIL_PLAN,
		TRADE_DATE,
		TRANSACTION_ID,
		TRANSACTION_TYPE
		FROM Joiner_PRODUCT_TRAN_ADVISOR_PLAN_CLIENT
		GROUP BY CLT_HK_HUB,CLT_ID,O_CLT_ID,PLAN_HK_HUB,PLAN_ID,O_PLAN_ID,ADV_HK_HUB,ADV_ID,O_ADV_ID,PRODUCT_HK_HUB,PRODUCT_ID,O_PRODUCT_ID,ACCOUNT_RAP_CODE,ADMINISTRATORY_TYPE,CASH_FLOW,CASH_FLOW_TYPE,CLIENT_ID,CONTRACT_ID,FACT_HK_LINK,GROSS_AMOUNT,HK_HUB_CONTRACT,HK_HUB_INVESTMENT_PRODUCT_TYPE,HK_HUB_INVESTMENT_SAVING_PROGRAM_TYPES,HK_HUB_PARTY_ROLE_ACCOUNT_HOLDER,HK_HUB_PARTY_ROLE_ADVISOR,HK_LINK,INVESTMENT_PRODUCT_ID,MASTER_CODE,MD_CREATION_AUDIT_ID,MD_CREATION_DT,MD_EXTRACT_DT,MD_SOURCE,MD_SRC_SYSTEM,MD_START_DT,ORD_TRANSACTION_TYPE,RETAIL_PLAN,TRADE_DATE,TRANSACTION_ID,TRANSACTION_TYPE
		)
		SELECT
		O_MAX_MD_START_DT,
		O_MAX_MD_SOURCE,
		O_MAX_MD_SRC_SYSTEM,
		O_MAX_MD_EXTRACT_DT,
		HK_HUB_PARTY_ROLE_ACCOUNT_HOLDER,
		HK_HUB_PARTY_ROLE_ADVISOR,
		HK_HUB_INVESTMENT_SAVING_PROGRAM_TYPES,
		HK_HUB_INVESTMENT_PRODUCT_TYPE,
		O_CLT_ID,
		O_ADV_ID,
		O_PLAN_ID,
		O_PRODUCT_ID,
		TRADE_DATE,
		O_SUM_GROSS_AMOUNT,
		CASH_FLOW,
		CASH_FLOW_TYPE,
		ADMINISTRATORY_TYPE
		FROM Agg_Transaction)'';
UPD_QUERY := ''UPDATE DB_IAW_''||ENV||''_DM.TRANSACTIONS.WT_FACT_TRANSACTIONS
SET
HK_LINK = SHA1(UPPER(CONCAT(
	  COALESCE(TRIM(MD_SRC_SYSTEM), ''''NULL''''), ''''|''''
	, COALESCE(TRIM(HK_HUB_PARTY_ROLE_ACCOUNT_HOLDER), ''''NULL''''), ''''|''''
	, COALESCE(TRIM(HK_HUB_PARTY_ROLE_ADVISOR), ''''NULL''''), ''''|''''
	, COALESCE(TRIM(HK_HUB_INVESTMENT_SAVING_PROGRAM_TYPES), ''''NULL''''), ''''|''''
	, COALESCE(TRIM(HK_HUB_INVESTMENT_PRODUCT_TYPE), ''''NULL''''), ''''|''''
	, COALESCE(TRIM(TRADE_DATE), ''''NULL''''), ''''|''''
	, COALESCE(TRIM(CASH_FLOW), ''''NULL''''), ''''|''''
	, COALESCE(TRIM(CASH_FLOW_TYPE), ''''NULL''''), ''''|''''
	, COALESCE(TRIM(ADMINISTRATORY_TYPE), ''''NULL'''')
	)))
Where 1=1'';
EXECUTE IMMEDIATE :TRUNC_QUERY;
EXECUTE IMMEDIATE :INS_QUERY;
EXECUTE IMMEDIATE :UPD_QUERY;
END

';