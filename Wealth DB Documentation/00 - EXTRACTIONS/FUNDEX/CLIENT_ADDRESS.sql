SELECT
	*
INTO
	#IVR_CONTACT
FROM
	dbo.IVR_CONTACT
WHERE
	IVR_SYSID = -1;

INSERT
	INTO
	#IVR_CONTACT(IVR_SYSID)
SELECT
	DISTINCT IVR_SYSID
FROM
	dbo.IVR;

exec sp_MPS_CFN_GET_CLIENT_CONTACT;

SELECT
	i.IVR_SYSID,
	CONVERT(VARCHAR(64), HASHBYTES('SHA2_256', UPPER(dbo.udf_Format_RemoveAccents(LTRIM(RTRIM(ISNULL(i.ADR_1, ''))) + LTRIM(RTRIM(ISNULL(i.ADR_2, ''))) + LTRIM(RTRIM(ISNULL(i.ADR_3, ''))) + LTRIM(RTRIM(ISNULL(i.ADR_4, ''))) + LTRIM(RTRIM(ISNULL(i.ADR_5, ''))) + LTRIM(RTRIM(ISNULL(i.ADR_CITY, ''))) + LTRIM(RTRIM(ISNULL(i.ADR_PSTL_CD, ''))) ))), 2),
	CONVERT(DATE, GETDATE()) AS MD_LOADDATE,
	'FUNDEX-UNIVERIS' AS MD_SRCSYSTEM
FROM
	#IVR_CONTACT i
WHERE
	INCORRECT_ADR_IND = 0
	AND LEN(LTRIM(RTRIM(ISNULL(i.ADR_1, ''))) + LTRIM(RTRIM(ISNULL(i.ADR_2, ''))) + LTRIM(RTRIM(ISNULL(i.ADR_3, ''))) + LTRIM(RTRIM(ISNULL(i.ADR_4, ''))) + LTRIM(RTRIM(ISNULL(i.ADR_5, ''))) )>0
	AND LEN(LTRIM(RTRIM(ISNULL(i.ADR_PSTL_CD, ''))))>0;