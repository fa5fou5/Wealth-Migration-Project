DB_IAW_ACCP_DWH.TOOLS.SP_CONV_AUDIT_STARTJOB_NEXTDATE
DB_IAW_ACCP_DWH.TOOLS.SP_AUDIT_STARTJOB_NEXTDATE
are same but with a different name


CREATE OR REPLACE PROCEDURE DB_IAW_ACCP_DWH.TOOLS.SP_AUDIT_STARTJOB_NEXTDATE("ENV" VARCHAR(16777216), "JOB_NAME" VARCHAR(16777216), "AUDIT_ID" VARCHAR(16777216), "IO_RESULT" VARCHAR(16777216), "IO_DATASTARTDATE" VARCHAR(16777216))
RETURNS VARCHAR(16777216)
LANGUAGE JAVASCRIPT
EXECUTE AS OWNER
AS '
 var CALL_PROCEDURE = "DB_IAW_" + ENV + "_DWH.tools.USP_AUDIT_START_JOB_NEXT_DATE";
 var CALL_STMT_COMMAND =  "CALL " + CALL_PROCEDURE  + "(:1,:2 )";
 var CALL_STMT = snowflake.createStatement( {sqlText: CALL_STMT_COMMAND,binds:[JOB_NAME,AUDIT_ID]} );
 var tbl_obj = "DB_IAW_" + ENV + "_dwh.tools.audit_jobs_executions";
 var res = CALL_STMT.execute();
 var UPDATE_STMT_COMMAND = "update " + tbl_obj + " set job_action_result = greatest(?,DECODE(TRUE, JOB_STATUS is not null AND JOB_ACTION_RESULT=''SUCCESS'',''SUCCESS'',''ERROR'')),"
                          + "job_data_start_dt_result = greatest(to_date(?,''MM/DD/YYYY''),decode(TRUE,DECODE(TRUE, JOB_STATUS is not null AND JOB_ACTION_RESULT=''SUCCESS'',''SUCCESS'',''ERROR'') = ''SUCCESS'',data_start_dt,to_date(''2000-01-01'',''YYYY-MM-DD'')))"
+ " where job_status = ''IN PROGRESS'' AND UPPER(JOB_NAME) = UPPER(REPLACE(?,''CHAR(39)'',''''))";
CALL_STMT = snowflake.createStatement( {sqlText: UPDATE_STMT_COMMAND,binds:[IO_RESULT,IO_DATASTARTDATE,JOB_NAME]} );
res = CALL_STMT.execute();
var sle_query = "select job_action_result ,to_varchar(job_data_start_dt_result,''YYYY-MM-DD'') from " + tbl_obj + " where job_status = ''IN PROGRESS'' AND UPPER(JOB_NAME) = UPPER(REPLACE(?,''CHAR(39)'',''''))";
   CALL_STMT = snowflake.createStatement( {sqlText: sle_query,binds:[JOB_NAME]} );
 res = CALL_STMT.execute();
 res.next();
 
 return res.getColumnValue(1) + '','' + res.getColumnValue(2);
';
-- ============================ Rewritten in SQL Language
/*

This is a Snowflake stored procedure written in JavaScript language.  
The procedure takes in 5 input parameters - ENV, JOB_NAME, AUDIT_ID, IO_RESULT, 
IO_DATASTARTDATE - all of which are of type VARCHAR(16777216).  

The code executes a SQL statement that calls another stored procedure named 
"USP_AUDIT_START_JOB_NEXT_DATE" passing in JOB_NAME and AUDIT_ID as parameters. 
It then updates a table named "audit_jobs_executions" with the output of the 
previous SQL statement. The table is updated with the maximum value of IO_RESULT 
and IO_DATASTARTDATE based on the JOB_STATUS being "IN PROGRESS" and the JOB_NAME 
matching the input parameter.  

Finally, it executes a SELECT query on the same table and returns the concatenated 
string value of the "job_action_result" and "job_data_start_dt_result" columns.  

Overall, this stored procedure appears to be designed to audit and track job 
executions in the Snowflake data warehouse.

*/

CREATE OR REPLACE PROCEDURE DB_IAW_ACCP_DWH.TOOLS.SP_AUDIT_STARTJOB_NEXTDATE(  
    "ENV" VARCHAR,   
    "JOB_NAME" VARCHAR,   
    "AUDIT_ID" VARCHAR,   
    "IO_RESULT" VARCHAR,   
    "IO_DATASTARTDATE" VARCHAR)  
