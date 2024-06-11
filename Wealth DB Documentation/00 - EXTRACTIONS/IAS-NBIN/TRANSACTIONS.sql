SELECT 
DISTINCT
REPLACE(REPLACE(B.A_C_ID, CHAR(13), ''), CHAR(10), '') AS A_C_ID,
REPLACE(REPLACE(B.A_C_Representative, CHAR(13), ''), CHAR(10), '') AS A_C_Representative,
REPLACE(REPLACE(B.TI_Alternate_ID, CHAR(13), ''), CHAR(10), '') AS TI_Alternate_ID, 
REPLACE(REPLACE(B.TI_Alternate_TI_Type, CHAR(13), ''), CHAR(10), '') AS TI_Alternate_TI_Type,
REPLACE(REPLACE(B.Tran_Entry_Description, CHAR(13), ''), CHAR(10), '') AS Tran_Entry_Description,
REPLACE(REPLACE(B.Tran_User_Description, CHAR(13), ''), CHAR(10), '') AS Tran_User_Description,
REPLACE(REPLACE(B.Tran_Type, CHAR(13), ''), CHAR(10), '') AS Tran_Trading_Type,
B.Transaction,
CAST(B.Tran_Gross_Amt as CHAR) AS Tran_Trading_Gross_Amt,
REPLACE(REPLACE(B.Tran_Currency, CHAR(13), ''), CHAR(10), '') AS Tran_Trading_Currency,
NULL,
B.Tran_Trade_Date,
B.Tran_Settlement_Date,
B.Tran_Process_Date,
B.TI_Symbol,
CAST(B.Tran_Qty as CHAR) as Tran_Qty,
B.TI_Primary_Market,
B.Tran_Txn_Reference_ID,
CAST(Tran_Amount_2 as CHAR) AS Tran_Amount_2,
'IAVMBK' AS MD_Src,
CURDATE() AS MD_LOADDATE,
'IAS' AS MD_SRCSYSTEM,
CAST(B.TI_Underlying_CDN_Price as CHAR) as TI_Underlying_CDN_Price,
CAST(B.TI_Basis_Point as CHAR) as TI_Basis_Point,
CAST(B.TI_Face_Value as CHAR) as TI_Face_Value,
CAST(B.TI_Issue_Price as CHAR) as TI_Issue_Price,
CAST(B.STRIKE_PRICE as CHAR) as STRIKE_PRICE,
CAST(B.TI_Underlying_USD_Price as CHAR) as TI_Underlying_USD_Price
FROM IAVMBK B
WHERE B.Tran_Process_Date = SUBDATE(CURDATE(), 1) 
ORDER BY B.A_C_ID,B.A_C_Representative,B.TI_Alternate_ID;


