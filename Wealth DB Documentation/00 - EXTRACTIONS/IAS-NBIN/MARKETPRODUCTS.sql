SELECT DISTINCT  
	REPLACE(REPLACE(SM.TI_Alternate_ID, CHAR(13), ''), CHAR(10), '') AS TI_Alternate_ID,
	REPLACE(REPLACE(SM.TI_Alternate_TI_Type, CHAR(13), ''), CHAR(10), '') AS TI_Alternate_TI_Type,
	REPLACE(REPLACE(SM.TI_Type, CHAR(13), ''), CHAR(10), '') AS TI_Type, 
	REPLACE(REPLACE(SM.TI_Alternate_TI_Class, CHAR(13), ''), CHAR(10), '') AS TI_Alternate_TI_Class,
	REPLACE(REPLACE(SM.TI_Class, CHAR(13), ''), CHAR(10), '') AS TI_Class,
	REPLACE(REPLACE(SM.TI_Alternate_Short_Desc, CHAR(13), ''), CHAR(10), '') AS TI_Alternate_Short_Desc,
	REPLACE(REPLACE(SM.English_Description, CHAR(13), ''), CHAR(10), '') AS English_Description,
	REPLACE(REPLACE(SM.TI_Symbol, CHAR(13), ''), CHAR(10), '') AS TI_Symbol,
	CURDATE() AS MD_LOADDATE,
	'IAS' AS MD_SRCSYSTEM	 
FROM IAVMSM SM
WHERE SM.TI_Alternate_ID <> '\\'
ORDER BY TI_Type, TI_Class, TI_Alternate_ID 
#INTO OUTFILE 'C:\\BW_IAS_EXPORT_ACCP\\MARKETPRODUCTS.bcp' FIELDS TERMINATED BY '|' LINES TERMINATED BY '\r\n';

