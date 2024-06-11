SELECT
	TRX.TRX_SYSID,
	TRX.IVR_SYSID,
	TRX.REP_SYSID,
	TRX.PLN_SYSID,
	TRX.ACT_SYSID,
	TRX.IVD_SYSID,
	TRX.TRX_STATUS,
	NULLIF(REPLACE(REPLACE(S_TRX_STATUS.TRX_ST_DESC_ENG,CHAR(13), ''), CHAR(10), ''),'') AS TRX_ST_DESC_ENG,
	TRX.TRADE_DT,
	NULLIF(REPLACE(REPLACE(TRX.MGT_CD,CHAR(13), ''), CHAR(10), ''),'') AS MGT_CD ,
	NULLIF(REPLACE(REPLACE(MGT.MGT_NAME_ENG,CHAR(13), ''), CHAR(10), ''),'') AS MGT_NAME_ENG,
	TRX.DLR_SYSID,
	TRX.RGN_SYSID,
	TRX.BRN_SYSID,
	TRX_UNIT,
	TRX_PRICE,
	TRX.TRX_GROSS,
	TRX.TRX_NET ,
	TRX.TRX_GROSS*(CASE WHEN isnull(TRX.CURRENCY_CD,'') = 'USD' THEN isnull((select TOP 1 CONV_RATE from CURRENCY_CONV (nolock) WHERE CONV_DT <= TRX.TRADE_DT ORDER BY CONV_DT DESC ),1) ELSE 1 END ) AS TRX_GROSS_CAD,
	NULLIF(REPLACE(REPLACE(S_TRX_CD.SPR_FACTOR,CHAR(13), ''), CHAR(10), ''),'') AS SPR_FACTOR,
	NULLIF(REPLACE(REPLACE(TRX.CURRENCY_CD,CHAR(13), ''), CHAR(10), ''),'') AS CURRENCY_CD,
	NULLIF(REPLACE(REPLACE(TRX.DLR_CD,CHAR(13), ''), CHAR(10), ''),'') AS DLR_CD,
	NULLIF(REPLACE(REPLACE(TRX.RGN_CD,CHAR(13), ''), CHAR(10), ''),'') AS RGN_CD,
	NULLIF(REPLACE(REPLACE(TRX.BRN_CD,CHAR(13), ''), CHAR(10), ''),'') AS BRN_CD,
	NULLIF(REPLACE(REPLACE(TRX.REP_CD,CHAR(13), ''), CHAR(10), ''),'') AS REP_CD,
	NULLIF(REPLACE(REPLACE(TRX.PLN_TYPE,CHAR(13), ''), CHAR(10), ''),'') AS PLN_TYPE,
	NULLIF(REPLACE(REPLACE(S_TRX_CD.SPR_CTGY,CHAR(13), ''), CHAR(10), ''),'') AS SPR_CTGY,
	NULLIF(REPLACE(REPLACE(S_TRX_CD.TRX_MNEM_ENG,CHAR(13), ''), CHAR(10), ''),'') AS TRX_MNEM_ENG,
	S_TRX_CD.REVERSAL_IND ,
	CONVERT(DATE, GETDATE()) AS MD_LOADDATE,
	'IAS-UNIVERIS' AS MD_SRCSYSTEM
FROM
	dbo.TRX  (nolock)
	LEFT OUTER JOIN dbo.S_TRX_CD (nolock) ON TRX.TRX_CD=S_TRX_CD.TRX_CD
	LEFT OUTER JOIN dbo.IVD (nolock) ON TRX.IVD_SYSID=IVD.IVD_SYSID
	LEFT OUTER JOIN dbo.IVT (nolock) ON IVD.IVT_SYSID=IVT.IVT_SYSID
	LEFT OUTER JOIN dbo.MGT (nolock) ON IVT.MGT_SYSID=MGT.MGT_SYSID
	LEFT OUTER JOIN dbo.S_TRX_STATUS (nolock) ON TRX.TRX_STATUS=S_TRX_STATUS.TRX_STATUS
WHERE TRX.TRADE_DT = CONVERT(DATE, DATEADD(DAY,-1,GETDATE()))
;