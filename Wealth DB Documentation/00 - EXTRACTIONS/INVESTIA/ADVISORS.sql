SELECT
	X.MASTER_CD ,
	/*CONVERT(VARCHAR(64),HASHBYTES('SHA2_256',CONVERT(VARCHAR(11),COALESCE(R.[SIN],'')) + '|' + 'iA Wealth'),2) AS NK_SIN_HASH,*/
	NULLIF(REPLACE(REPLACE(R.REP_CORP_NAME, CHAR(13), ''), CHAR(10), ''),'') AS [NK_REP_CORP_NAME] ,
	NULLIF(REPLACE(REPLACE(R.[REP_LNAME], CHAR(13), ''), CHAR(10), ''),'') AS [REP_LNAME] ,
	NULLIF(REPLACE(REPLACE(R.[REP_FNAME], CHAR(13), ''), CHAR(10), ''),'') AS [REP_FNAME] ,
	/*R.[REP_BIRTH_DT] ,*/
	NULLIF(REPLACE(REPLACE(ST.REP_ST_NAME, CHAR(13), ''), CHAR(10), ''),'') AS [REP_ST_NAME] ,
	NULLIF(REPLACE(REPLACE(R.[REP_GRP_RSP], CHAR(13), ''), CHAR(10), ''),'') AS [REP_GRP_RSP] ,
	NULLIF(REPLACE(REPLACE(R.[DLR_CD], CHAR(13), ''), CHAR(10), ''),'') AS DLR_CD ,
	'Investia Financial Services' AS DLR_NAME_ENG ,
	R.[RGN_SYSID] ,
	NULLIF(REPLACE(REPLACE(R.[RGN_CD], CHAR(13), ''), CHAR(10), ''),'') AS RGN_CD ,
	NULLIF(REPLACE(REPLACE(RGN.RGN_NAME, CHAR(13), ''), CHAR(10), ''),'') AS RGN_NAME ,
	NULLIF(REPLACE(REPLACE(RGN.RGN_MGR, CHAR(13), ''), CHAR(10), ''),'') AS RGN_MGR ,
	R.[BRN_SYSID] ,
	NULLIF(REPLACE(REPLACE(R.[BRN_CD], CHAR(13), ''), CHAR(10), ''),'') AS BRN_CD ,
	NULLIF(REPLACE(REPLACE(BRN.BRN_NAME, CHAR(13), ''), CHAR(10), ''),'') AS BRN_NAME ,
	NULLIF(REPLACE(REPLACE(AD.PROV_CD, CHAR(13), ''), CHAR(10), ''),'') AS PROV_CD ,
	NULLIF('','') AS REP_TEAM_CD ,
	NULLIF('','') AS REP_TEAM_NAME,
	CONVERT(DATE, GETDATE()) AS MD_LOADDATE,
	'INVESTIA-UNIVERIS' AS MD_SRCSYSTEM,
	ISNULL(REP_AGMT_DT, CREATE_DT) AS CREATE_DT,
	TERMINATE_DT,
	SRT.REP_TITLE_DESC 
FROM
	(SELECT DISTINCT MASTER_CD FROM dbo.x_DBB_MASTER_REP (nolock)) X
LEFT OUTER JOIN dbo.REP R (nolock) ON
	X.MASTER_CD = R.REP_CD
LEFT OUTER JOIN dbo.S_REP_TITLE SRT ON
	R.REP_TITLE = SRT.REP_TITLE_CD 
LEFT JOIN dbo.BRN (nolock) ON
	R.BRN_SYSID = BRN.BRN_SYSID
LEFT JOIN dbo.DLR (nolock) ON
	BRN.DLR_SYSID = DLR.DLR_SYSID
LEFT JOIN dbo.RGN (nolock) ON
	R.RGN_SYSID = RGN.RGN_SYSID
LEFT JOIN dbo.S_REP_STATUS ST (nolock) ON
	R.REP_STATUS = ST.REP_STATUS
LEFT JOIN (SELECT DISTINCT
	ADR_SYSID,
	FIRST_VALUE(PROV_CD) OVER ( PARTITION BY ADR_SYSID ORDER BY ADR_NUM ) PROV_CD
FROM
	dbo.CET_ADR (nolock) ) AD ON
    R.REP_SYSID=AD.ADR_SYSID
ORDER BY X.MASTER_CD
;