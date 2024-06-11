
USE DATABASE DB_IAWT_DEV_DWH;
create or replace schema BUSINESS_RULES;
USE SCHEMA BUSINESS_RULES;

CREATE OR REPLACE FUNCTION UDF_CONV_BR_ALL_REVENUE_001(I_SOURCECODE VARCHAR(512))
RETURNS VARIANT
LANGUAGE JAVASCRIPT
AS '
  var RESULT = {o_REVENUE_TYPEUnkown,o_REVENUE_SUBTYPEUnknown};
  switch(I_SOURCECODE) {
  case ''OFF''
    RESULT = {o_REVENUE_TYPETrade commissions,o_REVENUE_SUBTYPEOffBook commission}
    break;
  case ''FXF''
    RESULT = {o_REVENUE_TYPEFee basedManaged,o_REVENUE_SUBTYPEFixed fees}
    break;
  case ''MGD''
    RESULT = {o_REVENUE_TYPEFee basedManaged,o_REVENUE_SUBTYPEManaged}
    break;  
  case ''JRN''
    RESULT = {o_REVENUE_TYPETrailers,o_REVENUE_SUBTYPETrailer fees and GIC}
    break;  
   case ''MNL''
    RESULT = {o_REVENUE_TYPETrade commissions,o_REVENUE_SUBTYPEOthers}
    break;   
   case ''INS''
    RESULT = {o_REVENUE_TYPEInsurances,o_REVENUE_SUBTYPEInsurances}
    break;
   case ''TRD''
    RESULT = {o_REVENUE_TYPETrade commissions,o_REVENUE_SUBTYPETrade commissions}
    break; 
  default
    RESULT = {o_REVENUE_TYPEUnkown,o_REVENUE_SUBTYPEUnknown}
} 
  return RESULT;
';
CREATE OR REPLACE FUNCTION UDF_CONV_BR_UNIVERIS_REVENUE_REVENUE_SUBTYPE_003(I_COM_PROD_MNEM VARCHAR(5), I_COM_PROD_LONG_DESC VARCHAR(40))
RETURNS VARCHAR(16777216)
LANGUAGE JAVASCRIPT
AS '
  var RESULT = I_COM_PROD_LONG_DESC;
  switch (true) {
  case ([''MFTRX'',''BONUS'',''COMM''].includes(I_COM_PROD_MNEM)) 
    RESULT = Trade commissions
    break;
 case ([''ADJUS'',''OTHER''].includes(I_COM_PROD_MNEM))
    RESULT = Others
    break;
 case ([''REF'',''SREF''].includes(I_COM_PROD_MNEM))
    RESULT = Referals
    break;
  case ([''TOF'',''TF''].includes(I_COM_PROD_MNEM))
    RESULT = Charge back client fees
    break;  
  case (I_COM_PROD_MNEM === ''GICC'')
    RESULT = GIC commissions
    break;    
   default
    RESULT =  I_COM_PROD_LONG_DESC;
} 
  return RESULT;
';
CREATE OR REPLACE FUNCTION UDF_CONV_BR_UNIVERIS_REVENUE_REVENUE_TYPE_002(I_COM_PROD_CD VARCHAR(2), I_SRC_SYSTEM VARCHAR(100))
RETURNS VARCHAR(100)
LANGUAGE JAVASCRIPT
AS '
 
 if ( [02,10].includes(I_COM_PROD_CD)){
  return Trailers;
  }
  if (I_SRC_SYSTEM === INVESTIA-UNIVERIS && [35,37].includes(I_COM_PROD_CD))
  {   
     return Fee basedManaged
   } 
    return Trade commissions
 
 
';

CREATE OR REPLACE PROCEDURE BR_ALL_ADVISOR_AUA_SEGMENTATION_002(I_ADVISOR_SUM_AUA FLOAT)
RETURNS VARIANT
LANGUAGE JAVASCRIPT
EXECUTE AS OWNER
AS ' 
 var RESULT = {o_AGE_SEGMENTUnknown,o_AGE_SEGMENT_ORD0};  
    
  switch(true) {
  case I_ADVISOR_SUM_AUA == 0 
    RESULT = {o_AGE_SEGMENT0,o_AGE_SEGMENT_ORD-1}
    break;
  case I_ADVISOR_SUM_AUA = 1000000 
    RESULT = {o_AGE_SEGMENT= 1M,o_AGE_SEGMENT_ORD1}
    break;
  case I_ADVISOR_SUM_AUA  parseFloat(1000000) && I_ADVISOR_SUM_AUA = parseFloat(5000000)
    RESULT = {o_AGE_SEGMENT1M-5M,o_AGE_SEGMENT_ORD2}
    break;  
  case I_ADVISOR_SUM_AUA  5000000 && I_ADVISOR_SUM_AUA = 10000000
    RESULT = {o_AGE_SEGMENT5M-10M,o_AGE_SEGMENT_ORD3}
    break; 
   case I_ADVISOR_SUM_AUA  10000000 && I_ADVISOR_SUM_AUA = 20000000
    RESULT = {o_AGE_SEGMENT10M-20M,o_AGE_SEGMENT_ORD4}
    break;  
   case I_ADVISOR_SUM_AUA  20000000 && I_ADVISOR_SUM_AUA = 30000000
    RESULT = {o_AGE_SEGMENT20M-30M,o_AGE_SEGMENT_ORD5}
    break;    
   case I_ADVISOR_SUM_AUA  30000000 && I_ADVISOR_SUM_AUA = 50000000
    RESULT = {o_AGE_SEGMENT30M-50M,o_AGE_SEGMENT_ORD6}
    break; 
    case I_ADVISOR_SUM_AUA  50000000 
    RESULT = {o_AGE_SEGMENT 50M,o_AGE_SEGMENT_ORD7}
    break;  
  default
    RESULT = {o_AGE_SEGMENTUnknown,o_AGE_SEGMENT_ORD0}
}   
 
  return RESULT;
';
CREATE OR REPLACE PROCEDURE BR_UNIVERIS_CLIENTS_INCOME_SEGMENTATION_006(I_SALARY_DESCRIPTION VARCHAR(100))
RETURNS VARIANT
LANGUAGE JAVASCRIPT
EXECUTE AS OWNER
AS '
  
  
  var RESULT = {}
 switch(true) {
    case I_SALARY_DESC === Less or Equal to $30,000 
    RESULT = {o_IncomeSegmentation($30k),o_IncomeSegmentation_Ord1}
    break;
  case I_SALARY_DESC === $30,001 to $50,000
    RESULT = {o_IncomeSegmentation$30k - $50k,o_IncomeSegmentation_Ord2}
    break;  
   case I_SALARY_DESC= $50,001 to $70,000
   RESULT = {o_IncomeSegmentation$50k - $70k,o_IncomeSegmentation_Ord3}
    break;    
   case I_SALARY_DESC === $70,001 to $100,000
    RESULT = {o_IncomeSegmentation$70k - $100k,o_IncomeSegmentation_Ord4}
    break;  
    case I_SALARY_DESC === $100,001 to $200,000
    RESULT = {o_IncomeSegmentation$100k - $200k,o_IncomeSegmentation_Ord5}
    break; 
   case I_SALARY_DESC === $200,001 to 300,000
   RESULT = {o_IncomeSegmentation$200k - $300k,o_IncomeSegmentation_Ord6}
    break; 
   case I_SALARY_DESC === Greater or Equal to $300,001  I_SALARY_DESC === More or Equal to $300,001
    RESULT = {o_IncomeSegmentation$300k+,o_IncomeSegmentation_Ord7}
    break;    
  default
    RESULT = {o_AGE_SEGMENTUnknown,o_AGE_SEGMENT_ORD8}
}   
  return RESULT;
';
CREATE OR REPLACE PROCEDURE SP_CONV_BR_ALL_ADVISOR_001(I_ADVISORSTARTDATE VARCHAR(29), I_LOADDATE VARCHAR(29))
RETURNS VARCHAR(1)
LANGUAGE JAVASCRIPT
EXECUTE AS OWNER
AS ' 
  var d2 = new Date(I_LOADDATE);   
  var d1 = new Date(I_ADVISORSTARTDATE);  
  var diff = d2.getTime() - d1.getTime();
  var year_diff = Math.floor(diff  (1000  60  60  24));  
  return year_diff = 365  ''1'' ''0'';    
';
CREATE OR REPLACE PROCEDURE SP_CONV_BR_ALL_ADVISOR_003(I_ADVISORDATEOFBIRTH VARCHAR(29), I_ASOFDATE VARCHAR(29), I_ISCORPORATION BOOLEAN)
RETURNS VARIANT
LANGUAGE JAVASCRIPT
EXECUTE AS OWNER
AS '
 
  var RESULT = {o_AGE_SEGMENTUnknown,o_AGE_SEGMENT_ORD6}
  var d1 = new Date(I_ADVISORDATEOFBIRTH);   
  var d2 = new Date(I_ASOFDATE);  
  var diff = d2.getTime() - d1.getTime();
  var year_diff = Math.floor((diff  (1000  60  60  24))365.25);    
  if (I_ISCORPORATION )
   {
    return {o_AGE_SEGMENTCorporate,o_AGE_SEGMENT_ORD8} 
   }
 switch(true) {
  case year_diff  0 
    RESULT = {o_AGE_SEGMENTUnknown,o_AGE_SEGMENT_ORD7}
    break;
  case year_diff  25 
    RESULT = {o_AGE_SEGMENTUnder 25,o_AGE_SEGMENT_ORD1}
    break;
  case year_diff = 25 && year_diff  45
    RESULT = {o_AGE_SEGMENT25-44,o_AGE_SEGMENT_ORD2}
    break;  
  case year_diff = 45 && year_diff  55
    RESULT = {o_AGE_SEGMENT45-54,o_AGE_SEGMENT_ORD3}
    break;  
   case year_diff = 55 && year_diff  61
    RESULT = {o_AGE_SEGMENT55-60,o_AGE_SEGMENT_ORD4}
    break;   
   case year_diff = 61
    RESULT = {o_AGE_SEGMENTOver 60,o_AGE_SEGMENT_ORD5}
    break;    
  default
    RESULT = {o_AGE_SEGMENTUnknown,o_AGE_SEGMENT_ORD6}
}   
  return RESULT;
';
CREATE OR REPLACE PROCEDURE SP_CONV_BR_ALL_ADVISOR_003(I_ADVISOR_SUM_AUA FLOAT)
RETURNS VARIANT
LANGUAGE JAVASCRIPT
EXECUTE AS OWNER
AS ' 
 var RESULT = {o_AGE_SEGMENTUnknown,o_AGE_SEGMENT_ORD0};  
    
  switch(true) {
  case I_ADVISOR_SUM_AUA == 0 
    RESULT = {o_AGE_SEGMENT0,o_AGE_SEGMENT_ORD-1}
    break;
  case I_ADVISOR_SUM_AUA = 1000000 
    RESULT = {o_AGE_SEGMENT= 1M,o_AGE_SEGMENT_ORD1}
    break;
  case I_ADVISOR_SUM_AUA  parseFloat(1000000) && I_ADVISOR_SUM_AUA = parseFloat(5000000)
    RESULT = {o_AGE_SEGMENT1M-5M,o_AGE_SEGMENT_ORD2}
    break;  
  case I_ADVISOR_SUM_AUA  5000000 && I_ADVISOR_SUM_AUA = 10000000
    RESULT = {o_AGE_SEGMENT5M-10M,o_AGE_SEGMENT_ORD3}
    break; 
   case I_ADVISOR_SUM_AUA  10000000 && I_ADVISOR_SUM_AUA = 20000000
    RESULT = {o_AGE_SEGMENT10M-20M,o_AGE_SEGMENT_ORD4}
    break;  
   case I_ADVISOR_SUM_AUA  20000000 && I_ADVISOR_SUM_AUA = 30000000
    RESULT = {o_AGE_SEGMENT20M-30M,o_AGE_SEGMENT_ORD5}
    break;    
   case I_ADVISOR_SUM_AUA  30000000 && I_ADVISOR_SUM_AUA = 50000000
    RESULT = {o_AGE_SEGMENT30M-50M,o_AGE_SEGMENT_ORD6}
    break; 
    case I_ADVISOR_SUM_AUA  50000000 
    RESULT = {o_AGE_SEGMENT 50M,o_AGE_SEGMENT_ORD7}
    break;  
  default
    RESULT = {o_AGE_SEGMENTUnknown,o_AGE_SEGMENT_ORD0}
}   
 
  return RESULT;
';
CREATE OR REPLACE PROCEDURE SP_CONV_BR_ALL_ADVISOR_003(I_ADVISOR_SUM_AUA VARCHAR(16777216))
RETURNS VARIANT
LANGUAGE JAVASCRIPT
EXECUTE AS OWNER
AS ' 
 var RESULT = {o_AGE_SEGMENTUnknown,o_AGE_SEGMENT_ORD0};
   switch(true) {
  case I_ADVISOR_SUM_AUA = 0 
    RESULT = {o_AGE_SEGMENT0,o_AGE_SEGMENT_ORD-1}
    break;
  case I_ADVISOR_SUM_AUA = 1000000 
    RESULT = {o_AGE_SEGMENT= 1M,o_AGE_SEGMENT_ORD1}
    break;
  case I_ADVISOR_SUM_AUA  1000000 && I_ADVISOR_SUM_AUA = 5000000
    RESULT = {o_AGE_SEGMENT1M-5M,o_AGE_SEGMENT_ORD2}
    break;  
  case I_ADVISOR_SUM_AUA  5000000 && I_ADVISOR_SUM_AUA = 10000000
    RESULT = {o_AGE_SEGMENT5M-10M,o_AGE_SEGMENT_ORD3}
    break; 
   case I_ADVISOR_SUM_AUA  10000000 && I_ADVISOR_SUM_AUA = 20000000
    RESULT = {o_AGE_SEGMENT10M-20M,o_AGE_SEGMENT_ORD4}
    break;  
   case I_ADVISOR_SUM_AUA  20000000 && I_ADVISOR_SUM_AUA = 30000000
    RESULT = {o_AGE_SEGMENT20M-30M,o_AGE_SEGMENT_ORD5}
    break;    
   case I_ADVISOR_SUM_AUA  30000000 && I_ADVISOR_SUM_AUA = 50000000
    RESULT = {o_AGE_SEGMENT30M-50M,o_AGE_SEGMENT_ORD6}
    break; 
    case I_ADVISOR_SUM_AUA  50000000 
    RESULT = {o_AGE_SEGMENT 50M,o_AGE_SEGMENT_ORD7}
    break;  
  default
    RESULT = {o_AGE_SEGMENTUnknown,o_AGE_SEGMENT_ORD0}
}   
 
  return RESULT;
';
CREATE OR REPLACE PROCEDURE SP_CONV_BR_ALL_ADVISOR_AUA_SEGMENTATION_002(I_ADVISOR_SUM_AUA FLOAT)
RETURNS VARIANT
LANGUAGE JAVASCRIPT
EXECUTE AS OWNER
AS ' 
 var RESULT = {o_AGE_SEGMENTUnknown,o_AGE_SEGMENT_ORD0};  
    
  switch(true) {
  case I_ADVISOR_SUM_AUA == 0 
    RESULT = {o_AGE_SEGMENT0,o_AGE_SEGMENT_ORD-1}
    break;
  case I_ADVISOR_SUM_AUA = 1000000 
    RESULT = {o_AGE_SEGMENT= 1M,o_AGE_SEGMENT_ORD1}
    break;
  case I_ADVISOR_SUM_AUA  parseFloat(1000000) && I_ADVISOR_SUM_AUA = parseFloat(5000000)
    RESULT = {o_AGE_SEGMENT1M-5M,o_AGE_SEGMENT_ORD2}
    break;  
  case I_ADVISOR_SUM_AUA  5000000 && I_ADVISOR_SUM_AUA = 10000000
    RESULT = {o_AGE_SEGMENT5M-10M,o_AGE_SEGMENT_ORD3}
    break; 
   case I_ADVISOR_SUM_AUA  10000000 && I_ADVISOR_SUM_AUA = 20000000
    RESULT = {o_AGE_SEGMENT10M-20M,o_AGE_SEGMENT_ORD4}
    break;  
   case I_ADVISOR_SUM_AUA  20000000 && I_ADVISOR_SUM_AUA = 30000000
    RESULT = {o_AGE_SEGMENT20M-30M,o_AGE_SEGMENT_ORD5}
    break;    
   case I_ADVISOR_SUM_AUA  30000000 && I_ADVISOR_SUM_AUA = 50000000
    RESULT = {o_AGE_SEGMENT30M-50M,o_AGE_SEGMENT_ORD6}
    break; 
    case I_ADVISOR_SUM_AUA  50000000 
    RESULT = {o_AGE_SEGMENT 50M,o_AGE_SEGMENT_ORD7}
    break;  
  default
    RESULT = {o_AGE_SEGMENTUnknown,o_AGE_SEGMENT_ORD0}
}   
 
  return RESULT;
';
CREATE OR REPLACE FUNCTION UDF_CONV_BR_ALL_ADVISOR_001(I_ADVISORSTARTDATE VARCHAR(29), I_LOADDATE VARCHAR(29))
RETURNS VARCHAR(1)
LANGUAGE JAVASCRIPT
AS ' 
  var d2 = new Date(I_LOADDATE);   
  var d1 = new Date(I_ADVISORSTARTDATE);  
  var diff = d2.getTime() - d1.getTime();
  var year_diff = Math.floor(diff  (1000  60  60  24));  
  return year_diff = 365  ''1'' ''0'';    
';
CREATE OR REPLACE FUNCTION UDF_CONV_BR_ALL_ADVISOR_003(I_ADVISORDATEOFBIRTH VARCHAR(29), I_ASOFDATE VARCHAR(29), I_ISCORPORATION BOOLEAN)
RETURNS VARIANT
LANGUAGE JAVASCRIPT
AS '
 
  var RESULT = {o_AGE_SEGMENTUnknown,o_AGE_SEGMENT_ORD6}
  var d1 = new Date(I_ADVISORDATEOFBIRTH);   
  var d2 = new Date(I_ASOFDATE);  
  var diff = d2.getTime() - d1.getTime();
  var year_diff = Math.floor((diff  (1000  60  60  24))365.25);    
  if (I_ISCORPORATION )
   {
    return {o_AGE_SEGMENTCorporate,o_AGE_SEGMENT_ORD8} 
   }
 switch(true) {
  case year_diff  0 
    RESULT = {o_AGE_SEGMENTUnknown,o_AGE_SEGMENT_ORD7}
    break;
  case year_diff  25 
    RESULT = {o_AGE_SEGMENTUnder 25,o_AGE_SEGMENT_ORD1}
    break;
  case year_diff = 25 && year_diff  45
    RESULT = {o_AGE_SEGMENT25-44,o_AGE_SEGMENT_ORD2}
    break;  
  case year_diff = 45 && year_diff  55
    RESULT = {o_AGE_SEGMENT45-54,o_AGE_SEGMENT_ORD3}
    break;  
   case year_diff = 55 && year_diff  61
    RESULT = {o_AGE_SEGMENT55-60,o_AGE_SEGMENT_ORD4}
    break;   
   case year_diff = 61
    RESULT = {o_AGE_SEGMENTOver 60,o_AGE_SEGMENT_ORD5}
    break;    
  default
    RESULT = {o_AGE_SEGMENTUnknown,o_AGE_SEGMENT_ORD6}
}   
  return RESULT;
';
CREATE OR REPLACE FUNCTION UDF_CONV_BR_ALL_ADVISOR_AUA_SEGMENTATION_002(I_ADVISOR_SUM_AUA FLOAT)
RETURNS VARIANT
LANGUAGE JAVASCRIPT
AS ' 
 var RESULT = {o_ADVISOR_AUA_SEGMENTUnknown,o_ADVISOR_AUA_SEGMENT_ORDER0};  
    
  switch(true) {
  case I_ADVISOR_SUM_AUA == 0 
    RESULT = {o_ADVISOR_AUA_SEGMENT0,o_ADVISOR_AUA_SEGMENT_ORDER-1}
    break;
  case I_ADVISOR_SUM_AUA = 1000000 
    RESULT = {o_ADVISOR_AUA_SEGMENT= 1M,o_ADVISOR_AUA_SEGMENT_ORDER1}
    break;
  case I_ADVISOR_SUM_AUA  parseFloat(1000000) && I_ADVISOR_SUM_AUA = parseFloat(5000000)
    RESULT = {o_ADVISOR_AUA_SEGMENT1M-5M,o_ADVISOR_AUA_SEGMENT_ORDER2}
    break;  
  case I_ADVISOR_SUM_AUA  5000000 && I_ADVISOR_SUM_AUA = 10000000
    RESULT = {o_ADVISOR_AUA_SEGMENT5M-10M,o_ADVISOR_AUA_SEGMENT_ORDER3}
    break; 
   case I_ADVISOR_SUM_AUA  10000000 && I_ADVISOR_SUM_AUA = 20000000
    RESULT = {o_ADVISOR_AUA_SEGMENT10M-20M,o_ADVISOR_AUA_SEGMENT_ORDER4}
    break;  
   case I_ADVISOR_SUM_AUA  20000000 && I_ADVISOR_SUM_AUA = 30000000
    RESULT = {o_ADVISOR_AUA_SEGMENT20M-30M,o_ADVISOR_AUA_SEGMENT_ORDER5}
    break;    
   case I_ADVISOR_SUM_AUA  30000000 && I_ADVISOR_SUM_AUA = 50000000
    RESULT = {o_ADVISOR_AUA_SEGMENT30M-50M,o_ADVISOR_AUA_SEGMENT_ORDER6}
    break; 
    case I_ADVISOR_SUM_AUA  50000000 
    RESULT = {o_ADVISOR_AUA_SEGMENT 50M,o_ADVISOR_AUA_SEGMENT_ORDER7}
    break;  
  default
    RESULT = {o_ADVISOR_AUA_SEGMENTUnknown,o_ADVISOR_AUA_SEGMENT_ORDER0}
}   
 
  return RESULT;
';

