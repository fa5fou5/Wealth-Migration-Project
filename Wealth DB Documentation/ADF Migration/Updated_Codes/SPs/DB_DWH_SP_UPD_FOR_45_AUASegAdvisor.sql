CREATE OR REPLACE PROCEDURE DB_IAWT_DEV_DWH.SHARED_BDV.SP_CONV_LOADBDV_RDV_HOLDINGS_TO_BDV_WT_SAT_PARTY_ROLE_ADVISOR_AUA_SEG_COMPUTE("ENV" VARCHAR(1000), "I_DATA_START_DATE" VARCHAR(1000), "I_AUDIT_ID" VARCHAR(1000))
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
INS_PRE_DEL := ''DELETE FROM DB_IAWT_''||ENV||''_DWH.SHARED_BDV.WT_SAT_PARTY_ROLE_ADVISOR_AUA_SEG_COMPUTE'';
INS_INSERT := ''
INSERT INTO DB_IAWT_''||ENV||''_DWH.SHARED_BDV.WT_SAT_PARTY_ROLE_ADVISOR_AUA_SEG_COMPUTE
(
HK_HUB
,MD_START_DT
,MD_CREATION_DT
,MD_CREATION_AUDIT_ID
,MD_SOURCE
,MD_SRC_SYSTEM
,MD_EXTRACT_DT
,ADVISOR_AUA_SEGMENT
,ADVISOR_AUA_SEGMENT_ORDER
--,SUSPENDED_IND
)
SELECT
SATPARTY_BDV.HK_HUB_PARTY_ROLE_ADVISOR
,TO_DATE(''||i_DATA_START_DATE||'',''''YYYY-MM-DD'''')
,CURRENT_TIMESTAMP
,''''-1''''
,SATPARTY_BDV.O_MAX_MD_SOURCE
,SATPARTY_BDV.O_MAX_MD_SRC_SYSTEM
,SATPARTY_BDV.O_MAX_MD_EXTRACT_DT
,BUSINESS_RULES.UDF_CONV_BR_ALL_ADVISOR_AUA_SEGMENTATION_002(SATPARTY_BDV.O_ADVISOR_SUM_AUA)[''''o_ADVISOR_AUA_SEGMENT'''']
,BUSINESS_RULES.UDF_CONV_BR_ALL_ADVISOR_AUA_SEGMENTATION_002(SATPARTY_BDV.O_ADVISOR_SUM_AUA)[''''o_ADVISOR_AUA_SEGMENT_ORDER'''']
--,CASE WHEN SATPARTY_BDV.O_MAX_MD_ACTIVE=''''D'''' AND SATPARTY_BDV.O_ADVISOR_SUM_AUA !=0 THEN 1 ELSE 0 END
FROM
(
	SELECT  SUM(CASE WHEN BDV.AUA IS NULL THEN 0 ELSE BDV.AUA END) AS O_ADVISOR_SUM_AUA
	,MAX(BDV.MD_SOURCE) AS O_MAX_MD_SOURCE
	,MAX(BDV.MD_SRC_SYSTEM) AS O_MAX_MD_SRC_SYSTEM
	,MAX(BDV.MD_EXTRACT_DT) AS O_MAX_MD_EXTRACT_DT
	--,MAX(BDV.MD_ACTIVE_CERTS)   AS O_MAX_MD_ACTIVE
	,BDV.HK_HUB_PARTY_ROLE_ADVISOR AS HK_HUB_PARTY_ROLE_ADVISOR
	FROM
	( SELECT * FROM 
		(
		SELECT SAT_LINKCV.*, LINK.HK_HUB_PARTY_ROLE_ADVISOR, LINK.MASTER_CODE FROM
		(SELECT SAT_LINK.* FROM DB_IAWT_''||ENV||''_DWH.HOLDINGS_BDV.SAT_LINK_INVESTMENT SAT_LINK
		JOIN
		(SELECT * FROM  (SELECT *, ROW_NUMBER() OVER(PARTITION BY HK_LINK ORDER BY MD_START_DT DESC) RN 
		   FROM DB_IAWT_''||ENV||''_DWH.HOLDINGS_BDV.SAT_LINK_INVESTMENT 
		     WHERE MD_START_DT <= TO_DATE(''||i_DATA_START_DATE||'',''''YYYY-MM-DD'''')) CV WHERE CV.RN = 1) SAT_LINKCV
		ON SAT_LINKCV.HK_LINK = SAT_LINK.HK_LINK 
		AND SAT_LINKCV.MD_START_DT = SAT_LINK.MD_START_DT
		WHERE SAT_LINK.MD_ACTIVE = ''''A''''
		)SAT_LINKCV
		JOIN
		DB_IAWT_''||ENV||''_DWH.HOLDINGS_BDV.LINK_INVESTMENT LINK
		ON LINK.HK_LINK = SAT_LINKCV.HK_LINK
		) BDV1
	LEFT JOIN
		(SELECT SAT_PARTY.HK_HUB FROM DB_IAWT_''||ENV||''_DWH.SHARED_BDV.SAT_PARTY_ROLE_ADVISOR_COMPUTE_IAS_WEALTH SAT_PARTY
		JOIN
		(SELECT * FROM  (SELECT *, ROW_NUMBER() OVER(PARTITION BY HK_HUB ORDER BY MD_START_DT DESC) RN 
		    FROM DB_IAWT_''||ENV||''_DWH.SHARED_BDV.SAT_PARTY_ROLE_ADVISOR_COMPUTE_IAS_WEALTH 
			WHERE MD_START_DT <= TO_DATE(''||i_DATA_START_DATE||'',''''YYYY-MM-DD'''')) CV WHERE CV.RN = 1) SAT_PARTYCV
		ON SAT_PARTYCV.HK_HUB = SAT_PARTY.HK_HUB 
		AND SAT_PARTYCV.MD_START_DT = SAT_PARTY.MD_START_DT 
		WHERE SAT_PARTY.MD_ACTIVE = ''''A''''
		) BDV2
		ON BDV1.HK_HUB_PARTY_ROLE_ADVISOR = BDV2.HK_HUB
		) 
	BDV GROUP BY BDV.HK_HUB_PARTY_ROLE_ADVISOR
	) SATPARTY_BDV
 '';

INS_UPDATE :='' UPDATE DB_IAWT_''||ENV||''_DWH.SHARED_BDV.WT_SAT_PARTY_ROLE_ADVISOR_AUA_SEG_COMPUTE
SET
MD_HASHDIFF=SHA1(
CONCAT(COALESCE(ADVISOR_AUA_SEGMENT , '''' #NULL#''''),''''|''''
,COALESCE(TO_VARCHAR(ADVISOR_AUA_SEGMENT_ORDER), '''' #NULL#''''), ''''|''''
--,COALESCE(TO_VARCHAR(SUSPENDED_IND), '''' #NULL#'''')
))
Where HK_HUB <> ''''0''''
'';

EXECUTE IMMEDIATE :INS_PRE_DEL;
EXECUTE IMMEDIATE :INS_INSERT;
EXECUTE IMMEDIATE :INS_UPDATE;
END
';