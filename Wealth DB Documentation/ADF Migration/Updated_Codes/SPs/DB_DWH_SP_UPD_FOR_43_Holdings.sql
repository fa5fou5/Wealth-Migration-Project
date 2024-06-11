USE DB_IAWT_DEV_DWH;

CREATE OR REPLACE PROCEDURE HOLDINGS_BDV.SP_CONV_LOADBDV_RDV_HOLDINGS_TO_BDV_WT_LINK_INVESTMENT_IAS_NBIN("ENV" VARCHAR(16777216), "IO_START_DATE" VARCHAR(16777216))
RETURNS VARCHAR(16777216)
LANGUAGE JAVASCRIPT
EXECUTE AS OWNER
AS '

PRE_SQL_QUERY="DELETE FROM DB_IAWT_ENV_DWH.HOLDINGS_BDV.WT_INVESTMENT_IAS_NBIN";
UPD_QUERY = "";
INS_QUERY = "insert into DB_IAWT_ENV_DWH.HOLDINGS_BDV.WT_INVESTMENT_IAS_NBIN(HK_HUB_CONTRACT	," +	
"HK_HUB_INVESTMENT_PRODUCT_TYPE," +		
"HK_HUB_PARTY_ROLE_ADVISOR,	" +	
"HK_HUB_PARTY_ROLE_ACCOUNT_HOLDER," +		
"HK_HUB_INVESTMENT_SAVING_PROGRAM_TYPES,	" +
"MD_SEQ,		" +
"MD_START_DT,	" +
"MD_CREATION_DT,	" +	
"MD_EXTRACT_DT,		" +
"MD_SOURCE,		" +
"MD_SRC_SYSTEM,	" +
"TRAN_SUMM_CURR_MKT_VALUE,	" +
"TRAN_SUMM_BUSINESS_DATE	,	" +
"CONTRACT_ID	," +
"RR_CD	,	" +
"INVESTMENT_PRODUCT_ID	,	" +
"MASTER_CODE	,	" +
"A_C_CLIENT	,	" +
"ACCOUNT_RAP_CODE," +		
"ASC_1_RESP_PLAN_TYPES," +		
"RETAIL_PLAN	,	" +
"A_C_CURRENCY,		" +
"COMMISSIONPCT,	" +
"ISSUER_COMPANY_NAME," +	
"ASC_3_MANAGED_TYPE	,	" +
"ADMINISTRATOR_TYPE	,	" +
"A_C_ACCOUNT_CLASS	,	" +
"RETAIL_PLAN_RESP,	" +
"EXCHANGERATE) (with T1 as (select MD_START_DT as sat_link_Investment_RR_MD_START_DT " +
",mstr.MD_EXTRACT_DT as sat_link_Investment_RR_MD_EXTRACT_DT " +
",mstr.MD_SOURCE as sat_link_Investment_RR_MD_SOURCE" +
",TRAN_SUMM_CURR_MKT_VALUE as sat_link_Investment_RR_TRAN_SUMM_CURR_MKT_VALUE" +
",TRAN_SUMM_BUSINESS_DATE as sat_link_Investment_RR_TRAN_SUMM_BUSINESS_DATE" +
",HK_HUB_CONTRACT as link_Investment_RR_HK_HUB_CONTRACT" +
",HK_HUB_INVESTMENT_PRODUCT_TYPE as link_Investment_RR_HK_HUB_INVESTMENT_PRODUCT_TYPE" +
" ,INVESTMENT_PRODUCT_ID as link_Investment_RR_INVESTMENT_PRODUCT_ID" +
"  ,TRAN_SUMM_NET_SETT_AMT as sat_link_Investment_RR_TRAN_SUMM_NET_SETT_AMT" +
" ,MD_SEQ as link_Investment_RR_MD_SEQ" +
" ,dtls.MD_SRC_SYSTEM as link_Investment_RR_MD_SRC_SYSTEM" +
" ,CONTRACT_ID as link_Investment_RR_CONTRACT_ID" +
" ,RR_CD as link_Investment_RR_RR_CD , " +
" HK_HUB_REGISTERED_REPRESENTATIVE as  link_Investment_RR_HK_HUB_REGISTERED_REPRESENTATIVE " +
" from DB_IAWT_ENV_DWH.HOLDINGS_RDV.SAT_LINK_INVESTMENT_RR_IAS_NBIN as mstr join DB_IAWT_ENV_DWH.HOLDINGS_RDV.LINK_INVESTMENT_RR_IAS_NBIN as dtls " +
"on mstr.HK_LINK = dtls.HK_LINK where MD_START_DT = TO_DATE(''" + IO_START_DATE + "'',''YYYY-MM-DD'') AND MD_ACTIVE = ''A'')" +
",T2 as " +
"(select mstr.HK_LINK as HK_LINK " +
",COMMISSIONPCT as sat_link_Commission_COMMISSIONPCT " +
" from DB_IAWT_ENV_DWH.shared_BDV.SAT_LINK_PARTY_RELATIONSHIP_COMMISSION_SHARE as mstr join " +
"(select HK_LINK,max(md_start_dt) as max_md_start_dt from  DB_IAWT_ENV_DWH.shared_BDV.SAT_LINK_PARTY_RELATIONSHIP_COMMISSION_SHARE " +
" where MD_START_DT <= TO_DATE(''" + IO_START_DATE + "'',''YYYY-MM-DD'') group by HK_LINK)" +
" as dtls on mstr.HK_LINK = dtls.hk_link and mstr.md_start_dt = dtls.max_md_start_dt where mstr.md_active=''A'' and mstr.md_src_system = ''IAS'')" +
" , t3 as(select dtls.HK_HUB_PARTY_ROLE_ADVISOR as link_Commission_HK_HUB_PARTY_ROLE_ADVISOR," +
" sat_link_Commission_COMMISSIONPCT" +
" ,HK_HUB_REGISTERED_REPRESENTATIVE as link_Commission_HK_HUB_REGISTERED_REPRESENTATIVE" +
", MASTER_CODE as link_Commission_MASTER_CODE" +
" from t2 as mstr join DB_IAWT_ENV_DWH.shared_BDV.LINK_PARTY_RELATIONSHIP_COMMISSION_SHARE as dtls on mstr.hk_link = dtls.hk_link )" +
", t4 as (select * from t1 left outer join t3 on  link_Investment_RR_HK_HUB_REGISTERED_REPRESENTATIVE  = link_Commission_HK_HUB_REGISTERED_REPRESENTATIVE)" +
", t5 as ( select mstr.HK_HUB as HK_HUB" +
",A_C_CLIENT	 as sat_Contract_A_C_CLIENT " +
",ACCOUNT_RAP_CODE as 	sat_Contract_ACCOUNT_RAP_CODE" +
",ASC_1_RESP_PLAN_TYPES as 	sat_Contract_ASC_1_RESP_PLAN_TYPES	" +
",RETAIL_PLAN	 as sat_Contract_RETAIL_PLAN " +
",ASC_3_MANAGED_TYPE	 as sat_Contract_ASC_3_MANAGED_TYPE	" +
",ADMINISTRATOR_TYPE as 	sat_Contract_ADMINISTRATOR_TYPE	" +
",A_C_ACCOUNT_CLASS	as sat_Contract_A_C_ACCOUNT_CLASS	" +
",RETAIL_PLAN_RESP	 as sat_Contract_RETAIL_PLAN_RESP " +
", A_C_CURRENCY     as SAT_CONTRACT_A_C_CURRENCY  " +
" from DB_IAWT_ENV_DWH.shared_RDV.SAT_CONTRACT_IAS_NBIN as mstr join " +
"  (select HK_HUB,max(md_start_dt) as max_md_start_dt from  DB_IAWT_ENV_DWH.shared_RDV.SAT_CONTRACT_IAS_NBIN " +
"   where MD_START_DT <= TO_DATE(''2001-01-01'',''YYYY-MM-DD'') group by HK_HUB) as dtls " +
"         on mstr.HK_HUB = dtls.hk_HUB and mstr.md_start_dt = dtls.max_md_start_dt where mstr.md_active=''A'' )" +
", t6 as(select * from t4 left outer join t5 on HK_HUB = link_Investment_RR_HK_HUB_CONTRACT)" +
",t7 as(select * from t6 left outer join (select EXCHANGE_DATE, EXCHANGERATE as TRANSLINK_EX_EXCHANGERATE from DB_IAWT_ENV_DWH.shared_BDV.TRANSLINK_EXCHANGE_RATE)" +  
"on EXCHANGE_DATE = sat_link_Investment_RR_TRAN_SUMM_BUSINESS_DATE)" +
",t8 as(select mstr.hk_hub as SAT_INVESTMENT_PRODUCT_hk_hub," +
"ISSUER_COMPANY_NAME as  Sat_Product_Type_Sat_Product_Type_ISSUER_COMPANY_NAME " +
"from DB_IAWT_ENV_DWH.shared_BDV.SAT_INVESTMENT_PRODUCT_TYPE_COMPUTE as mstr " +
"join (select HK_HUB,max(md_start_dt) as max_md_start_dt from  DB_IAWT_ENV_DWH.shared_BDV.SAT_INVESTMENT_PRODUCT_TYPE_COMPUTE where MD_START_DT <= TO_DATE(''" + IO_START_DATE + "'',''YYYY-MM-DD'') " +
"group by HK_HUB) as dtls " +
"on mstr.HK_HUB = dtls.hk_HUB and mstr.md_start_dt = dtls.max_md_start_dt where mstr.md_active=''A'')" +
", t9 as (select * from t8 join DB_IAWT_ENV_DWH.shared_RDV.HUB_INVESTMENT_PRODUCT_TYPE dtls on SAT_INVESTMENT_PRODUCT_hk_hub = hk_hub) " +
",t10 as (select * from t7 left outer join t9 on Sat_Product_Type_Sat_Product_Type_ISSUER_COMPANY_NAME = 	link_Investment_RR_HK_HUB_INVESTMENT_PRODUCT_TYPE)" +
"select link_Investment_RR_HK_HUB_CONTRACT," +
"link_Investment_RR_HK_HUB_INVESTMENT_PRODUCT_TYPE," +
"link_Commission_HK_HUB_PARTY_ROLE_ADVISOR," +
"link_invest_HK_HUB_PARTY_ROLE_ACCOUNT_HOLDER," +
"link_invest_HK_HUB_INVESTMENT_SAVING_PROGRAM_TYPES," +
"link_Investment_RR_MD_SEQ," +
"sat_link_Investment_RR_MD_START_DT," +
"Systimestamp()," +
"sat_link_Investment_RR_MD_EXTRACT_DT," +
"sat_link_Investment_RR_MD_SOURCE," +
"link_Investment_RR_MD_SRC_SYSTEm," +
"sat_link_Investment_RR_TRAN_SUMM_CURR_MKT_VALUE	," +
"sat_link_Investment_RR_TRAN_SUMM_BUSINESS_DATE," +
"link_Investment_RR_CONTRACT_ID," +
"link_Investment_RR_RR_CD," +
"link_Investment_RR_INVESTMENT_PRODUCT_ID," +
"link_Commission_MASTER_CODE," +
"sat_Contract_A_C_CLIENT," +
"ACCOUNT_RAP_CODE," +
"ASC_1_RESP_PLAN_TYPES," +
"RETAIL_PLAN," +
"sat_Contract_A_C_CURRENCY, " +
"sat_link_Commission_COMMISSIONPCT," +
"Sat_Product_Type_Sat_Product_Type_ISSUER_COMPANY_NAME," +
"sat_Contract_ASC_3_MANAGED_TYPE," +
"sat_Contract_ADMINISTRATOR_TYPE," +
"sat_Contract_A_C_ACCOUNT_CLASS," +
"sat_Contract_RETAIL_PLAN_RESP," +
"Translink_ex_EXCHANGERATE " +
  " from t10 left outer join ( select HK_HUB_CONTRACT,HK_HUB_PARTY_ROLE_ADVISOR,HK_HUB_INVESTMENT_SAVING_PROGRAM_TYPES as link_invest_HK_HUB_INVESTMENT_SAVING_PROGRAM_TYPES,ACCOUNT_RAP_CODE," +