CREATE OR REPLACE PROCEDURE BR_ALL_ADVISOR_AUA_SEGMENTATION_002(I_ADVISOR_SUM_AUA FLOAT)
RETURNS VARIANT
LANGUAGE JAVASCRIPT
EXECUTE AS OWNER
AS ' 
 var RESULT = {o_AGE_SEGMENTUnknown,o_AGE_SEGMENT_ORD0};  
    
  switch(true) {
  case I_ADVISOR_SUM_AUA == 0 
    RESULT = {o_AGE_SEGMENT0,o_AGE_SEGMENT_ORD-1}
    break;
  case I_ADVISOR_SUM_AUA = 1000000 
    RESULT = {o_AGE_SEGMENT= 1M,o_AGE_SEGMENT_ORD1}
    break;
  case I_ADVISOR_SUM_AUA  parseFloat(1000000) && I_ADVISOR_SUM_AUA = parseFloat(5000000)
    RESULT = {o_AGE_SEGMENT1M-5M,o_AGE_SEGMENT_ORD2}
    break;  
  case I_ADVISOR_SUM_AUA  5000000 && I_ADVISOR_SUM_AUA = 10000000
    RESULT = {o_AGE_SEGMENT5M-10M,o_AGE_SEGMENT_ORD3}
    break; 
   case I_ADVISOR_SUM_AUA  10000000 && I_ADVISOR_SUM_AUA = 20000000
    RESULT = {o_AGE_SEGMENT10M-20M,o_AGE_SEGMENT_ORD4}
    break;  
   case I_ADVISOR_SUM_AUA  20000000 && I_ADVISOR_SUM_AUA = 30000000
    RESULT = {o_AGE_SEGMENT20M-30M,o_AGE_SEGMENT_ORD5}
    break;    
   case I_ADVISOR_SUM_AUA  30000000 && I_ADVISOR_SUM_AUA = 50000000
    RESULT = {o_AGE_SEGMENT30M-50M,o_AGE_SEGMENT_ORD6}
    break; 
    case I_ADVISOR_SUM_AUA  50000000 
    RESULT = {o_AGE_SEGMENT 50M,o_AGE_SEGMENT_ORD7}
    break;  
  default
    RESULT = {o_AGE_SEGMENTUnknown,o_AGE_SEGMENT_ORD0}
}   
 
  return RESULT;
';
CREATE OR REPLACE PROCEDURE BR_UNIVERIS_CLIENTS_INCOME_SEGMENTATION_006(I_SALARY_DESC VARCHAR(100))
RETURNS VARIANT
LANGUAGE JAVASCRIPT
EXECUTE AS OWNER
AS '
  
  
  var RESULT = {}
 switch(true) {
    case I_SALARY_DESC === Less or Equal to $30,000 
    RESULT = {o_IncomeSegmentation($30k),o_IncomeSegmentation_Ord1}
    break;
  case I_SALARY_DESC === $30,001 to $50,000
    RESULT = {o_IncomeSegmentation$30k - $50k,o_IncomeSegmentation_Ord2}
    break;  
   case I_SALARY_DESC === $50,001 to $70,000
   RESULT = {o_IncomeSegmentation$50k - $70k,o_IncomeSegmentation_Ord3}
    break;    
   case I_SALARY_DESC === $70,001 to $100,000
    RESULT = {o_IncomeSegmentation$70k - $100k,o_IncomeSegmentation_Ord4}
    break;  
    case I_SALARY_DESC === $100,001 to $200,000
    RESULT = {o_IncomeSegmentation$100k - $200k,o_IncomeSegmentation_Ord5}
    break; 
   case I_SALARY_DESC === $200,001 to 300,000
   RESULT = {o_IncomeSegmentation$200k - $300k,o_IncomeSegmentation_Ord6}
    break; 
   case I_SALARY_DESC === Greater or Equal to $300,001  I_SALARY_DESC === More or Equal to $300,001
    RESULT = {o_IncomeSegmentation$300k+,o_IncomeSegmentation_Ord7}
    break;    
  default
    RESULT = {o_AGE_SEGMENTUnknown,o_AGE_SEGMENT_ORD8}
}   
  return RESULT;
';
CREATE OR REPLACE PROCEDURE SP_CONV_BR_ALL_ADVISOR_001(I_ADVISORSTARTDATE VARCHAR(29), I_LOADDATE VARCHAR(29))
RETURNS VARCHAR(1)
LANGUAGE JAVASCRIPT
EXECUTE AS OWNER
AS ' 
  var d2 = new Date(I_LOADDATE);   
  var d1 = new Date(I_ADVISORSTARTDATE);  
  var diff = d2.getTime() - d1.getTime();
  var year_diff = Math.floor(diff  (1000  60  60  24));  
  return year_diff = 365  ''1'' ''0'';    
';
CREATE OR REPLACE PROCEDURE SP_CONV_BR_ALL_ADVISOR_003(I_ADVISORDATEOFBIRTH VARCHAR(29), I_ASOFDATE VARCHAR(29), I_ISCORPORATION BOOLEAN)
RETURNS VARIANT
LANGUAGE JAVASCRIPT
EXECUTE AS OWNER
AS '
 
  var RESULT = {o_AGE_SEGMENTUnknown,o_AGE_SEGMENT_ORD6}
  var d1 = new Date(I_ADVISORDATEOFBIRTH);   
  var d2 = new Date(I_ASOFDATE);  
  var diff = d2.getTime() - d1.getTime();
  var year_diff = Math.floor((diff  (1000  60  60  24))365.25);    
  if (I_ISCORPORATION )
   {
    return {o_AGE_SEGMENTCorporate,o_AGE_SEGMENT_ORD8} 
   }
 switch(true) {
  case year_diff  0 
    RESULT = {o_AGE_SEGMENTUnknown,o_AGE_SEGMENT_ORD7}
    break;
  case year_diff  25 
    RESULT = {o_AGE_SEGMENTUnder 25,o_AGE_SEGMENT_ORD1}
    break;
  case year_diff = 25 && year_diff  45
    RESULT = {o_AGE_SEGMENT25-44,o_AGE_SEGMENT_ORD2}
    break;  
  case year_diff = 45 && year_diff  55
    RESULT = {o_AGE_SEGMENT45-54,o_AGE_SEGMENT_ORD3}
    break;  
   case year_diff = 55 && year_diff  61
    RESULT = {o_AGE_SEGMENT55-60,o_AGE_SEGMENT_ORD4}
    break;   
   case year_diff = 61
    RESULT = {o_AGE_SEGMENTOver 60,o_AGE_SEGMENT_ORD5}
    break;    
  default
    RESULT = {o_AGE_SEGMENTUnknown,o_AGE_SEGMENT_ORD6}
}   
  return RESULT;
';
CREATE OR REPLACE PROCEDURE SP_CONV_BR_ALL_ADVISOR_003(I_ADVISOR_SUM_AUA FLOAT)
RETURNS VARIANT
LANGUAGE JAVASCRIPT
EXECUTE AS OWNER
AS ' 
 var RESULT = {o_AGE_SEGMENTUnknown,o_AGE_SEGMENT_ORD0};  
    
  switch(true) {
  case I_ADVISOR_SUM_AUA == 0 
    RESULT = {o_AGE_SEGMENT0,o_AGE_SEGMENT_ORD-1}
    break;
  case I_ADVISOR_SUM_AUA = 1000000 
    RESULT = {o_AGE_SEGMENT= 1M,o_AGE_SEGMENT_ORD1}
    break;
  case I_ADVISOR_SUM_AUA  parseFloat(1000000) && I_ADVISOR_SUM_AUA = parseFloat(5000000)
    RESULT = {o_AGE_SEGMENT1M-5M,o_AGE_SEGMENT_ORD2}
    break;  
  case I_ADVISOR_SUM_AUA  5000000 && I_ADVISOR_SUM_AUA = 10000000
    RESULT = {o_AGE_SEGMENT5M-10M,o_AGE_SEGMENT_ORD3}
    break; 
   case I_ADVISOR_SUM_AUA  10000000 && I_ADVISOR_SUM_AUA = 20000000
    RESULT = {o_AGE_SEGMENT10M-20M,o_AGE_SEGMENT_ORD4}
    break;  
   case I_ADVISOR_SUM_AUA  20000000 && I_ADVISOR_SUM_AUA = 30000000
    RESULT = {o_AGE_SEGMENT20M-30M,o_AGE_SEGMENT_ORD5}
    break;    
   case I_ADVISOR_SUM_AUA  30000000 && I_ADVISOR_SUM_AUA = 50000000
    RESULT = {o_AGE_SEGMENT30M-50M,o_AGE_SEGMENT_ORD6}
    break; 
    case I_ADVISOR_SUM_AUA  50000000 
    RESULT = {o_AGE_SEGMENT 50M,o_AGE_SEGMENT_ORD7}
    break;  
  default
    RESULT = {o_AGE_SEGMENTUnknown,o_AGE_SEGMENT_ORD0}
}   
 
  return RESULT;
';
CREATE OR REPLACE PROCEDURE SP_CONV_BR_ALL_ADVISOR_003(I_ADVISOR_SUM_AUA VARCHAR(16777216))
RETURNS VARIANT
LANGUAGE JAVASCRIPT
EXECUTE AS OWNER
AS ' 
 var RESULT = {o_AGE_SEGMENTUnknown,o_AGE_SEGMENT_ORD0};
   switch(true) {
  case I_ADVISOR_SUM_AUA = 0 
    RESULT = {o_AGE_SEGMENT0,o_AGE_SEGMENT_ORD-1}
    break;
  case I_ADVISOR_SUM_AUA = 1000000 
    RESULT = {o_AGE_SEGMENT= 1M,o_AGE_SEGMENT_ORD1}
    break;
  case I_ADVISOR_SUM_AUA  1000000 && I_ADVISOR_SUM_AUA = 5000000
    RESULT = {o_AGE_SEGMENT1M-5M,o_AGE_SEGMENT_ORD2}
    break;  
  case I_ADVISOR_SUM_AUA  5000000 && I_ADVISOR_SUM_AUA = 10000000
    RESULT = {o_AGE_SEGMENT5M-10M,o_AGE_SEGMENT_ORD3}
    break; 
   case I_ADVISOR_SUM_AUA  10000000 && I_ADVISOR_SUM_AUA = 20000000
    RESULT = {o_AGE_SEGMENT10M-20M,o_AGE_SEGMENT_ORD4}
    break;  
   case I_ADVISOR_SUM_AUA  20000000 && I_ADVISOR_SUM_AUA = 30000000
    RESULT = {o_AGE_SEGMENT20M-30M,o_AGE_SEGMENT_ORD5}
    break;    
   case I_ADVISOR_SUM_AUA  30000000 && I_ADVISOR_SUM_AUA = 50000000
    RESULT = {o_AGE_SEGMENT30M-50M,o_AGE_SEGMENT_ORD6}
    break; 
    case I_ADVISOR_SUM_AUA  50000000 
    RESULT = {o_AGE_SEGMENT 50M,o_AGE_SEGMENT_ORD7}
    break;  
  default
    RESULT = {o_AGE_SEGMENTUnknown,o_AGE_SEGMENT_ORD0}
}   
 
  return RESULT;
';
CREATE OR REPLACE PROCEDURE SP_CONV_BR_ALL_ADVISOR_AUA_SEGMENTATION_002(I_ADVISOR_SUM_AUA FLOAT)
RETURNS VARIANT
LANGUAGE JAVASCRIPT
EXECUTE AS OWNER
AS ' 
 var RESULT = {o_AGE_SEGMENTUnknown,o_AGE_SEGMENT_ORD0};  
    
  switch(true) {
  case I_ADVISOR_SUM_AUA == 0 
    RESULT = {o_AGE_SEGMENT0,o_AGE_SEGMENT_ORD-1}
    break;
  case I_ADVISOR_SUM_AUA = 1000000 
    RESULT = {o_AGE_SEGMENT= 1M,o_AGE_SEGMENT_ORD1}
    break;
  case I_ADVISOR_SUM_AUA  parseFloat(1000000) && I_ADVISOR_SUM_AUA = parseFloat(5000000)
    RESULT = {o_AGE_SEGMENT1M-5M,o_AGE_SEGMENT_ORD2}
    break;  
  case I_ADVISOR_SUM_AUA  5000000 && I_ADVISOR_SUM_AUA = 10000000
    RESULT = {o_AGE_SEGMENT5M-10M,o_AGE_SEGMENT_ORD3}
    break; 
   case I_ADVISOR_SUM_AUA  10000000 && I_ADVISOR_SUM_AUA = 20000000
    RESULT = {o_AGE_SEGMENT10M-20M,o_AGE_SEGMENT_ORD4}
    break;  
   case I_ADVISOR_SUM_AUA  20000000 && I_ADVISOR_SUM_AUA = 30000000
    RESULT = {o_AGE_SEGMENT20M-30M,o_AGE_SEGMENT_ORD5}
    break;    
   case I_ADVISOR_SUM_AUA  30000000 && I_ADVISOR_SUM_AUA = 50000000
    RESULT = {o_AGE_SEGMENT30M-50M,o_AGE_SEGMENT_ORD6}
    break; 
    case I_ADVISOR_SUM_AUA  50000000 
    RESULT = {o_AGE_SEGMENT 50M,o_AGE_SEGMENT_ORD7}
    break;  
  default
    RESULT = {o_AGE_SEGMENTUnknown,o_AGE_SEGMENT_ORD0}
}   
 
  return RESULT;
';
CREATE OR REPLACE PROCEDURE SP_CONV_BR_ALL_CLIENTS_001(I_CLIENT_INCOME FLOAT)
RETURNS VARIANT
LANGUAGE JAVASCRIPT
EXECUTE AS OWNER
AS '
  
 var  RESULT = null;
 switch(true) {
    case I_CLIENT_INCOME == -1 
    RESULT = {o_INCOME_LEVEL_2_SEGMENTUnknown,o_INCOME_LEVEL_2_SEGMENT_ORD8}
    break;
  case I_CLIENT_INCOME = 30
    RESULT = {o_INCOME_LEVEL_2_SEGMENT''(=$30k)'',o_INCOME_LEVEL_2_SEGMENT_ORD1}
    break;  
   case I_CLIENT_INCOME  30  && I_CLIENT_INCOME = 50
    RESULT = {o_INCOME_LEVEL_2_SEGMENT$30k - $50k,o_INCOME_LEVEL_2_SEGMENT_ORD2}
    break;  
  case I_CLIENT_INCOME  50  && I_CLIENT_INCOME = 70
    RESULT = {o_INCOME_LEVEL_2_SEGMENT$50k - $70k,o_INCOME_LEVEL_2_SEGMENT_ORD3}
    break; 
   case I_CLIENT_INCOME  70  && I_CLIENT_INCOME = 100
    RESULT = {o_INCOME_LEVEL_2_SEGMENT$70k - $100k,o_INCOME_LEVEL_2_SEGMENT_ORD4}
    break;   
    case I_CLIENT_INCOME  100  && I_CLIENT_INCOME = 200
    RESULT = {o_INCOME_LEVEL_2_SEGMENT$70k - $100k,o_INCOME_LEVEL_2_SEGMENT_ORD5}
    break; 
    case I_CLIENT_INCOME  200  && I_CLIENT_INCOME = 300
    RESULT = {o_INCOME_LEVEL_2_SEGMENT$200k - $300k,o_INCOME_LEVEL_2_SEGMENT_ORD6}
    break;    
   case I_CLIENT_INCOME  300
    RESULT = {o_INCOME_LEVEL_2_SEGMENT$200k - $300k,o_INCOME_LEVEL_2_SEGMENT_ORD7}
    break; 
  default
    RESULT = {o_INCOME_LEVEL_2_SEGMENTUnknown,o_INCOME_LEVEL_2_SEGMENT_ORD8}
}   
  return RESULT;
';
CREATE OR REPLACE PROCEDURE SP_CONV_BR_ALL_CLIENTS_002(I_CLIENT_INCOME FLOAT)
RETURNS VARIANT
LANGUAGE JAVASCRIPT
EXECUTE AS OWNER
AS '
  
 var  RESULT = null;
 switch(true) {
    case I_CLIENT_INCOME == -1 
    RESULT = {o_INCOME_LEVEL_1_SEGMENTUnknown,o_INCOME_LEVEL_1_SEGMENT_ORD5}
    break;
  case I_CLIENT_INCOME = 30
    RESULT = {o_INCOME_LEVEL_1_SEGMENTLower,o_INCOME_LEVEL_1_SEGMENT_ORD1}
    break;  
   case I_CLIENT_INCOME  30  && I_CLIENT_INCOME = 70
    RESULT = {o_INCOME_LEVEL_1_SEGMENTMiddle,o_INCOME_LEVEL_1_SEGMENT_ORD2}
    break;    
  case I_CLIENT_INCOME  70  && I_CLIENT_INCOME = 200
    RESULT = {o_INCOME_LEVEL_1_SEGMENTUpper,o_INCOME_LEVEL_1_SEGMENT_ORD3}
    break;  
   case I_CLIENT_INCOME  200
    RESULT = {o_INCOME_LEVEL_1_SEGMENTHigh,o_INCOME_LEVEL_1_SEGMENT_ORD4}
    break; 
  default
    RESULT = {o_INCOME_LEVEL_1_SEGMENTUnknown,o_INCOME_LEVEL_1_SEGMENT_ORD5}
}   
  return RESULT;
';
CREATE OR REPLACE PROCEDURE SP_CONV_BR_ALL_CLIENTS_003(I_CLIENTDATEOFBIRTH VARCHAR(29), I_ASOFDATE VARCHAR(29), I_IS_CORPORATION BOOLEAN)
RETURNS VARIANT
LANGUAGE JAVASCRIPT
EXECUTE AS OWNER
AS '
  
  if (I_IS_CORPORATION  == null  && I_CLIENTDATEOFBIRTH == null)
   {
    return {o_AGE_SEGMENTUnknown,o_AGE_SEGMENT_ORD8};
    }
  if (I_IS_CORPORATION)
  {
    return {o_AGE_SEGMENT''Corporate'',o_AGE_SEGMENT_ORD9};
  }
  var RESULT = {};
  var d1 = new Date(I_CLIENTDATEOFBIRTH);   
  var d2 = new Date(I_ASOFDATE);  
  var diff = d2.getTime() - d1.getTime();
  var year_diff = Math.floor((diff  (1000  60  60  24))365.25);    
  
 switch(true) {
    case year_diff  25 
    RESULT = {o_AGE_SEGMENTUnder 25,o_AGE_SEGMENT_ORD1}
    break;
  case year_diff = 25 && year_diff  35
    RESULT = {o_AGE_SEGMENT25-34,o_AGE_SEGMENT_ORD2}
    break;  
   case year_diff = 35 && year_diff  45
    RESULT = {o_AGE_SEGMENT35-44,o_AGE_SEGMENT_ORD3}
    break;    
  case year_diff = 45 && year_diff  55
    RESULT = {o_AGE_SEGMENT45-54,o_AGE_SEGMENT_ORD4}
    break;  
   case year_diff = 55 && year_diff  65
    RESULT = {o_AGE_SEGMENT55-64,o_AGE_SEGMENT_ORD5}
    break; 
   case year_diff = 65 && year_diff  75
    RESULT = {o_AGE_SEGMENT65-74,o_AGE_SEGMENT_ORD6}
    break; 
   case year_diff = 75
    RESULT = {o_AGE_SEGMENTOver 75,o_AGE_SEGMENT_ORD7}
    break;    
  default
    RESULT = {o_AGE_SEGMENTUnknown,o_AGE_SEGMENT_ORD8}
}   
  return RESULT;
';
CREATE OR REPLACE PROCEDURE SP_CONV_BR_ALL_CLIENTS_PROVINCE_005(I_COUNTRY_CODE VARCHAR(10), I_PROVINCE_CODE VARCHAR(10))
RETURNS VARCHAR(16777216)
LANGUAGE JAVASCRIPT
EXECUTE AS OWNER
AS '  
  
  var RESULT = {}
  if (I_COUNTRY_CODE  != CAN && I_PROVINCE_CODE != null )
  {
   return ''Outside Canada'';
  }
 switch(true) {
    case I_PROVINCE_CODE == SK 
    RESULT =  Saskatchewan;
    break;
    case I_PROVINCE_CODE == MB 
    RESULT =  Manitoba;
    break;
    case I_PROVINCE_CODE == NS 
    RESULT =  Nova Scotia;
    break;
    case I_PROVINCE_CODE == NL 
    RESULT =  Newfoundland and Labrador;
    break;
    case I_PROVINCE_CODE == PE 
    RESULT =  Prince Edward Island;
    break;
    case I_PROVINCE_CODE == QC 
    RESULT =  Quebec;
    break;
    case I_PROVINCE_CODE == ON 
    RESULT =  Ontario;
    break;
    case I_PROVINCE_CODE == BC 
    RESULT =  British Columbia;
    break;
    case I_PROVINCE_CODE == NB 
    RESULT =  New Brunswick;
    break;
    case I_PROVINCE_CODE == AB 
    RESULT =  Alberta;
    break;
    case I_PROVINCE_CODE == NT 
    RESULT =  Northwest Territories;
    break;
    case I_PROVINCE_CODE == YT 
    RESULT =  Yukon;
    break;
    case I_PROVINCE_CODE == NU 
    RESULT =  Nunavut; 
    break;
  default
    RESULT = Unknown
}   
  return RESULT;
';
CREATE OR REPLACE PROCEDURE SP_CONV_BR_ALL_CLIENT_AUA_SEGMENTATION_002(I_CLIENT_SUM_AUA FLOAT)
RETURNS VARIANT
LANGUAGE JAVASCRIPT
EXECUTE AS OWNER
AS '  
  
  var RESULT = {}
 switch(true) {
    case I_CLIENT_SUM_AUA  25000 
    RESULT = {o_CLIENT_AUA_SEGMENT25k,o_CLIENT_AUA_SEGMENT_ORDER1}
    break;
  case I_CLIENT_SUM_AUA =25000 &&  I_CLIENT_SUM_AUA = 100000 
    RESULT = {o_CLIENT_AUA_SEGMENT25k-100k,o_CLIENT_AUA_SEGMENT_ORDER2}
    break;  
   case I_CLIENT_SUM_AUA =100000 &&  I_CLIENT_SUM_AUA = 250000
   RESULT = {o_CLIENT_AUA_SEGMENT100k-250k,o_CLIENT_AUA_SEGMENT_ORDER3}
    break;    
   case I_CLIENT_SUM_AUA =250000 &&  I_CLIENT_SUM_AUA = 500000 
    RESULT = {o_CLIENT_AUA_SEGMENT250k-500k,o_CLIENT_AUA_SEGMENT_ORDER4}
    break;  
    case I_CLIENT_SUM_AUA  500000
    RESULT = {o_CLIENT_AUA_SEGMENT 500k,o_CLIENT_AUA_SEGMENT_ORDER5}
    break; 
   
  default
    RESULT = {o_CLIENT_AUA_SEGMENTUnknown,o_CLIENT_AUA_SEGMENT_ORDER6}
}   
  return RESULT;
