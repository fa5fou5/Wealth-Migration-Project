SELECT 
p.processDate,
REPLACE(REPLACE(p.repId, CHAR(13), ''), CHAR(10), '') 				AS repId,
REPLACE(REPLACE(p.clientId, CHAR(13), ''), CHAR(10), '') 			AS clientId,
REPLACE(REPLACE(p.accountId, CHAR(13), ''), CHAR(10), '') 			AS accountId,
REPLACE(REPLACE(p.accountCurrency, CHAR(13), ''), CHAR(10), '') 	AS accountCurrency,
p.value,
p.valueCAD,
CURDATE() AS MD_LOADDATE,
'IAS_IAVM' AS MD_SRCSYSTEM	 	
FROM IAVM.positionSummaryByAccount p
WHERE p.processDate = SUBDATE(CURDATE(), 1)
#AND (CONCAT(p.accountId , '0') * 1 > (p.accountId + 0) )