"ASC_1_RESP_PLAN_TYPES, "+
"RETAIL_PLAN,HK_HUB_PARTY_ROLE_ACCOUNT_HOLDER as link_invest_HK_HUB_PARTY_ROLE_ACCOUNT_HOLDER " +
"from DB_IAWT_ENV_DWH.shared_BDV.LINK_INVESTMENT_CONTRACT)  on LINK_INVESTMENT_RR_HK_HUB_CONTRACT = HK_HUB_CONTRACT " +
"and link_Commission_HK_HUB_PARTY_ROLE_ADVISOR = HK_HUB_PARTY_ROLE_ADVISOR)";
UPD_QUERY = " UPDATE DB_IAWT_ENV_DWH.HOLDINGS_BDV.WT_INVESTMENT_IAS_NBIN " + 
" SET HK_LINK = SHA1(UPPER(CONCAT( " + 
"       COALESCE(TRIM(MD_SEQ), ''#NULL#''), ''|''  " + 
"     , COALESCE(TRIM(MD_SOURCE), ''#NULL#''), ''|''  " + 
"     , COALESCE(TRIM(MD_SRC_SYSTEM), ''#NULL#''), ''|''  " + 
"     , COALESCE(TRIM(MD_EXTRACT_DT), ''#NULL#''), ''|''  " + 
"     , COALESCE(TRIM(CONTRACT_ID), ''#NULL#''), ''|''  " + 
"     , COALESCE(TRIM(MASTER_CODE), ''#NULL#''), ''|''  " + 
"     , COALESCE(TRIM(INVESTMENT_PRODUCT_ID), ''#NULL#''), ''|''  " + 
"     , COALESCE(TRIM(A_C_CLIENT), ''#NULL#''), ''|''  " + 
"     ,''#NULL#'', ''|''  " + 
"     ,COALESCE(TRIM(ACCOUNT_RAP_CODE), ''#NULL#''), ''|''  " + 
"     ,COALESCE(TRIM(RETAIL_PLAN),''#NULL#''), ''|'' " + 
"     ,COALESCE(TRIM(ASC_1_RESP_PLAN_TYPES),''#NULL#''), ''|''  " + 
"     , ''#NULL#'' " + 
"     ))), " + 
" HK_HUB_PARTY_ROLE_ADVISOR= COALESCE(HK_HUB_PARTY_ROLE_ADVISOR,''0''), " + 
" HK_HUB_INVESTMENT_PRODUCT_TYPE= COALESCE(HK_HUB_INVESTMENT_PRODUCT_TYPE,''0''), " + 
" HK_HUB_CONTRACT= COALESCE(HK_HUB_CONTRACT,''0''), " + 
" HK_HUB_PARTY_ROLE_ACCOUNT_HOLDER = DECODE(TRUE, A_C_CLIENT IS NULL ,''0'',SHA1(UPPER(CONCAT(COALESCE(TRIM(MD_SRC_SYSTEM), ''#NULL#''), ''|'' , COALESCE(TRIM(A_C_CLIENT), ''#NULL#''))))), " + 
" HK_HUB_INVESTMENT_SAVING_PROGRAM_TYPES = DECODE(TRUE, ASC_1_RESP_PLAN_TYPES IS NULL AND RETAIL_PLAN IS NULL AND ACCOUNT_RAP_CODE IS NULL ,''0'',  " + 
" SHA1(UPPER(CONCAT(COALESCE(TRIM(MD_SRC_SYSTEM),''#NULL#'') ,''|'', ''#NULL#'',''|'',COALESCE(TRIM(ACCOUNT_RAP_CODE),''#NULL#''), ''|'',  COALESCE(TRIM(RETAIL_PLAN),''#NULL#''),''|'',  " + 
" COALESCE(TRIM(CASE WHEN ACCOUNT_RAP_CODE <> ''Z'' THEN NULL ELSE ASC_1_RESP_PLAN_TYPES END),''#NULL#''))))) " + 
" Where 1=1 " ;
var PRE_SQL_QUERY_ENV = PRE_SQL_QUERY.replaceAll("_ENV_" , "_" + ENV + "_");
 var PRE_sql_statement = snowflake.createStatement(
          {
          sqlText: PRE_SQL_QUERY_ENV
          });
 var result_PRE_SQL_scan = PRE_sql_statement.execute();  

 var INS_QUERY_ENV = INS_QUERY.replaceAll("_ENV_" , "_" + ENV + "_")
 var sql_statement = snowflake.createStatement(
          {
          sqlText: INS_QUERY_ENV
          });
 var result_scan = sql_statement.execute();	 
 var UPD_QUERY_ENV = UPD_QUERY.replaceAll("_ENV_" , "_" + ENV + "_");
 var UPD_statement = snowflake.createStatement(
          {
          sqlText: UPD_QUERY_ENV
          });
 var result_UPD_scan = UPD_statement.execute();
 ';
 