';
CREATE OR REPLACE PROCEDURE SP_CONV_BR_UNIVERIS_CLIENTS_AGE_SEGMENTATION_008(I_CLIENTDATEOFBIRTH VARCHAR(29), I_ASOFDATE VARCHAR(29), I_CORP_CD VARCHAR(16777216))
RETURNS VARIANT
LANGUAGE JAVASCRIPT
EXECUTE AS OWNER
AS '
  
  if ((I_CORP_CD  == null  I_CORP_CD  != ''C'') && I_CLIENTDATEOFBIRTH == null)
   {
    return {o_AGE_SEGMENTUnknown,o_AGE_SEGMENT_ORD8};
    }
  if (I_CORP_CD == ''C'')
  {
    return {o_AGE_SEGMENT''Corporate'',o_AGE_SEGMENT_ORD9};
  }
  var RESULT = {o_AGE_SEGMENTUnknown,o_AGE_SEGMENT_ORD6}
  var d1 = new Date(I_CLIENTDATEOFBIRTH);   
  var d2 = new Date(I_ASOFDATE);  
  var diff = d2.getTime() - d1.getTime();
  var year_diff = Math.floor((diff  (1000  60  60  24))365.25);    
  
 switch(true) {
    case year_diff  25 
    RESULT = {o_AGE_SEGMENTUnder 25,o_AGE_SEGMENT_ORD1}
    break;
  case year_diff = 25 && year_diff  35
    RESULT = {o_AGE_SEGMENT25-34,o_AGE_SEGMENT_ORD2}
    break;  
   case year_diff = 35 && year_diff  45
    RESULT = {o_AGE_SEGMENT35-44,o_AGE_SEGMENT_ORD3}
    break;    
  case year_diff = 45 && year_diff  55
    RESULT = {o_AGE_SEGMENT45-54,o_AGE_SEGMENT_ORD4}
    break;  
   case year_diff = 55 && year_diff  65
    RESULT = {o_AGE_SEGMENT55-64,o_AGE_SEGMENT_ORD5}
    break; 
   case year_diff = 65 && year_diff  75
    RESULT = {o_AGE_SEGMENT65-74,o_AGE_SEGMENT_ORD6}
    break; 
   case year_diff = 75
    RESULT = {o_AGE_SEGMENTOver 75,o_AGE_SEGMENT_ORD7}
    break;    
  default
    RESULT = {o_AGE_SEGMENTUnknown,o_AGE_SEGMENT_ORD8}
}   
  return RESULT;
';
CREATE OR REPLACE PROCEDURE SP_CONV_BR_UNIVERIS_CLIENTS_INCOME_SEGMENTATION_006(I_SALARY_DESC VARCHAR(100))
RETURNS VARIANT
LANGUAGE JAVASCRIPT
EXECUTE AS OWNER
AS '
  
  
  var RESULT = {}
 switch(true) {
    case I_SALARY_DESC === Less or Equal to $30,000 
    RESULT = {o_IncomeSegmentation($30k),o_IncomeSegmentation_Ord1}
    break;
  case I_SALARY_DESC === $30,001 to $50,000
    RESULT = {o_IncomeSegmentation$30k - $50k,o_IncomeSegmentation_Ord2}
    break;  
   case I_SALARY_DESC === $50,001 to $70,000
   RESULT = {o_IncomeSegmentation$50k - $70k,o_IncomeSegmentation_Ord3}
    break;    
   case I_SALARY_DESC === $70,001 to $100,000
    RESULT = {o_IncomeSegmentation$70k - $100k,o_IncomeSegmentation_Ord4}
    break;  
    case I_SALARY_DESC === $100,001 to $200,000
    RESULT = {o_IncomeSegmentation$100k - $200k,o_IncomeSegmentation_Ord5}
    break; 
   case I_SALARY_DESC === $200,001 to 300,000
   RESULT = {o_IncomeSegmentation$200k - $300k,o_IncomeSegmentation_Ord6}
    break; 
   case I_SALARY_DESC === Greater or Equal to $300,001  I_SALARY_DESC === More or Equal to $300,001
    RESULT = {o_IncomeSegmentation$300k+,o_IncomeSegmentation_Ord7}
    break;    
  default
    RESULT = {o_AGE_SEGMENTUnknown,o_AGE_SEGMENT_ORD8}
}   
  return RESULT;
';
CREATE OR REPLACE PROCEDURE SP_CONV_BR_UNIVERIS_CLIENTS_SALARY_SEGMENTATION_007(I_SALARY_DESC VARCHAR(100))
RETURNS VARIANT
LANGUAGE JAVASCRIPT
EXECUTE AS OWNER
AS '
  
  
  var RESULT = {}
 switch(true) {
    case I_SALARY_DESC === Less or Equal to $30,000 
    RESULT = {o_SalarySegmentationLower,o_SalarySegmentation_Ord1}
    break;
  case I_SALARY_DESC === $30,001 to $50,000  I_SALARY_DESC === $50,001 to $70,000
    RESULT = {o_SalarySegmentationMiddle,o_SalarySegmentation_Ord2};
    break;
   case I_SALARY_DESC === $70,001 to $100,000   I_SALARY_DESC === $100,001 to $200,000
    RESULT = {o_SalarySegmentationUpper,o_SalarySegmentation_Ord3}
    break;  
    case I_SALARY_DESC === $200,001 to 300,000  I_SALARY_DESC === Greater or Equal to $300,001  I_SALARY_DESC === More or Equal to $300,001
   RESULT = {o_SalarySegmentationHigh,o_SalarySegmentation_Ord4}
    break; 
   default
    RESULT = {o_SalarySegmentationUnknown,o_SalarySegmentation_Ord5}
}   
  return RESULT;
';
CREATE OR REPLACE PROCEDURE SP_CONV_MPLT_BR_ALL_CLIENTS_004(I_ASOFDATE VARCHAR(29), I_CLIENT_CONTRACT_START_DATE VARCHAR(29))
RETURNS VARCHAR(16777216)
LANGUAGE JAVASCRIPT
EXECUTE AS OWNER
AS '  
 var  RESULT = ;
 if (I_ASOFDATE == null  I_CLIENT_CONTRACT_START_DATE == null)
 
    return Unknown;
  
    else 
   
   (I_ASOFDATE === I_CLIENT_CONTRACT_START_DATE)RESULT = YesRESULT = No  ;
  
   return RESULT;
';
CREATE OR REPLACE FUNCTION UDF_CONV_BR_ALL_CLIENTS_001(I_CLIENT_INCOME FLOAT)
RETURNS OBJECT
LANGUAGE JAVASCRIPT
AS '
  
 var  RESULT = null;
 switch(true) {
    case I_CLIENT_INCOME == -1 
    RESULT = {o_INCOME_LEVEL_2_SEGMENTUnknown,o_INCOME_LEVEL_2_SEGMENT_ORD8}
    break;
  case I_CLIENT_INCOME = 30
    RESULT = {o_INCOME_LEVEL_2_SEGMENT''(=$30k)'',o_INCOME_LEVEL_2_SEGMENT_ORD1}
    break;  
   case I_CLIENT_INCOME  30  && I_CLIENT_INCOME = 50
    RESULT = {o_INCOME_LEVEL_2_SEGMENT$30k - $50k,o_INCOME_LEVEL_2_SEGMENT_ORD2}
    break;  
  case I_CLIENT_INCOME  50  && I_CLIENT_INCOME = 70
    RESULT = {o_INCOME_LEVEL_2_SEGMENT$50k - $70k,o_INCOME_LEVEL_2_SEGMENT_ORD3}
    break; 
   case I_CLIENT_INCOME  70  && I_CLIENT_INCOME = 100
    RESULT = {o_INCOME_LEVEL_2_SEGMENT$70k - $100k,o_INCOME_LEVEL_2_SEGMENT_ORD4}
    break;   
    case I_CLIENT_INCOME  100  && I_CLIENT_INCOME = 200
    RESULT = {o_INCOME_LEVEL_2_SEGMENT$70k - $100k,o_INCOME_LEVEL_2_SEGMENT_ORD5}
    break; 
    case I_CLIENT_INCOME  200  && I_CLIENT_INCOME = 300
    RESULT = {o_INCOME_LEVEL_2_SEGMENT$200k - $300k,o_INCOME_LEVEL_2_SEGMENT_ORD6}
    break;    
   case I_CLIENT_INCOME  300
    RESULT = {o_INCOME_LEVEL_2_SEGMENT$200k - $300k,o_INCOME_LEVEL_2_SEGMENT_ORD7}
    break; 
  default
    RESULT = {o_INCOME_LEVEL_2_SEGMENTUnknown,o_INCOME_LEVEL_2_SEGMENT_ORD8}
}   
  return RESULT;
';
CREATE OR REPLACE FUNCTION UDF_CONV_BR_ALL_CLIENTS_002(I_CLIENT_INCOME FLOAT)
RETURNS OBJECT
LANGUAGE JAVASCRIPT
AS '
  
 var  RESULT = null;
 switch(true) {
    case I_CLIENT_INCOME == -1 
    RESULT = {o_INCOME_LEVEL_1_SEGMENTUnknown,o_INCOME_LEVEL_1_SEGMENT_ORD5}
    break;
  case I_CLIENT_INCOME = 30
    RESULT = {o_INCOME_LEVEL_1_SEGMENTLower,o_INCOME_LEVEL_1_SEGMENT_ORD1}
    break;  
   case I_CLIENT_INCOME  30  && I_CLIENT_INCOME = 70
    RESULT = {o_INCOME_LEVEL_1_SEGMENTMiddle,o_INCOME_LEVEL_1_SEGMENT_ORD2}
    break;    
  case I_CLIENT_INCOME  70  && I_CLIENT_INCOME = 200
    RESULT = {o_INCOME_LEVEL_1_SEGMENTUpper,o_INCOME_LEVEL_1_SEGMENT_ORD3}
    break;  
   case I_CLIENT_INCOME  200
    RESULT = {o_INCOME_LEVEL_1_SEGMENTHigh,o_INCOME_LEVEL_1_SEGMENT_ORD4}
    break; 
  default
    RESULT = {o_INCOME_LEVEL_1_SEGMENTUnknown,o_INCOME_LEVEL_1_SEGMENT_ORD5}
}   
  return RESULT;
';
CREATE OR REPLACE FUNCTION UDF_CONV_BR_ALL_CLIENTS_003(I_CLIENTDATEOFBIRTH VARCHAR(29), I_ASOFDATE VARCHAR(29), I_IS_CORPORATION BOOLEAN)
RETURNS OBJECT
LANGUAGE JAVASCRIPT
AS '
  
  if (I_IS_CORPORATION  == null  && I_CLIENTDATEOFBIRTH == null)
   {
    return {o_AGE_SEGMENTUnknown,o_AGE_SEGMENT_ORD8};
    }
  if (I_IS_CORPORATION)
  {
    return {o_AGE_SEGMENT''Corporate'',o_AGE_SEGMENT_ORD9};
  }
  var RESULT = {};
  var d1 = new Date(I_CLIENTDATEOFBIRTH);   
  var d2 = new Date(I_ASOFDATE);  
  var diff = d2.getTime() - d1.getTime();
  var year_diff = Math.floor((diff  (1000  60  60  24))365.25);    
  
 switch(true) {
    case year_diff  25 
    RESULT = {o_AGE_SEGMENTUnder 25,o_AGE_SEGMENT_ORD1}
    break;
  case year_diff = 25 && year_diff  35
    RESULT = {o_AGE_SEGMENT25-34,o_AGE_SEGMENT_ORD2}
    break;  
   case year_diff = 35 && year_diff  45
    RESULT = {o_AGE_SEGMENT35-44,o_AGE_SEGMENT_ORD3}
    break;    
  case year_diff = 45 && year_diff  55
    RESULT = {o_AGE_SEGMENT45-54,o_AGE_SEGMENT_ORD4}
    break;  
   case year_diff = 55 && year_diff  65
    RESULT = {o_AGE_SEGMENT55-64,o_AGE_SEGMENT_ORD5}
    break; 
   case year_diff = 65 && year_diff  75
    RESULT = {o_AGE_SEGMENT65-74,o_AGE_SEGMENT_ORD6}
    break; 
   case year_diff = 75
    RESULT = {o_AGE_SEGMENTOver 75,o_AGE_SEGMENT_ORD7}
    break;    
  default
    RESULT = {o_AGE_SEGMENTUnknown,o_AGE_SEGMENT_ORD8}
}   
  return RESULT;
';
CREATE OR REPLACE FUNCTION UDF_CONV_BR_ALL_CLIENTS_004(I_ASOFDATE VARCHAR(29), I_CLIENT_CONTRACT_START_DATE VARCHAR(29))
RETURNS VARCHAR(16777216)
LANGUAGE JAVASCRIPT
AS '  
 var  RESULT = ;
 if (I_ASOFDATE == null  I_CLIENT_CONTRACT_START_DATE == null)
 
    return Unknown;
  
    else 
   
   (I_ASOFDATE === I_CLIENT_CONTRACT_START_DATE)RESULT = YesRESULT = No  ;
  
   return RESULT;
';
CREATE OR REPLACE FUNCTION UDF_CONV_BR_ALL_CLIENTS_PROVINCE_005(I_COUNTRY_CODE VARCHAR(10), I_PROVINCE_CODE VARCHAR(10))
RETURNS VARCHAR(16777216)
LANGUAGE JAVASCRIPT
AS '  
  
  var RESULT = {}
  if (I_COUNTRY_CODE  != CAN && I_PROVINCE_CODE != null )
  {
   return ''Outside Canada'';
  }
 switch(true) {
    case I_PROVINCE_CODE == SK 
    RESULT =  Saskatchewan;
    break;
    case I_PROVINCE_CODE == MB 
    RESULT =  Manitoba;
    break;
    case I_PROVINCE_CODE == NS 
    RESULT =  Nova Scotia;
    break;
    case I_PROVINCE_CODE == NL 
    RESULT =  Newfoundland and Labrador;
    break;
    case I_PROVINCE_CODE == PE 
    RESULT =  Prince Edward Island;
    break;
    case I_PROVINCE_CODE == QC 
    RESULT =  Quebec;
    break;
    case I_PROVINCE_CODE == ON 
    RESULT =  Ontario;
    break;
    case I_PROVINCE_CODE == BC 
    RESULT =  British Columbia;
    break;
    case I_PROVINCE_CODE == NB 
    RESULT =  New Brunswick;
    break;
    case I_PROVINCE_CODE == AB 
    RESULT =  Alberta;
    break;
    case I_PROVINCE_CODE == NT 
    RESULT =  Northwest Territories;
    break;
    case I_PROVINCE_CODE == YT 
    RESULT =  Yukon;
    break;
    case I_PROVINCE_CODE == NU 
    RESULT =  Nunavut; 
    break;
  default
    RESULT = Unknown
}   
  return RESULT;
';
CREATE OR REPLACE FUNCTION UDF_CONV_BR_ALL_CLIENT_AUA_SEGMENTATION_002(I_CLIENT_SUM_AUA FLOAT)
RETURNS OBJECT
LANGUAGE JAVASCRIPT
AS '  
  
  var RESULT = {}
 switch(true) {
    case I_CLIENT_SUM_AUA  25000 
    RESULT = {o_CLIENT_AUA_SEGMENT25k,o_CLIENT_AUA_SEGMENT_ORDER1}
    break;
  case I_CLIENT_SUM_AUA =25000 &&  I_CLIENT_SUM_AUA = 100000 
    RESULT = {o_CLIENT_AUA_SEGMENT25k-100k,o_CLIENT_AUA_SEGMENT_ORDER2}
    break;  
   case I_CLIENT_SUM_AUA =100000 &&  I_CLIENT_SUM_AUA = 250000
   RESULT = {o_CLIENT_AUA_SEGMENT100k-250k,o_CLIENT_AUA_SEGMENT_ORDER3}
    break;    
   case I_CLIENT_SUM_AUA =250000 &&  I_CLIENT_SUM_AUA = 500000 
    RESULT = {o_CLIENT_AUA_SEGMENT250k-500k,o_CLIENT_AUA_SEGMENT_ORDER4}
    break;  
    case I_CLIENT_SUM_AUA  500000
    RESULT = {o_CLIENT_AUA_SEGMENT 500k,o_CLIENT_AUA_SEGMENT_ORDER5}
    break; 
   
  default
    RESULT = {o_CLIENT_AUA_SEGMENTUnknown,o_CLIENT_AUA_SEGMENT_ORDER6}
}   
  return RESULT;
';
CREATE OR REPLACE FUNCTION UDF_CONV_BR_TBP_CUSTOMER_AGE_SEGMENTATION_001(I_BIRTH_DATE VARCHAR(29), I_REFERENCE_DATE VARCHAR(29), I_BIRTH_DATE_DIFF VARCHAR(16777216))
RETURNS OBJECT
LANGUAGE JAVASCRIPT
AS '  
  var RESULT = {o_AGE0,o_AGE_SEGMENTUnknown,o_AGE_SEGMENT_ORD6}
  var birth_diff = new Date(I_BIRTH_DATE_DIFF);
  var d1 = new Date(I_BIRTH_DATE);   
  var d2 = new Date(I_REFERENCE_DATE);  
  var diff = d2.getTime() - d1.getTime();
  var year_diff = Math.floor((diff  (1000  60  60  24))365.25);    
  age = birth_diff  d2  year_diff-1  year_diff
 switch(true) {
    case age  18 
    RESULT = {o_AGEage,o_AGE_GROUPyounger than 18,o_AGE_GROUP_SORT1}
    break;
  case age = 18 && year_diff  30
    RESULT = {o_AGEage,o_AGE_GROUP18 to 29 years old,o_AGE_GROUP_SORT2}
    break;  
   case year_diff = 30 && year_diff  50
    RESULT = {o_AGEage,o_AGE_GROUP30 to 49 years old,o_AGE_GROUP_SORT3}
    break;    
  case year_diff = 50 && year_diff  65
    RESULT = {o_AGEage,o_AGE_GROUP50 to 65 years old,o_AGE_GROUP_SORT4}
    break;
      default
    RESULT = {o_AGEage,o_AGE_GROUP65 years old or older,o_AGE_GROUP_SORT5} 
}   
  return RESULT;
';
CREATE OR REPLACE FUNCTION UDF_CONV_BR_TBP_CUSTOMER_AGE_SEGMENTATION_001_COPY1(I_BIRTH_DATE VARCHAR(29), I_REFERENCE_DATE VARCHAR(29))
RETURNS OBJECT
LANGUAGE JAVASCRIPT
AS '  
  var RESULT = {o_AGE_GROUPyounger than 18,o_AGE_GROUP_SORT1}  
  return RESULT;
';
CREATE OR REPLACE FUNCTION UDF_CONV_BR_UNIVERIS_CLIENTS_AGE_SEGMENTATION_008(I_CLIENTDATEOFBIRTH VARCHAR(29), I_ASOFDATE VARCHAR(29), I_CORP_CD VARCHAR(16777216))
RETURNS OBJECT
LANGUAGE JAVASCRIPT
AS '
  
  if ((I_CORP_CD  == null  I_CORP_CD  != ''C'') && I_CLIENTDATEOFBIRTH == null)
   {
    return {o_AGE_SEGMENTUnknown,o_AGE_SEGMENT_ORD8};
    }
  if (I_CORP_CD == ''C'')
  {
    return {o_AGE_SEGMENT''Corporate'',o_AGE_SEGMENT_ORD9};
  }
  var RESULT = {o_AGE_SEGMENTUnknown,o_AGE_SEGMENT_ORD6}
  var d1 = new Date(I_CLIENTDATEOFBIRTH);   
  var d2 = new Date(I_ASOFDATE);  
  var diff = d2.getTime() - d1.getTime();
  var year_diff = Math.floor((diff  (1000  60  60  24))365.25);    
  
 switch(true) {
    case year_diff  25 
    RESULT = {o_AGE_SEGMENTUnder 25,o_AGE_SEGMENT_ORD1}
    break;
  case year_diff = 25 && year_diff  35
    RESULT = {o_AGE_SEGMENT25-34,o_AGE_SEGMENT_ORD2}
    break;  
   case year_diff = 35 && year_diff  45
    RESULT = {o_AGE_SEGMENT35-44,o_AGE_SEGMENT_ORD3}
    break;    
  case year_diff = 45 && year_diff  55
    RESULT = {o_AGE_SEGMENT45-54,o_AGE_SEGMENT_ORD4}
    break;  
   case year_diff = 55 && year_diff  65
    RESULT = {o_AGE_SEGMENT55-64,o_AGE_SEGMENT_ORD5}
    break; 
   case year_diff = 65 && year_diff  75
    RESULT = {o_AGE_SEGMENT65-74,o_AGE_SEGMENT_ORD6}
    break; 
   case year_diff = 75
    RESULT = {o_AGE_SEGMENTOver 75,o_AGE_SEGMENT_ORD7}
    break;    
  default
    RESULT = {o_AGE_SEGMENTUnknown,o_AGE_SEGMENT_ORD8}
}   
  return RESULT;
';
CREATE OR REPLACE FUNCTION UDF_CONV_BR_UNIVERIS_CLIENTS_INCOME_SEGMENTATION_006(I_SALARY_DESC VARCHAR(100))
RETURNS OBJECT
LANGUAGE JAVASCRIPT
AS '    
  var RESULT = {}
 switch(true) {
    case I_SALARY_DESC === Less or Equal to $30,000 
    RESULT = {o_INCOME_SEGMENT($30k),o_INCOME_SEGMENT_ORD1}
    break;
  case I_SALARY_DESC === $30,001 to $50,000
    RESULT = {o_INCOME_SEGMENT$30k - $50k,o_INCOME_SEGMENT_ORD2}
    break;  
   case I_SALARY_DESC === $50,001 to $70,000
   RESULT = {o_INCOME_SEGMENT$50k - $70k,o_INCOME_SEGMENT_ORD3}
    break;    
   case I_SALARY_DESC === $70,001 to $100,000
    RESULT = {o_INCOME_SEGMENT$70k - $100k,o_INCOME_SEGMENT_ORD4}
    break;  
    case I_SALARY_DESC === $100,001 to $200,000
    RESULT = {o_INCOME_SEGMENT$100k - $200k,o_INCOME_SEGMENT_ORD5}
    break; 
   case I_SALARY_DESC === $200,001 to 300,000
   RESULT = {o_INCOME_SEGMENT$200k - $300k,o_INCOME_SEGMENT_ORD6}
    break; 
   case I_SALARY_DESC === Greater or Equal to $300,001  I_SALARY_DESC === More or Equal to $300,001
    RESULT = {o_INCOME_SEGMENT$300k+,o_INCOME_SEGMENT_ORD7}
    break;    
  default
    RESULT = {o_INCOME_SEGMENTUnknown,o_INCOME_SEGMENT_ORD8}
}   
  return RESULT;
