select DISTINCT   
    IAVM_Rep.repId,
    IAVM_Rep.repName,
    #CONCAT('Name_', IAVM_Rep.repId) AS repName,
    SecUser_Adv.firstName,
    #CONCAT('FirstName_', IAVM_Rep.repId) AS firstName,
    SecUser_Adv.lastName,
    #CONCAT('LastName_', IAVM_Rep.repId) AS lastName,
    IAVM_Rep.branchCode,
    AttrSet_BrDesc.value AS branchName,
    rc.groupId,
    a.value as groupDescription,
    CAST(IAVM_Rep.fixedFeeInd as CHAR) as fixedFeeInd,
    CAST(IAVM_Rep.managedInd as CHAR) as managedInd,
    CAST(IAVM_Rep.refInd as CHAR) as refInd,
    CAST(IAVM_Rep.activeInd as CHAR) as activeInd,
    CAST(IAVM_Rep.segFundInd as CHAR) as segFundInd,
    IAVM_Rep.revNo,
    IAVM_Rep.stamp,
    IAVM_Rep.userId,
    #CONCAT('userId_', IAVM_Rep.repId) AS userId,
     CAST(SecUser_Adv.active as CHAR) AS active ,
    UserInfo_Adv.id AS Advisor_ID,
    #CONCAT('Advisor_ID.', IAVM_Rep.repId) AS Advisor_ID,
    #sh.revenuePct,
    #sh.commissionPct,
    #sh.netCommissionPct,
    #sh.feePct,
     CAST(rc.commRatePct as CHAR) AS commRatePct,
       CAST(rc.shareGrossCommInd as CHAR) as shareGrossCommInd,
       SecAuth_Adv.startDate,
    UserInfo_Adv.repId as mainRepCode,
    CURDATE() AS MD_LOADDATE,
    'IAS-COMMISSION' AS MD_SRCSYSTEM
    , sr.func as ADVISOR_ROLE
from
IAVM.rep IAVM_Rep  
left join COMMISSION.repCommissionInfo rc on
  IAVM_Rep.repId = rc.repId  
left join IAVM.branch IAVM_Br
    on IAVM_Br.branchCode = IAVM_Rep.branchCode
left join IAVM.attrSet AttrSet_BrDesc
    on AttrSet_BrDesc.type = 'codeset'
    and AttrSet_BrDesc.id = 'branch'
    and AttrSet_BrDesc.k1 = IAVM_Br.branchCode
    and AttrSet_BrDesc.k2 = 'en'
left join COMMISSION.attrSet a on
  a.id = 'iaGroups' and
  a.type = 'codeset' and
  a.k1 = rc.groupId and
  a.k2 = 'en'
left join TX.secData SecData_Adv
    on SecData_Adv.sys = "iavm"
    and SecData_Adv.dataType = "rep"
    and SecData_Adv.d1 = IAVM_Rep.branchCode
    and SecData_Adv.d2 = IAVM_Rep.repId
left join TX.secAuth SecAuth_Adv
    on SecAuth_Adv.dataId = SecData_Adv.dataId
    and SecAuth_Adv.whoType = 'user'
    and SecAuth_Adv.what = 'ia'
    and SecAuth_Adv.whatType = 'role'
    and now() between ifnull(SecAuth_Adv.startDate, '0000-00-00')
    and ifnull(SecAuth_Adv.endDate, '9999-12-31')
left join TX.secUser SecUser_Adv
    on SecUser_Adv.id = SecAuth_Adv.who
left join IAVM.userInfo UserInfo_Adv
    on UserInfo_Adv.id = SecUser_Adv.id
left join TX.secRole sr on
    #SecAuth_Adv.whatType = 'role' and
    SecAuth_Adv.what = sr.roleId and
    sr.sys = 'iavm' and
    sr.func in ('isAdvisor', 'isAssistant', 'isBranchManager')    
order by IAVM_Rep.repId