CREATE OR REPLACE PROCEDURE HOLDINGS_BDV.SP_CONV_LOADBDV_RDV_CASH_HOLDINGS_TO_BDV_WT_LINK_INVESTMENT_CASH_IAS_NBIN("ENV" VARCHAR(16777216), "IO_START_DATE" VARCHAR(16777216))
RETURNS VARCHAR(16777216)
LANGUAGE JAVASCRIPT
EXECUTE AS OWNER
AS '
PRE_SQL_QUERY="DELETE FROM DB_IAWT_ENV_DWH.HOLDINGS_BDV.WT_INVESTMENT_CASH_IAS_NBIN";
UPD_QUERY = ""; 
INS_QUERY = "insert into DB_IAWT_ENV_DWH.HOLDINGS_BDV.WT_INVESTMENT_CASH_IAS_NBIN(HK_HUB_CONTRACT	," +	
"HK_HUB_INVESTMENT_PRODUCT_TYPE," +		
"HK_HUB_PARTY_ROLE_ADVISOR,	" +	
"HK_HUB_PARTY_ROLE_ACCOUNT_HOLDER," +		
"HK_HUB_INVESTMENT_SAVING_PROGRAM_TYPES,	" +
"MD_SEQ,		" +
"MD_START_DT,	" +
"MD_CREATION_DT,	" +	
"MD_EXTRACT_DT,		" +
"MD_SOURCE,		" +
"MD_SRC_SYSTEM,	" +
"A_C_SUMM_BALANCE_BUS_DATE,	" +
"A_C_SUMM_SD_NET_AMT	,	" +
"A_C_SUMM_TD_NET_AMT," +
"CONTRACT_ID	," +
"RR_CD	,	" +
"INVESTMENT_PRODUCT_ID	,	" +
"MASTER_CODE	,	" +
"A_C_CLIENT	,	" +
"ACCOUNT_RAP_CODE," +		
"ASC_1_RESP_PLAN_TYPES," +		
"RETAIL_PLAN	,	" +
"A_C_CURRENCY,		" +
"COMMISSIONPCT,	" +
"ISSUER_COMPANY_NAME," +	
"ASC_3_MANAGED_TYPE	,	" +
"ADMINISTRATOR_TYPE	,	" +
"A_C_ACCOUNT_CLASS	,	" +
"RETAIL_PLAN_RESP,	" +
"EXCHANGERATE) (with T1 as (select MD_START_DT as sat_Cash_link_Investment_RR_MD_START_DT " +
",mstr.MD_EXTRACT_DT as sat_link_Cash_Investment_RR_MD_EXTRACT_DT " +
",mstr.MD_SOURCE as sat_link_Cash_Investment_RR_MD_SOURCE" +
", A_C_SUMM_BALANCE_BUS_DATE as sat_link_Cash_Investment_RR_A_C_SUMM_BALANCE_BUS_DATE" +
", A_C_SUMM_SD_NET_AMT as sat_link_Cash_Investment_RR_A_C_SUMM_SD_NET_AMT" +
", A_C_SUMM_TD_NET_AMT as sat_link_Cash_Investment_RR_A_C_SUMM_TD_NET_AMT" +
",A_C_CURRENCY as sat_link_Cash_Investment_RR_A_C_CURRENCY" +
",HK_HUB_CONTRACT as link_Investment_RR_HK_HUB_CONTRACT" +
",HK_HUB_INVESTMENT_PRODUCT_TYPE as link_Investment_RR_HK_HUB_INVESTMENT_PRODUCT_TYPE" +
" ,INVESTMENT_PRODUCT_ID as link_Investment_RR_INVESTMENT_PRODUCT_ID" +
" ,MD_SEQ as link_Investment_RR_MD_SEQ" +
" ,dtls.MD_SRC_SYSTEM as link_Investment_RR_MD_SRC_SYSTEM" +
" ,CONTRACT_ID as link_Investment_RR_CONTRACT_ID" +
" ,RR_CD as link_Investment_RR_RR_CD , " +
" HK_HUB_REGISTERED_REPRESENTATIVE as  link_Investment_RR_HK_HUB_REGISTERED_REPRESENTATIVE " +
" from DB_IAWT_ENV_DWH.HOLDINGS_RDV.SAT_LINK_INVESTMENT_CASH_RR_IAS_NBIN as mstr join DB_IAWT_ENV_DWH.HOLDINGS_RDV.LINK_INVESTMENT_RR_IAS_NBIN as dtls " +
"on mstr.HK_LINK = dtls.HK_LINK where MD_START_DT = TO_DATE(''" + IO_START_DATE + "'',''YYYY-MM-DD'') AND MD_ACTIVE = ''A'')" +
",T2 as " +
"(select mstr.HK_LINK as HK_LINK " +
",COMMISSIONPCT as sat_link_Commission_COMMISSIONPCT " +
" from DB_IAWT_ENV_DWH.shared_BDV.SAT_LINK_PARTY_RELATIONSHIP_COMMISSION_SHARE as mstr join " +
"(select HK_LINK,max(md_start_dt) as max_md_start_dt from  DB_IAWT_ENV_DWH.shared_BDV.SAT_LINK_PARTY_RELATIONSHIP_COMMISSION_SHARE " +
" where MD_START_DT <= TO_DATE(''" + IO_START_DATE + "'',''YYYY-MM-DD'') group by HK_LINK)" +
" as dtls on mstr.HK_LINK = dtls.hk_link and mstr.md_start_dt = dtls.max_md_start_dt where mstr.md_active=''A'' and mstr.md_src_system = ''IAS'')" +
" , t3 as(select dtls.HK_HUB_PARTY_ROLE_ADVISOR as link_Commission_HK_HUB_PARTY_ROLE_ADVISOR," +
" sat_link_Commission_COMMISSIONPCT" +
" ,HK_HUB_REGISTERED_REPRESENTATIVE as link_Commission_HK_HUB_REGISTERED_REPRESENTATIVE" +
", MASTER_CODE as link_Commission_MASTER_CODE" +
" from t2 as mstr join DB_IAWT_ENV_DWH.shared_BDV.LINK_PARTY_RELATIONSHIP_COMMISSION_SHARE as dtls on mstr.hk_link = dtls.hk_link )" +
", t4 as (select * from t1 left outer join t3 on  link_Investment_RR_HK_HUB_REGISTERED_REPRESENTATIVE  = link_Commission_HK_HUB_REGISTERED_REPRESENTATIVE)" +
", t5 as ( select mstr.HK_HUB as HK_HUB" +
",A_C_CLIENT	 as sat_Contract_A_C_CLIENT " +
",ACCOUNT_RAP_CODE as 	sat_Contract_ACCOUNT_RAP_CODE" +
",ASC_1_RESP_PLAN_TYPES as 	sat_Contract_ASC_1_RESP_PLAN_TYPES	" +
",RETAIL_PLAN	 as sat_Contract_RETAIL_PLAN " +
",ASC_3_MANAGED_TYPE	 as sat_Contract_ASC_3_MANAGED_TYPE	" +
",ADMINISTRATOR_TYPE as 	sat_Contract_ADMINISTRATOR_TYPE	" +
",A_C_ACCOUNT_CLASS	as sat_Contract_A_C_ACCOUNT_CLASS	" +
",RETAIL_PLAN_RESP	 as sat_Contract_RETAIL_PLAN_RESP " +
", A_C_CURRENCY     as SAT_CONTRACT_A_C_CURRENCY  " +
" from DB_IAWT_ENV_DWH.shared_RDV.SAT_CONTRACT_IAS_NBIN as mstr join " +
"  (select HK_HUB,max(md_start_dt) as max_md_start_dt from  DB_IAWT_ENV_DWH.shared_RDV.SAT_CONTRACT_IAS_NBIN " +
"   where MD_START_DT <= TO_DATE(''2001-01-01'',''YYYY-MM-DD'') group by HK_HUB) as dtls " +
"         on mstr.HK_HUB = dtls.hk_HUB and mstr.md_start_dt = dtls.max_md_start_dt where mstr.md_active=''A'' )" +
", t6 as(select * from t4 left outer join t5 on HK_HUB = link_Investment_RR_HK_HUB_CONTRACT)" +
",t7 as(select * from t6 left outer join (select EXCHANGE_DATE, EXCHANGERATE as TRANSLINK_EX_EXCHANGERATE from DB_IAWT_ENV_DWH.shared_BDV.TRANSLINK_EXCHANGE_RATE)" +  
"on EXCHANGE_DATE = sat_link_Cash_Investment_RR_A_C_SUMM_BALANCE_BUS_DATE)" +
",t8 as(select mstr.hk_hub as SAT_INVESTMENT_PRODUCT_hk_hub," +
"ISSUER_COMPANY_NAME as  Sat_Product_Type_Sat_Product_Type_ISSUER_COMPANY_NAME " +
"from DB_IAWT_ENV_DWH.shared_BDV.SAT_INVESTMENT_PRODUCT_TYPE_COMPUTE as mstr " +
"join (select HK_HUB,max(md_start_dt) as max_md_start_dt from  DB_IAWT_ENV_DWH.shared_BDV.SAT_INVESTMENT_PRODUCT_TYPE_COMPUTE where MD_START_DT <= TO_DATE(''" + IO_START_DATE + "'',''YYYY-MM-DD'') " +
"group by HK_HUB) as dtls " +
"on mstr.HK_HUB = dtls.hk_HUB and mstr.md_start_dt = dtls.max_md_start_dt where mstr.md_active=''A'')" +
", t9 as (select * from t8 join DB_IAWT_ENV_DWH.shared_RDV.HUB_INVESTMENT_PRODUCT_TYPE dtls on SAT_INVESTMENT_PRODUCT_hk_hub = hk_hub) " +
",t10 as (select * from t7 left outer join t9 on Sat_Product_Type_Sat_Product_Type_ISSUER_COMPANY_NAME = 	link_Investment_RR_HK_HUB_INVESTMENT_PRODUCT_TYPE)" +
"select link_Investment_RR_HK_HUB_CONTRACT," +
"link_Investment_RR_HK_HUB_INVESTMENT_PRODUCT_TYPE," +
"link_Commission_HK_HUB_PARTY_ROLE_ADVISOR," +
"link_invest_HK_HUB_PARTY_ROLE_ACCOUNT_HOLDER," +
"link_invest_HK_HUB_INVESTMENT_SAVING_PROGRAM_TYPES," +
"link_Investment_RR_MD_SEQ," +
"sat_Cash_link_Investment_RR_MD_START_DT," +
"Systimestamp()," +
"sat_link_Cash_Investment_RR_MD_EXTRACT_DT," +
"sat_link_Cash_Investment_RR_MD_SOURCE," +
"link_Investment_RR_MD_SRC_SYSTEm," +
"sat_link_Cash_Investment_RR_A_C_SUMM_BALANCE_BUS_DATE	," +
"sat_link_Cash_Investment_RR_A_C_SUMM_SD_NET_AMT," +
"sat_link_Cash_Investment_RR_A_C_SUMM_TD_NET_AMT," +
"link_Investment_RR_CONTRACT_ID," +
"link_Investment_RR_RR_CD," +
"link_Investment_RR_INVESTMENT_PRODUCT_ID," +
"link_Commission_MASTER_CODE," +
"sat_Contract_A_C_CLIENT," +
"ACCOUNT_RAP_CODE," +
"ASC_1_RESP_PLAN_TYPES," +
"RETAIL_PLAN," +
"sat_link_Cash_Investment_RR_A_C_CURRENCY, " +
"sat_link_Commission_COMMISSIONPCT," +
"Sat_Product_Type_Sat_Product_Type_ISSUER_COMPANY_NAME," +
"sat_Contract_ASC_3_MANAGED_TYPE," +
"sat_Contract_ADMINISTRATOR_TYPE," +
"sat_Contract_A_C_ACCOUNT_CLASS," +
"sat_Contract_RETAIL_PLAN_RESP," +
"Translink_ex_EXCHANGERATE " +
  " from t10 left outer join ( select HK_HUB_CONTRACT,HK_HUB_PARTY_ROLE_ADVISOR,HK_HUB_INVESTMENT_SAVING_PROGRAM_TYPES as link_invest_HK_HUB_INVESTMENT_SAVING_PROGRAM_TYPES,ACCOUNT_RAP_CODE," +