';
CREATE OR REPLACE FUNCTION UDF_CONV_BR_UNIVERIS_CLIENTS_SALARY_SEGMENTATION_007(I_SALARY_DESC VARCHAR(100))
RETURNS OBJECT
LANGUAGE JAVASCRIPT
AS '
  
  var RESULT = {}
 switch(true) {
    case I_SALARY_DESC === Less or Equal to $30,000 
    RESULT = {o_SALARY_SEGMENTLower,o_SALARY_SEGMENT_ORD1}
    break;
  case I_SALARY_DESC === $30,001 to $50,000  I_SALARY_DESC === $50,001 to $70,000
    RESULT = {o_SALARY_SEGMENTMiddle,o_SALARY_SEGMENT_ORD2};
    break;
   case I_SALARY_DESC === $70,001 to $100,000   I_SALARY_DESC === $100,001 to $200,000
    RESULT = {o_SALARY_SEGMENTUpper,o_SALARY_SEGMENT_ORD3}
    break;  
    case I_SALARY_DESC === $200,001 to 300,000  I_SALARY_DESC === Greater or Equal to $300,001  I_SALARY_DESC === More or Equal to $300,001
   RESULT = {o_SALARY_SEGMENTHigh,o_SALARY_SEGMENT_ORD4}
    break; 
   default
    RESULT = {o_SALARY_SEGMENTUnknown,o_SALARY_SEGMENT_ORD5}
}   
  return RESULT;
';

CREATE OR REPLACE PROCEDURE BR_ALL_ADVISOR_AUA_SEGMENTATION_002(I_ADVISOR_SUM_AUA FLOAT)
RETURNS VARIANT
LANGUAGE JAVASCRIPT
EXECUTE AS OWNER
AS ' 
 var RESULT = {o_AGE_SEGMENTUnknown,o_AGE_SEGMENT_ORD0};  
    
  switch(true) {
  case I_ADVISOR_SUM_AUA == 0 
    RESULT = {o_AGE_SEGMENT0,o_AGE_SEGMENT_ORD-1}
    break;
  case I_ADVISOR_SUM_AUA = 1000000 
    RESULT = {o_AGE_SEGMENT= 1M,o_AGE_SEGMENT_ORD1}
    break;
  case I_ADVISOR_SUM_AUA  parseFloat(1000000) && I_ADVISOR_SUM_AUA = parseFloat(5000000)
    RESULT = {o_AGE_SEGMENT1M-5M,o_AGE_SEGMENT_ORD2}
    break;  
  case I_ADVISOR_SUM_AUA  5000000 && I_ADVISOR_SUM_AUA = 10000000
    RESULT = {o_AGE_SEGMENT5M-10M,o_AGE_SEGMENT_ORD3}
    break; 
   case I_ADVISOR_SUM_AUA  10000000 && I_ADVISOR_SUM_AUA = 20000000
    RESULT = {o_AGE_SEGMENT10M-20M,o_AGE_SEGMENT_ORD4}
    break;  
   case I_ADVISOR_SUM_AUA  20000000 && I_ADVISOR_SUM_AUA = 30000000
    RESULT = {o_AGE_SEGMENT20M-30M,o_AGE_SEGMENT_ORD5}
    break;    
   case I_ADVISOR_SUM_AUA  30000000 && I_ADVISOR_SUM_AUA = 50000000
    RESULT = {o_AGE_SEGMENT30M-50M,o_AGE_SEGMENT_ORD6}
    break; 
    case I_ADVISOR_SUM_AUA  50000000 
    RESULT = {o_AGE_SEGMENT 50M,o_AGE_SEGMENT_ORD7}
    break;  
  default
    RESULT = {o_AGE_SEGMENTUnknown,o_AGE_SEGMENT_ORD0}
}   
 
  return RESULT;
';
CREATE OR REPLACE PROCEDURE BR_UNIVERIS_CLIENTS_INCOME_SEGMENTATION_006(I_SALARY_DESC VARCHAR(100))
RETURNS VARIANT
LANGUAGE JAVASCRIPT
EXECUTE AS OWNER
AS '
  
  
  var RESULT = {}
 switch(true) {
    case I_SALARY_DESC === Less or Equal to $30,000 
    RESULT = {o_IncomeSegmentation($30k),o_IncomeSegmentation_Ord1}
    break;
  case I_SALARY_DESC === $30,001 to $50,000
    RESULT = {o_IncomeSegmentation$30k - $50k,o_IncomeSegmentation_Ord2}
    break;  
   case I_SALARY_DESC === $50,001 to $70,000
   RESULT = {o_IncomeSegmentation$50k - $70k,o_IncomeSegmentation_Ord3}
    break;    
   case I_SALARY_DESC === $70,001 to $100,000
    RESULT = {o_IncomeSegmentation$70k - $100k,o_IncomeSegmentation_Ord4}
    break;  
    case I_SALARY_DESC === $100,001 to $200,000
    RESULT = {o_IncomeSegmentation$100k - $200k,o_IncomeSegmentation_Ord5}
    break; 
   case I_SALARY_DESC === $200,001 to 300,000
   RESULT = {o_IncomeSegmentation$200k - $300k,o_IncomeSegmentation_Ord6}
    break; 
   case I_SALARY_DESC === Greater or Equal to $300,001  I_SALARY_DESC === More or Equal to $300,001
    RESULT = {o_IncomeSegmentation$300k+,o_IncomeSegmentation_Ord7}
    break;    
  default
    RESULT = {o_AGE_SEGMENTUnknown,o_AGE_SEGMENT_ORD8}
}   
  return RESULT;
';
CREATE OR REPLACE PROCEDURE SP_CONV_BR_ALL_ACCOUNT_AUA_SEGMENTATION_001(I_ACCOUNT_SUM_AUA FLOAT)
RETURNS VARIANT
LANGUAGE JAVASCRIPT
EXECUTE AS OWNER
AS '  
  
  var RESULT = {}
 switch(true) {
   case I_ACCOUNT_SUM_AUA == 0 
    RESULT = {o_ACCOUNT_AUA_SEGMENT0,o_ACCOUNT_AUA_SEGMENT_ORDER-1}
    break; 
    case I_ACCOUNT_SUM_AUA  1000000 
    RESULT = {o_ACCOUNT_AUA_SEGMENT= 1M,o_ACCOUNT_AUA_SEGMENT_ORDER1}
    break;
  case I_ACCOUNT_SUM_AUA =1000000  && I_ACCOUNT_SUM_AUA = 5000000 
    RESULT = {o_ACCOUNT_AUA_SEGMENT1M-5M,o_ACCOUNT_AUA_SEGMENT_ORDER2}
    break;  
   case I_ACCOUNT_SUM_AUA =5000000  && I_ACCOUNT_SUM_AUA = 10000000 
    RESULT = {o_ACCOUNT_AUA_SEGMENT5M-10M,o_ACCOUNT_AUA_SEGMENT_ORDER3}
    break;   
   case I_ACCOUNT_SUM_AUA =10000000  && I_ACCOUNT_SUM_AUA = 20000000 
    RESULT = {o_ACCOUNT_AUA_SEGMENT10M-20M,o_ACCOUNT_AUA_SEGMENT_ORDER4}
    break;   
   break;   
   case I_ACCOUNT_SUM_AUA =20000000  && I_ACCOUNT_SUM_AUA = 30000000 
    RESULT = {o_ACCOUNT_AUA_SEGMENT20M-30M,o_ACCOUNT_AUA_SEGMENT_ORDER5}
    break;      
  case I_ACCOUNT_SUM_AUA =30000000  && I_ACCOUNT_SUM_AUA = 50000000 
    RESULT = {o_ACCOUNT_AUA_SEGMENT30M-50M,o_ACCOUNT_AUA_SEGMENT_ORDER6}
    break; 
    case  I_ACCOUNT_SUM_AUA  50000000
     RESULT = {o_ACCOUNT_AUA_SEGMENT 50M,o_ACCOUNT_AUA_SEGMENT_ORDER7}
    break; 
   
  default
     RESULT = {o_ACCOUNT_AUA_SEGMENTUnknown,o_ACCOUNT_AUA_SEGMENT_ORDER0}
}   
  return RESULT;
';
CREATE OR REPLACE FUNCTION SP_CONV_BR_ALL_ACCOUNT_AUA_SEGMENTATION_002(I_ACCOUNT_SUM_AUA FLOAT)
RETURNS OBJECT
LANGUAGE JAVASCRIPT
AS '  
  
  var RESULT = {}
 switch(true) {
   case I_ACCOUNT_SUM_AUA == 0 
    RESULT = {o_ACCOUNT_AUA_SEGMENT0,o_ACCOUNT_AUA_SEGMENT_ORDER-1}
    break; 
    case I_ACCOUNT_SUM_AUA = 1000000 
    RESULT = {o_ACCOUNT_AUA_SEGMENT = 1M ,o_ACCOUNT_AUA_SEGMENT_ORDER1}
    break;
  case I_ACCOUNT_SUM_AUA  1000000  && I_ACCOUNT_SUM_AUA = 5000000 
    RESULT = {o_ACCOUNT_AUA_SEGMENT1M-5M,o_ACCOUNT_AUA_SEGMENT_ORDER2}
    break;  
   case I_ACCOUNT_SUM_AUA  5000000  && I_ACCOUNT_SUM_AUA = 10000000 
    RESULT = {o_ACCOUNT_AUA_SEGMENT5M-10M,o_ACCOUNT_AUA_SEGMENT_ORDER3}
    break;   
   case I_ACCOUNT_SUM_AUA  10000000  && I_ACCOUNT_SUM_AUA = 20000000 
    RESULT = {o_ACCOUNT_AUA_SEGMENT10M-20M,o_ACCOUNT_AUA_SEGMENT_ORDER4}
    break;   
   break;   
   case I_ACCOUNT_SUM_AUA  20000000  && I_ACCOUNT_SUM_AUA = 30000000 
    RESULT = {o_ACCOUNT_AUA_SEGMENT20M-30M,o_ACCOUNT_AUA_SEGMENT_ORDER5}
    break;      
  case I_ACCOUNT_SUM_AUA  30000000  && I_ACCOUNT_SUM_AUA = 50000000 
    RESULT = {o_ACCOUNT_AUA_SEGMENT30M-50M,o_ACCOUNT_AUA_SEGMENT_ORDER6}
    break; 
    case  I_ACCOUNT_SUM_AUA  50000000 
     RESULT = {o_ACCOUNT_AUA_SEGMENT 50M,o_ACCOUNT_AUA_SEGMENT_ORDER7}
    break; 
   
  default
     RESULT = {o_ACCOUNT_AUA_SEGMENTUnknown,o_ACCOUNT_AUA_SEGMENT_ORDER0}
}   
  return RESULT;
';
CREATE OR REPLACE PROCEDURE SP_CONV_BR_ALL_ADVISOR_001(I_ADVISORSTARTDATE VARCHAR(29), I_LOADDATE VARCHAR(29))
RETURNS VARCHAR(1)
LANGUAGE JAVASCRIPT
EXECUTE AS OWNER
AS ' 
  var d2 = new Date(I_LOADDATE);   
  var d1 = new Date(I_ADVISORSTARTDATE);  
  var diff = d2.getTime() - d1.getTime();
  var year_diff = Math.floor(diff  (1000  60  60  24));  
  return year_diff = 365  ''1'' ''0'';    
';
CREATE OR REPLACE PROCEDURE SP_CONV_BR_ALL_ADVISOR_003(I_ADVISORDATEOFBIRTH VARCHAR(29), I_ASOFDATE VARCHAR(29), I_ISCORPORATION BOOLEAN)
RETURNS VARIANT
LANGUAGE JAVASCRIPT
EXECUTE AS OWNER
AS '
 
  var RESULT = {o_AGE_SEGMENTUnknown,o_AGE_SEGMENT_ORD6}
  var d1 = new Date(I_ADVISORDATEOFBIRTH);   
  var d2 = new Date(I_ASOFDATE);  
  var diff = d2.getTime() - d1.getTime();
  var year_diff = Math.floor((diff  (1000  60  60  24))365.25);    
  if (I_ISCORPORATION )
   {
    return {o_AGE_SEGMENTCorporate,o_AGE_SEGMENT_ORD8} 
   }
 switch(true) {
  case year_diff  0 
    RESULT = {o_AGE_SEGMENTUnknown,o_AGE_SEGMENT_ORD7}
    break;
  case year_diff  25 
    RESULT = {o_AGE_SEGMENTUnder 25,o_AGE_SEGMENT_ORD1}
    break;
  case year_diff = 25 && year_diff  45
    RESULT = {o_AGE_SEGMENT25-44,o_AGE_SEGMENT_ORD2}
    break;  
  case year_diff = 45 && year_diff  55
    RESULT = {o_AGE_SEGMENT45-54,o_AGE_SEGMENT_ORD3}
    break;  
   case year_diff = 55 && year_diff  61
    RESULT = {o_AGE_SEGMENT55-60,o_AGE_SEGMENT_ORD4}
    break;   
   case year_diff = 61
    RESULT = {o_AGE_SEGMENTOver 60,o_AGE_SEGMENT_ORD5}
    break;    
  default
    RESULT = {o_AGE_SEGMENTUnknown,o_AGE_SEGMENT_ORD6}
}   
  return RESULT;
';
CREATE OR REPLACE PROCEDURE SP_CONV_BR_ALL_ADVISOR_003(I_ADVISOR_SUM_AUA FLOAT)
RETURNS VARIANT
LANGUAGE JAVASCRIPT
EXECUTE AS OWNER
AS ' 
 var RESULT = {o_AGE_SEGMENTUnknown,o_AGE_SEGMENT_ORD0};  
    
  switch(true) {
  case I_ADVISOR_SUM_AUA == 0 
    RESULT = {o_AGE_SEGMENT0,o_AGE_SEGMENT_ORD-1}
    break;
  case I_ADVISOR_SUM_AUA = 1000000 
    RESULT = {o_AGE_SEGMENT= 1M,o_AGE_SEGMENT_ORD1}
    break;
  case I_ADVISOR_SUM_AUA  parseFloat(1000000) && I_ADVISOR_SUM_AUA = parseFloat(5000000)
    RESULT = {o_AGE_SEGMENT1M-5M,o_AGE_SEGMENT_ORD2}
    break;  
  case I_ADVISOR_SUM_AUA  5000000 && I_ADVISOR_SUM_AUA = 10000000
    RESULT = {o_AGE_SEGMENT5M-10M,o_AGE_SEGMENT_ORD3}
    break; 
   case I_ADVISOR_SUM_AUA  10000000 && I_ADVISOR_SUM_AUA = 20000000
    RESULT = {o_AGE_SEGMENT10M-20M,o_AGE_SEGMENT_ORD4}
    break;  
   case I_ADVISOR_SUM_AUA  20000000 && I_ADVISOR_SUM_AUA = 30000000
    RESULT = {o_AGE_SEGMENT20M-30M,o_AGE_SEGMENT_ORD5}
    break;    
   case I_ADVISOR_SUM_AUA  30000000 && I_ADVISOR_SUM_AUA = 50000000
    RESULT = {o_AGE_SEGMENT30M-50M,o_AGE_SEGMENT_ORD6}
    break; 
    case I_ADVISOR_SUM_AUA  50000000 
    RESULT = {o_AGE_SEGMENT 50M,o_AGE_SEGMENT_ORD7}
    break;  
  default
    RESULT = {o_AGE_SEGMENTUnknown,o_AGE_SEGMENT_ORD0}
}   
 
  return RESULT;
';
CREATE OR REPLACE PROCEDURE SP_CONV_BR_ALL_ADVISOR_003(I_ADVISOR_SUM_AUA VARCHAR(16777216))
RETURNS VARIANT
LANGUAGE JAVASCRIPT
EXECUTE AS OWNER
AS ' 
 var RESULT = {o_AGE_SEGMENTUnknown,o_AGE_SEGMENT_ORD0};
   switch(true) {
  case I_ADVISOR_SUM_AUA = 0 
    RESULT = {o_AGE_SEGMENT0,o_AGE_SEGMENT_ORD-1}
    break;
  case I_ADVISOR_SUM_AUA = 1000000 
    RESULT = {o_AGE_SEGMENT= 1M,o_AGE_SEGMENT_ORD1}
    break;
  case I_ADVISOR_SUM_AUA  1000000 && I_ADVISOR_SUM_AUA = 5000000
    RESULT = {o_AGE_SEGMENT1M-5M,o_AGE_SEGMENT_ORD2}
    break;  
  case I_ADVISOR_SUM_AUA  5000000 && I_ADVISOR_SUM_AUA = 10000000
    RESULT = {o_AGE_SEGMENT5M-10M,o_AGE_SEGMENT_ORD3}
    break; 
   case I_ADVISOR_SUM_AUA  10000000 && I_ADVISOR_SUM_AUA = 20000000
    RESULT = {o_AGE_SEGMENT10M-20M,o_AGE_SEGMENT_ORD4}
    break;  
   case I_ADVISOR_SUM_AUA  20000000 && I_ADVISOR_SUM_AUA = 30000000
    RESULT = {o_AGE_SEGMENT20M-30M,o_AGE_SEGMENT_ORD5}
    break;    
   case I_ADVISOR_SUM_AUA  30000000 && I_ADVISOR_SUM_AUA = 50000000
    RESULT = {o_AGE_SEGMENT30M-50M,o_AGE_SEGMENT_ORD6}
    break; 
    case I_ADVISOR_SUM_AUA  50000000 
    RESULT = {o_AGE_SEGMENT 50M,o_AGE_SEGMENT_ORD7}
    break;  
  default
    RESULT = {o_AGE_SEGMENTUnknown,o_AGE_SEGMENT_ORD0}
}   
 
  return RESULT;
';
CREATE OR REPLACE PROCEDURE SP_CONV_BR_ALL_ADVISOR_AUA_SEGMENTATION_002(I_ADVISOR_SUM_AUA FLOAT)
RETURNS VARIANT
LANGUAGE JAVASCRIPT
EXECUTE AS OWNER
AS ' 
 var RESULT = {o_AGE_SEGMENTUnknown,o_AGE_SEGMENT_ORD0};  
    
  switch(true) {
  case I_ADVISOR_SUM_AUA == 0 
    RESULT = {o_AGE_SEGMENT0,o_AGE_SEGMENT_ORD-1}
    break;
  case I_ADVISOR_SUM_AUA = 1000000 
    RESULT = {o_AGE_SEGMENT= 1M,o_AGE_SEGMENT_ORD1}
    break;
  case I_ADVISOR_SUM_AUA  parseFloat(1000000) && I_ADVISOR_SUM_AUA = parseFloat(5000000)
    RESULT = {o_AGE_SEGMENT1M-5M,o_AGE_SEGMENT_ORD2}
    break;  
  case I_ADVISOR_SUM_AUA  5000000 && I_ADVISOR_SUM_AUA = 10000000
    RESULT = {o_AGE_SEGMENT5M-10M,o_AGE_SEGMENT_ORD3}
    break; 
   case I_ADVISOR_SUM_AUA  10000000 && I_ADVISOR_SUM_AUA = 20000000
    RESULT = {o_AGE_SEGMENT10M-20M,o_AGE_SEGMENT_ORD4}
    break;  
   case I_ADVISOR_SUM_AUA  20000000 && I_ADVISOR_SUM_AUA = 30000000
    RESULT = {o_AGE_SEGMENT20M-30M,o_AGE_SEGMENT_ORD5}
    break;    
   case I_ADVISOR_SUM_AUA  30000000 && I_ADVISOR_SUM_AUA = 50000000
    RESULT = {o_AGE_SEGMENT30M-50M,o_AGE_SEGMENT_ORD6}
    break; 
    case I_ADVISOR_SUM_AUA  50000000 
    RESULT = {o_AGE_SEGMENT 50M,o_AGE_SEGMENT_ORD7}
    break;  
  default
    RESULT = {o_AGE_SEGMENTUnknown,o_AGE_SEGMENT_ORD0}
}   
 
  return RESULT;
';
CREATE OR REPLACE PROCEDURE SP_CONV_BR_ALL_CLIENTS_001(I_CLIENT_INCOME FLOAT)
RETURNS VARIANT
LANGUAGE JAVASCRIPT
EXECUTE AS OWNER
AS '
  
 var  RESULT = null;
 switch(true) {
    case I_CLIENT_INCOME == -1 
    RESULT = {o_INCOME_LEVEL_2_SEGMENTUnknown,o_INCOME_LEVEL_2_SEGMENT_ORD8}
    break;
  case I_CLIENT_INCOME = 30
    RESULT = {o_INCOME_LEVEL_2_SEGMENT''(=$30k)'',o_INCOME_LEVEL_2_SEGMENT_ORD1}
    break;  
   case I_CLIENT_INCOME  30  && I_CLIENT_INCOME = 50
    RESULT = {o_INCOME_LEVEL_2_SEGMENT$30k - $50k,o_INCOME_LEVEL_2_SEGMENT_ORD2}
    break;  
  case I_CLIENT_INCOME  50  && I_CLIENT_INCOME = 70
    RESULT = {o_INCOME_LEVEL_2_SEGMENT$50k - $70k,o_INCOME_LEVEL_2_SEGMENT_ORD3}
    break; 
   case I_CLIENT_INCOME  70  && I_CLIENT_INCOME = 100
    RESULT = {o_INCOME_LEVEL_2_SEGMENT$70k - $100k,o_INCOME_LEVEL_2_SEGMENT_ORD4}
    break;   
    case I_CLIENT_INCOME  100  && I_CLIENT_INCOME = 200
    RESULT = {o_INCOME_LEVEL_2_SEGMENT$70k - $100k,o_INCOME_LEVEL_2_SEGMENT_ORD5}
    break; 
    case I_CLIENT_INCOME  200  && I_CLIENT_INCOME = 300
    RESULT = {o_INCOME_LEVEL_2_SEGMENT$200k - $300k,o_INCOME_LEVEL_2_SEGMENT_ORD6}
    break;    
   case I_CLIENT_INCOME  300
    RESULT = {o_INCOME_LEVEL_2_SEGMENT$200k - $300k,o_INCOME_LEVEL_2_SEGMENT_ORD7}
    break; 
  default
    RESULT = {o_INCOME_LEVEL_2_SEGMENTUnknown,o_INCOME_LEVEL_2_SEGMENT_ORD8}
}   
  return RESULT;
';
CREATE OR REPLACE PROCEDURE SP_CONV_BR_ALL_CLIENTS_002(I_CLIENT_INCOME FLOAT)
RETURNS VARIANT
LANGUAGE JAVASCRIPT
EXECUTE AS OWNER
AS '
  
 var  RESULT = null;
 switch(true) {
    case I_CLIENT_INCOME == -1 
    RESULT = {o_INCOME_LEVEL_1_SEGMENTUnknown,o_INCOME_LEVEL_1_SEGMENT_ORD5}
    break;
  case I_CLIENT_INCOME = 30
    RESULT = {o_INCOME_LEVEL_1_SEGMENTLower,o_INCOME_LEVEL_1_SEGMENT_ORD1}
    break;  
   case I_CLIENT_INCOME  30  && I_CLIENT_INCOME = 70
    RESULT = {o_INCOME_LEVEL_1_SEGMENTMiddle,o_INCOME_LEVEL_1_SEGMENT_ORD2}
    break;    
  case I_CLIENT_INCOME  70  && I_CLIENT_INCOME = 200
    RESULT = {o_INCOME_LEVEL_1_SEGMENTUpper,o_INCOME_LEVEL_1_SEGMENT_ORD3}
    break;  
   case I_CLIENT_INCOME  200
    RESULT = {o_INCOME_LEVEL_1_SEGMENTHigh,o_INCOME_LEVEL_1_SEGMENT_ORD4}
    break; 
  default
    RESULT = {o_INCOME_LEVEL_1_SEGMENTUnknown,o_INCOME_LEVEL_1_SEGMENT_ORD5}
}   
  return RESULT;
