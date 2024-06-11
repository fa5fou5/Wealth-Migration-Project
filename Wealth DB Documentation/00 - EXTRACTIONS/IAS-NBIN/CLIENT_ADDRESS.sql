SELECT
UADR.A_C_Client,
CONVERT(SHA2(CONCAT(TRIM(UPPER(ADR.Unit_Number)), '||', TRIM(UPPER(ADR.Civ_Number)), '||', TRIM(UPPER(ADR.Street_Name)), '||', TRIM(UPPER(ADR.Address_Postal_Code)), 'ssgqirtuncvv bxsnnsjs 14fsdfd &&***'),256),CHAR(66)) AS HSH
FROM
(
SELECT
DISTINCT
A_C_Client,
Address_ID,
A_C_LAST_UPDATE_DATE
FROM
BACKOFFICE.IAVMADR ADR
WHERE A_C_Use_Client_Address ='Y'
AND LENGTH(A_C_ID)>2
AND Major_Sort =1
AND A_C_Inventory_Account_Sw !='Y'
AND LENGTH(TRIM(Civ_Number))>0
AND LENGTH(TRIM(Street_Name))>0
AND LENGTH(TRIM(Address_Postal_Code))>0
AND A_C_LAST_UPDATE_DATE = (
SELECT MAX(A_C_LAST_UPDATE_DATE)
FROM BACKOFFICE.IAVMADR LA
WHERE LA.A_C_Client = ADR.A_C_Client
AND LA.A_C_Use_Client_Address ='Y'
AND LENGTH(LA.A_C_ID)>2
AND LA.Major_Sort =1
AND LA.A_C_Inventory_Account_Sw !='Y'
AND LENGTH(TRIM(LA.Civ_Number))>0
AND LENGTH(TRIM(LA.Street_Name))>0
AND LENGTH(TRIM(LA.Address_Postal_Code))>0  )
GROUP BY A_C_Client
) UADR
LEFT OUTER JOIN
BACKOFFICE.IAVMADR ADR
ON UADR.Address_ID=ADR.Address_ID;
