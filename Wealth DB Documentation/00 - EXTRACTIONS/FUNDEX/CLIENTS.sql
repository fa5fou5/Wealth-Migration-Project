SELECT [IVR].[IVR_SYSID], 
       [IVR].[REP_SYSID],
       NULLIF(REPLACE(REPLACE(REPLACE([S_RECIPIENT].[RECIPIENT_DESC_ENG], CHAR(13), ''), CHAR(10), ''),'|','\|'), '') AS [RECIPIENT_DESC_ENG], 
       NULLIF(REPLACE(REPLACE(REPLACE([S_RECIPIENT].[RECIPIENT_DESC_FRE], CHAR(13), ''), CHAR(10), ''),'|','\|'), '') AS [RECIPIENT_DESC_FRE],
       NULLIF(REPLACE(REPLACE(REPLACE([S_RECIPIENT].[CORP_CD], CHAR(13), ''), CHAR(10), ''),'|','\|'), '') AS [CORP_CD],	   
       NULLIF(REPLACE(REPLACE(REPLACE([S_IVR_STATUS].[IVR_ST_NAME_ENG], CHAR(13), ''), CHAR(10), ''),'|','\|'), '') AS [IVR_ST_NAME_ENG], 
       NULLIF(REPLACE(REPLACE(REPLACE([S_IVR_STATUS].[IVR_ST_NAME_FRE], CHAR(13), ''), CHAR(10), ''),'|','\|'), '') AS [IVR_ST_NAME_FRE], 
       /*CONVERT(VARCHAR(64),HASHBYTES('SHA2_256', CONVERT(VARCHAR(11), COALESCE([IVR].[IVR_PRIM_SIN],'')) + '|' + 'iA Wealth'),2) AS [IVR_PRIM_SIN_HASH], */
       NULLIF(REPLACE(REPLACE(REPLACE([IVR].[IVR_REG_2], CHAR(13), ''), CHAR(10), ''),'|','\|'), '') AS [IVR_REG_2], 
       /*NULLIF(REPLACE(REPLACE(REPLACE([IVR].[IVR_SORT_NAME], CHAR(13), ''), CHAR(10), ''),'|','\|'), '') AS [IVR_SORT_NAME], 
       NULLIF(REPLACE(REPLACE(REPLACE([IVR].[IVR_BNFL_LNAME], CHAR(13), ''), CHAR(10), ''),'|','\|'), '') AS [IVR_BNFL_LNAME], 
       NULLIF(REPLACE(REPLACE(REPLACE([IVR].[IVR_BNFL_FNAME], CHAR(13), ''), CHAR(10), ''),'|','\|'), '') AS [IVR_BNFL_FNAME], 
       NULLIF(REPLACE(REPLACE(REPLACE([IVR].[IVR_SHRT_NAME], CHAR(13), ''), CHAR(10), ''),'|','\|'), '') AS [IVR_SHRT_NAME], */
       NULLIF(REPLACE(REPLACE(REPLACE([IVR].[LANG_CD], CHAR(13), ''), CHAR(10), ''),'|','\|'), '') AS [LANG_CD], 
       NULLIF(REPLACE(REPLACE(REPLACE([IVR].[IVR_RES_CD], CHAR(13), ''), CHAR(10), ''),'|','\|'), '') AS [IVR_RES_CD], 
       [IVR].[IVR_SETUP_DT], 
       [IVR].[IVR_STOP_DT], 
       NULLIF(REPLACE(REPLACE(REPLACE([IVR].[IVR_FRGN_CTNT], CHAR(13), ''), CHAR(10), ''),'|','\|'), '') AS [IVR_FRGN_CTNT], 
       /*NULLIF(REPLACE(REPLACE(REPLACE([IVR].[IVR_PIN], CHAR(13), ''), CHAR(10), ''),'|','\|'), '') AS [IVR_PIN], */
       [IVR].[IVR_HOLD_MAIL], 
       [IVR].[IVR_INC_ADR], 
       NULLIF(REPLACE(REPLACE(REPLACE([IVR].[IVR_STMT_FREQ], CHAR(13), ''), CHAR(10), ''),'|','\|'), '') AS [IVR_STMT_FREQ], 
       NULLIF(REPLACE(REPLACE(REPLACE([IVR].[IVR_STMT_TYPE], CHAR(13), ''), CHAR(10), ''),'|','\|'), '') AS [IVR_STMT_TYPE], 
       [IVR].[IVR_STMT_DT], 
       NULLIF(REPLACE(REPLACE(REPLACE([IVR].[IVR_OLD_DLR], CHAR(13), ''), CHAR(10), ''),'|','\|'), '') AS [IVR_OLD_DLR], 
       COALESCE([S_SALARY].[SALARY_DESC],'Unknown') AS [SALARY_DESC],
       [IVR].[IVR_KYC_DT], 
	   /*[IVR_PRIM_BDT],*/
	   DATEFROMPARTS (YEAR([IVR_PRIM_BDT]),MONTH([IVR_PRIM_BDT]),1) AS [IVR_PRIM_BDT],
       /*NULLIF(REPLACE(REPLACE(REPLACE([IVR].[OWNER_ENG], CHAR(13), ''), CHAR(10), ''),'|','\|'), '') AS [OWNER_ENG], 
       NULLIF(REPLACE(REPLACE(REPLACE([IVR].[OWNER_FRE], CHAR(13), ''), CHAR(10), ''),'|','\|'), '') AS [OWNER_FRE]*/
	   CONVERT(DATE, GETDATE()) AS MD_LOADDATE,
	   'FUNDEX-UNIVERIS' AS MD_SRCSYSTEM,
	   CREATE_DT
FROM [dbo].[IVR] (nolock)
     LEFT OUTER JOIN [dbo].[S_RECIPIENT] (nolock) ON [S_RECIPIENT].[RECIPIENT_CD] = [IVR].[RECIPIENT_CD]
     LEFT OUTER JOIN [dbo].[S_IVR_STATUS] (nolock) ON [S_IVR_STATUS].[IVR_STATUS] = [IVR].[IVR_STATUS]
     LEFT OUTER JOIN [dbo].[KYC] (nolock) ON [KYC].[IVR_SYSID]=[IVR].[IVR_SYSID]
     LEFT OUTER JOIN [dbo].[S_SALARY] (nolock) ON [KYC].[SALARY_CD]=[S_SALARY].[SALARY_CD]
ORDER BY [IVR].[IVR_SYSID]
;

