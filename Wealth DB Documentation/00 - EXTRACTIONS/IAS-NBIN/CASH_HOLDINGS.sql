 SELECT
 	REPLACE(REPLACE(V.A_C_ID, CHAR(13), ''), CHAR(10), '') AS A_C_ID,
	REPLACE(REPLACE(V.A_C_Representative, CHAR(13), ''), CHAR(10), '') AS A_C_Representative,
	V.A_C_Summ_Balance_Bus_Date AS A_C_Summ_Balance_Bus_Date,
	V.A_C_Summ_SD_Net_Amt AS A_C_Summ_SD_Net_Amt,
	V.A_C_Summ_TD_Net_Amt AS A_C_Summ_TD_Net_Amt, 
	REPLACE(REPLACE(V.A_C_Currency, CHAR(13), ''), CHAR(10), '') AS A_C_Currency,
	CURDATE() AS MD_LOADDATE,
	'IAS' AS MD_SRCSYSTEM
 FROM IAVMVAL V
 WHERE V.A_C_Summ_Balance_Bus_Date <> '0000-00-00'
 ORDER BY V.A_C_ID,V.A_C_Representative
 