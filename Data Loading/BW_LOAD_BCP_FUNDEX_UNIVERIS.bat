@echo off

SET ENVIRONMENT=IAW_POC_PROD
SET SOURCE=FUNDEX_POCIA
SET LOAD_DATE=2022/05/01

REM REM Delete old files
REM echo Deleting old splitting result files for "%~dp0\CSV\*.csv"
REM for /r %%j in (.\CSV\*.csv) do (
REM del "%%j"
REM )
REM echo Deleting old splitting result files for "%~dp0\CSV\*.csv.gz"
REM for /r %%j in (.\CSV\*.csv.gz) do (
REM del "%%j"
REM ) 

@echo SnowSQL -c %ENVIRONMENT%_%SOURCE% -f "%~dp0\BW_SNOWFLAKE_LOAD.sql"> BW_SNOWFLAKE_LOAD.bat
@echo --Load script>BW_SNOWFLAKE_LOAD.sql

for /r %%j in (BCP\*.bcp) do (
cscript.exe SPLIT.vbs "%%j" "%~dp0\CSV\%%~nj"
@echo put 'file://%~dp0CSV\%%~nj*.csv.gz' @%SOURCE%.UNIVERIS_stage/%LOAD_DATE%/%%~nj OVERWRITE=true;>>BW_SNOWFLAKE_LOAD.sql
)

for /r %%k in (BCP\*.bcp) do (
@echo copy into %SOURCE%.%%~nk from @%SOURCE%.UNIVERIS_stage/%LOAD_DATE%/%%~nk file_format=(format_name=PIPE_UTF16^);>>BW_SNOWFLAKE_LOAD.sql
)

REM Remove new lines
Powershell -Command "(gc 'BW_SNOWFLAKE_LOAD.sql').replace('\', '\\') | Out-File -encoding ASCII 'BW_SNOWFLAKE_LOAD.sql'"

REM REM Zipping csv files
REM echo Zipping files
REM for /r %%j in (.\CSV\*.csv) do (
REM 7z a "%%j.gz" "%%j"
REM ) 

echo Loading in Snowflake
call BW_SNOWFLAKE_LOAD.bat

pause
