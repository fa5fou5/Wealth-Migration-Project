SELECT DISTINCT 
    REPLACE(REPLACE(AC.A_C_ID, CHAR(13), ''), CHAR(10), '') AS A_C_ID, 
    REPLACE(REPLACE(AC.A_C_Client, CHAR(13), ''), CHAR(10), '') AS A_C_Client, 
    REPLACE(REPLACE(AC.A_C_Representative, CHAR(13), ''), CHAR(10), '') AS A_C_Representative, 
    'Broker/Nominee', 
    A_C_Open_Date, 
    A_C_Closing_Date,
    REPLACE(REPLACE(AC.A_C_Account_Class, CHAR(13), ''), CHAR(10), '') AS A_C_Account_Class, 
    REPLACE(REPLACE(AC.Retail_plan, CHAR(13), ''), CHAR(10), '') AS Retail_plan, 
    REPLACE(REPLACE(AC.Retail_Plan_RESP, CHAR(13), ''), CHAR(10), '') AS Retail_Plan_RESP,
    REPLACE(REPLACE(AC.Account_Rap_Code, CHAR(13), ''), CHAR(10), '') AS Account_Rap_Code, 
    REPLACE(REPLACE(AC.ASC_3_Managed_Type, CHAR(13), ''), CHAR(10), '') AS ASC_3_Managed_Type, 
    REPLACE(REPLACE(AC.A_C_Special_Tag, CHAR(13), ''), CHAR(10), '') AS A_C_Special_Tag,
    REPLACE(REPLACE(AC.ASC_1_RESP_Plan_Types, CHAR(13), ''), CHAR(10), '') AS ASC_1_RESP_Plan_Types ,
    CURDATE() AS MD_LOADDATE,
    'IAS' AS MD_SRCSYSTEM,
    REPLACE(REPLACE(AC.A_C_Currency, CHAR(13), ''), CHAR(10), '') AS A_C_Currency,
    AC.Ivt_Obj_Cde, 
    AC.Risk_Tolerance,
    CLU.docLastUpdate,
    CAST(R.managedInd AS CHAR) AS managedInd 
FROM BACKOFFICE.IAVMACT AC
LEFT JOIN 
(SELECT clientId, repId, MAX(docLastUpdate) as docLastUpdate FROM IAVM.clientLastUpdate group by clientId, repId) CLU
ON CLU.clientId = AC.A_C_Client AND CLU.repId = AC.A_C_Representative 
LEFT JOIN IAVM.rep R
ON R.repId = AC.A_C_Representative 
WHERE loadstamp > '1899-12-30 00:00:00'
ORDER BY 
A_C_ID, 
A_C_Client, 
A_C_Representative


--before KYC: 
/*SELECT DISTINCT 
    REPLACE(REPLACE(AC.A_C_ID, CHAR(13), ''), CHAR(10), '') AS A_C_ID, 
    REPLACE(REPLACE(AC.A_C_Client, CHAR(13), ''), CHAR(10), '') AS A_C_Client, 
    REPLACE(REPLACE(AC.A_C_Representative, CHAR(13), ''), CHAR(10), '') AS A_C_Representative, 
    'Broker/Nominee', 
    A_C_Open_Date, 
    A_C_Closing_Date,
    REPLACE(REPLACE(AC.A_C_Account_Class, CHAR(13), ''), CHAR(10), '') AS A_C_Account_Class, 
    REPLACE(REPLACE(AC.Retail_plan, CHAR(13), ''), CHAR(10), '') AS Retail_plan, 
    REPLACE(REPLACE(AC.Retail_Plan_RESP, CHAR(13), ''), CHAR(10), '') AS Retail_Plan_RESP,
    REPLACE(REPLACE(AC.Account_Rap_Code, CHAR(13), ''), CHAR(10), '') AS Account_Rap_Code, 
    REPLACE(REPLACE(AC.ASC_3_Managed_Type, CHAR(13), ''), CHAR(10), '') AS ASC_3_Managed_Type, 
    REPLACE(REPLACE(AC.A_C_Special_Tag, CHAR(13), ''), CHAR(10), '') AS A_C_Special_Tag,
    REPLACE(REPLACE(AC.ASC_1_RESP_Plan_Types, CHAR(13), ''), CHAR(10), '') AS ASC_1_RESP_Plan_Types ,
    CURDATE() AS MD_LOADDATE,
    'IAS' AS MD_SRCSYSTEM,
    REPLACE(REPLACE(AC.A_C_Currency, CHAR(13), ''), CHAR(10), '') AS A_C_Currency,
    Ivt_Obj_Cde, 
    Risk_Tolerance
FROM IAVMACT AC
WHERE loadstamp > '1899-12-30 00:00:00'
ORDER BY 
A_C_ID, 
A_C_Client, 
A_C_Representative*/