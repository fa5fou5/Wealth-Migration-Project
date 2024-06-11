CREATE OR REPLACE PROCEDURE DB_IAWT_DEV_DWH.SHARED_BDV.SP_CONV_LOADBDV_RDV_SAT_REGISTERED_REPRESENTATIVE_TO_BDV_WT_PARTY_ROLE_ADVISOR_COMPUTE_IAS_WEALTH("ENV" VARCHAR(1000), "I_DATA_START_DATE" VARCHAR(1000))
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
INS_PRE_DEL := ''DELETE FROM DB_IAWT_''||ENV||''_DWH.SHARED_BDV.WT_PARTY_ROLE_ADVISOR_COMPUTE_IAS_WEALTH WHERE MD_SRC_SYSTEM = ''''IAS''''; '';
INS_INSERT := ''
INSERT INTO DB_IAWT_''||ENV||''_DWH.SHARED_BDV.WT_PARTY_ROLE_ADVISOR_COMPUTE_IAS_WEALTH
(
HK_HUB
,MD_START_DT
,MD_EXTRACT_DT
,MD_CREATION_DT
,MD_SOURCE
,MD_SRC_SYSTEM
,MASTER_CODE
,COMPANY_CODE
,COMPANY_NAME
,REGULATORY_ORGANIZATION_NAME
,REGULATORY_ORGANIZATION_CODE
,DEALER_NAME
,REGION_VP
,BRANCHCODE
,BRANCHNAME
,TEAM_CODE
,TEAM_NAME
,ADVISOR_FULLNAME
,FIRSTNAME
,LASTNAME
,STATUS
,PROVINCE_CODE
,ADVISOR_START_DATE
,NEW_ADVISOR
,DEPARTED_ADVISOR_IND
,PRIMARY_ROLE
,END_DATE
,REASON
,NEW_FIRM
,NEW_FIRM_TYPE
,NEW_FIRM_BACK_OFFICE
,PRESTIGE_STATUS
,TRANSITION_PERIOD_END_DATE
,DEAL_ASSESTS
,EXPECTED_ASSESTS
,PREVIOUS_FIRM
,PREVIOUS_FIRM_TYPE
,AGE_SEGMENT
,AGE_SEGMENT_ORD
--,MD_ACTIVE_CERTS
)

