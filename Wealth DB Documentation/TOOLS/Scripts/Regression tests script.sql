CREATE SCHEMA TOOLS_REG_TESTS;


create or replace TABLE TOOLS_REG_TESTS.REG_TESTS_DEFINITION (
	ID NUMBER(38,0) autoincrement COMMENT 'Unique identifier of a regression test definition',
	REG_TEST_VERSION VARCHAR(100) NOT NULL COMMENT 'Version of the regression test set',
	TABLE_FULLNAME VARCHAR(2000) NOT NULL COMMENT 'DbName.SchemaName.TableName of the table to be tested',
	COLUMN_NAME VARCHAR(2000) NOT NULL COMMENT 'Name pof a column to be validated or one of the key columns',
	COLUMN_TYPE VARCHAR(2000) NOT NULL COMMENT 'KEY or VALUE'
);

CREATE OR REPLACE PROCEDURE TOOLS_REG_TESTS.USP_CREATE_REFERENCE("REG_TEST_VERSION" VARCHAR(16777216), "TABLE_SCOPE" VARCHAR(16777216))
RETURNS VARCHAR(16777216)
LANGUAGE JAVASCRIPT
EXECUTE AS OWNER
AS '
var cmd = "SELECT TABLE_FULLNAME FROM TOOLS_REG_TESTS.REG_TESTS_DEFINITION " + TABLE_SCOPE;
var st = snowflake.createStatement( { sqlText: cmd } );
var res = st.execute();
while(res.next())
{
	// Build table name
	var strTableFullname = res.getColumnValue(1);
	var strRefTable = strTableFullname;
	strRefTable = strRefTable.replace(/\\./g,"__");
	strRefTable += "_REF";

	var cmdRef = "CREATE OR REPLACE TABLE TOOLS_REG_TESTS."+strRefTable+" CLONE "+strTableFullname;
	var stRef = snowflake.createStatement( { sqlText: cmdRef } );
	
	try
	{
		var resRef = stRef.execute();
	}
	catch(er)
	{
		return "Error executing command : " + cmdRef + " -- Error : " + er; 
	}  
	
}    
';


CREATE OR REPLACE PROCEDURE TOOLS_REG_TESTS.USP_CREATE_RESULT("REG_TEST_VERSION" VARCHAR(16777216), "TABLE_SCOPE" VARCHAR(16777216))
RETURNS VARCHAR(16777216)
LANGUAGE JAVASCRIPT
EXECUTE AS OWNER
AS '
var cmd = "SELECT TABLE_FULLNAME FROM TOOLS_REG_TESTS.REG_TESTS_DEFINITION " + TABLE_SCOPE;
var st = snowflake.createStatement( { sqlText: cmd } );
var res = st.execute();
while(res.next())
{
	
	// Build table names
	var strTableFullname = res.getColumnValue(1);
	var strRefTable = strTableFullname;
	strRefTable = strRefTable.replace(/\\./g,"__");
	var strResTable = strRefTable + "_RES";
	strRefTable += "_REF";
	
	var cmd1Create = "CREATE OR REPLACE TABLE TOOLS_REG_TESTS."+strResTable+" AS SELECT ";
	var cmd2Res = " CASE WHEN ";
	var cmd3Fields = " ";
	var cmd4From = " FROM "+res.getColumnValue(1)+" rs ";
	var cmd5FullJoin = " FULL JOIN TOOLS_REG_TESTS."+strRefTable+" rf ";
	var cmd6On = " ON ";
	
	var cmdCol = "SELECT COLUMN_NAME, COLUMN_TYPE FROM TOOLS_REG_TESTS.REG_TESTS_DEFINITION "+TABLE_SCOPE+" AND TABLE_FULLNAME=''"+res.getColumnValue(1)+"''";
	var stCol = snowflake.createStatement( { sqlText: cmdCol } );
	var resCol = stCol.execute();
	while(resCol.next())
	{
		var strCol = resCol.getColumnValue(1);
		var strType = resCol.getColumnValue(2);
		if(strType == "KEY")
		{
			cmd3Fields += ", " + "rs."+strCol+" AS RES_"+strCol+", rf."+strCol+" AS REF_"+strCol;
			if (cmd6On == " ON ")
			{
				cmd6On += "rs."+strCol+" = rf."+strCol;
			}
			else
			{
				cmd6On += " AND rs."+strCol+" = rf."+strCol;
			}
		}
		else
		{
			if(strType == "VALUE")
			{
				cmd3Fields += ", " + "rs."+strCol+" AS RES_"+strCol+", rf."+strCol+" AS REF_"+strCol;
				cmd2Res += "rs."+strCol+" = rf."+strCol+"  THEN ''OK'' ELSE ''KO'' END AS RES";
			}
		}
	}
	
	var cmdRes = cmd1Create + cmd2Res + cmd3Fields + cmd4From + cmd5FullJoin + cmd6On;
	var stRes = snowflake.createStatement( { sqlText: cmdRes } );
	
	try
	{
		var resRes = stRes.execute(); 
	}
	catch(er)
	{
		return "Error executing command : " + cmdRes + " -- Error : " + er; 
	}
}    
';


