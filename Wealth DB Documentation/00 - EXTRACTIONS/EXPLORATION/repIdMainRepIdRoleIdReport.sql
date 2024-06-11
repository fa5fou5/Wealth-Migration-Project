-- This script has provided by Gaboury, Dominic
-- the query generates the list of repId, mainRepId, userId, roleId. 

SELECT DISTINCT
r.repId,
ui.repId as mainRepId,
ui.id as userId,
a.what as roleId,
sr.func
FROM IAVM.userInfo ui

INNER JOIN TX.secUser u on        
u.id = ui.id and
u.active = true

INNER JOIN TX.secAuth a on
a.whoType = 'user' and
a.who = u.id and
a.whatType = 'role' and
now() between ifnull(a.startDate, '0000-00-00') and ifnull(a.endDate, '9999-12-31')

INNER JOIN TX.secData data on
data.dataId = a.dataId and
data.sys = "iavm" and
data.dataType = "rep" and
data.d1 != '*' and
data.d2 != '*'
INNER JOIN IAVM.rep r on
data.d1 = r.branchCode and
data.d2 = r.repId
LEFT JOIN TX.secRole sr on
sr.roleId = a.what and
sr.func in ("isAdvisor", "isAssistant", "isBranchManager", "isRVP")

UNION

SELECT distinct
r.repId as repId,
ui.repId as mainRepId,
ui.id as userId,
a.what as roleId,
sr.func
FROM IAVM.userInfo ui
INNER JOIN TX.secUser u on        
u.id = ui.id and
u.active = true
INNER JOIN TX.secAuth a on
a.whoType = 'user' and
a.who = u.id and
a.whatType = 'role' and
now() between ifnull(a.startDate, '0000-00-00') and ifnull(a.endDate, '9999-12-31')
INNER JOIN TX.secData data on
data.dataId = a.dataId and
data.sys = "iavm" and
data.dataType = "rep" and
data.d1 != '*' and
data.d2 = '*'
INNER JOIN IAVM.rep r on
data.d1 = r.branchCode
LEFT JOIN TX.secRole sr on
sr.roleId = a.what and
sr.func in ("isAdvisor", "isAssistant", "isBranchManager", "isRVP")

UNION

SELECT distinct
r.repId as repId,
ui.repId as mainRepId,
ui.id as userId,
a.what as roleId,
sr.func
FROM IAVM.userInfo ui

INNER JOIN TX.secUser u on        
u.id = ui.id and
u.active = true

INNER JOIN TX.secAuth a on
a.whoType = 'user' and
a.who = u.id and
a.whatType = 'role' and
now() between ifnull(a.startDate, '0000-00-00') and ifnull(a.endDate, '9999-12-31')

INNER JOIN TX.secData data on
data.dataId = a.dataId and
data.sys = "iavm" and
data.dataType = "rep" and
data.d1 = '*' and
data.d2 = '*'

INNER JOIN IAVM.rep r

LEFT JOIN TX.secRole sr on
sr.roleId = a.what and
sr.func in ("isAdvisor", "isAssistant", "isBranchManager", "isRVP")

ORDER BY repId;