RETURNS VARCHAR  
LANGUAGE SQL  
EXECUTE AS OWNER  
AS  
$$  
    DECLARE  
        CALL_PROCEDURE VARCHAR := 'DB_IAW_' || ENV || '_DWH.tools.USP_AUDIT_START_JOB_NEXT_DATE';  
        CALL_STMT_COMMAND VARCHAR := 'CALL ' || CALL_PROCEDURE || '(:1, :2)';  
        UPDATE_STMT_COMMAND VARCHAR := 'UPDATE DB_IAW_' || ENV || '_dwh.tools.audit_jobs_executions SET job_action_result = GREATEST(?, DECODE(TRUE, JOB_STATUS IS NOT NULL AND JOB_ACTION_RESULT=''SUCCESS'', ''SUCCESS'', ''ERROR'')), job_data_start_dt_result = GREATEST(TO_DATE(?, ''MM/DD/YYYY''), DECODE(TRUE, DECODE(TRUE, JOB_STATUS IS NOT NULL AND JOB_ACTION_RESULT=''SUCCESS'', ''SUCCESS'', ''ERROR'') = ''SUCCESS'', data_start_dt, TO_DATE(''2000-01-01'', ''YYYY-MM-DD''))) WHERE job_status = ''IN PROGRESS'' AND UPPER(JOB_NAME) = UPPER(REPLACE(?, ''''''', '''''))';  
        SLE_QUERY VARCHAR := 'SELECT job_action_result || '','' || TO_VARCHAR(job_data_start_dt_result, ''YYYY-MM-DD'') FROM DB_IAW_' || ENV || '_dwh.tools.audit_jobs_executions WHERE job_status = ''IN PROGRESS'' AND UPPER(JOB_NAME) = UPPER(REPLACE(?, ''''''', '''''))';  
        JOB_RESULT VARCHAR;  
    BEGIN  
        EXECUTE IMMEDIATE CALL_STMT_COMMAND USING JOB_NAME, AUDIT_ID;  
        EXECUTE IMMEDIATE UPDATE_STMT_COMMAND USING IO_RESULT, IO_DATASTARTDATE, JOB_NAME;  
        SELECT job_action_result || ',' || TO_VARCHAR(job_data_start_dt_result, 'YYYY-MM-DD') INTO JOB_RESULT FROM DB_IAW_ACCP_DWH.TOOLS.AUDIT_JOBS_EXECUTIONS WHERE job_status = 'IN PROGRESS' AND UPPER(JOB_NAME) = UPPER(REPLACE(JOB_NAME, '''', ''''''));  
        RETURN JOB_RESULT;  
    END;  
$$;  




--=========================================================================
/*
This is a Snowflake stored procedure written in JavaScript that updates the status
of a job execution and determines when the job should be executed next. 
It checks the last execution of the job and updates the status accordingly. 
If the last execution was not successful, it checks if there is a next execution
date and if there are any dependent jobs to be executed before starting the job.
If the last execution was successful, it checks if the job is already in progress 
for the current date and updates the status accordingly. 
If there is a next execution date, it checks for dependent jobs before starting 
the job. If it is the first execution of the job, it checks for a next execution
date and dependent jobs before starting the job. 
The procedure takes the job name and job audit ID as inputs and returns the next execution date.
*/

CREATE OR REPLACE PROCEDURE DB_IAW_ACCP_DWH.TOOLS.USP_AUDIT_START_JOB_NEXT_DATE("JOB_NAME" VARCHAR(16777216), "JOB_AUDIT_ID" VARCHAR(16777216))
RETURNS VARCHAR(16777216)
LANGUAGE JAVASCRIPT
EXECUTE AS OWNER
AS '
//remove cotes
JOB_NAME= JOB_NAME.replace("''", "");
JOB_AUDIT_ID= JOB_AUDIT_ID.replace("''", "");

// Update status command
var cmdUpdStatus = "UPDATE TOOLS.AUDIT_JOBS_EXECUTIONS SET UPDATE_JOB_AUDIT_ID=''"+JOB_AUDIT_ID+"'', JOB_STATUS=";
var cmdUpdStatusWhereClause = " WHERE JOB_NAME =''" + JOB_NAME + "''";

// Check last execution
var cmd = "SELECT TOP 1 aje.DATA_START_DT::VARCHAR, aje.JOB_STATUS FROM TOOLS.AUDIT_JOBS_EXECUTIONS aje WHERE aje.JOB_NAME =''" + JOB_NAME + "'' AND aje.JOB_STATUS IS NOT NULL AND aje.JOB_STATUS<>'''' ORDER BY aje.DATA_START_DT DESC";
var st = snowflake.createStatement( { sqlText: cmd } );
var res = st.execute();


var stUpdStatus;
var resUpdStatus;


// A previous execution is found
if (res.next())
{
  var dtLastJobStart = res.getColumnValue(1);
  var strLastJobStatus = res.getColumnValue(2);

  //var cmdDG = "INSERT INTO TOOLS.DEBUG_LOG VALUES (''"+ dtLastJobStart +"'')";
  //var stDG = snowflake.createStatement( { sqlText: cmdDG } );
  //var resDG = stDG.execute();

  // Job is executed before for the same date but without success 
  // => It is correct to re-execute it  
  if (strLastJobStatus != "SUCCESS" && strLastJobStatus != "IN PROGRESS")
  {
    // Check last execution
    var cmdNext = "SELECT TOP 1 aje.DATA_START_DT::VARCHAR, aje.JOB_STATUS FROM TOOLS.AUDIT_JOBS_EXECUTIONS aje WHERE aje.JOB_NAME =''" + JOB_NAME + "'' AND DATA_START_DT=''"+res.getColumnValue(1)+"'' ORDER BY aje.DATA_START_DT ASC";
    var stNext = snowflake.createStatement( { sqlText: cmdNext } );
    var resNext = stNext.execute();
    if (resNext.next())
    {
      //Check dependent jobs execution, if there are any
      var statementDep = snowflake.createStatement( { sqlText: "CALL TOOLS.USP_AUDIT_CHECK_DEPENDENT_JOBS(''" + JOB_NAME + "'',''" + resNext.getColumnValue(1) + "'')" } );
      var dependencyRslt = statementDep.execute();
      dependencyRslt.next();
      var dependencyMsg = dependencyRslt.getColumnValue(1);
      if(dependencyMsg != "1")
      {
      //throw dependencyMsg;
          cmdUpdStatus = "UPDATE TOOLS.AUDIT_JOBS_EXECUTIONS SET JOB_STATUS=''ERROR'' , JOB_ACTION_RESULT=''ERROR_04'', JOB_STATUS_DESC = COALESCE(JOB_STATUS_DESC,'''') || CHAR(10) || ''"+JOB_AUDIT_ID+"<'' || CURRENT_TIMESTAMP() || ''> START_JOB ERROR_04 : "+ dependencyMsg +" ''"+ cmdUpdStatusWhereClause + " AND DATA_START_DT=''"+resNext.getColumnValue(1)+"''"; 
      stUpdStatus = snowflake.createStatement( { sqlText: cmdUpdStatus } );
      resUpdStatus = stUpdStatus.execute();
      return "0000-00-00";
      }

      cmdUpdStatus += "''IN PROGRESS'',  JOB_ACTION_RESULT=''SUCCESS'', JOB_STATUS_DESC = COALESCE(JOB_STATUS_DESC,'''') || CHAR(10) || ''" + JOB_AUDIT_ID + "('' || CURRENT_TIMESTAMP() || '') START_JOB : Job restart. ''" + cmdUpdStatusWhereClause + " AND DATA_START_DT=''"+res.getColumnValue(1)+"''";  
      stUpdStatus = snowflake.createStatement( { sqlText: cmdUpdStatus } );
      resUpdStatus = stUpdStatus.execute();
      return res.getColumnValue(1);
    }
  }
  else
  {
    // The last execution was successful
    // => Execute for next date
    if (strLastJobStatus == "SUCCESS")
    {
      // Check last execution
      var cmdNext = "SELECT TOP 1 aje.DATA_START_DT::VARCHAR, aje.JOB_STATUS FROM TOOLS.AUDIT_JOBS_EXECUTIONS aje WHERE aje.JOB_NAME =''" + JOB_NAME + "'' AND DATA_START_DT>''"+res.getColumnValue(1)+"'' ORDER BY aje.DATA_START_DT ASC";
      var stNext = snowflake.createStatement( { sqlText: cmdNext } );
      var resNext = stNext.execute();
      if (resNext.next())
      {


        //Check dependent jobs execution, if there are any
        var statementDep = snowflake.createStatement( { sqlText: "CALL TOOLS.USP_AUDIT_CHECK_DEPENDENT_JOBS(''" + JOB_NAME + "'',''" + resNext.getColumnValue(1) + "'')" } );
        var dependencyRslt = statementDep.execute();
        dependencyRslt.next();
        var dependencyMsg = dependencyRslt.getColumnValue(1);
        if(dependencyMsg != "1")
        {
        //throw dependencyMsg;
                
                cmdUpdStatus = "UPDATE TOOLS.AUDIT_JOBS_EXECUTIONS SET JOB_STATUS=''ERROR'' , JOB_ACTION_RESULT=''ERROR_04'', JOB_STATUS_DESC = COALESCE(JOB_STATUS_DESC,'''') || CHAR(10) || ''"+JOB_AUDIT_ID+"<'' || CURRENT_TIMESTAMP() || ''> START_JOB ERROR_04 : "+ dependencyMsg +" ''"+ cmdUpdStatusWhereClause + " AND DATA_START_DT=''"+resNext.getColumnValue(1)+"''"; 
        stUpdStatus = snowflake.createStatement( { sqlText: cmdUpdStatus } );
        resUpdStatus = stUpdStatus.execute();
        return "0000-00-00";
        }


        cmdUpdStatus += "''IN PROGRESS'',  JOB_ACTION_RESULT=''SUCCESS'', JOB_STATUS_DESC = COALESCE(JOB_STATUS_DESC,'''') || CHAR(10) || ''"+JOB_AUDIT_ID+"<'' || CURRENT_TIMESTAMP() || ''> START_JOB : Job start. ''" + cmdUpdStatusWhereClause + " AND DATA_START_DT=''"+resNext.getColumnValue(1)+"''";  ;
        stUpdStatus = snowflake.createStatement( { sqlText: cmdUpdStatus } );
        resUpdStatus = stUpdStatus.execute();
        return resNext.getColumnValue(1);
      }
    }
    // Already executing for this date (IN PROGRESS)
    // Error
    else
    {
      cmdUpdStatus = "UPDATE TOOLS.AUDIT_JOBS_EXECUTIONS SET JOB_ACTION_RESULT=''ERROR_03'', JOB_STATUS_DESC = COALESCE(JOB_STATUS_DESC,'''') || CHAR(10) || ''"+JOB_AUDIT_ID+"<'' || CURRENT_TIMESTAMP() || ''> START_JOB ERROR_03 : Trying to execute a running Job. ''"+ cmdUpdStatusWhereClause + " AND DATA_START_DT=''"+res.getColumnValue(1)+"''"; 
      stUpdStatus = snowflake.createStatement( { sqlText: cmdUpdStatus } );
      resUpdStatus = stUpdStatus.execute();
      return "0000-00-00";
    } 
  } 
}
// First execution of the job : no previous job
else
{
  // Check last execution
  var cmdFirst = "SELECT TOP 1 aje.DATA_START_DT::VARCHAR, aje.JOB_STATUS FROM TOOLS.AUDIT_JOBS_EXECUTIONS aje WHERE aje.JOB_NAME =''" + JOB_NAME + "'' ORDER BY aje.DATA_START_DT ASC";
  var stFirst = snowflake.createStatement( { sqlText: cmdFirst } );
  var resFirst = stFirst.execute();
  
  if (resFirst.next())
  {

                //Check dependent jobs execution, if there are any
        var statementDep = snowflake.createStatement( { sqlText: "CALL TOOLS.USP_AUDIT_CHECK_DEPENDENT_JOBS(''" + JOB_NAME + "'',''" + resFirst.getColumnValue(1) + "'')" } );
        var dependencyRslt = statementDep.execute();
        dependencyRslt.next();
        var dependencyMsg = dependencyRslt.getColumnValue(1);
        if(dependencyMsg != "1")
        {

        //throw dependencyMsg;

                cmdUpdStatus = "UPDATE TOOLS.AUDIT_JOBS_EXECUTIONS SET JOB_STATUS=''ERROR'' ,JOB_ACTION_RESULT=''ERROR_04'', JOB_STATUS_DESC = COALESCE(JOB_STATUS_DESC,'''') || CHAR(10) || ''"+JOB_AUDIT_ID+"<'' || CURRENT_TIMESTAMP() || ''> START_JOB ERROR_04 : "+ dependencyMsg +" ''"+ cmdUpdStatusWhereClause + " AND DATA_START_DT=''"+resFirst.getColumnValue(1)+"''"; 
        stUpdStatus = snowflake.createStatement( { sqlText: cmdUpdStatus } );
        resUpdStatus = stUpdStatus.execute();
        return "0000-00-00";
        }

    cmdUpdStatus += "''IN PROGRESS'',  JOB_ACTION_RESULT=''SUCCESS'', JOB_STATUS_DESC = COALESCE(JOB_STATUS_DESC,'''') || CHAR(10) || ''"+JOB_AUDIT_ID+"<'' || CURRENT_TIMESTAMP() || ''> START_JOB : Job first start. ''" + cmdUpdStatusWhereClause + " AND DATA_START_DT=''"+resFirst.getColumnValue(1)+"''";
    stUpdStatus = snowflake.createStatement( { sqlText: cmdUpdStatus } );
    resUpdStatus = stUpdStatus.execute();
    return resFirst.getColumnValue(1);
  }
  else 
  {
    return "0000-00-00"
  }
}


return "0000-00-00";

';

-- translation into SQL 
-- I have added comments to explain the purpose of each section of the procedure 
-- and restructured some of the code for readability. Additionally, I have declared 
-- variables for each command and result to improve code clarity. 
-- Finally, I have used Snowflake's FETCH_ONE() method instead of the NEXT() 
-- method used in JavaScript.

CREATE OR REPLACE PROCEDURE DB_IAW_ACCP_DWH.TOOLS.USP_AUDIT_START_JOB_NEXT_DATE(  
  JOB_NAME VARCHAR,   
  JOB_AUDIT_ID VARCHAR)  
RETURNS VARCHAR  
LANGUAGE SQL  
EXECUTE AS OWNER  
AS   
$$  
DECLARE  
  cmdUpdStatus VARCHAR(16777216);  
  cmdUpdStatusWhereClause VARCHAR(16777216);  
  cmd VARCHAR(16777216);  
  cmdNext VARCHAR(16777216);  
  cmdFirst VARCHAR(16777216);  
  st RECORD;  
  res RECORD;  
  stUpdStatus RECORD;  
  resUpdStatus RECORD;  
  stNext RECORD;  
  resNext RECORD;  
  stFirst RECORD;  
  resFirst RECORD;  
  dtLastJobStart VARCHAR;  
  strLastJobStatus VARCHAR;  
  dependencyMsg VARCHAR;  
BEGIN  
  -- Remove quotes  
  JOB_NAME = REPLACE(JOB_NAME, '''', '');  
  JOB_AUDIT_ID = REPLACE(JOB_AUDIT_ID, '''', '');  
  
  -- Update status command  
  cmdUpdStatusWhereClause = ' WHERE JOB_NAME = ''' || JOB_NAME || '''';  
    
  -- Check last execution  
  cmd = 'SELECT TOP 1 DATA_START_DT::VARCHAR, JOB_STATUS   
         FROM TOOLS.AUDIT_JOBS_EXECUTIONS   
         WHERE JOB_NAME = ''' || JOB_NAME || '''   
         AND JOB_STATUS IS NOT NULL   
         AND JOB_STATUS <> ''''   
         ORDER BY DATA_START_DT DESC';  
  st = (cmd, 'SELECT');  
  res = st.FETCH_ONE();  
  
  -- A previous execution is found  
  IF (NOT IS_NULL(res)) THEN  
    dtLastJobStart = res.COL1;  
    strLastJobStatus = res.COL2;  
  
    -- Job is executed before for the same date but without success  
    -- => It is correct to re-execute it  
    IF (strLastJobStatus <> 'SUCCESS' AND strLastJobStatus <> 'IN PROGRESS') THEN  
      -- Check next execution  
      cmdNext = 'SELECT TOP 1 DATA_START_DT::VARCHAR, JOB_STATUS   
                 FROM TOOLS.AUDIT_JOBS_EXECUTIONS   
                 WHERE JOB_NAME = ''' || JOB_NAME || '''   
                 AND DATA_START_DT = ''' || dtLastJobStart || '''   
                 ORDER BY DATA_START_DT ASC';  
      stNext = (cmdNext, 'SELECT');  
      resNext = stNext.FETCH_ONE();  
  
      IF (NOT IS_NULL(resNext)) THEN  
        -- Check dependent jobs execution, if there are any  
        dependencyMsg = CALL TOOLS.USP_AUDIT_CHECK_DEPENDENT_JOBS(JOB_NAME, resNext.COL1);  
          
        IF (dependencyMsg <> '1') THEN  
          cmdUpdStatus = 'UPDATE TOOLS.AUDIT_JOBS_EXECUTIONS   
                           SET JOB_STATUS = ''ERROR'',   
                               JOB_ACTION_RESULT = ''ERROR_04'',   
                               JOB_STATUS_DESC = COALESCE(JOB_STATUS_DESC,'''') || CHAR(10) || ''' || JOB_AUDIT_ID || ''<'' || CURRENT_TIMESTAMP() || ''> START_JOB ERROR_04 : ' || dependencyMsg || ''' ' || cmdUpdStatusWhereClause || ' AND DATA_START_DT = ''' || resNext.COL1 || '''';  
          stUpdStatus = (cmdUpdStatus, 'SELECT');  
          resUpdStatus = stUpdStatus.EXECUTE();  
          RETURN '0000-00-00';  
        ELSE  
          cmdUpdStatus = 'UPDATE TOOLS.AUDIT_JOBS_EXECUTIONS   
                           SET UPDATE_JOB_AUDIT_ID = ''' || JOB_AUDIT_ID || ''',   
                               JOB_STATUS = ''IN PROGRESS'',   
                               JOB_ACTION_RESULT = ''SUCCESS'',   
                               JOB_STATUS_DESC = COALESCE(JOB_STATUS_DESC,'''') || CHAR(10) || ''' || JOB_AUDIT_ID || ''<'' || CURRENT_TIMESTAMP() || ''> START_JOB : Job restart. '' ' || cmdUpdStatusWhereClause || ' AND DATA_START_DT = ''' || res.COL1 || '''';  
          stUpdStatus = (cmdUpdStatus, 'SELECT');  
          resUpdStatus = stUpdStatus.EXECUTE();  
          RETURN res.COL1;  
        END IF;  
      END IF;  
    ELSE  
      -- The last execution was successful  
      -- => Execute for next date  
      IF (strLastJobStatus = 'SUCCESS') THEN  
        -- Check next execution  
        cmdNext = 'SELECT TOP 1 DATA_START_DT::VARCHAR, JOB_STATUS   
                   FROM TOOLS.AUDIT_JOBS_EXECUTIONS   
                   WHERE JOB_NAME = ''' || JOB_NAME || '''   
                   AND DATA_START_DT > ''' || dtLastJobStart || '''   
                   ORDER BY DATA_START_DT ASC';  
        stNext = (cmdNext, 'SELECT');  
        resNext = stNext.FETCH_ONE();  
  
        IF (NOT IS_NULL(resNext)) THEN  
          -- Check dependent jobs execution, if there are any  
          dependencyMsg = CALL TOOLS.USP_AUDIT_CHECK_DEPENDENT_JOBS(JOB_NAME, resNext.COL1);  
          
          IF (dependencyMsg <> '1') THEN  
            cmdUpdStatus = 'UPDATE TOOLS.AUDIT_JOBS_EXECUTIONS   
                             SET JOB_STATUS = ''ERROR'',   
                                 JOB_ACTION_RESULT = ''ERROR_04'',   
                                 JOB_STATUS_DESC = COALESCE(JOB_STATUS_DESC,'''') || CHAR(10) || ''' || JOB_AUDIT_ID || ''<'' || CURRENT_TIMESTAMP() || ''> START_JOB ERROR_04 : ' || dependencyMsg || ''' ' || cmdUpdStatusWhereClause || ' AND DATA_START_DT = ''' || resNext.COL1 || '''';  
            stUpdStatus = (cmdUpdStatus, 'SELECT');  
            resUpdStatus = stUpdStatus.EXECUTE();  
            RETURN '0000-00-00';  
          ELSE  
            cmdUpdStatus = 'UPDATE TOOLS.AUDIT_JOBS_EXECUTIONS   
                             SET UPDATE_JOB_AUDIT_ID = ''' || JOB_AUDIT_ID || ''',   
                                 JOB_STATUS = ''IN PROGRESS'',   
                                 JOB_ACTION_RESULT = ''SUCCESS'',   
                                 JOB_STATUS_DESC = COALESCE(JOB_STATUS_DESC,'''') || CHAR(10) || ''' || JOB_AUDIT_ID || ''<'' || CURRENT_TIMESTAMP() || ''> START_JOB : Job start. '' ' || cmdUpdStatusWhereClause || ' AND DATA_START_DT = ''' || resNext.COL1 || '''';  
            stUpdStatus = (cmdUpdStatus, 'SELECT');  
            resUpdStatus = stUpdStatus.EXECUTE();  
            RETURN resNext.COL1;  
          END IF;  
        END IF;  
      ELSE  
        -- Already executing for this date (IN PROGRESS)  
        -- Error  
        cmdUpdStatus = 'UPDATE TOOLS.AUDIT_JOBS_EXECUTIONS   
                         SET JOB_ACTION_RESULT = ''ERROR_03'',   
                             JOB_STATUS_DESC = COALESCE(JOB_STATUS_DESC,'''') || CHAR(10) || ''' || JOB_AUDIT_ID || ''<'' || CURRENT_TIMESTAMP() || ''> START_JOB ERROR_03 : Trying to execute a running Job. '' ' || cmdUpdStatusWhereClause || ' AND DATA_START_DT = ''' || res.COL1 || '''';  
        stUpdStatus = (cmdUpdStatus, 'SELECT');  
        resUpdStatus = stUpdStatus.EXECUTE();  
        RETURN '0000-00-00';  
      END IF;  
    END IF;  
  ELSE  
    -- First execution of the job : no previous job  
    -- Check next execution  
    cmdFirst = 'SELECT TOP 1 DATA_START_DT::VARCHAR, JOB_STATUS   
                FROM TOOLS.AUDIT_JOBS_EXECUTIONS   
                WHERE JOB_NAME = ''' || JOB_NAME || '''   
                ORDER BY DATA_START_DT ASC';  
    stFirst = (cmdFirst, 'SELECT');  
    resFirst = stFirst.FETCH_ONE();  
  
    IF (NOT IS_NULL(resFirst)) THEN  
      -- Check dependent jobs execution, if there are any  
      dependencyMsg = CALL TOOLS.USP_AUDIT_CHECK_DEPENDENT_JOBS(JOB_NAME, resFirst.COL1);  
          
      IF (dependencyMsg <> '1') THEN  
        cmdUpdStatus = 'UPDATE TOOLS.AUDIT_JOBS_EXECUTIONS   
                         SET JOB_STATUS = ''ERROR'',   
                             JOB_ACTION_RESULT = ''ERROR_04'',   
                             JOB_STATUS_DESC = COALESCE(JOB_STATUS_DESC,'''') || CHAR(10) || ''' || JOB_AUDIT_ID || ''<'' || CURRENT_TIMESTAMP() || ''> START_JOB ERROR_04 : ' || dependencyMsg || ''' ' || cmdUpdStatusWhereClause || ' AND DATA_START_DT = ''' || resFirst.COL1 || '''';  
        stUpdStatus = (cmdUpdStatus, 'SELECT');  
        resUpdStatus = stUpdStatus.EXECUTE();  
        RETURN '0000-00-00';  
      ELSE  
        cmdUpdStatus = 'UPDATE TOOLS.AUDIT_JOBS_EXECUTIONS   
                         SET UPDATE_JOB_AUDIT_ID = ''' || JOB_AUDIT_ID || ''',   
                             JOB_STATUS = ''IN PROGRESS'',   
                             JOB_ACTION_RESULT = ''SUCCESS'',   
                             JOB_STATUS_DESC = COALESCE(JOB_STATUS_DESC,'''') || CHAR(10) || ''' || JOB_AUDIT_ID || ''<'' || CURRENT_TIMESTAMP() || ''> START_JOB : Job first start. '' ' || cmdUpdStatusWhereClause || ' AND DATA_START_DT = ''' || resFirst.COL1 || '''';  
        stUpdStatus = (cmdUpdStatus, 'SELECT');  
        resUpdStatus = stUpdStatus.EXECUTE();  
        RETURN resFirst.COL1;  
      END IF;  
    ELSE   
      RETURN '0000-00-00';  
    END IF;  
  END IF;  
  
  RETURN '0000-00-00';  
END;  
$$;  


CREATE OR REPLACE PROCEDURE DB_IAW_ACCP_DWH.TOOLS.USP_AUDIT_END_JOB("JOB_NAME" VARCHAR(16777216), "DATA_START_DT" VARCHAR(16777216), "JOB_AUDIT_ID" VARCHAR(16777216), "JOB_END_STATUS" VARCHAR(16777216), "JOB_END_DESC" VARCHAR(16777216))
RETURNS VARCHAR(16777216)
LANGUAGE JAVASCRIPT
EXECUTE AS OWNER
AS '
// Update status command
var cmdUpdStatus = "UPDATE TOOLS.AUDIT_JOBS_EXECUTIONS SET UPDATE_JOB_AUDIT_ID=''"+JOB_AUDIT_ID+"'', JOB_STATUS=";
var cmdUpdStatusWhereClause = " WHERE JOB_NAME =''" + JOB_NAME + "'' AND DATA_START_DT = ''"+DATA_START_DT+"''";
// Check last execution
var cmd = "SELECT TOP 1 aje.DATA_START_DT::VARCHAR, aje.JOB_STATUS FROM TOOLS.AUDIT_JOBS_EXECUTIONS aje WHERE aje.JOB_NAME =''" + JOB_NAME + "'' AND aje.DATA_START_DT = ''"+DATA_START_DT+"'' ORDER BY aje.DATA_START_DT DESC";
var st = snowflake.createStatement( { sqlText: cmd } );
var res = st.execute();

var stUpdStatus;
var resUpdStatus;

try 
{ 
  // A previous execution is found
  if (res.next())
  {
    var dtLastJobStart = res.getColumnValue(1);
    var strLastJobStatus = res.getColumnValue(2);

    //var cmdDG = "INSERT INTO TOOLS.DEBUG_LOG VALUES (''"+ dtLastJobStart +"'')";
    //var stDG = snowflake.createStatement( { sqlText: cmdDG } );
    //var resDG = stDG.execute();

    // Job is in progress 
    // => end it  
    if (strLastJobStatus == "IN PROGRESS")
    {
      cmdUpdStatus += "''"+JOB_END_STATUS+"'', JOB_STATUS_DESC = COALESCE(JOB_STATUS_DESC,'''') || CHAR(10) || ''" + JOB_AUDIT_ID + "<'' || CURRENT_TIMESTAMP() || ''> END_JOB : "+JOB_END_DESC+" ''" + cmdUpdStatusWhereClause;  
      stUpdStatus = snowflake.createStatement( { sqlText: cmdUpdStatus } );
      resUpdStatus = stUpdStatus.execute();
      return JOB_END_STATUS;
    }
    // Ending a job that is not in progress
    else
    {
      cmdUpdStatus = "UPDATE TOOLS.AUDIT_JOBS_EXECUTIONS SET JOB_STATUS_DESC = COALESCE(JOB_STATUS_DESC,'''') || CHAR(10) || ''"+JOB_AUDIT_ID+"<'' || CURRENT_TIMESTAMP() || ''> END_JOB ERROR_01 : trying to end a job that is not in progress. ''" + cmdUpdStatusWhereClause;
      stUpdStatus = snowflake.createStatement( { sqlText: cmdUpdStatus } );
      resUpdStatus = stUpdStatus.execute();
      return "ERROR_01";    
    } 
  }
  // Job to be ended not found
  else
  {
    return "ERROR_02";
  }
}
// Technical error
catch(er)
{
  return "ERROR_FATAL : " + er; 
}

return "ERROR_03";  

';
'


CREATE OR REPLACE PROCEDURE DB_IAW_ACCP_DWH.TOOLS.USP_AUDIT_END_JOB(  
    IN JOB_NAME VARCHAR(16777216),   
    IN DATA_START_DT VARCHAR(16777216),   
    IN JOB_AUDIT_ID VARCHAR(16777216),   
    IN JOB_END_STATUS VARCHAR(16777216),   
    IN JOB_END_DESC VARCHAR(16777216),   
    OUT RESULT VARCHAR(16777216)  
)  
RETURNS VARCHAR(16777216)  
LANGUAGE SQL  
AS $$  
DECLARE  
    last_job_start VARCHAR(16777216);  
    last_job_status VARCHAR(16777216);  
BEGIN  
    -- Update status command  
    UPDATE TOOLS.AUDIT_JOBS_EXECUTIONS   
    SET UPDATE_JOB_AUDIT_ID = JOB_AUDIT_ID,  
        JOB_STATUS = CASE   
                        WHEN JOB_STATUS = 'IN PROGRESS' THEN JOB_END_STATUS  
                        ELSE JOB_STATUS   
                     END,  
        JOB_STATUS_DESC = CASE   
                            WHEN JOB_STATUS = 'IN PROGRESS' THEN COALESCE(JOB_STATUS_DESC, '') || CHAR(10) || JOB_AUDIT_ID || '<' || CURRENT_TIMESTAMP() || '> END_JOB : ' || JOB_END_DESC  
                            ELSE COALESCE(JOB_STATUS_DESC, '') || CHAR(10) || JOB_AUDIT_ID || '<' || CURRENT_TIMESTAMP() || '> END_JOB ERROR_01 : trying to end a job that is not in progress. '  
                          END  
    WHERE JOB_NAME = JOB_NAME   
    AND DATA_START_DT = DATA_START_DT;  
      
    -- Check last execution  
    SELECT aje.DATA_START_DT::VARCHAR, aje.JOB_STATUS   
    INTO last_job_start, last_job_status   
    FROM TOOLS.AUDIT_JOBS_EXECUTIONS aje   
    WHERE aje.JOB_NAME = JOB_NAME   
    AND aje.DATA_START_DT = DATA_START_DT   
    ORDER BY aje.DATA_START_DT DESC   
    LIMIT 1;  
      
    -- A previous execution is found  
    IF last_job_start IS NOT NULL THEN  
        -- Job is in progress => end it    
        IF last_job_status = 'IN PROGRESS' THEN  
            RESULT := JOB_END_STATUS;  
        -- Ending a job that is not in progress  
        ELSE  
            RESULT := 'ERROR_01';  
        END IF;  
    -- Job to be ended not found  
    ELSE  
        RESULT := 'ERROR_02';  
    END IF;  
      
    RETURN RESULT;  
END;  
$$;  
```   
  
Note that I assumed that the `AUDIT_JOBS_EXECUTIONS` table has columns named `JOB_STATUS` and `JOB_STATUS_DESC` that store the status and description of each job execution. Also, I added an `OUT` parameter named `RESULT` to return the result of the procedure.


This is a Snowflake stored procedure written in JavaScript that updates the status of 
a job and logs the end of its execution in an audit table. 
The procedure takes five input parameters:

JOB_NAME: a string that represents the name of the job.
DATA_START_DT: a string that represents the start date of the data processed by the job.
JOB_AUDIT_ID: a string that represents the identifier of the audit record of the job execution.
JOB_END_STATUS: a string that represents the status of the job at the end of its execution.
JOB_END_DESC: a string that represents a description of the end of the job execution. 

The procedure first constructs an UPDATE SQL command to update the status of the 
job in the audit table based on the input parameters. 
It then queries the audit table to retrieve the status of the last execution of the job. 
If the last execution is found and its status is "IN PROGRESS", the procedure updates 
the status of the job in the audit table with the input parameters and returns the JOB_END_STATUS. 
If the last execution is found but its status is not "IN PROGRESS", the procedure 
logs an error message in the audit table and returns "ERROR_01". 
If the last execution is not found, the procedure returns "ERROR_02". 
If there is a technical error during the execution of the procedure, it logs an error message and returns "ERROR_FATAL".
If none of the above conditions are met, the procedure returns "ERROR_03".


"ERROR_02" is returned by the procedure when it cannot find a previous execution 
of the job in the audit table. 
This could happen if the job has never been executed before or if there was a 
mistake in the input parameters that led to the wrong data being queried in the audit table.  

When "ERROR_02" is returned, it means that the procedure was unable to update the 
status of the job in the audit table because it couldn't find any previous execution to update. 
It's important to note that this error does not necessarily mean that the job execution failed, 
it simply means that the procedure couldn't complete its intended task of updating the audit table.