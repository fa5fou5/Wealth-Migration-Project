SELECT t.member,
t.teamType,
'' as active,
u.userType,
t.teamId,
tm.teamName,
tm.rvpId,
r.rvpName,
u.repId,
rp.repName,
u.regionCode,
CURDATE() AS MD_LOADDATE,
'IAS_IAVM' AS MD_SRCSYSTEM
FROM IAVM.teamMember t 
LEFT JOIN IAVM.userInfo u ON t.member = u.id
LEFT JOIN IAVM.rep rp ON u.repId = rp.repId
LEFT JOIN IAVM.team tm ON t.teamId = tm.teamId
LEFT JOIN IAVM.rvp r ON tm.rvpId = r.rvpId
WHERE t.teamType = 'default'