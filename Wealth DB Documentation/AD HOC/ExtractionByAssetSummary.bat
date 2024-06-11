@echo off
echo Extracting From API for Asset Summary ...

set list="2021-04-30" "2021-05-31" "2021-06-30" "2021-07-30" "2021-08-31" "2021-09-30" "2021-10-29" "2021-11-30" "2021-12-31" "2022-01-31" "2022-02-28" "2022-03-31" "2022-04-29"
for %%A in (%list%) do (
	echo Date: %%A
)
pause

FOR %%A in (%list%) DO (
	ECHO Date: %%A
	REM ASSET_SUMMARY_BY_COMMISSIONTYPE
	curl -X GET "http://prod.portal.iagto.ca:90/iavm-ser-api/v1/assets/assetsSummary?assetsBy=commType&processDate=%%A" -H "accept: application/json" -H "Authorization: c3RyYXRlZ2ljZGFzaGJvYXJkYmk6NWQwYjYzZjhjYzZlYmU4ZWMwNGYzNDFhMTlhNThjY2RkNzUyZmE3MzJjZTBjMzE0Y2E2YWZiMDIwYWQ1OGRhZWIzNDNjY2U1ZmZiZjQ0MDc6c3RyYXRlZ2ljZGFzaGJvYXJkYmk=" -H "Accept-Language: en" -H "X-Session-Id: 1" -H "X-request-Id: 1" > Output\assetsSummaryByCommType__%%A.json
	REM ASSET_SUMMARY_BY_PRODUCT
	curl -X GET "http://prod.portal.iagto.ca:90/iavm-ser-api/v1/assets/assetsSummary?assetsBy=product&processDate=%%A" -H "accept: application/json" -H "Authorization: c3RyYXRlZ2ljZGFzaGJvYXJkYmk6NWQwYjYzZjhjYzZlYmU4ZWMwNGYzNDFhMTlhNThjY2RkNzUyZmE3MzJjZTBjMzE0Y2E2YWZiMDIwYWQ1OGRhZWIzNDNjY2U1ZmZiZjQ0MDc6c3RyYXRlZ2ljZGFzaGJvYXJkYmk=" -H "Accept-Language: en" -H "X-Session-Id: 1" -H "X-request-Id: 1" > Output\assetsSummaryByProduct__%%A.json
	REM ASSETS_SUMMARY_BY_ACCOUNT_TYPE
	curl -X GET "http://prod.portal.iagto.ca:90/iavm-ser-api/v1/assets/assetsSummary?assetsBy=accountType&processDate=%%A" -H "accept: application/json" -H "Authorization: c3RyYXRlZ2ljZGFzaGJvYXJkYmk6NWQwYjYzZjhjYzZlYmU4ZWMwNGYzNDFhMTlhNThjY2RkNzUyZmE3MzJjZTBjMzE0Y2E2YWZiMDIwYWQ1OGRhZWIzNDNjY2U1ZmZiZjQ0MDc6c3RyYXRlZ2ljZGFzaGJvYXJkYmk=" -H "Accept-Language: en" -H "X-Session-Id: 1" -H "X-request-Id: 1" > Output\assetsSummaryByAccountType__%%A.json
	REM ASSETS_SUMMARY_BY_COMMISSIONTYPE_AND_PRODUCT
	curl -X GET "http://prod.portal.iagto.ca:90/iavm-ser-api/v1/assets/assetsSummary?assetsBy=commTypeAndProduct&processDate=%%A" -H "accept: application/json" -H "Authorization: c3RyYXRlZ2ljZGFzaGJvYXJkYmk6NWQwYjYzZjhjYzZlYmU4ZWMwNGYzNDFhMTlhNThjY2RkNzUyZmE3MzJjZTBjMzE0Y2E2YWZiMDIwYWQ1OGRhZWIzNDNjY2U1ZmZiZjQ0MDc6c3RyYXRlZ2ljZGFzaGJvYXJkYmk=" -H "Accept-Language: en" -H "X-Session-Id: 1" -H "X-request-Id: 1" > Output\assetsSummaryByCommTypeAndProduct__%%A.json
	REM ASSETS_SUMMARY_BYPROVINCE
	curl -X GET "http://prod.portal.iagto.ca:90/iavm-ser-api/v1/assets/assetsSummary?assetsBy=province&processDate=%%A" -H "accept: application/json" -H "Authorization: c3RyYXRlZ2ljZGFzaGJvYXJkYmk6NWQwYjYzZjhjYzZlYmU4ZWMwNGYzNDFhMTlhNThjY2RkNzUyZmE3MzJjZTBjMzE0Y2E2YWZiMDIwYWQ1OGRhZWIzNDNjY2U1ZmZiZjQ0MDc6c3RyYXRlZ2ljZGFzaGJvYXJkYmk=" -H "Accept-Language: en" -H "X-Session-Id: 1" -H "X-request-Id: 1" > Output\assetsSummaryByProvince__%%A.json
)
pause 

