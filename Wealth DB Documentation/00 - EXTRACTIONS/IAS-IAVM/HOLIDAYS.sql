SELECT h.holidayDate, h.description,
	CURDATE() AS MD_LOADDATE,
	'IAS_IAVM' AS MD_SRCSYSTEM 
FROM IAVM.holiday h
ORDER BY h.holidayDate