';
CREATE OR REPLACE PROCEDURE SP_CONV_BR_ALL_CLIENTS_003(I_CLIENTDATEOFBIRTH VARCHAR(29), I_ASOFDATE VARCHAR(29), I_IS_CORPORATION BOOLEAN)
RETURNS VARIANT
LANGUAGE JAVASCRIPT
EXECUTE AS OWNER
AS '
  
  if (I_IS_CORPORATION  == null  && I_CLIENTDATEOFBIRTH == null)
   {
    return {o_AGE_SEGMENTUnknown,o_AGE_SEGMENT_ORD8};
    }
  if (I_IS_CORPORATION)
  {
    return {o_AGE_SEGMENT''Corporate'',o_AGE_SEGMENT_ORD9};
  }
  var RESULT = {};
  var d1 = new Date(I_CLIENTDATEOFBIRTH);   
  var d2 = new Date(I_ASOFDATE);  
  var diff = d2.getTime() - d1.getTime();
  var year_diff = Math.floor((diff  (1000  60  60  24))365.25);    
  
 switch(true) {
    case year_diff  25 
    RESULT = {o_AGE_SEGMENTUnder 25,o_AGE_SEGMENT_ORD1}
    break;
  case year_diff = 25 && year_diff  35
    RESULT = {o_AGE_SEGMENT25-34,o_AGE_SEGMENT_ORD2}
    break;  
   case year_diff = 35 && year_diff  45
    RESULT = {o_AGE_SEGMENT35-44,o_AGE_SEGMENT_ORD3}
    break;    
  case year_diff = 45 && year_diff  55
    RESULT = {o_AGE_SEGMENT45-54,o_AGE_SEGMENT_ORD4}
    break;  
   case year_diff = 55 && year_diff  65
    RESULT = {o_AGE_SEGMENT55-64,o_AGE_SEGMENT_ORD5}
    break; 
   case year_diff = 65 && year_diff  75
    RESULT = {o_AGE_SEGMENT65-74,o_AGE_SEGMENT_ORD6}
    break; 
   case year_diff = 75
    RESULT = {o_AGE_SEGMENTOver 75,o_AGE_SEGMENT_ORD7}
    break;    
  default
    RESULT = {o_AGE_SEGMENTUnknown,o_AGE_SEGMENT_ORD8}
}   
  return RESULT;
';
CREATE OR REPLACE PROCEDURE SP_CONV_BR_ALL_CLIENTS_PROVINCE_005(I_COUNTRY_CODE VARCHAR(10), I_PROVINCE_CODE VARCHAR(10))
RETURNS VARCHAR(16777216)
LANGUAGE JAVASCRIPT
EXECUTE AS OWNER
AS '  
  
  var RESULT = {}
  if (I_COUNTRY_CODE  != CAN && I_PROVINCE_CODE != null )
  {
   return ''Outside Canada'';
  }
 switch(true) {
    case I_PROVINCE_CODE == SK 
    RESULT =  Saskatchewan;
    break;
    case I_PROVINCE_CODE == MB 
    RESULT =  Manitoba;
    break;
    case I_PROVINCE_CODE == NS 
    RESULT =  Nova Scotia;
    break;
    case I_PROVINCE_CODE == NL 
    RESULT =  Newfoundland and Labrador;
    break;
    case I_PROVINCE_CODE == PE 
    RESULT =  Prince Edward Island;
    break;
    case I_PROVINCE_CODE == QC 
    RESULT =  Quebec;
    break;
    case I_PROVINCE_CODE == ON 
    RESULT =  Ontario;
    break;
    case I_PROVINCE_CODE == BC 
    RESULT =  British Columbia;
    break;
    case I_PROVINCE_CODE == NB 
    RESULT =  New Brunswick;
    break;
    case I_PROVINCE_CODE == AB 
    RESULT =  Alberta;
    break;
    case I_PROVINCE_CODE == NT 
    RESULT =  Northwest Territories;
    break;
    case I_PROVINCE_CODE == YT 
    RESULT =  Yukon;
    break;
    case I_PROVINCE_CODE == NU 
    RESULT =  Nunavut; 
    break;
  default
    RESULT = Unknown
}   
  return RESULT;
';
CREATE OR REPLACE PROCEDURE SP_CONV_BR_ALL_CLIENT_AUA_SEGMENTATION_002(I_CLIENT_SUM_AUA FLOAT)
RETURNS VARIANT
LANGUAGE JAVASCRIPT
EXECUTE AS OWNER
AS '  
  
  var RESULT = {}
 switch(true) {
    case I_CLIENT_SUM_AUA  25000 
    RESULT = {o_CLIENT_AUA_SEGMENT25k,o_CLIENT_AUA_SEGMENT_ORDER1}
    break;
  case I_CLIENT_SUM_AUA =25000 &&  I_CLIENT_SUM_AUA = 100000 
    RESULT = {o_CLIENT_AUA_SEGMENT25k-100k,o_CLIENT_AUA_SEGMENT_ORDER2}
    break;  
   case I_CLIENT_SUM_AUA =100000 &&  I_CLIENT_SUM_AUA = 250000
   RESULT = {o_CLIENT_AUA_SEGMENT100k-250k,o_CLIENT_AUA_SEGMENT_ORDER3}
    break;    
   case I_CLIENT_SUM_AUA =250000 &&  I_CLIENT_SUM_AUA = 500000 
    RESULT = {o_CLIENT_AUA_SEGMENT250k-500k,o_CLIENT_AUA_SEGMENT_ORDER4}
    break;  
    case I_CLIENT_SUM_AUA  500000
    RESULT = {o_CLIENT_AUA_SEGMENT 500k,o_CLIENT_AUA_SEGMENT_ORDER5}
    break; 
   
  default
    RESULT = {o_CLIENT_AUA_SEGMENTUnknown,o_CLIENT_AUA_SEGMENT_ORDER6}
}   
  return RESULT;
';
CREATE OR REPLACE PROCEDURE SP_CONV_BR_UNIVERIS_CLIENTS_AGE_SEGMENTATION_008(I_CLIENTDATEOFBIRTH VARCHAR(29), I_ASOFDATE VARCHAR(29), I_CORP_CD VARCHAR(16777216))
RETURNS VARIANT
LANGUAGE JAVASCRIPT
EXECUTE AS OWNER
AS '
  
  if ((I_CORP_CD  == null  I_CORP_CD  != ''C'') && I_CLIENTDATEOFBIRTH == null)
   {
    return {o_AGE_SEGMENTUnknown,o_AGE_SEGMENT_ORD8};
    }
  if (I_CORP_CD == ''C'')
  {
    return {o_AGE_SEGMENT''Corporate'',o_AGE_SEGMENT_ORD9};
  }
  var RESULT = {o_AGE_SEGMENTUnknown,o_AGE_SEGMENT_ORD6}
  var d1 = new Date(I_CLIENTDATEOFBIRTH);   
  var d2 = new Date(I_ASOFDATE);  
  var diff = d2.getTime() - d1.getTime();
  var year_diff = Math.floor((diff  (1000  60  60  24))365.25);    
  
 switch(true) {
    case year_diff  25 
    RESULT = {o_AGE_SEGMENTUnder 25,o_AGE_SEGMENT_ORD1}
    break;
  case year_diff = 25 && year_diff  35
    RESULT = {o_AGE_SEGMENT25-34,o_AGE_SEGMENT_ORD2}
    break;  
   case year_diff = 35 && year_diff  45
    RESULT = {o_AGE_SEGMENT35-44,o_AGE_SEGMENT_ORD3}
    break;    
  case year_diff = 45 && year_diff  55
    RESULT = {o_AGE_SEGMENT45-54,o_AGE_SEGMENT_ORD4}
    break;  
   case year_diff = 55 && year_diff  65
    RESULT = {o_AGE_SEGMENT55-64,o_AGE_SEGMENT_ORD5}
    break; 
   case year_diff = 65 && year_diff  75
    RESULT = {o_AGE_SEGMENT65-74,o_AGE_SEGMENT_ORD6}
    break; 
   case year_diff = 75
    RESULT = {o_AGE_SEGMENTOver 75,o_AGE_SEGMENT_ORD7}
    break;    
  default
    RESULT = {o_AGE_SEGMENTUnknown,o_AGE_SEGMENT_ORD8}
}   
  return RESULT;
';
CREATE OR REPLACE PROCEDURE SP_CONV_BR_UNIVERIS_CLIENTS_INCOME_SEGMENTATION_006(I_SALARY_DESC VARCHAR(100))
RETURNS VARIANT
LANGUAGE JAVASCRIPT
EXECUTE AS OWNER
AS '
  
  
  var RESULT = {}
 switch(true) {
    case I_SALARY_DESC === Less or Equal to $30,000 
    RESULT = {o_IncomeSegmentation($30k),o_IncomeSegmentation_Ord1}
    break;
  case I_SALARY_DESC === $30,001 to $50,000
    RESULT = {o_IncomeSegmentation$30k - $50k,o_IncomeSegmentation_Ord2}
    break;  
   case I_SALARY_DESC === $50,001 to $70,000
   RESULT = {o_IncomeSegmentation$50k - $70k,o_IncomeSegmentation_Ord3}
    break;    
   case I_SALARY_DESC === $70,001 to $100,000
    RESULT = {o_IncomeSegmentation$70k - $100k,o_IncomeSegmentation_Ord4}
    break;  
    case I_SALARY_DESC === $100,001 to $200,000
    RESULT = {o_IncomeSegmentation$100k - $200k,o_IncomeSegmentation_Ord5}
    break; 
   case I_SALARY_DESC === $200,001 to 300,000
   RESULT = {o_IncomeSegmentation$200k - $300k,o_IncomeSegmentation_Ord6}
    break; 
   case I_SALARY_DESC === Greater or Equal to $300,001  I_SALARY_DESC === More or Equal to $300,001
    RESULT = {o_IncomeSegmentation$300k+,o_IncomeSegmentation_Ord7}
    break;    
  default
    RESULT = {o_AGE_SEGMENTUnknown,o_AGE_SEGMENT_ORD8}
}   
  return RESULT;
';
CREATE OR REPLACE PROCEDURE SP_CONV_BR_UNIVERIS_CLIENTS_SALARY_SEGMENTATION_007(I_SALARY_DESC VARCHAR(100))
RETURNS VARIANT
LANGUAGE JAVASCRIPT
EXECUTE AS OWNER
AS '
  
  
  var RESULT = {}
 switch(true) {
    case I_SALARY_DESC === Less or Equal to $30,000 
    RESULT = {o_SalarySegmentationLower,o_SalarySegmentation_Ord1}
    break;
  case I_SALARY_DESC === $30,001 to $50,000  I_SALARY_DESC === $50,001 to $70,000
    RESULT = {o_SalarySegmentationMiddle,o_SalarySegmentation_Ord2};
    break;
   case I_SALARY_DESC === $70,001 to $100,000   I_SALARY_DESC === $100,001 to $200,000
    RESULT = {o_SalarySegmentationUpper,o_SalarySegmentation_Ord3}
    break;  
    case I_SALARY_DESC === $200,001 to 300,000  I_SALARY_DESC === Greater or Equal to $300,001  I_SALARY_DESC === More or Equal to $300,001
   RESULT = {o_SalarySegmentationHigh,o_SalarySegmentation_Ord4}
    break; 
   default
    RESULT = {o_SalarySegmentationUnknown,o_SalarySegmentation_Ord5}
}   
  return RESULT;
';
CREATE OR REPLACE PROCEDURE SP_CONV_MPLT_BR_ALL_CLIENTS_004(I_ASOFDATE VARCHAR(29), I_CLIENT_CONTRACT_START_DATE VARCHAR(29))
RETURNS VARCHAR(16777216)
LANGUAGE JAVASCRIPT
EXECUTE AS OWNER
AS '  
 var  RESULT = ;
 if (I_ASOFDATE == null  I_CLIENT_CONTRACT_START_DATE == null)
 
    return Unknown;
  
    else 
   
   (I_ASOFDATE === I_CLIENT_CONTRACT_START_DATE)RESULT = YesRESULT = No  ;
  
   return RESULT;
';
CREATE OR REPLACE FUNCTION UDF_CONV_BR_ALL_ACCOUNT_AUA_SEGMENTATION_001(I_ACCOUNT_SUM_AUA FLOAT)
RETURNS OBJECT
LANGUAGE JAVASCRIPT
AS '  
  
  var RESULT = {}
 switch(true) {
   case I_ACCOUNT_SUM_AUA == 0 
    RESULT = {o_ACCOUNT_AUA_SEGMENT0,o_ACCOUNT_AUA_SEGMENT_ORDER-1}
    break; 
    case I_ACCOUNT_SUM_AUA == 1000000 
    RESULT = {o_ACCOUNT_AUA_SEGMENT = 1M ,o_ACCOUNT_AUA_SEGMENT_ORDER1}
    break;
  case I_ACCOUNT_SUM_AUA  1000000  && I_ACCOUNT_SUM_AUA = 5000000 
    RESULT = {o_ACCOUNT_AUA_SEGMENT1M-5M,o_ACCOUNT_AUA_SEGMENT_ORDER2}
    break;  
   case I_ACCOUNT_SUM_AUA  5000000  && I_ACCOUNT_SUM_AUA = 10000000 
    RESULT = {o_ACCOUNT_AUA_SEGMENT5M-10M,o_ACCOUNT_AUA_SEGMENT_ORDER3}
    break;   
   case I_ACCOUNT_SUM_AUA  10000000  && I_ACCOUNT_SUM_AUA = 20000000 
    RESULT = {o_ACCOUNT_AUA_SEGMENT10M-20M,o_ACCOUNT_AUA_SEGMENT_ORDER4}
    break;   
   break;   
   case I_ACCOUNT_SUM_AUA  20000000  && I_ACCOUNT_SUM_AUA = 30000000 
    RESULT = {o_ACCOUNT_AUA_SEGMENT20M-30M,o_ACCOUNT_AUA_SEGMENT_ORDER5}
    break;      
  case I_ACCOUNT_SUM_AUA  30000000  && I_ACCOUNT_SUM_AUA = 50000000 
    RESULT = {o_ACCOUNT_AUA_SEGMENT30M-50M,o_ACCOUNT_AUA_SEGMENT_ORDER6}
    break; 
    case  I_ACCOUNT_SUM_AUA  50000000 
     RESULT = {o_ACCOUNT_AUA_SEGMENT 50M,o_ACCOUNT_AUA_SEGMENT_ORDER7}
    break; 
   
  default
     RESULT = {o_ACCOUNT_AUA_SEGMENTUnknown,o_ACCOUNT_AUA_SEGMENT_ORDER0}
}   
  return RESULT;
';

CREATE OR REPLACE PROCEDURE BR_ALL_ADVISOR_AUA_SEGMENTATION_002(I_ADVISOR_SUM_AUA FLOAT)
RETURNS VARIANT
LANGUAGE JAVASCRIPT
EXECUTE AS OWNER
AS ' 
 var RESULT = {o_AGE_SEGMENTUnknown,o_AGE_SEGMENT_ORD0};  
    
  switch(true) {
  case I_ADVISOR_SUM_AUA == 0 
    RESULT = {o_AGE_SEGMENT0,o_AGE_SEGMENT_ORD-1}
    break;
  case I_ADVISOR_SUM_AUA = 1000000 
    RESULT = {o_AGE_SEGMENT= 1M,o_AGE_SEGMENT_ORD1}
    break;
  case I_ADVISOR_SUM_AUA  parseFloat(1000000) && I_ADVISOR_SUM_AUA = parseFloat(5000000)
    RESULT = {o_AGE_SEGMENT1M-5M,o_AGE_SEGMENT_ORD2}
    break;  
  case I_ADVISOR_SUM_AUA  5000000 && I_ADVISOR_SUM_AUA = 10000000
    RESULT = {o_AGE_SEGMENT5M-10M,o_AGE_SEGMENT_ORD3}
    break; 
   case I_ADVISOR_SUM_AUA  10000000 && I_ADVISOR_SUM_AUA = 20000000
    RESULT = {o_AGE_SEGMENT10M-20M,o_AGE_SEGMENT_ORD4}
    break;  
   case I_ADVISOR_SUM_AUA  20000000 && I_ADVISOR_SUM_AUA = 30000000
    RESULT = {o_AGE_SEGMENT20M-30M,o_AGE_SEGMENT_ORD5}
    break;    
   case I_ADVISOR_SUM_AUA  30000000 && I_ADVISOR_SUM_AUA = 50000000
    RESULT = {o_AGE_SEGMENT30M-50M,o_AGE_SEGMENT_ORD6}
    break; 
    case I_ADVISOR_SUM_AUA  50000000 
    RESULT = {o_AGE_SEGMENT 50M,o_AGE_SEGMENT_ORD7}
    break;  
  default
    RESULT = {o_AGE_SEGMENTUnknown,o_AGE_SEGMENT_ORD0}
}   
 
  return RESULT;
';
CREATE OR REPLACE PROCEDURE BR_UNIVERIS_CLIENTS_INCOME_SEGMENTATION_006(I_SALARY_DESC VARCHAR(100))
RETURNS VARIANT
LANGUAGE JAVASCRIPT
EXECUTE AS OWNER
AS '
  
  
  var RESULT = {}
 switch(true) {
    case I_SALARY_DESC === Less or Equal to $30,000 
    RESULT = {o_IncomeSegmentation($30k),o_IncomeSegmentation_Ord1}
    break;
  case I_SALARY_DESC === $30,001 to $50,000
    RESULT = {o_IncomeSegmentation$30k - $50k,o_IncomeSegmentation_Ord2}
    break;  
   case I_SALARY_DESC === $50,001 to $70,000
   RESULT = {o_IncomeSegmentation$50k - $70k,o_IncomeSegmentation_Ord3}
    break;    
   case I_SALARY_DESC === $70,001 to $100,000
    RESULT = {o_IncomeSegmentation$70k - $100k,o_IncomeSegmentation_Ord4}
    break;  
    case I_SALARY_DESC === $100,001 to $200,000
    RESULT = {o_IncomeSegmentation$100k - $200k,o_IncomeSegmentation_Ord5}
    break; 
   case I_SALARY_DESC === $200,001 to 300,000
   RESULT = {o_IncomeSegmentation$200k - $300k,o_IncomeSegmentation_Ord6}
    break; 
   case I_SALARY_DESC === Greater or Equal to $300,001  I_SALARY_DESC === More or Equal to $300,001
    RESULT = {o_IncomeSegmentation$300k+,o_IncomeSegmentation_Ord7}
    break;    
  default
    RESULT = {o_AGE_SEGMENTUnknown,o_AGE_SEGMENT_ORD8}
}   
  return RESULT;
';
CREATE OR REPLACE PROCEDURE SP_CONV_BR_ALL_ACCOUNT_AUA_SEGMENTATION_001(I_ACCOUNT_SUM_AUA FLOAT)
RETURNS VARIANT
LANGUAGE JAVASCRIPT
EXECUTE AS OWNER
AS '  
  
  var RESULT = {}
 switch(true) {
   case I_ACCOUNT_SUM_AUA == 0 
    RESULT = {o_ACCOUNT_AUA_SEGMENT0,o_ACCOUNT_AUA_SEGMENT_ORDER-1}
    break; 
    case I_ACCOUNT_SUM_AUA  1000000 
    RESULT = {o_ACCOUNT_AUA_SEGMENT= 1M,o_ACCOUNT_AUA_SEGMENT_ORDER1}
    break;
  case I_ACCOUNT_SUM_AUA =1000000  && I_ACCOUNT_SUM_AUA = 5000000 
    RESULT = {o_ACCOUNT_AUA_SEGMENT1M-5M,o_ACCOUNT_AUA_SEGMENT_ORDER2}
    break;  
   case I_ACCOUNT_SUM_AUA =5000000  && I_ACCOUNT_SUM_AUA = 10000000 
    RESULT = {o_ACCOUNT_AUA_SEGMENT5M-10M,o_ACCOUNT_AUA_SEGMENT_ORDER3}
    break;   
   case I_ACCOUNT_SUM_AUA =10000000  && I_ACCOUNT_SUM_AUA = 20000000 
    RESULT = {o_ACCOUNT_AUA_SEGMENT10M-20M,o_ACCOUNT_AUA_SEGMENT_ORDER4}
    break;   
   break;   
   case I_ACCOUNT_SUM_AUA =20000000  && I_ACCOUNT_SUM_AUA = 30000000 
    RESULT = {o_ACCOUNT_AUA_SEGMENT20M-30M,o_ACCOUNT_AUA_SEGMENT_ORDER5}
    break;      
  case I_ACCOUNT_SUM_AUA =30000000  && I_ACCOUNT_SUM_AUA = 50000000 
    RESULT = {o_ACCOUNT_AUA_SEGMENT30M-50M,o_ACCOUNT_AUA_SEGMENT_ORDER6}
    break; 
    case  I_ACCOUNT_SUM_AUA  50000000
     RESULT = {o_ACCOUNT_AUA_SEGMENT 50M,o_ACCOUNT_AUA_SEGMENT_ORDER7}
    break; 
   
  default
     RESULT = {o_ACCOUNT_AUA_SEGMENTUnknown,o_ACCOUNT_AUA_SEGMENT_ORDER0}
}   
  return RESULT;
';
CREATE OR REPLACE PROCEDURE SP_CONV_BR_ALL_ADVISOR_001(I_ADVISORSTARTDATE VARCHAR(29), I_LOADDATE VARCHAR(29))
RETURNS VARCHAR(1)
LANGUAGE JAVASCRIPT
EXECUTE AS OWNER
AS ' 
  var d2 = new Date(I_LOADDATE);   
  var d1 = new Date(I_ADVISORSTARTDATE);  
  var diff = d2.getTime() - d1.getTime();
  var year_diff = Math.floor(diff  (1000  60  60  24));  
  return year_diff = 365  ''1'' ''0'';    
