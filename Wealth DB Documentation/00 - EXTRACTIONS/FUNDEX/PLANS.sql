select 
NULLIF(REPLACE(REPLACE(PLN_CD, CHAR(13), ''), CHAR(10), ''),'') AS PLN_CD,
PLN_REG,
NULLIF(REPLACE(REPLACE(PLN_MNEM, CHAR(13), ''), CHAR(10), ''),'') AS PLN_MNEM,
NULLIF(REPLACE(REPLACE(PLN_DESC, CHAR(13), ''), CHAR(10), ''),'') AS PLN_DESC,
NULLIF(REPLACE(REPLACE(PLN_MNEM_F, CHAR(13), ''), CHAR(10), ''),'') AS PLN_MNEM_F,
NULLIF(REPLACE(REPLACE(PLN_DESC_F, CHAR(13), ''), CHAR(10), ''),'') AS PLN_DESC_F,
NULLIF(REPLACE(REPLACE(PLN_MNEM_ENG, CHAR(13), ''), CHAR(10), ''),'') AS PLN_MNEM_ENG,
NULLIF(REPLACE(REPLACE(PLN_DESC_ENG, CHAR(13), ''), CHAR(10), ''),'') AS PLN_DESC_ENG,
NULLIF(REPLACE(REPLACE(PLN_SHORT_DESC_ENG, CHAR(13), ''), CHAR(10), ''),'') AS PLN_SHORT_DESC_ENG,
NULLIF(REPLACE(REPLACE(PLN_MNEM_FRE, CHAR(13), ''), CHAR(10), ''),'') AS PLN_MNEM_FRE,
NULLIF(REPLACE(REPLACE(PLN_DESC_FRE, CHAR(13), ''), CHAR(10), ''),'') AS PLN_DESC_FRE,
NULLIF(REPLACE(REPLACE(PLN_SHORT_DESC_FRE, CHAR(13), ''), CHAR(10), ''),'') AS PLN_SHORT_DESC_FRE,
NULLIF(REPLACE(REPLACE(STMT.STMT_GROUP_MNEM_ENG, CHAR(13), ''), CHAR(10), ''),'') AS STMT_GROUP_MNEM,
CONVERT(DATE, GETDATE()) AS MD_LOADDATE,
'FUNDEX-UNIVERIS' AS MD_SRCSYSTEM
from dbo.S_PLN_CD (nolock)
inner join S_PLN_STMT_GROUP STMT (nolock)  
on S_PLN_CD.STMT_GROUP = STMT.ID 
ORDER BY PLN_MNEM,STMT.STMT_GROUP_MNEM_ENG