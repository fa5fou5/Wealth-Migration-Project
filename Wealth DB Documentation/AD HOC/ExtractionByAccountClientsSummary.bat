@echo off
echo Extracting From API for Account Clients Summary ...

set list="2021-04-30" "2021-05-31" "2021-06-30" "2021-07-31" "2021-08-31" "2021-09-30" "2021-10-31" "2021-11-30" "2021-12-31" "2022-01-31" "2022-02-28" "2022-03-31" "2022-04-30"
for %%A in (%list%) do (
	echo Date: %%A
)
pause

FOR %%A in (%list%) DO (
	ECHO Date: %%A
	REM ACCOUNTS_CLIENTS_SUMMARY
	curl -X GET "http://prod.portal.iagto.ca:90/iavm-ser-api/v1/assets/accountsAndClientsSummary?processDate=%%A" -H "accept: application/json" -H "Authorization: c3RyYXRlZ2ljZGFzaGJvYXJkYmk6NWQwYjYzZjhjYzZlYmU4ZWMwNGYzNDFhMTlhNThjY2RkNzUyZmE3MzJjZTBjMzE0Y2E2YWZiMDIwYWQ1OGRhZWIzNDNjY2U1ZmZiZjQ0MDc6c3RyYXRlZ2ljZGFzaGJvYXJkYmk=" -H "Accept-Language: en" -H "X-Session-Id: 1" -H "X-request-Id: 1" > Output\accountsAndClientsSummary__%%A.json
)
pause 

echo Extracting From API for Account Clients by RVPs ...
FOR /L %%X IN (1,1,7) DO (
	FOR %%A in (%list%) DO (
	ECHO rvpId-%%X Date: %%A
	REM ACCOUNTS_CLIENTS_SUMMARY_RVP
	curl -X GET "http://prod.portal.iagto.ca:90/iavm-ser-api/v1/assets/accountsAndClientsSummary?rvpId=%%X&processDate=%%A" -H "accept: application/json" -H "Authorization: c3RyYXRlZ2ljZGFzaGJvYXJkYmk6NWQwYjYzZjhjYzZlYmU4ZWMwNGYzNDFhMTlhNThjY2RkNzUyZmE3MzJjZTBjMzE0Y2E2YWZiMDIwYWQ1OGRhZWIzNDNjY2U1ZmZiZjQ0MDc6c3RyYXRlZ2ljZGFzaGJvYXJkYmk=" -H "Accept-Language: en" -H "X-Session-Id: 1" -H "X-request-Id: 1" > Output\accountsAndClientsSummary_RVP#%%X__%%A.json
	)
)
ECHO JOB DONE !!
