SELECT
	MASTER_CD,
	REP_SYSID,
	BEN_SYSID,
	COMM_RATE,
	BRN_SYSID,
	BRN_CD,
	REP_CD_ORIGINAL,
	CONVERT(DATE, GETDATE()) AS MD_LOADDATE,
	'INVESTIA-UNIVERIS' AS MD_SRCSYSTEM
FROM
	dbo.x_DBB_MASTER_REP (nolock)