SELECT 
HK_HUB_PARTY_ROLE_ADVISOR
,O_MD_START_DT
,O_EXTRACT_DT
,O_MD_CREATION_DT
,O_MD_SOURCE
,O_MD_src_system
,LINK_MASTER_CODE
,O_Company_Code
,O_Company_Name
,O_Regulatory_Organization_Name
,O_Regulatory_Organization_Code
,O_Dealer_Name
,O_Regional_VP
,O_BRANCH_CODE
,O_BRANCH_NAME
,O_TEAM_CODE
,O_Team_Name
,Advisor_fullname
,O_FIRST_NAME
,O_LAST_NAME
,O_Status
,O_province_code
,MAX(BEGIN_DT)
,MAX(O_NEW_ADVISOR_IND)
,O_departed_advisor_ind
,MAX(O_primary_role)
,END_DATE
,REASON
,NEW_FIRM
,NEW_FIRM_TYPE
,NEW_FIRM_BACK_OFFICE
,PRESTIGE_STATUS
,TRANSITION_PERIOD_END_DATE
,DEAL_ASSESTS
,EXPECTED_ASSESTS
,PREVIOUS_FIRM
,PREVIOUS_FIRM_TYPE
,O_AGE_SEGMENT
,O_AGE_SEGMENT_ORD
--,MAX(O_md_active_certs)
FROM 
(
SELECT
''''Wealth'''' AS O_COMPANY_CODE
,''''iA Wealth Management'''' AS O_COMPANY_NAME
,''''IIROC'''' AS O_REGULATORY_ORGANIZATION_CODE
,''''Investment Industry Regulatory Organization of Canada'''' AS O_REGULATORY_ORGANIZATION_NAME
,''''iA Securities'''' AS O_DEALER_NAME
,CASE WHEN RDV_BDV.ACTIVEIND IS NULL OR RDV_BDV.ACTIVEIND = 0 THEN ''''Inactive'''' WHEN RDV_BDV.ACTIVEIND = 1 THEN ''''Active'''' END AS O_STATUS
,RDV_BDV.O_RR_CD AS OUTPUT_RR_CD
,CURRENT_TIMESTAMP AS O_MD_CREATION_DT
,''''IAS'''' AS O_MD_SRC_SYSTEM
,RDV_BDV.SAT_LINKCV_MD_EXTRACT_DT AS O_EXTRACT_DT
,RDV_BDV.SAT_LINKCV_MD_SOURCE AS O_MD_SOURCE
,TO_DATE(''||i_DATA_START_DATE||'',''''YYYY-MM-DD'''') AS O_MD_START_DT
,CASE WHEN RTrim(LTrim(RDV_BDV.Region_VP)) IS NOT NULL THEN RTrim(LTrim(RDV_BDV.Region_VP)) ELSE ''''non affiliated to RVPs'''' END AS O_REGIONAL_VP
,CASE WHEN RDV_BDV.TEAMNAME IS NULL THEN (CASE WHEN RDV_BDV.TEAM IS NULL THEN '''''''' ELSE RDV_BDV.TEAM END ) ELSE  RDV_BDV.TEAMNAME END AS O_TEAM_NAME
,CASE WHEN RDV_BDV.PROVINCE IS NULL THEN ''''N/A'''' WHEN RDV_BDV.PROVINCE = ''''#N/A'''' THEN ''''N/A'''' ELSE RDV_BDV.PROVINCE END O_PROVINCE_CODE
,CASE WHEN RDV_BDV.BRANCHCODE IS NOT NULL THEN RDV_BDV.BRANCHCODE WHEN RTrim(LTrim(RDV_BDV.BRN_CD)) IS NOT NULL THEN RTrim(LTrim(RDV_BDV.BRN_CD)) ELSE '''''''' END AS O_BRANCH_CODE
,CASE WHEN RDV_BDV.BRANCHNAME IS NOT NULL THEN RDV_BDV.BRANCHNAME WHEN RTrim(LTrim(RDV_BDV.BRN_NAME)) IS NOT NULL THEN RTrim(LTrim(RDV_BDV.BRN_NAME)) ELSE '''''''' END AS O_BRANCH_NAME
,CASE WHEN RDV_BDV.LASTNAME IS NOT NULL THEN RDV_BDV.LASTNAME WHEN RTrim(LTrim(RDV_BDV.REP_LNAME)) IS NOT NULL THEN RTrim(LTrim(RDV_BDV.REP_LNAME)) ELSE '''''''' END AS O_LAST_NAME
,CASE WHEN RDV_BDV.FIRSTNAME IS NOT NULL THEN RDV_BDV.FIRSTNAME WHEN RTrim(LTrim(RDV_BDV.REP_FNAME)) IS NOT NULL THEN RTrim(LTrim(RDV_BDV.REP_FNAME)) ELSE '''''''' END AS O_FIRST_NAME
,CASE WHEN RDV_BDV.TEAMID IS NULL THEN GROUPID ELSE RDV_BDV.TEAMID END AS  O_TEAM_CODE
,CASE WHEN RDV_BDV.O_MASTER_CODE IS NULL THEN 0 ELSE 1 END AS O_DEPARTED_ADVISOR_IND
,CASE WHEN RDV_BDV.PRIMARY_ROLE = ''''Corporation'''' THEN ''''True'''' ELSE ''''False'''' END AS O_ISCORPORATION
,RDV_BDV.O_HK_HUB_PARTY_ROLE_ADVISOR AS HK_HUB_PARTY_ROLE_ADVISOR
,RDV_BDV.LINK_MASTER_CODE AS LINK_MASTER_CODE
,RDV_BDV.Advisor_fullname AS Advisor_fullname
,RDV_BDV.END_DATE AS END_DATE
,RDV_BDV.REASON AS REASON
,RDV_BDV.NEW_FIRM AS NEW_FIRM	
,RDV_BDV.NEW_FIRM_TYPE	AS NEW_FIRM_TYPE
,RDV_BDV.NEW_FIRM_BACK_OFFICE AS NEW_FIRM_BACK_OFFICE	
,RDV_BDV.PRESTIGE_STATUS AS PRESTIGE_STATUS
,RDV_BDV.TRANSITION_PERIOD_END_DATE AS TRANSITION_PERIOD_END_DATE
,RDV_BDV.DEAL_ASSESTS AS DEAL_ASSESTS	
,RDV_BDV.EXPECTED_ASSESTS AS EXPECTED_ASSESTS	
,RDV_BDV.PREVIOUS_FIRM AS PREVIOUS_FIRM	
,RDV_BDV.PREVIOUS_FIRM_TYPE AS PREVIOUS_FIRM_TYPE
,BUSINESS_RULES.UDF_CONV_BR_ALL_ADVISOR_001(RDV_BDV.BEGIN_DT,O_MD_START_DT) AS O_NEW_ADVISOR_IND
,BUSINESS_RULES.UDF_CONV_BR_ALL_ADVISOR_003(RDV_BDV.ADVISOR_BIRTH_DATE,O_MD_START_DT,O_ISCORPORATION)[''''o_AGE_SEGMENT''''] AS O_AGE_SEGMENT
,BUSINESS_RULES.UDF_CONV_BR_ALL_ADVISOR_003(RDV_BDV.ADVISOR_BIRTH_DATE,O_MD_START_DT,O_ISCORPORATION)[''''o_AGE_SEGMENT_ORD''''] AS O_AGE_SEGMENT_ORD
,RDV_BDV.PRIMARY_ROLE AS O_PRIMARY_ROLE
,RDV_BDV.BEGIN_DT AS BEGIN_DT
--,RDV_BDV.MD_ACTIVE_CERTS AS MD_ACTIVE_CERTS
FROM
( SELECT * FROM  
(
SELECT MAX(SAT_LINKCV.MD_EXTRACT_DT) AS SAT_LINKCV_MD_EXTRACT_DT,MAX(SAT_LINKCV.MD_SOURCE) AS SAT_LINKCV_MD_SOURCE,LINK.HK_HUB_PARTY_ROLE_ADVISOR AS O_HK_HUB_PARTY_ROLE_ADVISOR , LINK.MASTER_CODE AS LINK_MASTER_CODE FROM DB_IAWT_''||ENV||''_DWH.SHARED_BDV.LINK_PARTY_RELATIONSHIP_COMMISSION_SHARE LINK
JOIN
(SELECT SAT_LINK.* FROM DB_IAWT_''||ENV||''_DWH.SHARED_BDV.SAT_LINK_PARTY_RELATIONSHIP_COMMISSION_SHARE SAT_LINK
JOIN 
(SELECT * FROM  (SELECT *, ROW_NUMBER() OVER(PARTITION BY HK_LINK ORDER BY MD_START_DT DESC) RN FROM DB_IAWT_''||ENV||''_DWH.SHARED_BDV.SAT_LINK_PARTY_RELATIONSHIP_COMMISSION_SHARE WHERE MD_START_DT <= TO_DATE(''||i_DATA_START_DATE||'',''''YYYY-MM-DD'''')) CV WHERE CV.RN = 1) SAT_LINKCV
ON SAT_LINKCV.HK_LINK = SAT_LINK.HK_LINK AND SAT_LINKCV.MD_START_DT = SAT_LINK.MD_START_DT WHERE SAT_LINK.MD_ACTIVE = ''''A'''' AND SAT_LINK.MD_SRC_SYSTEM = ''''IAS''''
)SAT_LINKCV
ON LINK.HK_LINK = SAT_LINKCV.HK_LINK

GROUP BY (LINK.MASTER_CODE, LINK.HK_HUB_PARTY_ROLE_ADVISOR)
)BDV1



LEFT JOIN

(
SELECT SAT_REGCV.*,HUB_REG.RR_CD AS O_RR_CD FROM (SELECT * FROM DB_IAWT_''||ENV||''_DWH.SHARED_RDV.HUB_REGISTERED_REPRESENTATIVE WHERE (MD_SRC_SYSTEM = ''''IAS-COMMISSION''''  OR  MD_SRC_SYSTEM = ''''IAS_CERTS'''' ))HUB_REG 
JOIN
(SELECT SAT_REG.* FROM DB_IAWT_''||ENV||''_DWH.SHARED_RDV.SAT_REGISTERED_REPRESENTATIVE_COMMISSION SAT_REG
JOIN 
(SELECT * FROM  (SELECT *, ROW_NUMBER() OVER(PARTITION BY HK_HUB ORDER BY MD_START_DT DESC) RN FROM DB_IAWT_''||ENV||''_DWH.SHARED_RDV.SAT_REGISTERED_REPRESENTATIVE_COMMISSION WHERE MD_START_DT <= TO_DATE(''||i_DATA_START_DATE||'',''''YYYY-MM-DD'''')) CV WHERE CV.RN = 1) SAT_REGCV
ON SAT_REGCV.HK_HUB = SAT_REG.HK_HUB AND SAT_REGCV.MD_START_DT = SAT_REG.MD_START_DT WHERE SAT_REG.MD_ACTIVE = ''''A''''
)SAT_REGCV
ON HUB_REG.HK_HUB = SAT_REGCV.HK_HUB WHERE SAT_REGCV.LASTNAME IS NOT NULL AND SAT_REGCV.FIRSTNAME IS NOT NULL AND SAT_REGCV.ACTIVE = ''''1''''

) RDV1

ON (BDV1.LINK_MASTER_CODE = RDV1.MAINREPCODE AND BDV1.LINK_MASTER_CODE = RDV1.O_RR_CD)


LEFT JOIN


(SELECT VW_PARTY.* FROM DB_IAWT_''||ENV||''_DWH.SHARED_BDV.VW_PARTY_ROLE_ADVISOR_COMPUTE_IAS_WEALTH VW_PARTY
JOIN 
(SELECT * FROM  (SELECT *, ROW_NUMBER() OVER(PARTITION BY HK_HUB_PARTY_ROLE_ADVISOR ORDER BY MD_START_DT DESC) RN FROM DB_IAWT_''||ENV||''_DWH.SHARED_BDV.VW_PARTY_ROLE_ADVISOR_COMPUTE_IAS_WEALTH WHERE MD_START_DT <= TO_DATE(''||i_DATA_START_DATE||'',''''YYYY-MM-DD'''')) CV WHERE CV.RN = 1) VW_PARTYCV
ON VW_PARTYCV.HK_HUB_PARTY_ROLE_ADVISOR = VW_PARTY.HK_HUB_PARTY_ROLE_ADVISOR AND VW_PARTYCV.MD_START_DT = VW_PARTY.MD_START_DT  WHERE VW_PARTY.MD_ACTIVE = ''''A''''
)BDV2


ON BDV1.LINK_MASTER_CODE = BDV2.MASTER_CODE

LEFT JOIN

(
SELECT SAT_REF_MONCV.*,REF_MON.REPID FROM DB_IAWT_''||ENV||''_DWH.STEWARDSHIP_RDV.REF_MONTHLY_MILESTONES REF_MON
JOIN
(SELECT SAT_REF_MON.* FROM DB_IAWT_''||ENV||''_DWH.STEWARDSHIP_RDV.SAT_REF_MONTHLY_MILESTONES_IAS SAT_REF_MON
JOIN 
(SELECT * FROM  (SELECT *, ROW_NUMBER() OVER(PARTITION BY HK_HUB ORDER BY MD_START_DT DESC) RN FROM DB_IAWT_''||ENV||''_DWH.STEWARDSHIP_RDV.SAT_REF_MONTHLY_MILESTONES_IAS WHERE MD_START_DT <= TO_DATE(''||i_DATA_START_DATE||'',''''YYYY-MM-DD'''')) CV WHERE CV.RN = 1) SAT_REF_MONCV
ON SAT_REF_MONCV.HK_HUB = SAT_REF_MON.HK_HUB AND SAT_REF_MONCV.MD_START_DT = SAT_REF_MON.MD_START_DT WHERE SAT_REF_MON.MD_ACTIVE = ''''A''''
)SAT_REF_MONCV
ON REF_MON.HK_HUB = SAT_REF_MONCV.HK_HUB
)RDV2_MON

ON BDV1.LINK_MASTER_CODE = RDV2_MON.REPID


LEFT JOIN 


(
SELECT REF_MAN.REPID FROM DB_IAWT_''||ENV||''_DWH.STEWARDSHIP_RDV.REF_MONTHLY_MILESTONES REF_MAN
JOIN
(SELECT SAT_REF_MAN.HK_HUB FROM DB_IAWT_''||ENV||''_DWH.STEWARDSHIP_RDV.SAT_REF_MONTHLY_MILESTONES_IAS SAT_REF_MAN
JOIN 
(SELECT * FROM  (SELECT *, ROW_NUMBER() OVER(PARTITION BY HK_HUB ORDER BY MD_START_DT DESC) RN FROM DB_IAWT_''||ENV||''_DWH.STEWARDSHIP_RDV.SAT_REF_MONTHLY_MILESTONES_IAS WHERE MD_START_DT <= TO_DATE(''||i_DATA_START_DATE||'',''''YYYY-MM-DD'''')) CV WHERE CV.RN = 1) SAT_REF_MANCV
ON SAT_REF_MANCV.HK_HUB = SAT_REF_MAN.HK_HUB AND SAT_REF_MANCV.MD_START_DT = SAT_REF_MAN.MD_START_DT WHERE SAT_REF_MAN.MD_ACTIVE = ''''A''''
)SAT_REF_MANCV
ON REF_MAN.HK_HUB = SAT_REF_MANCV.HK_HUB
)RDV3_MAN

ON BDV1.LINK_MASTER_CODE = RDV3_MAN.REPID


LEFT JOIN

(
SELECT SAT_REPCV.TEAMID,SAT_REPCV.TEAMNAME,HUB_REP.RR_CD FROM (SELECT * FROM DB_IAWT_''||ENV||''_DWH.SHARED_RDV.HUB_REGISTERED_REPRESENTATIVE WHERE MD_SRC_SYSTEM LIKE ''''%IAS%'''')HUB_REP 
JOIN
(SELECT SAT_REP.* FROM DB_IAWT_''||ENV||''_DWH.SHARED_RDV.SAT_REGISTERED_REPRESENTATIVE_IAS_IAVM SAT_REP
JOIN 
(SELECT * FROM  (SELECT *, ROW_NUMBER() OVER(PARTITION BY HK_HUB ORDER BY MD_START_DT DESC) RN FROM DB_IAWT_''||ENV||''_DWH.SHARED_RDV.SAT_REGISTERED_REPRESENTATIVE_IAS_IAVM WHERE MD_START_DT <= TO_DATE(''||i_DATA_START_DATE||'',''''YYYY-MM-DD'''')) CV WHERE CV.RN = 1) SAT_REPCV
ON SAT_REPCV.HK_HUB = SAT_REP.HK_HUB AND SAT_REPCV.MD_START_DT = SAT_REP.MD_START_DT 
)SAT_REPCV
ON HUB_REP.HK_HUB = SAT_REPCV.HK_HUB WHERE SAT_REPCV.MD_ACTIVE = ''''A''''

)RDV4

ON BDV1.LINK_MASTER_CODE = RDV4.RR_CD

LEFT JOIN

(
SELECT LINK_SER.MASTER_CODE AS O_MASTER_CODE ,SAT_SERCV.END_DATE,SAT_SERCV.REASON,SAT_SERCV.NEW_FIRM,SAT_SERCV.NEW_FIRM_TYPE,SAT_SERCV.NEW_FIRM_BACK_OFFICE,SAT_SERCV.PRESTIGE_STATUS FROM DB_IAWT_''||ENV||''_DWH.STEWARDSHIP_BDV.LINK_SERVICING_CODES LINK_SER
JOIN
(SELECT SAT_SER.* FROM DB_IAWT_''||ENV||''_DWH.STEWARDSHIP_BDV.SAT_LINK_SERVICING_CODES SAT_SER
JOIN 
(SELECT * FROM  (SELECT *, ROW_NUMBER() OVER(PARTITION BY HK_LINK ORDER BY MD_START_DT DESC) RN FROM DB_IAWT_''||ENV||''_DWH.STEWARDSHIP_BDV.SAT_LINK_SERVICING_CODES WHERE MD_START_DT <= TO_DATE(''||i_DATA_START_DATE||'',''''YYYY-MM-DD'''')) CV WHERE CV.RN = 1) SAT_SERCV
ON SAT_SERCV.HK_LINK = SAT_SER.HK_LINK AND SAT_SERCV.MD_START_DT = SAT_SER.MD_START_DT WHERE SAT_SER.MD_ACTIVE = ''''A''''
)SAT_SERCV
ON LINK_SER.HK_LINK = SAT_SERCV.HK_LINK

GROUP BY (LINK_SER.MASTER_CODE,SAT_SERCV.END_DATE,SAT_SERCV.REASON,SAT_SERCV.NEW_FIRM,SAT_SERCV.NEW_FIRM_TYPE,SAT_SERCV.NEW_FIRM_BACK_OFFICE,SAT_SERCV.PRESTIGE_STATUS)
)BDV3

ON BDV1.LINK_MASTER_CODE = BDV3.O_MASTER_CODE

LEFT JOIN

(
SELECT LINK_ADV.MASTER_CODE,SAT_ADVCV.ADVISOR_NAME,SAT_ADVCV.TRANSITION_PERIOD_END_DATE,SAT_ADVCV.DEAL_ASSESTS,SAT_ADVCV.EXPECTED_ASSESTS,SAT_ADVCV.PREVIOUS_FIRM,SAT_ADVCV.PREVIOUS_FIRM_TYPE FROM DB_IAWT_''||ENV||''_DWH.STEWARDSHIP_RDV.REF_NEW_ADVISOR LINK_ADV
JOIN
(SELECT SAT_ADV.* FROM DB_IAWT_''||ENV||''_DWH.STEWARDSHIP_RDV.SAT_REF_NEW_ADVISOR_IAPW SAT_ADV
JOIN 
(SELECT * FROM  (SELECT *, ROW_NUMBER() OVER(PARTITION BY HK_HUB ORDER BY MD_START_DT DESC) RN FROM DB_IAWT_''||ENV||''_DWH.STEWARDSHIP_RDV.SAT_REF_NEW_ADVISOR_IAPW WHERE MD_START_DT <= TO_DATE(''||i_DATA_START_DATE||'',''''YYYY-MM-DD'''')) CV WHERE CV.RN = 1) SAT_ADVCV
ON SAT_ADVCV.HK_HUB = SAT_ADV.HK_HUB AND SAT_ADVCV.MD_START_DT = SAT_ADV.MD_START_DT WHERE SAT_ADV.MD_ACTIVE = ''''A''''
)SAT_ADVCV
ON LINK_ADV.HK_HUB = SAT_ADVCV.HK_HUB

GROUP BY (LINK_ADV.MASTER_CODE,SAT_ADVCV.ADVISOR_NAME,SAT_ADVCV.TRANSITION_PERIOD_END_DATE,SAT_ADVCV.DEAL_ASSESTS,SAT_ADVCV.EXPECTED_ASSESTS,SAT_ADVCV.PREVIOUS_FIRM,SAT_ADVCV.PREVIOUS_FIRM_TYPE)
)RDV5

ON BDV1.LINK_MASTER_CODE = RDV5.MASTER_CODE

)RDV_BDV
)SAT_PARTY
GROUP BY (HK_HUB_PARTY_ROLE_ADVISOR,O_MD_START_DT,O_EXTRACT_DT,O_MD_CREATION_DT,O_MD_SOURCE,O_MD_src_system,LINK_MASTER_CODE,O_Company_Code,O_Company_Name,O_Regulatory_Organization_Name,O_Regulatory_Organization_Code,O_Dealer_Name,O_Regional_VP,O_BRANCH_CODE,O_BRANCH_NAME,O_TEAM_CODE,O_Team_Name,Advisor_fullname,O_FIRST_NAME,O_LAST_NAME,O_Status,O_province_code,O_departed_advisor_ind,END_DATE,REASON,NEW_FIRM,NEW_FIRM_TYPE,NEW_FIRM_BACK_OFFICE,PRESTIGE_STATUS,TRANSITION_PERIOD_END_DATE,DEAL_ASSESTS,EXPECTED_ASSESTS,PREVIOUS_FIRM,PREVIOUS_FIRM_TYPE,O_AGE_SEGMENT,O_AGE_SEGMENT_ORD)
              '';
INS_UPDATE :='' UPDATE DB_IAWT_''||ENV||''_DWH.SHARED_BDV.WT_PARTY_ROLE_ADVISOR_COMPUTE_IAS_WEALTH
SET
MD_HASHDIFF=SHA1(UPPER(CONCAT(COALESCE(TRIM(COMPANY_CODE),''''#NULL#'''') ,''''|'''',COALESCE(TRIM(COMPANY_NAME),''''#NULL#''''), ''''|'''',  COALESCE(TRIM(REGULATORY_ORGANIZATION_NAME),''''#NULL#''''),
''''|'''',COALESCE(TRIM(REGULATORY_ORGANIZATION_CODE),''''#NULL#''''),''''|'''',COALESCE(TRIM(DEALER_CODE),''''#NULL#''''),''''|'''',COALESCE(TRIM(DEALER_NAME),''''#NULL#''''),
''''|'''',COALESCE(TRIM(REGION_CODE),''''#NULL#''''),''''|'''',COALESCE(TRIM(REGION_NAME),''''#NULL#''''),''''|'''',COALESCE(TRIM(REGION_VP),''''#NULL#'''')
,''''|'''',COALESCE(TRIM(BRANCHCODE),''''#NULL#''''),''''|'''',COALESCE(TRIM(BRANCHNAME),''''#NULL#''''),''''|'''',COALESCE(TRIM(to_varchar(TEAM_CODE)),''''#NULL#'''')
,''''|'''',COALESCE(TRIM(TEAM_NAME),''''#NULL#''''),''''|'''',COALESCE(TRIM(ADVISOR_FULLNAME),''''#NULL#''''),''''|'''',COALESCE(TRIM(FIRSTNAME),''''#NULL#'''')
,''''|'''',COALESCE(TRIM(LASTNAME),''''#NULL#''''),''''|'''',COALESCE(TRIM(ADVISOR_CORPORATION_NAME),''''#NULL#''''),''''|'''',COALESCE(TRIM(STATUS),''''#NULL#'''')
,''''|'''',COALESCE(TRIM(GROUP_RSP_INDICATOR),''''#NULL#''''),''''|'''',COALESCE(TRIM(PROVINCE_CODE),''''#NULL#''''),''''|'''',COALESCE(TRIM(PROVINCE),''''#NULL#'''')
,''''|'''',COALESCE(TRIM(to_varchar(ADVISOR_START_DATE)),''''#NULL#''''),''''|'''',COALESCE(TRIM(to_varchar(NEW_ADVISOR)),''''#NULL#'''')
,''''|'''',COALESCE(TRIM(to_varchar(DEPARTED_ADVISOR_IND)),''''#NULL#'''')
,''''|'''',COALESCE(TRIM(PRIMARY_ROLE),''''#NULL#'''')
,''''|'''',COALESCE(TRIM(TO_VARCHAR(END_DATE)),''''#NULL#'''')
,''''|'''',COALESCE(TRIM(REASON),''''#NULL#'''')
,''''|'''',COALESCE(TRIM(NEW_FIRM),''''#NULL#'''')
,''''|'''',COALESCE(TRIM(NEW_FIRM_TYPE),''''#NULL#'''')
,''''|'''',COALESCE(TRIM(NEW_FIRM_BACK_OFFICE),''''#NULL#'''')
,''''|'''',COALESCE(TRIM(PRESTIGE_STATUS),''''#NULL#'''')
,''''|'''',COALESCE(TRIM(to_varchar(TRANSITION_PERIOD_END_DATE)),''''#NULL#'''')
,''''|'''',COALESCE(TRIM(to_varchar(DEAL_ASSESTS)),''''#NULL#'''')
,''''|'''',COALESCE(TRIM(to_varchar(EXPECTED_ASSESTS)),''''#NULL#'''')
,''''|'''',COALESCE(TRIM(PREVIOUS_FIRM),''''#NULL#'''')
,''''|'''',COALESCE(TRIM(PREVIOUS_FIRM_TYPE),''''#NULL#'''')
,''''|'''',COALESCE(TRIM(AGE_SEGMENT),''''#NULL#'''')
,''''|'''',COALESCE(TRIM(AGE_SEGMENT_ORD),''''#NULL#'''')
--,''''|'''',COALESCE(TRIM(MD_ACTIVE_CERTS),''''#NULL#'''')
)))
Where MD_SRC_SYSTEM = ''''IAS'''';
'';

EXECUTE IMMEDIATE :INS_PRE_DEL;
EXECUTE IMMEDIATE :INS_INSERT;
EXECUTE IMMEDIATE :INS_UPDATE;

END
';