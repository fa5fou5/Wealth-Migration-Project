--Load script
put 'file://C:\\Users\\li2jdc\\Documents\\POC Monthly Manual Extract\\MONTHLY_REFRESH_IA_WEALTH_TOOLS\\DATA LOADING\\CSV\\HOLDINGS*.csv.gz' @IAS_POCIA.CDB_BO_stage/2022/05/01/HOLDINGS OVERWRITE=true;
copy into IAS_POCIA.HOLDINGS from @IAS_POCIA.CDB_BO_stage/2022/05/01/HOLDINGS file_format=(format_name=PIPE_UTF16);
