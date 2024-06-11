SELECT DISTINCT
    REPLACE(REPLACE(AC.A_C_client, CHAR(13), ''), CHAR(10), '') AS A_C_client,
    '' AS SIN_HASH,
    CASE WHEN AC.Client_Birth_Date = '0000-00-00' THEN NULL
    ELSE STR_TO_DATE(CONCAT('01-',MONTH(AC.Client_Birth_Date),'-',YEAR(AC.Client_Birth_Date)),'%d-%m-%Y') END AS Client_Birth_Date,
    REPLACE(REPLACE(AC.Client_Tax_Recip_Type, CHAR(13), ''), CHAR(10), '') AS Client_Tax_Recip_Type,
    REPLACE(REPLACE(AC.Client_Residence, CHAR(13), ''), CHAR(10), '') AS Client_Residence,
    REPLACE(REPLACE(AC.Client_Residence_Region, CHAR(13), ''), CHAR(10), '') AS Client_Residence_Region,
    REPLACE(REPLACE(AC.Client_Annual_Gross_Inc, CHAR(13), ''), CHAR(10), '') AS Client_Annual_Gross_Inc,
    Client_Init_Contact_Date,
    CURDATE() AS MD_LOADDATE,
    'IAS' AS MD_SRCSYSTEM,Client_Inv_Knowledge_Lvl,
    REPLACE(REPLACE(MAX(AC.A_C_Name), CHAR(13), ''), CHAR(10), '') AS A_C_Name,
    REPLACE(REPLACE(MAX(AC.A_C_First_Name), CHAR(13), ''), CHAR(10), '') AS A_C_First_Name,
    REPLACE(REPLACE(MAX(AC.A_C_Middle_Name), CHAR(13), ''), CHAR(10), '') AS A_C_Middle_Name,
    REPLACE(REPLACE(MAX(AC.A_C_Last_Name), CHAR(13), ''), CHAR(10), '') AS A_C_Last_Name,
    REPLACE(REPLACE(MAX(AC.Client_First_Name), CHAR(13), ''), CHAR(10), '') AS Client_First_Name,
    REPLACE(REPLACE(MAX(AC.Client_Last_Name), CHAR(13), ''), CHAR(10), '') AS Client_Last_Name
FROM IAVMACT AC
WHERE loadstamp > '1899-12-30 00:00:00'
group by
    REPLACE(REPLACE(AC.A_C_client, CHAR(13), ''), CHAR(10), ''),AC.Client_Birth_Date,
    REPLACE(REPLACE(AC.Client_Tax_Recip_Type, CHAR(13), ''), CHAR(10), ''),
    REPLACE(REPLACE(AC.Client_Residence, CHAR(13), ''), CHAR(10), ''),
    REPLACE(REPLACE(AC.Client_Residence_Region, CHAR(13), ''), CHAR(10), ''),
    REPLACE(REPLACE(AC.Client_Annual_Gross_Inc, CHAR(13), ''), CHAR(10), ''),
    REPLACE(REPLACE(AC.Client_Init_Contact_Date, CHAR(13), ''), CHAR(10), ''),
    CURDATE(),
    'IAS',Client_Inv_Knowledge_Lvl
ORDER BY AC.A_C_client