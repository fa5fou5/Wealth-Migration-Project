select
 s.repId as mainRepCode,
 u.id AS advisorID,
 if(a.ASC_3_Managed_Type = 'X', "Diversiflex Plus",
  if(a.ASC_3_Managed_Type = 'L', "Diversiflex Balanced",
  if(a.ASC_3_Managed_Type = 'M', "Managed Program",
  if(a.ASC_3_Managed_Type = 'Q', "Managed Low Fee",
  if(a.ASC_3_Managed_Type = 'S', "Fee Based Program",
  if(a.ASC_3_Managed_Type = 'R', "Fee Based Low Fee ",
  if(a.ASC_3_Managed_Type = 'V', "Vintage",
  if(a.ASC_3_Managed_Type = 'N', "Vintage Non-Discretionary",
  if(a.ASC_3_Managed_Type = 'J', "iAS Strategic Portfolios",
  if(rt.managedInd, "Managed",
  if(rt.fixedFeeInd, "Fee Based",
  "Commission"))))))))))) as programType,
  t.accountId,
	t.processDate ,
	t.sourceCode ,
	 t.qty,
	 t.transType ,
	 CAST(sum(s.revenue) as CHAR) AS revenue,
	CAST(sum(s.commission) as CHAR) as grossCommission , #t.commissionCAD
	CAST(sum(s.netCommission) as CHAR) AS netCommission ,
	CAST(sum(s.transFee) as CHAR) AS transFee,
	'IAS-COMMISSION' AS MD_SRCSYSTEM, 
    CURDATE() AS MD_LOADDATE,
t.entryType AS entryType, DATE(MAX(t.stamp)) AS Stamp
from COMMISSION.transaction t 
left join IAVM.rep rt on
 t.repId = rt.repId
inner join COMMISSION.sharedCommission s on 
 s.transId = t.transId and
( s.commission != 0 AND COALESCE(t.entryType,'') <> 'INSREV' )
left join BACKOFFICE.IAVMACT a on
 a.A_C_ID = t.accountId
left join IAVM.userInfo u on
 u.repId = s.repId
where
  # t.processDate = SUBDATE(CURDATE(), 1)
   t.stamp between SUBDATE(CURDATE(), 1) and SUBDATE(CURDATE(), interval 1 second)
group BY 
	s.repId, 
	u.id, 
	programType,
	t.accountId,
	t.processDate ,
	t.sourceCode ,
	t.qty,
	t.transType, t.entryType