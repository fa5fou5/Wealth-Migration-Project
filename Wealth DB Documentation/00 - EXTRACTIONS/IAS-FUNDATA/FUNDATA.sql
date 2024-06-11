SELECT 	F.fundservId,
			F.fundId,
			F.fundDescFr,
			F.fundDescEn,
			F.fundType,
			F.groupNameFr,
			F.groupNameEn,
			F.rrspEligible,
			F.fundDescLongFr,
			F.fundDescLongEn,
			F.LegalNameEn,
			F.LegalNameFr,
			F.stamp,  
			CURDATE() AS MD_LOADDATE,
			'FUNDATA' AS MD_SRCSYSTEM	 
FROM FUNDATA.fund F
ORDER BY F.fundservId, F.fundId
#INTO OUTFILE 'C:\\BW_IAS_EXPORT_ACCP\\FUN.bcp' FIELDS TERMINATED BY '|' LINES TERMINATED BY '\r\n';

