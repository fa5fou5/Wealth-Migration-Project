SELECT DISTINCT 
HISTID ,
	HISTOPERATION,
	HISTSTAMP ,
	HISTUSERID ,
	FROMREPID ,
	TOREPID ,
	SHARETYPE ,
	SOURCECODE ,
	PRODUCTCODE ,
	REVENUEPCT ,
	COMMISSIONPCT ,
	NETCOMMISSIONPCT ,
	FEEPCT ,
	REVNO ,
	STAMP ,
	USERID ,
	CURDATE() as	MD_LOADDATE ,
'IAS-COMMISSION' AS 	MD_SRCSYSTEM FROM   shareHist