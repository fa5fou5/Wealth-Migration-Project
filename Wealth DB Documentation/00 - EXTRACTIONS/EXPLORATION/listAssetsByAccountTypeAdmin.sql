-- This script is provided by Gaboury, Dominic related to the query behind the API : http://prod.portal.iagto.ca:90/iavm-ser-swagger/#/Assets/listAssetsSummary
-- some positions do not have info in IAVMACT (univeris positions)
-- ignore accounts related to SEAA and SEZ9 because these reps are not imported to other positions summary tables
--
-- consider J accounts as managed since they contain managed cash for TFE 
select
 if(a.ASC_3_Managed_Type in ('X', 'L'), 'diversiflex',
   if(a.ASC_3_Managed_Type in ('M', 'Q') OR (d.managedInd=1 AND a.ASC_3_Managed_Type=0 AND a.A_C_ID like '%J'), 'managed',
     if(a.ASC_3_Managed_Type in ('S', 'R') OR (d.fixedFeeInd=1 AND d.managedInd=0 AND a.ASC_3_Managed_Type=0 AND a.A_C_ID like '%J'), 'feeBased',
       if(a.ASC_3_Managed_Type in ('V', 'N'), 'vintage',
         if(a.ASC_3_Managed_Type in ('J'), 'iasStrategic',
           if(a.ASC_3_Managed_Type in ('Z'), 'iaWealthAssist', 
             if(a.A_C_ID is null, 'offbook', 'oth'))))))) as accountType,
 
 sum(p.valueCAD) as value

from IAVM.positionSummaryByAccount p

LEFT join BACKOFFICE.IAVMACT a on
 a.A_C_ID = p.accountId

inner join IAVM.rep d on
 d.repId = p.repId
-- and 'BJ59' = d.repId

inner join IAVM.branch b on
 b.branchCode = d.branchCode and
 (:repFilterFirmCode is null or b.firmCode = :repFilterFirmCode)

where 
 p.repId not in ('SEAA', 'SEZ9') and
 length(p.clientId) != 2 and 
 p.processDate = :processDate and
 (:repFilterRepId is null or p.repId = :repFilterRepId) and
 (:clientId is null or a.A_C_Client = :clientId) and
 (:accountId is null or a.A_C_ID = :accountId)

group by accountType
order by if(accountType = 'oth', 'z', accountType)
-- , value DESC