';
CREATE OR REPLACE PROCEDURE SP_CONV_BR_ALL_ADVISOR_003(I_ADVISORDATEOFBIRTH VARCHAR(29), I_ASOFDATE VARCHAR(29), I_ISCORPORATION BOOLEAN)
RETURNS VARIANT
LANGUAGE JAVASCRIPT
EXECUTE AS OWNER
AS '
 
  var RESULT = {o_AGE_SEGMENTUnknown,o_AGE_SEGMENT_ORD6}
  var d1 = new Date(I_ADVISORDATEOFBIRTH);   
  var d2 = new Date(I_ASOFDATE);  
  var diff = d2.getTime() - d1.getTime();
  var year_diff = Math.floor((diff  (1000  60  60  24))365.25);    
  if (I_ISCORPORATION )
   {
    return {o_AGE_SEGMENTCorporate,o_AGE_SEGMENT_ORD8} 
   }
 switch(true) {
  case year_diff  0 
    RESULT = {o_AGE_SEGMENTUnknown,o_AGE_SEGMENT_ORD7}
    break;
  case year_diff  25 
    RESULT = {o_AGE_SEGMENTUnder 25,o_AGE_SEGMENT_ORD1}
    break;
  case year_diff = 25 && year_diff  45
    RESULT = {o_AGE_SEGMENT25-44,o_AGE_SEGMENT_ORD2}
    break;  
  case year_diff = 45 && year_diff  55
    RESULT = {o_AGE_SEGMENT45-54,o_AGE_SEGMENT_ORD3}
    break;  
   case year_diff = 55 && year_diff  61
    RESULT = {o_AGE_SEGMENT55-60,o_AGE_SEGMENT_ORD4}
    break;   
   case year_diff = 61
    RESULT = {o_AGE_SEGMENTOver 60,o_AGE_SEGMENT_ORD5}
    break;    
  default
    RESULT = {o_AGE_SEGMENTUnknown,o_AGE_SEGMENT_ORD6}
}   
  return RESULT;
';
CREATE OR REPLACE PROCEDURE SP_CONV_BR_ALL_ADVISOR_003(I_ADVISOR_SUM_AUA FLOAT)
RETURNS VARIANT
LANGUAGE JAVASCRIPT
EXECUTE AS OWNER
AS ' 
 var RESULT = {o_AGE_SEGMENTUnknown,o_AGE_SEGMENT_ORD0};  
    
  switch(true) {
  case I_ADVISOR_SUM_AUA == 0 
    RESULT = {o_AGE_SEGMENT0,o_AGE_SEGMENT_ORD-1}
    break;
  case I_ADVISOR_SUM_AUA = 1000000 
    RESULT = {o_AGE_SEGMENT= 1M,o_AGE_SEGMENT_ORD1}
    break;
  case I_ADVISOR_SUM_AUA  parseFloat(1000000) && I_ADVISOR_SUM_AUA = parseFloat(5000000)
    RESULT = {o_AGE_SEGMENT1M-5M,o_AGE_SEGMENT_ORD2}
    break;  
  case I_ADVISOR_SUM_AUA  5000000 && I_ADVISOR_SUM_AUA = 10000000
    RESULT = {o_AGE_SEGMENT5M-10M,o_AGE_SEGMENT_ORD3}
    break; 
   case I_ADVISOR_SUM_AUA  10000000 && I_ADVISOR_SUM_AUA = 20000000
    RESULT = {o_AGE_SEGMENT10M-20M,o_AGE_SEGMENT_ORD4}
    break;  
   case I_ADVISOR_SUM_AUA  20000000 && I_ADVISOR_SUM_AUA = 30000000
    RESULT = {o_AGE_SEGMENT20M-30M,o_AGE_SEGMENT_ORD5}
    break;    
   case I_ADVISOR_SUM_AUA  30000000 && I_ADVISOR_SUM_AUA = 50000000
    RESULT = {o_AGE_SEGMENT30M-50M,o_AGE_SEGMENT_ORD6}
    break; 
    case I_ADVISOR_SUM_AUA  50000000 
    RESULT = {o_AGE_SEGMENT 50M,o_AGE_SEGMENT_ORD7}
    break;  
  default
    RESULT = {o_AGE_SEGMENTUnknown,o_AGE_SEGMENT_ORD0}
}   
 
  return RESULT;
';
CREATE OR REPLACE PROCEDURE SP_CONV_BR_ALL_ADVISOR_003(I_ADVISOR_SUM_AUA VARCHAR(16777216))
RETURNS VARIANT
LANGUAGE JAVASCRIPT
EXECUTE AS OWNER
AS ' 
 var RESULT = {o_AGE_SEGMENTUnknown,o_AGE_SEGMENT_ORD0};
   switch(true) {
  case I_ADVISOR_SUM_AUA = 0 
    RESULT = {o_AGE_SEGMENT0,o_AGE_SEGMENT_ORD-1}
    break;
  case I_ADVISOR_SUM_AUA = 1000000 
    RESULT = {o_AGE_SEGMENT= 1M,o_AGE_SEGMENT_ORD1}
    break;
  case I_ADVISOR_SUM_AUA  1000000 && I_ADVISOR_SUM_AUA = 5000000
    RESULT = {o_AGE_SEGMENT1M-5M,o_AGE_SEGMENT_ORD2}
    break;  
  case I_ADVISOR_SUM_AUA  5000000 && I_ADVISOR_SUM_AUA = 10000000
    RESULT = {o_AGE_SEGMENT5M-10M,o_AGE_SEGMENT_ORD3}
    break; 
   case I_ADVISOR_SUM_AUA  10000000 && I_ADVISOR_SUM_AUA = 20000000
    RESULT = {o_AGE_SEGMENT10M-20M,o_AGE_SEGMENT_ORD4}
    break;  
   case I_ADVISOR_SUM_AUA  20000000 && I_ADVISOR_SUM_AUA = 30000000
    RESULT = {o_AGE_SEGMENT20M-30M,o_AGE_SEGMENT_ORD5}
    break;    
   case I_ADVISOR_SUM_AUA  30000000 && I_ADVISOR_SUM_AUA = 50000000
    RESULT = {o_AGE_SEGMENT30M-50M,o_AGE_SEGMENT_ORD6}
    break; 
    case I_ADVISOR_SUM_AUA  50000000 
    RESULT = {o_AGE_SEGMENT 50M,o_AGE_SEGMENT_ORD7}
    break;  
  default
    RESULT = {o_AGE_SEGMENTUnknown,o_AGE_SEGMENT_ORD0}
}   
 
  return RESULT;
';
CREATE OR REPLACE PROCEDURE SP_CONV_BR_ALL_ADVISOR_AUA_SEGMENTATION_002(I_ADVISOR_SUM_AUA FLOAT)
RETURNS VARIANT
LANGUAGE JAVASCRIPT
EXECUTE AS OWNER
AS ' 
 var RESULT = {o_AGE_SEGMENTUnknown,o_AGE_SEGMENT_ORD0};  
    
  switch(true) {
  case I_ADVISOR_SUM_AUA == 0 
    RESULT = {o_AGE_SEGMENT0,o_AGE_SEGMENT_ORD-1}
    break;
  case I_ADVISOR_SUM_AUA = 1000000 
    RESULT = {o_AGE_SEGMENT= 1M,o_AGE_SEGMENT_ORD1}
    break;
  case I_ADVISOR_SUM_AUA  parseFloat(1000000) && I_ADVISOR_SUM_AUA = parseFloat(5000000)
    RESULT = {o_AGE_SEGMENT1M-5M,o_AGE_SEGMENT_ORD2}
    break;  
  case I_ADVISOR_SUM_AUA  5000000 && I_ADVISOR_SUM_AUA = 10000000
    RESULT = {o_AGE_SEGMENT5M-10M,o_AGE_SEGMENT_ORD3}
    break; 
   case I_ADVISOR_SUM_AUA  10000000 && I_ADVISOR_SUM_AUA = 20000000
    RESULT = {o_AGE_SEGMENT10M-20M,o_AGE_SEGMENT_ORD4}
    break;  
   case I_ADVISOR_SUM_AUA  20000000 && I_ADVISOR_SUM_AUA = 30000000
    RESULT = {o_AGE_SEGMENT20M-30M,o_AGE_SEGMENT_ORD5}
    break;    
   case I_ADVISOR_SUM_AUA  30000000 && I_ADVISOR_SUM_AUA = 50000000
    RESULT = {o_AGE_SEGMENT30M-50M,o_AGE_SEGMENT_ORD6}
    break; 
    case I_ADVISOR_SUM_AUA  50000000 
    RESULT = {o_AGE_SEGMENT 50M,o_AGE_SEGMENT_ORD7}
    break;  
  default
    RESULT = {o_AGE_SEGMENTUnknown,o_AGE_SEGMENT_ORD0}
}   
 
  return RESULT;
';
CREATE OR REPLACE PROCEDURE SP_CONV_BR_ALL_CLIENTS_001(I_CLIENT_INCOME FLOAT)
RETURNS VARIANT
LANGUAGE JAVASCRIPT
EXECUTE AS OWNER
AS '
  
 var  RESULT = null;
 switch(true) {
    case I_CLIENT_INCOME == -1 
    RESULT = {o_INCOME_LEVEL_2_SEGMENTUnknown,o_INCOME_LEVEL_2_SEGMENT_ORD8}
    break;
  case I_CLIENT_INCOME = 30
    RESULT = {o_INCOME_LEVEL_2_SEGMENT''(=$30k)'',o_INCOME_LEVEL_2_SEGMENT_ORD1}
    break;  
   case I_CLIENT_INCOME  30  && I_CLIENT_INCOME = 50
    RESULT = {o_INCOME_LEVEL_2_SEGMENT$30k - $50k,o_INCOME_LEVEL_2_SEGMENT_ORD2}
    break;  
  case I_CLIENT_INCOME  50  && I_CLIENT_INCOME = 70
    RESULT = {o_INCOME_LEVEL_2_SEGMENT$50k - $70k,o_INCOME_LEVEL_2_SEGMENT_ORD3}
    break; 
   case I_CLIENT_INCOME  70  && I_CLIENT_INCOME = 100
    RESULT = {o_INCOME_LEVEL_2_SEGMENT$70k - $100k,o_INCOME_LEVEL_2_SEGMENT_ORD4}
    break;   
    case I_CLIENT_INCOME  100  && I_CLIENT_INCOME = 200
    RESULT = {o_INCOME_LEVEL_2_SEGMENT$70k - $100k,o_INCOME_LEVEL_2_SEGMENT_ORD5}
    break; 
    case I_CLIENT_INCOME  200  && I_CLIENT_INCOME = 300
    RESULT = {o_INCOME_LEVEL_2_SEGMENT$200k - $300k,o_INCOME_LEVEL_2_SEGMENT_ORD6}
    break;    
   case I_CLIENT_INCOME  300
    RESULT = {o_INCOME_LEVEL_2_SEGMENT$200k - $300k,o_INCOME_LEVEL_2_SEGMENT_ORD7}
    break; 
  default
    RESULT = {o_INCOME_LEVEL_2_SEGMENTUnknown,o_INCOME_LEVEL_2_SEGMENT_ORD8}
}   
  return RESULT;
';
CREATE OR REPLACE PROCEDURE SP_CONV_BR_ALL_CLIENTS_002(I_CLIENT_INCOME FLOAT)
RETURNS VARIANT
LANGUAGE JAVASCRIPT
EXECUTE AS OWNER
AS '
  
 var  RESULT = null;
 switch(true) {
    case I_CLIENT_INCOME == -1 
    RESULT = {o_INCOME_LEVEL_1_SEGMENTUnknown,o_INCOME_LEVEL_1_SEGMENT_ORD5}
    break;
  case I_CLIENT_INCOME = 30
    RESULT = {o_INCOME_LEVEL_1_SEGMENTLower,o_INCOME_LEVEL_1_SEGMENT_ORD1}
    break;  
   case I_CLIENT_INCOME  30  && I_CLIENT_INCOME = 70
    RESULT = {o_INCOME_LEVEL_1_SEGMENTMiddle,o_INCOME_LEVEL_1_SEGMENT_ORD2}
    break;    
  case I_CLIENT_INCOME  70  && I_CLIENT_INCOME = 200
    RESULT = {o_INCOME_LEVEL_1_SEGMENTUpper,o_INCOME_LEVEL_1_SEGMENT_ORD3}
    break;  
   case I_CLIENT_INCOME  200
    RESULT = {o_INCOME_LEVEL_1_SEGMENTHigh,o_INCOME_LEVEL_1_SEGMENT_ORD4}
    break; 
  default
    RESULT = {o_INCOME_LEVEL_1_SEGMENTUnknown,o_INCOME_LEVEL_1_SEGMENT_ORD5}
}   
  return RESULT;
';
CREATE OR REPLACE PROCEDURE SP_CONV_BR_ALL_CLIENTS_003(I_CLIENTDATEOFBIRTH VARCHAR(29), I_ASOFDATE VARCHAR(29), I_IS_CORPORATION BOOLEAN)
RETURNS VARIANT
LANGUAGE JAVASCRIPT
EXECUTE AS OWNER
AS '
  
  if (I_IS_CORPORATION  == null  && I_CLIENTDATEOFBIRTH == null)
   {
    return {o_AGE_SEGMENTUnknown,o_AGE_SEGMENT_ORD8};
    }
  if (I_IS_CORPORATION)
  {
    return {o_AGE_SEGMENT''Corporate'',o_AGE_SEGMENT_ORD9};
  }
  var RESULT = {};
  var d1 = new Date(I_CLIENTDATEOFBIRTH);   
  var d2 = new Date(I_ASOFDATE);  
  var diff = d2.getTime() - d1.getTime();
  var year_diff = Math.floor((diff  (1000  60  60  24))365.25);    
  
 switch(true) {
    case year_diff  25 
    RESULT = {o_AGE_SEGMENTUnder 25,o_AGE_SEGMENT_ORD1}
    break;
  case year_diff = 25 && year_diff  35
    RESULT = {o_AGE_SEGMENT25-34,o_AGE_SEGMENT_ORD2}
    break;  
   case year_diff = 35 && year_diff  45
    RESULT = {o_AGE_SEGMENT35-44,o_AGE_SEGMENT_ORD3}
    break;    
  case year_diff = 45 && year_diff  55
    RESULT = {o_AGE_SEGMENT45-54,o_AGE_SEGMENT_ORD4}
    break;  
   case year_diff = 55 && year_diff  65
    RESULT = {o_AGE_SEGMENT55-64,o_AGE_SEGMENT_ORD5}
    break; 
   case year_diff = 65 && year_diff  75
    RESULT = {o_AGE_SEGMENT65-74,o_AGE_SEGMENT_ORD6}
    break; 
   case year_diff = 75
    RESULT = {o_AGE_SEGMENTOver 75,o_AGE_SEGMENT_ORD7}
    break;    
  default
    RESULT = {o_AGE_SEGMENTUnknown,o_AGE_SEGMENT_ORD8}
}   
  return RESULT;
';
CREATE OR REPLACE PROCEDURE SP_CONV_BR_ALL_CLIENTS_PROVINCE_005(I_COUNTRY_CODE VARCHAR(10), I_PROVINCE_CODE VARCHAR(10))
RETURNS VARCHAR(16777216)
LANGUAGE JAVASCRIPT
EXECUTE AS OWNER
AS '  
  
  var RESULT = {}
  if (I_COUNTRY_CODE  != CAN && I_PROVINCE_CODE != null )
  {
   return ''Outside Canada'';
  }
 switch(true) {
    case I_PROVINCE_CODE == SK 
    RESULT =  Saskatchewan;
    break;
    case I_PROVINCE_CODE == MB 
    RESULT =  Manitoba;
    break;
    case I_PROVINCE_CODE == NS 
    RESULT =  Nova Scotia;
    break;
    case I_PROVINCE_CODE == NL 
    RESULT =  Newfoundland and Labrador;
    break;
    case I_PROVINCE_CODE == PE 
    RESULT =  Prince Edward Island;
    break;
    case I_PROVINCE_CODE == QC 
    RESULT =  Quebec;
    break;
    case I_PROVINCE_CODE == ON 
    RESULT =  Ontario;
    break;
    case I_PROVINCE_CODE == BC 
    RESULT =  British Columbia;
    break;
    case I_PROVINCE_CODE == NB 
    RESULT =  New Brunswick;
    break;
    case I_PROVINCE_CODE == AB 
    RESULT =  Alberta;
    break;
    case I_PROVINCE_CODE == NT 
    RESULT =  Northwest Territories;
    break;
    case I_PROVINCE_CODE == YT 
    RESULT =  Yukon;
    break;
    case I_PROVINCE_CODE == NU 
    RESULT =  Nunavut; 
    break;
  default
    RESULT = Unknown
}   
  return RESULT;
';
CREATE OR REPLACE PROCEDURE SP_CONV_BR_ALL_CLIENT_AUA_SEGMENTATION_002(I_CLIENT_SUM_AUA FLOAT)
RETURNS VARIANT
LANGUAGE JAVASCRIPT
EXECUTE AS OWNER
AS '  
  
  var RESULT = {}
 switch(true) {
    case I_CLIENT_SUM_AUA  25000 
    RESULT = {o_CLIENT_AUA_SEGMENT25k,o_CLIENT_AUA_SEGMENT_ORDER1}
    break;
  case I_CLIENT_SUM_AUA =25000 &&  I_CLIENT_SUM_AUA = 100000 
    RESULT = {o_CLIENT_AUA_SEGMENT25k-100k,o_CLIENT_AUA_SEGMENT_ORDER2}
    break;  
   case I_CLIENT_SUM_AUA =100000 &&  I_CLIENT_SUM_AUA = 250000
   RESULT = {o_CLIENT_AUA_SEGMENT100k-250k,o_CLIENT_AUA_SEGMENT_ORDER3}
    break;    
   case I_CLIENT_SUM_AUA =250000 &&  I_CLIENT_SUM_AUA = 500000 
    RESULT = {o_CLIENT_AUA_SEGMENT250k-500k,o_CLIENT_AUA_SEGMENT_ORDER4}
    break;  
    case I_CLIENT_SUM_AUA  500000
    RESULT = {o_CLIENT_AUA_SEGMENT 500k,o_CLIENT_AUA_SEGMENT_ORDER5}
    break; 
   
  default
    RESULT = {o_CLIENT_AUA_SEGMENTUnknown,o_CLIENT_AUA_SEGMENT_ORDER6}
}   
  return RESULT;
';
CREATE OR REPLACE PROCEDURE SP_CONV_BR_ALL_FINANCIA_INSTRUMENTS_CATEGORY_001(I_ASSET_CATEGORY VARCHAR(100), I_DESCRIPTION_EN VARCHAR(100))
RETURNS VARCHAR(100)
LANGUAGE JAVASCRIPT
EXECUTE AS OWNER
AS '  
  
 var  RESULT  = ;
 switch(true) {
   case  [Mutual Fund,  Mutual Funds].includes(I_DESCRIPTION_EN)
        RESULT = Mutual Funds;
    break; 
   case  I_DESCRIPTION_EN == Fixed Income Securities
        RESULT = Fixed Income;
    break; 
  case  [Bonds,  Conv. Marginable Security,StripBonds,StripCoupons].includes(I_ASSET_CATEGORY)
        RESULT = Fixed Income;
    break;  
   case  [Call - Stock Option,Option Eligible].includes(I_ASSET_CATEGORY)
        RESULT = Options;
    break;  
   case  [Common Stock,  Unit without Debt].includes(I_ASSET_CATEGORY)
        RESULT = Equities;
    break;   
   case I_ASSET_CATEGORY == Mutual Funds
         RESULT = Mutual Funds;
    break;    
   default
     RESULT = I_DESCRIPTION_EN
}   
  return RESULT;
';
CREATE OR REPLACE PROCEDURE SP_CONV_BR_UNIVERIS_CLIENTS_AGE_SEGMENTATION_008(I_CLIENTDATEOFBIRTH VARCHAR(29), I_ASOFDATE VARCHAR(29), I_CORP_CD VARCHAR(16777216))
RETURNS VARIANT
LANGUAGE JAVASCRIPT
EXECUTE AS OWNER
AS '
  
  if ((I_CORP_CD  == null  I_CORP_CD  != ''C'') && I_CLIENTDATEOFBIRTH == null)
   {
    return {o_AGE_SEGMENTUnknown,o_AGE_SEGMENT_ORD8};
    }
  if (I_CORP_CD == ''C'')
  {
    return {o_AGE_SEGMENT''Corporate'',o_AGE_SEGMENT_ORD9};
  }
  var RESULT = {o_AGE_SEGMENTUnknown,o_AGE_SEGMENT_ORD6}
  var d1 = new Date(I_CLIENTDATEOFBIRTH);   
  var d2 = new Date(I_ASOFDATE);  
  var diff = d2.getTime() - d1.getTime();
  var year_diff = Math.floor((diff  (1000  60  60  24))365.25);    
  
 switch(true) {
    case year_diff  25 
    RESULT = {o_AGE_SEGMENTUnder 25,o_AGE_SEGMENT_ORD1}
    break;
  case year_diff = 25 && year_diff  35
    RESULT = {o_AGE_SEGMENT25-34,o_AGE_SEGMENT_ORD2}
    break;  
   case year_diff = 35 && year_diff  45
    RESULT = {o_AGE_SEGMENT35-44,o_AGE_SEGMENT_ORD3}
    break;    
  case year_diff = 45 && year_diff  55
    RESULT = {o_AGE_SEGMENT45-54,o_AGE_SEGMENT_ORD4}
    break;  
   case year_diff = 55 && year_diff  65
    RESULT = {o_AGE_SEGMENT55-64,o_AGE_SEGMENT_ORD5}
    break; 
   case year_diff = 65 && year_diff  75
    RESULT = {o_AGE_SEGMENT65-74,o_AGE_SEGMENT_ORD6}
    break; 
   case year_diff = 75
    RESULT = {o_AGE_SEGMENTOver 75,o_AGE_SEGMENT_ORD7}
    break;    
  default
    RESULT = {o_AGE_SEGMENTUnknown,o_AGE_SEGMENT_ORD8}
}   
  return RESULT;
';
CREATE OR REPLACE PROCEDURE SP_CONV_BR_UNIVERIS_CLIENTS_INCOME_SEGMENTATION_006(I_SALARY_DESC VARCHAR(100))
RETURNS VARIANT
LANGUAGE JAVASCRIPT
EXECUTE AS OWNER
AS '
  
  
  var RESULT = {}
 switch(true) {
    case I_SALARY_DESC === Less or Equal to $30,000 
    RESULT = {o_IncomeSegmentation($30k),o_IncomeSegmentation_Ord1}
    break;
  case I_SALARY_DESC === $30,001 to $50,000
    RESULT = {o_IncomeSegmentation$30k - $50k,o_IncomeSegmentation_Ord2}
    break;  
   case I_SALARY_DESC === $50,001 to $70,000
   RESULT = {o_IncomeSegmentation$50k - $70k,o_IncomeSegmentation_Ord3}
    break;    
   case I_SALARY_DESC === $70,001 to $100,000
    RESULT = {o_IncomeSegmentation$70k - $100k,o_IncomeSegmentation_Ord4}
    break;  
    case I_SALARY_DESC === $100,001 to $200,000
    RESULT = {o_IncomeSegmentation$100k - $200k,o_IncomeSegmentation_Ord5}
    break; 
   case I_SALARY_DESC === $200,001 to 300,000
   RESULT = {o_IncomeSegmentation$200k - $300k,o_IncomeSegmentation_Ord6}
    break; 
   case I_SALARY_DESC === Greater or Equal to $300,001  I_SALARY_DESC === More or Equal to $300,001
    RESULT = {o_IncomeSegmentation$300k+,o_IncomeSegmentation_Ord7}
    break;    
  default
    RESULT = {o_AGE_SEGMENTUnknown,o_AGE_SEGMENT_ORD8}
}   
  return RESULT;
