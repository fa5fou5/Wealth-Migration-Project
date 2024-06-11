
select distinct 
   accountId,
   unitOfMeasure,
   price, 
   symbol, 
   market,
   processDate,
   closePrice,
   priceCurrency,
   bidPrice,
   askPrice,
   SUBDATE(CURDATE(), 1) AS MD_LOADDATE,
   'IAS' AS MD_SRCSYSTEM
   from IAVM.position
   where  symbol != '' AND
    processDate = SUBDATE(CURDATE(), 1)