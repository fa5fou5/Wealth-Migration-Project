select DISTINCT   
    sh.fromRepId,
    sh.toRepId,
    sh.shareType,
    sh.sourceCode,
    sh.productCode,
    sh.revenuePct,
    sh.commissionPct,
    sh.netCommissionPct,
    sh.feePct,
    sh.revNo,
    sh.stamp,
	CURDATE() AS MD_LOADDATE,
	'IAS-COMMISSION' AS MD_SRCSYSTEM
from 
COMMISSION.share sh
order by sh.fromRepId, sh.toRepId;
