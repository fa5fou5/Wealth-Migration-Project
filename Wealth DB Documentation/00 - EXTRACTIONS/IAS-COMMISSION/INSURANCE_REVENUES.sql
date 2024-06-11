SELECT 
transId, 
extTransId, 
processDate, 
transDate, 
sourceCode, 
CAST(cancelInd as DECIMAL) as cancelInd, 
repId, 
currency, 
CAST(exchangeRate as CHAR) as exchangeRate,
entryType, 
CAST(commission as CHAR) as commission,
CAST(commissionCAD as CHAR) as commissionCAD,
CAST(overrideInd as DECIMAL) as overrideInd, 
CAST(accurateInd as DECIMAL) as accurateInd, 
description, 
numberOfOrders, 
CAST(netCommission as CHAR) as netCommission,
CAST(transFee as CHAR) as transFee,
CAST(shareInd as DECIMAL) as shareInd, 
CAST(affectGrossCommInd as DECIMAL) as affectGrossCommInd, 
CAST(revenueOnlyInd as DECIMAL) as revenueOnlyInd, 
REPLACE(note, '|', '/') as note, 
revNo, 
stamp, 
userId,
'IAS-COMMISSION' AS MD_SRCSYSTEM, 
CURDATE() AS MD_LOADDATE
FROM COMMISSION.`transaction` 
where
stamp between SUBDATE(CURDATE(), 1) and SUBDATE(CURDATE(), interval 1 second)
AND 
entryType='INSREV' AND sourceCode='MNL';