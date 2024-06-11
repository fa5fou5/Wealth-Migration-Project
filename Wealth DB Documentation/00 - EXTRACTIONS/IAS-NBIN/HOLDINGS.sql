

SELECT 
	REPLACE(REPLACE(PS.A_C_ID, CHAR(13), ''), CHAR(10), '') AS A_C_ID,
	REPLACE(REPLACE(PS.A_C_Representative, CHAR(13), ''), CHAR(10), '') AS A_C_Representative,
	REPLACE(REPLACE(PS.TI_Alternate_ID, CHAR(13), ''), CHAR(10), '') AS TI_Alternate_ID, 
	PS.Tran_Summ_Curr_Mkt_Value,
	#PS.Tran_Summ_Sett_Qty * PS.Tran_Summ_Curr_Mkt_Price,
	PS.Tran_Summ_Business_Date,
	REPLACE(REPLACE(PS.TI_Alternate_TI_Type, CHAR(13), ''), CHAR(10), '') AS TI_Alternate_TI_Type,
	PS.B_V_Security_Position_Val,
	PS.B_V_Security_Position_Cos,
	PS.Tran_Summ_Avg_Unit_Cost,
	PS.Tran_Summ_Net_Sett_Amt,
	REPLACE(REPLACE(PS.Tran_Summ_Currency, CHAR(13), ''), CHAR(10), '') AS Tran_Summ_Currency,
	PS.Tran_Summ_Sett_Qty,
	PS.Tran_Summ_Trade_Qty,
	CURDATE() AS MD_LOADDATE,
	'IAS' AS MD_SRCSYSTEM 
 FROM BACKOFFICE.IAVMPSN PS
 WHERE PS.Tran_Summ_Business_Date <> '0000-00-00'
 ORDER BY PS.A_C_ID,PS.A_C_Representative,PS.TI_Alternate_ID
 
