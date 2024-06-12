@echo off

SET ENVIRONMENT=IAW_POC_PROD
SET SOURCE=IAS_IAVM_POCIA
SET LOAD_DATE=2022/05/01

REM Delete old files
echo Deleting old splitting result files for "%~dp0\CSV\*.csv"
for /r %%j in (.\CSV\*.csv) do (
del "%%j"
)
echo Deleting old splitting result files for "%~dp0\CSV\*.csv.gz"
for /r %%j in (.\CSV\*.csv.gz) do (
del "%%j"
) 

@echo SnowSQL -c %ENVIRONMENT%_%SOURCE% -f "%~dp0\BW_SNOWFLAKE_LOAD.sql"> BW_SNOWFLAKE_LOAD.bat
@echo --Load script>BW_SNOWFLAKE_LOAD.sql

for /r %%j in (BCP\*.bcp) do (
cscript.exe SPLIT.vbs "%%j" "%~dp0\CSV\%%~nj"
@echo put 'file://%~dp0CSV\%%~nj*.csv.gz' @%SOURCE%.IAVM_stage/%LOAD_DATE%/%%~nj OVERWRITE=true;>>BW_SNOWFLAKE_LOAD.sql
)

for /r %%k in (BCP\*.bcp) do (
@echo copy into %SOURCE%.%%~nk from @%SOURCE%.IAVM_stage/%LOAD_DATE%/%%~nk file_format=(format_name=PIPE_UTF16^);>>BW_SNOWFLAKE_LOAD.sql
)

REM Remove new lines
Powershell -Command "(gc 'BW_SNOWFLAKE_LOAD.sql').replace('\', '\\') | Out-File -encoding ASCII 'BW_SNOWFLAKE_LOAD.sql'"

REM Zipping csv files
echo Zipping files
for /r %%j in (.\CSV\*.csv) do (
7z a "%%j.gz" "%%j"
) 

echo Loading in Snowflake
call BW_SNOWFLAKE_LOAD.bat

pause
