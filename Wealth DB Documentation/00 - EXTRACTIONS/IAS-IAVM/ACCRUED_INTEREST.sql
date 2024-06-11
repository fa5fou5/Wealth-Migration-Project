SELECT
PS.processDate,
REPLACE(REPLACE(PS.productCode, CHAR(13), ''), CHAR(10), '') AS productCode,
REPLACE(REPLACE(PS.fiId, CHAR(13), ''), CHAR(10), '') AS fiId,
REPLACE(REPLACE(PS.cusip, CHAR(13), ''), CHAR(10), '') AS cusip,
REPLACE(REPLACE(PS.isin, CHAR(13), ''), CHAR(10), '') AS isin,
REPLACE(REPLACE(PS.market, CHAR(13), ''), CHAR(10), '') AS market,
REPLACE(REPLACE(PS.symbol, CHAR(13), ''), CHAR(10), '') AS symbol,
CAST(PS.interestRate as CHAR) as interestRate,
REPLACE(REPLACE(PS.accruedInterestMethod1, CHAR(13), ''), CHAR(10), '') AS accruedInterestMethod1,
REPLACE(REPLACE(PS.accruedInterestMethod2, CHAR(13), ''), CHAR(10), '') AS accruedInterestMethod2,
REPLACE(REPLACE(PS.dailyCountBasis, CHAR(13), ''), CHAR(10), '') AS dailyCountBasis,PS.interestStartDate,
CAST(PS.yearFraction as CHAR) as yearFraction,
CAST(PS.baseAccruedInterest as CHAR) as baseAccruedInterest,
CURDATE() AS MD_LOADDATE,
'IAS' AS MD_SRCSYSTEM
FROM IAVM.accruedInterest PS
where PS.processDate = SUBDATE(CURDATE(),1)