"ASC_1_RESP_PLAN_TYPES, "+
"RETAIL_PLAN,HK_HUB_PARTY_ROLE_ACCOUNT_HOLDER as link_invest_HK_HUB_PARTY_ROLE_ACCOUNT_HOLDER " +
"from DB_IAWT_ENV_DWH.shared_BDV.LINK_INVESTMENT_CONTRACT)  on LINK_INVESTMENT_RR_HK_HUB_CONTRACT = HK_HUB_CONTRACT " +
"and link_Commission_HK_HUB_PARTY_ROLE_ADVISOR = HK_HUB_PARTY_ROLE_ADVISOR)";
UPD_QUERY = " UPDATE HOLDINGS_BDV.WT_INVESTMENT_CASH_IAS_NBIN " + 
"SET HK_LINK = SHA1(UPPER(CONCAT( " + 
"      COALESCE(TRIM(MD_SEQ), ''#NULL#''), ''|''  " + 
"    , COALESCE(TRIM(MD_SOURCE), ''#NULL#''), ''|''  " + 
"    , COALESCE(TRIM(MD_SRC_SYSTEM), ''#NULL#''), ''|''  " + 
"    , COALESCE(TRIM(MD_EXTRACT_DT), ''#NULL#''), ''|''  " + 
"    , COALESCE(TRIM(CONTRACT_ID), ''#NULL#''), ''|''  " + 
"    , COALESCE(TRIM(MASTER_CODE), ''#NULL#''), ''|''  " + 
"    , COALESCE(TRIM(INVESTMENT_PRODUCT_ID), ''#NULL#''), ''|''  " + 
"    , COALESCE(TRIM(A_C_CLIENT), ''#NULL#''), ''|''  " + 
"    ,''#NULL#'', ''|'' " + 
"    ,COALESCE(TRIM(ACCOUNT_RAP_CODE), ''#NULL#''), ''|''  " + 
"    ,COALESCE(TRIM(RETAIL_PLAN),''#NULL#''), ''|'' " + 
"    ,COALESCE(TRIM(ASC_1_RESP_PLAN_TYPES),''#NULL#''), ''|''  " + 
"    , ''#NULL#'' " + 
"    ))), " + 
"HK_HUB_PARTY_ROLE_ADVISOR= COALESCE(HK_HUB_PARTY_ROLE_ADVISOR,''0''), " + 
"HK_HUB_INVESTMENT_PRODUCT_TYPE= SHA1(CONCAT(''IAS'', ''|'' , ''IASCASH'')), " + 
"HK_HUB_CONTRACT= COALESCE(HK_HUB_CONTRACT,''0''), " + 
"HK_HUB_PARTY_ROLE_ACCOUNT_HOLDER = COALESCE(HK_HUB_PARTY_ROLE_ACCOUNT_HOLDER,''0''), " + 
"HK_HUB_INVESTMENT_SAVING_PROGRAM_TYPES = COALESCE(HK_HUB_INVESTMENT_SAVING_PROGRAM_TYPES,''0'') " + 
"Where 1=1; " 
var PRE_SQL_QUERY_ENV = PRE_SQL_QUERY.replaceAll("_ENV_" , "_" + ENV + "_");
 var PRE_sql_statement = snowflake.createStatement(
          {
          sqlText: PRE_SQL_QUERY_ENV
          });
 var result_PRE_SQL_scan = PRE_sql_statement.execute();  
 var INS_QUERY_ENV = INS_QUERY.replaceAll("_ENV_" , "_" + ENV + "_")
 var sql_statement = snowflake.createStatement(
          {
          sqlText: INS_QUERY_ENV
          });
 var result_scan = sql_statement.execute();	   
 var UPD_QUERY_ENV = UPD_QUERY.replaceAll("_ENV_" , "_" + ENV + "_");
 var UPD_statement = snowflake.createStatement(
          {
          sqlText: UPD_QUERY_ENV
          });
 var result_UPD_scan = UPD_statement.execute(); 
';
 