';
CREATE OR REPLACE PROCEDURE SP_CONV_BR_UNIVERIS_CLIENTS_SALARY_SEGMENTATION_007(I_SALARY_DESC VARCHAR(100))
RETURNS VARIANT
LANGUAGE JAVASCRIPT
EXECUTE AS OWNER
AS '
  
  
  var RESULT = {}
 switch(true) {
    case I_SALARY_DESC === Less or Equal to $30,000 
    RESULT = {o_SalarySegmentationLower,o_SalarySegmentation_Ord1}
    break;
  case I_SALARY_DESC === $30,001 to $50,000  I_SALARY_DESC === $50,001 to $70,000
    RESULT = {o_SalarySegmentationMiddle,o_SalarySegmentation_Ord2};
    break;
   case I_SALARY_DESC === $70,001 to $100,000   I_SALARY_DESC === $100,001 to $200,000
    RESULT = {o_SalarySegmentationUpper,o_SalarySegmentation_Ord3}
    break;  
    case I_SALARY_DESC === $200,001 to 300,000  I_SALARY_DESC === Greater or Equal to $300,001  I_SALARY_DESC === More or Equal to $300,001
   RESULT = {o_SalarySegmentationHigh,o_SalarySegmentation_Ord4}
    break; 
   default
    RESULT = {o_SalarySegmentationUnknown,o_SalarySegmentation_Ord5}
}   
  return RESULT;
';
CREATE OR REPLACE PROCEDURE SP_CONV_MPLT_BR_ALL_CLIENTS_004(I_ASOFDATE VARCHAR(29), I_CLIENT_CONTRACT_START_DATE VARCHAR(29))
RETURNS VARCHAR(16777216)
LANGUAGE JAVASCRIPT
EXECUTE AS OWNER
AS '  
 var  RESULT = ;
 if (I_ASOFDATE == null  I_CLIENT_CONTRACT_START_DATE == null)
 
    return Unknown;
  
    else 
   
   (I_ASOFDATE === I_CLIENT_CONTRACT_START_DATE)RESULT = YesRESULT = No  ;
  
   return RESULT;
';
CREATE OR REPLACE FUNCTION UDF_CONV_BR_ALL_FINANCIA_INSTRUMENTS_CATEGORY_001(I_ASSET_CATEGORY VARCHAR(100), I_DESCRIPTION_EN VARCHAR(100))
RETURNS VARCHAR(100)
LANGUAGE JAVASCRIPT
AS '  
  
 var  RESULT  = ;
 switch(true) {
   case  [Mutual Fund,  Mutual Funds].includes(I_DESCRIPTION_EN)
        RESULT = Mutual Funds;
    break; 
   case  I_DESCRIPTION_EN == Fixed Income Securities
        RESULT = Fixed Income;
    break; 
  case  [Bonds,  Conv. Marginable Security,StripBonds,StripCoupons].includes(I_ASSET_CATEGORY)
        RESULT = Fixed Income;
    break;  
   case  [Call - Stock Option,Option Eligible].includes(I_ASSET_CATEGORY)
        RESULT = Options;
    break;  
   case  [Common Stock,  Unit without Debt].includes(I_ASSET_CATEGORY)
        RESULT = Equities;
    break;   
   case I_ASSET_CATEGORY == Mutual Funds
         RESULT = Mutual Funds;
    break;    
   default
     RESULT = I_DESCRIPTION_EN
}   
  return RESULT;
';

CREATE OR REPLACE PROCEDURE BR_ALL_ADVISOR_AUA_SEGMENTATION_002(I_ADVISOR_SUM_AUA FLOAT)
RETURNS VARIANT
LANGUAGE JAVASCRIPT
EXECUTE AS OWNER
AS ' 
 var RESULT = {o_AGE_SEGMENTUnknown,o_AGE_SEGMENT_ORD0};  
    
  switch(true) {
  case I_ADVISOR_SUM_AUA == 0 
    RESULT = {o_AGE_SEGMENT0,o_AGE_SEGMENT_ORD-1}
    break;
  case I_ADVISOR_SUM_AUA = 1000000 
    RESULT = {o_AGE_SEGMENT= 1M,o_AGE_SEGMENT_ORD1}
    break;
  case I_ADVISOR_SUM_AUA  parseFloat(1000000) && I_ADVISOR_SUM_AUA = parseFloat(5000000)
    RESULT = {o_AGE_SEGMENT1M-5M,o_AGE_SEGMENT_ORD2}
    break;  
  case I_ADVISOR_SUM_AUA  5000000 && I_ADVISOR_SUM_AUA = 10000000
    RESULT = {o_AGE_SEGMENT5M-10M,o_AGE_SEGMENT_ORD3}
    break; 
   case I_ADVISOR_SUM_AUA  10000000 && I_ADVISOR_SUM_AUA = 20000000
    RESULT = {o_AGE_SEGMENT10M-20M,o_AGE_SEGMENT_ORD4}
    break;  
   case I_ADVISOR_SUM_AUA  20000000 && I_ADVISOR_SUM_AUA = 30000000
    RESULT = {o_AGE_SEGMENT20M-30M,o_AGE_SEGMENT_ORD5}
    break;    
   case I_ADVISOR_SUM_AUA  30000000 && I_ADVISOR_SUM_AUA = 50000000
    RESULT = {o_AGE_SEGMENT30M-50M,o_AGE_SEGMENT_ORD6}
    break; 
    case I_ADVISOR_SUM_AUA  50000000 
    RESULT = {o_AGE_SEGMENT 50M,o_AGE_SEGMENT_ORD7}
    break;  
  default
    RESULT = {o_AGE_SEGMENTUnknown,o_AGE_SEGMENT_ORD0}
}   
 
  return RESULT;
';
CREATE OR REPLACE PROCEDURE BR_UNIVERIS_CLIENTS_INCOME_SEGMENTATION_006(I_SALARY_DESC VARCHAR(100))
RETURNS VARIANT
LANGUAGE JAVASCRIPT
EXECUTE AS OWNER
AS '
  
  
  var RESULT = {}
 switch(true) {
    case I_SALARY_DESC === Less or Equal to $30,000 
    RESULT = {o_IncomeSegmentation($30k),o_IncomeSegmentation_Ord1}
    break;
  case I_SALARY_DESC === $30,001 to $50,000
    RESULT = {o_IncomeSegmentation$30k - $50k,o_IncomeSegmentation_Ord2}
    break;  
   case I_SALARY_DESC === $50,001 to $70,000
   RESULT = {o_IncomeSegmentation$50k - $70k,o_IncomeSegmentation_Ord3}
    break;    
   case I_SALARY_DESC === $70,001 to $100,000
    RESULT = {o_IncomeSegmentation$70k - $100k,o_IncomeSegmentation_Ord4}
    break;  
    case I_SALARY_DESC === $100,001 to $200,000
    RESULT = {o_IncomeSegmentation$100k - $200k,o_IncomeSegmentation_Ord5}
    break; 
   case I_SALARY_DESC === $200,001 to 300,000
   RESULT = {o_IncomeSegmentation$200k - $300k,o_IncomeSegmentation_Ord6}
    break; 
   case I_SALARY_DESC === Greater or Equal to $300,001  I_SALARY_DESC === More or Equal to $300,001
    RESULT = {o_IncomeSegmentation$300k+,o_IncomeSegmentation_Ord7}
    break;    
  default
    RESULT = {o_AGE_SEGMENTUnknown,o_AGE_SEGMENT_ORD8}
}   
  return RESULT;
';
CREATE OR REPLACE PROCEDURE BR_UNIVERIS_TRANSACTIONS_CASH_FLOW_002(I_TRX_MNEM_ENG VARCHAR(100))
RETURNS VARCHAR(100)
LANGUAGE JAVASCRIPT
EXECUTE AS OWNER
AS '  
  return   I_TRX_MNEM_ENG.indexOf(XIN) = 0 I_TRX_MNEM_ENG.indexOf(DXI) = 0  I_TRX_MNEM_ENG.indexOf(XOT) = 0 I_TRX_MNEM_ENG.indexOf(DXO) = 0 YesNo;
 
';
CREATE OR REPLACE PROCEDURE BR_UNIVERIS_TRANSACTIONS_CASH_FLOW_002(I_TRX_MNEM_ENG VARCHAR(100), I_GROSS_AMOUNT FLOAT)
RETURNS VARCHAR(100)
LANGUAGE JAVASCRIPT
EXECUTE AS OWNER
AS ' 
  RESULT = OTHER;
  if ((I_TRX_MNEM_ENG.indexOf(XIN) = 0 I_TRX_MNEM_ENG.indexOf(DXI) = 0  I_TRX_MNEM_ENG.indexOf(XOT) = 0 I_TRX_MNEM_ENG.indexOf(DXO) = 0))
   {
     IF (I_GROSS_AMOUNT FLOAT = 0)
       RESULT = IN FLOW;
     ELSE   
       RESULT = OUT FLOW;
   }
  return   RESULT;
 
';
CREATE OR REPLACE PROCEDURE BR_UNIVERIS_TRANSACTIONS_CASH_FLOW_003(I_TRX_MNEM_ENG VARCHAR(100), I_GROSS_AMOUNT FLOAT)
RETURNS VARCHAR(100)
LANGUAGE JAVASCRIPT
EXECUTE AS OWNER
AS ' 
  RESULT = OTHER;
  if (I_TRX_MNEM_ENG.indexOf(XIN) = 0 I_TRX_MNEM_ENG.indexOf(DXI) = 0  I_TRX_MNEM_ENG.indexOf(XOT) = 0 I_TRX_MNEM_ENG.indexOf(DXO) = 0)
   {
     if (I_GROSS_AMOUNT  = 0)
      
       RESULT = IN FLOW;
       
    else  
       RESULT = OUT FLOW;
   }
  return   RESULT;
 
';
CREATE OR REPLACE PROCEDURE SP_CONV_BR_ALL_ACCOUNT_AUA_SEGMENTATION_001(I_ACCOUNT_SUM_AUA FLOAT)
RETURNS VARIANT
LANGUAGE JAVASCRIPT
EXECUTE AS OWNER
AS '  
  
  var RESULT = {}
 switch(true) {
   case I_ACCOUNT_SUM_AUA == 0 
    RESULT = {o_ACCOUNT_AUA_SEGMENT0,o_ACCOUNT_AUA_SEGMENT_ORDER-1}
    break; 
    case I_ACCOUNT_SUM_AUA  1000000 
    RESULT = {o_ACCOUNT_AUA_SEGMENT= 1M,o_ACCOUNT_AUA_SEGMENT_ORDER1}
    break;
  case I_ACCOUNT_SUM_AUA =1000000  && I_ACCOUNT_SUM_AUA = 5000000 
    RESULT = {o_ACCOUNT_AUA_SEGMENT1M-5M,o_ACCOUNT_AUA_SEGMENT_ORDER2}
    break;  
   case I_ACCOUNT_SUM_AUA =5000000  && I_ACCOUNT_SUM_AUA = 10000000 
    RESULT = {o_ACCOUNT_AUA_SEGMENT5M-10M,o_ACCOUNT_AUA_SEGMENT_ORDER3}
    break;   
   case I_ACCOUNT_SUM_AUA =10000000  && I_ACCOUNT_SUM_AUA = 20000000 
    RESULT = {o_ACCOUNT_AUA_SEGMENT10M-20M,o_ACCOUNT_AUA_SEGMENT_ORDER4}
    break;   
   break;   
   case I_ACCOUNT_SUM_AUA =20000000  && I_ACCOUNT_SUM_AUA = 30000000 
    RESULT = {o_ACCOUNT_AUA_SEGMENT20M-30M,o_ACCOUNT_AUA_SEGMENT_ORDER5}
    break;      
  case I_ACCOUNT_SUM_AUA =30000000  && I_ACCOUNT_SUM_AUA = 50000000 
    RESULT = {o_ACCOUNT_AUA_SEGMENT30M-50M,o_ACCOUNT_AUA_SEGMENT_ORDER6}
    break; 
    case  I_ACCOUNT_SUM_AUA  50000000
     RESULT = {o_ACCOUNT_AUA_SEGMENT 50M,o_ACCOUNT_AUA_SEGMENT_ORDER7}
    break; 
   
  default
     RESULT = {o_ACCOUNT_AUA_SEGMENTUnknown,o_ACCOUNT_AUA_SEGMENT_ORDER0}
}   
  return RESULT;
';
CREATE OR REPLACE PROCEDURE SP_CONV_BR_ALL_ADVISOR_001(I_ADVISORSTARTDATE VARCHAR(29), I_LOADDATE VARCHAR(29))
RETURNS VARCHAR(1)
LANGUAGE JAVASCRIPT
EXECUTE AS OWNER
AS ' 
  var d2 = new Date(I_LOADDATE);   
  var d1 = new Date(I_ADVISORSTARTDATE);  
  var diff = d2.getTime() - d1.getTime();
  var year_diff = Math.floor(diff  (1000  60  60  24));  
  return year_diff = 365  ''1'' ''0'';    
';
CREATE OR REPLACE PROCEDURE SP_CONV_BR_ALL_ADVISOR_003(I_ADVISORDATEOFBIRTH VARCHAR(29), I_ASOFDATE VARCHAR(29), I_ISCORPORATION BOOLEAN)
RETURNS VARIANT
LANGUAGE JAVASCRIPT
EXECUTE AS OWNER
AS '
 
  var RESULT = {o_AGE_SEGMENTUnknown,o_AGE_SEGMENT_ORD6}
  var d1 = new Date(I_ADVISORDATEOFBIRTH);   
  var d2 = new Date(I_ASOFDATE);  
  var diff = d2.getTime() - d1.getTime();
  var year_diff = Math.floor((diff  (1000  60  60  24))365.25);    
  if (I_ISCORPORATION )
   {
    return {o_AGE_SEGMENTCorporate,o_AGE_SEGMENT_ORD8} 
   }
 switch(true) {
  case year_diff  0 
    RESULT = {o_AGE_SEGMENTUnknown,o_AGE_SEGMENT_ORD7}
    break;
  case year_diff  25 
    RESULT = {o_AGE_SEGMENTUnder 25,o_AGE_SEGMENT_ORD1}
    break;
  case year_diff = 25 && year_diff  45
    RESULT = {o_AGE_SEGMENT25-44,o_AGE_SEGMENT_ORD2}
    break;  
  case year_diff = 45 && year_diff  55
    RESULT = {o_AGE_SEGMENT45-54,o_AGE_SEGMENT_ORD3}
    break;  
   case year_diff = 55 && year_diff  61
    RESULT = {o_AGE_SEGMENT55-60,o_AGE_SEGMENT_ORD4}
    break;   
   case year_diff = 61
    RESULT = {o_AGE_SEGMENTOver 60,o_AGE_SEGMENT_ORD5}
    break;    
  default
    RESULT = {o_AGE_SEGMENTUnknown,o_AGE_SEGMENT_ORD6}
}   
  return RESULT;
';
CREATE OR REPLACE PROCEDURE SP_CONV_BR_ALL_ADVISOR_003(I_ADVISOR_SUM_AUA FLOAT)
RETURNS VARIANT
LANGUAGE JAVASCRIPT
EXECUTE AS OWNER
AS ' 
 var RESULT = {o_AGE_SEGMENTUnknown,o_AGE_SEGMENT_ORD0};  
    
  switch(true) {
  case I_ADVISOR_SUM_AUA == 0 
    RESULT = {o_AGE_SEGMENT0,o_AGE_SEGMENT_ORD-1}
    break;
  case I_ADVISOR_SUM_AUA = 1000000 
    RESULT = {o_AGE_SEGMENT= 1M,o_AGE_SEGMENT_ORD1}
    break;
  case I_ADVISOR_SUM_AUA  parseFloat(1000000) && I_ADVISOR_SUM_AUA = parseFloat(5000000)
    RESULT = {o_AGE_SEGMENT1M-5M,o_AGE_SEGMENT_ORD2}
    break;  
  case I_ADVISOR_SUM_AUA  5000000 && I_ADVISOR_SUM_AUA = 10000000
    RESULT = {o_AGE_SEGMENT5M-10M,o_AGE_SEGMENT_ORD3}
    break; 
   case I_ADVISOR_SUM_AUA  10000000 && I_ADVISOR_SUM_AUA = 20000000
    RESULT = {o_AGE_SEGMENT10M-20M,o_AGE_SEGMENT_ORD4}
    break;  
   case I_ADVISOR_SUM_AUA  20000000 && I_ADVISOR_SUM_AUA = 30000000
    RESULT = {o_AGE_SEGMENT20M-30M,o_AGE_SEGMENT_ORD5}
    break;    
   case I_ADVISOR_SUM_AUA  30000000 && I_ADVISOR_SUM_AUA = 50000000
    RESULT = {o_AGE_SEGMENT30M-50M,o_AGE_SEGMENT_ORD6}
    break; 
    case I_ADVISOR_SUM_AUA  50000000 
    RESULT = {o_AGE_SEGMENT 50M,o_AGE_SEGMENT_ORD7}
    break;  
  default
    RESULT = {o_AGE_SEGMENTUnknown,o_AGE_SEGMENT_ORD0}
}   
 
  return RESULT;
';
CREATE OR REPLACE PROCEDURE SP_CONV_BR_ALL_ADVISOR_003(I_ADVISOR_SUM_AUA VARCHAR(16777216))
RETURNS VARIANT
LANGUAGE JAVASCRIPT
EXECUTE AS OWNER
AS ' 
 var RESULT = {o_AGE_SEGMENTUnknown,o_AGE_SEGMENT_ORD0};
   switch(true) {
  case I_ADVISOR_SUM_AUA = 0 
    RESULT = {o_AGE_SEGMENT0,o_AGE_SEGMENT_ORD-1}
    break;
  case I_ADVISOR_SUM_AUA = 1000000 
    RESULT = {o_AGE_SEGMENT= 1M,o_AGE_SEGMENT_ORD1}
    break;
  case I_ADVISOR_SUM_AUA  1000000 && I_ADVISOR_SUM_AUA = 5000000
    RESULT = {o_AGE_SEGMENT1M-5M,o_AGE_SEGMENT_ORD2}
    break;  
  case I_ADVISOR_SUM_AUA  5000000 && I_ADVISOR_SUM_AUA = 10000000
    RESULT = {o_AGE_SEGMENT5M-10M,o_AGE_SEGMENT_ORD3}
    break; 
   case I_ADVISOR_SUM_AUA  10000000 && I_ADVISOR_SUM_AUA = 20000000
    RESULT = {o_AGE_SEGMENT10M-20M,o_AGE_SEGMENT_ORD4}
    break;  
   case I_ADVISOR_SUM_AUA  20000000 && I_ADVISOR_SUM_AUA = 30000000
    RESULT = {o_AGE_SEGMENT20M-30M,o_AGE_SEGMENT_ORD5}
    break;    
   case I_ADVISOR_SUM_AUA  30000000 && I_ADVISOR_SUM_AUA = 50000000
    RESULT = {o_AGE_SEGMENT30M-50M,o_AGE_SEGMENT_ORD6}
    break; 
    case I_ADVISOR_SUM_AUA  50000000 
    RESULT = {o_AGE_SEGMENT 50M,o_AGE_SEGMENT_ORD7}
    break;  
  default
    RESULT = {o_AGE_SEGMENTUnknown,o_AGE_SEGMENT_ORD0}
}   
 
  return RESULT;
';
CREATE OR REPLACE PROCEDURE SP_CONV_BR_ALL_ADVISOR_AUA_SEGMENTATION_002(I_ADVISOR_SUM_AUA FLOAT)
RETURNS VARIANT
LANGUAGE JAVASCRIPT
EXECUTE AS OWNER
AS ' 
 var RESULT = {o_AGE_SEGMENTUnknown,o_AGE_SEGMENT_ORD0};  
    
  switch(true) {
  case I_ADVISOR_SUM_AUA == 0 
    RESULT = {o_AGE_SEGMENT0,o_AGE_SEGMENT_ORD-1}
    break;
  case I_ADVISOR_SUM_AUA = 1000000 
    RESULT = {o_AGE_SEGMENT= 1M,o_AGE_SEGMENT_ORD1}
    break;
  case I_ADVISOR_SUM_AUA  parseFloat(1000000) && I_ADVISOR_SUM_AUA = parseFloat(5000000)
    RESULT = {o_AGE_SEGMENT1M-5M,o_AGE_SEGMENT_ORD2}
    break;  
  case I_ADVISOR_SUM_AUA  5000000 && I_ADVISOR_SUM_AUA = 10000000
    RESULT = {o_AGE_SEGMENT5M-10M,o_AGE_SEGMENT_ORD3}
    break; 
   case I_ADVISOR_SUM_AUA  10000000 && I_ADVISOR_SUM_AUA = 20000000
    RESULT = {o_AGE_SEGMENT10M-20M,o_AGE_SEGMENT_ORD4}
    break;  
   case I_ADVISOR_SUM_AUA  20000000 && I_ADVISOR_SUM_AUA = 30000000
    RESULT = {o_AGE_SEGMENT20M-30M,o_AGE_SEGMENT_ORD5}
    break;    
   case I_ADVISOR_SUM_AUA  30000000 && I_ADVISOR_SUM_AUA = 50000000
    RESULT = {o_AGE_SEGMENT30M-50M,o_AGE_SEGMENT_ORD6}
    break; 
    case I_ADVISOR_SUM_AUA  50000000 
    RESULT = {o_AGE_SEGMENT 50M,o_AGE_SEGMENT_ORD7}
    break;  
  default
    RESULT = {o_AGE_SEGMENTUnknown,o_AGE_SEGMENT_ORD0}
}   
 
  return RESULT;