echo Extracting From API for Asset Summary by RVPs ...
FOR /L %%X IN (1,1,7) DO (
	FOR %%A in (%list%) DO (
	ECHO rvpId-%%X Date: %%A
	REM ASSET_SUMMARY_BY_COMMISSIONTYPE_RVP
	curl -X GET "http://prod.portal.iagto.ca:90/iavm-ser-api/v1/assets/assetsSummary?assetsBy=commType&rvpId=%%X&processDate=%%A" -H "accept: application/json" -H "Authorization: c3RyYXRlZ2ljZGFzaGJvYXJkYmk6NWQwYjYzZjhjYzZlYmU4ZWMwNGYzNDFhMTlhNThjY2RkNzUyZmE3MzJjZTBjMzE0Y2E2YWZiMDIwYWQ1OGRhZWIzNDNjY2U1ZmZiZjQ0MDc6c3RyYXRlZ2ljZGFzaGJvYXJkYmk=" -H "Accept-Language: en" -H "X-Session-Id: 1" -H "X-request-Id: 1" > Output\assetsSummaryByCommType_RVP#%%X__%%A.json
	REM ASSET_SUMMARY_BY_PRODUCT_RVP
	curl -X GET "http://prod.portal.iagto.ca:90/iavm-ser-api/v1/assets/assetsSummary?assetsBy=product&rvpId=%%X&processDate=%%A" -H "accept: application/json" -H "Authorization: c3RyYXRlZ2ljZGFzaGJvYXJkYmk6NWQwYjYzZjhjYzZlYmU4ZWMwNGYzNDFhMTlhNThjY2RkNzUyZmE3MzJjZTBjMzE0Y2E2YWZiMDIwYWQ1OGRhZWIzNDNjY2U1ZmZiZjQ0MDc6c3RyYXRlZ2ljZGFzaGJvYXJkYmk=" -H "Accept-Language: en" -H "X-Session-Id: 1" -H "X-request-Id: 1" > Output\assetsSummaryByProduct_RVP#%%X__%%A.json
	REM ASSETS_SUMMARY_BY_ACCOUNT_TYPE_RVP
	curl -X GET "http://prod.portal.iagto.ca:90/iavm-ser-api/v1/assets/assetsSummary?assetsBy=accountType&rvpId=%%X&processDate=%%A" -H "accept: application/json" -H "Authorization: c3RyYXRlZ2ljZGFzaGJvYXJkYmk6NWQwYjYzZjhjYzZlYmU4ZWMwNGYzNDFhMTlhNThjY2RkNzUyZmE3MzJjZTBjMzE0Y2E2YWZiMDIwYWQ1OGRhZWIzNDNjY2U1ZmZiZjQ0MDc6c3RyYXRlZ2ljZGFzaGJvYXJkYmk=" -H "Accept-Language: en" -H "X-Session-Id: 1" -H "X-request-Id: 1" > Output\assetsSummaryByAccountType_RVP#%%X__%%A.json
	REM ASSETS_SUMMARY_BY_COMMISSIONTYPE_AND_PRODUCT_RVP
	curl -X GET "http://prod.portal.iagto.ca:90/iavm-ser-api/v1/assets/assetsSummary?assetsBy=commTypeAndProduct&rvpId=%%X&processDate=%%A" -H "accept: application/json" -H "Authorization: c3RyYXRlZ2ljZGFzaGJvYXJkYmk6NWQwYjYzZjhjYzZlYmU4ZWMwNGYzNDFhMTlhNThjY2RkNzUyZmE3MzJjZTBjMzE0Y2E2YWZiMDIwYWQ1OGRhZWIzNDNjY2U1ZmZiZjQ0MDc6c3RyYXRlZ2ljZGFzaGJvYXJkYmk=" -H "Accept-Language: en" -H "X-Session-Id: 1" -H "X-request-Id: 1" > Output\assetsSummaryByCommTypeAndProduct_RVP#%%X__%%A.json
	REM ASSETS_SUMMARY_BYPROVINCE_RVP
	curl -X GET "http://prod.portal.iagto.ca:90/iavm-ser-api/v1/assets/assetsSummary?assetsBy=province&rvpId=%%X&processDate=%%A" -H "accept: application/json" -H "Authorization: c3RyYXRlZ2ljZGFzaGJvYXJkYmk6NWQwYjYzZjhjYzZlYmU4ZWMwNGYzNDFhMTlhNThjY2RkNzUyZmE3MzJjZTBjMzE0Y2E2YWZiMDIwYWQ1OGRhZWIzNDNjY2U1ZmZiZjQ0MDc6c3RyYXRlZ2ljZGFzaGJvYXJkYmk=" -H "Accept-Language: en" -H "X-Session-Id: 1" -H "X-request-Id: 1" > Output\assetsSummaryByProvince_RVP#%%X__%%A.json
	)
)
ECHO JOB DONE !!