';
CREATE OR REPLACE PROCEDURE SP_CONV_BR_ALL_CLIENTS_001(I_CLIENT_INCOME FLOAT)
RETURNS VARIANT
LANGUAGE JAVASCRIPT
EXECUTE AS OWNER
AS '
  
 var  RESULT = null;
 switch(true) {
    case I_CLIENT_INCOME == -1 
    RESULT = {o_INCOME_LEVEL_2_SEGMENTUnknown,o_INCOME_LEVEL_2_SEGMENT_ORD8}
    break;
  case I_CLIENT_INCOME = 30
    RESULT = {o_INCOME_LEVEL_2_SEGMENT''(=$30k)'',o_INCOME_LEVEL_2_SEGMENT_ORD1}
    break;  
   case I_CLIENT_INCOME  30  && I_CLIENT_INCOME = 50
    RESULT = {o_INCOME_LEVEL_2_SEGMENT$30k - $50k,o_INCOME_LEVEL_2_SEGMENT_ORD2}
    break;  
  case I_CLIENT_INCOME  50  && I_CLIENT_INCOME = 70
    RESULT = {o_INCOME_LEVEL_2_SEGMENT$50k - $70k,o_INCOME_LEVEL_2_SEGMENT_ORD3}
    break; 
   case I_CLIENT_INCOME  70  && I_CLIENT_INCOME = 100
    RESULT = {o_INCOME_LEVEL_2_SEGMENT$70k - $100k,o_INCOME_LEVEL_2_SEGMENT_ORD4}
    break;   
    case I_CLIENT_INCOME  100  && I_CLIENT_INCOME = 200
    RESULT = {o_INCOME_LEVEL_2_SEGMENT$70k - $100k,o_INCOME_LEVEL_2_SEGMENT_ORD5}
    break; 
    case I_CLIENT_INCOME  200  && I_CLIENT_INCOME = 300
    RESULT = {o_INCOME_LEVEL_2_SEGMENT$200k - $300k,o_INCOME_LEVEL_2_SEGMENT_ORD6}
    break;    
   case I_CLIENT_INCOME  300
    RESULT = {o_INCOME_LEVEL_2_SEGMENT$200k - $300k,o_INCOME_LEVEL_2_SEGMENT_ORD7}
    break; 
  default
    RESULT = {o_INCOME_LEVEL_2_SEGMENTUnknown,o_INCOME_LEVEL_2_SEGMENT_ORD8}
}   
  return RESULT;
';
CREATE OR REPLACE PROCEDURE SP_CONV_BR_ALL_CLIENTS_002(I_CLIENT_INCOME FLOAT)
RETURNS VARIANT
LANGUAGE JAVASCRIPT
EXECUTE AS OWNER
AS '
  
 var  RESULT = null;
 switch(true) {
    case I_CLIENT_INCOME == -1 
    RESULT = {o_INCOME_LEVEL_1_SEGMENTUnknown,o_INCOME_LEVEL_1_SEGMENT_ORD5}
    break;
  case I_CLIENT_INCOME = 30
    RESULT = {o_INCOME_LEVEL_1_SEGMENTLower,o_INCOME_LEVEL_1_SEGMENT_ORD1}
    break;  
   case I_CLIENT_INCOME  30  && I_CLIENT_INCOME = 70
    RESULT = {o_INCOME_LEVEL_1_SEGMENTMiddle,o_INCOME_LEVEL_1_SEGMENT_ORD2}
    break;    
  case I_CLIENT_INCOME  70  && I_CLIENT_INCOME = 200
    RESULT = {o_INCOME_LEVEL_1_SEGMENTUpper,o_INCOME_LEVEL_1_SEGMENT_ORD3}
    break;  
   case I_CLIENT_INCOME  200
    RESULT = {o_INCOME_LEVEL_1_SEGMENTHigh,o_INCOME_LEVEL_1_SEGMENT_ORD4}
    break; 
  default
    RESULT = {o_INCOME_LEVEL_1_SEGMENTUnknown,o_INCOME_LEVEL_1_SEGMENT_ORD5}
}   
  return RESULT;
';
CREATE OR REPLACE PROCEDURE SP_CONV_BR_ALL_CLIENTS_003(I_CLIENTDATEOFBIRTH VARCHAR(29), I_ASOFDATE VARCHAR(29), I_IS_CORPORATION BOOLEAN)
RETURNS VARIANT
LANGUAGE JAVASCRIPT
EXECUTE AS OWNER
AS '
  
  if (I_IS_CORPORATION  == null  && I_CLIENTDATEOFBIRTH == null)
   {
    return {o_AGE_SEGMENTUnknown,o_AGE_SEGMENT_ORD8};
    }
  if (I_IS_CORPORATION)
  {
    return {o_AGE_SEGMENT''Corporate'',o_AGE_SEGMENT_ORD9};
  }
  var RESULT = {};
  var d1 = new Date(I_CLIENTDATEOFBIRTH);   
  var d2 = new Date(I_ASOFDATE);  
  var diff = d2.getTime() - d1.getTime();
  var year_diff = Math.floor((diff  (1000  60  60  24))365.25);    
  
 switch(true) {
    case year_diff  25 
    RESULT = {o_AGE_SEGMENTUnder 25,o_AGE_SEGMENT_ORD1}
    break;
  case year_diff = 25 && year_diff  35
    RESULT = {o_AGE_SEGMENT25-34,o_AGE_SEGMENT_ORD2}
    break;  
   case year_diff = 35 && year_diff  45
    RESULT = {o_AGE_SEGMENT35-44,o_AGE_SEGMENT_ORD3}
    break;    
  case year_diff = 45 && year_diff  55
    RESULT = {o_AGE_SEGMENT45-54,o_AGE_SEGMENT_ORD4}
    break;  
   case year_diff = 55 && year_diff  65
    RESULT = {o_AGE_SEGMENT55-64,o_AGE_SEGMENT_ORD5}
    break; 
   case year_diff = 65 && year_diff  75
    RESULT = {o_AGE_SEGMENT65-74,o_AGE_SEGMENT_ORD6}
    break; 
   case year_diff = 75
    RESULT = {o_AGE_SEGMENTOver 75,o_AGE_SEGMENT_ORD7}
    break;    
  default
    RESULT = {o_AGE_SEGMENTUnknown,o_AGE_SEGMENT_ORD8}
}   
  return RESULT;
';
CREATE OR REPLACE PROCEDURE SP_CONV_BR_ALL_CLIENTS_PROVINCE_005(I_COUNTRY_CODE VARCHAR(10), I_PROVINCE_CODE VARCHAR(10))
RETURNS VARCHAR(16777216)
LANGUAGE JAVASCRIPT
EXECUTE AS OWNER
AS '  
  
  var RESULT = {}
  if (I_COUNTRY_CODE  != CAN && I_PROVINCE_CODE != null )
  {
   return ''Outside Canada'';
  }
 switch(true) {
    case I_PROVINCE_CODE == SK 
    RESULT =  Saskatchewan;
    break;
    case I_PROVINCE_CODE == MB 
    RESULT =  Manitoba;
    break;
    case I_PROVINCE_CODE == NS 
    RESULT =  Nova Scotia;
    break;
    case I_PROVINCE_CODE == NL 
    RESULT =  Newfoundland and Labrador;
    break;
    case I_PROVINCE_CODE == PE 
    RESULT =  Prince Edward Island;
    break;
    case I_PROVINCE_CODE == QC 
    RESULT =  Quebec;
    break;
    case I_PROVINCE_CODE == ON 
    RESULT =  Ontario;
    break;
    case I_PROVINCE_CODE == BC 
    RESULT =  British Columbia;
    break;
    case I_PROVINCE_CODE == NB 
    RESULT =  New Brunswick;
    break;
    case I_PROVINCE_CODE == AB 
    RESULT =  Alberta;
    break;
    case I_PROVINCE_CODE == NT 
    RESULT =  Northwest Territories;
    break;
    case I_PROVINCE_CODE == YT 
    RESULT =  Yukon;
    break;
    case I_PROVINCE_CODE == NU 
    RESULT =  Nunavut; 
    break;
  default
    RESULT = Unknown
}   
  return RESULT;
';
CREATE OR REPLACE PROCEDURE SP_CONV_BR_ALL_CLIENT_AUA_SEGMENTATION_002(I_CLIENT_SUM_AUA FLOAT)
RETURNS VARIANT
LANGUAGE JAVASCRIPT
EXECUTE AS OWNER
AS '  
  
  var RESULT = {}
 switch(true) {
    case I_CLIENT_SUM_AUA  25000 
    RESULT = {o_CLIENT_AUA_SEGMENT25k,o_CLIENT_AUA_SEGMENT_ORDER1}
    break;
  case I_CLIENT_SUM_AUA =25000 &&  I_CLIENT_SUM_AUA = 100000 
    RESULT = {o_CLIENT_AUA_SEGMENT25k-100k,o_CLIENT_AUA_SEGMENT_ORDER2}
    break;  
   case I_CLIENT_SUM_AUA =100000 &&  I_CLIENT_SUM_AUA = 250000
   RESULT = {o_CLIENT_AUA_SEGMENT100k-250k,o_CLIENT_AUA_SEGMENT_ORDER3}
    break;    
   case I_CLIENT_SUM_AUA =250000 &&  I_CLIENT_SUM_AUA = 500000 
    RESULT = {o_CLIENT_AUA_SEGMENT250k-500k,o_CLIENT_AUA_SEGMENT_ORDER4}
    break;  
    case I_CLIENT_SUM_AUA  500000
    RESULT = {o_CLIENT_AUA_SEGMENT 500k,o_CLIENT_AUA_SEGMENT_ORDER5}
    break; 
   
  default
    RESULT = {o_CLIENT_AUA_SEGMENTUnknown,o_CLIENT_AUA_SEGMENT_ORDER6}
}   
  return RESULT;
';
CREATE OR REPLACE PROCEDURE SP_CONV_BR_ALL_FINANCIA_INSTRUMENTS_CATEGORY_001(I_ASSET_CATEGORY VARCHAR(100), I_DESCRIPTION_EN VARCHAR(100))
RETURNS VARCHAR(100)
LANGUAGE JAVASCRIPT
EXECUTE AS OWNER
AS '  
  
 var  RESULT  = ;
 switch(true) {
   case  [Mutual Fund,  Mutual Funds].includes(I_DESCRIPTION_EN)
        RESULT = Mutual Funds;
    break; 
   case  I_DESCRIPTION_EN == Fixed Income Securities
        RESULT = Fixed Income;
    break; 
  case  [Bonds,  Conv. Marginable Security,StripBonds,StripCoupons].includes(I_ASSET_CATEGORY)
        RESULT = Fixed Income;
    break;  
   case  [Call - Stock Option,Option Eligible].includes(I_ASSET_CATEGORY)
        RESULT = Options;
    break;  
   case  [Common Stock,  Unit without Debt].includes(I_ASSET_CATEGORY)
        RESULT = Equities;
    break;   
   case I_ASSET_CATEGORY == Mutual Funds
         RESULT = Mutual Funds;
    break;    
   default
     RESULT = I_DESCRIPTION_EN
}   
  return RESULT;
';
CREATE OR REPLACE PROCEDURE SP_CONV_BR_UNIVERIS_CLIENTS_AGE_SEGMENTATION_008(I_CLIENTDATEOFBIRTH VARCHAR(29), I_ASOFDATE VARCHAR(29), I_CORP_CD VARCHAR(16777216))
RETURNS VARIANT
LANGUAGE JAVASCRIPT
EXECUTE AS OWNER
AS '
  
  if ((I_CORP_CD  == null  I_CORP_CD  != ''C'') && I_CLIENTDATEOFBIRTH == null)
   {
    return {o_AGE_SEGMENTUnknown,o_AGE_SEGMENT_ORD8};
    }
  if (I_CORP_CD == ''C'')
  {
    return {o_AGE_SEGMENT''Corporate'',o_AGE_SEGMENT_ORD9};
  }
  var RESULT = {o_AGE_SEGMENTUnknown,o_AGE_SEGMENT_ORD6}
  var d1 = new Date(I_CLIENTDATEOFBIRTH);   
  var d2 = new Date(I_ASOFDATE);  
  var diff = d2.getTime() - d1.getTime();
  var year_diff = Math.floor((diff  (1000  60  60  24))365.25);    
  
 switch(true) {
    case year_diff  25 
    RESULT = {o_AGE_SEGMENTUnder 25,o_AGE_SEGMENT_ORD1}
    break;
  case year_diff = 25 && year_diff  35
    RESULT = {o_AGE_SEGMENT25-34,o_AGE_SEGMENT_ORD2}
    break;  
   case year_diff = 35 && year_diff  45
    RESULT = {o_AGE_SEGMENT35-44,o_AGE_SEGMENT_ORD3}
    break;    
  case year_diff = 45 && year_diff  55
    RESULT = {o_AGE_SEGMENT45-54,o_AGE_SEGMENT_ORD4}
    break;  
   case year_diff = 55 && year_diff  65
    RESULT = {o_AGE_SEGMENT55-64,o_AGE_SEGMENT_ORD5}
    break; 
   case year_diff = 65 && year_diff  75
    RESULT = {o_AGE_SEGMENT65-74,o_AGE_SEGMENT_ORD6}
    break; 
   case year_diff = 75
    RESULT = {o_AGE_SEGMENTOver 75,o_AGE_SEGMENT_ORD7}
    break;    
  default
    RESULT = {o_AGE_SEGMENTUnknown,o_AGE_SEGMENT_ORD8}
}   
  return RESULT;
';
CREATE OR REPLACE PROCEDURE SP_CONV_BR_UNIVERIS_CLIENTS_INCOME_SEGMENTATION_006(I_SALARY_DESC VARCHAR(100))
RETURNS VARIANT
LANGUAGE JAVASCRIPT
EXECUTE AS OWNER
AS '
  
  
  var RESULT = {}
 switch(true) {
    case I_SALARY_DESC === Less or Equal to $30,000 
    RESULT = {o_IncomeSegmentation($30k),o_IncomeSegmentation_Ord1}
    break;
  case I_SALARY_DESC === $30,001 to $50,000
    RESULT = {o_IncomeSegmentation$30k - $50k,o_IncomeSegmentation_Ord2}
    break;  
   case I_SALARY_DESC === $50,001 to $70,000
   RESULT = {o_IncomeSegmentation$50k - $70k,o_IncomeSegmentation_Ord3}
    break;    
   case I_SALARY_DESC === $70,001 to $100,000
    RESULT = {o_IncomeSegmentation$70k - $100k,o_IncomeSegmentation_Ord4}
    break;  
    case I_SALARY_DESC === $100,001 to $200,000
    RESULT = {o_IncomeSegmentation$100k - $200k,o_IncomeSegmentation_Ord5}
    break; 
   case I_SALARY_DESC === $200,001 to 300,000
   RESULT = {o_IncomeSegmentation$200k - $300k,o_IncomeSegmentation_Ord6}
    break; 
   case I_SALARY_DESC === Greater or Equal to $300,001  I_SALARY_DESC === More or Equal to $300,001
    RESULT = {o_IncomeSegmentation$300k+,o_IncomeSegmentation_Ord7}
    break;    
  default
    RESULT = {o_AGE_SEGMENTUnknown,o_AGE_SEGMENT_ORD8}
}   
  return RESULT;
';
CREATE OR REPLACE PROCEDURE SP_CONV_BR_UNIVERIS_CLIENTS_SALARY_SEGMENTATION_007(I_SALARY_DESC VARCHAR(100))
RETURNS VARIANT
LANGUAGE JAVASCRIPT
EXECUTE AS OWNER
AS '
  
  
  var RESULT = {}
 switch(true) {
    case I_SALARY_DESC === Less or Equal to $30,000 
    RESULT = {o_SalarySegmentationLower,o_SalarySegmentation_Ord1}
    break;
  case I_SALARY_DESC === $30,001 to $50,000  I_SALARY_DESC === $50,001 to $70,000
    RESULT = {o_SalarySegmentationMiddle,o_SalarySegmentation_Ord2};
    break;
   case I_SALARY_DESC === $70,001 to $100,000   I_SALARY_DESC === $100,001 to $200,000
    RESULT = {o_SalarySegmentationUpper,o_SalarySegmentation_Ord3}
    break;  
    case I_SALARY_DESC === $200,001 to 300,000  I_SALARY_DESC === Greater or Equal to $300,001  I_SALARY_DESC === More or Equal to $300,001
   RESULT = {o_SalarySegmentationHigh,o_SalarySegmentation_Ord4}
    break; 
   default
    RESULT = {o_SalarySegmentationUnknown,o_SalarySegmentation_Ord5}
}   
  return RESULT;
';
CREATE OR REPLACE PROCEDURE SP_CONV_BR_UNIVERIS_TRANSACTIONS_TRANSACTION_TYPE_001(I_SPR_CTGY VARCHAR(100), I_TRX_MNEM_ENG VARCHAR(100))
RETURNS VARIANT
LANGUAGE JAVASCRIPT
EXECUTE AS OWNER
AS '  
  
 var  RESULT  = {};
 switch(true) {
   case  I_SPR_CTGY == PUR
        RESULT = {o_TRANSACTION_TYPEPurchases,o_ORD_TRANSACTION_TYPE1};
    break; 
   case  I_SPR_CTGY == RED
        RESULT = {o_TRANSACTION_TYPERedemptions,o_ORD_TRANSACTION_TYPE2};
    break; 
   case  I_TRX_MNEM_ENG.indexOf(SWI) = 0
        RESULT = {o_TRANSACTION_TYPESwitch In,o_ORD_TRANSACTION_TYPE3};
    break; 
   case  I_TRX_MNEM_ENG.indexOf(SWO) = 0
        RESULT = {o_TRANSACTION_TYPESwitch Out,o_ORD_TRANSACTION_TYPE4};
    break;  
  case  I_TRX_MNEM_ENG.indexOf(TIN) = 0
        RESULT = {o_TRANSACTION_TYPETransfer In,o_ORD_TRANSACTION_TYPE5};
    break;  
   case  I_TRX_MNEM_ENG.indexOf(TOT) = 0
        RESULT = {o_TRANSACTION_TYPETransfer Out,o_ORD_TRANSACTION_TYPE6};
    break;  
   case  I_TRX_MNEM_ENG.indexOf(XIN) = 0 I_TRX_MNEM_ENG.indexOf(DXI) = 0 
        RESULT = {o_TRANSACTION_TYPEExternal Transfer In,o_ORD_TRANSACTION_TYPE7};
    break;  
   case  I_TRX_MNEM_ENG.indexOf(XOT) = 0 I_TRX_MNEM_ENG.indexOf(DXO) = 0 
        RESULT = {o_TRANSACTION_TYPEExternal Transfer Out,o_ORD_TRANSACTION_TYPE8};
    break;  
   default
     RESULT = {o_TRANSACTION_TYPEOthers,o_ORD_TRANSACTION_TYPE9};
}   
  return RESULT;
';
CREATE OR REPLACE PROCEDURE SP_CONV_MPLT_BR_ALL_CLIENTS_004(I_ASOFDATE VARCHAR(29), I_CLIENT_CONTRACT_START_DATE VARCHAR(29))
RETURNS VARCHAR(16777216)
LANGUAGE JAVASCRIPT
EXECUTE AS OWNER
AS '  
 var  RESULT = ;
 if (I_ASOFDATE == null  I_CLIENT_CONTRACT_START_DATE == null)
 
    return Unknown;
  
    else 
   
   (I_ASOFDATE === I_CLIENT_CONTRACT_START_DATE)RESULT = YesRESULT = No  ;
  
   return RESULT;
';
CREATE OR REPLACE FUNCTION UDF_CONV_BR_UNIVERIS_TRANSACTIONS_CASH_FLOW_002(I_TRX_MNEM_ENG VARCHAR(100))
RETURNS VARCHAR(100)
LANGUAGE JAVASCRIPT
AS '  
  return   I_TRX_MNEM_ENG.indexOf(XIN) = 0 I_TRX_MNEM_ENG.indexOf(DXI) = 0  I_TRX_MNEM_ENG.indexOf(XOT) = 0 I_TRX_MNEM_ENG.indexOf(DXO) = 0 YesNo;
 
';
CREATE OR REPLACE FUNCTION UDF_CONV_BR_UNIVERIS_TRANSACTIONS_CASH_FLOW_003(I_TRX_MNEM_ENG VARCHAR(100), I_GROSS_AMOUNT FLOAT)
RETURNS VARCHAR(100)
LANGUAGE JAVASCRIPT
AS ' 
  RESULT = OTHER;
  if (I_TRX_MNEM_ENG.indexOf(XIN) = 0 I_TRX_MNEM_ENG.indexOf(DXI) = 0  I_TRX_MNEM_ENG.indexOf(XOT) = 0 I_TRX_MNEM_ENG.indexOf(DXO) = 0)
   {
     if (I_GROSS_AMOUNT  = 0)
      
       RESULT = IN FLOW;
       
    else  
       RESULT = OUT FLOW;
   }
  return   RESULT;
 
';
CREATE OR REPLACE FUNCTION UDF_CONV_BR_UNIVERIS_TRANSACTIONS_TRANSACTION_TYPE_001(I_SPR_CTGY VARCHAR(100), I_TRX_MNEM_ENG VARCHAR(100))
RETURNS OBJECT
LANGUAGE JAVASCRIPT
AS '  
  
 var  RESULT  = {};
 switch(true) {
   case  I_SPR_CTGY == PUR
        RESULT = {o_TRANSACTION_TYPEPurchases,o_ORD_TRANSACTION_TYPE1};
    break; 
   case  I_SPR_CTGY == RED
        RESULT = {o_TRANSACTION_TYPERedemptions,o_ORD_TRANSACTION_TYPE2};
    break; 
   case  I_TRX_MNEM_ENG.indexOf(SWI) = 0
        RESULT = {o_TRANSACTION_TYPESwitch In,o_ORD_TRANSACTION_TYPE3};
    break; 
   case  I_TRX_MNEM_ENG.indexOf(SWO) = 0
        RESULT = {o_TRANSACTION_TYPESwitch Out,o_ORD_TRANSACTION_TYPE4};
    break;  
  case  I_TRX_MNEM_ENG.indexOf(TIN) = 0
        RESULT = {o_TRANSACTION_TYPETransfer In,o_ORD_TRANSACTION_TYPE5};
    break;  
   case  I_TRX_MNEM_ENG.indexOf(TOT) = 0
        RESULT = {o_TRANSACTION_TYPETransfer Out,o_ORD_TRANSACTION_TYPE6};
    break;  
   case  I_TRX_MNEM_ENG.indexOf(XIN) = 0 I_TRX_MNEM_ENG.indexOf(DXI) = 0 
        RESULT = {o_TRANSACTION_TYPEExternal Transfer In,o_ORD_TRANSACTION_TYPE7};
    break;  
   case  I_TRX_MNEM_ENG.indexOf(XOT) = 0 I_TRX_MNEM_ENG.indexOf(DXO) = 0 
        RESULT = {o_TRANSACTION_TYPEExternal Transfer Out,o_ORD_TRANSACTION_TYPE8};
    break;  
   default
     RESULT = {o_TRANSACTION_TYPEOthers,o_ORD_TRANSACTION_TYPE9};
}   
  return RESULT;
';