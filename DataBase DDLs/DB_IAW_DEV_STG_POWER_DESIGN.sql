create database DB_IAW_DEV_STG
    data_retention_time_in_days = 30;

create transient table IAPW_PORTAL_API.ACCOUNTS_CLIENTS_SUMMARY
(
    MD_START_DT    TIMESTAMPNTZ comment 'Start Date of the image/version',
    MD_SOURCE      VARCHAR(1000) comment 'Represents the source system, file, etc. of the instance',
    MD_CREATION_DT TIMESTAMPNTZ default CURRENT_TIMESTAMP() comment 'Creation Date Time of the occurrence',
    MD_SRC_SYSTEM  VARCHAR(100) comment 'Source system',
    MD_EXTRACT_DT  TIMESTAMPNTZ comment 'Source extraction date',
    CONTENT        VARIANT comment 'Json content'
)
    data_retention_time_in_days = 1;

create transient table IAPW_PORTAL_API.ACCOUNTS_CLIENTS_SUMMARY_RVP
(
    MD_START_DT    TIMESTAMPNTZ comment 'Start Date of the image/version',
    MD_SOURCE      VARCHAR(1000) comment 'Represents the source system, file, etc. of the instance',
    MD_CREATION_DT TIMESTAMPNTZ default CURRENT_TIMESTAMP() comment 'Creation Date Time of the occurrence',
    MD_SRC_SYSTEM  VARCHAR(100) comment 'Source system',
    MD_EXTRACT_DT  TIMESTAMPNTZ comment 'Source extraction date',
    RVPID          NUMBER(10) comment 'RVP ID',
    CONTENT        VARIANT comment 'Json content'
)
    data_retention_time_in_days = 1;

create transient table INVESTIA.ACCOUNT_HOLDER
(
    HK_HUB             VARCHAR(64) comment 'Hash key for the Hub',
    MD_START_DT        TIMESTAMPNTZ comment 'Start Date of the image/version',
    MD_HASHDIFF        VARCHAR(64) comment 'Represents the whole set of hashed attributes to be historized for an occurrence',
    MD_CREATION_DT     TIMESTAMPNTZ comment 'Creation Date Time of the occurrence',
    MD_SOURCE          VARCHAR(1000) comment 'Represents the source system, file, etc. of the instance',
    MD_SRC_SYSTEM      VARCHAR(100) comment 'Source system',
    MD_EXTRACT_DT      TIMESTAMPNTZ comment 'Source extraction date',
    IVR_SYSID          NUMBER comment 'Unique system generated code for investor identification',
    REP_SYSID          NUMBER comment 'Rep SYSID, to reference with the Advisor data',
    RECIPIENT_DESC_ENG VARCHAR(30) comment 'Investor type description English(Individual, Joint WROS, etc)',
    RECIPIENT_DESC_FRE VARCHAR(50) comment 'Investor type description French(Individuel, CADDS, etc)',
    CORP_CD            VARCHAR(30) comment 'Wether it is corporate',
    IVR_ST_NAME_ENG    VARCHAR(40) comment 'Investor status description English(Active, Closed, etc)',
    IVR_ST_NAME_FRE    VARCHAR(40) comment 'Investor status description French (Actif, Fermé, etc)',
    IVR_REG_2          VARCHAR(80) comment 'Investor Other/Corporate name',
    LANG_CD            VARCHAR(1) comment 'Investor language code for English or French reference on S_LANG',
    IVR_RES_CD         VARCHAR(18) comment 'Investor residence code—if Canadian name of the province',
    IVR_SETUP_DT       TIMESTAMPNTZ comment 'Date on which this record was set up',
    IVR_STOP_DT        TIMESTAMPNTZ comment 'Date of closing the account',
    IVR_FRGN_CTNT      BOOLEAN comment 'Check for foreign content',
    IVR_HOLD_MAIL      BOOLEAN comment 'Check for holding mail',
    IVR_INC_ADR        BOOLEAN comment 'Check for incomplete address',
    IVR_STMT_FREQ      VARCHAR(1) comment 'Statement frequency reference on S_FRENQUENCY',
    IVR_STMT_TYPE      VARCHAR(2) comment 'Statement type',
    IVR_STMT_DT        TIMESTAMPNTZ comment 'Statement date',
    IVR_OLD_DLR        VARCHAR(5) comment 'Previous dealer',
    SALARY_DESC        VARCHAR(40) comment 'Client income segment',
    IVR_KYC_DT         TIMESTAMPNTZ comment 'Date KYC information keyed in',
    IVR_PRIM_BDT       DATE comment 'Date of birth is not corporate',
    CREATE_DT          DATE comment 'Create Date'
)
    data_retention_time_in_days = 1;

create transient table IAS.ACCOUNT_HOLDER
(
    HK_HUB                    VARCHAR(40) comment 'Hash of the business keys',
    MD_START_DT               TIMESTAMPNTZ comment 'Start Date of the image/version',
    MD_HASHDIFF               VARCHAR(64) comment 'Represents the whole set of hashed attributes to be historized for an occurrence',
    MD_CREATION_DT            TIMESTAMPNTZ comment 'Creation Date Time of the occurrence',
    MD_SOURCE                 VARCHAR(1000) comment 'Represents the source system, file, etc. of the instance',
    MD_SRC_SYSTEM             VARCHAR(100) comment 'Source system',
    MD_EXTRACT_DT             TIMESTAMPNTZ comment 'Extraction date of the occurrence',
    A_C_CLIENT                VARCHAR(100) comment 'Client ID',
    SIN_HASH                  VARCHAR(64) comment 'SIN Hash',
    CLIENT_BIRTH_DATE         DATE comment 'Client birth date',
    CLIENT_TAX_RECIP_TYPE     VARCHAR(10) comment 'Tax recipient type : 1 - Individual, 2 - Joint, 3 - Corporation, ...',
    CLIENT_RESIDENCE          VARCHAR(50) comment 'Client residence country',
    CLIENT_RESIDENCE_REGION   VARCHAR(50) comment 'Client residence province',
    CLIENT_ANNUAL_GROSS_INC   VARCHAR(10) comment 'Annual gross income',
    CLIENT_INIT_CONTRACT_DATE DATE comment 'Initial contrat date',
    CLIENT_INV_KNOWLEDGE_LVL  VARCHAR(1) comment 'Clients Investment Knowledge Level',
    A_C_NAME                  VARCHAR(1000) comment 'A_C_NAME',
    A_C_FIRST_NAME            VARCHAR(1000) comment 'A_C_FIRST_NAME',
    A_C_MIDDLE_NAME           VARCHAR(1000) comment 'A_C_MIDDLE_NAME',
    A_C_LAST_NAME             VARCHAR(1000) comment 'A_C_LAST_NAME',
    CLIENT_FIRST_NAME         VARCHAR(1000) comment 'CLIENT_FIRST_NAME',
    CLIENT_LAST_NAME          VARCHAR(1000) comment 'CLIENT_LAST_NAME'
)
    data_retention_time_in_days = 1;

create transient table IAS_UNIVERIS.ACCOUNT_HOLDER
(
    HK_HUB             VARCHAR(64) comment 'Hash key for the Hub',
    MD_START_DT        TIMESTAMPNTZ comment 'Start Date of the image/version',
    MD_HASHDIFF        VARCHAR(64) comment 'Represents the whole set of hashed attributes to be historized for an occurrence',
    MD_CREATION_DT     TIMESTAMPNTZ comment 'Creation Date Time of the occurrence',
    MD_SOURCE          VARCHAR(1000) comment 'Represents the source system, file, etc. of the instance',
    MD_SRC_SYSTEM      VARCHAR(100) comment 'Source system',
    MD_EXTRACT_DT      TIMESTAMPNTZ comment 'Source extraction date',
    IVR_SYSID          NUMBER comment 'Unique system generated code for investor identification',
    REP_SYSID          NUMBER comment 'Rep SYSID, to reference with the Advisor data',
    RECIPIENT_DESC_ENG VARCHAR(30) comment 'Investor type description English(Individual, Joint WROS, etc)',
    RECIPIENT_DESC_FRE VARCHAR(50) comment 'Investor type description French(Individuel, CADDS, etc)',
    CORP_CD            VARCHAR(30) comment 'Wether it is corporate',
    IVR_ST_NAME_ENG    VARCHAR(40) comment 'Investor status description English(Active, Closed, etc)',
    IVR_ST_NAME_FRE    VARCHAR(40) comment 'Investor status description French (Actif, Fermé, etc)',
    IVR_REG_2          VARCHAR(80) comment 'Investor Other/Corporate name',
    LANG_CD            VARCHAR(1) comment 'Investor language code for English or French reference on S_LANG',
    IVR_RES_CD         VARCHAR(18) comment 'Investor residence code—if Canadian name of the province',
    IVR_SETUP_DT       TIMESTAMPNTZ comment 'Date on which this record was set up',
    IVR_STOP_DT        TIMESTAMPNTZ comment 'Date of closing the account',
    IVR_FRGN_CTNT      BOOLEAN comment 'Check for foreign content',
    IVR_HOLD_MAIL      BOOLEAN comment 'Check for holding mail',
    IVR_INC_ADR        BOOLEAN comment 'Check for incomplete address',
    IVR_STMT_FREQ      VARCHAR(1) comment 'Statement frequency reference on S_FRENQUENCY',
    IVR_STMT_TYPE      VARCHAR(2) comment 'Statement type',
    IVR_STMT_DT        TIMESTAMPNTZ comment 'Statement date',
    IVR_OLD_DLR        VARCHAR(5) comment 'Previous dealer',
    SALARY_DESC        VARCHAR(40) comment 'Client income segment',
    IVR_KYC_DT         TIMESTAMPNTZ comment 'Date KYC information keyed in',
    IVR_PRIM_BDT       DATE comment 'Date of birth is not corporate',
    CREATE_DT          DATE comment 'Create Date'
)
    data_retention_time_in_days = 1;

create table INVESTIA_UNIVERIS.ACCOUNT_HOLDER
(
    HK_HUB             VARCHAR(40) comment 'Hash key for the Hub',
    MD_START_DT        TIMESTAMPNTZ comment 'Start Date of the image/version',
    MD_HASHDIFF        VARCHAR(40) comment 'Represents the whole set of hashed attributes to be historized for an occurrence',
    MD_CREATION_DT     TIMESTAMPNTZ comment 'Creation Date Time of the occurrence',
    MD_SOURCE          VARCHAR(1000) comment 'Represents the source system, file, etc. of the instance',
    MD_SRC_SYSTEM      VARCHAR(100) comment 'Source system',
    MD_EXTRACT_DT      TIMESTAMPNTZ comment 'Source extraction date',
    IVR_SYSID          NUMBER comment 'Unique system generated code for investor identification',
    REP_SYSID          NUMBER comment 'Rep SYSID, to reference with the Advisor data',
    RECIPIENT_DESC_ENG VARCHAR(30) comment 'Investor type description English(Individual, Joint WROS, etc)',
    RECIPIENT_DESC_FRE VARCHAR(50) comment 'Investor type description French(Individuel, CADDS, etc)',
    CORP_CD            VARCHAR(30) comment 'Wether it is corporate',
    IVR_ST_NAME_ENG    VARCHAR(40) comment 'Investor status description English(Active, Closed, etc)',
    IVR_ST_NAME_FRE    VARCHAR(40) comment 'Investor status description French (Actif, Fermé, etc)',
    IVR_REG_2          VARCHAR(80) comment 'Investor Other/Corporate name',
    LANG_CD            VARCHAR(1) comment 'Investor language code for English or French reference on S_LANG',
    IVR_RES_CD         VARCHAR(18) comment 'Investor residence code—if Canadian name of the province',
    IVR_SETUP_DT       TIMESTAMPNTZ comment 'Date on which this record was set up',
    IVR_STOP_DT        TIMESTAMPNTZ comment 'Date of closing the account',
    IVR_FRGN_CTNT      BOOLEAN comment 'Check for foreign content',
    IVR_HOLD_MAIL      BOOLEAN comment 'Check for holding mail',
    IVR_INC_ADR        BOOLEAN comment 'Check for incomplete address',
    IVR_STMT_FREQ      VARCHAR(1) comment 'Statement frequency reference on S_FRENQUENCY',
    IVR_STMT_TYPE      VARCHAR(2) comment 'Statement type',
    IVR_STMT_DT        TIMESTAMPNTZ comment 'Statement date',
    IVR_OLD_DLR        VARCHAR(5) comment 'Previous dealer',
    SALARY_DESC        VARCHAR(40) comment 'Client income segment',
    IVR_KYC_DT         TIMESTAMPNTZ comment 'Date KYC information keyed in',
    IVR_PRIM_BDT       DATE comment 'Date of birth is not corporate',
    CREATE_DT          DATE comment 'Create Date'
);

create transient table IAS_IAVM.ACCRUED_INTEREST
(
    HK_LINK                        VARCHAR(40) comment 'Hash of the business keys',
    HK_HUB_INVESTMENT_PRODUCT_TYPE VARCHAR(40) comment 'Hash of the investment product type',
    MD_START_DT                    TIMESTAMPNTZ comment 'Start Date of the image/version',
    MD_CREATION_DT                 TIMESTAMPNTZ comment 'Creation Date Time of the occurrence',
    MD_SOURCE                      VARCHAR(1000) comment 'Represents the source system, file, etc. of the instance',
    MD_SRC_SYSTEM                  VARCHAR(100) comment 'Source system',
    MD_EXTRACT_DT                  TIMESTAMPNTZ comment 'Source extraction date',
    PROCESS_DATE                   DATE comment 'Process date',
    PRODUCT_CODE                   VARCHAR(12) comment 'Product code / Security group code',
    FIID                           VARCHAR(15) comment 'IBM/OSS Security Id',
    CUSIP                          VARCHAR(9) comment 'CUSIP',
    ISIN                           VARCHAR(12) comment 'ISIN NO',
    MARKET                         VARCHAR(12) comment 'Market',
    SYMBOL                         VARCHAR(26) comment 'Security Symbol',
    INTEREST_RATE                  NUMBER(29, 2) comment 'Income Profile Rate',
    ACCRUED_INTEREST_METHOD1       VARCHAR(1) comment 'Accrued Int Method 1',
    ACCRUED_INTEREST_METHOD2       VARCHAR(1) comment 'Accrued Int Method 2',
    DAILY_COUNT_BASIS              VARCHAR(15) comment 'US_NASD/ACTUAL_360/ACTUAL_329/ACTUAL',
    INTEREST_START_DATE            DATE comment 'Int. Start Date',
    YEAR_FRACTION                  NUMBER(29, 9) comment 'Year',
    BASE_ACCRUED_INTEREST          NUMBER(29, 11) comment 'BASE ACCRUED INTEREST'
)
    data_retention_time_in_days = 1;

create table IAS_IAVM.ACCRUED_INTEREST_SV
(
    HK_LINK                        VARCHAR(40),
    HK_HUB_INVESTMENT_PRODUCT_TYPE VARCHAR(40),
    MD_START_DT                    TIMESTAMPNTZ,
    MD_CREATION_DT                 TIMESTAMPNTZ,
    MD_SOURCE                      VARCHAR(1000),
    MD_SRC_SYSTEM                  VARCHAR(100),
    MD_EXTRACT_DT                  TIMESTAMPNTZ,
    PROCESS_DATE                   DATE,
    PRODUCT_CODE                   VARCHAR(12),
    FIID                           VARCHAR(15),
    CUSIP                          VARCHAR(9),
    ISIN                           VARCHAR(12),
    MARKET                         VARCHAR(12),
    SYMBOL                         VARCHAR(26),
    INTEREST_RATE                  NUMBER(29, 2),
    ACCRUED_INTEREST_METHOD1       VARCHAR(1),
    ACCRUED_INTEREST_METHOD2       VARCHAR(1),
    DAILY_COUNT_BASIS              VARCHAR(15),
    INTEREST_START_DATE            DATE,
    YEAR_FRACTION                  NUMBER(29, 9),
    BASE_ACCRUED_INTEREST          NUMBER(29, 11)
);

create transient table IAPW_PORTAL_API.ASSETS_SUMMARY_BYACCOUNTTYPE
(
    MD_START_DT    TIMESTAMPNTZ comment 'Start Date of the image/version',
    MD_SOURCE      VARCHAR(1000) comment 'Represents the source system, file, etc. of the instance',
    MD_CREATION_DT TIMESTAMPNTZ default CURRENT_TIMESTAMP() comment 'Creation Date Time of the occurrence',
    MD_SRC_SYSTEM  VARCHAR(100) comment 'Source system',
    MD_EXTRACT_DT  TIMESTAMPNTZ comment 'Source extraction date',
    CONTENT        VARIANT comment 'Json content'
)
    data_retention_time_in_days = 1;

create transient table IAPW_PORTAL_API.ASSETS_SUMMARY_BYACCOUNTTYPE_RVP
(
    MD_START_DT    TIMESTAMPNTZ comment 'Start Date of the image/version',
    MD_SOURCE      VARCHAR(1000) comment 'Represents the source system, file, etc. of the instance',
    MD_CREATION_DT TIMESTAMPNTZ default CURRENT_TIMESTAMP() comment 'Creation Date Time of the occurrence',
    MD_SRC_SYSTEM  VARCHAR(100) comment 'Source system',
    MD_EXTRACT_DT  TIMESTAMPNTZ comment 'Source extraction date',
    RVPID          NUMBER(10) comment 'RVP Ids',
    CONTENT        VARIANT comment 'Json content'
)
    data_retention_time_in_days = 1;

create transient table IAPW_PORTAL_API.ASSETS_SUMMARY_BYCOMMISSIONTYPE
(
    MD_START_DT    TIMESTAMPNTZ comment 'Start Date of the image/version',
    MD_SOURCE      VARCHAR(1000) comment 'Represents the source system, file, etc. of the instance',
    MD_CREATION_DT TIMESTAMPNTZ default CURRENT_TIMESTAMP() comment 'Creation Date Time of the occurrence',
    MD_SRC_SYSTEM  VARCHAR(100) comment 'Source system',
    MD_EXTRACT_DT  TIMESTAMPNTZ comment 'Source extraction date',
    CONTENT        VARIANT comment 'Json content'
)
    data_retention_time_in_days = 1;

create transient table IAPW_PORTAL_API.ASSETS_SUMMARY_BYCOMMISSIONTYPE_AND_PRODUCT
(
    MD_START_DT    TIMESTAMPNTZ comment 'Start Date of the image/version',
    MD_SOURCE      VARCHAR(1000) comment 'Represents the source system, file, etc. of the instance',
    MD_CREATION_DT TIMESTAMPNTZ default CURRENT_TIMESTAMP() comment 'Creation Date Time of the occurrence',
    MD_SRC_SYSTEM  VARCHAR(100) comment 'Source system',
    MD_EXTRACT_DT  TIMESTAMPNTZ comment 'Source extraction date',
    CONTENT        VARIANT comment 'Json content'
)
    data_retention_time_in_days = 1;

create transient table IAPW_PORTAL_API.ASSETS_SUMMARY_BYCOMMISSIONTYPE_AND_PRODUCT_RVP
(
    MD_START_DT    TIMESTAMPNTZ comment 'Start Date of the image/version',
    MD_SOURCE      VARCHAR(1000) comment 'Represents the source system, file, etc. of the instance',
    MD_CREATION_DT TIMESTAMPNTZ default CURRENT_TIMESTAMP() comment 'Creation Date Time of the occurrence',
    MD_SRC_SYSTEM  VARCHAR(100) comment 'Source system',
    MD_EXTRACT_DT  TIMESTAMPNTZ comment 'Source extraction date',
    RVPID          NUMBER(10) comment 'RVP ID',
    CONTENT        VARIANT comment 'Json content'
)
    data_retention_time_in_days = 1;

create transient table IAPW_PORTAL_API.ASSETS_SUMMARY_BYCOMMISSIONTYPE_RVP
(
    MD_START_DT    TIMESTAMPNTZ comment 'Start Date of the image/version',
    MD_SOURCE      VARCHAR(1000) comment 'Represents the source system, file, etc. of the instance',
    MD_CREATION_DT TIMESTAMPNTZ default CURRENT_TIMESTAMP() comment 'Creation Date Time of the occurrence',
    MD_SRC_SYSTEM  VARCHAR(100) comment 'Source system',
    MD_EXTRACT_DT  TIMESTAMPNTZ comment 'Source extraction date',
    RVPID          NUMBER(10) comment 'RVP ID',
    CONTENT        VARIANT comment 'Json content'
)
    data_retention_time_in_days = 1;

create transient table IAPW_PORTAL_API.ASSETS_SUMMARY_BYPRODUCT
(
    MD_START_DT    TIMESTAMPNTZ comment 'Start Date of the image/version',
    MD_SOURCE      VARCHAR(1000) comment 'Represents the source system, file, etc. of the instance',
    MD_CREATION_DT TIMESTAMPNTZ default CURRENT_TIMESTAMP() comment 'Creation Date Time of the occurrence',
    MD_SRC_SYSTEM  VARCHAR(100) comment 'Source system',
    MD_EXTRACT_DT  TIMESTAMPNTZ comment 'Source extraction date',
    CONTENT        VARIANT comment 'Json content'
)
    data_retention_time_in_days = 1;

create transient table IAPW_PORTAL_API.ASSETS_SUMMARY_BYPRODUCT_RVP
(
    MD_START_DT    TIMESTAMPNTZ comment 'Start Date of the image/version',
    MD_SOURCE      VARCHAR(1000) comment 'Represents the source system, file, etc. of the instance',
    MD_CREATION_DT TIMESTAMPNTZ default CURRENT_TIMESTAMP() comment 'Creation Date Time of the occurrence',
    MD_SRC_SYSTEM  VARCHAR(100) comment 'Source system',
    MD_EXTRACT_DT  TIMESTAMPNTZ comment 'Source extraction date',
    RVPID          NUMBER(10),
    CONTENT        VARIANT comment 'Json content'
)
    data_retention_time_in_days = 1;

create transient table IAPW_PORTAL_API.ASSETS_SUMMARY_BYPROVINCE
(
    MD_START_DT    TIMESTAMPNTZ comment 'Start Date of the image/version',
    MD_SOURCE      VARCHAR(1000) comment 'Represents the source system, file, etc. of the instance',
    MD_CREATION_DT TIMESTAMPNTZ default CURRENT_TIMESTAMP() comment 'Creation Date Time of the occurrence',
    MD_SRC_SYSTEM  VARCHAR(100) comment 'Source system',
    MD_EXTRACT_DT  TIMESTAMPNTZ comment 'Source extraction date',
    CONTENT        VARIANT comment 'Json content'
)
    data_retention_time_in_days = 1;

create transient table IAPW_PORTAL_API.ASSETS_SUMMARY_BYPROVINCE_RVP
(
    MD_START_DT    TIMESTAMPNTZ comment 'Start Date of the image/version',
    MD_SOURCE      VARCHAR(1000) comment 'Represents the source system, file, etc. of the instance',
    MD_CREATION_DT TIMESTAMPNTZ default CURRENT_TIMESTAMP() comment 'Creation Date Time of the occurrence',
    MD_SRC_SYSTEM  VARCHAR(100) comment 'Source system',
    MD_EXTRACT_DT  TIMESTAMPNTZ comment 'Source extraction date',
    RVPID          NUMBER(10) comment 'RVP Ids',
    CONTENT        VARIANT comment 'Json content'
)
    data_retention_time_in_days = 1;

create table PUBLIC.BDV
(
    CATEGORY        VARCHAR(40),
    CLIENT_ID       VARCHAR(40),
    MASTER_CODE     VARCHAR(40),
    REVENUE_TYPE    VARCHAR(40),
    REVENUE_SUBTYPE VARCHAR(40),
    REVENUE_AMOUNT  NUMBER(38, 2)
);

create transient table IAS.CASH_HOLDINGS
(
    HK_LINK                          VARCHAR(40) comment 'Hash key for the Link',
    HK_HUB_CONTRACT                  VARCHAR(40) comment 'Hash key for HUB_CONTRACT',
    HK_HUB_REGISTERED_REPRESENTATIVE VARCHAR(40) comment 'Hash key for HUB_REGISTERED_REPRESENTATIVE',
    HK_HUB_INVESTMENT_PRODUCT_TYPE   VARCHAR(40) comment '0 value as it is always NULL, added as it is required when loading RDV',
    MD_SEQ                           VARCHAR(50) comment 'The value of METADATA$FILE_ROW_NUMBER when loading using INFORMATICA',
    MD_START_DT                      TIMESTAMPNTZ comment 'Start Date of the image/version',
    MD_HASHDIFF                      VARCHAR(40) comment 'Represents the whole set of hashed attributes to be historized for an occurrence',
    MD_CREATION_DT                   TIMESTAMPNTZ comment 'Creation Date Time of the occurrence',
    MD_SOURCE                        VARCHAR(1000) comment 'Represents the source system, file, etc. of the instance',
    MD_SRC_SYSTEM                    VARCHAR(100) comment 'Source system',
    MD_EXTRACT_DT                    TIMESTAMPNTZ comment 'Extraction date of the occurrence',
    A_C_ID                           VARCHAR(100) comment 'Account ID',
    A_C_REPRESENTATIVE               VARCHAR(50) comment 'Advisor RR code',
    A_C_SUMM_BALANCE_BUS_DATE        DATE comment 'Update business date',
    A_C_SUMM_SD_NET_AMT              NUMBER(38, 2) comment 'A/C Summ settelment date Net Amt',
    A_C_SUMM_TD_NET_AMT              NUMBER(38, 2) comment 'A/C Summ trade date Net Amt',
    A_C_CURRENCY                     VARCHAR(10) comment 'Holding value currency'
)
    data_retention_time_in_days = 1;

create transient table INVESTIA_UNIVERIS.CONTRACT
(
    HK_HUB             VARCHAR(40) comment 'Hash of the business keys',
    MD_START_DT        TIMESTAMPNTZ comment 'Start Date of the image/version',
    MD_HASHDIFF        VARCHAR(40) comment 'Represents the whole set of hashed attributes to be historized for an occurrence',
    MD_CREATION_DT     TIMESTAMPNTZ comment 'Creation Date Time of the occurrence',
    MD_SOURCE          VARCHAR(1000) comment 'Represents the source system, file, etc. of the instance',
    MD_SRC_SYSTEM      VARCHAR(100) comment 'Source system',
    MD_EXTRACT_DT      TIMESTAMPNTZ comment 'Source extraction date',
    PLN_SYSID          NUMBER not null comment 'Unveris ID for plans',
    IVR_SYSID          NUMBER comment 'Unveris ID for clients',
    PLN_CD             VARCHAR(8000) comment 'Univeris plan code : 01, 02,...',
    PLN_STATUS         VARCHAR(8000) comment 'Plan status : Active, inactive, closed,...',
    PLN_ADM_CD         VARCHAR(8000) comment 'Plan administrator code',
    SETUP_DT           TIMESTAMPNTZ comment 'Plan set up date',
    CLOSE_DT           TIMESTAMPNTZ comment 'Plan close date',
    PEN_JUR_CD         VARCHAR(8000),
    FEE_EXMP_IND       NUMBER comment 'Trustee Fee Exemption Indicator. (Values 1 = ON, 0 = OFF)',
    ADMINISTRATOR_TYPE VARCHAR(8000) comment 'Administrator type (Client Name, Nominee, Intermediary)',
    REP_SYSID          NUMBER comment 'RR code',
    REP_CD             VARCHAR(50) comment 'Registered representative code - RR Code'
)
    data_retention_time_in_days = 1;

create transient table IAS.CONTRACT
(
    HK_HUB                VARCHAR(40) comment 'Hash of the business keys',
    MD_START_DT           TIMESTAMPNTZ comment 'Start Date of the image/version',
    MD_HASHDIFF           VARCHAR(40) comment 'Represents the whole set of hashed attributes to be historized for an occurrence',
    MD_CREATION_DT        TIMESTAMPNTZ default CURRENT_TIMESTAMP() comment 'Creation Date Time of the occurrence',
    MD_SOURCE             VARCHAR(1000) comment 'Represents the source system, file, etc. of the instance',
    MD_SRC_SYSTEM         VARCHAR(100) comment 'Source system',
    MD_EXTRACT_DT         TIMESTAMPNTZ comment 'Extraction date of the occurrence',
    A_C_ID                VARCHAR(18) comment 'Account ID',
    A_C_CLIENT            VARCHAR(20) comment 'Client ID',
    A_C_REPRESENTATIVE    VARCHAR(4) comment 'Advisor RR code',
    ADMINISTRATOR_TYPE    VARCHAR(100) comment 'Nominee, Client name, ...',
    A_C_OPEN_DATE         DATE comment 'Account opening date',
    A_C_CLOSING_DATE      DATE comment 'Account closing date',
    A_C_ACCOUNT_CLASS     VARCHAR(3) comment 'Account classification code',
    RETAIL_PLAN           VARCHAR(4) comment 'Retail plan code : RS, LF, ...',
    RETAIL_PLAN_RESP      VARCHAR(1) comment 'To be defined',
    ACCOUNT_RAP_CODE      VARCHAR(1) comment 'An alpha account type indicator (known as a "RAP" code)',
    ASC_3_MANAGED_TYPE    VARCHAR(1) comment 'ASC 3 - managed type indicator',
    A_C_SPECIAL_TAG       VARCHAR(20) comment 'non delivery information tag fields',
    ASC_1_RESP_PLAN_TYPES VARCHAR(1) comment 'ASC 1 - RESP plan types indicator',
    A_C_CURRENCY          VARCHAR(10) comment 'Account Currency',
    IVT_OBJ_CDE           VARCHAR(15) comment 'Accounts Risk Profile (Cash, Income, Growth, Speculations - PCT)',
    RISK_TOLERANCE        VARCHAR(15) comment 'Accounts Risk Tolerance',
    DOC_LAST_UPDATE       DATE comment 'Last update date for the Know Your Client documents',
    MANAGED_IND           NUMBER(1) comment 'Managed indicator at the repCode Level, 1 for managed account and 0 for non-managed account'
)
    data_retention_time_in_days = 1;

create transient table IAS_UNIVERIS.CONTRACT
(
    HK_HUB             VARCHAR(40) comment 'Hash of the business keys',
    MD_START_DT        TIMESTAMPNTZ comment 'Start Date of the image/version',
    MD_HASHDIFF        VARCHAR(40) comment 'Represents the whole set of hashed attributes to be historized for an occurrence',
    MD_CREATION_DT     TIMESTAMPNTZ comment 'Creation Date Time of the occurrence',
    MD_SOURCE          VARCHAR(1000) comment 'Represents the source system, file, etc. of the instance',
    MD_SRC_SYSTEM      VARCHAR(100) comment 'Source system',
    MD_EXTRACT_DT      TIMESTAMPNTZ comment 'Source extraction date',
    PLN_SYSID          NUMBER not null comment 'Unveris ID for plans',
    IVR_SYSID          NUMBER comment 'Unveris ID for clients',
    PLN_CD             VARCHAR(8000) comment 'Univeris plan code : 01, 02,...',
    PLN_STATUS         VARCHAR(8000) comment 'Plan status : Active, inactive, closed,...',
    PLN_ADM_CD         VARCHAR(8000) comment 'Plan administrator code',
    SETUP_DT           TIMESTAMPNTZ comment 'Plan set up date',
    CLOSE_DT           TIMESTAMPNTZ comment 'Plan close date',
    PEN_JUR_CD         VARCHAR(8000),
    FEE_EXMP_IND       NUMBER comment 'Trustee Fee Exemption Indicator. (Values 1 = ON, 0 = OFF)',
    ADMINISTRATOR_TYPE VARCHAR(8000) comment 'Administrator type (Client Name, Nominee, Intermediary)',
    REP_SYSID          NUMBER comment 'RR code',
    REP_CD             VARCHAR(50) comment 'Registered representative code - RR Code'
)
    data_retention_time_in_days = 1;

create table IAS.CONTRACT_CLONE
(
    HK_HUB                VARCHAR(40),
    MD_START_DT           TIMESTAMPNTZ,
    MD_HASHDIFF           VARCHAR(40),
    MD_CREATION_DT        TIMESTAMPNTZ,
    MD_SOURCE             VARCHAR(1000),
    MD_SRC_SYSTEM         VARCHAR(100),
    MD_EXTRACT_DT         TIMESTAMPNTZ,
    A_C_ID                VARCHAR(18),
    A_C_CLIENT            VARCHAR(20),
    A_C_REPRESENTATIVE    VARCHAR(4),
    ADMINISTRATOR_TYPE    VARCHAR(100),
    A_C_OPEN_DATE         DATE,
    A_C_CLOSING_DATE      DATE,
    A_C_ACCOUNT_CLASS     VARCHAR(3),
    RETAIL_PLAN           VARCHAR(4),
    RETAIL_PLAN_RESP      VARCHAR(1),
    ACCOUNT_RAP_CODE      VARCHAR(1),
    ASC_3_MANAGED_TYPE    VARCHAR(1),
    A_C_SPECIAL_TAG       VARCHAR(20),
    ASC_1_RESP_PLAN_TYPES VARCHAR(1),
    A_C_CURRENCY          VARCHAR(10),
    IVT_OBJ_CDE           VARCHAR(15),
    RISK_TOLERANCE        VARCHAR(15),
    DOC_LAST_UPDATE       DATE,
    MANAGED_IND           NUMBER(1)
);

create table PUBLIC.CORP
(
    CATEGORY        VARCHAR(40),
    CLIENT_ID       VARCHAR(40),
    MASTER_CODE     VARCHAR(40),
    REVENUE_TYPE    VARCHAR(40),
    REVENUE_SUBTYPE VARCHAR(40),
    REVENUE_AMOUNT  NUMBER(38, 2)
);

create table INVESTIA.DUMP_TABLE
(
    BASE_STR  VARCHAR(15),
    BASE_STR2 VARCHAR(15)
);

create table TOOLS.ENTITY_TYPES_COLUMNS_PATTERNS
(
    COLUMN_ID               VARCHAR(500) comment 'HKHUB, HKLINK, MD_CREATION_DATE,...',
    COLUMN_ORDER            NUMBER comment 'Order of the column in the entity',
    ENTITY_TYPE_ID          VARCHAR(500) comment 'HUB, SAT_WITH_ACTIVE_FLAG, LINK, ...',
    COLUMN_TYPE             VARCHAR(500) comment 'HASHKEY, METADATA,...',
    COLUMN_NAME_PATTERN     VARCHAR(1000) comment 'Pattern to build the column name',
    COLUMN_TYPE_PATTERN     VARCHAR(1000) comment 'Pattern to build the colmun type',
    COLUMN_OPTIONS_PATTERN  VARCHAR(1000) comment 'Pattern to build the column options',
    COLUMN_COMMENTS_PATTERN VARCHAR(1000) comment 'Pattern to build colomn comments',
    COLUMN_DESC             VARCHAR(4000) comment 'Column description'
);

create table TOOLS.ENTITY_TYPES_PATTERNS
(
    ENTITY_TYPE_ID           VARCHAR(500) comment 'HUB, SAT_WITH_ACTIVE_FLAG, LINK, ...',
    ENTITY_CATEGORY          VARCHAR(500) comment 'STAGING, DATAVAULT,...',
    ENTITY_TYPE_NAME_PATTERN VARCHAR(1000) comment 'Pattern to build the table name',
    ENTITY_OPTIONS_PATTERN   VARCHAR(1000) comment 'Pattern to build the table options',
    ENTITY_DESC              VARCHAR(4000) comment 'Entity type description'
);

create transient table INVESTIA_UNIVERIS.FINANCIAL_TRANSACTIONS
(
    HK_LINK                        VARCHAR(40) comment 'Hash key for the Link',
    HK_HUB_CONTRACT                VARCHAR(40) comment 'Hash key for HUB_CONTRACT',
    HK_HUB_INVESTMENT_PRODUCT_TYPE VARCHAR(40) comment 'Hash key for HUB_INVESTMENT_PRODUCT_TYPE',
    MD_START_DT                    TIMESTAMPNTZ comment 'Start Date of the image/version',
    MD_HASHDIFF                    VARCHAR(40) comment 'Represents the whole set of hashed attributes to be historized for an occurrence',
    MD_CREATION_DT                 TIMESTAMPNTZ comment 'Creation Date Time of the occurrence',
    MD_SOURCE                      VARCHAR(1000) comment 'Represents the source system, file, etc. of the instance',
    MD_SRC_SYSTEM                  VARCHAR(100) comment 'Source system',
    MD_EXTRACT_DT                  TIMESTAMPNTZ comment 'Source extraction date',
    TRX_SYSID                      NUMBER not null comment 'Transaction System ID',
    IVR_SYSID                      NUMBER comment 'Client ID',
    REP_SYSID                      NUMBER comment 'Representative ID',
    PLN_SYSID                      NUMBER comment 'Plan ID',
    ACT_SYSID                      NUMBER comment 'Holding system ID',
    IVD_SYSID                      NUMBER comment 'Funds numbers ID',
    TRX_STATUS                     VARCHAR(4) comment 'Transaction status code',
    TRX_ST_DESC_ENG                VARCHAR(40) comment 'Transaction status description',
    TRADE_DT                       TIMESTAMPNTZ comment 'Trade date',
    MGT_CD                         VARCHAR(10) comment 'Management company code',
    MGT_NAME_ENG                   VARCHAR(60) comment 'Management company name',
    DLR_SYSID                      NUMBER comment 'Dealer ID',
    RGN_SYSID                      NUMBER comment 'Region ID',
    BRN_SYSID                      NUMBER comment 'Branch ID',
    TRX_UNIT                       NUMBER comment 'Transaction quantity',
    TRX_PRICE                      NUMBER comment 'Transaction unit price',
    TRX_GROSS                      NUMBER(29, 12) comment 'Transaction gross amount',
    TRX_NET                        NUMBER(29, 12) comment 'Transaction net amount',
    TRX_GROSS_CAD                  NUMBER(29, 12) comment 'Transaction gross amount CAD',
    SPR_FACTOR                     NUMBER(3) comment 'Transaction sign (IN or OUT)',
    CURRENCY_CD                    VARCHAR(6) comment 'Currency code',
    DLR_CD                         VARCHAR(10) comment 'Dealer code',
    RGN_CD                         VARCHAR(10) comment 'Region code',
    BRN_CD                         VARCHAR(10) comment 'Branch code',
    REP_CD                         VARCHAR(10) comment 'Representative code',
    PLN_TYPE                       VARCHAR(4) comment 'Plan Type',
    SPR_CTGY                       VARCHAR(6) comment 'Transaction category',
    TRX_MNEM_ENG                   VARCHAR(20) comment 'Transaction mnemonic name',
    REVERSAL_IND                   NUMBER(1) comment 'Transaction reversed indicator'
)
    data_retention_time_in_days = 1;

create transient table IAS_UNIVERIS.FINANCIAL_TRANSACTIONS
(
    HK_LINK                        VARCHAR(40) comment 'Hash key for the Link',
    HK_HUB_CONTRACT                VARCHAR(40) comment 'Hash key for HUB_CONTRACT',
    HK_HUB_INVESTMENT_PRODUCT_TYPE VARCHAR(40) comment 'Hash key for HUB_INVESTMENT_PRODUCT_TYPE',
    MD_START_DT                    TIMESTAMPNTZ comment 'Start Date of the image/version',
    MD_HASHDIFF                    VARCHAR(40) comment 'Represents the whole set of hashed attributes to be historized for an occurrence',
    MD_CREATION_DT                 TIMESTAMPNTZ comment 'Creation Date Time of the occurrence',
    MD_SOURCE                      VARCHAR(1000) comment 'Represents the source system, file, etc. of the instance',
    MD_SRC_SYSTEM                  VARCHAR(100) comment 'Source system',
    MD_EXTRACT_DT                  TIMESTAMPNTZ comment 'Source extraction date',
    TRX_SYSID                      NUMBER not null comment 'Transaction System ID',
    IVR_SYSID                      NUMBER comment 'Client ID',
    REP_SYSID                      NUMBER comment 'Representative ID',
    PLN_SYSID                      NUMBER comment 'Plan ID',
    ACT_SYSID                      NUMBER comment 'Holding system ID',
    IVD_SYSID                      NUMBER comment 'Funds numbers ID',
    TRX_STATUS                     VARCHAR(2) comment 'Transaction status code',
    TRX_ST_DESC_ENG                VARCHAR(40) comment 'Transaction status description',
    TRADE_DT                       TIMESTAMPNTZ comment 'Trade date',
    MGT_CD                         VARCHAR(5) comment 'Management company code',
    MGT_NAME_ENG                   VARCHAR(60) comment 'Management company name',
    DLR_SYSID                      NUMBER comment 'Dealer ID',
    RGN_SYSID                      NUMBER comment 'Region ID',
    BRN_SYSID                      NUMBER comment 'Branch ID',
    TRX_UNIT                       NUMBER comment 'Transaction quantity',
    TRX_PRICE                      NUMBER comment 'Transaction unit price',
    TRX_GROSS                      NUMBER(29, 12) comment 'Transaction gross amount',
    TRX_NET                        NUMBER(29, 12) comment 'Transaction net amount',
    TRX_GROSS_CAD                  NUMBER(29, 12) comment 'Transaction gross amount CAD',
    SPR_FACTOR                     NUMBER(3) comment 'Transaction sign (IN or OUT)',
    CURRENCY_CD                    VARCHAR(3) comment 'Currency code',
    DLR_CD                         VARCHAR(5) comment 'Dealer code',
    RGN_CD                         VARCHAR(5) comment 'Region code',
    BRN_CD                         VARCHAR(5) comment 'Branch code',
    REP_CD                         VARCHAR(5) comment 'Representative code',
    PLN_TYPE                       VARCHAR(2) comment 'Plan Type',
    SPR_CTGY                       VARCHAR(3) comment 'Transaction category',
    TRX_MNEM_ENG                   VARCHAR(10) comment 'Transaction mnemonic name',
    REVERSAL_IND                   NUMBER(1) comment 'Transaction reversed indicator'
)
    data_retention_time_in_days = 1;

create transient table IAS.FINANCIAL_TRANSACTIONS_CMSDT
(
    HK_LINK                          VARCHAR(40) comment 'Hash of the business keys',
    HK_HUB_CONTRACT                  VARCHAR(40) comment 'Hash key for CONTRACT',
    HK_HUB_REGISTERED_REPRESENTATIVE VARCHAR(40) comment 'Hash key for the REGISTERED_REPRESENTATIVE',
    HK_HUB_INVESTMENT_PRODUCT_TYPE   VARCHAR(40) comment 'Hash key for the REF_MAPPING_PRODUCT_TYPE',
    MD_START_DT                      TIMESTAMPNTZ comment 'Start Date of the image/version',
    MD_HASHDIFF                      VARCHAR(40) comment 'Represents the whole set of hashed attributes to be historized for an occurrence',
    MD_CREATION_DT                   TIMESTAMPNTZ comment 'Creation Date Time of the occurrence',
    MD_SOURCE                        VARCHAR(1000) comment 'Represents the source system, file, etc. of the instance',
    MD_SRC_SYSTEM                    VARCHAR(100) comment 'Source system',
    MD_EXTRACT_DT                    TIMESTAMPNTZ,
    TRANSACTION_NUMBER               NUMBER,
    RR_NUMBER                        VARCHAR(4),
    FMSL_ACCOUNT_NUMBER              VARCHAR(10),
    SECURITY_NUMBER                  VARCHAR(12),
    SECURITY_TYPE_CODE               VARCHAR(3),
    SECURITY_CLASS_CODE              VARCHAR(4),
    SECURITY_GROUP_CODE              VARCHAR(3),
    TRANSACTION_TYPE                 VARCHAR(3),
    TRADE_GROUP_GROSS_AMOUNT         NUMBER(38, 2),
    TRAN_TRADING_NET_CURRENCY        VARCHAR(3),
    PROCESS_DATE                     TIMESTAMPNTZ,
    TRADE_DATE                       TIMESTAMPNTZ,
    SETTLEMENT_DATE                  TIMESTAMPNTZ,
    EFFECTIVE_DATE                   TIMESTAMPNTZ,
    TRANSACTION_ID                   NUMBER(11),
    CANCEL_INDICATOR                 VARCHAR(1),
    BUY_SELL_INDICATOR               VARCHAR(1),
    TRADE_GROUP_QUANTITY             NUMBER,
    TRANS_TRADING_NET_AMT            NUMBER(38, 2),
    TICKET_NUMBER                    VARCHAR(6),
    TRADE_GRP_COMM_ENTERED           NUMBER(38, 2)
)
    data_retention_time_in_days = 1;

create transient table IAS.FINANCIAL_TRANSACTIONS_IAVMBK
(
    HK_LINK                          VARCHAR(40) comment 'Hash of the business keys',
    HK_HUB_CONTRACT                  VARCHAR(40) comment 'Hash key for CONTRACT',
    HK_HUB_REGISTERED_REPRESENTATIVE VARCHAR(40) comment 'Hash key for the REGISTERED_REPRESENTATIVE',
    HK_HUB_INVESTMENT_PRODUCT_TYPE   VARCHAR(40) comment 'Hash key for the REF_MAPPING_PRODUCT_TYPE',
    MD_START_DT                      TIMESTAMPNTZ comment 'Start Date of the image/version',
    MD_HASHDIFF                      VARCHAR(40) comment 'Represents the whole set of hashed attributes to be historized for an occurrence',
    MD_CREATION_DT                   TIMESTAMPNTZ comment 'Creation Date Time of the occurrence',
    MD_SOURCE                        VARCHAR(1000) comment 'Represents the source system, file, etc. of the instance',
    MD_SRC_SYSTEM                    VARCHAR(100) comment 'Source system',
    MD_EXTRACT_DT                    TIMESTAMPNTZ comment 'Extraction date of the occurrence',
    A_C_ID                           VARCHAR(100) comment 'Account ID',
    A_C_REPRESENTATIVE               VARCHAR(50) comment 'Advisor RR code',
    TI_ALTERNATE_ID                  VARCHAR(50) comment 'Financial product ID',
    TI_ALTERNATE_TI_TYPE             VARCHAR(50) comment 'Financial product type ID',
    TRAN_ENTRY_DESCRIPTION           VARCHAR(50) comment 'Description of the trading',
    TRAN_USER_DESCRIPTION            VARCHAR(50) comment 'Description of the trading',
    TRAN_TRADING_TYPE                VARCHAR(10) comment 'Type of the trading : Sell, Buy,...',
    TRANSACTION                      NUMBER comment 'Transaction ID',
    TRAN_TRADING_GROSS_AMT           NUMBER(38, 2) comment 'Transaction gross amount in CAD or USD',
    TRAN_TRADING_CURRENCY            VARCHAR(10) comment 'Transaction amounts currency',
    TRAN_TRADING_NET_AMT             NUMBER(38, 2) comment 'Transaction net amount in CAD or USD',
    TRAN_TRADING_TRADE_DATE          DATE comment 'Trade date',
    TRAN_TRADING_SETT_DATE           DATE comment 'Settlement date',
    TRAN_PROCESS_DATE                DATE comment 'Process date',
    TI_SYMBOL                        VARCHAR(50) comment 'Product symbol',
    TRAN_QTY                         NUMBER(38, 4) comment 'Quantity',
    TI_PRIMARY_MARKET                VARCHAR(50) comment 'Primary market',
    TRAN_TXN_REFERENCE_ID            VARCHAR(50) comment 'Tax reference ID',
    TRAN_AMOUNT_2                    NUMBER(38, 2) comment 'Transaction amount 2 in CAD or USD',
    TI_UNDERLYING_CDN_PRICE          NUMBER(38, 8) comment 'TI Underlying CDN Price, this field and above fields were added for OG calculation',
    TI_BASIS_POINT                   NUMBER(38, 5) comment 'TI Basis Point',
    TI_FACE_VALUE                    NUMBER(38, 5) comment 'TI Face Value',
    TI_ISSUE_PRICE                   NUMBER(38, 5) comment 'TI Issue Price',
    STRIKE_PRICE                     NUMBER(38, 8) comment 'STRIKE PRICE',
    TI_UNDERLYING_USD_PRICE          NUMBER(38, 8) comment 'TI Underlying USD Price'
)
    data_retention_time_in_days = 1;

create transient table IAS_FUNDATA.FUND
(
    HK_HUB         VARCHAR(64) comment 'Hash of the business keys',
    MD_START_DT    TIMESTAMPNTZ comment 'Start Date of the image/version',
    MD_HASHDIFF    VARCHAR(64) comment 'Represents the whole set of hashed attributes to be historized for an occurrence',
    MD_CREATION_DT TIMESTAMPNTZ comment 'Creation Date Time of the occurrence',
    MD_SOURCE      VARCHAR(1000) comment 'Represents the source system, file, etc. of the instance',
    MD_SRC_SYSTEM  VARCHAR(50) comment 'Source system',
    MD_EXTRACT_DT  TIMESTAMPNTZ comment 'Extraction date of the occurrence',
    FUNDSERVID     VARCHAR(1000) comment 'Fund serv Id',
    FUNDID         VARCHAR(1000) comment 'Fund Id',
    FUNDDESCFR     VARCHAR(1000) comment 'Fund Desc FR',
    FUNDDESCEN     VARCHAR(1000) comment 'Fund Desc EN',
    FUNDTYPE       VARCHAR(1000) comment 'Fund Type',
    GROUPNAMEFR    VARCHAR(1000) comment 'Manager Name FR',
    GROUPNAMEEN    VARCHAR(1000) comment 'Manager Name EN',
    RRSPELIGIBLE   VARCHAR(1000) comment 'RRSP Eligible Indicator',
    FUNDDESCLONGFR VARCHAR(1000) comment 'Fund long description FR',
    FUNDDESCLONGEN VARCHAR(1000) comment 'Fund long description EN',
    LEGALNAMEEN    VARCHAR(1000) comment 'Legal name EN',
    LEGALNAMEFR    VARCHAR(1000) comment 'Legal name FR',
    STAMP          VARCHAR(1000) comment 'Last Modification Timestamp'
)
    data_retention_time_in_days = 1;

create transient table INVESTIA_UNIVERIS.HOLDINGS
(
    HK_LINK                        VARCHAR(40) comment 'Hash key for the Link',
    HK_HUB_CONTRACT                VARCHAR(40) comment 'Hash key for HUB_CONTRACT',
    HK_HUB_INVESTMENT_PRODUCT_TYPE VARCHAR(40) comment 'Hash key for HUB_INVESTMENT_PRODUCT_TYPE',
    MD_SEQ                         VARCHAR(50) comment 'The value of METADATA$FILE_ROW_NUMBER when loading using INFORMATICA',
    MD_START_DT                    TIMESTAMPNTZ comment 'Start Date of the image/version',
    MD_HASHDIFF                    VARCHAR(40) comment 'Represents the whole set of hashed attributes to be historized for an occurrence',
    MD_CREATION_DT                 TIMESTAMPNTZ comment 'Creation Date Time of the occurrence',
    MD_SOURCE                      VARCHAR(1000) comment 'Represents the source system, file, etc. of the instance',
    MD_SRC_SYSTEM                  VARCHAR(100) comment 'Source system',
    MD_EXTRACT_DT                  TIMESTAMPNTZ comment 'Extraction date of the occurrence',
    ACT_SYSID                      NUMBER       not null comment 'Holding system ID',
    IVD_SYSID                      NUMBER comment 'Funds numbers ID',
    REP_SYSID                      NUMBER comment 'Advisor ID',
    IVR_SYSID                      NUMBER comment 'Client ID',
    PLN_SYSID                      NUMBER comment 'Plan ID',
    FISCAL_SYSID                   NUMBER comment 'Fiscal ID',
    BAL_DATE                       TIMESTAMPNTZ not null comment 'Balance date',
    MV                             NUMBER(34, 4) comment 'Market value',
    CURRENCY_CD                    VARCHAR(8000) comment 'Currency code',
    EXCH_DT                        TIMESTAMPNTZ comment 'Exchange date',
    EXCH_RATE                      NUMBER(19, 8) comment 'Exchange rate',
    AUA                            NUMBER(34, 4) comment 'AUA',
    PRICE                          NUMBER(34, 4) comment 'Price',
    UNITS                          DOUBLE comment 'Units',
    BV                             NUMBER(34, 4) comment 'Book value',
    ACB                            NUMBER(34, 4) comment 'Adjusted cost based',
    NI_T                           NUMBER(34, 4) comment 'Net invested by trade date (not used)',
    NI_P                           NUMBER(34, 4) comment 'Net invested by process date',
    FREQ_CD                        VARCHAR(8000) comment 'Frequency code (not used)',
    UNITS_TRD_DT                   DOUBLE comment 'Units calculated by trade date',
    FISCAL_TD_UNITS                DOUBLE comment 'Units displayed for the fiscal year',
    IVD_LOAD_FLAG                  VARCHAR(3) comment 'Front-end or back-end load indicator',
    WF_IND                         NUMBER
)
    data_retention_time_in_days = 1;

create transient table IAS_UNIVERIS.HOLDINGS
(
    HK_LINK                        VARCHAR(40) comment 'Hash key for the Link',
    HK_HUB_CONTRACT                VARCHAR(40) comment 'Hash key for HUB_CONTRACT',
    HK_HUB_INVESTMENT_PRODUCT_TYPE VARCHAR(40) comment 'Hash key for HUB_INVESTMENT_PRODUCT_TYPE',
    MD_SEQ                         VARCHAR(50) comment 'The value of METADATA$FILE_ROW_NUMBER when loading using INFORMATICA',
    MD_START_DT                    TIMESTAMPNTZ comment 'Start Date of the image/version',
    MD_HASHDIFF                    VARCHAR(40) comment 'Represents the whole set of hashed attributes to be historized for an occurrence',
    MD_CREATION_DT                 TIMESTAMPNTZ comment 'Creation Date Time of the occurrence',
    MD_SOURCE                      VARCHAR(1000) comment 'Represents the source system, file, etc. of the instance',
    MD_SRC_SYSTEM                  VARCHAR(100) comment 'Source system',
    MD_EXTRACT_DT                  TIMESTAMPNTZ comment 'Extraction date of the occurrence',
    ACT_SYSID                      NUMBER       not null comment 'Holding system ID',
    IVD_SYSID                      NUMBER comment 'Funds numbers ID',
    REP_SYSID                      NUMBER comment 'Advisor ID',
    IVR_SYSID                      NUMBER comment 'Client ID',
    PLN_SYSID                      NUMBER comment 'Plan ID',
    FISCAL_SYSID                   NUMBER comment 'Fiscal ID',
    BAL_DATE                       TIMESTAMPNTZ not null comment 'Balance date',
    MV                             NUMBER(34, 4) comment 'Market value',
    CURRENCY_CD                    VARCHAR(8000) comment 'Currency code',
    EXCH_DT                        TIMESTAMPNTZ comment 'Exchange date',
    EXCH_RATE                      NUMBER(19, 8) comment 'Exchange rate',
    AUA                            NUMBER(34, 4) comment 'AUA',
    PRICE                          NUMBER(34, 4) comment 'Price',
    UNITS                          DOUBLE comment 'Units',
    BV                             NUMBER(34, 4) comment 'Book value',
    ACB                            NUMBER(34, 4) comment 'Adjusted cost based',
    NI_T                           NUMBER(34, 4) comment 'Net invested by trade date (not used)',
    NI_P                           NUMBER(34, 4) comment 'Net invested by process date',
    FREQ_CD                        VARCHAR(8000) comment 'Frequency code (not used)',
    UNITS_TRD_DT                   DOUBLE comment 'Units calculated by trade date',
    FISCAL_TD_UNITS                DOUBLE comment 'Units displayed for the fiscal year',
    IVD_LOAD_FLAG                  VARCHAR(3) comment 'Front-end or back-end load indicator',
    WF_IND                         NUMBER
)
    data_retention_time_in_days = 1;

create transient table IAS.HOLDINGS
(
    HK_LINK                          VARCHAR(40) comment 'Hash key for the Link',
    HK_HUB_CONTRACT                  VARCHAR(40) comment 'Hash key for HUB_CONTRACT',
    HK_HUB_REGISTERED_REPRESENTATIVE VARCHAR(40) comment 'Hash key for HUB_REGISTERED_REPRESENTATIVE',
    HK_HUB_INVESTMENT_PRODUCT_TYPE   VARCHAR(40) comment 'Hash key for HUB_INVESTMENT_PRODUCT_TYPE',
    MD_SEQ                           VARCHAR(50) comment 'The value of METADATA$FILE_ROW_NUMBER when loading using INFORMATICA',
    MD_START_DT                      TIMESTAMPNTZ comment 'Start Date of the image/version',
    MD_HASHDIFF                      VARCHAR(40) comment 'Represents the whole set of hashed attributes to be historized for an occurrence',
    MD_CREATION_DT                   TIMESTAMPNTZ comment 'Creation Date Time of the occurrence',
    MD_SOURCE                        VARCHAR(1000) comment 'Represents the source system, file, etc. of the instance',
    MD_SRC_SYSTEM                    VARCHAR(100) comment 'Source system',
    MD_EXTRACT_DT                    TIMESTAMPNTZ comment 'Extraction date of the occurrence',
    A_C_ID                           VARCHAR(100) comment 'Account ID',
    A_C_REPRESENTATIVE               VARCHAR(50) comment 'Advisor RR code',
    TI_ALTERNATE_ID                  VARCHAR(50) comment 'Financial product ID',
    TRAN_SUMM_CURR_MKT_VALUE         NUMBER(38, 2) comment 'Market value of the holding in CAD or USD',
    TRAN_SUMM_BUSINESS_DATE          DATE comment 'Update business date',
    TI_ALTERNATE_TI_TYPE             VARCHAR(50) comment 'Financial product type ID',
    B_V_SECURITY_POSITION_VAL        NUMBER(38, 2) comment 'Book value',
    B_V_SECURITY_POSITION_COS        NUMBER(38, 4) comment 'Average cost base',
    TRAN_SUMM_AVG_UNIT_COST          NUMBER(38, 5) comment 'Average cost base',
    TRAN_SUMM_NET_SETT_AMT           NUMBER(38, 2) comment 'Cash position',
    TRAN_SUMM_CURRENCY               VARCHAR(10) comment 'Holding value currency',
    TRAN_SUMM_SETT_QTY               NUMBER(38, 4) comment 'Units',
    TRAN_SUMM_TRADE_QTY              NUMBER(38, 4) comment 'Units calculated by trade date',
    TI_FACE_VALUE                    NUMBER(29, 5) comment 'TI Face Value',
    TI_BASIS_POINT                   NUMBER(29, 5) comment 'TI Basis Point',
    MKT_PRICE_DATE                   TIMESTAMPNTZ comment 'Mkt Price Date',
    MARKET_PRICE_BID                 NUMBER(29, 8) comment 'Market Price Bid',
    MARKET_PRICE_ASK                 NUMBER(29, 8) comment 'Market Price Ask',
    MARKET_PRICE_CLOSE               NUMBER(29, 8) comment 'Market Price Close',
    PRICE_CURRENCY                   VARCHAR(3) comment 'Price Currency',
    TRAN_SUMM_CURR_MKT_PRICE         NUMBER(29, 8) comment 'Tran Summ Curr Mkt Price',
    TRAN_SUMM_SFK_QTY                NUMBER(29, 4) comment 'Tran Summ Sfk Qty'
)
    data_retention_time_in_days = 1;

create transient table IAS_COMMISSION.INSURANCE_REVENUES
(
    HK_LINK                          VARCHAR(40) comment 'Hash of the business keys',
    HK_HUB_REGISTERED_REPRESENTATIVE VARCHAR(40) comment 'Hash key for registered representative',
    MD_CREATION_DT                   TIMESTAMPNTZ default CURRENT_TIMESTAMP() comment 'Creation Date Time of the occurrence',
    MD_START_DT                      TIMESTAMPNTZ comment 'Start Date of the image/version',
    MD_SOURCE                        VARCHAR(1000) comment 'Represents the source system, file, etc. of the instance',
    MD_SRC_SYSTEM                    VARCHAR(100) comment 'Source system',
    MD_EXTRACT_DT                    TIMESTAMPNTZ comment 'Source extraction date',
    TRANSID                          NUMBER comment 'Transaction ID',
    EXTTRANSID                       VARCHAR(20) comment 'Extended transaction ID',
    PROCESSDATE                      DATE comment 'Process date',
    TRANSDATE                        TIMESTAMPNTZ comment 'Transaction date',
    SOURCECODE                       VARCHAR(24) comment 'Source code / Transaction type',
    CANCELIND                        NUMBER comment 'Cancel indicator',
    REPID                            VARCHAR(24) comment 'Representative ID',
    CURRENCY                         VARCHAR(6) comment 'transaction currency',
    EXCHANGERATE                     NUMBER(38, 2) comment 'the exchange rate used for the transaction',
    ENTRY_TYPE                       VARCHAR(24) comment 'entry type = insurance revenue',
    COMMISSION                       NUMBER(38, 2) comment 'Representative gross commission',
    COMMISSIONCAD                    NUMBER(38, 2) comment 'Representative gross commission in CAD',
    OVERRIDEIND                      NUMBER comment 'Override indicator',
    ACCURATEIND                      NUMBER comment 'Accuracy indicator',
    DESCRIPTION                      VARCHAR(250) comment 'Description',
    NUMBEROFORDERS                   NUMBER comment 'Number of orders',
    NETCOMMISSION                    NUMBER(38, 2) comment 'Representative net commission',
    TRANSFEE                         NUMBER(38, 2) comment 'Representative transaction fees',
    SHAREIND                         NUMBER comment 'Share indicator',
    AFFECTGROSSCOMMIND               NUMBER comment 'Affect gross commission Indicator',
    REVENUEONLYIND                   NUMBER comment 'Revenu Only Indicator',
    NOTE                             VARCHAR(250) comment 'Notes',
    REVNO                            VARCHAR(250) comment 'Revision number',
    STAMP                            DATE comment 'Record insertion date',
    USERID                           VARCHAR(250) comment 'User ID'
)
    data_retention_time_in_days = 1;

create transient table IAS_UNIVERIS.INVESTMENT_PRODUCT_TYPE
(
    HK_HUB               VARCHAR(100) comment 'Hash of the business keys',
    MD_START_DT          TIMESTAMPNTZ comment 'Start Date of the image/version',
    MD_HASHDIFF          VARCHAR(100) comment 'Represents the whole set of hashed attributes to be historized for an occurrence',
    MD_CREATION_DT       TIMESTAMPNTZ comment 'Creation Date Time of the occurrence',
    MD_SOURCE            VARCHAR(1000) comment 'Represents the source system, file, etc. of the instance',
    MD_SRC_SYSTEM        VARCHAR(100),
    MD_EXTRACT_DT        TIMESTAMPNTZ,
    IVD_SYSID            NUMBER comment 'System generated code to identify records',
    CURRENCY_CD          VARCHAR(3) comment 'Currency iso code',
    SYMBOL               VARCHAR(20) comment 'Standard code in the industry of mutual funds',
    IVD_ST_DESC_ENG      VARCHAR(40) comment 'Product detail status description English (Red/Transfer/Switch,Inactive,Active,Soft Cap,etc.)',
    IVD_ST_DESC_FRE      VARCHAR(40) comment 'Product detail status description French (Rachat/Transfert/Échange,Inactif,Actif,FRE:Soft Cap,etc.)',
    IVD_LOAD_DESC_ENG    VARCHAR(50) comment 'Product load description (Deferred Sales Charge,No Load,Initial Sales Charge,etc)',
    IVD_LOAD_DESC_FRE    VARCHAR(50) comment 'Product load description (Frais de ventes reportés,Sans frais d acquisition,Frais prélevés à l acquisition,etc)',
    IVT_NAME_ENG         VARCHAR(60) comment 'Product name in English',
    IVT_NAME_FRE         VARCHAR(60) comment 'Product name in French',
    IVT_CD_DESC_ENG      VARCHAR(50) comment 'Fund type English (regular, asset allocation)',
    IVT_CD_DESC_FRE      VARCHAR(50) comment 'Fund type French (régulier, affectation de l actif)',
    IVT_ST_DESC_ENG      VARCHAR(40) comment 'Product status description English (Red/Transfer/Switch,Inactive,Active,Soft Cap,etc.)',
    IVT_ST_DESC_FRE      VARCHAR(40) comment 'Product status description French (Rachat/Transfert/Échange,Inactif,Actif,FRE:Soft Cap,etc.)',
    ASSET_CLASS_DESC_ENG VARCHAR(80) comment 'Asset class description English (Canadian Equity, U.S. Money Market, etc)',
    ASSET_CLASS_DESC_FRE VARCHAR(80) comment 'Asset class description French(Actions canadiennes, Marché monétaire américain, etc)',
    ASSET_CTGY_DESC_ENG  VARCHAR(80) comment 'Asset category description English(Canadian Fixed Income, US Equity, etc)',
    ASSET_CTGY_DESC_FRE  VARCHAR(80) comment 'Asset category description French(Revenu fixe canadien, Actions américaines, etc)',
    IVT_TYPE_DESC_ENG    VARCHAR(40) comment 'Product type description English(Mutual Fund, Hedge Fund, etc)',
    IVT_TYPE_DESC_FRE    VARCHAR(40) comment 'Product type description French (Fonds communs de placement, Fonds spéculatif, etc)',
    CTGY_DESC_ENG        VARCHAR(50) comment 'Product category description English(Mutual Fund, Hedge Fund, etc)',
    CTGY_DESC_FRE        VARCHAR(50) comment 'Product category description French (Fonds communs de placement, Fonds spéculatif, etc)',
    GROUP_DESC_ENG       VARCHAR(20) comment 'Product group description English(Funds, Bond, etc)',
    GROUP_DESC_FRE       VARCHAR(20) comment 'Product group description French(Fonds, Obligations, etc)',
    MGT_CD               VARCHAR(100) comment 'Management company code',
    MGT_NAME_ENG         VARCHAR(100) comment 'Management company name English',
    MGT_NAME_FRE         VARCHAR(100) comment 'Management company name French'
)
    data_retention_time_in_days = 1;

create transient table IAS.INVESTMENT_PRODUCT_TYPE
(
    HK_HUB                  VARCHAR(64) comment 'Hash of the business keys',
    MD_START_DT             TIMESTAMPNTZ comment 'Start Date of the image/version',
    MD_HASHDIFF             VARCHAR(64) comment 'Represents the whole set of hashed attributes to be historized for an occurrence',
    MD_CREATION_DT          TIMESTAMPNTZ comment 'Creation Date Time of the occurrence',
    MD_SOURCE               VARCHAR(1000) comment 'Represents the source system, file, etc. of the instance',
    MD_SRC_SYSTEM           VARCHAR(100) comment 'Source system',
    MD_EXTRACT_DT           TIMESTAMPNTZ comment 'Extraction date of the occurrence',
    TI_ALTERNATE_ID         VARCHAR(50) comment 'Financial product ID',
    TI_ALTERNATE_TI_TYPE    VARCHAR(50) comment 'Financial product type ID',
    TI_TYPE                 VARCHAR(10) comment 'Financial product type',
    TI_ALTERNATE_TI_CLASS   VARCHAR(50) comment 'Financial product class ID',
    TI_CLASS                VARCHAR(50) comment 'Financial product class',
    TI_ALTERNATE_SHORT_DESC VARCHAR(100) comment 'Financial product short decsription',
    ENGLISH_DESCRIPTION     VARCHAR(512) comment 'Financial product description',
    TI_SYMBOL               VARCHAR(512) comment 'TI Symbol'
)
    data_retention_time_in_days = 1;

create table INVESTIA_UNIVERIS.MARKETPRODUCTS
(
    HK_HUB               VARCHAR(40) comment 'Hash key for the Hub',
    MD_START_DT          TIMESTAMPNTZ comment 'Start Date of the image/version',
    MD_HASHDIFF          VARCHAR(40) comment 'Represents the whole set of hashed attributes to be historized for an occurrence',
    MD_CREATION_DT       TIMESTAMPNTZ comment 'Creation Date Time of the occurrence',
    MD_SOURCE            VARCHAR(1000) comment 'Represents the source system, file, etc. of the instance',
    MD_SRC_SYSTEM        VARCHAR(100) comment 'Source system',
    MD_EXTRACT_DT        TIMESTAMPNTZ comment 'Source extraction date',
    IVD_SYSID            NUMBER comment 'System generated code to identify records',
    CURRENCY_CD          VARCHAR(3) comment 'Currency iso code',
    SYMBOL               VARCHAR(20) comment 'Standard code in the industry of mutual funds',
    IVD_ST_DESC_ENG      VARCHAR(40) comment 'Product detail status description English (Red/Transfer/Switch,Inactive,Active,Soft Cap,etc.)',
    IVD_ST_DESC_FRE      VARCHAR(40) comment 'Product detail status description French (Rachat/Transfert/Échange,Inactif,Actif,FRE:Soft Cap,etc.)',
    IVD_LOAD_DESC_ENG    VARCHAR(50) comment 'Product load description (Deferred Sales Charge,No Load,Initial Sales Charge,etc)',
    IVD_LOAD_DESC_FRE    VARCHAR(50) comment 'Product load description (Frais de ventes reportés,Sans frais d acquisition,Frais prélevés à l acquisition,etc)',
    IVT_NAME_ENG         VARCHAR(60) comment 'Product name in English',
    IVT_NAME_FRE         VARCHAR(60) comment 'Product name in French',
    IVT_CD_DESC_ENG      VARCHAR(50) comment 'Fund type English (regular, asset allocation)',
    IVT_CD_DESC_FRE      VARCHAR(50) comment 'Fund type French (régulier, affectation de l actif)',
    IVT_ST_DESC_ENG      VARCHAR(40) comment 'Product status description English (Red/Transfer/Switch,Inactive,Active,Soft Cap,etc.)',
    IVT_ST_DESC_FRE      VARCHAR(40) comment 'Product status description French (Rachat/Transfert/Échange,Inactif,Actif,FRE:Soft Cap,etc.)',
    ASSET_CLASS_DESC_ENG VARCHAR(80) comment 'Asset class description English (Canadian Equity, U.S. Money Market, etc)',
    ASSET_CLASS_DESC_FRE VARCHAR(80) comment 'Asset class description French(Actions canadiennes, Marché monétaire américain, etc)',
    ASSET_CTGY_DESC_ENG  VARCHAR(80) comment 'Asset category description English(Canadian Fixed Income, US Equity, etc)',
    ASSET_CTGY_DESC_FRE  VARCHAR(80) comment 'Asset category description French(Revenu fixe canadien, Actions américaines, etc)',
    IVT_TYPE_DESC_ENG    VARCHAR(40) comment 'Product type description English(Mutual Fund, Hedge Fund, etc)',
    IVT_TYPE_DESC_FRE    VARCHAR(40) comment 'Product type description French (Fonds communs de placement, Fonds spéculatif, etc)',
    CTGY_DESC_ENG        VARCHAR(50) comment 'Product category description English(Mutual Fund, Hedge Fund, etc)',
    CTGY_DESC_FRE        VARCHAR(50) comment 'Product category description French (Fonds communs de placement, Fonds spéculatif, etc)',
    GROUP_DESC_ENG       VARCHAR(20) comment 'Product group description English(Funds, Bond, etc)',
    GROUP_DESC_FRE       VARCHAR(20) comment 'Product group description French(Fonds, Obligations, etc)',
    MGT_CD               VARCHAR(4) comment 'Management company code',
    MGT_NAME_ENG         VARCHAR(60) comment 'Management company name English',
    MGT_NAME_FRE         VARCHAR(60) comment 'Management company name French'
);

create transient table INVESTIA_UNIVERIS.PLN_SRF
(
    HK_LINK                        VARCHAR(40) comment 'Hash key for the Link',
    HK_HUB_CONTRACT                VARCHAR(40) comment 'Hash key for HUB_CONTRACT',
    HK_HUB_INVESTMENT_PRODUCT_TYPE VARCHAR(40) comment 'Hash key for HUB_INVESTMENT_PRODUCT_TYPE',
    MD_START_DT                    TIMESTAMPNTZ comment 'Start Date of the image/version',
    MD_HASHDIFF                    VARCHAR(64) comment 'Represents the whole set of hashed attributes to be historized for an occurrence',
    MD_CREATION_DT                 TIMESTAMPNTZ comment 'Creation Date Time of the occurrence',
    MD_SOURCE                      VARCHAR(1000) comment 'Represents the source system, file, etc. of the instance',
    MD_SRC_SYSTEM                  VARCHAR(100) comment 'Source system',
    MD_EXTRACT_DT                  TIMESTAMPNTZ comment 'Source extraction date',
    PLN_SRF_SYSID                  NUMBER comment 'Plan SRF ID (main key)',
    PLN_SYSID                      NUMBER comment 'Plan ID (related to PLN)',
    FAS_FILE_NAME                  VARCHAR(80) comment 'Fundserv File Name',
    FROM_DT                        TIMESTAMPNTZ comment 'From date',
    TO_DT                          TIMESTAMPNTZ comment 'To date',
    MGT_CD                         VARCHAR(6) comment 'Management Cie (related to MGT)',
    CURRENCY_CD                    VARCHAR(6) comment 'Currency Code',
    INCOME_TYPE                    VARCHAR(8) comment 'Type of Income',
    REP_CODE                       VARCHAR(10) comment 'Rep Code (related to REP)',
    COM_PYBL                       DOUBLE comment 'Commission Amount',
    EXCH_DT                        TIMESTAMPNTZ comment 'Exchange Rate Date',
    EXCH_RATE                      DOUBLE comment 'Exchange Rate',
    LAST_UPD_DT                    TIMESTAMPNTZ not null comment 'Last Update Date',
    USR_SYSID                      NUMBER comment 'User ID (related to SYS_USER_CD)',
    FISCAL_SYSID                   NUMBER comment 'Fiscal ID',
    JUR_CD                         VARCHAR(6) comment 'Jurisdiction Code',
    ACT_TAX_COLLCTD                DOUBLE,
    DLR_SYSID                      NUMBER comment 'Deal ID (related to DLR)',
    RGN_SYSID                      NUMBER comment 'Region ID (related to RGN)',
    BRN_SYSID                      NUMBER comment 'Branch ID (related to BRN)',
    REP_SYSID                      NUMBER comment 'Rep ID (related to REP)',
    IVR_SYSID                      NUMBER comment 'Investor (Client) ID (related to IVR)',
    IVD_SYSID                      NUMBER comment 'Product ID (related to IVD link with parent IVT)'
)
    data_retention_time_in_days = 1;

create transient table IAS_UNIVERIS.PLN_SRF
(
    HK_LINK                        VARCHAR(40) comment 'Hash key for the Link',
    HK_HUB_CONTRACT                VARCHAR(40) comment 'Hash key for HUB_CONTRACT',
    HK_HUB_INVESTMENT_PRODUCT_TYPE VARCHAR(40) comment 'Hash key for HUB_INVESTMENT_PRODUCT_TYPE',
    MD_START_DT                    TIMESTAMPNTZ comment 'Start Date of the image/version',
    MD_HASHDIFF                    VARCHAR(64) comment 'Represents the whole set of hashed attributes to be historized for an occurrence',
    MD_CREATION_DT                 TIMESTAMPNTZ comment 'Creation Date Time of the occurrence',
    MD_SOURCE                      VARCHAR(1000) comment 'Represents the source system, file, etc. of the instance',
    MD_SRC_SYSTEM                  VARCHAR(100) comment 'Source system',
    MD_EXTRACT_DT                  TIMESTAMPNTZ comment 'Source extraction date',
    PLN_SRF_SYSID                  NUMBER comment 'Plan SRF ID (main key)',
    PLN_SYSID                      NUMBER comment 'Plan ID (related to PLN)',
    FAS_FILE_NAME                  VARCHAR(40) comment 'Fundserv File Name',
    FROM_DT                        TIMESTAMPNTZ comment 'From date',
    TO_DT                          TIMESTAMPNTZ comment 'To date',
    MGT_CD                         VARCHAR(3) comment 'Management Cie (related to MGT)',
    CURRENCY_CD                    VARCHAR(3) comment 'Currency Code',
    INCOME_TYPE                    VARCHAR(4) comment 'Type of Income',
    REP_CODE                       VARCHAR(5) comment 'Rep Code (related to REP)',
    COM_PYBL                       DOUBLE comment 'Commission Amount',
    EXCH_DT                        TIMESTAMPNTZ comment 'Exchange Rate Date',
    EXCH_RATE                      DOUBLE comment 'Exchange Rate',
    LAST_UPD_DT                    TIMESTAMPNTZ not null comment 'Last Update Date',
    USR_SYSID                      NUMBER comment 'User ID (related to SYS_USER_CD)',
    FISCAL_SYSID                   NUMBER comment 'Fiscal ID',
    JUR_CD                         VARCHAR(3) comment 'Jurisdiction Code',
    ACT_TAX_COLLCTD                DOUBLE comment 'Unknown',
    DLR_SYSID                      NUMBER comment 'Deal ID (related to DLR)',
    RGN_SYSID                      NUMBER comment 'Region ID (related to RGN)',
    BRN_SYSID                      NUMBER comment 'Branch ID (related to BRN)',
    REP_SYSID                      NUMBER comment 'Rep ID (related to REP)',
    IVR_SYSID                      NUMBER comment 'Investor (Client) ID (related to IVR)',
    IVD_SYSID                      NUMBER comment 'Product ID (related to IVD link with parent IVT)'
)
    data_retention_time_in_days = 1;

create table PUBLIC.POC
(
    CATEGORY        VARCHAR(40),
    CLIENT_ID       VARCHAR(40),
    MASTER_CODE     VARCHAR(40),
    REVENUE_TYPE    VARCHAR(40),
    REVENUE_SUBTYPE VARCHAR(40),
    REVENUE_AMOUNT  NUMBER(38, 2)
);

create transient table IAS_IAVM.POSITION_PRICE
(
    HK_LINK        VARCHAR(40) comment 'Hash of the business keys',
    MD_START_DT    TIMESTAMPNTZ comment 'Start Date of the image/version',
    MD_HASHDIFF    VARCHAR(40) comment 'Represents the whole set of hashed attributes to be historized for an occurrence',
    MD_CREATION_DT TIMESTAMPNTZ comment 'Creation Date Time of the occurrence',
    MD_SOURCE      VARCHAR(1000) comment 'Represents the source system, file, etc. of the instance',
    MD_SRC_SYSTEM  VARCHAR(100) comment 'Source system',
    MD_EXTRACT_DT  TIMESTAMPNTZ comment 'Extraction date of the occurrence',
    PROCESSDATE    DATE comment 'Process Date',
    UNITOFMEASURE  NUMBER(11) comment 'Unit Of Measure',
    PRICE          NUMBER(38, 8) comment 'Price',
    SYMBOL         VARCHAR(26) comment 'SECURITY_SYMBOL',
    MARKET         VARCHAR(12) comment 'Market',
    ACCOUNTID      VARCHAR(18) comment 'Account ID',
    CLOSEPRICE     NUMBER(38, 8) comment 'Close Price',
    PRICECURRENCY  VARCHAR(3) comment 'Price Currency',
    BIDPRICE       NUMBER(38, 8) comment 'Bid Price',
    ASKPRICE       NUMBER(38, 8) comment 'Ask Price'
)
    data_retention_time_in_days = 1;

create table STEWARDSHIP.PRODUCTION_SHARE_TEST_MANUAL_ADVISOR_RVP
(
    ADVISOR  VARCHAR(512),
    TEAM     VARCHAR(512),
    REPID    VARCHAR(512),
    RVP      VARCHAR(512),
    PROVINCE VARCHAR(512),
    EXCLUDE  NUMBER
);

create table STEWARDSHIP.PRODUCTION_SHARE_TEST_MAPPING_OPER_TYPE
(
    DESCRIPTION_EN       VARCHAR(60),
    DESCRIPTION_SHORT_EN VARCHAR(30),
    DESCRIPTION_FR       VARCHAR(60),
    DESCRIPTION_SHORT_FR VARCHAR(30),
    IBMSOURCE            VARCHAR(12),
    LEVEL                NUMBER(11),
    OPERATION_TYPE       VARCHAR(3),
    DISPLAY              NUMBER(11),
    CASHFLOW_SUMMARY     VARCHAR(4),
    ISCASHFLOW           NUMBER(11)
);

create table STEWARDSHIP.PRODUCTION_SHARE_TEST_MONTHLY_MILESTONES
(
    ADVISOR  VARCHAR(512),
    TEAM     VARCHAR(512),
    REPID    VARCHAR(512),
    RVP      VARCHAR(512),
    PROVINCE VARCHAR(512),
    AUA_DEC  NUMBER(34, 4),
    AUA_JAN  NUMBER(34, 4),
    AUA_FEB  NUMBER(34, 4)
);

create transient table IAS_IAVM.PRODUCTION_SHARE_TEST_POSITION
(
    UNITOFMEASURE NUMBER(11) comment 'Unit Of Measure',
    PRICE         NUMBER(38, 8) comment 'Price',
    SYMBOL        VARCHAR(26) comment 'SECURITY_SYMBOL',
    MARKET        VARCHAR(12) comment 'Market',
    PROCESSDATE   DATE not null comment 'Process Date',
    MD_LOADDATE   DATE comment 'Load Date',
    MD_SRCSYSTEM  VARCHAR(36)
)
    data_retention_time_in_days = 1;

create table IAS_IAVM.PRODUCTION_SHARE_TEST_POSITION_HIST
(
    UNITOFMEASURE NUMBER(11) comment 'Unit Of Measure',
    PRICE         NUMBER(38, 8) comment 'Price',
    SYMBOL        VARCHAR(26) comment 'SECURITY_SYMBOL',
    MARKET        VARCHAR(12) comment 'Market',
    PROCESSDATE   DATE not null comment 'Process Date',
    MD_LOADDATE   DATE comment 'Load Date',
    MD_SRCSYSTEM  VARCHAR(36)
);

create table STEWARDSHIP.PRODUCTION_SHARE_TEST_PRODUCT_ASSET_CATEGORY
(
    TI_ALTERNATE_TI_TYPE VARCHAR(50),
    ASSET_CATEGORY       VARCHAR(512)
);

create table STEWARDSHIP.PRODUCTION_SHARE_TEST_RAPCODE_PLAN
(
    ACCOUNT_RAP_CODE      VARCHAR(10),
    RETAIL_PLAN           VARCHAR(100),
    PLAN_LABEL            VARCHAR(512),
    ACCOUNT_TYPE          VARCHAR(512),
    GROUP_TYPE_CODE       VARCHAR(100),
    ASC_1_RESP_PLAN_TYPES VARCHAR(100),
    ACCUMULATION_TYPE     VARCHAR(100)
);

create table IAS.PRODUCTION_SHARE_TEST_TRANSACTIONS
(
    A_C_ID                  VARCHAR(100) comment 'Account ID',
    A_C_REPRESENTATIVE      VARCHAR(50) comment 'Advisor RR code',
    TI_ALTERNATE_ID         VARCHAR(50) comment 'Financial product ID',
    TI_ALTERNATE_TI_TYPE    VARCHAR(50) comment 'Financial product type ID',
    TRAN_ENTRY_DESCRIPTION  VARCHAR(50) comment 'Description of the trading',
    TRAN_USER_DESCRIPTION   VARCHAR(50) comment 'Description of the trading',
    TRAN_TRADING_TYPE       VARCHAR(10) comment 'Type of the trading : Sell, Buy,...',
    TRANSACTION             NUMBER comment 'Transaction ID',
    TRAN_TRADING_GROSS_AMT  NUMBER(38, 2) comment 'Transaction gross amount in CAD or USD',
    TRAN_TRADING_CURRENCY   VARCHAR(10) comment 'Transaction amounts currency',
    TRAN_TRADING_NET_AMT    NUMBER(38, 2) comment 'Transaction net amount in CAD or USD',
    TRAN_TRADING_TRADE_DATE DATE comment 'Trade date',
    TRAN_TRADING_SETT_DATE  DATE comment 'Settlement date',
    TRAN_PROCESS_DATE       DATE comment 'Process date',
    TI_SYMBOL               VARCHAR(50) comment 'Product symbol',
    TRAN_QTY                NUMBER(38, 4) comment 'Quantity',
    TI_PRIMARY_MARKET       VARCHAR(50) comment 'Primary market',
    TRAN_TXN_REFERENCE_ID   VARCHAR(50) comment 'Tax reference ID',
    TRAN_AMOUNT_2           NUMBER(38, 2) comment 'Transaction amount 2',
    MD_SRC                  VARCHAR(50) comment 'Main source table for the data',
    MD_LOADDATE             TIMESTAMPNTZ,
    MD_SRCSYSTEM            VARCHAR(50),
    TI_UNDERLYING_CDN_PRICE NUMBER(38, 8) comment 'TI Underlying CDN Price, this field and above fields were added for OG calculation',
    TI_BASIS_POINT          NUMBER(38, 5) comment 'TI Basis Point',
    TI_FACE_VALUE           NUMBER(38, 5) comment 'TI Face Value',
    TI_ISSUE_PRICE          NUMBER(38, 5) comment 'TI Issue Price',
    STRIKE_PRICE            NUMBER(38, 8) comment 'STRIKE PRICE',
    TI_UNDERLYING_USD_PRICE NUMBER(38, 8) comment 'TI Underlying USD Price'
);

create transient table IAS_IAVM.REF_EXCHANGE_RATE
(
    HK_LINK        VARCHAR(64) comment 'Hash of the business keys',
    MD_START_DT    TIMESTAMPNTZ comment 'Start Date of the image/version',
    MD_HASHDIFF    VARCHAR(64) comment 'Represents the whole set of hashed attributes to be historized for an occurrence',
    MD_CREATION_DT TIMESTAMPNTZ comment 'Creation Date Time of the occurrence',
    MD_SOURCE      VARCHAR(1000) comment 'Represents the source system, file, etc. of the instance',
    MD_SRC_SYSTEM  VARCHAR(100) comment 'Source system',
    MD_EXTRACT_DT  TIMESTAMPNTZ comment 'Extraction date of the occurrence',
    EXCHANGEDATE   DATE comment 'Exchange rate date',
    EXCHANGERATE   NUMBER(38, 8) comment 'Conversion rate from USD to CAD',
    REVNO          NUMBER comment 'Modification version number'
)
    data_retention_time_in_days = 1;

create transient table IAS_IAVM.REF_HOLIDAYS
(
    HK_HUB         VARCHAR(40) comment 'Hash key for the Hub',
    MD_START_DT    TIMESTAMPNTZ comment 'Start Date of the image/version',
    MD_HASHDIFF    VARCHAR(40) comment 'Represents the whole set of hashed attributes to be historized for an occurrence',
    MD_CREATION_DT TIMESTAMPNTZ comment 'Creation Date Time of the occurrence',
    MD_SOURCE      VARCHAR(1000) comment 'Represents the source system, file, etc. of the instance',
    MD_SRC_SYSTEM  VARCHAR(100) comment 'Source system',
    MD_EXTRACT_DT  TIMESTAMPNTZ comment 'Extraction date of the occurrence',
    HOLIDAY_DATE   DATE comment 'Date of the holiday',
    DESCRIPTION    VARCHAR(512) comment 'Description of the holiday'
)
    data_retention_time_in_days = 1;

create transient table IAS.REF_INVESTMENT_SAVING_PROGRAM_TYPES
(
    HK_HUB            VARCHAR(40) comment 'Hash of the business keys',
    MD_START_DT       TIMESTAMPNTZ comment 'Start Date of the image/version',
    MD_HASHDIFF       VARCHAR(40) comment 'Represents the whole set of hashed attributes to be historized for an occurrence',
    MD_CREATION_DT    TIMESTAMPNTZ comment 'Creation Date Time of the occurrence',
    MD_SOURCE         VARCHAR(1000) comment 'Represents the source system, file, etc. of the instance',
    MD_SRC_SYSTEM     VARCHAR(100) comment 'Source system',
    MD_EXTRACT_DT     TIMESTAMPNTZ comment 'Extraction date of the occurrence',
    A_C_ACCOUNT_CLASS VARCHAR(50) comment 'Account class : 038, 040, ...',
    RETAIL_PLAN       VARCHAR(50) comment 'Retail plan code : RS, LF, ...',
    RETAIL_PLAN_RESP  VARCHAR(10) comment 'To be defined',
    ACCOUNT_RAP_CODE  VARCHAR(10) comment 'To be defined : Last letter of an account ID'
)
    data_retention_time_in_days = 1;

create transient table IAS_UNIVERIS.REF_INVESTMENT_SAVING_PROGRAM_TYPES
(
    HK_HUB             VARCHAR(40) comment 'Hash of the business keys',
    MD_START_DT        TIMESTAMPNTZ comment 'Start Date of the image/version',
    MD_HASHDIFF        VARCHAR(40) comment 'Represents the whole set of hashed attributes to be historized for an occurrence',
    MD_CREATION_DT     TIMESTAMPNTZ comment 'Creation Date Time of the occurrence',
    MD_SOURCE          VARCHAR(1000) comment 'Represents the source system, file, etc. of the instance',
    MD_SRC_SYSTEM      VARCHAR(100) comment 'Source system',
    MD_EXTRACT_DT      TIMESTAMPNTZ comment 'Source extraction date',
    PLN_CD             VARCHAR(8000) comment 'Plan code',
    PLN_REG            NUMBER comment 'Plan registration',
    PLN_MNEM           VARCHAR(8000) comment 'Plan mnemonic code',
    PLN_DESC           VARCHAR(8000) comment 'Plan mnemonic description',
    PLN_MNEM_F         VARCHAR(8000) comment 'plan mnemonic code FR',
    PLN_DESC_F         VARCHAR(8000) comment 'Plan mnemonic description FR',
    PLN_MNEM_ENG       VARCHAR(8000) comment 'Plan mnemonic code 2 EN',
    PLN_DESC_ENG       VARCHAR(8000) comment 'Plan mnemonic description 2 EN',
    PLN_SHORT_DESC_ENG VARCHAR(8000) comment 'Plan short description EN',
    PLN_MNEM_FRE       VARCHAR(8000) comment 'Plan mnemonic code 2 FR',
    PLN_DESC_FRE       VARCHAR(8000) comment 'Plan mnemonic description 2 FR',
    PLN_SHORT_DESC_FRE VARCHAR(8000) comment 'plan short description 2 FR',
    STMT_GROUP_MNEM    VARCHAR(8000) comment 'mnemonic code grouping'
)
    data_retention_time_in_days = 1;

create transient table INVESTIA_UNIVERIS.REF_INVESTMENT_SAVING_PROGRAM_TYPES
(
    HK_HUB             VARCHAR(40) comment 'Hash of the business keys',
    MD_START_DT        TIMESTAMPNTZ comment 'Start Date of the image/version',
    MD_HASHDIFF        VARCHAR(40) comment 'Represents the whole set of hashed attributes to be historized for an occurrence',
    MD_CREATION_DT     TIMESTAMPNTZ comment 'Creation Date Time of the occurrence',
    MD_SOURCE          VARCHAR(1000) comment 'Represents the source system, file, etc. of the instance',
    MD_SRC_SYSTEM      VARCHAR(100) comment 'Source system',
    MD_EXTRACT_DT      TIMESTAMPNTZ comment 'Source extraction date',
    PLN_CD             VARCHAR(255) comment 'Plan code',
    PLN_REG            NUMBER comment 'Plan registration',
    PLN_MNEM           VARCHAR(255) comment 'Plan mnemonic code',
    PLN_DESC           VARCHAR(255) comment 'Plan mnemonic description',
    PLN_MNEM_F         VARCHAR(255) comment 'plan mnemonic code FR',
    PLN_DESC_F         VARCHAR(255) comment 'Plan mnemonic description FR',
    PLN_MNEM_ENG       VARCHAR(255) comment 'Plan mnemonic code 2 EN',
    PLN_DESC_ENG       VARCHAR(255) comment 'Plan mnemonic description 2 EN',
    PLN_SHORT_DESC_ENG VARCHAR(255) comment 'Plan short description EN',
    PLN_MNEM_FRE       VARCHAR(255) comment 'Plan mnemonic code 2 FR',
    PLN_DESC_FRE       VARCHAR(255) comment 'Plan mnemonic description 2 FR',
    PLN_SHORT_DESC_FRE VARCHAR(255) comment 'plan short description 2 FR',
    STMT_GROUP_MNEM    VARCHAR(255) comment 'mnemonic code grouping'
)
    data_retention_time_in_days = 1;

create table STEWARDSHIP.REF_KPI_TARGET_FIRM
(
    HK_HUB         VARCHAR(40) comment 'HASH KEY FOR THE HUB',
    MD_START_DT    TIMESTAMPNTZ comment 'START DATE OF THE IMAGE/VERSION',
    MD_HASHDIFF    VARCHAR(40) comment 'REPRESENTS THE WHOLE SET OF HASHED ATTRIBUTES TO BE HISTORIZED FOR AN OCCURRENCE',
    MD_CREATION_DT TIMESTAMPNTZ comment 'CREATION DATE TIME OF THE OCCURRENCE',
    MD_SOURCE      VARCHAR(1000) comment 'REPRESENTS THE SOURCE SYSTEM, FILE, ETC. OF THE INSTANCE',
    MD_SRC_SYSTEM  VARCHAR(100) comment 'SOURCE SYSTEM',
    MD_EXTRACT_DT  TIMESTAMPNTZ comment 'EXTRACTION DATE OF THE OCCURRENCE',
    KPI_DATE       DATE comment 'THE END OF EVERY MONTHS DATE FOR THE SET TARGET',
    METRIC_NAME    VARCHAR(512) comment 'KPI MERIC NAME',
    TARGET         NUMBER(38, 2) comment 'THE TARGET METRIC VALEUS'
);

create table STEWARDSHIP.REF_KPI_TARGET_RVP
(
    HK_HUB         VARCHAR(40) comment 'HASH KEY FOR THE HUB',
    MD_START_DT    DATE comment 'START DATE OF THE IMAGE/VERSION',
    MD_HASHDIFF    VARCHAR(40) comment 'REPRESENTS THE WHOLE SET OF HASHED ATTRIBUTES TO BE HISTORIZED FOR AN OCCURRENCE',
    MD_CREATION_DT TIMESTAMPNTZ comment 'CREATION DATE TIME OF THE OCCURRENCE',
    MD_SOURCE      VARCHAR(1000) comment 'REPRESENTS THE SOURCE SYSTEM, FILE, ETC. OF THE INSTANCE',
    MD_SRC_SYSTEM  VARCHAR(100) comment 'SOURCE SYSTEM',
    MD_EXTRACT_DT  DATE comment 'EXTRACTION DATE OF THE OCCURRENCE',
    KPI_DATE       DATE comment 'DATE OF THE PROJECTED TARGET KPI METRIC ',
    METRIC_NAME    VARCHAR(512) comment 'A DESCRIPTION OF THE RELATED METRIC''S NAME',
    TARGET         NUMBER(36, 2) comment 'THE TARGET METRIC VALUE',
    RVP_NAME       VARCHAR(512) comment 'THE REGIONAL VICE PRESIDENT''S NAME',
    RVP_ID         NUMBER(2) comment 'RVP''S ID'
);

create transient table STEWARDSHIP.REF_MANUAL_ADVISOR_RVP
(
    HK_HUB         VARCHAR(40) comment 'Hash key for the Hub',
    MD_START_DT    TIMESTAMPNTZ comment 'Start Date of the image/version',
    MD_HASHDIFF    VARCHAR(40) comment 'Represents the whole set of hashed attributes to be historized for an occurrence',
    MD_CREATION_DT TIMESTAMPNTZ comment 'Creation Date Time of the occurrence',
    MD_SOURCE      VARCHAR(1000) comment 'Represents the source system, file, etc. of the instance',
    MD_SRC_SYSTEM  VARCHAR(100) comment 'Source system',
    MD_EXTRACT_DT  TIMESTAMPNTZ comment 'Extraction date of the occurrence',
    ADVISOR        VARCHAR(512) comment 'Advisor code',
    TEAM           VARCHAR(512) comment 'Team name',
    REPID          VARCHAR(512) comment 'Representative ID',
    RVP            VARCHAR(512) comment 'RVP ID',
    PROVINCE       VARCHAR(512) comment 'Province code (QC, ON, ...)',
    IND_EXCLUDE    BOOLEAN comment 'Exclusion flag, 1 is excluded, 0 is not excluded'
)
    data_retention_time_in_days = 1;

create transient table STEWARDSHIP.REF_MAPPING_OPER_TYPE
(
    HK_HUB               VARCHAR(64) comment 'Hash of the business keys',
    MD_START_DT          TIMESTAMPNTZ comment 'Start Date of the image/version',
    MD_HASHDIFF          VARCHAR(64) comment 'Represents the whole set of hashed attributes to be historized for an occurrence',
    MD_CREATION_DT       TIMESTAMPNTZ comment 'Creation Date Time of the occurrence',
    MD_SOURCE            VARCHAR(1000) comment 'Represents the source system, file, etc. of the instance',
    MD_SRC_SYSTEM        VARCHAR(100) comment 'Source system',
    MD_EXTRACT_DT        TIMESTAMPNTZ comment 'Extraction date of the occurrence',
    DESCRIPTION_EN       VARCHAR(60) comment 'Operation description EN exp: Interests, Fees, Redemption, etc...',
    DESCRIPTION_SHORT_EN VARCHAR(30) comment 'Operation short description EN',
    DESCRIPTION_FR       VARCHAR(60) comment 'Operation description FR exp: Intérêts, Frais, Remboursement, etc...',
    DESCRIPTION_SHORT_FR VARCHAR(30) comment 'Operation description FR',
    IBMSOURCE            VARCHAR(12) comment 'IBM Source',
    LEVEL                NUMBER(11) comment 'Level Code',
    OPERATION_TYPE       VARCHAR(3) comment 'Operation type code exp: INT, FEE, RED, etc...',
    DISPLAY              NUMBER(11) comment 'Display number',
    CASHFLOW_SUMMARY     VARCHAR(4) comment 'CASHFLOW SUMMARY',
    ISCASHFLOW           NUMBER(11) comment 'Cash flow indicator (0 or 1)'
)
    data_retention_time_in_days = 1;

create transient table IAS_IAVM.REF_MAPPING_PRODUCT_TYPE
(
    HK_HUB                VARCHAR(64) comment 'Hash of the business keys',
    MD_START_DT           TIMESTAMPNTZ comment 'Start Date of the image/version',
    MD_HASHDIFF           VARCHAR(64) comment 'Represents the whole set of hashed attributes to be historized for an occurrence',
    MD_CREATION_DT        TIMESTAMPNTZ comment 'Creation Date Time of the occurrence',
    MD_SOURCE             VARCHAR(1000) comment 'Represents the source system, file, etc. of the instance',
    MD_SRC_SYSTEM         VARCHAR(100) comment 'Source system',
    MD_EXTRACT_DT         TIMESTAMPNTZ comment 'Extraction date of the occurrence',
    DESCRIPTIONEN         VARCHAR(512) comment 'Product type description EN',
    DESCRIPTIONFR         VARCHAR(512) comment 'Product type description FR',
    TI_ALTERNATE_TI_TYPE  VARCHAR(50) comment 'Financial product type ID',
    TI_ALTERNATE_TI_CLASS VARCHAR(50) comment 'Product type class code',
    PRODUCTTYPE           VARCHAR(100) comment 'Product type code'
)
    data_retention_time_in_days = 1;

create table INVESTIA_UNIVERIS.REF_MASK_PII
(
    FIRST_NAME    VARCHAR(25),
    LAST_NAME     VARCHAR(25),
    EMAIL_ADDRESS VARCHAR(50),
    SIN           VARCHAR(25),
    PHONE         VARCHAR(25),
    ADDRESS       VARCHAR(50),
    CITY          VARCHAR(50),
    POSTAL        VARCHAR(50),
    COUNTRY       VARCHAR(50)
);

create table INVESTIA_UNIVERIS.REF_MASK_PII_TRG
(
    FIRST_NAME    VARCHAR(25),
    LAST_NAME     VARCHAR(25),
    EMAIL_ADDRESS VARCHAR(50),
    SIN           VARCHAR(25),
    PHONE         VARCHAR(25),
    ADDRESS       VARCHAR(50),
    CITY          VARCHAR(50),
    POSTAL        VARCHAR(50),
    COUNTRY       VARCHAR(50)
);

create table EXTERNAL_KPI.REF_MASTER_KPI_DATA_CLARINGTON
(
    HK_HUB                                      VARCHAR(40) comment 'Hash key for the Hub',
    MD_START_DT                                 TIMESTAMPNTZ comment 'Start Date of the image/version',
    MD_HASHDIFF                                 VARCHAR(40) comment 'Represents the whole set of hashed attributes to be historized for an occurrence',
    MD_CREATION_DT                              TIMESTAMPNTZ comment 'Creation Date Time of the occurrence',
    MD_SOURCE                                   VARCHAR(1000) comment 'Represents the source system, file, etc. of the instance',
    MD_SRC_SYSTEM                               VARCHAR(100) comment 'Source system',
    MD_EXTRACT_DT                               TIMESTAMPNTZ comment 'Extraction date of the occurrence',
    KPI_DATE                                    TIMESTAMPNTZ comment 'Date',
    TRADE_ACCOUNT_PROCESSING_AUTOMATION_PCT_MF  NUMBER(20, 4) comment 'Trade/Account Processing Automation % MF',
    TRADE_ACCOUNT_PROCESSING_AUTOMATION_PCT_GIF NUMBER(20, 4) comment 'Trade/Account Processing Automation % GIF',
    FTE                                         NUMBER(20, 4) comment 'FTE',
    TOTAL_TRANSACTIONS_MF                       NUMBER(20, 4) comment 'Total Transactions MF',
    TOTAL_TRANSACTIONS_GIF                      NUMBER(20, 4) comment 'Total Transactions GIF',
    TOTAL_TRANSACTIONS_FTE_MF                   NUMBER(20, 4) comment 'Total Transactions/FTE MF',
    TOTAL_TRANSACTIONS_FTE_GIF                  NUMBER(20, 4) comment 'Total Transactions/FTE GIF',
    NO_OF_ACCOUNTS                              NUMBER(20, 4) comment 'No. of Accounts',
    ACCOUNTS_FTE                                NUMBER(20, 4) comment 'Accounts/FTE',
    ACCOUNTS_FTE_TARGET                         NUMBER(20, 4) comment 'Accounts/FTE Target',
    YOY_NEW_ACCOUNTS_CLIENT_NAME                NUMBER(20, 4) comment 'YoY New Accounts Client Name',
    YOY_NEW_ACCOUNTS_CLIENT_NOMINEE             NUMBER(20, 4) comment 'YoY New Accounts Client Nominee',
    TOTAL_ACCOUNTS_IN_NOMINEE                   NUMBER(20, 4) comment 'Total Account in Nominee %',
    EXPENSES                                    NUMBER(20, 4) comment 'Expenses',
    REVENUES                                    NUMBER(20, 4) comment 'Revenues',
    EFFICIENCY_RATIO                            NUMBER(20, 4) comment 'Efficiency Ratio',
    EXPENSES_TARGET                             NUMBER(20, 4) comment 'Expenses Target',
    REVENUE_TARGET                              NUMBER(20, 4) comment 'Revenue Target',
    EFFICIENCY_RATIO_TARGET                     NUMBER(20, 4) comment 'Efficiency Ratio Target',
    TOTAL_ASSETS                                NUMBER(20, 4) comment 'Total Assets',
    AFFILIATE_PENETRATION_IIROC                 NUMBER(20, 4) comment 'Affiliate Penetration IIROC',
    AFFILIATE_PENETRATION_IIROC_TARGET          NUMBER(20, 4) comment 'Affiliate Penetration IIROC Target',
    AFFILIATE_PENETRATION_MFDA                  NUMBER(20, 4) comment 'Affiliate Penetration MFDA',
    AFFILIATE_PENETRATION_MFDA_TARGET           NUMBER(20, 4) comment 'Affiliate Penetration MFDA Target',
    GROSS_MARGIN                                NUMBER(20, 4) comment 'Gross Margin',
    GROSS_MARGIN_TARGET                         NUMBER(20, 4) comment 'Gross Margin Target',
    NET_SALES                                   NUMBER(20, 4) comment 'Net Sales'
);

create table EXTERNAL_KPI.REF_MASTER_KPI_DATA_IAPW
(
    HK_HUB                            VARCHAR(40) comment ' Hash key for the Hub ',
    MD_START_DT                       TIMESTAMPNTZ comment ' Start Date of the image/version ',
    MD_HASHDIFF                       VARCHAR(40) comment ' Represents the whole set of hashed attributes to be historized for an occurrence ',
    MD_CREATION_DT                    TIMESTAMPNTZ comment ' Creation Date Time of the occurrence ',
    MD_SOURCE                         VARCHAR(1000) comment ' Represents the source system, file, etc. of the instance ',
    MD_SRC_SYSTEM                     VARCHAR(100) comment ' Source system ',
    MD_EXTRACT_DT                     TIMESTAMPNTZ comment ' Extraction date of the occurrence ',
    KPI_DATE                          TIMESTAMPNTZ comment 'KPI Date',
    NO_OF_ACTIVE_CLIENTS              NUMBER(38, 4) comment 'No. of Active Clients',
    NO_OF_ACTIVE_ACCOUNTS             NUMBER(38, 4) comment 'No. of Active Accounts',
    FTE                               NUMBER(38, 4) comment 'FTE',
    ACCOUNTS_FTE                      NUMBER(38, 4) comment 'Accounts/FTE',
    ACCOUNTS_FTE_TARGET               NUMBER(38, 4) comment 'Accounts/FTE Target',
    APPWAY_REGISTRATION               NUMBER(38, 4) comment 'Appway % Registration',
    APPWAY_REGISTRATION_TARGET        NUMBER(38, 4) comment 'Appway % Registration Target',
    NO_OF_CLIENT_ID_REGISTERED        NUMBER(38, 4) comment 'No. of Client ID registered',
    PORTAL_REGISTRATION               NUMBER(38, 4) comment 'Portal % registration',
    PORTAL_REGISTRATION_TARGET        NUMBER(38, 4) comment 'Portal % registration Target',
    MYPORTFOLIO_TO_NEW_CLIENT         NUMBER(38, 4) comment 'MyPortfolio+ to new client',
    E_DELIVERY_PORTFOLIO_STATEMENTS   NUMBER(38, 4) comment 'E-Delivery Portfolio Statements',
    E_DELIVERY_TAX_SLIPS              NUMBER(38, 4) comment 'E-Delivery Tax Slips',
    E_DELIVERY_CONFIRMS               NUMBER(38, 4) comment 'E-Delivery Confirms',
    AVG_E_DELIVERY_REGISTRATION       NUMBER(38, 4) comment 'Avg. E-Delivery % registration',
    E_DELIVERY_REGISTRATION_TARGET    NUMBER(38, 4) comment 'E-Delivery % registration Target',
    RETAIL_YTD_EXPENSES               NUMBER(38, 4) comment 'Retail YTD Expenses',
    RETAIL_YTD_REVENUES               NUMBER(38, 4) comment 'Retail YTD Revenues',
    RETAIL_FINANCIAL_EFFICIENCY_RATIO NUMBER(38, 4) comment 'Retail Financial Efficiency Ratio',
    RETAIL_YTD_EXPENSES_TARGET        NUMBER(38, 4) comment 'Retail YTD Expenses Target',
    RETAIL_YTD_REVENUES_TARGET        NUMBER(38, 4) comment 'Retail YTD Revenues Target',
    RETAIL_EFFICIENCY_RATIO_TARGET    NUMBER(38, 4) comment 'Retail Efficiency Ratio Target',
    CAP_MRKTS_YTD_EXPENSES            NUMBER(38, 4) comment 'Cap. Mrkts YTD Expenses',
    CAP_MKTS_YTD_REVENUES             NUMBER(38, 4) comment 'Cap. Mkts YTD Revenues',
    CAP_MRKTS_EFFICIENCY_RATIO        NUMBER(38, 4) comment 'Cap. Mrkts Efficiency Ratio',
    CAP_MRKTS_YTD_EXPENSES_TARGET     NUMBER(38, 4) comment 'Cap. Mrkts YTD Expenses Target',
    CAP_MRKTS_YTD_REVENUES_TARGET     NUMBER(38, 4) comment 'Cap. Mrkts YTD Revenues Target',
    CAP_MRKTS_EFFICIENCY_RATIO_TARGET NUMBER(38, 4) comment 'Cap. Mrkts Efficiency Ratio Target',
    TOTAL_ASSETS                      NUMBER(38, 4) comment 'Total Assets',
    NET_TOTAL_REVENUE                 NUMBER(38, 4) comment 'Net Total Revenue',
    NET_TOTAL_REVENUE_TARGET          NUMBER(38, 4) comment 'Net Total Revenue Target',
    NET_BOND_DESK_REVENUE             NUMBER(38, 4) comment 'Net Bond Desk Revenue',
    NET_BOND_DESK_REVENUE_TARGET      NUMBER(38, 4) comment 'Net Bond Desk Revenue Target',
    CAPITAL_MKTS_REVENUE              NUMBER(38, 4) comment 'Capital Mkts Revenue',
    CAPITAL_MKTS_REVENUE_TARGET       NUMBER(38, 4) comment 'Capital Mkts Revenue Target',
    NET_RETAIL_REVENUE                NUMBER(38, 4) comment 'Net Retail Revenue',
    NET_RETAIL_REVENUE_TARGET         NUMBER(38, 4) comment 'Net Retail Revenue Target',
    RECRUITING                        NUMBER(38, 4) comment 'Recruiting',
    TERMINATED_ADVISORS               NUMBER(38, 4) comment 'Terminated Advisors',
    ORGANIC_GROWTH                    NUMBER(38, 4) comment 'Organic Growth',
    SMALL_HOUSEHOLDS                  NUMBER(38, 4) comment 'Metric Reporting On Households',
    US_ASSETS                         NUMBER(38, 4) comment 'Assets Held Under US Dealer',
    EBIT_RETAIL                       NUMBER(38, 4) comment 'Retail Earnings Before Interest And Taxes',
    EBIT_TOTAL                        NUMBER(38, 4) comment 'Retail Total Earnings Before Interest And Taxes'
);

create transient table EXTERNAL_KPI.REF_MASTER_KPI_DATA_INVESTIA
(
    HK_HUB                            VARCHAR(40) comment ' Hash key for the Hub ',
    MD_START_DT                       TIMESTAMPNTZ comment ' Start Date of the image/version ',
    MD_HASHDIFF                       VARCHAR(40) comment ' Represents the whole set of hashed attributes to be historized for an occurrence ',
    MD_CREATION_DT                    TIMESTAMPNTZ comment ' Creation Date Time of the occurrence ',
    MD_SOURCE                         VARCHAR(1000) comment ' Represents the source system, file, etc. of the instance ',
    MD_SRC_SYSTEM                     VARCHAR(100) comment ' Source system ',
    MD_EXTRACT_DT                     TIMESTAMPNTZ comment ' Extraction date of the occurrence ',
    KPI_DATE                          TIMESTAMPNTZ comment ' KPI Date ',
    NO_CLIENT_ID                      NUMBER(20, 4) comment ' # Client ID ',
    E_DELIVERY                        NUMBER(20, 4) comment ' E-delivery ',
    E_DELIVERY_PCT                    NUMBER(20, 4) comment ' % E-delivery ',
    E_DELIVERY_TARGET_PCT             NUMBER(20, 4) comment ' % E-delivery Target ',
    PORTAL_REGISTRATION               NUMBER(20, 4) comment ' Portal Registration ',
    PORTAL_REGISTRATION_PCT           NUMBER(20, 4) comment ' % Portal Registration ',
    PORTAL_REGISTRATION_TARGET        NUMBER(20, 4) comment ' Portal Registration Target ',
    FTE                               NUMBER(20, 4) comment ' FTE ',
    CLIENTS_BY_FTE                    NUMBER(20, 4) comment ' Clients by FTE ',
    CLIENTS_BY_FTE_TARGET             NUMBER(20, 4) comment ' Clients by FTE Target ',
    NO_OF_ACCOUNTS                    NUMBER(20, 4) comment ' No of accounts ',
    ACCOUNTS_BY_FTE                   NUMBER(20, 4) comment ' Accounts by FTE ',
    ACTUAL_YTD_EXPENSES               NUMBER(20, 4) comment ' Actual YTD Expenses ',
    ACTUAL_YTD_REVENUES               NUMBER(20, 4) comment ' Actual YTD Revenues ',
    EFFICIENCY_RATIO                  NUMBER(20, 4) comment ' Efficiency Ratio ',
    YTD_EXPENSES_TARGET               NUMBER(20, 4) comment ' YTD Expenses Taregt ',
    YTD_REVENUES_TARGET               NUMBER(20, 4) comment ' YTD Revenues Target ',
    EFFICIENCY_RATIO_TARGET           NUMBER(20, 4) comment ' Efficiency Ratio Target ',
    AUA_IN_NOMINEE                    NUMBER(20, 4) comment ' AUA in Nominee ',
    AUA_IN_CLIENT_NAME                NUMBER(20, 4) comment ' AUA in Client Name ',
    NO_OF_RPAS_IMPLEMENTED            NUMBER(20, 4) comment ' # of RPAs implemented ',
    HOURS_SAVED_DUE_TO_RPAS           NUMBER(20, 4) comment ' Hours Saved due to RPAs ',
    CONTINUOUS_IMPROVEMENT_QUICK_WINS NUMBER(20, 4) comment ' Continuous improvement/quick wins ',
    TOTAL_ASSETS                      NUMBER(20, 4) comment ' Total Assets  ',
    ORGANIC_GROWTH                    NUMBER(20, 4) comment ' Organic Growth  ',
    TOTAL_REVENUE                     NUMBER(20, 4) comment ' Total Revenue  ',
    TOTAL_REVENUE_TARGET              NUMBER(20, 4) comment ' Total Revenue Target  ',
    RECRUITING                        NUMBER(20, 4) comment ' Recruiting  ',
    TERMINATED_ADVISORS               NUMBER(20, 4) comment ' Terminated Advisors  '
)
    data_retention_time_in_days = 1;

create transient table INVESTIA.REF_MASTER_KPI_DATA_INVESTIA
(
    HK_HUB                            VARCHAR(40) comment ' Hash key for the Hub ',
    MD_START_DT                       TIMESTAMPNTZ comment ' Start Date of the image/version ',
    MD_HASHDIFF                       VARCHAR(40) comment ' Represents the whole set of hashed attributes to be historized for an occurrence ',
    MD_CREATION_DT                    TIMESTAMPNTZ comment ' Creation Date Time of the occurrence ',
    MD_SOURCE                         VARCHAR(1000) comment ' Represents the source system, file, etc. of the instance ',
    MD_SRC_SYSTEM                     VARCHAR(100) comment ' Source system ',
    MD_EXTRACT_DT                     TIMESTAMPNTZ comment ' Extraction date of the occurrence ',
    KPI_DATE                          TIMESTAMPNTZ comment ' KPI Date ',
    NO_CLIENT_ID                      NUMBER(20, 4) comment ' # Client ID ',
    E_DELIVERY                        NUMBER(20, 4) comment ' E-delivery ',
    E_DELIVERY_PCT                    NUMBER(20, 4) comment ' % E-delivery ',
    E_DELIVERY_TARGET_PCT             NUMBER(20, 4) comment ' % E-delivery Target ',
    PORTAL_REGISTRATION               NUMBER(20, 4) comment ' Portal Registration ',
    PORTAL_REGISTRATION_PCT           NUMBER(20, 4) comment ' % Portal Registration ',
    PORTAL_REGISTRATION_TARGET        NUMBER(20, 4) comment ' Portal Registration Target ',
    FTE                               NUMBER(20, 4) comment ' FTE ',
    CLIENTS_BY_FTE                    NUMBER(20, 4) comment ' Clients by FTE ',
    CLIENTS_BY_FTE_TARGET             NUMBER(20, 4) comment ' Clients by FTE Target ',
    NO_OF_ACCOUNTS                    NUMBER(20, 4) comment ' No of accounts ',
    ACCOUNTS_BY_FTE                   NUMBER(20, 4) comment ' Accounts by FTE ',
    ACTUAL_YTD_EXPENSES               NUMBER(20, 4) comment ' Actual YTD Expenses ',
    ACTUAL_YTD_REVENUES               NUMBER(20, 4) comment ' Actual YTD Revenues ',
    EFFICIENCY_RATIO                  NUMBER(20, 4) comment ' Efficiency Ratio ',
    YTD_EXPENSES_TARGET               NUMBER(20, 4) comment ' YTD Expenses Taregt ',
    YTD_REVENUES_TARGET               NUMBER(20, 4) comment ' YTD Revenues Target ',
    EFFICIENCY_RATIO_TARGET           NUMBER(20, 4) comment ' Efficiency Ratio Target ',
    AUA_IN_NOMINEE                    NUMBER(20, 4) comment ' AUA in Nominee ',
    AUA_IN_CLIENT_NAME                NUMBER(20, 4) comment ' AUA in Client Name ',
    NO_OF_RPAS_IMPLEMENTED            NUMBER(20, 4) comment ' # of RPAs implemented ',
    HOURS_SAVED_DUE_TO_RPAS           NUMBER(20, 4) comment ' Hours Saved due to RPAs ',
    CONTINUOUS_IMPROVEMENT_QUICK_WINS NUMBER(20, 4) comment ' Continuous improvement/quick wins ',
    TOTAL_ASSETS                      NUMBER(20, 4) comment ' Total Assets  ',
    ORGANIC_GROWTH                    NUMBER(20, 4) comment ' Organic Growth  ',
    TOTAL_REVENUE                     NUMBER(20, 4) comment ' Total Revenue  ',
    TOTAL_REVENUE_TARGET              NUMBER(20, 4) comment ' Total Revenue Target  ',
    RECRUITING                        NUMBER(20, 4) comment ' Recruiting  ',
    TERMINATED_ADVISORS               NUMBER(20, 4) comment ' Terminated Advisors  '
)
    data_retention_time_in_days = 1;

create table EXTERNAL_KPI.REF_MASTER_KPI_DATA_RVP_IAPW
(
    HK_HUB              VARCHAR(40) comment 'HASH KEY FOR THE HUB',
    MD_START_DT         TIMESTAMPNTZ comment 'START DATE OF THE IMAGE/VERSION',
    MD_HASHDIFF         VARCHAR(40) comment 'REPRESENTS THE WHOLE SET OF HASHED ATTRIBUTES TO BE HISTORIZED FOR AN OCCURRENCE',
    MD_CREATION_DT      TIMESTAMPNTZ comment 'CREATION DATE TIME OF THE OCCURRENCE',
    MD_SOURCE           VARCHAR(1000) comment 'REPRESENTS THE SOURCE SYSTEM, FILE, ETC. OF THE INSTANCE',
    MD_SRC_SYSTEM       VARCHAR(100) comment 'SOURCE SYSTEM',
    MD_EXTRACT_DT       TIMESTAMPNTZ comment 'EXTRACTION DATE OF THE OCCURRENCE',
    KPI_DATE            DATE comment 'THE END OF EVERY MONTHS DATE FOR THE SET TARGET',
    RVP_NAME            VARCHAR(512) comment 'RVP NAME',
    PORTAL_REGISTRATION NUMBER(38, 4) comment 'PORTAL REGITRATION VALUES',
    APPWAY_REGISTRATION NUMBER(38, 4) comment 'APPWAY REGISTRATION VALUES',
    E_DELIVERY          NUMBER(38, 4) comment 'E-DELIVERY VALUES'
);

create transient table STEWARDSHIP.REF_MONTHLY_MILESTONES
(
    HK_HUB         VARCHAR(40) comment 'Hash key for the Hub',
    MD_START_DT    TIMESTAMPNTZ comment 'Start Date of the image/version',
    MD_HASHDIFF    VARCHAR(40) comment 'Represents the whole set of hashed attributes to be historized for an occurrence',
    MD_CREATION_DT TIMESTAMPNTZ comment 'Creation Date Time of the occurrence',
    MD_SOURCE      VARCHAR(1000) comment 'Represents the source system, file, etc. of the instance',
    MD_SRC_SYSTEM  VARCHAR(100) comment 'Source system',
    MD_EXTRACT_DT  TIMESTAMPNTZ comment 'Extraction date of the occurrence',
    ADVISOR        VARCHAR(512) comment 'Source Advisor code',
    TEAM           VARCHAR(512) comment 'Source team code',
    REPID          VARCHAR(512) comment 'RR code',
    RVP            VARCHAR(512) comment 'RVP Code',
    PROVINCE       VARCHAR(512) comment 'Province code exp: QC, BC, ON, etc...',
    AUA_DEC        NUMBER(34, 4) comment 'AUA value for December',
    AUA_JAN        NUMBER(34, 4) comment 'AUA value for january',
    AUA_FEB        NUMBER(34, 4) comment 'AUA value for February'
)
    data_retention_time_in_days = 1;

create transient table STEWARDSHIP.REF_NEW_ADVISOR
(
    HK_HUB                     VARCHAR(40) comment 'Hash key for the Hub',
    MD_START_DT                TIMESTAMPNTZ comment 'Start Date of the image/version',
    MD_HASHDIFF                VARCHAR(40) comment 'Represents the whole set of hashed attributes to be historized for an occurrence',
    MD_CREATION_DT             TIMESTAMPNTZ comment 'Creation Date Time of the occurrence',
    MD_SOURCE                  VARCHAR(1000) comment 'Represents the source system, file, etc. of the instance',
    MD_SRC_SYSTEM              VARCHAR(100) comment 'Source system',
    MD_EXTRACT_DT              TIMESTAMPNTZ comment 'Extraction date of the occurrence',
    ADVISOR_NAME               VARCHAR(100) comment 'Advisor name',
    MASTER_CODE                VARCHAR(50) comment 'Advisor code',
    TRANSITION_PERIOD_END_DATE TIMESTAMPNTZ comment 'Advisor transition end date',
    DEAL_ASSESTS               NUMBER(11) comment 'Deal assets',
    EXPECTED_ASSESTS           NUMBER(11) comment 'Expected assets',
    PREVIOUS_FIRM              VARCHAR(100) comment 'Previous Firm of the Advisor',
    PREVIOUS_FIRM_TYPE         VARCHAR(100) comment 'Previous Firm type of the Advisor'
)
    data_retention_time_in_days = 1;

create transient table STEWARDSHIP.REF_ORGANIC_GROWTH_EXCEPTIONS_IAPW
(
    HK_HUB                  VARCHAR(40) comment 'Hash key for the Hub',
    MD_START_DT             TIMESTAMPNTZ comment 'Start Date of the image/version',
    MD_HASHDIFF             VARCHAR(40) comment 'Represents the whole set of hashed attributes to be historized for an occurrence',
    MD_CREATION_DT          TIMESTAMPNTZ comment 'Creation Date Time of the occurrence',
    MD_SOURCE               VARCHAR(1000) comment 'Represents the source system, file, etc. of the instance',
    MD_SRC_SYSTEM           VARCHAR(100) comment 'Source system',
    MD_EXTRACT_DT           TIMESTAMPNTZ comment 'Extraction date of the occurrence',
    SOURCE_REP_CODE         VARCHAR(50) comment 'Original Rep Code',
    DESTINATION_MASTER_CODE VARCHAR(50) comment 'Transfered to Master Code',
    SHARE_PCT               NUMBER(3) comment '% for distrubution of Amounts',
    START_DATE              TIMESTAMPNTZ comment 'Start Date range when exclusion stays in',
    END_DATE                TIMESTAMPNTZ comment 'End Date when exclusion expires'
)
    data_retention_time_in_days = 1;

create table STEWARDSHIP.REF_ORGANIC_GROWTH_EXCEPTION_PROCESS_IAPW
(
    HK_HUB          VARCHAR(40) comment 'Hash key for the Hub',
    MD_START_DT     TIMESTAMPNTZ comment 'Start Date of the image/version',
    MD_HASHDIFF     VARCHAR(40) comment 'Represents the whole set of hashed attributes to be historized for an occurrence',
    MD_CREATION_DT  TIMESTAMPNTZ comment 'Creation Date Time of the occurrence',
    MD_SOURCE       VARCHAR(1000) comment 'Represents the source system, file, etc. of the instance',
    MD_SRC_SYSTEM   VARCHAR(100) comment 'Source system',
    MD_EXTRACT_DT   TIMESTAMPNTZ comment 'Extraction date of the occurrence',
    REP_CODE        VARCHAR(50) comment 'Rep code',
    FLAG_NAME       VARCHAR(100) comment 'Flag name',
    EXCEPTION_RATIO NUMBER(38, 2) comment 'Organic growth ratio %',
    START_DATE      DATE comment 'Exception start date',
    END_DATE        DATE comment 'Exception end date',
    NOTES           VARCHAR(1000) comment 'Notes about the exception'
);

create transient table STEWARDSHIP.REF_PRODUCT_ASSET_CATEGORY
(
    HK_HUB               VARCHAR(64) comment 'Hash of the business keys',
    MD_START_DT          TIMESTAMPNTZ comment 'Start Date of the image/version',
    MD_HASHDIFF          VARCHAR(64) comment 'Represents the whole set of hashed attributes to be historized for an occurrence',
    MD_CREATION_DT       TIMESTAMPNTZ comment 'Creation Date Time of the occurrence',
    MD_SOURCE            VARCHAR(1000) comment 'Represents the source system, file, etc. of the instance',
    MD_SRC_SYSTEM        VARCHAR(100) comment 'Source system',
    MD_EXTRACT_DT        TIMESTAMPNTZ comment 'Extraction date of the occurrence',
    TI_ALTERNATE_TI_TYPE VARCHAR(50) comment 'Financial product type ID',
    ASSET_CATEGORY       VARCHAR(512) comment 'Asset category exp: Treasury Bills, Debentures, Common Stock, etc...'
)
    data_retention_time_in_days = 1;

create table INVESTIA_UNIVERIS.REF_PROVINCE
(
    HK_HUB         VARCHAR(40) comment 'Hash key for the Hub',
    MD_START_DT    TIMESTAMPNTZ comment 'Start Date of the image/version',
    MD_HASHDIFF    VARCHAR(40) comment 'Represents the whole set of hashed attributes to be historized for an occurrence',
    MD_CREATION_DT TIMESTAMPNTZ comment 'Creation Date Time of the occurrence',
    MD_SOURCE      VARCHAR(1000) comment 'Represents the source system, file, etc. of the instance',
    MD_SRC_SYSTEM  VARCHAR(100) comment 'Source system',
    MD_EXTRACT_DT  TIMESTAMPNTZ comment 'Source extraction date',
    PROV_CD        VARCHAR(10) comment 'Province code : QC',
    PROV_DESC      VARCHAR(50) comment 'Province Description : Quebec'
);

create transient table STEWARDSHIP.REF_RAPCODE_PLAN
(
    HK_HUB                VARCHAR(40) comment 'Hash key for the Hub',
    MD_START_DT           TIMESTAMPNTZ comment 'Start Date of the image/version',
    MD_HASHDIFF           VARCHAR(40) comment 'Represents the whole set of hashed attributes to be historized for an occurrence',
    MD_CREATION_DT        TIMESTAMPNTZ comment 'Creation Date Time of the occurrence',
    MD_SOURCE             VARCHAR(1000) comment 'Represents the source system, file, etc. of the instance',
    MD_SRC_SYSTEM         VARCHAR(100) comment 'Source system',
    MD_EXTRACT_DT         TIMESTAMPNTZ comment 'Extraction date of the occurrence',
    ACCOUNT_RAP_CODE      VARCHAR(10) comment 'Account RAP code',
    RETAIL_PLAN           VARCHAR(100) comment 'Retail Plan exp: LR, LF, PR, etc...',
    PLAN_LABEL            VARCHAR(512) comment 'Plan label exp: CAD Life Income Fund, USD Cash Account, etc...',
    ACCOUNT_TYPE          VARCHAR(512) comment 'Account type exp: Non-Registered, Registered, etc...',
    GROUP_TYPE_CODE       VARCHAR(100) comment 'Group type code exp: RRIF, RRSP, etc...',
    ASC_1_RESP_PLAN_TYPES VARCHAR(100) comment 'If Account rap code is the same, ASC_1_RESP_PLAN_TYPES is used to identify the plan',
    ACCUMULATION_TYPE     VARCHAR(100) comment 'Accumulation type exp: Decumulation, Accumulation'
)
    data_retention_time_in_days = 1;

create transient table STEWARDSHIP.REF_SERVICING_CODES
(
    HK_HUB               VARCHAR(40) comment 'Hash key for the Hub',
    MD_SEQ               NUMBER comment 'The value of METADATA$FILE_ROW_NUMBER when loading using INFORMATICA',
    MD_START_DT          TIMESTAMPNTZ comment 'Start Date of the image/version',
    MD_HASHDIFF          VARCHAR(40) comment 'Represents the whole set of hashed attributes to be historized for an occurrence',
    MD_CREATION_DT       TIMESTAMPNTZ comment 'Creation Date Time of the occurrence',
    MD_SOURCE            VARCHAR(1000) comment 'Represents the source system, file, etc. of the instance',
    MD_SRC_SYSTEM        VARCHAR(100) comment 'Source system',
    MD_EXTRACT_DT        TIMESTAMPNTZ comment 'Extraction date of the occurrence',
    ADVISOR_NAME         VARCHAR(100) comment 'Advisor name',
    MASTER_CODE          VARCHAR(50) comment 'Advisor code',
    END_DATE             TIMESTAMPNTZ comment 'Departure date of the advisor (TBD)',
    REASON               VARCHAR(1000) comment 'Reason of departure',
    NEW_FIRM             VARCHAR(1000) comment 'Departure destination',
    NEW_FIRM_TYPE        VARCHAR(1000) comment 'Departure destination Type',
    NEW_FIRM_BACK_OFFICE VARCHAR(1000) comment 'Departure destination Back-Office',
    SERVICING_CODE       VARCHAR(1000) comment 'Servicing Code',
    PRESTIGE_STATUS      VARCHAR(100) comment 'Prestige Status'
)
    data_retention_time_in_days = 1;

create transient table IAS_UNIVERIS.REGISTERED_REPRESENTATIVE
(
    HK_HUB              VARCHAR(40) comment 'Hash key for the Hub',
    MD_START_DT         TIMESTAMPNTZ comment 'Start Date of the image/version',
    MD_HASHDIFF         VARCHAR(40) comment 'Represents the whole set of hashed attributes to be historized for an occurrence',
    MD_CREATION_DT      TIMESTAMPNTZ comment 'Creation Date Time of the occurrence',
    MD_SOURCE           VARCHAR(1000) comment 'Represents the source system, file, etc. of the instance',
    MD_SRC_SYSTEM       VARCHAR(100) comment 'Source system',
    MD_EXTRACT_DT       TIMESTAMPNTZ comment 'Source extraction date',
    COMPANY_CD          VARCHAR(50) comment 'Company code : Wealth',
    COMPANY_NAME        VARCHAR(512) comment 'Company name : iA Wealth Management',
    REGULATORY_ORG_CD   VARCHAR(50) comment 'Regulatory organisation code : MFDA or IIROC',
    REGULATORY_ORG_NAME VARCHAR(512) comment 'Regulatory organisation name : Mutual Fund Dealers Association',
    DLR_SYSID           NUMBER comment 'Univeris ID of the dealer',
    DLR_CD              VARCHAR(50) comment 'Dealer code : Univeris code for the dealer',
    DLR_NAME_ENG        VARCHAR(512) comment 'Dealer name in english : Fundex Investments inc.',
    RGN_SYSID           NUMBER comment 'Univeris ID for the advisor region',
    RGN_CD              VARCHAR(50) comment 'Univeris code for the advisor region',
    RGN_NAME            VARCHAR(512) comment 'The advisor region name',
    RGN_MGR             VARCHAR(512) comment 'The name of the regional VP',
    BRN_SYSID           NUMBER comment 'Univeris ID of the advisors branch',
    BRN_CD              VARCHAR(50) comment 'Univeris Code for the advisors branch',
    BRN_NAME            VARCHAR(512) comment 'The advisor branch name',
    REP_TEAM_CD         VARCHAR(50) comment 'The advisor team code',
    REP_TEAM_NAME       VARCHAR(512) comment 'The advisor team name',
    REP_SYSID           NUMBER comment 'Univeris ID of the advisor rep code',
    NK_REP_CD           VARCHAR(50) comment 'Advisor rep code',
    NK_REP_CORP_NAME    VARCHAR(512) comment 'Corporation name of the advisor',
    REP_LNAME           VARCHAR(512) comment 'Advisor last name',
    REP_FNAME           VARCHAR(512) comment 'Advisor first name',
    REP_ST_NAME         VARCHAR(512) comment 'Advisor status : Active, Terminated,...',
    REP_GRP_RSP         VARCHAR(512)
)
    data_retention_time_in_days = 1;

create transient table IAS_COMMISSION.REGISTERED_REPRESENTATIVE
(
    HK_HUB            VARCHAR(40) comment 'Hash of the business keys',
    HK_SAT            VARCHAR(40) comment 'Hash of the Satellite for the multi-active keys',
    MD_START_DT       TIMESTAMPNTZ comment 'Start Date of the image/version',
    MD_HASHDIFF       VARCHAR(40) comment 'Represents the whole set of hashed attributes to be historized for an occurrence',
    MD_CREATION_DT    TIMESTAMPNTZ default CURRENT_TIMESTAMP() comment 'Creation Date Time of the occurrence',
    MD_SOURCE         VARCHAR(1000) comment 'Represents the source system, file, etc. of the instance',
    MD_SRC_SYSTEM     VARCHAR(100) comment 'Source system',
    MD_EXTRACT_DT     TIMESTAMPNTZ comment 'Extraction date of the occurrence',
    REPID             VARCHAR(50) comment 'RR code',
    REPNAME           VARCHAR(512) comment 'Representative name',
    FIRSTNAME         VARCHAR(512) comment 'Representative first name',
    LASTNAME          VARCHAR(512) comment 'Representative last name',
    BRANCHCODE        VARCHAR(50) comment 'Code of the representative branch code',
    BRANCHNAME        VARCHAR(512) comment 'Name of the representative branch',
    GROUPID           NUMBER comment 'Representant Group ID',
    GROUPDESCRIPTION  VARCHAR(512) comment 'Advisor group description',
    FIXEDFEEIND       NUMBER comment 'Fixed fees indicator',
    MANAGEDIND        NUMBER comment 'Managed indicator',
    REFIND            NUMBER comment 'Holding value currency',
    ACTIVEIND         NUMBER comment 'Active RR code indicator',
    SEGFUNDIND        NUMBER comment 'Segregated funds indicator',
    REVNO             NUMBER comment 'Revision number',
    STAMP             TIMESTAMPNTZ comment 'Source row timestamp',
    USERID            VARCHAR(512) comment 'User id',
    ACTIVE            NUMBER comment 'Active user indicator',
    ADVISOR_ID        VARCHAR(512) comment 'Advisor id',
    COMMRATEPCT       NUMBER(6, 3) comment 'Default Commission Rate Percentage',
    SHAREGROSSCOMMIND NUMBER comment 'Indicator of share of gross commission',
    STARTDATE         DATE comment 'the starting date of the advisor',
    MAINREPCODE       VARCHAR(50) comment 'Main RR code',
    ADVISOR_ROLE      VARCHAR(500) comment 'Advisor role (e.g. isAdvisor, isAssistant and isBranchManager)'
)
    data_retention_time_in_days = 1;

create transient table IAS_CERTS.REGISTERED_REPRESENTATIVE
(
    HK_HUB             VARCHAR(40) comment 'Hash of the business keys',
    HK_SAT             VARCHAR(40) comment 'Hash of the Satellite for the multi-active keys',
    MD_START_DT        TIMESTAMPNTZ comment 'Start Date of the image/version',
    MD_HASHDIFF        VARCHAR(40) comment 'Represents the whole set of hashed attributes to be historized for an occurrence',
    MD_CREATION_DT     TIMESTAMPNTZ default CURRENT_TIMESTAMP() comment 'Creation Date Time of the occurrence',
    MD_SOURCE          VARCHAR(1000) comment 'Represents the source system, file, etc. of the instance',
    MD_SRC_SYSTEM      VARCHAR(100) comment 'Source system',
    MD_EXTRACT_DT      TIMESTAMPNTZ comment 'Extraction date of the occurrence',
    CID                VARCHAR(500) comment 'Source Account ID exp: #100002',
    FIRST_NAME         VARCHAR(500) comment 'Representative first name',
    LAST_NAME          VARCHAR(500) comment 'Representative last name',
    FULL_NAME          VARCHAR(1000) comment 'Representative full name',
    PRIMARY_ROLE       VARCHAR(500) comment 'Representative primary role exp: Supervisor, Director, etc...',
    RVP                VARCHAR(500) comment 'Representative RVP exp: RVP1, RVP2, etc...',
    BRANCH_NRD         VARCHAR(500) comment 'Code of the representative branch',
    BRANCH_NAME        VARCHAR(500) comment 'Name of the representative branch',
    PROVINCE           VARCHAR(500) comment 'Province name',
    IS_ACTIVE          NUMBER(1) comment 'Active user indicator',
    RR_CD              VARCHAR(2000) comment 'RR code',
    TRADE_NAME         VARCHAR(2000) comment 'Trade name exp: Tradenames_#118048',
    PORTAL_IDS         VARCHAR(2000) comment 'Portal identifier exp: PortalIds_#118048',
    BEGIN_DT           TIMESTAMPNTZ(7) comment 'Advisor begin date',
    END_DT             TIMESTAMPNTZ(7) comment 'Advisor end date',
    ADVISOR_BIRTH_DATE DATE comment 'Advisor month and year of birth',
    REP_EMAIL          VARCHAR(1000) comment 'Advisor repemail',
    CBM                VARCHAR(1000) comment 'Advisor cbm',
    BRANCH_ADDRESS1    VARCHAR(1000) comment 'Advisor branch ADDRESS1',
    BRANCH_ADDRESS2    VARCHAR(1000) comment 'Advisor branch ADDRESS2',
    BRANCH_CITY        VARCHAR(1000) comment 'Advisor branch city',
    BRANCH_POSTAL_CODE VARCHAR(1000) comment 'Advisor branch postal code'
)
    data_retention_time_in_days = 1;

create transient table IAS_IAVM.REGISTERED_REPRESENTATIVE
(
    HK_HUB         VARCHAR(40) comment 'Hash key for the Hub',
    MD_START_DT    TIMESTAMPNTZ comment 'Start Date of the image/version',
    MD_HASHDIFF    VARCHAR(40) comment 'Represents the whole set of hashed attributes to be historized for an occurrence',
    MD_CREATION_DT TIMESTAMPNTZ comment 'Creation Date Time of the occurrence',
    MD_SOURCE      VARCHAR(1000) comment 'Represents the source system, file, etc. of the instance',
    MD_SRC_SYSTEM  VARCHAR(100) comment 'Source system',
    MD_EXTRACT_DT  TIMESTAMPNTZ comment 'Source extraction date',
    MEMBER         VARCHAR(250) comment 'Member: JSMITH',
    TEAMTYPE       VARCHAR(7) comment 'The type of team - Default constant',
    ACTIVE         VARCHAR(12) comment 'The type of team - Default constant',
    USERTYPE       VARCHAR(12) comment 'Type of User : IA',
    TEAMID         NUMBER comment 'The advisor team code',
    TEAMNAME       VARCHAR(256) comment 'The advisor team name: IA HOUSE',
    RVPID          NUMBER comment 'VP Rep ID',
    RVPNAME        VARCHAR(256) comment 'VP Name',
    REPID          VARCHAR(12) comment 'Representative ID',
    REPNAME        VARCHAR(250) comment 'Representative Name: SMITH JOHN',
    PROVINCE       VARCHAR(12) comment 'Province Code : ON'
)
    data_retention_time_in_days = 1;

create transient table INVESTIA_UNIVERIS.REGISTERED_REPRESENTATIVE
(
    HK_HUB              VARCHAR(40) comment 'Hash key for the Hub',
    MD_START_DT         TIMESTAMPNTZ comment 'Start Date of the image/version',
    MD_HASHDIFF         VARCHAR(40) comment 'Represents the whole set of hashed attributes to be historized for an occurrence',
    MD_CREATION_DT      TIMESTAMPNTZ comment 'Creation Date Time of the occurrence',
    MD_SOURCE           VARCHAR(1000) comment 'Represents the source system, file, etc. of the instance',
    MD_SRC_SYSTEM       VARCHAR(100) comment 'Source system',
    MD_EXTRACT_DT       TIMESTAMPNTZ comment 'Source extraction date',
    COMPANY_CD          VARCHAR(50) comment 'Company code : Wealth',
    COMPANY_NAME        VARCHAR(512) comment 'Company name : iA Wealth Management',
    REGULATORY_ORG_CD   VARCHAR(50) comment 'Regulatory organisation code : MFDA or IIROC',
    REGULATORY_ORG_NAME VARCHAR(512) comment 'Regulatory organisation name : Mutual Fund Dealers Association',
    DLR_SYSID           NUMBER comment 'Univeris ID of the dealer',
    DLR_CD              VARCHAR(50) comment 'Dealer code : Univeris code for the dealer',
    DLR_NAME_ENG        VARCHAR(512) comment 'Dealer name in english : Fundex Investments inc.',
    RGN_SYSID           NUMBER comment 'Univeris ID for the advisor region',
    RGN_CD              VARCHAR(50) comment 'Univeris code for the advisor region',
    RGN_NAME            VARCHAR(512) comment 'The advisor region name',
    RGN_MGR             VARCHAR(512) comment 'The name of the regional VP',
    BRN_SYSID           NUMBER comment 'Univeris ID of the advisors branch',
    BRN_CD              VARCHAR(50) comment 'Univeris Code for the advisors branch',
    BRN_NAME            VARCHAR(512) comment 'The advisor branch name',
    REP_TEAM_CD         VARCHAR(50) comment 'The advisor team code',
    REP_TEAM_NAME       VARCHAR(512) comment 'The advisor team name',
    REP_SYSID           NUMBER comment 'Univeris ID of the advisor rep code',
    REP_CD              VARCHAR(50) comment 'Advisor rep code',
    REP_CORP_NAME       VARCHAR(512) comment 'Corporation name of the advisor',
    REP_LNAME           VARCHAR(512) comment 'Advisor last name',
    REP_FNAME           VARCHAR(512) comment 'Advisor first name',
    REP_ST_NAME         VARCHAR(512) comment 'Advisor status : Active, Terminated,...',
    REP_GRP_RSP         VARCHAR(512) comment 'Group RSP indicator',
    PROV_CD             VARCHAR(10) comment 'Province Code : In Univeris ',
    REP_TITLE_DESC      VARCHAR(100) comment 'Representative title : Title description In Univeris ',
    TERMINATE_DT        TIMESTAMPNTZ comment 'Representative terminated date : In Univeris ',
    CREATE_DT           TIMESTAMPNTZ comment 'Representative Start date : In Univeris '
)
    data_retention_time_in_days = 1;

create transient table IAS_CERTS.REGISTERED_REPRESENTATIVE_RECEPTION
(
    MD_START_DT        TIMESTAMPNTZ comment 'Start Date of the image/version',
    MD_EXTRACT_DT      TIMESTAMPNTZ comment 'Extraction date of the occurrence',
    MD_SOURCE          VARCHAR(1000) comment 'Represents the source system, file, etc. of the instance',
    CID                VARCHAR(500) comment 'Source Account ID exp: #100002',
    FIRST_NAME         VARCHAR(500) comment 'Representative first name',
    LAST_NAME          VARCHAR(500) comment 'Representative last name',
    FULL_NAME          VARCHAR(1000) comment 'Representative full name',
    PRIMARY_ROLE       VARCHAR(500) comment 'Representative primary role exp: Supervisor, Director, etc...',
    RVP                VARCHAR(500) comment 'Representative RVP exp: RVP1, RVP2, etc...',
    BRANCH_NRD         VARCHAR(500) comment 'Code of the representative branch',
    BRANCH_NAME        VARCHAR(500) comment 'Name of the representative branch',
    PROVINCE           VARCHAR(500) comment 'Province name',
    IS_ACTIVE          NUMBER(1) comment 'Active user indicator',
    REP_CODE           VARCHAR(2000) comment 'RR code',
    TRADE_NAME         VARCHAR(2000) comment 'Trade name exp: Tradenames_#118048',
    PORTAL_IDS         VARCHAR(2000) comment 'Portal identifier exp: PortalIds_#118048',
    BEGIN_DT           TIMESTAMPNTZ(7) comment 'Advisor begin date',
    END_DT             TIMESTAMPNTZ(7) comment 'Advisor end date',
    ADVISOR_BIRTH_DATE DATE comment 'Advisor month and year of birth',
    REP_EMAIL          VARCHAR(1000) comment 'Advisor repemail',
    CBM                VARCHAR(1000) comment 'Advisor cbm',
    BRANCH_ADDRESS1    VARCHAR(1000) comment 'Advisor branch address1',
    BRANCH_ADDRESS2    VARCHAR(1000) comment 'Advisor branch address2',
    BRANCH_CITY        VARCHAR(1000) comment 'Advisor branch city',
    BRANCH_POSTAL_CODE VARCHAR(1000) comment 'Advisor branch postal code'
)
    data_retention_time_in_days = 1;

create transient table IAS_COMMISSION.REGISTERED_REPRESENTATIVE_RECEPTION
(
    MD_START_DT       TIMESTAMPNTZ comment 'Start Date of the image/version',
    MD_SOURCE         VARCHAR(1000) comment 'Represents the source system, file, etc. of the instance',
    MD_SRC_SYSTEM     VARCHAR(100) comment 'Source system',
    MD_EXTRACT_DT     TIMESTAMPNTZ comment 'Extraction date of the occurrence',
    REPID             VARCHAR(50) comment 'RR code',
    REPNAME           VARCHAR(512) comment 'Representative name',
    FIRSTNAME         VARCHAR(512) comment 'Representative first name',
    LASTNAME          VARCHAR(512) comment 'Representative last name',
    BRANCHCODE        VARCHAR(50) comment 'Code of the representative branch code',
    BRANCHNAME        VARCHAR(512) comment 'Name of the representative branch',
    GROUPID           NUMBER comment 'Representant Group ID',
    GROUPDESCRIPTION  VARCHAR(512) comment 'Advisor group description',
    FIXEDFEEIND       NUMBER comment 'Fixed fees indicator',
    MANAGEDIND        NUMBER comment 'Managed indicator',
    REFIND            NUMBER comment 'Holding value currency',
    ACTIVEIND         NUMBER comment 'Active RR code indicator',
    SEGFUNDIND        NUMBER comment 'Segregated funds indicator',
    REVNO             NUMBER comment 'Revision number',
    STAMP             TIMESTAMPNTZ comment 'Source row timestamp',
    USERID            VARCHAR(512) comment 'User id',
    ACTIVE            NUMBER comment 'Active user indicator',
    ADVISOR_ID        VARCHAR(512) comment 'Advisor id',
    COMMRATEPCT       NUMBER(6, 3) comment 'Default Commission Rate Percentage',
    SHAREGROSSCOMMIND NUMBER comment 'Indicator of share of gross commission',
    STARTDATE         DATE comment 'the starting date of the advisor',
    MAINREPCODE       VARCHAR(50) comment 'Main RR code',
    ADVISOR_ROLE      VARCHAR(500) comment 'Advisor role (e.g. isAdvisor, isAssistant and isBranchManager)'
)
    data_retention_time_in_days = 1;

create transient table IAS_COMMISSION.REVENUES
(
    HK_LINK                   VARCHAR(40) comment 'Hash of the business keys',
    HK_HUB_CONTRACT           VARCHAR(40) comment 'Hash key for PARTY_ROLE_ACCOUNT_HOLDER',
    HK_HUB_PARTY_ROLE_ADVISOR VARCHAR(40) comment 'Hash key for the REGISTERED_REPRESENTATIVE_COMMISSION',
    MD_CREATION_DT            TIMESTAMPNTZ default CURRENT_TIMESTAMP() comment 'Creation Date Time of the occurrence',
    MD_START_DT               TIMESTAMPNTZ comment 'Start Date of the image/version',
    MD_SOURCE                 VARCHAR(1000) comment 'Represents the source system, file, etc. of the instance',
    MD_SRC_SYSTEM             VARCHAR(100) comment 'Source system',
    MD_EXTRACT_DT             TIMESTAMPNTZ comment 'Extraction date of the occurrence',
    REPID                     VARCHAR(50) comment 'Master code  code',
    ADVISOR_ID                VARCHAR(512) comment 'Advisor ID in commission portal',
    PROGRAM_TYPE              VARCHAR(512) comment 'Program type of the account',
    ACCOUNTID                 VARCHAR(100) comment 'Account ID',
    PROCESSDATE               DATE comment 'Process Date',
    SOURCECODE                VARCHAR(50) comment 'Source Code / TRANSACTION_TYPE',
    QUANTITY                  NUMBER comment 'Transaction quantity',
    TRANSTYPE                 VARCHAR(10) comment 'Transaction Type ([B]uy/[S]ell) / BUY_SELL_INDICATOR',
    REVENUE                   NUMBER(38, 2) comment 'Representative gross revenue',
    COMMISSION                NUMBER(38, 2) comment 'Representative gross commission',
    NETCOMMISSION             NUMBER(38, 2) comment 'Representative net commission',
    TRANSFEE                  NUMBER(38, 2) comment 'Representative transaction fees',
    ENTRY_TYPE                VARCHAR(20) comment 'Entry Type',
    STAMP                     DATE comment 'Record Insertion Date'
)
    data_retention_time_in_days = 1;

create table PUBLIC.REVENUES_BLOB
(
    REPID         VARCHAR(50) comment 'Master code  code',
    ADVISOR_ID    VARCHAR(512) comment 'Advisor ID in commission portal',
    PROGRAM_TYPE  VARCHAR(512) comment 'Program type of the account',
    ACCOUNTID     VARCHAR(100) comment 'Account ID',
    PROCESSDATE   DATE comment 'Process Date',
    SOURCECODE    VARCHAR(50) comment 'Source Code / TRANSACTION_TYPE',
    QUANTITY      NUMBER comment 'Transaction quantity',
    TRANSTYPE     VARCHAR(10) comment 'Transaction Type ([B]uy/[S]ell) / BUY_SELL_INDICATOR',
    REVENUE       NUMBER(38, 2) comment 'Representative gross revenue',
    COMMISSION    NUMBER(38, 2) comment 'Representative gross commission',
    NETCOMMISSION NUMBER(38, 2) comment 'Representative net commission',
    TRANSFEE      NUMBER(38, 2) comment 'Representative transaction fees',
    MD_SRCSYSTEM  VARCHAR(50) comment 'Source system',
    MD_LOADDATE   DATE comment 'Load Date',
    HK_DIFF       VARCHAR(40) comment 'Hash of the difference keys',
    HK_KEY        VARCHAR(40) comment 'Hash of the business keys'
)
    stage_file_format =
(
    FORMAT_NAME = '\"DB_IAW_DEV_STG\".\"IAS_COMMISSION\".\"PIPE_UTF8\"'
)
    stage_copy_options =
(
    PURGE = true
);

create table PUBLIC.REVENUES_TO_COMPARE
(
    REPID         VARCHAR(50) comment 'Master code  code',
    ADVISOR_ID    VARCHAR(512) comment 'Advisor ID in commission portal',
    PROGRAM_TYPE  VARCHAR(512) comment 'Program type of the account',
    ACCOUNTID     VARCHAR(100) comment 'Account ID',
    PROCESSDATE   DATE comment 'Process Date',
    STAMP         TIMESTAMPNTZ comment 'Stamp time of eventual modification',
    SOURCECODE    VARCHAR(50) comment 'Source Code / TRANSACTION_TYPE',
    QUANTITY      NUMBER comment 'Transaction quantity',
    TRANSTYPE     VARCHAR(10) comment 'Transaction Type ([B]uy/[S]ell) / BUY_SELL_INDICATOR',
    REVENUE       NUMBER(38, 2) comment 'Representative gross revenue',
    COMMISSION    NUMBER(38, 2) comment 'Representative gross commission',
    NETCOMMISSION NUMBER(38, 2) comment 'Representative net commission',
    TRANSFEE      NUMBER(38, 2) comment 'Representative transaction fees',
    MD_SRCSYSTEM  VARCHAR(50) comment 'Source system',
    MD_LOADDATE   DATE comment 'Load Date',
    HK_DIFF       VARCHAR(40) comment 'Hash of the difference keys',
    HK_KEY        VARCHAR(40) comment 'Hash of the business keys'
)
    stage_file_format =
(
    FORMAT_NAME = '\"DB_IAW_DEV_STG\".\"IAS_COMMISSION\".\"PIPE_UTF8\"'
)
    stage_copy_options =
(
    PURGE = true
);

create transient table IAS_UNIVERIS.REVENUE_PAYABLE
(
    HK_LINK                        VARCHAR(40) comment 'Hash key for the Link',
    HK_HUB_CONTRACT                VARCHAR(40) comment 'Hash key for HUB_CONTRACT',
    HK_HUB_INVESTMENT_PRODUCT_TYPE VARCHAR(40) comment 'Hash key for HUB_INVESTMENT_PRODUCT_TYPE',
    MD_START_DT                    TIMESTAMPNTZ comment 'Start Date of the image/version',
    MD_HASHDIFF                    VARCHAR(64) comment 'Represents the whole set of hashed attributes to be historized for an occurrence',
    MD_CREATION_DT                 TIMESTAMPNTZ comment 'Creation Date Time of the occurrence',
    MD_SOURCE                      VARCHAR(1000) comment 'Represents the source system, file, etc. of the instance',
    MD_SRC_SYSTEM                  VARCHAR(100) comment 'Source system',
    MD_EXTRACT_DT                  TIMESTAMPNTZ comment 'Source extraction date',
    PAY_SYSID                      NUMBER comment 'Payable ID - Main key',
    PYBL_STATUS                    VARCHAR(3) comment 'Payable Status',
    EVENT_PROC_SYSID               NUMBER comment 'Event Procedure ID',
    EVENT_RPT_SYSID                NUMBER comment 'Event Report ID',
    BEN_SYSID                      NUMBER comment 'Beneficiary ID (related to REP table)',
    REP_SYSID                      NUMBER comment 'Advisor ID (related to REP table)',
    DEAL_SYSID                     NUMBER comment 'Deal ID (related to REP_DEAL link with parent REP table)',
    COM_SYSID                      NUMBER comment 'Comm ID (Related to REP_COM link with parents REP_DEAL, REP)',
    DIST_SYSID                     NUMBER comment 'Payroll Distribution ID (related to REP_PAY_DIST)',
    TRX_SYSID                      NUMBER comment 'Transaction ID (related to TRX)',
    IVR_SYSID                      NUMBER comment 'Investor (Client) ID (related to IVR)',
    PLN_SYSID                      NUMBER comment 'Plan (Account) ID (related to PLN)',
    ACT_SYSID                      NUMBER comment 'Account (Position) ID (related to ACT)',
    IVD_SYSID                      NUMBER comment 'Product ID (related to IVD link with parent IVT)',
    MGT_CD                         VARCHAR(5) comment 'Managemet Cie ID (related to MGT)',
    TRX_CD                         NUMBER comment 'Transaction Code id (related to S_TRX_CD)',
    PROC_DT                        TIMESTAMPNTZ comment 'Payable Process Date',
    PAID_DT                        TIMESTAMPNTZ comment 'Payable Paid Date',
    PAY_PERIOD                     VARCHAR(5) comment 'Pay Period',
    TAX_YEAR                       VARCHAR(4) comment 'Pay Fiscal Year',
    TRADE_DT                       TIMESTAMPNTZ comment 'Transaction Trade date (related to TRX)',
    GRSS_AMT                       DOUBLE comment 'Transaction Gross Amount (related to TRX)',
    COM_DLR                        DOUBLE comment 'Commission Dealer Amount',
    COM_PYBL                       DOUBLE comment 'Commission Amount',
    COM_BEN_PYBL                   DOUBLE comment 'Commission Pay to the Beneficiary',
    TICKET_CHG                     DOUBLE comment 'Ticket Charge',
    PAY_CD                         VARCHAR(3) comment 'Pay Code',
    COM_PRODUCTION_CD              VARCHAR(2) comment 'Commission Type Code (related to S_COM_PROD)',
    AMOUNT                         DOUBLE comment 'Amount (related to Payroll Distribution)',
    USR_SYSID                      NUMBER comment 'User ID (related to SYS_USER_CD)',
    OTX_SYSID                      NUMBER comment 'Order ID (related to OTX)',
    DISPLAY_FLAG                   NUMBER comment 'Display Flag',
    DLR_MINIMUM                    VARCHAR(1) comment 'Dealer Minimum',
    ORIG_PAY_PER                   VARCHAR(18) comment 'Original Pay Period',
    IVT_TYPE                       VARCHAR(4) comment 'Type of Product',
    COM_PAY_SYSID                  NUMBER comment 'Commission Pay ID',
    INTERNAL_COMM                  BOOLEAN comment 'Internal Commission',
    WRHS_IND                       BOOLEAN comment 'WRHS IND'
)
    data_retention_time_in_days = 1;

create transient table INVESTIA_UNIVERIS.REVENUE_PAYABLE
(
    HK_LINK                        VARCHAR(40) comment 'Hash key for the Link',
    HK_HUB_CONTRACT                VARCHAR(40) comment 'Hash key for HUB_CONTRACT',
    HK_HUB_INVESTMENT_PRODUCT_TYPE VARCHAR(40) comment 'Hash key for HUB_INVESTMENT_PRODUCT_TYPE',
    MD_START_DT                    TIMESTAMPNTZ comment 'Start Date of the image/version',
    MD_HASHDIFF                    VARCHAR(64) comment 'Represents the whole set of hashed attributes to be historized for an occurrence',
    MD_CREATION_DT                 TIMESTAMPNTZ comment 'Creation Date Time of the occurrence',
    MD_SOURCE                      VARCHAR(1000) comment 'Represents the source system, file, etc. of the instance',
    MD_SRC_SYSTEM                  VARCHAR(100) comment 'Source system',
    MD_EXTRACT_DT                  TIMESTAMPNTZ comment 'Source extraction date',
    PAY_SYSID                      NUMBER comment 'Payable ID - Main key',
    PYBL_STATUS                    VARCHAR(6) comment 'Payable Status',
    EVENT_PROC_SYSID               NUMBER comment 'Event Procedure ID',
    EVENT_RPT_SYSID                NUMBER comment 'Event Report ID',
    BEN_SYSID                      NUMBER comment 'Beneficiary ID (related to REP table)',
    REP_SYSID                      NUMBER comment 'Advisor ID (related to REP table)',
    DEAL_SYSID                     NUMBER comment 'Deal ID (related to REP_DEAL link with parent REP table)',
    COM_SYSID                      NUMBER comment 'Comm ID (Related to REP_COM link with parents REP_DEAL, REP)',
    DIST_SYSID                     NUMBER comment 'Payroll Distribution ID (related to REP_PAY_DIST)',
    TRX_SYSID                      NUMBER comment 'Transaction ID (related to TRX)',
    IVR_SYSID                      NUMBER comment 'Investor (Client) ID (related to IVR)',
    PLN_SYSID                      NUMBER comment 'Plan (Account) ID (related to PLN)',
    ACT_SYSID                      NUMBER comment 'Account (Position) ID (related to ACT)',
    IVD_SYSID                      NUMBER comment 'Product ID (related to IVD link with parent IVT)',
    MGT_CD                         VARCHAR(10) comment 'Managemet Cie ID (related to MGT)',
    TRX_CD                         NUMBER comment 'Transaction Code id (related to S_TRX_CD)',
    PROC_DT                        TIMESTAMPNTZ comment 'Payable Process Date',
    PAID_DT                        TIMESTAMPNTZ comment 'Payable Paid Date',
    PAY_PERIOD                     VARCHAR(10) comment 'Pay Period',
    TAX_YEAR                       VARCHAR(8) comment 'Pay Fiscal Year',
    TRADE_DT                       TIMESTAMPNTZ comment 'Transaction Trade date (related to TRX)',
    GRSS_AMT                       DOUBLE comment 'Transaction Gross Amount (related to TRX)',
    COM_DLR                        DOUBLE comment 'Commission Dealer Amount',
    COM_PYBL                       DOUBLE comment 'Commission Amount',
    COM_BEN_PYBL                   DOUBLE comment 'Commission Pay to the Beneficiary',
    TICKET_CHG                     DOUBLE comment 'Ticket Charge',
    PAY_CD                         VARCHAR(6) comment 'Pay Code',
    COM_PRODUCTION_CD              VARCHAR(4) comment 'Commission Type Code (related to S_COM_PROD)',
    AMOUNT                         DOUBLE comment 'Amount (related to Payroll Distribution)',
    USR_SYSID                      NUMBER comment 'User ID (related to SYS_USER_CD)',
    OTX_SYSID                      NUMBER comment 'Order ID (related to OTX)',
    DISPLAY_FLAG                   NUMBER comment 'Display Flag',
    DLR_MINIMUM                    VARCHAR(2) comment 'Dealer Minimum',
    ORIG_PAY_PER                   VARCHAR(36) comment 'Original Pay Period',
    IVT_TYPE                       VARCHAR(8) comment 'Type of Product',
    COM_PAY_SYSID                  NUMBER comment 'Commission Pay ID',
    INTERNAL_COMM                  BOOLEAN comment 'Internal Commission',
    WRHS_IND                       BOOLEAN comment 'WRHS IND'
)
    data_retention_time_in_days = 1;

create transient table IAS_COMMISSION.SHARE
(
    HK_LINK          VARCHAR(64) comment 'Hash of the business keys',
    HK_HUB_FROM      VARCHAR(64) comment 'Hash of the business keys',
    HK_HUB_TO        VARCHAR(64) comment 'Hash of the business keys',
    MD_START_DT      TIMESTAMPNTZ comment 'Start Date of the image/version',
    MD_HASHDIFF      VARCHAR(64) comment 'Represents the whole set of hashed attributes to be historized for an occurrence',
    MD_CREATION_DT   TIMESTAMPNTZ comment 'Creation Date Time of the occurrence',
    MD_SOURCE        VARCHAR(1000) comment 'Represents the source system, file, etc. of the instance',
    MD_EXTRACT_DT    TIMESTAMPNTZ comment 'Extraction date of the occurrence',
    MD_SRCSYSTEM     VARCHAR(50) comment 'Source system',
    FROMREPID        VARCHAR(50) comment 'RR code',
    TOREPID          VARCHAR(50) comment 'Master code',
    SHARETYPE        VARCHAR(50) comment 'Sharing Type (codeSet)',
    SOURCECODE       VARCHAR(50) comment 'Source Code / TRANSACTION_TYPE',
    PRODUCTCODE      VARCHAR(50) comment 'Product Code / SECURITY_GROUP_CODE',
    REVENUEPCT       NUMBER(6, 3) comment 'Dispatch of revenues (percentage)',
    COMMISSIONPCT    NUMBER(6, 3) comment 'Commission Sharing Percentage',
    NETCOMMISSIONPCT NUMBER(6, 3) comment 'Net Commission Sharing Percentage',
    FEEPCT           NUMBER(6, 3) comment 'Fee Sharing Percentage',
    REVNO            NUMBER comment 'Revision number',
    STAMP            TIMESTAMPNTZ comment 'Source row timestamp'
)
    data_retention_time_in_days = 1;

create transient table IAS_COMMISSION.SHAREHIST
(
    HISTID           NUMBER(20) comment 'Identifier for the operation',
    HISTOPERATION    VARCHAR(12) comment 'Operation exp: DELETE',
    HISTSTAMP        TIMESTAMPNTZ comment 'Operation timestamp',
    HISTUSERID       VARCHAR(250) comment 'User identifier who did the operation',
    FROMREPID        VARCHAR(12) comment 'RR code',
    TOREPID          VARCHAR(12) comment 'Master code',
    SHARETYPE        VARCHAR(12) comment 'Sharing Type (codeSet)',
    SOURCECODE       VARCHAR(12) comment 'Source Code / TRANSACTION_TYPE',
    PRODUCTCOD       VARCHAR(12) comment 'Product Code / SECURITY_GROUP_CODE',
    REVENUEPCT       NUMBER(6, 3) comment 'Dispatch of revenues (percentage)',
    COMMISSIONPCT    NUMBER(6, 3) comment 'Commission Sharing Percentage',
    NETCOMMISSIONPCT NUMBER(6, 3) comment 'Net Commission Sharing Percentage',
    FEEPCT           NUMBER(6, 3) comment 'Fee Sharing Percentage',
    REVNO            NUMBER(11) comment 'Revision number',
    STAMP            TIMESTAMPNTZ comment 'Source row timestamp',
    USERID           VARCHAR(250) comment 'User identifier',
    MD_EXTRACT_DT    TIMESTAMPNTZ(7) comment 'Extraction date of the occurrence',
    MD_SRC_SYSTEM    VARCHAR(50) comment 'Source system',
    MD_START_DT      TIMESTAMPNTZ comment 'Start Date of the image/version',
    MD_SOURCE        VARCHAR(1000) comment 'Represents the source system, file, etc. of the instance'
)
    data_retention_time_in_days = 1;

create table IAS_CERTS.STG_REGISTERED_REPRESENTATIVE_START_DT_IAS_CERTS
(
    MD_START_DT TIMESTAMPNTZ comment 'Start Date of the image/version'
);

create transient table INVESTIA_UNIVERIS.S_COM_PRODUCTION
(
    HK_HUB                       VARCHAR(40) comment 'Hash of the business keys',
    MD_START_DT                  TIMESTAMPNTZ comment 'Start Date of the image/version',
    MD_HASHDIFF                  VARCHAR(40) comment 'Represents the whole set of hashed attributes to be historized for an occurrence',
    MD_CREATION_DT               TIMESTAMPNTZ comment 'Creation Date Time of the occurrence',
    MD_SOURCE                    VARCHAR(1000) comment 'Represents the source system, file, etc. of the instance',
    MD_SRC_SYSTEM                VARCHAR(100) comment 'Source system',
    MD_EXTRACT_DT                TIMESTAMPNTZ comment 'Source extraction date',
    COM_PRODUCTION_CD            VARCHAR(4) comment 'Product ID',
    COM_PRODUCTION_MNEM          VARCHAR(10) comment 'Product mnemonic code',
    COM_PRODUCTION_DESC          VARCHAR(30) comment 'Product description',
    COM_PRODUCTION_LONG_DESC     VARCHAR(80) comment 'Product long description',
    COM_PRODUCTION_MNEM_ENG      VARCHAR(10) comment 'Product mnemonic code english',
    COM_PRODUCTION_MNEM_FRE      VARCHAR(10) comment 'Product mnemonic code french',
    COM_PRODUCTION_DESC_ENG      VARCHAR(30) comment 'Product description english',
    COM_PRODUCTION_DESC_FRE      VARCHAR(30) comment 'prduct description french',
    COM_PRODUCTION_LONG_DESC_ENG VARCHAR(100) comment 'Product long description english',
    COM_PRODUCTION_LONG_DESC_FRE VARCHAR(120) comment 'Product long description french',
    CRC_TRND_RPT_CAT             VARCHAR(2),
    COMMISSION_LEVEL             NUMBER,
    CAC_TYPE_CD                  NUMBER,
    ACC_REPORT_IND               NUMBER
)
    data_retention_time_in_days = 1;

create transient table IAS_UNIVERIS.S_COM_PRODUCTION
(
    HK_HUB                       VARCHAR(40) comment 'Hash of the business keys',
    MD_START_DT                  TIMESTAMPNTZ comment 'Start Date of the image/version',
    MD_HASHDIFF                  VARCHAR(40) comment 'Represents the whole set of hashed attributes to be historized for an occurrence',
    MD_CREATION_DT               TIMESTAMPNTZ comment 'Creation Date Time of the occurrence',
    MD_SOURCE                    VARCHAR(1000) comment 'Represents the source system, file, etc. of the instance',
    MD_SRC_SYSTEM                VARCHAR(100) comment 'Source system',
    MD_EXTRACT_DT                TIMESTAMPNTZ comment 'Source extraction date',
    COM_PRODUCTION_CD            VARCHAR(2) comment 'Product ID',
    COM_PRODUCTION_MNEM          VARCHAR(5) comment 'Product mnemonic code',
    COM_PRODUCTION_DESC          VARCHAR(15) comment 'Product description',
    COM_PRODUCTION_LONG_DESC     VARCHAR(40) comment 'Product long description',
    COM_PRODUCTION_MNEM_ENG      VARCHAR(5) comment 'Product mnemonic code english',
    COM_PRODUCTION_MNEM_FRE      VARCHAR(5) comment 'Product mnemonic code french',
    COM_PRODUCTION_DESC_ENG      VARCHAR(15) comment 'Product description english',
    COM_PRODUCTION_DESC_FRE      VARCHAR(15) comment 'prduct description french',
    COM_PRODUCTION_LONG_DESC_ENG VARCHAR(50) comment 'Product long description english',
    COM_PRODUCTION_LONG_DESC_FRE VARCHAR(60) comment 'Product long description french',
    CRC_TRND_RPT_CAT             VARCHAR(1) comment 'Unknown',
    COMMISSION_LEVEL             NUMBER comment 'Unknown',
    CAC_TYPE_CD                  NUMBER comment 'Unknown',
    ACC_REPORT_IND               NUMBER comment 'Unknown'
)
    data_retention_time_in_days = 1;

create table STEWARDSHIP.TEST
(
    HK_HUB               VARCHAR(40) comment 'Hash key for the Hub',
    MD_START_DT          TIMESTAMPNTZ,
    MD_HASHDIFF          VARCHAR(40),
    MD_CREATION_DT       TIMESTAMPNTZ comment 'Creation Date Time of the occurrence',
    MD_CREATION_AUDIT_ID VARCHAR(1000) comment 'Task execution ID',
    MD_SOURCE            VARCHAR(1000) comment 'Represents the source system, file, etc. of the instance',
    MD_SRC_SYSTEM        VARCHAR(100) comment 'Source system',
    MD_EXTRACT_DT        TIMESTAMPNTZ comment 'Source extraction date',
    BK_ID_1              VARCHAR(100) comment 'BK ID',
    BK_ID_2              VARCHAR(100) comment 'BK ID',
    ATTR_DT              TIMESTAMPNTZ,
    ATTR_STRING          VARCHAR(1000),
    ATTR_DECIMAL         NUMBER(38, 2)
);

create table IAS_COMMISSION.TEST_REV_1
(
    DATE      DATE,
    FIRSTNAME VARCHAR
);

create table IAS_COMMISSION.TEST_REV_IH
(
    HK_LINK                   VARCHAR(40),
    HK_HUB_CONTRACT           VARCHAR(40),
    HK_HUB_PARTY_ROLE_ADVISOR VARCHAR(40),
    MD_CREATION_DT            TIMESTAMPNTZ,
    MD_START_DT               TIMESTAMPNTZ,
    MD_SOURCE                 VARCHAR(1000),
    MD_SRC_SYSTEM             VARCHAR(100),
    MD_EXTRACT_DT             TIMESTAMPNTZ,
    REPID                     VARCHAR(50),
    ADVISOR_ID                VARCHAR(512),
    PROGRAM_TYPE              VARCHAR(512),
    ACCOUNTID                 VARCHAR(100),
    PROCESSDATE               DATE,
    SOURCECODE                VARCHAR(50),
    QUANTITY                  NUMBER,
    TRANSTYPE                 VARCHAR(10),
    REVENUE                   NUMBER(38, 2),
    COMMISSION                NUMBER(38, 2),
    NETCOMMISSION             NUMBER(38, 2),
    TRANSFEE                  NUMBER(38, 2),
    ENTRY_TYPE                VARCHAR(20),
    STAMP                     DATE
);

create transient table IAS_COMMISSION.TRANSACTION_REVENUES
(
    HK_LINK                          VARCHAR(40) comment 'Hash of the business keys',
    HK_HUB_REGISTERED_REPRESENTATIVE VARCHAR(40) comment 'Hash key for registered representative',
    HK_HUB_CONTRACT                  VARCHAR(40) comment 'Hash key for an Account',
    MD_CREATION_DT                   TIMESTAMPNTZ default CURRENT_TIMESTAMP() comment 'Creation Date Time of the occurrence',
    MD_START_DT                      TIMESTAMPNTZ comment 'Start Date of the image/version',
    MD_SOURCE                        VARCHAR(1000) comment 'Represents the source system, file, etc. of the instance',
    MD_SRC_SYSTEM                    VARCHAR(100) comment 'Source system',
    MD_EXTRACT_DT                    TIMESTAMPNTZ comment 'Source extraction date',
    MD_HASHDIFF                      VARCHAR(64) comment 'Represents the whole set of hashed attributes to be historized for an occurrence',
    TRANSID                          NUMBER comment 'Transaction ID',
    EXTTRANSID                       VARCHAR(20) comment 'Extended transaction ID',
    PROCESSDATE                      DATE comment 'Process date',
    TRANSDATE                        TIMESTAMPNTZ comment 'Transaction date',
    SOURCECODE                       VARCHAR(24) comment 'Source code / Transaction type',
    CANCELIND                        NUMBER comment 'Cancel indicator',
    REPID                            VARCHAR(24) comment 'Representative ID',
    CURRENCY                         VARCHAR(6) comment 'transaction currency',
    EXCHANGERATE                     NUMBER(38, 2) comment 'the exchange rate used for the transaction',
    ENTRY_TYPE                       VARCHAR(24) comment 'entry type of revenue in source',
    COMMISSION                       NUMBER(38, 2) comment 'Representative gross commission',
    COMMISSIONCAD                    NUMBER(38, 2) comment 'Representative gross commission in CAD',
    OVERRIDEIND                      NUMBER comment 'Override indicator',
    ACCURATEIND                      NUMBER comment 'Accuracy indicator',
    DESCRIPTION                      VARCHAR(250) comment 'Description',
    NUMBEROFORDERS                   NUMBER comment 'Number of orders',
    NETCOMMISSION                    NUMBER(38, 2) comment 'Representative net commission',
    TRANSFEE                         NUMBER(38, 2) comment 'Representative transaction fees',
    SHAREIND                         NUMBER comment 'Share indicator',
    AFFECTGROSSCOMMIND               NUMBER comment 'Affect gross commission Indicator',
    REVENUEONLYIND                   NUMBER comment 'Revenu Only Indicator',
    NOTE                             VARCHAR(250) comment 'Notes',
    REVNO                            VARCHAR(250) comment 'Revision number',
    STAMP                            DATE comment 'Record insertion date',
    USERID                           VARCHAR(250) comment 'User ID',
    PROGRAM_TYPE                     VARCHAR(512) comment 'Program type of the account',
    ACCOUNTID                        VARCHAR(100) comment 'Account ID',
    QUANTITY                         NUMBER comment 'Transaction quantity',
    TRANSTYPE                        VARCHAR(10) comment 'Transaction Type ([B]uy/[S]ell) / BUY_SELL_INDICATOR'
)
    data_retention_time_in_days = 1;

create table IAS_COMMISSION.TRANSACTION_REVENUES_CLONE
(
    HK_LINK                          VARCHAR(40),
    HK_HUB_REGISTERED_REPRESENTATIVE VARCHAR(40),
    HK_HUB_CONTRACT                  VARCHAR(40),
    MD_CREATION_DT                   TIMESTAMPNTZ,
    MD_START_DT                      TIMESTAMPNTZ,
    MD_SOURCE                        VARCHAR(1000),
    MD_SRC_SYSTEM                    VARCHAR(100),
    MD_EXTRACT_DT                    TIMESTAMPNTZ,
    MD_HASHDIFF                      VARCHAR(64),
    TRANSID                          NUMBER,
    EXTTRANSID                       VARCHAR(20),
    PROCESSDATE                      DATE,
    TRANSDATE                        TIMESTAMPNTZ,
    SOURCECODE                       VARCHAR(24),
    CANCELIND                        NUMBER,
    REPID                            VARCHAR(24),
    CURRENCY                         VARCHAR(6),
    EXCHANGERATE                     NUMBER(38, 2),
    ENTRY_TYPE                       VARCHAR(24),
    COMMISSION                       NUMBER(38, 2),
    COMMISSIONCAD                    NUMBER(38, 2),
    OVERRIDEIND                      NUMBER,
    ACCURATEIND                      NUMBER,
    DESCRIPTION                      VARCHAR(250),
    NUMBEROFORDERS                   NUMBER,
    NETCOMMISSION                    NUMBER(38, 2),
    TRANSFEE                         NUMBER(38, 2),
    SHAREIND                         NUMBER,
    AFFECTGROSSCOMMIND               NUMBER,
    REVENUEONLYIND                   NUMBER,
    NOTE                             VARCHAR(250),
    REVNO                            VARCHAR(250),
    STAMP                            DATE,
    USERID                           VARCHAR(250),
    PROGRAM_TYPE                     VARCHAR(512),
    ACCOUNTID                        VARCHAR(100),
    QUANTITY                         NUMBER,
    TRANSTYPE                        VARCHAR(10)
);

create transient table INVESTIA_UNIVERIS.WRAP_FEE
(
    HK_LINK                        VARCHAR(40) comment 'Hash of the business keys',
    HK_HUB_CONTRACT                VARCHAR(40) comment 'Hash key for HUB_CONTRACT',
    HK_HUB_INVESTMENT_PRODUCT_TYPE VARCHAR(40) comment 'Hash key for HUB_INVESTMENT_PRODUCT_TYPE',
    MD_START_DT                    TIMESTAMPNTZ comment 'Start Date of the image/version',
    MD_HASHDIFF                    VARCHAR(40) comment 'Represents the whole set of hashed attributes to be historized for an occurrence',
    MD_CREATION_DT                 TIMESTAMPNTZ comment 'Creation Date Time of the occurrence',
    MD_SOURCE                      VARCHAR(1000) comment 'Represents the source system, file, etc. of the instance',
    MD_SRC_SYSTEM                  VARCHAR(100) comment 'Source system',
    MD_EXTRACT_DT                  TIMESTAMPNTZ comment 'Source extraction date',
    WF_SYSID                       NUMBER not null comment 'Wrap Fee ID (Main Key)',
    BATCH_SYSID                    NUMBER not null comment 'Batch ID',
    STATUS_CD                      VARCHAR(2) comment 'Status Code',
    CET_WF_SYSID                   NUMBER comment 'Code to reference with CET Table',
    IVR_SYSID                      NUMBER comment 'Investor (Client) ID (related to IVR)',
    WF_IND                         NUMBER,
    PLN_SYSID                      NUMBER comment 'Plan (Account) ID (related to PLN)',
    ACT_SYSID                      NUMBER comment 'Account (Position) ID (related to ACT)',
    OTX_SYSID                      NUMBER comment 'Order ID (related to OTX)',
    AVG_MV                         DOUBLE comment 'Average Market Value',
    CREATE_DT                      TIMESTAMPNTZ comment 'Creation Date',
    FEE_AMT                        DOUBLE comment 'Fee amount',
    FEE_GST                        DOUBLE comment 'Fee GST ( taxe )',
    FEE_PST                        DOUBLE comment 'Fee PST ( taxe )',
    FEE_TOTAL_AMT                  DOUBLE comment 'Fee total amount ( taxe included )',
    DLR_SYSID                      NUMBER comment 'Deal ID (related to DLR)',
    RGN_SYSID                      NUMBER comment 'Region ID (related to RGN)',
    BRN_SYSID                      NUMBER comment 'Branch ID (related to BRN)',
    REP_SYSID                      NUMBER comment 'Rep ID (related to REP)',
    USR_SYSID                      NUMBER comment 'USer ID',
    DESCRIPTION                    VARCHAR(120),
    LAST_UPD_DT                    TIMESTAMPNTZ comment 'Last upadate date',
    SRF_SYSID                      NUMBER comment 'SRF  ID',
    OTHER_COM_SYSID                NUMBER,
    FISCAL_SYSID                   NUMBER,
    PAYMENT_DT                     TIMESTAMPNTZ comment 'Payable Paid Date'
)
    data_retention_time_in_days = 1;

create table INVESTIA_UNIVERIS.X_DBB_MASTER_REP
(
    HK_LINK         VARCHAR(64) comment 'Hash of the business keys',
    HK_HUB_FROM     VARCHAR(64) comment 'Hash of the business keys',
    HK_HUB_TO       VARCHAR(64) comment 'Hash of the business keys',
    MD_START_DT     TIMESTAMPNTZ comment 'Start Date of the image/version',
    MD_HASHDIFF     VARCHAR(64) comment 'Represents the whole set of hashed attributes to be historized for an occurrence',
    MD_CREATION_DT  TIMESTAMPNTZ comment 'Creation Date Time of the occurrence',
    MD_SOURCE       VARCHAR(1000) comment 'Represents the source system, file, etc. of the instance',
    MD_EXTRACT_DT   TIMESTAMPNTZ comment 'Metadata for extraction date from source',
    MD_SRCSYSTEM    VARCHAR(50) comment 'Metadata for source system name',
    REP_CD_ORIGINAL VARCHAR(10) comment 'Original Representative code hashed as hk_hub_from',
    MASTER_CD       VARCHAR(10) comment 'Advisor master code hashed as hk_hub_to',
    REP_SYSID       NUMBER comment 'Registered Representative ID',
    BEN_SYSID       NUMBER comment 'Dealer ID',
    COMM_RATE       NUMBER(29, 12) comment 'Commission Rate',
    BRN_SYSID       NUMBER comment 'Branch ID',
    BRN_CD          VARCHAR(10) comment 'Branch code'
);

create table INVESTIA_UNIVERIS.X_DBB_MASTER_REP_FUNDEX
(
    HK_LINK         VARCHAR(40) comment 'Hash of the business keys',
    HK_HUB_FROM     VARCHAR(40) comment 'Hash of the business keys',
    HK_HUB_TO       VARCHAR(40) comment 'Hash of the business keys',
    MD_START_DT     TIMESTAMPNTZ comment 'Start Date of the image/version',
    MD_HASHDIFF     VARCHAR(40) comment 'Represents the whole set of hashed attributes to be historized for an occurrence',
    MD_CREATION_DT  TIMESTAMPNTZ comment 'Creation Date Time of the occurrence',
    MD_SOURCE       VARCHAR(1000) comment 'Represents the source system, file, etc. of the instance',
    MD_EXTRACT_DT   TIMESTAMPNTZ comment 'Metadata for extraction date from source',
    MD_SRCSYSTEM    VARCHAR(50) comment 'Metadata for source system name',
    REP_CD_ORIGINAL VARCHAR(10) comment 'Original Representative code hashed as hk_hub_from',
    MASTER_CD       VARCHAR(10) comment 'Advisor master code hashed as hk_hub_to',
    REP_SYSID       NUMBER comment 'Registered Representative ID',
    BEN_SYSID       NUMBER comment 'Dealer ID',
    COMM_RATE       NUMBER(29, 12) comment 'Commission Rate',
    BRN_SYSID       NUMBER comment 'Branch ID',
    BRN_CD          VARCHAR(10) comment 'Branch code'
);

create view comment 'The roles that can be applied to the current user.' INFORMATION_SCHEMA.APPLICABLE_ROLES as
-- missing source code
;

-- comment on column INFORMATION_SCHEMA.APPLICABLE_ROLES.GRANTEE not supported: Role or user to whom the privilege is granted

-- comment on column INFORMATION_SCHEMA.APPLICABLE_ROLES.ROLE_NAME not supported: Name of the role

-- comment on column INFORMATION_SCHEMA.APPLICABLE_ROLES.ROLE_OWNER not supported: Owner of the role

-- comment on column INFORMATION_SCHEMA.APPLICABLE_ROLES.IS_GRANTABLE not supported: Whether this role can be granted to others

create view comment
            'The columns of tables defined in this database that are accessible to the current user''s role.' INFORMATION_SCHEMA.COLUMNS as
-- missing source code
;

-- comment on column INFORMATION_SCHEMA.COLUMNS.TABLE_CATALOG not supported: Database that the table belongs to

-- comment on column INFORMATION_SCHEMA.COLUMNS.TABLE_SCHEMA not supported: Schema that the table belongs to

-- comment on column INFORMATION_SCHEMA.COLUMNS.TABLE_NAME not supported: Table that the column belongs to

-- comment on column INFORMATION_SCHEMA.COLUMNS.COLUMN_NAME not supported: Name of the column

-- comment on column INFORMATION_SCHEMA.COLUMNS.ORDINAL_POSITION not supported: Ordinal position of the column in the table

-- comment on column INFORMATION_SCHEMA.COLUMNS.COLUMN_DEFAULT not supported: Default value of the column

-- comment on column INFORMATION_SCHEMA.COLUMNS.IS_NULLABLE not supported: 'YES' if the column may contain NULL, 'NO' otherwise

-- comment on column INFORMATION_SCHEMA.COLUMNS.DATA_TYPE not supported: Data type of the column

-- comment on column INFORMATION_SCHEMA.COLUMNS.CHARACTER_MAXIMUM_LENGTH not supported: Maximum length in characters of string columns

-- comment on column INFORMATION_SCHEMA.COLUMNS.CHARACTER_OCTET_LENGTH not supported: Maximum length in bytes of string columns

-- comment on column INFORMATION_SCHEMA.COLUMNS.NUMERIC_PRECISION not supported: Numeric precision of numeric columns

-- comment on column INFORMATION_SCHEMA.COLUMNS.NUMERIC_PRECISION_RADIX not supported: Radix of precision of numeric columns

-- comment on column INFORMATION_SCHEMA.COLUMNS.NUMERIC_SCALE not supported: Scale of numeric columns

-- comment on column INFORMATION_SCHEMA.COLUMNS.DATETIME_PRECISION not supported: Not applicable for Snowflake.

-- comment on column INFORMATION_SCHEMA.COLUMNS.INTERVAL_TYPE not supported: Not applicable for Snowflake.

-- comment on column INFORMATION_SCHEMA.COLUMNS.INTERVAL_PRECISION not supported: Not applicable for Snowflake.

-- comment on column INFORMATION_SCHEMA.COLUMNS.CHARACTER_SET_CATALOG not supported: Not applicable for Snowflake.

-- comment on column INFORMATION_SCHEMA.COLUMNS.CHARACTER_SET_SCHEMA not supported: Not applicable for Snowflake.

-- comment on column INFORMATION_SCHEMA.COLUMNS.CHARACTER_SET_NAME not supported: Not applicable for Snowflake.

-- comment on column INFORMATION_SCHEMA.COLUMNS.COLLATION_CATALOG not supported: Not applicable for Snowflake.

-- comment on column INFORMATION_SCHEMA.COLUMNS.COLLATION_SCHEMA not supported: Not applicable for Snowflake.

-- comment on column INFORMATION_SCHEMA.COLUMNS.COLLATION_NAME not supported: The name of collation, if present

-- comment on column INFORMATION_SCHEMA.COLUMNS.DOMAIN_CATALOG not supported: Not applicable for Snowflake.

-- comment on column INFORMATION_SCHEMA.COLUMNS.DOMAIN_SCHEMA not supported: Not applicable for Snowflake.

-- comment on column INFORMATION_SCHEMA.COLUMNS.DOMAIN_NAME not supported: Not applicable for Snowflake.

-- comment on column INFORMATION_SCHEMA.COLUMNS.UDT_CATALOG not supported: Not applicable for Snowflake.

-- comment on column INFORMATION_SCHEMA.COLUMNS.UDT_SCHEMA not supported: Not applicable for Snowflake.

-- comment on column INFORMATION_SCHEMA.COLUMNS.UDT_NAME not supported: Not applicable for Snowflake.

-- comment on column INFORMATION_SCHEMA.COLUMNS.SCOPE_CATALOG not supported: Not applicable for Snowflake.

-- comment on column INFORMATION_SCHEMA.COLUMNS.SCOPE_SCHEMA not supported: Not applicable for Snowflake.

-- comment on column INFORMATION_SCHEMA.COLUMNS.SCOPE_NAME not supported: Not applicable for Snowflake.

-- comment on column INFORMATION_SCHEMA.COLUMNS.MAXIMUM_CARDINALITY not supported: Not applicable for Snowflake.

-- comment on column INFORMATION_SCHEMA.COLUMNS.DTD_IDENTIFIER not supported: Not applicable for Snowflake.

-- comment on column INFORMATION_SCHEMA.COLUMNS.IS_SELF_REFERENCING not supported: Not applicable for Snowflake.

-- comment on column INFORMATION_SCHEMA.COLUMNS.IS_IDENTITY not supported: Whether this column is an identity column

-- comment on column INFORMATION_SCHEMA.COLUMNS.IDENTITY_GENERATION not supported: Whether an identity column's value is always generated or only generated by default.  Snowflake only supports BY DEFAULT

-- comment on column INFORMATION_SCHEMA.COLUMNS.IDENTITY_START not supported: Not applicable for Snowflake.

-- comment on column INFORMATION_SCHEMA.COLUMNS.IDENTITY_INCREMENT not supported: Not applicable for Snowflake.

-- comment on column INFORMATION_SCHEMA.COLUMNS.IDENTITY_MAXIMUM not supported: Not applicable for Snowflake.

-- comment on column INFORMATION_SCHEMA.COLUMNS.IDENTITY_MINIMUM not supported: Not applicable for Snowflake.

-- comment on column INFORMATION_SCHEMA.COLUMNS.IDENTITY_CYCLE not supported: Whether the value of an identity column may cycle.  Snowflake only supports NO CYCLE.

-- comment on column INFORMATION_SCHEMA.COLUMNS.COMMENT not supported: Comment for this column

create view comment 'The databases that are accessible to the current user''s role.' INFORMATION_SCHEMA.DATABASES as
-- missing source code
;

-- comment on column INFORMATION_SCHEMA.DATABASES.DATABASE_NAME not supported: Name of the database

-- comment on column INFORMATION_SCHEMA.DATABASES.DATABASE_OWNER not supported: Name of the role that owns the schema

-- comment on column INFORMATION_SCHEMA.DATABASES.IS_TRANSIENT not supported: Whether this is a transient table

-- comment on column INFORMATION_SCHEMA.DATABASES.COMMENT not supported: Comment for this database

-- comment on column INFORMATION_SCHEMA.DATABASES.CREATED not supported: Creation time of the database

-- comment on column INFORMATION_SCHEMA.DATABASES.LAST_ALTERED not supported: Last altered time of the database

-- comment on column INFORMATION_SCHEMA.DATABASES.RETENTION_TIME not supported: Number of days that historical data is retained for Time Travel

create view comment 'The roles that are enabled to the current user.' INFORMATION_SCHEMA.ENABLED_ROLES as
-- missing source code
;

-- comment on column INFORMATION_SCHEMA.ENABLED_ROLES.ROLE_NAME not supported: Name of the role

-- comment on column INFORMATION_SCHEMA.ENABLED_ROLES.ROLE_OWNER not supported: Owner of the role

create view comment
            'The external tables defined in this database that are accessible to the current user''s role.' INFORMATION_SCHEMA.EXTERNAL_TABLES as
-- missing source code
;

-- comment on column INFORMATION_SCHEMA.EXTERNAL_TABLES.TABLE_CATALOG not supported: Database that the external table belongs to

-- comment on column INFORMATION_SCHEMA.EXTERNAL_TABLES.TABLE_SCHEMA not supported: Schema that the external table belongs to

-- comment on column INFORMATION_SCHEMA.EXTERNAL_TABLES.TABLE_NAME not supported: Name of the external table

-- comment on column INFORMATION_SCHEMA.EXTERNAL_TABLES.TABLE_OWNER not supported: Name of the role that owns the external table

-- comment on column INFORMATION_SCHEMA.EXTERNAL_TABLES.CREATED not supported: Creation time of the external table

-- comment on column INFORMATION_SCHEMA.EXTERNAL_TABLES.LAST_ALTERED not supported: Last altered time of the external table

-- comment on column INFORMATION_SCHEMA.EXTERNAL_TABLES.COMMENT not supported: Comment for this external table

-- comment on column INFORMATION_SCHEMA.EXTERNAL_TABLES.LOCATION not supported: Location of the external table

-- comment on column INFORMATION_SCHEMA.EXTERNAL_TABLES.FILE_FORMAT_NAME not supported: File format name (if there is one) of the external table

-- comment on column INFORMATION_SCHEMA.EXTERNAL_TABLES.FILE_FORMAT_TYPE not supported: File format type (if not named) of the external table

create view comment
            'The file formats defined in this database that are accessible to the current user''s role.' INFORMATION_SCHEMA.FILE_FORMATS as
-- missing source code
;

-- comment on column INFORMATION_SCHEMA.FILE_FORMATS.FILE_FORMAT_CATALOG not supported: Database that the file format belongs to

-- comment on column INFORMATION_SCHEMA.FILE_FORMATS.FILE_FORMAT_SCHEMA not supported: Schema that the file format belongs to

-- comment on column INFORMATION_SCHEMA.FILE_FORMATS.FILE_FORMAT_NAME not supported: Name of the file format

-- comment on column INFORMATION_SCHEMA.FILE_FORMATS.FILE_FORMAT_OWNER not supported: Name of the role that owns the file format

-- comment on column INFORMATION_SCHEMA.FILE_FORMATS.FILE_FORMAT_TYPE not supported: Type of the file format

-- comment on column INFORMATION_SCHEMA.FILE_FORMATS.RECORD_DELIMITER not supported: Character that separates records

-- comment on column INFORMATION_SCHEMA.FILE_FORMATS.FIELD_DELIMITER not supported: Character that separates fields

-- comment on column INFORMATION_SCHEMA.FILE_FORMATS.SKIP_HEADER not supported: Number of lines skipped at the start of the file

-- comment on column INFORMATION_SCHEMA.FILE_FORMATS.DATE_FORMAT not supported: Date format

-- comment on column INFORMATION_SCHEMA.FILE_FORMATS.TIME_FORMAT not supported: Time format

-- comment on column INFORMATION_SCHEMA.FILE_FORMATS.TIMESTAMP_FORMAT not supported: Timestamp format

-- comment on column INFORMATION_SCHEMA.FILE_FORMATS.BINARY_FORMAT not supported: Binary format

-- comment on column INFORMATION_SCHEMA.FILE_FORMATS.ESCAPE not supported: String used as the escape character for any field values

-- comment on column INFORMATION_SCHEMA.FILE_FORMATS.ESCAPE_UNENCLOSED_FIELD not supported: String used as the escape character for unenclosed field values

-- comment on column INFORMATION_SCHEMA.FILE_FORMATS.TRIM_SPACE not supported: Whether whitespace is removed from fields

-- comment on column INFORMATION_SCHEMA.FILE_FORMATS.FIELD_OPTIONALLY_ENCLOSED_BY not supported: Character used to enclose strings

-- comment on column INFORMATION_SCHEMA.FILE_FORMATS.NULL_IF not supported: A list of strings to be replaced by null

-- comment on column INFORMATION_SCHEMA.FILE_FORMATS.COMPRESSION not supported: Compression method for the data file

-- comment on column INFORMATION_SCHEMA.FILE_FORMATS.ERROR_ON_COLUMN_COUNT_MISMATCH not supported: Whether to generate a parsing error if the number of fields in an input file does not match the number of columns in the corresponding table

-- comment on column INFORMATION_SCHEMA.FILE_FORMATS.CREATED not supported: Creation time of the file format

-- comment on column INFORMATION_SCHEMA.FILE_FORMATS.LAST_ALTERED not supported: Last altered time of the file format

-- comment on column INFORMATION_SCHEMA.FILE_FORMATS.COMMENT not supported: Comment for this file format

create view comment
            'The user-defined functions defined in this database that are accessible to the current user''s role.' INFORMATION_SCHEMA.FUNCTIONS as
-- missing source code
;

-- comment on column INFORMATION_SCHEMA.FUNCTIONS.FUNCTION_CATALOG not supported: Database which the function belongs to

-- comment on column INFORMATION_SCHEMA.FUNCTIONS.FUNCTION_SCHEMA not supported: Schema which the function belongs to

-- comment on column INFORMATION_SCHEMA.FUNCTIONS.FUNCTION_NAME not supported: Name of the function

-- comment on column INFORMATION_SCHEMA.FUNCTIONS.FUNCTION_OWNER not supported: Name of the role that owns the function

-- comment on column INFORMATION_SCHEMA.FUNCTIONS.ARGUMENT_SIGNATURE not supported: Type signature of the function's arguments

-- comment on column INFORMATION_SCHEMA.FUNCTIONS.DATA_TYPE not supported: Return value data type

-- comment on column INFORMATION_SCHEMA.FUNCTIONS.CHARACTER_MAXIMUM_LENGTH not supported: Maximum length in characters of string return value

-- comment on column INFORMATION_SCHEMA.FUNCTIONS.CHARACTER_OCTET_LENGTH not supported: Maximum length in bytes of string return value

-- comment on column INFORMATION_SCHEMA.FUNCTIONS.NUMERIC_PRECISION not supported: Numeric precision of numeric return value

-- comment on column INFORMATION_SCHEMA.FUNCTIONS.NUMERIC_PRECISION_RADIX not supported: Radix of precision of numeric return value

-- comment on column INFORMATION_SCHEMA.FUNCTIONS.NUMERIC_SCALE not supported: Scale of numeric return value

-- comment on column INFORMATION_SCHEMA.FUNCTIONS.FUNCTION_LANGUAGE not supported: Language of the function

-- comment on column INFORMATION_SCHEMA.FUNCTIONS.FUNCTION_DEFINITION not supported: Function definition

-- comment on column INFORMATION_SCHEMA.FUNCTIONS.VOLATILITY not supported: Whether the function is volatile or immutable

-- comment on column INFORMATION_SCHEMA.FUNCTIONS.IS_NULL_CALL not supported: Whether the function is called on null input

-- comment on column INFORMATION_SCHEMA.FUNCTIONS.IS_SECURE not supported: Whether this function is secure.

-- comment on column INFORMATION_SCHEMA.FUNCTIONS.CREATED not supported: Creation time of the function

-- comment on column INFORMATION_SCHEMA.FUNCTIONS.LAST_ALTERED not supported: Last altered time of the function

-- comment on column INFORMATION_SCHEMA.FUNCTIONS.COMMENT not supported: Comment for this function

-- comment on column INFORMATION_SCHEMA.FUNCTIONS.IS_EXTERNAL not supported: Whether this function is external

-- comment on column INFORMATION_SCHEMA.FUNCTIONS.API_INTEGRATION not supported: Integration for this function

-- comment on column INFORMATION_SCHEMA.FUNCTIONS.CONTEXT_HEADERS not supported: Context headers for this function

-- comment on column INFORMATION_SCHEMA.FUNCTIONS.MAX_BATCH_ROWS not supported: Max batch rows for this function

-- comment on column INFORMATION_SCHEMA.FUNCTIONS.REQUEST_TRANSLATOR not supported: Request Translator function name

-- comment on column INFORMATION_SCHEMA.FUNCTIONS.RESPONSE_TRANSLATOR not supported: Response Translator function name

-- comment on column INFORMATION_SCHEMA.FUNCTIONS.COMPRESSION not supported: Type of compression used for serializing function payload

-- comment on column INFORMATION_SCHEMA.FUNCTIONS.IMPORTS not supported: List of imports for the function

-- comment on column INFORMATION_SCHEMA.FUNCTIONS.HANDLER not supported: Handler for the function

-- comment on column INFORMATION_SCHEMA.FUNCTIONS.TARGET_PATH not supported: Stage path for storage of compiled inline Java UDF code

create view comment
            'Identifies the database (or catalog, in SQL terminology) that contains the information_schema' INFORMATION_SCHEMA.INFORMATION_SCHEMA_CATALOG_NAME as
-- missing source code
;

-- comment on column INFORMATION_SCHEMA.INFORMATION_SCHEMA_CATALOG_NAME.CATALOG_NAME not supported: The name of the database in which this information_schema resides.

create view comment 'The loading information of the copy command' INFORMATION_SCHEMA.LOAD_HISTORY as
-- missing source code
;

-- comment on column INFORMATION_SCHEMA.LOAD_HISTORY.SCHEMA_NAME not supported: Schema of target table

-- comment on column INFORMATION_SCHEMA.LOAD_HISTORY.FILE_NAME not supported: Name of source file

-- comment on column INFORMATION_SCHEMA.LOAD_HISTORY.TABLE_NAME not supported: Name of target table

-- comment on column INFORMATION_SCHEMA.LOAD_HISTORY.LAST_LOAD_TIME not supported: Timestamp of the load record

-- comment on column INFORMATION_SCHEMA.LOAD_HISTORY.STATUS not supported: Status: loaded, load failed or partially loaded

-- comment on column INFORMATION_SCHEMA.LOAD_HISTORY.ROW_COUNT not supported: Number of rows loaded from the source file

-- comment on column INFORMATION_SCHEMA.LOAD_HISTORY.ROW_PARSED not supported: Number of rows parsed from the source file

-- comment on column INFORMATION_SCHEMA.LOAD_HISTORY.FIRST_ERROR_MESSAGE not supported: First error of the source file

-- comment on column INFORMATION_SCHEMA.LOAD_HISTORY.FIRST_ERROR_LINE_NUMBER not supported: Line number of the first error

-- comment on column INFORMATION_SCHEMA.LOAD_HISTORY.FIRST_ERROR_CHARACTER_POSITION not supported: Position of the first error character

-- comment on column INFORMATION_SCHEMA.LOAD_HISTORY.FIRST_ERROR_COL_NAME not supported: Column name of the first error

-- comment on column INFORMATION_SCHEMA.LOAD_HISTORY.ERROR_COUNT not supported: Number of error rows in the source file

-- comment on column INFORMATION_SCHEMA.LOAD_HISTORY.ERROR_LIMIT not supported: If the number of error reach this limit, then abort

create view comment
            'The privileges on all objects defined in this database that are accessible to the current user''s role.' INFORMATION_SCHEMA.OBJECT_PRIVILEGES as
-- missing source code
;

-- comment on column INFORMATION_SCHEMA.OBJECT_PRIVILEGES.GRANTOR not supported: Role who granted the privilege

-- comment on column INFORMATION_SCHEMA.OBJECT_PRIVILEGES.GRANTEE not supported: Role to whom the privilege is granted

-- comment on column INFORMATION_SCHEMA.OBJECT_PRIVILEGES.OBJECT_CATALOG not supported: Database containing the object on which the privilege is granted

-- comment on column INFORMATION_SCHEMA.OBJECT_PRIVILEGES.OBJECT_SCHEMA not supported: Schema containing the object on which the privilege is granted

-- comment on column INFORMATION_SCHEMA.OBJECT_PRIVILEGES.OBJECT_NAME not supported: Name of the object on which the privilege is granted

-- comment on column INFORMATION_SCHEMA.OBJECT_PRIVILEGES.OBJECT_TYPE not supported: Type of the object on which the privilege is granted

-- comment on column INFORMATION_SCHEMA.OBJECT_PRIVILEGES.PRIVILEGE_TYPE not supported: Type of the granted privilege

-- comment on column INFORMATION_SCHEMA.OBJECT_PRIVILEGES.IS_GRANTABLE not supported: Whether the privilege was granted WITH GRANT OPTION

-- comment on column INFORMATION_SCHEMA.OBJECT_PRIVILEGES.CREATED not supported: Creation time of the privilege

create view comment 'Available packages in current account' INFORMATION_SCHEMA.PACKAGES as
-- missing source code
;

-- comment on column INFORMATION_SCHEMA.PACKAGES.PACKAGE_NAME not supported: Package name

-- comment on column INFORMATION_SCHEMA.PACKAGES.VERSION not supported: Package version

-- comment on column INFORMATION_SCHEMA.PACKAGES.LANGUAGE not supported: Package language

create view comment
            'The pipes defined in this database that are accessible to the current user''s role.' INFORMATION_SCHEMA.PIPES as
-- missing source code
;

-- comment on column INFORMATION_SCHEMA.PIPES.PIPE_CATALOG not supported: Database that the pipe belongs to

-- comment on column INFORMATION_SCHEMA.PIPES.PIPE_SCHEMA not supported: Schema that the pipe belongs to

-- comment on column INFORMATION_SCHEMA.PIPES.PIPE_NAME not supported: Name of the pipe

-- comment on column INFORMATION_SCHEMA.PIPES.PIPE_OWNER not supported: Name of the role that owns the pipe

-- comment on column INFORMATION_SCHEMA.PIPES.DEFINITION not supported: Definition of the pipe as it was created

-- comment on column INFORMATION_SCHEMA.PIPES.IS_AUTOINGEST_ENABLED not supported: Whether this is an auto-ingest tpipe

-- comment on column INFORMATION_SCHEMA.PIPES.NOTIFICATION_CHANNEL_NAME not supported: Notification channel name if it is an auto-ingest pipe

-- comment on column INFORMATION_SCHEMA.PIPES.CREATED not supported: Creation time of the pipe

-- comment on column INFORMATION_SCHEMA.PIPES.LAST_ALTERED not supported: Last altered time of the pipe

-- comment on column INFORMATION_SCHEMA.PIPES.COMMENT not supported: Comment for this pipe

-- comment on column INFORMATION_SCHEMA.PIPES.PATTERN not supported: Pattern used to filter the files in Snowpipe

create view comment
            'The stored procedures defined in this database that are accessible to the current user''s role.' INFORMATION_SCHEMA.PROCEDURES as
-- missing source code
;

-- comment on column INFORMATION_SCHEMA.PROCEDURES.PROCEDURE_CATALOG not supported: Database which the procedure belongs to

-- comment on column INFORMATION_SCHEMA.PROCEDURES.PROCEDURE_SCHEMA not supported: Schema which the procedure belongs to

-- comment on column INFORMATION_SCHEMA.PROCEDURES.PROCEDURE_NAME not supported: Name of the procedure

-- comment on column INFORMATION_SCHEMA.PROCEDURES.PROCEDURE_OWNER not supported: Name of the role that owns the procedure

-- comment on column INFORMATION_SCHEMA.PROCEDURES.ARGUMENT_SIGNATURE not supported: Type signature of the procedure's arguments

-- comment on column INFORMATION_SCHEMA.PROCEDURES.DATA_TYPE not supported: Return value data type

-- comment on column INFORMATION_SCHEMA.PROCEDURES.CHARACTER_MAXIMUM_LENGTH not supported: Maximum length in characters of string return value

-- comment on column INFORMATION_SCHEMA.PROCEDURES.CHARACTER_OCTET_LENGTH not supported: Maximum length in bytes of string return value

-- comment on column INFORMATION_SCHEMA.PROCEDURES.NUMERIC_PRECISION not supported: Numeric precision of numeric return value

-- comment on column INFORMATION_SCHEMA.PROCEDURES.NUMERIC_PRECISION_RADIX not supported: Radix of precision of numeric return value

-- comment on column INFORMATION_SCHEMA.PROCEDURES.NUMERIC_SCALE not supported: Scale of numeric return value

-- comment on column INFORMATION_SCHEMA.PROCEDURES.PROCEDURE_LANGUAGE not supported: Language of the procedure

-- comment on column INFORMATION_SCHEMA.PROCEDURES.PROCEDURE_DEFINITION not supported: Procedure definition

-- comment on column INFORMATION_SCHEMA.PROCEDURES.CREATED not supported: Creation time of the procedure

-- comment on column INFORMATION_SCHEMA.PROCEDURES.LAST_ALTERED not supported: Last altered time of the procedure

-- comment on column INFORMATION_SCHEMA.PROCEDURES.COMMENT not supported: Comment for this procedure

create view comment
            'Referential Constraints in this database that are accessible to the current user' INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS as
-- missing source code
;

-- comment on column INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS.CONSTRAINT_CATALOG not supported: Database that the constraint belongs to

-- comment on column INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS.CONSTRAINT_SCHEMA not supported: Schema that the constraint belongs to

-- comment on column INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS.CONSTRAINT_NAME not supported: Name of the constraint

-- comment on column INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS.UNIQUE_CONSTRAINT_CATALOG not supported: Database of the unique constraint referenced by the current constraint

-- comment on column INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS.UNIQUE_CONSTRAINT_SCHEMA not supported: Schema of the unique constraint referenced by the current constraint

-- comment on column INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS.UNIQUE_CONSTRAINT_NAME not supported: Name of the unique constraint referenced by the current constraint

-- comment on column INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS.MATCH_OPTION not supported: Match option for the constraint

-- comment on column INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS.UPDATE_RULE not supported: Update Rule for the current constraint

-- comment on column INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS.DELETE_RULE not supported: Delete Rule for the current constraint

-- comment on column INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS.COMMENT not supported: Comment for this constraint

-- comment on column INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS.CREATED not supported: Creation time of the constraint

-- comment on column INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS.LAST_ALTERED not supported: Last altered time of the constraint

create or replace view REGISTERED_REPRESENTATIVE_CLEAN(
	MD_START_DT,
	MD_SOURCE,
	MD_SRC_SYSTEM,
	MD_EXTRACT_DT,
	REPID,
	REPNAME,
	FIRSTNAME,
	LASTNAME,
	BRANCHCODE,
	BRANCHNAME,
	GROUPID,
	GROUPDESCRIPTION,
	FIXEDFEEIND,
	MANAGEDIND,
	REFIND,
	ACTIVEIND,
	SEGFUNDIND,
	REVNO,
	STAMP,
	USERID,
	ACTIVE,
	ADVISOR_ID,
	COMMRATEPCT,
	SHAREGROSSCOMMIND,
	STARTDATE,
	MAINREPCODE,
	ADVISOR_ROLE
) as 
SELECT * FROM IAS_COMMISSION.REGISTERED_REPRESENTATIVE_RECEPTION A
WHERE (A.ACTIVE =1 OR A.ACTIVE =0)
AND A.REPID <>'CMLJ'
AND A.MD_START_DT <>'2015-04-24';

create view DB_IAW_DEV_STG.IAS_CERTS.REGISTERED_REPRESENTATIVE_TEST as
Select * from DB_IAW_DEV_STG.IAS_CERTS.REGISTERED_REPRESENTATIVE;

create view comment
            'The databases for replication that are accessible to the current user''s role.' INFORMATION_SCHEMA.REPLICATION_DATABASES as
-- missing source code
;

-- comment on column INFORMATION_SCHEMA.REPLICATION_DATABASES.REGION_GROUP not supported: Region group of this database

-- comment on column INFORMATION_SCHEMA.REPLICATION_DATABASES.SNOWFLAKE_REGION not supported: Snowflake region of this database

-- comment on column INFORMATION_SCHEMA.REPLICATION_DATABASES.ACCOUNT_NAME not supported: Name of the account that owns the database

-- comment on column INFORMATION_SCHEMA.REPLICATION_DATABASES.DATABASE_NAME not supported: Name of the database

-- comment on column INFORMATION_SCHEMA.REPLICATION_DATABASES.COMMENT not supported: Comment for this database

-- comment on column INFORMATION_SCHEMA.REPLICATION_DATABASES.CREATED not supported: Creation time of the database

-- comment on column INFORMATION_SCHEMA.REPLICATION_DATABASES.IS_PRIMARY not supported: Whether this database is the primary

-- comment on column INFORMATION_SCHEMA.REPLICATION_DATABASES.PRIMARY not supported: Primary database of this replication group

-- comment on column INFORMATION_SCHEMA.REPLICATION_DATABASES.REPLICATION_ALLOWED_TO_ACCOUNTS not supported: List of accounts that can host secondary replicas for this database

-- comment on column INFORMATION_SCHEMA.REPLICATION_DATABASES.FAILOVER_ALLOWED_TO_ACCOUNTS not supported: List of accounts that can host primary replicas for this database

create view comment
            'The schemas defined in this database that are accessible to the current user''s role.' INFORMATION_SCHEMA.SCHEMATA as
-- missing source code
;

-- comment on column INFORMATION_SCHEMA.SCHEMATA.CATALOG_NAME not supported: Database that the schema belongs to

-- comment on column INFORMATION_SCHEMA.SCHEMATA.SCHEMA_NAME not supported: Name of the schema

-- comment on column INFORMATION_SCHEMA.SCHEMATA.SCHEMA_OWNER not supported: Name of the role that owns the schema

-- comment on column INFORMATION_SCHEMA.SCHEMATA.IS_TRANSIENT not supported: Whether this is a transient table

-- comment on column INFORMATION_SCHEMA.SCHEMATA.IS_MANAGED_ACCESS not supported: Whether this is a managed access schema

-- comment on column INFORMATION_SCHEMA.SCHEMATA.RETENTION_TIME not supported: Number of days that historical data is retained for Time Travel

-- comment on column INFORMATION_SCHEMA.SCHEMATA.DEFAULT_CHARACTER_SET_CATALOG not supported: Not applicable for Snowflake.

-- comment on column INFORMATION_SCHEMA.SCHEMATA.DEFAULT_CHARACTER_SET_SCHEMA not supported: Not applicable for Snowflake.

-- comment on column INFORMATION_SCHEMA.SCHEMATA.DEFAULT_CHARACTER_SET_NAME not supported: Not applicable for Snowflake.

-- comment on column INFORMATION_SCHEMA.SCHEMATA.SQL_PATH not supported: Not applicable for Snowflake.

-- comment on column INFORMATION_SCHEMA.SCHEMATA.CREATED not supported: Creation time of the schema

-- comment on column INFORMATION_SCHEMA.SCHEMATA.LAST_ALTERED not supported: Last altered time of the schema

-- comment on column INFORMATION_SCHEMA.SCHEMATA.COMMENT not supported: Comment for this schema

create view comment
            'The sequences defined in this database that are accessible to the current user''s role.' INFORMATION_SCHEMA.SEQUENCES as
-- missing source code
;

-- comment on column INFORMATION_SCHEMA.SEQUENCES.SEQUENCE_CATALOG not supported: Database that the sequence belongs to

-- comment on column INFORMATION_SCHEMA.SEQUENCES.SEQUENCE_SCHEMA not supported: Schema that the sequence belongs to

-- comment on column INFORMATION_SCHEMA.SEQUENCES.SEQUENCE_NAME not supported: Name of the sequence

-- comment on column INFORMATION_SCHEMA.SEQUENCES.SEQUENCE_OWNER not supported: Name of the role that owns the sequence

-- comment on column INFORMATION_SCHEMA.SEQUENCES.DATA_TYPE not supported: Data type of the sequence

-- comment on column INFORMATION_SCHEMA.SEQUENCES.NUMERIC_PRECISION not supported: Numeric precision of the data type of the sequence

-- comment on column INFORMATION_SCHEMA.SEQUENCES.NUMERIC_PRECISION_RADIX not supported: Radix of the numeric precision of the data type of the sequence

-- comment on column INFORMATION_SCHEMA.SEQUENCES.NUMERIC_SCALE not supported: Scale of the data type of the sequence

-- comment on column INFORMATION_SCHEMA.SEQUENCES.START_VALUE not supported: Initial value of the sequence

-- comment on column INFORMATION_SCHEMA.SEQUENCES.MINIMUM_VALUE not supported: Not applicable for Snowflake.

-- comment on column INFORMATION_SCHEMA.SEQUENCES.MAXIMUM_VALUE not supported: Not applicable for Snowflake.

-- comment on column INFORMATION_SCHEMA.SEQUENCES.NEXT_VALUE not supported: Next value that the sequence will produce

-- comment on column INFORMATION_SCHEMA.SEQUENCES."INCREMENT" not supported: Increment of the sequence generator

-- comment on column INFORMATION_SCHEMA.SEQUENCES.CYCLE_OPTION not supported: Not applicable for Snowflake.

-- comment on column INFORMATION_SCHEMA.SEQUENCES.CREATED not supported: Creation time of the sequence

-- comment on column INFORMATION_SCHEMA.SEQUENCES.LAST_ALTERED not supported: Last altered time of the sequence

-- comment on column INFORMATION_SCHEMA.SEQUENCES.COMMENT not supported: Comment for this sequence

create view comment
            'Stages in this database that are accessible by the current user''s role' INFORMATION_SCHEMA.STAGES as
-- missing source code
;

-- comment on column INFORMATION_SCHEMA.STAGES.STAGE_CATALOG not supported: Database that the stage belongs to

-- comment on column INFORMATION_SCHEMA.STAGES.STAGE_SCHEMA not supported: Schema that the stage belongs to

-- comment on column INFORMATION_SCHEMA.STAGES.STAGE_NAME not supported: Name of the stage

-- comment on column INFORMATION_SCHEMA.STAGES.STAGE_URL not supported: Location of an external stage

-- comment on column INFORMATION_SCHEMA.STAGES.STAGE_REGION not supported: AWS region where the stage resides

-- comment on column INFORMATION_SCHEMA.STAGES.STAGE_TYPE not supported: Type of stage: User, Table, Internal Named or External Named

-- comment on column INFORMATION_SCHEMA.STAGES.STAGE_OWNER not supported: Name of the role that owns the stage

-- comment on column INFORMATION_SCHEMA.STAGES.COMMENT not supported: Comment for this stage

-- comment on column INFORMATION_SCHEMA.STAGES.CREATED not supported: Creation time of the stage

-- comment on column INFORMATION_SCHEMA.STAGES.LAST_ALTERED not supported: Last altered time of the stage

create view comment
            'The tables defined in this database that are accessible to the current user''s role.' INFORMATION_SCHEMA.TABLES as
-- missing source code
;

-- comment on column INFORMATION_SCHEMA.TABLES.TABLE_CATALOG not supported: Database that the table belongs to

-- comment on column INFORMATION_SCHEMA.TABLES.TABLE_SCHEMA not supported: Schema that the table belongs to

-- comment on column INFORMATION_SCHEMA.TABLES.TABLE_NAME not supported: Name of the table

-- comment on column INFORMATION_SCHEMA.TABLES.TABLE_OWNER not supported: Name of the role that owns the table

-- comment on column INFORMATION_SCHEMA.TABLES.TABLE_TYPE not supported: Whether the table is a base table, temporary table, or view

-- comment on column INFORMATION_SCHEMA.TABLES.IS_TRANSIENT not supported: Whether this is a transient table

-- comment on column INFORMATION_SCHEMA.TABLES.CLUSTERING_KEY not supported: Clustering key for the table

-- comment on column INFORMATION_SCHEMA.TABLES.ROW_COUNT not supported: Number of rows in the table

-- comment on column INFORMATION_SCHEMA.TABLES.BYTES not supported: Number of bytes accessed by a scan of the table

-- comment on column INFORMATION_SCHEMA.TABLES.RETENTION_TIME not supported: Number of days that historical data is retained for Time Travel

-- comment on column INFORMATION_SCHEMA.TABLES.SELF_REFERENCING_COLUMN_NAME not supported: Not applicable for Snowflake.

-- comment on column INFORMATION_SCHEMA.TABLES.REFERENCE_GENERATION not supported: Not applicable for Snowflake.

-- comment on column INFORMATION_SCHEMA.TABLES.USER_DEFINED_TYPE_CATALOG not supported: Not applicable for Snowflake.

-- comment on column INFORMATION_SCHEMA.TABLES.USER_DEFINED_TYPE_SCHEMA not supported: Not applicable for Snowflake.

-- comment on column INFORMATION_SCHEMA.TABLES.USER_DEFINED_TYPE_NAME not supported: Not applicable for Snowflake.

-- comment on column INFORMATION_SCHEMA.TABLES.IS_INSERTABLE_INTO not supported: Not applicable for Snowflake.

-- comment on column INFORMATION_SCHEMA.TABLES.IS_TYPED not supported: Not applicable for Snowflake.

-- comment on column INFORMATION_SCHEMA.TABLES.COMMIT_ACTION not supported: Not applicable for Snowflake.

-- comment on column INFORMATION_SCHEMA.TABLES.CREATED not supported: Creation time of the function

-- comment on column INFORMATION_SCHEMA.TABLES.LAST_ALTERED not supported: Last altered time of the function

-- comment on column INFORMATION_SCHEMA.TABLES.AUTO_CLUSTERING_ON not supported: Whether automatic clustering is on for the table

-- comment on column INFORMATION_SCHEMA.TABLES.COMMENT not supported: Comment for this table

create view comment
            'Constraints defined on the tables in this database that are accessible to the current user' INFORMATION_SCHEMA.TABLE_CONSTRAINTS as
-- missing source code
;

-- comment on column INFORMATION_SCHEMA.TABLE_CONSTRAINTS.CONSTRAINT_CATALOG not supported: Database that the constraint belongs to

-- comment on column INFORMATION_SCHEMA.TABLE_CONSTRAINTS.CONSTRAINT_SCHEMA not supported: Schema that the constraint belongs to

-- comment on column INFORMATION_SCHEMA.TABLE_CONSTRAINTS.CONSTRAINT_NAME not supported: Name of the constraint

-- comment on column INFORMATION_SCHEMA.TABLE_CONSTRAINTS.TABLE_CATALOG not supported: Name of the database of the current table

-- comment on column INFORMATION_SCHEMA.TABLE_CONSTRAINTS.TABLE_SCHEMA not supported: Name of the schema of the current table

-- comment on column INFORMATION_SCHEMA.TABLE_CONSTRAINTS.TABLE_NAME not supported: Name of the current table

-- comment on column INFORMATION_SCHEMA.TABLE_CONSTRAINTS.CONSTRAINT_TYPE not supported: Type of the constraint

-- comment on column INFORMATION_SCHEMA.TABLE_CONSTRAINTS.IS_DEFERRABLE not supported: Whether evaluation of the constraint can be deferred

-- comment on column INFORMATION_SCHEMA.TABLE_CONSTRAINTS.INITIALLY_DEFERRED not supported: Whether evaluation of the constraint is deferrable and initially deferred

-- comment on column INFORMATION_SCHEMA.TABLE_CONSTRAINTS.ENFORCED not supported: Whether the constraint is enforced

-- comment on column INFORMATION_SCHEMA.TABLE_CONSTRAINTS.COMMENT not supported: Comment for this constraint

-- comment on column INFORMATION_SCHEMA.TABLE_CONSTRAINTS.CREATED not supported: Creation time of the constraint

-- comment on column INFORMATION_SCHEMA.TABLE_CONSTRAINTS.LAST_ALTERED not supported: Last altered time of the constraint

create view comment
            'The privileges on tables defined in this database that are accessible to the current user''s role.' INFORMATION_SCHEMA.TABLE_PRIVILEGES as
-- missing source code
;

-- comment on column INFORMATION_SCHEMA.TABLE_PRIVILEGES.GRANTOR not supported: Role who granted the table privilege

-- comment on column INFORMATION_SCHEMA.TABLE_PRIVILEGES.GRANTEE not supported: Role to whom the table privilege is granted

-- comment on column INFORMATION_SCHEMA.TABLE_PRIVILEGES.TABLE_CATALOG not supported: Database containing the table on which the privilege is granted

-- comment on column INFORMATION_SCHEMA.TABLE_PRIVILEGES.TABLE_SCHEMA not supported: Schema containing the table on which the privilege is granted

-- comment on column INFORMATION_SCHEMA.TABLE_PRIVILEGES.TABLE_NAME not supported: Name of the table on which the privilege is granted

-- comment on column INFORMATION_SCHEMA.TABLE_PRIVILEGES.PRIVILEGE_TYPE not supported: Type of the granted privilege

-- comment on column INFORMATION_SCHEMA.TABLE_PRIVILEGES.IS_GRANTABLE not supported: Whether the privilege was granted WITH GRANT OPTION

-- comment on column INFORMATION_SCHEMA.TABLE_PRIVILEGES.WITH_HIERARCHY not supported: Not applicable for Snowflake.

-- comment on column INFORMATION_SCHEMA.TABLE_PRIVILEGES.CREATED not supported: Creation time of the privilege

create view comment 'All tables within an account, including expired tables.' INFORMATION_SCHEMA.TABLE_STORAGE_METRICS as
-- missing source code
;

-- comment on column INFORMATION_SCHEMA.TABLE_STORAGE_METRICS.TABLE_CATALOG not supported: Database that the table belongs to.  Potentially NULL if table is in failsafe.

-- comment on column INFORMATION_SCHEMA.TABLE_STORAGE_METRICS.TABLE_SCHEMA not supported: Schema that the table belongs to.  Potentially NULL if table is in failsafe.

-- comment on column INFORMATION_SCHEMA.TABLE_STORAGE_METRICS.TABLE_NAME not supported: Name of the table.  Potentially NULL if table is in failsafe.

-- comment on column INFORMATION_SCHEMA.TABLE_STORAGE_METRICS.ID not supported: Unique identifier of the table

-- comment on column INFORMATION_SCHEMA.TABLE_STORAGE_METRICS.CLONE_GROUP_ID not supported: Unique identifier of the oldest clone ancestor of this table.  Same as this table's ID if it is not a clone.

-- comment on column INFORMATION_SCHEMA.TABLE_STORAGE_METRICS.IS_TRANSIENT not supported: 'YES' if table is transient, 'NO' otherwise.  Potentially NULL if table is in failsafe.

-- comment on column INFORMATION_SCHEMA.TABLE_STORAGE_METRICS.ACTIVE_BYTES not supported: Bytes in the active version of the table. Some bytes may be billed to another table if this table is a clone.

-- comment on column INFORMATION_SCHEMA.TABLE_STORAGE_METRICS.TIME_TRAVEL_BYTES not supported: Bytes in time travel versions of the table. Some bytes may be billed to another table if this table is a clone

-- comment on column INFORMATION_SCHEMA.TABLE_STORAGE_METRICS.FAILSAFE_BYTES not supported: Bytes in failsafe versions of the table. All such bytes are billed to this table.

-- comment on column INFORMATION_SCHEMA.TABLE_STORAGE_METRICS.RETAINED_FOR_CLONE_BYTES not supported: Bytes which used to be owned by this table and are no longer referenced by it. Still, they are retained (and billed) because other clone(s) of that table are still referencing these bytes. Note that the original metadata for this table might have been purged so the table, schema, and database names might be NULL in this case.

-- comment on column INFORMATION_SCHEMA.TABLE_STORAGE_METRICS.TABLE_CREATED not supported: Time at which this table was created.  Potentially NULL if table is in failsafe.

-- comment on column INFORMATION_SCHEMA.TABLE_STORAGE_METRICS.TABLE_DROPPED not supported: Time at which the table was dropped, or NULL.  Potentially NULL if table is in failsafe.

-- comment on column INFORMATION_SCHEMA.TABLE_STORAGE_METRICS.TABLE_ENTERED_FAILSAFE not supported: Time at which the table entered the failsafe state, or NULL.  Potentially NULL if table is in failsafe.

-- comment on column INFORMATION_SCHEMA.TABLE_STORAGE_METRICS.CATALOG_CREATED not supported: Time at which the database was created.  Potentially NULL if table is in failsafe.

-- comment on column INFORMATION_SCHEMA.TABLE_STORAGE_METRICS.CATALOG_DROPPED not supported: Time at which the database was dropped.  Potentially NULL if table is past failsafe.

-- comment on column INFORMATION_SCHEMA.TABLE_STORAGE_METRICS.SCHEMA_CREATED not supported: Time at which the schema was created.  Potentially NULL if table is past failsafe.

-- comment on column INFORMATION_SCHEMA.TABLE_STORAGE_METRICS.SCHEMA_DROPPED not supported: Time at which the schema was dropped.  Potentially NULL if table is in failsafe.

-- comment on column INFORMATION_SCHEMA.TABLE_STORAGE_METRICS.COMMENT not supported: Table's comment.  Potentially NULL if table is in failsafe.

create view comment
            'The usage privileges on sequences defined in this database that are accessible to the current user''s role.' INFORMATION_SCHEMA.USAGE_PRIVILEGES as
-- missing source code
;

-- comment on column INFORMATION_SCHEMA.USAGE_PRIVILEGES.GRANTOR not supported: Role who granted the usage privilege

-- comment on column INFORMATION_SCHEMA.USAGE_PRIVILEGES.GRANTEE not supported: Role to whom the usage privilege is granted

-- comment on column INFORMATION_SCHEMA.USAGE_PRIVILEGES.OBJECT_CATALOG not supported: Database containing the object on which the privilege is granted

-- comment on column INFORMATION_SCHEMA.USAGE_PRIVILEGES.OBJECT_SCHEMA not supported: Schema containing the object on which the privilege is granted

-- comment on column INFORMATION_SCHEMA.USAGE_PRIVILEGES.OBJECT_NAME not supported: Name of the object on which the privilege is granted

-- comment on column INFORMATION_SCHEMA.USAGE_PRIVILEGES.OBJECT_TYPE not supported: Type of the object on which the privilege is granted

-- comment on column INFORMATION_SCHEMA.USAGE_PRIVILEGES.PRIVILEGE_TYPE not supported: Type of the granted privilege

-- comment on column INFORMATION_SCHEMA.USAGE_PRIVILEGES.IS_GRANTABLE not supported: Whether the privilege was granted WITH GRANT OPTION

-- comment on column INFORMATION_SCHEMA.USAGE_PRIVILEGES.CREATED not supported: Creation time of the privilege

create view comment
            'The views defined in this database that are accessible to the current user''s role.' INFORMATION_SCHEMA.VIEWS as
-- missing source code
;

-- comment on column INFORMATION_SCHEMA.VIEWS.TABLE_CATALOG not supported: Database that the view belongs to

-- comment on column INFORMATION_SCHEMA.VIEWS.TABLE_SCHEMA not supported: Schema that the view belongs to

-- comment on column INFORMATION_SCHEMA.VIEWS.TABLE_NAME not supported: Name of the view

-- comment on column INFORMATION_SCHEMA.VIEWS.TABLE_OWNER not supported: Name of the role that owns the view

-- comment on column INFORMATION_SCHEMA.VIEWS.VIEW_DEFINITION not supported: Text of the view's query expression

-- comment on column INFORMATION_SCHEMA.VIEWS.CHECK_OPTION not supported: Not applicable for Snowflake.

-- comment on column INFORMATION_SCHEMA.VIEWS.IS_UPDATABLE not supported: Not applicable for Snowflake.

-- comment on column INFORMATION_SCHEMA.VIEWS.INSERTABLE_INTO not supported: Not applicable for Snowflake.

-- comment on column INFORMATION_SCHEMA.VIEWS.IS_SECURE not supported: Whether this view is secure.

-- comment on column INFORMATION_SCHEMA.VIEWS.CREATED not supported: Creation time of the view

-- comment on column INFORMATION_SCHEMA.VIEWS.LAST_ALTERED not supported: Last altered time of the view

-- comment on column INFORMATION_SCHEMA.VIEWS.COMMENT not supported: Comment for this view

create or replace view VW_ACCOUNTS_CLIENTS_SUMMARY(
	MD_START_DT,
	MD_SOURCE,
	MD_CREATION_DT,
	MD_SRC_SYSTEM,
	MD_EXTRACT_DT,
	NB_MANAGED,
	NB_FEE_BASED,
	NB_COMMISSION,
	NB_CLIENT,
	NB_ACCOUNT,
	PROCESS_DATE
) as 
SELECT MD_START_DT,
MD_SOURCE,
MD_CREATION_DT,
MD_SRC_SYSTEM,
MD_EXTRACT_DT,
TO_NUMBER(ft.value:"nbManaged",20,2) AS NB_MANAGED,
TO_NUMBER(ft.value:"nbFeeBased",20,2) AS NB_FEE_BASED,
TO_NUMBER(ft.value:"nbCommission",20,2) AS NB_COMMISSION,
TO_NUMBER(ft.value:"nbClient",20,2) AS NB_CLIENT,
TO_NUMBER(ft.value:"nbAccount",20,2) AS NB_ACCOUNT,
ft.value:"processDate"::DATETIME AS PROCESS_DATE
FROM IAPW_PORTAL_API.ACCOUNTS_CLIENTS_SUMMARY a,
LATERAL FLATTEN(INPUT => a.CONTENT, PATH => '"data"') ft;

create or replace view VW_ACCOUNTS_CLIENTS_SUMMARY_RVP(
	MD_START_DT,
	MD_SOURCE,
	MD_CREATION_DT,
	MD_SRC_SYSTEM,
	MD_EXTRACT_DT,
	RVPID,
	NB_MANAGED,
	NB_FEE_BASED,
	NB_COMMISSION,
	NB_CLIENT,
	NB_ACCOUNT,
	PROCESS_DATE
) as 
SELECT MD_START_DT,
MD_SOURCE,
MD_CREATION_DT,
MD_SRC_SYSTEM,
MD_EXTRACT_DT,
RVPID,
TO_NUMBER(ft.value:"nbManaged",20,2) AS NB_MANAGED,
TO_NUMBER(ft.value:"nbFeeBased",20,2) AS NB_FEE_BASED,
TO_NUMBER(ft.value:"nbCommission",20,2) AS NB_COMMISSION,
TO_NUMBER(ft.value:"nbClient",20,2) AS NB_CLIENT,
TO_NUMBER(ft.value:"nbAccount",20,2) AS NB_ACCOUNT,
ft.value:"processDate"::DATETIME AS PROCESS_DATE
FROM IAPW_PORTAL_API.ACCOUNTS_CLIENTS_SUMMARY_RVP a,
LATERAL FLATTEN(INPUT => a.CONTENT, PATH => '"data"') ft;

create or replace view VW_ASSETS_SUMMARY_BYACCOUNTTYPE(
	MD_START_DT,
	MD_SOURCE,
	MD_CREATION_DT,
	MD_SRC_SYSTEM,
	MD_EXTRACT_DT,
	VALUE,
	ACCOUNT_TYPE
) as 
SELECT MD_START_DT,
MD_SOURCE,
MD_CREATION_DT,
MD_SRC_SYSTEM,
MD_EXTRACT_DT,
TO_NUMBER(ft.value:"value"::STRING ,20, 2) AS VALUE,
ft.value:"accountType"::STRING AS ACCOUNT_TYPE
FROM IAPW_PORTAL_API.ASSETS_SUMMARY_BYACCOUNTTYPE a,
LATERAL FLATTEN(INPUT => a.CONTENT, PATH => '"data"') ft;

create or replace view VW_ASSETS_SUMMARY_BYACCOUNTTYPE_RVP(
	MD_START_DT,
	MD_SOURCE,
	MD_CREATION_DT,
	MD_SRC_SYSTEM,
	MD_EXTRACT_DT,
	RVPID,
	VALUE,
	ACCOUNT_TYPE
) as 
SELECT MD_START_DT,
MD_SOURCE,
MD_CREATION_DT,
MD_SRC_SYSTEM,
MD_EXTRACT_DT,
RVPID,
TO_NUMBER(ft.value:"value"::STRING ,20, 2) AS VALUE,
ft.value:"accountType"::STRING AS ACCOUNT_TYPE
FROM IAPW_PORTAL_API.ASSETS_SUMMARY_BYACCOUNTTYPE_RVP a,
LATERAL FLATTEN(INPUT => a.CONTENT, PATH => '"data"') ft;

create or replace view VW_ASSETS_SUMMARY_BYCOMMISSIONTYPE(
	MD_START_DT,
	MD_SOURCE,
	MD_CREATION_DT,
	MD_SRC_SYSTEM,
	MD_EXTRACT_DT,
	PROCESS_DATE,
	VALUE,
	COMMISSION_TYPE
) as 
SELECT MD_START_DT,
MD_SOURCE,
MD_CREATION_DT,
MD_SRC_SYSTEM,
MD_EXTRACT_DT,
ft.value:"processDate"::DATETIME AS PROCESS_DATE,
ft.value:"value"::STRING AS VALUE,
ft.value:"commissionType"::STRING AS COMMISSION_TYPE
FROM IAPW_PORTAL_API.ASSETS_SUMMARY_BYCOMMISSIONTYPE a,
LATERAL FLATTEN(INPUT => a.CONTENT, PATH => '"data"') ft;

create or replace view VW_ASSETS_SUMMARY_BYCOMMISSIONTYPE_AND_PRODUCT(
	MD_START_DT,
	MD_SOURCE,
	MD_CREATION_DT,
	MD_SRC_SYSTEM,
	MD_EXTRACT_DT,
	PROCESS_DATE,
	COMMISSION_TYPE,
	EQT,
	MUT,
	FIX,
	OFF,
	CASH,
	TOTAL
) as 
SELECT MD_START_DT,
MD_SOURCE,
MD_CREATION_DT,
MD_SRC_SYSTEM,
MD_EXTRACT_DT,
ft.value:"processDate"::DATETIME AS PROCESS_DATE,
ft.value:"commissionType"::STRING AS COMMISSION_TYPE,
ft.value:"eqt"::STRING AS EQT,
ft.value:"mut"::STRING AS MUT,
ft.value:"fix"::STRING AS FIX,
ft.value:"off"::STRING AS OFF,
ft.value:"cash"::STRING AS CASH,
ft.value:"total"::STRING AS TOTAL
FROM IAPW_PORTAL_API.ASSETS_SUMMARY_BYCOMMISSIONTYPE_AND_PRODUCT a,
LATERAL FLATTEN(INPUT => a.CONTENT, PATH => '"data"') ft;

create or replace view VW_ASSETS_SUMMARY_BYCOMMISSIONTYPE_AND_PRODUCT_RVP(
	MD_START_DT,
	MD_SOURCE,
	MD_CREATION_DT,
	MD_SRC_SYSTEM,
	MD_EXTRACT_DT,
	RVPID,
	PROCESS_DATE,
	COMMISSION_TYPE,
	EQT,
	MUT,
	FIX,
	OFF,
	CASH,
	TOTAL
) as 
SELECT MD_START_DT,
MD_SOURCE,
MD_CREATION_DT,
MD_SRC_SYSTEM,
MD_EXTRACT_DT,
RVPID,
ft.value:"processDate"::DATETIME AS PROCESS_DATE,
ft.value:"commissionType"::STRING AS COMMISSION_TYPE,
ft.value:"eqt"::STRING AS EQT,
ft.value:"mut"::STRING AS MUT,
ft.value:"fix"::STRING AS FIX,
ft.value:"off"::STRING AS OFF,
ft.value:"cash"::STRING AS CASH,
ft.value:"total"::STRING AS TOTAL
FROM IAPW_PORTAL_API.ASSETS_SUMMARY_BYCOMMISSIONTYPE_AND_PRODUCT_RVP a,
LATERAL FLATTEN(INPUT => a.CONTENT, PATH => '"data"') ft;

create or replace view VW_ASSETS_SUMMARY_BYCOMMISSIONTYPE_RVP(
	MD_START_DT,
	MD_SOURCE,
	MD_CREATION_DT,
	MD_SRC_SYSTEM,
	MD_EXTRACT_DT,
	RVPID,
	PROCESS_DATE,
	VALUE,
	COMMISSION_TYPE
) as 
SELECT MD_START_DT,
MD_SOURCE,
MD_CREATION_DT,
MD_SRC_SYSTEM,
MD_EXTRACT_DT,
RVPID,
ft.value:"processDate"::DATETIME AS PROCESS_DATE,
ft.value:"value"::STRING AS VALUE,
ft.value:"commissionType"::STRING AS COMMISSION_TYPE
FROM IAPW_PORTAL_API.ASSETS_SUMMARY_BYCOMMISSIONTYPE_RVP a,
LATERAL FLATTEN(INPUT => a.CONTENT, PATH => '"data"') ft;

create or replace view VW_ASSETS_SUMMARY_BYPRODUCT(
	MD_START_DT,
	MD_SOURCE,
	MD_CREATION_DT,
	MD_SRC_SYSTEM,
	MD_EXTRACT_DT,
	PROCESS_DATE,
	VALUE,
	PRODUCT_CODE
) as 
SELECT MD_START_DT,
MD_SOURCE,
MD_CREATION_DT,
MD_SRC_SYSTEM,
MD_EXTRACT_DT,
ft.value:"processDate"::DATETIME AS PROCESS_DATE,
ft.value:"value"::STRING AS VALUE,
ft.value:"productCode"::STRING AS PRODUCT_CODE
FROM IAPW_PORTAL_API.ASSETS_SUMMARY_BYPRODUCT a,
LATERAL FLATTEN(INPUT => a.CONTENT, PATH => '"data"') ft;

create or replace view VW_ASSETS_SUMMARY_BYPRODUCT_RVP(
	MD_START_DT,
	MD_SOURCE,
	MD_CREATION_DT,
	MD_SRC_SYSTEM,
	MD_EXTRACT_DT,
	RVPID,
	PROCESS_DATE,
	VALUE,
	PRODUCT_CODE
) as 
SELECT MD_START_DT,
MD_SOURCE,
MD_CREATION_DT,
MD_SRC_SYSTEM,
MD_EXTRACT_DT,
RVPID,
ft.value:"processDate"::DATETIME AS PROCESS_DATE,
ft.value:"value"::STRING AS VALUE,
ft.value:"productCode"::STRING AS PRODUCT_CODE
FROM IAPW_PORTAL_API.ASSETS_SUMMARY_BYPRODUCT_RVP a,
LATERAL FLATTEN(INPUT => a.CONTENT, PATH => '"data"') ft;

create or replace view VW_ASSETS_SUMMARY_BYPROVINCE(
	MD_START_DT,
	MD_SOURCE,
	MD_CREATION_DT,
	MD_SRC_SYSTEM,
	MD_EXTRACT_DT,
	PROCESS_DATE,
	VALUE,
	PROVINCE_CODE
) as 
SELECT MD_START_DT,
MD_SOURCE,
MD_CREATION_DT,
MD_SRC_SYSTEM,
MD_EXTRACT_DT,
ft.value:"processDate"::DATETIME AS PROCESS_DATE,
TO_NUMBER(ft.value:"value"::STRING ,20, 2) AS VALUE,
ft.value:"provinceCode"::STRING AS PROVINCE_CODE
FROM IAPW_PORTAL_API.ASSETS_SUMMARY_BYPROVINCE a,
LATERAL FLATTEN(INPUT => a.CONTENT, PATH => '"data"') ft;

create or replace view VW_ASSETS_SUMMARY_BYPROVINCE_RVP(
	MD_START_DT,
	MD_SOURCE,
	MD_CREATION_DT,
	MD_SRC_SYSTEM,
	MD_EXTRACT_DT,
	RVPID,
	PROCESS_DATE,
	VALUE,
	PROVINCE_CODE
) as 
SELECT MD_START_DT,
MD_SOURCE,
MD_CREATION_DT,
MD_SRC_SYSTEM,
MD_EXTRACT_DT,
RVPID,
ft.value:"processDate"::DATETIME AS PROCESS_DATE,
TO_NUMBER(ft.value:"value"::STRING ,20, 2) AS VALUE,
ft.value:"provinceCode"::STRING AS PROVINCE_CODE
FROM IAPW_PORTAL_API.ASSETS_SUMMARY_BYPROVINCE_RVP a,
LATERAL FLATTEN(INPUT => a.CONTENT, PATH => '"data"') ft;

create or replace view VW_CONTRACT(
	HK_LINK,
	MD_HASHDIFF,
	HK_HUB_CONTRACT,
	HK_HUB_PARTY_ROLE_ACCOUNT_HOLDER,
	HK_HUB_REGISTERED_REPRESENTATIVE,
	CONTRACT_ID,
	CLIENT_ID,
	RR_CD,
	UNIVERIS_PLAN_ID,
	MD_START_DT,
	MD_SOURCE,
	MD_SRC_SYSTEM,
	MD_EXTRACT_DT
) as
SELECT 
SHA1(UPPER(CONCAT(COALESCE(TRIM(MD_SRC_SYSTEM), '#NULL#')
, '|' , '#NULL#'
, '|' , COALESCE(TRIM(IVR_SYSID), '#NULL#')
, '|' , COALESCE(TRIM(REP_CD), '#NULL#')
, '|' , COALESCE(TRIM(PLN_SYSID), '#NULL#')  ))) AS HK_LINK,
'0' AS MD_HASHDIFF,
DECODE(TRUE, PLN_SYSID IS NULL AND IVR_SYSID IS NULL ,'0',SHA1(UPPER(CONCAT(COALESCE(TRIM(MD_SRC_SYSTEM), '#NULL#'), '|' , '#NULL#' , '|' , COALESCE(TRIM(TO_VARCHAR(PLN_SYSID)), '#NULL#'), '|' ,COALESCE(TRIM(TO_VARCHAR(IVR_SYSID)), '#NULL#') )))) AS HK_HUB_CONTRACT,
DECODE(TRUE, IVR_SYSID IS NULL ,'0',SHA1(UPPER(CONCAT(COALESCE(TRIM(MD_SRC_SYSTEM), '#NULL#'), '|' , COALESCE(TRIM(IVR_SYSID), '#NULL#'))))) AS HK_HUB_PARTY_ROLE_ACCOUNT_HOLDER,
DECODE(TRUE, REP_CD IS NULL ,'0',SHA1(UPPER(CONCAT('IAS', '|' , COALESCE(TRIM(REP_CD), '#NULL#'))))) AS HK_HUB_REGISTERED_REPRESENTATIVE,
NULL AS CONTRACT_ID,
TRIM(IVR_SYSID) AS CLIENT_ID,
TRIM(REP_CD) AS RR_CD,
TRIM(PLN_SYSID) AS UNIVERIS_PLAN_ID,
MD_START_DT,
MD_SOURCE,
MD_SRC_SYSTEM,
MD_EXTRACT_DT
FROM IAS_UNIVERIS.CONTRACT;

create or replace view VW_CONTRACT(
	HK_LINK,
	MD_HASHDIFF,
	HK_HUB_CONTRACT,
	HK_HUB_PARTY_ROLE_ACCOUNT_HOLDER,
	HK_HUB_REGISTERED_REPRESENTATIVE,
	CONTRACT_ID,
	CLIENT_ID,
	RR_CD,
	MD_START_DT,
	MD_SOURCE,
	MD_SRC_SYSTEM,
	MD_EXTRACT_DT
) as
SELECT 
SHA1(UPPER(CONCAT(COALESCE(TRIM(MD_SRC_SYSTEM), '#NULL#')
, '|' , COALESCE(TRIM(A_C_ID), '#NULL#')
, '|' , COALESCE(TRIM(A_C_CLIENT), '#NULL#')
, '|' , COALESCE(TRIM(A_C_REPRESENTATIVE), '#NULL#')
, '|' , '#NULL#'  ))) AS HK_LINK,
'0' AS MD_HASHDIFF,
--SHA1(CONCAT (COALESCE(MD_SRC_SYSTEM,'#NULL#'),'|',COALESCE(A_C_ID,'#NULL#'))) AS HK_HUB_CONTRACT,
DECODE(TRUE, A_C_ID IS NULL ,'0',SHA1(UPPER(CONCAT(COALESCE(TRIM(MD_SRC_SYSTEM), '#NULL#'), '|' , COALESCE(TRIM(A_C_ID), '#NULL#') , '|' ,'#NULL#' , '|' ,'#NULL#')))) AS HK_HUB_CONTRACT,
--SHA1(CONCAT(COALESCE(MD_SRC_SYSTEM, '#NULL#'), '|' , COALESCE(A_C_CLIENT, '#NULL#'))) AS HK_HUB_PARTY_ROLE_ACCOUNT_HOLDER,
DECODE(TRUE, A_C_CLIENT IS NULL ,'0',SHA1(UPPER(CONCAT(COALESCE(TRIM(MD_SRC_SYSTEM), '#NULL#'), '|' , COALESCE(TRIM(A_C_CLIENT), '#NULL#'))))) AS HK_HUB_PARTY_ROLE_ACCOUNT_HOLDER,
--SHA1(CONCAT (COALESCE(MD_SRC_SYSTEM,'#NULL#'),'|', COALESCE(A_C_REPRESENTATIVE,'#NULL#'))) AS HK_HUB_REGISTERED_REPRESENTATIVE,
DECODE(TRUE, A_C_REPRESENTATIVE IS NULL ,'0',SHA1(UPPER(CONCAT(COALESCE(TRIM(MD_SRC_SYSTEM), '#NULL#'), '|' , COALESCE(TRIM(A_C_REPRESENTATIVE), '#NULL#'))))) AS HK_HUB_REGISTERED_REPRESENTATIVE,
TRIM(A_C_ID) AS CONTRACT_ID,
TRIM(A_C_CLIENT) AS CLIENT_ID,
TRIM(A_C_REPRESENTATIVE) AS RR_CD,
MD_START_DT,
MD_SOURCE,
MD_SRC_SYSTEM,
MD_EXTRACT_DT
FROM IAS.CONTRACT;

create or replace view VW_CONTRACT(
	HK_LINK,
	MD_HASHDIFF,
	HK_HUB_CONTRACT,
	HK_HUB_PARTY_ROLE_ACCOUNT_HOLDER,
	HK_HUB_REGISTERED_REPRESENTATIVE,
	CONTRACT_ID,
	CLIENT_ID,
	RR_CD,
	UNIVERIS_PLAN_ID,
	MD_START_DT,
	MD_SOURCE,
	MD_SRC_SYSTEM,
	MD_EXTRACT_DT
) as
SELECT 
SHA1(UPPER(CONCAT(COALESCE(TRIM(MD_SRC_SYSTEM), '#NULL#')
, '|' , '#NULL#'
, '|' , COALESCE(TRIM(IVR_SYSID), '#NULL#')
, '|' , COALESCE(TRIM(REP_CD), '#NULL#')
, '|' , COALESCE(TRIM(PLN_SYSID), '#NULL#')  ))) AS HK_LINK,
'0' AS MD_HASHDIFF,
DECODE(TRUE, PLN_SYSID IS NULL AND IVR_SYSID IS NULL ,'0',SHA1(UPPER(CONCAT(COALESCE(TRIM(MD_SRC_SYSTEM), '#NULL#'), '|' , '#NULL#' , '|' , COALESCE(TRIM(TO_VARCHAR(PLN_SYSID)), '#NULL#'), '|' ,COALESCE(TRIM(TO_VARCHAR(IVR_SYSID)), '#NULL#') )))) AS HK_HUB_CONTRACT,
DECODE(TRUE, IVR_SYSID IS NULL ,'0',SHA1(UPPER(CONCAT(COALESCE(TRIM(MD_SRC_SYSTEM), '#NULL#'), '|' , COALESCE(TRIM(IVR_SYSID), '#NULL#'))))) AS HK_HUB_PARTY_ROLE_ACCOUNT_HOLDER,
DECODE(TRUE, REP_CD IS NULL ,'0',SHA1(UPPER(CONCAT('INVESTIA', '|' , COALESCE(TRIM(REP_CD), '#NULL#'))))) AS HK_HUB_REGISTERED_REPRESENTATIVE,
NULL AS CONTRACT_ID,
TRIM(IVR_SYSID) AS CLIENT_ID,
TRIM(REP_CD) AS RR_CD,
TRIM(PLN_SYSID) AS UNIVERIS_PLAN_ID,
MD_START_DT,
MD_SOURCE,
MD_SRC_SYSTEM,
MD_EXTRACT_DT
FROM DB_IAW_DEV_STG.INVESTIA_UNIVERIS.CONTRACT;

create or replace view VW_ELT_SOURCES(
	TRANSF_NAME,
	SRC_ENTITY_FULLNAME,
	SRC_LABEL,
	MD_START_VERSION,
	MD_START_DATE,
	MD_HASH_NAT_KEYS,
	MD_HASHDIFF_TYPE2,
	MD_CREATION_DT,
	MD_CREATION_AUDIT_ID,
	MD_USER_ID,
	MD_OWNER,
	SRC_BRIEF_DESCRIPTION
) as

SELECT 	tr.content:"name"::string AS transf_name,

src.value:"fullname"::STRING AS src_entity_fullname,
src.value:"label"::STRING AS src_label,

tr.content:"version"."version name"::string AS md_start_version,
tr.content:"version"."build date"::string AS md_start_date,
SHA1(UPPER(CONCAT(	COALESCE(TRIM(transf_name), '#NULL#')
					, '|' , COALESCE(TRIM(src_entity_fullname), '#NULL#')
					, '|' , COALESCE(TRIM(src_label), '#NULL#')
					))) AS md_hash_nat_keys,
SHA1(UPPER(CONCAT(	'GENELT'
					, '|' , COALESCE(TRIM(''), '#NULL#')
					))) AS md_hashdiff_type2,
CURRENT_TIMESTAMP() AS md_creation_dt,
'@AUDIT_ID@' AS md_creation_audit_id,
CURRENT_USER() AS md_user_id,
'GENELT' AS md_owner,
'' AS src_brief_description
FROM DB_IAW_DEV_USECASE_STAGING.TOOLS_GENELT.TRANSFORMATIONS AS tr,
LATERAL FLATTEN (INPUT => tr.CONTENT, PATH => '"sources"') src;

create or replace view VW_HUB_REGISTERED_REPRESENTAVIVE(
	HK_HUB,
	REPID,
	MD_SRC_SYSTEM,
	MD_SOURCE,
	MD_EXTRACT_DT
) as(
	SELECT  DISTINCT a.HK_HUB ,a.REPID ,a.MD_SRC_SYSTEM,a.MD_SOURCE ,a.MD_EXTRACT_DT 
FROM IAS_COMMISSION.REGISTERED_REPRESENTATIVE a );

create or replace view VW_ORGANIC_GROWTH_EXCEPTIONS_IAPW(
	HK_HUB,
	MD_START_DT,
	MD_SOURCE,
	SOURCE_MASTER_CODE,
	DESTINATION_MASTER_CODE,
	START_DATE,
	END_DATE,
	SHARE_PCT,
	MD_ACTIVE
) as
SELECT
	*
FROM
	(
	SELECT
		h.HK_HUB,
		s.MD_START_DT,
		s.MD_SOURCE,
		h.SOURCE_MASTER_CODE,
		h.DESTINATION_MASTER_CODE,
		h.START_DATE,
		s.END_DATE,
		s.SHARE_PCT,
		s.MD_ACTIVE
	FROM
		DB_IAW_DEV_DWH.STEWARDSHIP_RDV.REF_ORGANIC_GROWTH_EXCEPTIONS h
	INNER JOIN DB_IAW_DEV_DWH.STEWARDSHIP_RDV.SAT_REF_ORGANIC_GROWTH_EXCEPTIONS_IAPW s 
ON
		s.HK_HUB = h.HK_HUB
	WHERE
		s.MD_SRC_SYSTEM = 'STEWARDSHIP'
QUALIFY ROW_NUMBER() OVER (PARTITION BY s.HK_HUB
	ORDER BY
		s.MD_START_DT DESC ) = 1
)
WHERE
	MD_ACTIVE = 'A'
ORDER BY SOURCE_MASTER_CODE;

create or replace view VW_ORGANIC_GROWTH_EXCLUSIONS_IAPW(
	HK_HUB,
	OG_MD_START_DT,
	OG_MD_SOURCE,
	SOURCE_MASTER_CODE,
	DESTINATION_MASTER_CODE,
	START_DATE,
	END_DATE,
	SHARE_PCT,
	MD_ACTIVE
) as
SELECT a.HK_HUB,a.MD_START_DT as og_MD_START_DT,a.MD_SOURCE as og_MD_SOURCE,a.SOURCE_MASTER_CODE,a.DESTINATION_MASTER_CODE,a.START_DATE,a.END_DATE,a.SHARE_PCT,a.MD_ACTIVE
FROM DB_IAW_DEV_DWH.STEWARDSHIP_RDV.VW_ORGANIC_GROWTH_EXCEPTIONS_IAPW A FULL OUTER JOIN 
DB_IAW_DEV_DWH.SHARED_BDV.VW_IAS_RRCODE_MASTERCODE_TRANS b 
ON A.SOURCE_MASTER_CODE =b.A_C_REPRESENTATIVE AND A.DESTINATION_MASTER_CODE =b.TOREPID 
WHERE b.A_C_REPRESENTATIVE IS NULL AND b.TOREPID IS NULL AND a.MD_START_DT BETWEEN a.START_DATE AND a.END_DATE;




CREATE OR REPLACE VIEW DB_IAW_DEV_STG.IAS_CERTS.VW_REGISTERED_REPRESENTATIVE as
select distinct
basic.value:fnm::string as "First Name",
basic.value:lnm::string as "Last Name",
basic.value:nam::string as "Full Name",
basic.value:rvp::string as "Region VP",
basic.value:brc::string as "Branch Code",
basic.value:brn::string as "Branch Name",
basic.value:dob::string as "Date of Birth",
basic.value:act::string as "Status",
basic.value:prv::string as "Province",
RR.value::string as "RR code",
trd.value::string as "Trade Name"

  from
  "DB_IAW_DEV_STAGING"."IAS_CERTS"."REGISTERED_REPRESENTATIVE_RECEPTION"
    --"DB_IAW_DEV_STAGING"."IAS"."CERTS_REGISTERED_REPRESENTATIVE_JSON"
    , lateral flatten(input => JSON_CONTENT) ad
    , lateral flatten(input => ad.value:bas) basic
    , lateral flatten(input => ad.value:rep, OUTER => TRUE) RR
    , lateral flatten(input => ad.value:trd, OUTER => TRUE) trd
;

create or replace view VW_REGISTERED_REPRESENTATIVE_SPLIT(
	MD_START_DT,
	MD_EXTRACT_DT,
	MD_SOURCE,
	CID,
	FIRST_NAME,
	LAST_NAME,
	FULL_NAME,
	PRIMARY_ROLE,
	RVP,
	BRANCH_NRD,
	BRANCH_NAME,
	PROVINCE,
	IS_ACTIVE,
	REP_CODE,
	TRADE_NAME,
	PORTAL_IDS,
	BEGIN_DT,
	END_DT,
	ADVISOR_BIRTH_DATE,
	REP_EMAIL,
	CBM,
	BRANCH_ADDRESS1,
	BRANCH_ADDRESS2,
	BRANCH_CITY,
	BRANCH_POSTAL_CODE
) as 
SELECT 
MD_START_DT,
MD_EXTRACT_DT,
MD_SOURCE,
CID, 
FIRST_NAME, 
LAST_NAME, 
FULL_NAME, 
PRIMARY_ROLE, 
RVP, 
BRANCH_NRD, 
BRANCH_NAME, 
PROVINCE, 
IS_ACTIVE, 
TRIM(c.value::STRING) AS rep_code,
TRADE_NAME, 
PORTAL_IDS, 
BEGIN_DT, 
END_DT,
ADVISOR_BIRTH_DATE,
REP_EMAIL,	 
CBM,	 
BRANCH_ADDRESS1,
BRANCH_ADDRESS2,
BRANCH_CITY,
BRANCH_POSTAL_CODE
FROM IAS_CERTS.REGISTERED_REPRESENTATIVE_RECEPTION,
lateral flatten(input=>split(REP_CODE, ','),OUTER => TRUE) c;

create or replace view VW_SHARE_AFTER_MERGE(
	MD_START_DT,
	MD_CREATION_DT,
	MD_SOURCE,
	MD_EXTRACT_DT,
	MD_SRC_SYSTEM,
	REP_CD_ORIGINAL,
	MASTER_CD,
	REP_SYSID,
	BEN_SYSID,
	COMM_RATE,
	BRN_SYSID,
	BRN_CD,
	HK_LINK,
	HK_HUB_FROM,
	HK_HUB_TO,
	MD_HASHDIFF
) as
SELECT 
	MD_START_DT, 
	MD_CREATION_DT, 
	MD_SOURCE, 
	MD_EXTRACT_DT, 
	'INVESTIA-UNIVERIS' AS MD_SRC_SYSTEM, 
	CASE 
		WHEN LEN(REP_CD_ORIGINAL) IN (3,4) THEN  CONCAT(REP_CD_ORIGINAL,'F')  
		WHEN REP_CD_ORIGINAL = '10000' THEN '1000Z'
		WHEN REP_CD_ORIGINAL = '10001' THEN 'Z1000'
		WHEN REP_CD_ORIGINAL = '85050' THEN 'Z8505'
		WHEN REP_CD_ORIGINAL = '99999' THEN '99999'
		WHEN REP_CD_ORIGINAL = 'BM004' THEN 'ZBM04'
		WHEN REP_CD_ORIGINAL = 'LA002' THEN 'LA02F'
	ELSE REP_CD_ORIGINAL END AS REP_CD_ORIGINAL , 
	CASE 
		WHEN LEN(MASTER_CD) IN (3,4) THEN  CONCAT(MASTER_CD,'F')  
		WHEN MASTER_CD = '10000' THEN '1000Z'
		WHEN MASTER_CD = '10001' THEN 'Z1000'
		WHEN MASTER_CD = '85050' THEN 'Z8505'
		WHEN MASTER_CD = '99999' THEN '99999'
		WHEN MASTER_CD = 'BM004' THEN 'ZBM04'
		WHEN MASTER_CD = 'LA002' THEN 'LA02F'
	ELSE MASTER_CD END AS MASTER_CD , 
	REP_SYSID + 450000000 AS REP_SYSID, 
	BEN_SYSID + 450000000 AS BEN_SYSID, 
	COMM_RATE, 
	BRN_SYSID, 
	BRN_CD,
	SHA1(UPPER(CONCAT('INVESTIA' ,'|', COALESCE(TRIM(REP_CD_ORIGINAL), '#NULL#'), '|', COALESCE(TRIM(MASTER_CD), '#NULL#'),'|', '#NULL#','|', '#NULL#','|', '#NULL#' ))) AS HK_LINK, 
	DECODE(TRUE, REP_CD_ORIGINAL IS NULL ,'0',SHA1(UPPER(CONCAT(COALESCE(TRIM('INVESTIA'), '#NULL#'), '|' , COALESCE(TRIM(REP_CD_ORIGINAL), '#NULL#'))))) AS HK_HUB_FROM, 
	DECODE(TRUE, MASTER_CD IS NULL ,'0',SHA1(UPPER(CONCAT(COALESCE(TRIM('INVESTIA'), '#NULL#'), '|' , COALESCE(TRIM(MASTER_CD), '#NULL#'))))) AS HK_HUB_TO, 
	SHA1(concat( COALESCE(TO_VARCHAR(REP_SYSID), '#NULL#'),'|',
	                 COALESCE(TO_VARCHAR(BEN_SYSID), '#NULL#'),'|',
	                 COALESCE(TO_VARCHAR(COMM_RATE), '#NULL#'),'|',
				     COALESCE(TO_VARCHAR(BRN_SYSID), '#NULL#'),'|',
				     COALESCE(BRN_CD, '#NULL#')
				     )) AS MD_HASHDIFF
FROM INVESTIA_UNIVERIS.X_DBB_MASTER_REP_FUNDEX
UNION ALL
SELECT 
	MD_START_DT, 
	MD_CREATION_DT, 
	MD_SOURCE, 
	MD_EXTRACT_DT, 
	'INVESTIA-UNIVERIS' AS MD_SRC_SYSTEM, 
	REP_CD_ORIGINAL , 
	MASTER_CD , 
	REP_SYSID, 
	BEN_SYSID, 
	COMM_RATE, 
	BRN_SYSID, 
	BRN_CD,
	SHA1(UPPER(CONCAT('INVESTIA' ,'|', COALESCE(TRIM(REP_CD_ORIGINAL), '#NULL#'), '|', COALESCE(TRIM(MASTER_CD), '#NULL#'),'|', '#NULL#','|', '#NULL#','|', '#NULL#' ))) AS HK_LINK, 
	DECODE(TRUE, REP_CD_ORIGINAL IS NULL ,'0',SHA1(UPPER(CONCAT(COALESCE(TRIM('INVESTIA'), '#NULL#'), '|' , COALESCE(TRIM(REP_CD_ORIGINAL), '#NULL#'))))) AS HK_HUB_FROM, 
	DECODE(TRUE, MASTER_CD IS NULL ,'0',SHA1(UPPER(CONCAT(COALESCE(TRIM('INVESTIA'), '#NULL#'), '|' , COALESCE(TRIM(MASTER_CD), '#NULL#'))))) AS HK_HUB_TO, 
	SHA1(concat( COALESCE(TO_VARCHAR(REP_SYSID), '#NULL#'),'|',
	                 COALESCE(TO_VARCHAR(BEN_SYSID), '#NULL#'),'|',
	                 COALESCE(TO_VARCHAR(COMM_RATE), '#NULL#'),'|',
				     COALESCE(TO_VARCHAR(BRN_SYSID), '#NULL#'),'|',
				     COALESCE(BRN_CD, '#NULL#')
				     )) AS MD_HASHDIFF
FROM INVESTIA_UNIVERIS.X_DBB_MASTER_REP;

create or replace view VW_SHARE_AUD(
	HK_LINK,
	HK_HUB_FROM,
	HK_HUB_TO,
	MD_HASHDIFF,
	MD_CREATION_DT,
	MD_SOURCE,
	MD_SRCSYSTEM,
	MD_START_DT,
	MD_EXTRACT_DT,
	FROMREPID,
	TOREPID,
	SHARETYPE,
	SOURCECODE,
	PRODUCTCOD,
	REVENUEPCT,
	COMMISSIONPCT,
	NETCOMMISSIONPCT,
	FEEPCT,
	REVNO,
	STAMP,
	START_DT,
	END_DT
) as
WITH CLN_SHAREHIST AS
(SELECT DISTINCT 
	MD5(NVL(FROMREPID,'')||NVL(TOREPID,'')||NVL(SHARETYPE,'')||NVL(SOURCECODE,'')||NVL(PRODUCTCOD,'')) AS ID,
	FROMREPID,
	TOREPID,
	SHARETYPE,
	SOURCECODE,
	PRODUCTCOD,
	REVENUEPCT,
	COMMISSIONPCT,
	NETCOMMISSIONPCT,
	FEEPCT,
	REVNO,
	STAMP,
	HISTSTAMP ,
	MD_EXTRACT_DT AS MD_LOADDATE ,
	MD_SRC_SYSTEM 
FROM
	IAS_COMMISSION.SHAREHIST
	QUALIFY ROW_NUMBER() OVER (PARTITION BY ID, HISTSTAMP ORDER BY revno DESC ) = 1 ),	
AUD AS (	
SELECT 
	ID,
	FROMREPID,
	TOREPID,
	SHARETYPE,
	SOURCECODE,
	PRODUCTCOD,
	REVENUEPCT,
	COMMISSIONPCT,
	NETCOMMISSIONPCT,
	FEEPCT,
	REVNO,
	STAMP,
	MD_LOADDATE ,
	MD_SRCSYSTEM , 
	NVL(LAG(HISTSTAMP) OVER ( PARTITION BY SRC,ID ORDER BY HISTSTAMP),  NVL(STAMP, '2000-01-01')) AS START_DT ,
	HISTSTAMP AS END_DT
FROM
(
SELECT
	'SHARE' AS SRC,
	MD5(NVL(FROMREPID,'')||NVL(TOREPID,'')||NVL(SHARETYPE,'')||NVL(SOURCECODE,'')||NVL(PRODUCTCODE,'')) AS ID,
	FROMREPID,
	TOREPID,
	SHARETYPE,
	SOURCECODE,
	PRODUCTCODE AS PRODUCTCOD,
	REVENUEPCT,
	COMMISSIONPCT,
	NETCOMMISSIONPCT,
	FEEPCT,
	REVNO,
	STAMP ,
	MD_EXTRACT_DT AS MD_LOADDATE ,
	MD_SRCSYSTEM ,
	TO_TIMESTAMP('9999-12-31') AS  HISTSTAMP
FROM
	IAS_COMMISSION."SHARE"
UNION ALL
SELECT
	'SHARE_HIST' AS SRC,
	MD5(NVL(FROMREPID,'')||NVL(TOREPID,'')||NVL(SHARETYPE,'')||NVL(SOURCECODE,'')||NVL(PRODUCTCOD,'')) AS ID,
	FROMREPID,
	TOREPID,
	SHARETYPE,
	SOURCECODE,
	PRODUCTCOD,
	REVENUEPCT,
	COMMISSIONPCT,
	NETCOMMISSIONPCT,
	FEEPCT,
	REVNO,
	STAMP,
	MD_LOADDATE ,
	MD_SRC_SYSTEM ,
	HISTSTAMP
FROM
	CLN_SHAREHIST
)
ORDER BY ID, START_DT DESC  
) 
SELECT   
SHA1(UPPER(CONCAT('IAS' ,'|', COALESCE(TRIM(FROMREPID), '#NULL#'), '|', COALESCE(TRIM(TOREPID),'#NULL#'),'|', COALESCE(TRIM(SHARETYPE),'#NULL#'),'|', 
     COALESCE(TRIM(SOURCECODE),'#NULL#'),'|', COALESCE(TRIM(PRODUCTCOD),'#NULL#') ))) AS HK_LINK,
DECODE(TRUE, FROMREPID IS NULL ,'0',SHA1(UPPER(CONCAT(COALESCE(TRIM('IAS'), '#NULL#'), '|' , COALESCE(TRIM(FROMREPID), '#NULL#'))))) AS HK_HUB_FROM ,
DECODE(TRUE, TOREPID IS NULL ,'0',SHA1(UPPER(CONCAT(COALESCE(TRIM('IAS'), '#NULL#'), '|' , COALESCE(TRIM(TOREPID), '#NULL#'))))) AS 	HK_HUB_TO ,
SHA1(CONCAT( COALESCE(TO_VARCHAR(REVENUEPCT), '#NULL#'),'|',
		COALESCE(TO_VARCHAR(COMMISSIONPCT), '#NULL#'),'|',
		COALESCE(TO_VARCHAR(NETCOMMISSIONPCT), '#NULL#'),'|',
      	COALESCE(TO_VARCHAR(FEEPCT), '#NULL#'),'|',
      	COALESCE(TO_VARCHAR(REVNO), '#NULL#'),'|',
      	COALESCE(TO_VARCHAR(STAMP), '#NULL#'),'|',
      	COALESCE(TO_VARCHAR(START_DT), '#NULL#'),'|',
      	COALESCE(TO_VARCHAR(END_DT), '#NULL#') 
      )) AS MD_HASHDIFF,	
SYSTIMESTAMP() AS MD_CREATION_DT,
'SHAREHIST' AS MD_SOURCE,
MD_SRCSYSTEM,
START_DT AS MD_START_DT,
MD_LOADDATE AS MD_EXTRACT_DT,
FROMREPID,
TOREPID,
SHARETYPE,
SOURCECODE,
PRODUCTCOD,
REVENUEPCT,
COMMISSIONPCT,
NETCOMMISSIONPCT,
FEEPCT,
REVNO,
STAMP,
START_DT,
END_DT  
FROM AUD
WHERE START_DT <> END_DT
QUALIFY ROW_NUMBER() OVER (PARTITION BY hk_link,TO_DATE(START_DT) ORDER BY revno DESC, START_DT desc ) = 1;

create procedure INVESTIA."DB_IAWT_DEV_DWH.TRANSACTIONS_BDV.SP_CONV_LOADBDV_RDV_TRANSACTIONS_INVESTIA_UNIVERIS_TO_BDV_WT_LINK_FINANCIAL_TRANSACTION_INVESTIA_UNIVERIS"(ENV VARCHAR, I_DATA_START_DATE VARCHAR)
    returns VARCHAR
    language SQL
    strict
as
$$
DECLARE
INS_PRE_DEL STRING;
INS_INSERT STRING;
INS_UPDATE STRING;

BEGIN
i_DATA_START_DATE :=CHAR(39)||i_DATA_START_DATE||CHAR(39);
INS_PRE_DEL := 'DELETE FROM DB_IAWT_'||ENV||'_DWH.TRANSACTIONS_BDV.WT_LINK_FINANCIAL_TRANSACTION_INVESTIA_UNIVERIS WHERE 1=1';
INS_INSERT := '
INSERT INTO DB_IAWT_'||ENV||'_DWH.TRANSACTIONS_BDV.WT_LINK_FINANCIAL_TRANSACTION_INVESTIA_UNIVERIS ( 	
HK_HUB_PARTY_ROLE_ACCOUNT_HOLDER
,HK_HUB_PARTY_ROLE_ADVISOR	
,HK_HUB_INVESTMENT_SAVING_PROGRAM_TYPES	
,HK_HUB_INVESTMENT_PRODUCT_TYPE		
,HK_HUB_CONTRACT	
,MD_START_DT		
,MD_CREATION_DT	
,MD_SOURCE		
,MD_SRC_SYSTEM	
,MD_EXTRACT_DT	
,TRANSACTION_ID		
,UNIVERIS_CLIENT_ID	
,MASTER_CODE	
,UNIVERIS_PLAN_ID
,INVESTMENT_PRODUCT_ID	
,PLN_MNEM		
,TRADE_DATE		
,GROSS_AMOUNT		
,TRANSACTION_TYPE		
,ORD_TRANSACTION_TYPE		
,CASH_FLOW	
,CASH_FLOW_TYPE	
,ADMINISTRATORY_TYPE )
SELECT
	sbdv.HK_HUB_PARTY_ROLE_ACCOUNT_HOLDER	
	,bdv02.HK_HUB_PARTY_ROLE_ADVISOR	
	,sbdv.HK_HUB_INVESTMENT_SAVING_PROGRAM_TYPES	
	,trdv.HK_HUB_INVESTMENT_PRODUCT_TYPE	
	,trdv.HK_HUB_CONTRACT	
	,TO_DATE('||i_DATA_START_DATE||',''YYYY-MM-DD'')	
	,CURRENT_TIMESTAMP
	,rdv3.MD_SOURCE	
	,trdv.MD_SRC_SYSTEM	
	,rdv3.MD_EXTRACT_DT	
	,trdv.TRANSACTION_ID	
	,trdv.UNIVERIS_CLIENT_ID
	,bdv02.MASTER_CODE	
	,trdv.UNIVERIS_PLAN_ID	
	,trdv.INVESTMENT_PRODUCT_ID	
	,sbdv.PLN_MNEM	
	,rdv3.TRADE_DT	
	,rdv3.TRX_GROSS* (CASE WHEN bdv02.COMMISSIONPCT IS NULL THEN 1 ELSE bdv02.COMMISSIONPCT/100 END)
	,BUSINESS_RULES.UDF_CONV_BR_UNIVERIS_TRANSACTIONS_TRANSACTION_TYPE_001(rdv3.SPR_CTGY,rdv3.TRX_MNEM_ENG)[''o_TRANSACTION_TYPE'']
	,BUSINESS_RULES.UDF_CONV_BR_UNIVERIS_TRANSACTIONS_TRANSACTION_TYPE_001(rdv3.SPR_CTGY,rdv3.TRX_MNEM_ENG)[''o_TRANSACTION_TYPE'']	
	,BUSINESS_RULES.UDF_CONV_BR_UNIVERIS_TRANSACTIONS_CASH_FLOW_002(rdv3.TRX_MNEM_ENG)
	,BUSINESS_RULES.UDF_CONV_BR_UNIVERIS_TRANSACTIONS_CASH_FLOW_003((rdv3.TRX_MNEM_ENG),(rdv3.TRX_GROSS* (CASE WHEN bdv02.COMMISSIONPCT IS NULL THEN 1 ELSE bdv02.COMMISSIONPCT/100 END)))
	,bdv04.ADMINISTRATOR_TYPE
	FROM (
		SELECT *
			FROM DB_IAWT_'||ENV||'_DWH.TRANSACTIONS_RDV.SAT_LINK_FINANCIAL_TRANSACTION_RR_INVESTIA_UNIVERIS WHERE MD_START_DT = TO_DATE('||i_DATA_START_DATE||', ''YYYY-MM-DD'')  AND MD_ACTIVE = ''A'' )rdv3
		JOIN (SELECT * FROM DB_IAWT_'||ENV||'_DWH.TRANSACTIONS_RDV.LINK_FINANCIAL_TRANSACTION_RR WHERE  MD_SRC_SYSTEM = ''INVESTIA-UNIVERIS'')trdv 
		ON rdv3.HK_LINK = trdv.HK_LINK
		LEFT JOIN
		(
			SELECT rdv2.HK_HUB_CONTRACT, srdv3.MD_ACTIVE 
			FROM (
				SELECT *
				FROM (SELECT * FROM DB_IAWT_'||ENV||'_DWH.SHARED_RDV.LINK_INVESTMENT_CONTRACT_RR WHERE MD_SRC_SYSTEM = ''INVESTIA-UNIVERIS'')) rdv2
				JOIN DB_IAWT_'||ENV||'_DWH.SHARED_RDV.SAT_LINK_INVESTMENT_CONTRACT_INVESTIA_UNIVERIS srdv3 ON srdv3.HK_LINK = rdv2.HK_LINK
			JOIN ( 
				SELECT *
				FROM (
					SELECT *, ROW_NUMBER() OVER(PARTITION BY HK_HUB_CONTRACT ORDER BY MD_START_DT DESC) RN 
						FROM (SELECT * FROM DB_IAWT_'||ENV||'_DWH.SHARED_RDV.LINK_INVESTMENT_CONTRACT_RR rdv2 
							JOIN DB_IAWT_'||ENV||'_DWH.SHARED_RDV.SAT_LINK_INVESTMENT_CONTRACT_INVESTIA_UNIVERIS srdv3 
				ON srdv3.HK_LINK = rdv2.HK_LINK WHERE rdv2.MD_SRC_SYSTEM = ''INVESTIA-UNIVERIS'')) SATHUB WHERE SATHUB.RN = 1 AND SATHUB.MD_START_DT <= TO_DATE('||i_DATA_START_DATE||', ''YYYY-MM-DD'') 
				)SATHUB0 ON rdv2.HK_HUB_CONTRACT = SATHUB0.HK_HUB_CONTRACT AND srdv3.MD_START_DT = SATHUB0.MD_START_DT
		)bdv0 ON bdv0.HK_HUB_CONTRACT = trdv.HK_HUB_CONTRACT  
		LEFT JOIN
		(
			SELECT rdv.HK_HUB, rdv.RR_CD, srdv2.REP_SYSID, srdv2.MD_ACTIVE
			FROM (
				SELECT *
				FROM DB_IAWT_'||ENV||'_DWH.SHARED_RDV.SAT_REGISTERED_REPRESENTATIVE_INVESTIA_UNIVERIS) srdv2
			JOIN (
				SELECT *
				FROM (
					SELECT *
						,ROW_NUMBER() OVER (PARTITION BY HK_HUB ORDER BY MD_START_DT DESC
							) RN1
					FROM DB_IAWT_'||ENV||'_DWH.SHARED_RDV.SAT_REGISTERED_REPRESENTATIVE_INVESTIA_UNIVERIS) SATHUB1
				WHERE SATHUB1.RN1 = 1 AND SATHUB1.MD_START_DT <= TO_DATE('||i_DATA_START_DATE||', ''YYYY-MM-DD'') 
				) rdv2lv ON rdv2lv.HK_HUB = srdv2.HK_HUB
			JOIN (SELECT * FROM DB_IAWT_'||ENV||'_DWH.SHARED_RDV.HUB_REGISTERED_REPRESENTATIVE WHERE MD_SRC_SYSTEM = ''INVESTIA-UNIVERIS'')rdv ON rdv.HK_HUB = srdv2.HK_HUB WHERE srdv2.MD_ACTIVE = ''A''
		)bdv01 ON rdv3.REP_SYSID = bdv01.REP_SYSID
		LEFT JOIN
		(
			SELECT bdv.HK_HUB_REGISTERED_REPRESENTATIVE, bdv.HK_HUB_PARTY_ROLE_ADVISOR, bdv.MASTER_CODE, bdv2.COMMISSIONPCT
			FROM (
				SELECT *
				FROM (SELECT * FROM DB_IAWT_'||ENV||'_DWH.SHARED_BDV.SAT_LINK_PARTY_RELATIONSHIP_COMMISSION_SHARE WHERE MD_SRC_SYSTEM = ''INVESTIA-UNIVERIS''
				))bdv2
			JOIN (
				SELECT *
				FROM (
					SELECT *
						,ROW_NUMBER() OVER (
							PARTITION BY HK_LINK ORDER BY MD_START_DT DESC
							) RN2
					FROM (SELECT * FROM DB_IAWT_'||ENV||'_DWH.SHARED_BDV.SAT_LINK_PARTY_RELATIONSHIP_COMMISSION_SHARE WHERE MD_SRC_SYSTEM = ''INVESTIA-UNIVERIS''
					)) SATHUB2
				WHERE SATHUB2.RN2 = 1 AND SATHUB2.MD_START_DT <= TO_DATE('||i_DATA_START_DATE||', ''YYYY-MM-DD'') 
				) ssbdv4 ON ssbdv4.HK_LINK = bdv2.HK_LINK 
			JOIN (SELECT * FROM DB_IAWT_'||ENV||'_DWH.SHARED_BDV.LINK_PARTY_RELATIONSHIP_COMMISSION_SHARE WHERE MD_SRC_SYSTEM = ''INVESTIA-UNIVERIS'') bdv ON bdv.HK_LINK =bdv2.HK_LINK WHERE bdv2.MD_ACTIVE = ''A''
		)bdv02	ON bdv01.HK_HUB = bdv02.HK_HUB_REGISTERED_REPRESENTATIVE
		LEFT JOIN
		(
			SELECT srdv.HK_HUB,srdv.ADMINISTRATOR_TYPE
			FROM (
				SELECT *
				FROM DB_IAWT_'||ENV||'_DWH.SHARED_RDV.SAT_CONTRACT_INVESTIA_UNIVERIS) srdv
			JOIN (
				SELECT *
				FROM (
					SELECT *
						,ROW_NUMBER() OVER (
							PARTITION BY HK_HUB ORDER BY MD_START_DT DESC
							) RN3
					FROM DB_IAWT_'||ENV||'_DWH.SHARED_RDV.SAT_CONTRACT_INVESTIA_UNIVERIS
					) SATHUB3
				WHERE SATHUB3.RN3 = 1 AND SATHUB3.MD_START_DT <= TO_DATE('||i_DATA_START_DATE||', ''YYYY-MM-DD'') 
				) ssbdv5 ON ssbdv5.HK_HUB = srdv.HK_HUB WHERE ssbdv5.MD_ACTIVE = ''A''
		)bdv04 ON trdv.HK_HUB_CONTRACT = bdv04.HK_HUB
		LEFT JOIN
		(
			SELECT rdv4.HK_HUB, rdv4.SYMBOL
			FROM (
				SELECT *
				FROM DB_IAWT_'||ENV||'_DWH.SHARED_RDV.SAT_INVESTMENT_PRODUCT_TYPE_INVESTIA_UNIVERIS
				) rdv4
			JOIN (
				SELECT *
				FROM (
					SELECT *
						,ROW_NUMBER() OVER (
							PARTITION BY HK_HUB ORDER BY MD_START_DT DESC
							) RN4
					FROM DB_IAWT_'||ENV||'_DWH.SHARED_RDV.SAT_INVESTMENT_PRODUCT_TYPE_INVESTIA_UNIVERIS
					) SATHUB4
				WHERE SATHUB4.RN4 = 1 AND SATHUB4.MD_START_DT <= TO_DATE('||i_DATA_START_DATE||', ''YYYY-MM-DD'') 
				) ssbdv6 ON ssbdv6.HK_HUB = rdv4.HK_HUB WHERE ssbdv6.MD_ACTIVE = ''A'' 
		)bdv06 ON trdv.HK_HUB_INVESTMENT_PRODUCT_TYPE = bdv06.HK_HUB
		LEFT JOIN (SELECT * FROM DB_IAWT_'||ENV||'_DWH.SHARED_BDV.LINK_INVESTMENT_CONTRACT WHERE MD_SRC_SYSTEM = ''INVESTIA-UNIVERIS'') sbdv ON sbdv.HK_HUB_CONTRACT = trdv.HK_HUB_CONTRACT AND sbdv.HK_HUB_PARTY_ROLE_ADVISOR = bdv02.HK_HUB_PARTY_ROLE_ADVISOR
		WHERE rdv3.SPR_CTGY IN (''PUR'', ''PAC'', ''RED'', ''AWD'', ''SWI'', ''SWO'', ''TIN'', ''TOT'', ''XIN'', ''XOT'') AND bdv06.SYMBOL NOT IN (''MRC001'', ''IAAFCCA'', ''INVCCA'')	
		AND
		bdv0.MD_ACTIVE = ''A''        
             ';
INS_UPDATE :=' UPDATE DB_IAWT_'||ENV||'_DWH.TRANSACTIONS_BDV.WT_LINK_FINANCIAL_TRANSACTION_INVESTIA_UNIVERIS
SET 
	HK_LINK=
	SHA1(UPPER(CONCAT(COALESCE(TRIM(MD_SRC_SYSTEM), ''#NULL#''), ''|'' , 
	COALESCE(TRIM(TRANSACTION_ID), ''#NULL#''), ''|'' , 
	COALESCE(TRIM(UNIVERIS_CLIENT_ID), ''#NULL#''), ''|'' , 
	COALESCE(TRIM(MASTER_CODE), ''#NULL#''), ''|'' , 
	''#NULL#'', ''|'',  -- CONTRACT_ID
	COALESCE(TRIM(UNIVERIS_PLAN_ID), ''#NULL#''), ''|'',
	COALESCE(TRIM(INVESTMENT_PRODUCT_ID), ''#NULL#''), ''|'' ,  
	COALESCE(TRIM(PLN_MNEM),''#NULL#''), ''|'' , 
	''#NULL#'', ''|'', -- ACCOUNT_RAP_CODE
	''#NULL#'', ''|'' , -- RETAIL_PLAN
	''#NULL#'' -- ASC_1_RESP_PLAN_TYPES
	))),
	HK_HUB_INVESTMENT_SAVING_PROGRAM_TYPES = COALESCE(HK_HUB_INVESTMENT_SAVING_PROGRAM_TYPES,''0''),
	HK_HUB_PARTY_ROLE_ACCOUNT_HOLDER= COALESCE(HK_HUB_PARTY_ROLE_ACCOUNT_HOLDER,''0''),
	HK_HUB_PARTY_ROLE_ADVISOR= COALESCE(HK_HUB_PARTY_ROLE_ADVISOR,''0''),
	HK_HUB_INVESTMENT_PRODUCT_TYPE= COALESCE(HK_HUB_INVESTMENT_PRODUCT_TYPE,''0''),
	HK_HUB_CONTRACT= COALESCE(HK_HUB_CONTRACT,''0'')
Where 1=1;
';
EXECUTE IMMEDIATE :INS_PRE_DEL;
EXECUTE IMMEDIATE :INS_INSERT;
EXECUTE IMMEDIATE :INS_UPDATE;

END

$$;

create procedure IAS_COMMISSION."DB_IAW_DEV_STG.IAS.SP_LOADSTG_PSA_IAS_COMMISSION_TO_STG_REVENUES"(ENV VARCHAR, IO_PATH VARCHAR)
    returns VARCHAR
    language SQL
    strict
as
$$
DECLARE
INS_PRE_QUERY STRING;
INS_COPY_QUERY STRING;

BEGIN
INS_PRE_QUERY := 'DELETE FROM DB_IAW_'||ENV||'_STG.IAS_COMMISSION.REVENUES WHERE 1=1;';
INS_COPY_QUERY := '
COPY INTO DB_IAW_'||ENV||'_STG.IAS_COMMISSION.REVENUES
(
MD_START_DT,
MD_SOURCE,
	REPID ,
	ADVISOR_ID ,
	PROGRAM_TYPE ,
	ACCOUNTID ,
	PROCESSDATE ,
	SOURCECODE ,
	QUANTITY ,
	TRANSTYPE ,
	REVENUE ,
	COMMISSION ,
	NETCOMMISSION ,
	TRANSFEE,
	MD_SRC_SYSTEM,
	MD_EXTRACT_DT
)
FROM
	(
	SELECT
		TO_DATE(split_part(split_part(metadata$filename, ''__'', 2), ''.'', 0)), metadata$filename,t.$1,t.$2,t.$3,t.$4,t.$5,t.$6,t.$7,t.$8,t.$9,t.$10,t.$11,t.$12,t.$13,t.$14
	FROM
		@DATALAKE.'||io_PATH||' T
	) pattern =''.*REVENUES_.*csv'' file_format=(format_name = DB_IAW_'||ENV||'_STG.IAS.PIPE_UTF16);
              ';

EXECUTE IMMEDIATE :INS_PRE_QUERY;
EXECUTE IMMEDIATE :INS_COPY_QUERY;
END
$$;

create procedure IAS_COMMISSION."DB_IAW_DEV_STG.IAS_COMMISSION.SP_LOADSTG_PSA_IAS_COMMISSION_TO_STG_REVENUES"(ENV VARCHAR, IO_PATH VARCHAR)
    returns VARCHAR
    language SQL
    strict
as
$$
DECLARE
INS_PRE_QUERY STRING;
INS_COPY_QUERY STRING;

BEGIN
INS_PRE_QUERY := 'DELETE FROM DB_IAW_'||ENV||'_STG.IAS_COMMISSION.REVENUES WHERE 1=1;';
INS_COPY_QUERY := '
COPY INTO DB_IAW_'||ENV||'_STG.IAS_COMMISSION.REVENUES
(
MD_START_DT,
MD_SOURCE,
	REPID ,
	ADVISOR_ID ,
	PROGRAM_TYPE ,
	ACCOUNTID ,
	PROCESSDATE ,
	SOURCECODE ,
	QUANTITY ,
	TRANSTYPE ,
	REVENUE ,
	COMMISSION ,
	NETCOMMISSION ,
	TRANSFEE,
	MD_SRC_SYSTEM,
	MD_EXTRACT_DT
)
FROM
	(
	SELECT
		TO_DATE(split_part(split_part(metadata$filename, ''__'', 2), ''.'', 0)), metadata$filename,t.$1,t.$2,t.$3,t.$4,t.$5,t.$6,t.$7,t.$8,t.$9,t.$10,t.$11,t.$12,t.$13,t.$14
	FROM
		@DATALAKE.'||IO_PATH||' T
	) pattern =''.*REVENUES_.*csv'' file_format=(format_name=IAS.PIPE_UTF16);
              ';

EXECUTE IMMEDIATE :INS_PRE_QUERY;
EXECUTE IMMEDIATE :INS_COPY_QUERY;
END
$$;

create function PUBLIC.EXTRACT_IVT_OBJ_CDE_PCT(IVT_OBJ_CDE VARCHAR)
    returns NUMBER
as
$$SELECT COALESCE ( TRY_TO_NUMBER(SUBSTRING(REGEXP_SUBSTR(TRIM(IVT_OBJ_CDE), '[A|C|D|E|F|H|I|J|K|L|N|O|P|Q|R|T|U|V|W|X|Y|Z][[:digit:]]+',1,1 ),2,2)) ,0)$$;

create function TOOLS.REPLACE_NAME_PATTERNS(A VARCHAR)
    returns VARCHAR
    language JAVASCRIPT
as
$$
  return a;
$$;

create function INVESTIA.SIMPLE_TABLE_FUNCTION()
    returns TABLE (X NUMBER, Y NUMBER)
as
$$
    select 1, 2
    union all
    select 3, 4
  $$;

create procedure PUBLIC.SP_CONV_DATAVAULT_LOADLINK_AUDIT_ID_RK1(INSERT_COLS VARCHAR, SELECT_COLS VARCHAR,
                                                                SRC_TBL VARCHAR, TGT_TBL VARCHAR, TRUNC_TBL VARCHAR)
    returns VARCHAR
    language javascript
as
$$

var INS_QUERY = "INSERT INTO "+ TGT_TBL + "(" + INSERT_COLS + ") SELECT " + SELECT_COLS + " FROM (SELECT DISTINCT * FROM " + SRC_TBL + " ) STG LEFT JOIN "+ TGT_TBL +" LNK ON STG.HK_LINK = LNK.HK_LINK  WHERE LNK.HK_LINK IS NULL;"
var TRUN_QUERY = "TRUNCATE TABLE " + TGT_TBL +";"


if (TRUNC_TBL == 'Y')
    {
    
    var sql_statement = snowflake.createStatement(
          {
          sqlText: TRUN_QUERY
          }
       );
   var result_scan = sql_statement.execute();
	}
	

   var sql_statement = snowflake.createStatement(
          {
          sqlText: INS_QUERY
          }
       );
   		
   return INS_QUERY;
$$;

create procedure IAS_IAVM.SP_CONV_INITIAL_PSA_IAS_IAVM_TO_STG_ACCRUED_INTEREST(ENV VARCHAR, IO_PATH VARCHAR)
    returns VARCHAR
    language SQL
    strict
as
$$
DECLARE
INS_PRE_QUERY STRING;
INS_COPY_QUERY STRING;
INS_UPDATE STRING;
BEGIN
INS_PRE_QUERY := 'DELETE FROM DB_IAW_'||ENV||'_STG.IAS_IAVM.ACCRUED_INTEREST WHERE 1=1;';
INS_COPY_QUERY := '
COPY INTO
	DB_IAW_'||ENV||'_STG.IAS_IAVM.ACCRUED_INTEREST (
	MD_START_DT, 
	MD_SOURCE,
	PROCESS_DATE,
	PRODUCT_CODE,
	FIID,
	CUSIP,
	ISIN,
	MARKET,
	SYMBOL,
	INTEREST_RATE,
	ACCRUED_INTEREST_METHOD1,
	ACCRUED_INTEREST_METHOD2,
	DAILY_COUNT_BASIS,
	INTEREST_START_DATE,
	YEAR_FRACTION,
	BASE_ACCRUED_INTEREST,
	MD_EXTRACT_DT,
	MD_SRC_SYSTEM
)
FROM
	(
	SELECT
		TO_DATE(t.$1),metadata$filename, t.$1, t.$2, t.$3, t.$4, t.$5, t.$6, t.$7, t.$8, t.$9, t.$10, t.$11, t.$12, t.$13,t.$14,t.$15,t.$16
	FROM
		@DATALAKE.'||io_PATH||' T
	) pattern = ''.*ACCRUED_INTEREST_.*csv'' file_format =(format_name = DB_IAW_'||ENV||'_STG.IAS_IAVM.PIPE_UTF16);
              '; 			  
INS_UPDATE := '
UPDATE DB_IAW_'||ENV||'_STG.IAS_IAVM.ACCRUED_INTEREST 
SET 
HK_LINK= 
           SHA1(UPPER(CONCAT(COALESCE(TRIM(''IAS''), ''#NULL#''), ''|'' , 
		                     COALESCE(TO_VARCHAR(TRIM(PROCESS_DATE)), ''#NULL#''), ''|'' , 
							 COALESCE(TRIM(FIID), ''#NULL#''), ''|'' ,
							 COALESCE(TRIM(PRODUCT_CODE), ''#NULL#''), ''|'' ,
							 COALESCE(TRIM(MARKET), ''#NULL#''), ''|'' ,
                             COALESCE(TRIM(SYMBOL), ''#NULL#''), ''|'' , 
							 COALESCE(TO_VARCHAR(TRIM(INTEREST_RATE)), ''#NULL#''), ''|'' ,
							 COALESCE(TO_VARCHAR(TRIM(INTEREST_START_DATE)), ''#NULL#''), ''|'' ,
							 COALESCE(TO_VARCHAR(TRIM(YEAR_FRACTION)), ''#NULL#'') , ''|'' ,
							 COALESCE(TO_VARCHAR(TRIM(BASE_ACCRUED_INTEREST)), ''#NULL#'') 
							 ))),
HK_HUB_INVESTMENT_PRODUCT_TYPE = DECODE(TRUE, FIID IS NULL ,''0'',SHA1(UPPER(CONCAT(COALESCE(TRIM(MD_SRC_SYSTEM), ''#NULL#''), ''|'' , COALESCE(TRIM(FIID), ''#NULL#''))))),
MD_CREATION_DT=systimestamp(),
MD_START_DT =dateadd(DAY,1,MD_START_DT)
Where 1=1;
';
EXECUTE IMMEDIATE :INS_PRE_QUERY;
EXECUTE IMMEDIATE :INS_COPY_QUERY;
EXECUTE IMMEDIATE :INS_UPDATE;
END
$$;

create procedure IAS_IAVM.SP_CONV_INITIAL_PSA_IAS_IAVM_TO_STG_ACCRUED_INTEREST_SV(ENV VARCHAR, IO_PATH VARCHAR)
    returns VARCHAR
    language SQL
    strict
as
$$
DECLARE
INS_PRE_QUERY STRING;
INS_COPY_QUERY STRING;
INS_UPDATE STRING;
BEGIN
INS_PRE_QUERY := 'DELETE FROM DB_IAW_'||ENV||'_STG.IAS_IAVM.ACCRUED_INTEREST_SV WHERE 1=1;';
INS_COPY_QUERY := '
COPY INTO
	DB_IAW_'||ENV||'_STG.IAS_IAVM.ACCRUED_INTEREST_SV (
	MD_START_DT, 
	MD_SOURCE,
	PROCESS_DATE,
	PRODUCT_CODE,
	FIID,
	CUSIP,
	ISIN,
	MARKET,
	SYMBOL,
	INTEREST_RATE,
	ACCRUED_INTEREST_METHOD1,
	ACCRUED_INTEREST_METHOD2,
	DAILY_COUNT_BASIS,
	INTEREST_START_DATE,
	YEAR_FRACTION,
	BASE_ACCRUED_INTEREST,
	MD_EXTRACT_DT,
	MD_SRC_SYSTEM
)
FROM
	(
	SELECT
		TO_DATE(split_part(split_part(metadata$filename, ''__'', 2), ''.'', 0)),metadata$filename, t.$1, t.$2, t.$3, t.$4, t.$5, t.$6, t.$7, t.$8, t.$9, t.$10, t.$11, t.$12, t.$13,t.$14,t.$15,t.$16
	FROM
		@DATALAKE.'||io_PATH||' T
	) pattern = ''.*ACCRUED_INTEREST_.*csv'' file_format =(format_name = DB_IAW_'||ENV||'_STG.IAS_IAVM.PIPE_UTF16);
              '; 			  
INS_UPDATE := '
UPDATE DB_IAW_'||ENV||'_STG.IAS_IAVM.ACCRUED_INTEREST_SV 
SET 
HK_LINK= 
           SHA1(UPPER(CONCAT(COALESCE(TRIM(''IAS''), ''#NULL#''), ''|'' , 
		                     COALESCE(TO_VARCHAR(TRIM(PROCESS_DATE)), ''#NULL#''), ''|'' , 
							 COALESCE(TRIM(FIID), ''#NULL#''), ''|'' ,
							 COALESCE(TRIM(PRODUCT_CODE), ''#NULL#''), ''|'' ,
							 COALESCE(TRIM(MARKET), ''#NULL#''), ''|'' ,
                             COALESCE(TRIM(SYMBOL), ''#NULL#''), ''|'' , 
							 COALESCE(TO_VARCHAR(TRIM(INTEREST_RATE)), ''#NULL#''), ''|'' ,
							 COALESCE(TO_VARCHAR(TRIM(INTEREST_START_DATE)), ''#NULL#''), ''|'' ,
							 COALESCE(TO_VARCHAR(TRIM(YEAR_FRACTION)), ''#NULL#'') , ''|'' ,
							 COALESCE(TO_VARCHAR(TRIM(BASE_ACCRUED_INTEREST)), ''#NULL#'') 
							 ))),
HK_HUB_INVESTMENT_PRODUCT_TYPE = DECODE(TRUE, FIID IS NULL ,''0'',SHA1(UPPER(CONCAT(COALESCE(TRIM(MD_SRC_SYSTEM), ''#NULL#''), ''|'' , COALESCE(TRIM(FIID), ''#NULL#''))))),
MD_CREATION_DT=systimestamp()
Where 1=1;
';
EXECUTE IMMEDIATE :INS_PRE_QUERY;
EXECUTE IMMEDIATE :INS_COPY_QUERY;
EXECUTE IMMEDIATE :INS_UPDATE;
END
$$;

create procedure IAS_CERTS.SP_CONV_LDSTG_PSA_IAS_CERT_TO_STG_REG_REP_REC_IAS_CERTS(ENV VARCHAR, IO_PATH VARCHAR)
    returns VARCHAR
    language SQL
    strict
as
$$
DECLARE
INS_PRE_DEL STRING;
INS_PRE_COPY STRING;
INS_UPDATE STRING;
BEGIN
INS_PRE_DEL := 'DELETE FROM DB_IAW_'||ENV||'_STG.IAS_CERTS.REGISTERED_REPRESENTATIVE_RECEPTION WHERE 1=1';
INS_PRE_COPY := '
COPY INTO DB_IAW_'||ENV||'_STG.IAS_CERTS.REGISTERED_REPRESENTATIVE_RECEPTION
(
    MD_START_DT,
    MD_SOURCE,
    CID ,
	FIRST_NAME ,
	LAST_NAME ,
	FULL_NAME ,
	PRIMARY_ROLE ,
	RVP ,
	BRANCH_NRD ,
	BRANCH_NAME ,
	PROVINCE ,
	IS_ACTIVE ,
	REP_CODE ,
	TRADE_NAME ,
	PORTAL_IDS ,
	BEGIN_DT ,
	END_DT,
	ADVISOR_BIRTH_DATE,
    REP_EMAIL,		 
	CBM, 			 
	BRANCH_ADDRESS1,	 
	BRANCH_ADDRESS2,	 
	BRANCH_CITY,		 
	BRANCH_POSTAL_CODE
)
FROM
	(
	SELECT
		TO_DATE(split_part(split_part(metadata$filename, ''__'', 2), ''.'', 0)), metadata$filename,t.$1,t.$2,t.$3,t.$4,t.$5,t.$6,t.$7,t.$8,t.$9,t.$10,t.$11,t.$12,t.$13,t.$14,t.$15,t.$16,t.$17,t.$18,t.$19,t.$20,t.$21,t.$22 
	FROM
		@DATALAKE.'||IO_PATH||' t
	) pattern =''.*REGISTERED_REPRESENTATIVE__.*csv'' file_format=(format_name=DB_IAW_'||ENV||'_STG.IAS.PIPE_UTF16)
              ';
INS_UPDATE :='UPDATE DB_IAW_'||ENV||'_STG.IAS_CERTS.REGISTERED_REPRESENTATIVE_RECEPTION SET MD_EXTRACT_DT =''2000-01-01'' WHERE ASCII(CID) <>239';

EXECUTE IMMEDIATE :INS_PRE_DEL;
EXECUTE IMMEDIATE :INS_PRE_COPY;
EXECUTE IMMEDIATE :INS_UPDATE;
END
$$;

create procedure IAS_COMMISSION.SP_CONV_LDSTG_PSA_IAS_COMSN_TO_STG_REG_REP_COMM_REC(ENV VARCHAR, IO_PATH VARCHAR)
    returns VARCHAR
    language SQL
    strict
as
$$
DECLARE
INS_PRE_DEL STRING;
INS_PRE_COPY STRING;
BEGIN
INS_PRE_DEL := 'DELETE FROM DB_IAW_'||ENV||'_STG.IAS_COMMISSION.REGISTERED_REPRESENTATIVE_RECEPTION WHERE 1=1';
INS_PRE_COPY := '
COPY INTO DB_IAW_'||ENV||'_STG.IAS_COMMISSION.REGISTERED_REPRESENTATIVE_RECEPTION
(  MD_START_DT ,
	MD_SOURCE ,
	REPID ,
	REPNAME ,
	FIRSTNAME ,
	LASTNAME ,
	BRANCHCODE ,
	BRANCHNAME ,
	GROUPID ,
	GROUPDESCRIPTION ,
	FIXEDFEEIND ,
	MANAGEDIND ,
	REFIND ,
	ACTIVEIND ,
	SEGFUNDIND ,
	REVNO ,
	STAMP ,
	USERID ,
	ACTIVE ,
	ADVISOR_ID ,
	COMMRATEPCT ,
	SHAREGROSSCOMMIND ,
	STARTDATE ,
	MAINREPCODE ,
	MD_EXTRACT_DT ,
	MD_SRC_SYSTEM,
	ADVISOR_ROLE )
FROM
	(
	SELECT
		TO_DATE(split_part(split_part(metadata$filename, ''__'', 2), ''.'', 0)), metadata$filename, t.$1, t.$2, t.$3, t.$4, t.$5, t.$6, t.$7, t.$8, t.$9, t.$10, t.$11, t.$12, t.$13,t.$14, t.$15, t.$16, t.$17, t.$18, t.$19, t.$20, t.$21, t.$22, t.$23,
		t.$24, t.$25
	FROM 
		@DATALAKE.'||IO_PATH||' t ) pattern = ''.*REGISTERED_REPRESENTATIVE__.*csv'' file_format =(format_name = DB_IAW_'||ENV||'_STG.IAS.PIPE_UTF16)';
EXECUTE IMMEDIATE :INS_PRE_DEL;
EXECUTE IMMEDIATE :INS_PRE_COPY;
END
$$;

create procedure STEWARDSHIP.SP_CONV_LDSTG_PSA_IAS_COMSN_TO_STG_REG_REP_COMM_RECEPTION(IO_PATH VARCHAR)
    returns VARCHAR
    language SQL
    strict
as
$$
DECLARE
INS_PRE_DEL STRING;
INS_PRE_COPY STRING;
INS_INSERT STRING;
BEGIN
INS_PRE_DEL := 'DELETE FROM IAS_COMMISSION.REGISTERED_REPRESENTATIVE_RECEPTION WHERE 1=1';

INS_PRE_COPY := '
COPY INTO IAS_COMMISSION.REGISTERED_REPRESENTATIVE_RECEPTION
(  MD_START_DT ,
	MD_SOURCE ,
	REPID ,
	REPNAME ,
	FIRSTNAME ,
	LASTNAME ,
	BRANCHCODE ,
	BRANCHNAME ,
	GROUPID ,
	GROUPDESCRIPTION ,
	FIXEDFEEIND ,
	MANAGEDIND ,
	REFIND ,
	ACTIVEIND ,
	SEGFUNDIND ,
	REVNO ,
	STAMP ,
	USERID ,
	ACTIVE ,
	ADVISOR_ID ,
	COMMRATEPCT ,
	SHAREGROSSCOMMIND ,
	STARTDATE ,
	MAINREPCODE ,
	MD_EXTRACT_DT ,
	MD_SRC_SYSTEM )
FROM
	(
	SELECT
		TO_DATE(split_part(split_part(metadata$filename, ''__'', 2), ''.'', 0)), metadata$filename, t.$1, t.$2, t.$3, t.$4, t.$5, t.$6, t.$7, t.$8, t.$9, t.$10, t.$11, t.$12, t.$13,t.$14, t.$15, t.$16, t.$17, t.$18, t.$19, t.$20, t.$21, t.$22, t.$23,
		t.$24
	FROM
		@DATALAKE.'||IO_PATH||' t ) pattern = ''.*REGISTERED_REPRESENTATIVE__.*csv'' file_format =(format_name = IAS.PIPE_UTF16)
              ';

INS_INSERT := '
INSERT INTO IAS_COMMISSION.REGISTERED_REPRESENTATIVE_RECEPTION
INSERT INTO (MD_START_DT,
MD_EXTRACT_DT,
MD_SOURCE,
CID,
FIRST_NAME,
LAST_NAME,
FULL_NAME,
PRIMARY_ROLE,
RVP,
BRANCH_NRD,
BRANCH_NAME,
PROVINCE,
IS_ACTIVE,
REP_CODE,
TRADE_NAME,
PORTAL_IDS,
BEGIN_DT,
END_DT,
ADVISOR_BIRTH_DATE)
SELECT
SRC.INSERT INTO (MD_START_DT, 
SRC.MD_EXTRACT_DT, 
SRC.MD_SOURCE, 
SRC.CID, 
SRC.FIRST_NAME, 
SRC.LAST_NAME, 
SRC.FULL_NAME, 
SRC.PRIMARY_ROLE, 
SRC.RVP, 
SRC.BRANCH_NRD, 
SRC.BRANCH_NAME, 
SRC.PROVINCE, 
SRC.IS_ACTIVE, 
SRC.REP_CODE, 
SRC.TRADE_NAME, 
SRC.PORTAL_IDS, 
SRC.BEGIN_DT, 
SRC.END_DT, 
SRC.ADVISOR_BIRTH_DATE
FROM IAS_CERTS.REGISTERED_REPRESENTATIVE_RECEPTION SRC
              ';
EXECUTE IMMEDIATE :INS_PRE_DEL;
EXECUTE IMMEDIATE :INS_PRE_COPY;
EXECUTE IMMEDIATE :INS_INSERT;

END
$$;

create procedure INVESTIA.SP_CONV_LOADBDV_RDV_REVENUE_IAS_COMMISSION_TO_BDV_WT_LINK_REVENUE(ENV VARCHAR, IO_START_DATE VARCHAR)
    returns VARCHAR
    language SQL
    strict
as
$$
DECLARE
INS_PRE_DEL STRING;
INS_INSERT STRING;
INS_UPDATE STRING;

BEGIN
IO_START_DATE :=CHAR(39)||IO_START_DATE||CHAR(39);
INS_PRE_DEL := 'DELETE FROM REVENUES_BDV.WT_LINK_REVENUE WHERE MD_SRC_SYSTEM = ''IAS-COMMISSION''';
INS_INSERT := '
INSERT INTO REVENUES_BDV.WT_LINK_REVENUE 
(
HK_HUB_PARTY_ROLE_ACCOUNT_HOLDER, 
HK_HUB_PARTY_ROLE_ADVISOR, 
HK_HUB_CONTRACT, 
MD_START_DT, 
MD_SOURCE, 
MD_SRC_SYSTEM, 
MD_EXTRACT_DT, 
CLIENT_ID, 
CONTRACT_ID, 
ADVISOR_ID, 
MASTER_CODE, 
PLN_MNEM, 
MARKETPRODUCT_ID, 
PAYMENT_DATE, 
REVENUE, 
REVENUE_TYPE, 
REVENUE_SUBTYPE, 
AUA,
ENTRY_TYPE,
STAMP,
TRANSID,
INSURANCE_REVENUE,
ADVISOR_REVENUE_AMOUNT
) 
(
WITH RDV_LINK_REVENUE_COMMISSION as 
	(
	SELECT 
		LR.HK_LINK,
		LR.HK_HUB_CONTRACT,
		LR.MD_START_DT,
		LR.MD_SOURCE,
		LR.PROCESS_DT,
		LR.TRANSID,
		LR.ACCOUNTID,
		SAT_LR.MD_START_DT,
		SAT_LR.MD_SRC_SYSTEM,
		SAT_LR.MD_EXTRACT_DT, 
		SAT_LR.TRANSDATE,
		SAT_LR.SOURCECODE,
		LR.REPID,
		SAT_LR.EXCHANGERATE,
		SAT_LR.ENTRY_TYPE,
		SAT_LR.COMMISSIONCAD,
		SAT_LR.NETCOMMISSION,
		SAT_LR.STAMP,
		SAT_LR.PROGRAM_TYPE,
		SAT_LR.TRANSTYPE
		FROM DB_IAW_DEV_DWH.REVENUES_RDV.LINK_REVENUE_RR  LR
		INNER JOIN DB_IAW_DEV_DWH.REVENUES_RDV.SAT_LINK_REVENUE_RR_IAS_COMMISSION  SAT_LR
		ON LR.HK_LINK = SAT_LR.HK_LINK 
		WHERE SAT_LR.MD_SRC_SYSTEM = ''IAS-COMMISSION''
		AND   SAT_LR.MD_START_DT = TO_DATE('||IO_START_DATE||',''YYYY-MM-DD'')
		AND   ( SAT_LR.ENTRY_TYPE <> ''INSREV'' OR SAT_LR.ENTRY_TYPE IS NULL ) 
	), 
VIEW_CLIENT_CONTRACT as 
	(
	select 
	HK_HUB_CONTRACT as VW_HK_HUB_CONTRACT ,HK_HUB_PARTY_ROLE_ACCOUNT_HOLDER as	VW_HK_HUB_PARTY_ROLE_ACCOUNT_HOLDER , 
	A_C_CLIENT as 	VW_A_C_CLIENT from shared_bdv.VW_CLIENT_CONTRACT 
	as mstr join ( 
	select HK_HUB_CONTRACT as dtls_hk_HUB_CONTRACT, max(md_start_dt) as max_start_dt from  shared_bdv.VW_CLIENT_CONTRACT 
	where MD_START_DT <= TO_DATE('||IO_START_DATE||',''YYYY-MM-DD'') group by HK_HUB_CONTRACT ) as dtls 
	on HK_HUB_CONTRACT = dtls_hk_HUB_CONTRACT 
	AND MD_START_DT = max_start_dt where MD_ACTIVE = ''A''
	), 
FIL_LINK_REVEUE_COMMISSION as (
	select * from RDV_LINK_REVENUE_COMMISSION 
	left outer join VIEW_CLIENT_CONTRACT on VW_HK_HUB_CONTRACT = RDV_LINK_REVENUE_COMMISSION.HK_HUB_CONTRACT 
	where RDV_LINK_REVENUE_COMMISSION.SOURCECODE!=''EXP'' 
	AND RDV_LINK_REVENUE_COMMISSION.SOURCECODE!=''TXR''
	), 
SAT_LINK_INVESTMENTS as (
	select *  from  holdings_bdv.SAT_LINK_INVESTMENT SLK  
	join ( 
		select HK_LINK as dtls_HK_LINK, max(md_start_dt) as max_start_dt from   holdings_bdv.SAT_LINK_INVESTMENT 
		where MD_START_DT <= TO_DATE('||IO_START_DATE||',''YYYY-MM-DD'') group by HK_LINK 
		) as dtls 
	on SLK.HK_LINK = dtls_hk_LINK AND SLK.MD_START_DT = max_start_dt where MD_ACTIVE = ''A''), 
MERGE_SAT_LINK_INVESTMENT as (
	select HK_HUB_PARTY_ROLE_ACCOUNT_HOLDER, HK_HUB_PARTY_ROLE_ADVISOR, HK_HUB_CONTRACT, CONTRACT_ID, MASTER_CODE, CLIENT_ID,SAT_LINK_INVESTMENTS.*  
	from  holdings_bdv.LINK_INVESTMENT LK join SAT_LINK_INVESTMENTS
	on LK.HK_LINK = SAT_LINK_INVESTMENTS.HK_LINK 
	), 
SUM_AUA_SET as (
	select CONTRACT_ID, MASTER_CODE,SUM(AUA) as SUM_AUA, 
	CLIENT_ID
	from MERGE_SAT_LINK_INVESTMENT  
	group by MERGE_SAT_LINK_INVESTMENT.HK_HUB_PARTY_ROLE_ACCOUNT_HOLDER	, MERGE_SAT_LINK_INVESTMENT.HK_HUB_PARTY_ROLE_ADVISOR	, MERGE_SAT_LINK_INVESTMENT.HK_HUB_CONTRACT	, 
             MERGE_SAT_LINK_INVESTMENT.CONTRACT_ID	, MERGE_SAT_LINK_INVESTMENT.MD_SRC_SYSTEM, MERGE_SAT_LINK_INVESTMENT.MASTER_CODE	, MERGE_SAT_LINK_INVESTMENT.CLIENT_ID
) ,
LINK_PARTY_SHARE AS (
	SELECT LPS.HK_LINK,LPS.HK_HUB_REGISTERED_REPRESENTATIVE,LPS.HK_HUB_PARTY_ROLE_ADVISOR, LPS.A_C_REPRESENTATIVE, LPS.MASTER_CODE, SLPS.COMMISSIONPCT_ADVISOR, SLPS.COMMISSIONPCT
	FROM   DB_IAW_DEV_DWH.SHARED_BDV.LINK_PARTY_RELATIONSHIP_SHARE LPS
	INNER JOIN
	(
		SELECT SLPS.HK_LINK, SLPS.MD_START_DT, SLPS.MD_ACTIVE, SLPS.COMMISSIONPCT_ADVISOR, SLPS.COMMISSIONPCT 
		FROM DB_IAW_DEV_DWH.SHARED_BDV.SAT_LINK_PARTY_RELATIONSHIP_SHARE SLPS
		INNER JOIN 
		(
		    SELECT HK_LINK, MAX(MD_START_DT) AS MAX_MD_START_DT
			FROM DB_IAW_DEV_DWH.SHARED_BDV.SAT_LINK_PARTY_RELATIONSHIP_SHARE
			WHERE MD_START_DT <= TO_DATE('||IO_START_DATE||',''YYYY-MM-DD'')
			AND   MD_SRC_SYSTEM = ''IAS''
			GROUP BY HK_LINK
		) LV_SLPS	  
		ON LV_SLPS.HK_LINK = SLPS.HK_LINK 
		AND  LV_SLPS.MAX_MD_START_DT = SLPS.MD_START_DT
	) SLPS
	ON SLPS.HK_LINK = LPS.HK_LINK
	WHERE SLPS.MD_ACTIVE = ''A''
)
select 
VW_HK_HUB_PARTY_ROLE_ACCOUNT_HOLDER, LINK_PARTY_SHARE.HK_HUB_PARTY_ROLE_ADVISOR  AS Link_Revenue_HK_HUB_PARTY_ROLE_ADVISOR, FIL_LINK_REVEUE_COMMISSION.HK_HUB_CONTRACT, TO_DATE('||IO_START_DATE||',''YYYY-MM-DD'') , 
FIL_LINK_REVEUE_COMMISSION.MD_SOURCE, FIL_LINK_REVEUE_COMMISSION.MD_SRC_SYSTEM, FIL_LINK_REVEUE_COMMISSION.MD_EXTRACT_DT, VW_A_C_CLIENT, FIL_LINK_REVEUE_COMMISSION.ACCOUNTID, FIL_LINK_REVEUE_COMMISSION.REPID, 
LINK_PARTY_SHARE.MASTER_CODE AS ADVISOR_ID, 
-1, -1, FIL_LINK_REVEUE_COMMISSION.PROCESS_DT, 
    FIL_LINK_REVEUE_COMMISSION.COMMISSIONCAD * ( COALESCE(LINK_PARTY_SHARE.COMMISSIONPCT,100) * 0.01 ) AS COMMISSION , 
	DECODE(FIL_LINK_REVEUE_COMMISSION.SOURCECODE, ''OFF'' , ''Trade commissions'',
	 ''FXF'' ,''Fee based/Managed'',
	 ''MGD'' ,''Fee based/Managed'',
	 ''JRN'' , ''Trailers'',
	 ''MNL'',''Trade commissions'',
	 ''TRD'' ,''Trade commissions'',
	 ''Unkown'' 
	) AS REVENUE_TYPE, 
	DECODE(FIL_LINK_REVEUE_COMMISSION.SOURCECODE,
	''OFF'' ,''OffBook commission'',
	 ''FXF'' ,''Fixed fees'',
	 ''MGD'' , ''Managed'',
	 ''JRN'' ,''Trailer fees and GIC'',
	 ''MNL'' ,''Others'', 
	''TRD'' ,''Trade commissions'',
	 ''Unkown'' 
	)AS REVENUE_SUBTYPE, 
	COALESCE (SUM_AUA,0) AS SUM_AUA,
	FIL_LINK_REVEUE_COMMISSION.ENTRY_TYPE,
	FIL_LINK_REVEUE_COMMISSION.STAMP,
	FIL_LINK_REVEUE_COMMISSION.TRANSID,
	0 AS INSURANCE_REVENUE,
	FIL_LINK_REVEUE_COMMISSION.COMMISSIONCAD * ( COALESCE(LINK_PARTY_SHARE.COMMISSIONPCT_ADVISOR,100) * 0.01 ) AS ADVISOR_REVENUE_AMOUNT
	from FIL_LINK_REVEUE_COMMISSION 
	left outer join SUM_AUA_SET 
		on FIL_LINK_REVEUE_COMMISSION.ACCOUNTID = SUM_AUA_SET.CONTRACT_ID 
		and FIL_LINK_REVEUE_COMMISSION.REPID	=	SUM_AUA_SET.MASTER_CODE 
		and VW_A_C_CLIENT	=	SUM_AUA_SET.CLIENT_ID
	LEFT JOIN LINK_PARTY_SHARE 
    ON FIL_LINK_REVEUE_COMMISSION.REPID = LINK_PARTY_SHARE.A_C_REPRESENTATIVE	 
UNION ALL
-- Query Set for Insurance Revenues --
SELECT
	*
FROM
	(
	WITH RDV_LINK_REVENUE_COMMISSION_INS AS 
	(
	SELECT 
		LR.HK_LINK,
		LR.HK_HUB_CONTRACT,
		LR.MD_START_DT,
		LR.MD_SOURCE,
		LR.PROCESS_DT,
		LR.TRANSID,
		LR.ACCOUNTID,
        LR.HK_HUB_REGISTERED_REPRESENTATIVE,
		SAT_LR.MD_START_DT,
		SAT_LR.MD_SRC_SYSTEM,
		SAT_LR.MD_EXTRACT_DT, 
		SAT_LR.TRANSDATE,
		SAT_LR.SOURCECODE,
		LR.REPID,
		SAT_LR.EXCHANGERATE,
		SAT_LR.ENTRY_TYPE,
		SAT_LR.COMMISSIONCAD,
		SAT_LR.NETCOMMISSION,
		SAT_LR.STAMP,
		SAT_LR.PROGRAM_TYPE,
		SAT_LR.TRANSTYPE
	FROM
		DB_IAW_DEV_DWH.REVENUES_RDV.LINK_REVENUE_RR LR
	INNER JOIN DB_IAW_DEV_DWH.REVENUES_RDV.SAT_LINK_REVENUE_RR_IAS_COMMISSION SAT_LR
		ON
		LR.HK_LINK = SAT_LR.HK_LINK
	WHERE
		SAT_LR.MD_SRC_SYSTEM = ''IAS-COMMISSION''
		AND SAT_LR.MD_START_DT = TO_DATE('||IO_START_DATE||',''YYYY-MM-DD'')
		AND SAT_LR.ENTRY_TYPE = ''INSREV''
	)
	SELECT
		NULL     HUB_PARTY_ROLE_ACCOUNT_HOLDER,
		HK_HUB_REGISTERED_REPRESENTATIVE AS HUB_PARTY_ROLE_ADVISOR,
		HK_HUB_CONTRACT,
		TO_DATE('||IO_START_DATE||',''YYYY-MM-DD'') ,
		MD_SOURCE,
		MD_SRC_SYSTEM,
		MD_EXTRACT_DT,
		NULL AS VW_A_C_CLIENT,
		ACCOUNTID,
		REPID,
		REPID AS ADVISOR_ID,
		-1,
		-1,
		PROCESS_DT,
		0 AS COMMISSION ,
		''Insurance'' AS REVENUE_TYPE,
		''Insurance'' AS REVENUE_SUBTYPE,
		0 AS SUM_AUA,
		ENTRY_TYPE,
		STAMP,
		TRANSID,
		COMMISSIONCAD AS INSURANCE_REVENUE,
		0 AS ADVISOR_REVENUE_AMOUNT
	FROM
		RDV_LINK_REVENUE_COMMISSION_INS) 
) ';


INS_UPDATE :=' UPDATE REVENUES_BDV.WT_LINK_REVENUE 
SET 
HK_LINK= 
SHA1(UPPER(CONCAT(
COALESCE(TRIM(MD_SRC_SYSTEM), ''#NULL#''), ''|'' 
, ''#NULL#'', ''|''
, COALESCE(TRIM(CLIENT_ID), ''#NULL#''), ''|'' 
, COALESCE(TRIM(MASTER_CODE), ''#NULL#''), ''|'' 
, COALESCE(TRIM(PLN_MNEM), ''#NULL#''), ''|'' 
, COALESCE(TRIM(MARKETPRODUCT_ID), ''#NULL#''), ''|'' 
, COALESCE(TRIM(CONTRACT_ID), ''#NULL#''), ''|'' 
, ''#NULL#'', ''|''
, COALESCE(TRIM(PAYMENT_DATE), ''#NULL#''), ''|'' 
, COALESCE(TRIM(REVENUE_TYPE), ''#NULL#''), ''|'' 
, COALESCE(TRIM(REVENUE_SUBTYPE), ''#NULL#''), ''|'' 
, COALESCE(TRIM(ENTRY_TYPE), ''#NULL#''), ''|'' 
, COALESCE(TRIM(TO_VARCHAR(STAMP)), ''#NULL#''), ''|'' 
, COALESCE(TRIM(TO_VARCHAR(TRANSID)), ''#NULL#'')
))),
HK_HUB_PARTY_ROLE_ACCOUNT_HOLDER = COALESCE (HK_HUB_PARTY_ROLE_ACCOUNT_HOLDER,''0''),
HK_HUB_PARTY_ROLE_ADVISOR = COALESCE (HK_HUB_PARTY_ROLE_ADVISOR, ''0''),
HK_HUB_REF_INVESTMENT_SAVING_PROGRAM_TYPES = COALESCE(HK_HUB_REF_INVESTMENT_SAVING_PROGRAM_TYPES ,''0''),
HK_HUB_INVESTMENT_PRODUCT_TYPE = COALESCE(HK_HUB_INVESTMENT_PRODUCT_TYPE,''0'') ,
HK_HUB_CONTRACT = COALESCE (HK_HUB_CONTRACT, ''0''),
AUA = COALESCE (AUA,0),
INSURANCE_REVENUE= COALESCE (INSURANCE_REVENUE,0)
WHERE MD_SRC_SYSTEM = ''IAS-COMMISSION''; ';

EXECUTE IMMEDIATE :INS_PRE_DEL;
EXECUTE IMMEDIATE :INS_INSERT;
EXECUTE IMMEDIATE :INS_UPDATE;

END
$$;

create procedure STEWARDSHIP.SP_CONV_LOADBDV_RDV_STEWARDSHIP_IAPW_TO_WT_SERVICING_CODES(ENV VARCHAR)
    returns VARCHAR
    language SQL
    strict
as
$$
DECLARE
INS_PRE_DEL STRING;
INS_INSERT STRING;
INS_UPDATE STRING;
BEGIN
INS_PRE_DEL := 'DELETE FROM DB_IAW_'||ENV||'_DWH.STEWARDSHIP_BDV.WT_SERVICING_CODES WHERE 1=1';
INS_INSERT := 'INSERT INTO DB_IAW_'||ENV||'_DWH.STEWARDSHIP_BDV.WT_SERVICING_CODES
(	
	HK_LINK,
	MD_START_DT,
	MD_CREATION_DT,
	MD_SOURCE,
	MD_SRC_SYSTEM,
	MD_EXTRACT_DT,
	MASTER_CODE,
	REP_CODE,
	ADVISOR_NAME,
	END_DATE,
	REASON,
	NEW_FIRM,
	NEW_FIRM_TYPE,
	NEW_FIRM_BACK_OFFICE,
	PRESTIGE_STATUS
)
SELECT
	( src.HK_HUB,
	src.MD_START_DT,
	CURRENT_TIMESTAMP,
	src.MD_SOURCE,
	src.MD_SRC_SYSTEM,
	src.MD_EXTRACT_DT,
	src.MASTER_CODE,
	src.REP_CODE,
	src.ADVISOR_NAME,
	src.END_DATE,
	src.REASON,
	src.NEW_FIRM,
	src.NEW_FIRM_TYPE,
	src.NEW_FIRM_BACK_OFFICE,
	src.PRESTIGE_STATUS
	)
FROM DB_IAW_'||ENV||'_DWH.STEWARDSHIP_BDV.VW_SERVICING_CODES_SPLIT src
LEFT JOIN
(SELECT * FROM (SELECT *, ROW_NUMBER() OVER(PARTITION BY HK_HUB ORDER BY MD_START_DT DESC) RN FROM VW_SERVICING_CODES_SPLIT) srcHUB WHERE srcHUB.RN = 1 AND (src.MD_START_DT <= TO_DATE(''2021-11-15''))) sat
ON sat.HK_HUB = src.HK_HUB AND sat.MD_START_DT = ''2021-11-15''
WHERE sat.MD_ACTIVE=''A'' and sat.HK_HUB<>''0''
              ';
INS_UPDATE :='
UPDATE DB_IAW_'||ENV||'_DWH.STEWARDSHIP_BDV.WT_SERVICING_CODES
SET
	HK_LINK =
	SHA1(UPPER(CONCAT(COALESCE(TRIM(MD_SRC_SYSTEM), ''#NULL#''), ''|'' , COALESCE(TRIM(MASTER_CODE), ''#NULL#''), ''|'' , COALESCE(TRIM(REP_CODE), ''#NULL#'')))),
	HK_HUB_PARTY_ROLE_ADVISOR = SHA1(UPPER(CONCAT(COALESCE(TRIM(''IAS''), ''#NULL#''), ''|'' , COALESCE(TRIM(MASTER_CODE), ''#NULL#'')))),
	HK_HUB_REGISTERED_REPRESENTATIVE = SHA1(UPPER(CONCAT(COALESCE(TRIM(''IAS''), ''#NULL#''), ''|'' , COALESCE(TRIM(REP_CODE), ''#NULL#'')))),
	MD_HASHDIFF=
	SHA1(CONCAT(
	   COALESCE(ADVISOR_NAME , ''#NULL#''), ''|''
	,  COALESCE(TO_VARCHAR(END_DATE) , ''#NULL#''), ''|''
	,  COALESCE(REASON , ''#NULL#''), ''|''
	,  COALESCE(NEW_FIRM , ''#NULL#''), ''|''
	,  COALESCE(NEW_FIRM_TYPE, ''#NULL#''), ''|''
	,  COALESCE(NEW_FIRM_BACK_OFFICE , ''#NULL#''), ''|''
	,  COALESCE(PRESTIGE_STATUS , ''#NULL#'')
	))
	Where 1=1;
		';
EXECUTE IMMEDIATE :INS_PRE_DEL;
EXECUTE IMMEDIATE :INS_INSERT;
EXECUTE IMMEDIATE :INS_UPDATE;
END
$$;

create procedure STEWARDSHIP.SP_CONV_LOADDSTG_PSA_IAPW_TO_STG_REF_ORGANIC_GROWTH_EXCEPTIONS_IAPW(ENV VARCHAR, IO_PATH VARCHAR)
    returns VARCHAR
    language SQL
    strict
as
$$
DECLARE
INS_PRE_QUERY STRING;
INS_COPY_QUERY STRING;
UPD_QUERY STRING;

BEGIN
INS_PRE_QUERY := 'DELETE FROM DB_IAW_'||ENV||'_STG.STEWARDSHIP.REF_ORGANIC_GROWTH_EXCEPTIONS_IAPW WHERE 1=1;';
INS_COPY_QUERY := '
COPY INTO STEWARDSHIP.REF_ORGANIC_GROWTH_EXCEPTIONS_IAPW
(
MD_START_DT,
MD_SOURCE,
SOURCE_REP_CODE,
DESTINATION_MASTER_CODE,
SHARE_PCT,
START_DATE,
END_DATE
)
FROM
	(
	SELECT
		TO_DATE(split_part(split_part(metadata$filename, ''__'', 2), ''.'', 0)), metadata$filename,t.$1, t.$2, t.$3, t.$4, t.$5
	FROM
		@DATALAKE.'||io_PATH||' T
	) pattern = ''.*ORGANIC_GROWTH_EXCEPTIONS_IAPW__.*csv'' file_format =(format_name = DB_IAW_'||ENV||'_STG.STEWARDSHIP.CSV_UTF8 SKIP_HEADER =1);
	';
	UPD_QUERY := '
	UPDATE DB_IAW_'||ENV||'_STG.STEWARDSHIP.REF_ORGANIC_GROWTH_EXCEPTIONS_IAPW
SET
HK_HUB=
SHA1(
     UPPER(CONCAT(
     COALESCE(TRIM(SOURCE_REP_CODE), ''#NULL#''), ''|'' ,
     COALESCE(TRIM(DESTINATION_MASTER_CODE), ''#NULL#''), ''|'' ,
     COALESCE(TRIM(TO_VARCHAR(START_DATE)), ''#NULL#'')
     ))
     ),
MD_HASHDIFF=
SHA1(CONCAT(
   COALESCE(TO_VARCHAR(SHARE_PCT) , ''#NULL#''), ''|''
,  COALESCE(TO_VARCHAR(END_DATE), ''#NULL#'')
)),	
MD_CREATION_DT=systimestamp(),
MD_EXTRACT_DT=MD_START_DT,
MD_SRC_SYSTEM=''STEWARDSHIP''
Where 1=1;
';
EXECUTE IMMEDIATE :INS_PRE_QUERY;
EXECUTE IMMEDIATE :INS_COPY_QUERY;
EXECUTE IMMEDIATE :UPD_QUERY;
END
$$;

create procedure IAS_COMMISSION.SP_CONV_LOADSTG_IAS_COMMISSION_TO_STG_REVENUES(ENV VARCHAR)
    returns VARCHAR
    language javascript
as
$$ 
var delete_query = "DELETE FROM DB_IAW_dev_stg.STEWARDSHIP.REF_MAPPING_OPER_TYPE WHERE 1=1";
var delete_query_ENV = delete_query.replaceAll("_dev_","_"+ ENV + "_");
var sql_statement1 = snowflake.createStatement({
  sqlText: delete_query_ENV
});
var result1_scan = sql_statement1.execute(); 
INS_QUERY = "INSERT INTO DB_IAW_dev_stg.IAS_COMMISSION.REVENUES(MD_START_DT	,	" +
"MD_SRC_SYSTEM,		" +
"REPID	," +
"ADVISOR_ID	," +	
"PROGRAM_TYPE,	" +	
"ACCOUNTID	," +	
"PROCESSDATE,	" +
"SOURCECODE	,	" +
"QUANTITY	,	" +
"TRANSTYPE	,	" +
"REVENUE		," +
"COMMISSION	,	" +
"NETCOMMISSION,	" +
"TRANSFEE) " +
"(SELECT PROCESSDATE	,	" +
"MD_SRCSYSTEM,	" +
"REPID,	" +
"ADVISOR_ID	," +
"PROGRAM_TYPE	," +
"ACCOUNTID	," +
"PROCESSDATE	," +
"SOURCECODE	," +
"QUANTITY	," +
"TRANSTYPE	," +
"REVENUE	," +
"COMMISSION	," +
"NETCOMMISSION,	" +
"TRANSFEE" +
" FROM DB_IAW_dev_stg.IAS_COMMISSION.PRODUCTION_SHARE_TEST_REVENUES)" ;
var INS_QUERY_ENV = INS_QUERY.replaceAll("_dev_","_"+ ENV + "_");
var sql_statement2 = snowflake.createStatement({
  sqlText: INS_QUERY_ENV
});
 var result2_scan = sql_statement2.execute(); 
 var update_query = "UPDATE DB_IAW_dev_stg.IAS_COMMISSION.REVENUES 	" +
"SET 	" +
"HK_LINK= SHA1(UPPER(CONCAT(COALESCE(TRIM('IAS'), '#NULL#'), '|' , COALESCE(TRIM(REPID), '#NULL#'), '|' , COALESCE(TRIM(ADVISOR_ID), '#NULL#'), '|' ," +
"COALESCE(TRIM(PROGRAM_TYPE), '#NULL#'), '|' " +
",COALESCE(TRIM(ACCOUNTID), '#NULL#'), '|' ," +
"COALESCE(TRIM(TO_VARCHAR(PROCESSDATE)), '#NULL#'), '|' , COALESCE(TRIM(SOURCECODE), '#NULL#'), '|' ,COALESCE(TRIM(QUANTITY), '#NULL#'), '|' ,COALESCE(TRIM(TRANSTYPE), '#NULL#'))))," +
"HK_HUB_CONTRACT=DECODE(TRUE, ACCOUNTID IS NULL ,'0',SHA1(UPPER(CONCAT(COALESCE(TRIM('IAS'),'#NULL#'),'|',COALESCE(TRIM(ACCOUNTID),'#NULL#'),'|', '#NULL#' ,'|', '#NULL#' ))))," +
"HK_HUB_PARTY_ROLE_ADVISOR =DECODE(TRUE, REPID IS NULL ,'0',SHA1(UPPER(CONCAT(COALESCE(TRIM('IAS'), '#NULL#'), '|' , COALESCE(TRIM(REPID), '#NULL#')))))," +
"MD_CREATION_DT=systimestamp()" +
"Where 1=1";
var update_query_ENV = update_query.replaceAll("_dev_","_"+ ENV + "_");
var sql_statement3 = snowflake.createStatement({ 
  sqlText: update_query_ENV
});
 var result3_scan = sql_statement3.execute(); 
$$;

create procedure IAS_COMMISSION.SP_CONV_LOADSTG_IAS_COMMISSION_TO_STG_SHARE(ENV VARCHAR, I_DATA_START_DATE VARCHAR)
    returns VARCHAR
    language SQL
    strict
as
$$
DECLARE
INS_PRE_QUERY STRING;
INS_QUERY STRING;
UPD_QUERY STRING;

BEGIN
i_DATA_START_DATE :=CHAR(39)||i_DATA_START_DATE||CHAR(39);
INS_PRE_QUERY := 'DELETE FROM DB_IAW_'||ENV||'_STG.IAS_COMMISSION.SHARE WHERE 1=1;';
INS_QUERY := '
INSERT INTO DB_IAW_'||ENV||'_STG.IAS_COMMISSION.SHARE
(
MD_START_DT,
 MD_SOURCE,
	FROMREPID ,
	TOREPID ,
	SHARETYPE ,
	SOURCECODE ,
	PRODUCTCODE ,
	REVENUEPCT ,
	COMMISSIONPCT ,
	NETCOMMISSIONPCT ,
	FEEPCT ,    
	REVNO ,
	STAMP,
	MD_EXTRACT_DT ,
	MD_SRCSYSTEM
)
SELECT
TO_DATE('||i_DATA_START_DATE||',''YYYY-MM-DD''),
''DB_IAW_'||ENV||'_STAGING_POCIA.IAS_COMMISSION.SHARE'',
    FROMREPID ,
	TOREPID ,
	SHARETYPE ,
	SOURCECODE ,
	PRODUCTCODE ,
	REVENUEPCT ,
	COMMISSIONPCT ,
	NETCOMMISSIONPCT ,
	FEEPCT ,
	REVNO ,
	STAMP,
TO_DATE(CURRENT_TIMESTAMP),
	''IAS'' 
FROM DB_IAW_'||ENV||'_STAGING_POCIA.IAS_COMMISSION_POCIA.SHARE;
 ';
			  
UPD_QUERY := '
UPDATE DB_IAW_'||ENV||'_STG.IAS_COMMISSION.SHARE
SET
	HK_LINK=SHA1(UPPER(CONCAT(''IAS'' ,''|'', COALESCE(TRIM(FROMREPID), ''#NULL#''), ''|'', COALESCE(TRIM(TOREPID),''#NULL#''),''|'', COALESCE(TRIM(SHARETYPE),''#NULL#''),''|'', COALESCE(TRIM(SOURCECODE),''#NULL#''),''|'', COALESCE(TRIM(PRODUCTCODE),''#NULL#'') ))),
	HK_HUB_FROM= DECODE(TRUE, FROMREPID IS NULL ,''0'',SHA1(UPPER(CONCAT(COALESCE(TRIM(''IAS''), ''#NULL#''), ''|'' , COALESCE(TRIM(FROMREPID), ''#NULL#''))))),
	HK_HUB_TO= DECODE(TRUE, TOREPID IS NULL ,''0'',SHA1(UPPER(CONCAT(COALESCE(TRIM(''IAS''), ''#NULL#''), ''|'' , COALESCE(TRIM(TOREPID), ''#NULL#''))))),
	MD_HASHDIFF=SHA1(concat( COALESCE(TO_VARCHAR(REVENUEPCT), ''#NULL#''),''|'',
	                 COALESCE(TO_VARCHAR(COMMISSIONPCT), ''#NULL#''),''|'',
	                 COALESCE(TO_VARCHAR(NETCOMMISSIONPCT), ''#NULL#''),''|'',
				     COALESCE(TO_VARCHAR(FEEPCT), ''#NULL#''),''|'',
				     COALESCE(TO_VARCHAR(REVNO), ''#NULL#'')
				     )),	
	MD_CREATION_DT=SYSTIMESTAMP()
Where 1=1;
';


EXECUTE IMMEDIATE :INS_PRE_QUERY;
EXECUTE IMMEDIATE :INS_QUERY;
EXECUTE IMMEDIATE :UPD_QUERY;
END
$$;

create procedure IAS_COMMISSION.SP_CONV_LOADSTG_IAS_COMMISSION_TO_STG_SHAREHIST_IAS_COMMISSION(ENV VARCHAR, I_DATA_START_DATE VARCHAR)
    returns VARCHAR
    language SQL
    strict
as
$$
DECLARE
INS_PRE_QUERY STRING;
INS_QUERY STRING;

BEGIN
i_DATA_START_DATE :=CHAR(39)||i_DATA_START_DATE||CHAR(39);
INS_PRE_QUERY := 'DELETE FROM DB_IAW_'||ENV||'_STG.IAS_COMMISSION.SHAREHIST WHERE 1=1;';
INS_QUERY := '
INSERT INTO DB_IAW_'||ENV||'_STG.IAS_COMMISSION.SHAREHIST
(
MD_START_DT,
MD_SOURCE,
HISTID,
HISTOPERATION ,
HISTSTAMP ,
HISTUSERID ,
FROMREPID ,
TOREPID ,
SHARETYPE ,
SOURCECODE ,
PRODUCTCOD ,
REVENUEPCT ,
COMMISSIONPCT ,
NETCOMMISSIONPCT ,
FEEPCT ,
REVNO ,
STAMP ,
USERID ,
MD_EXTRACT_DT,
MD_SRC_SYSTEM
)
SELECT
TO_DATE('||i_DATA_START_DATE||',''YYYY-MM-DD''),
STAMP,
''DB_IAW_DEV_STAGING_POCIA.IAS_COMMISSION.SHAREHIST'',
HISTID,
HISTOPERATION ,
HISTSTAMP ,
HISTUSERID ,
FROMREPID ,
TOREPID ,
SHARETYPE ,
SOURCECODE ,
PRODUCTCOD ,
REVENUEPCT ,
COMMISSIONPCT ,
NETCOMMISSIONPCT ,
FEEPCT ,
REVNO ,
STAMP ,
USERID,
TO_DATE(CURRENT_TIMESTAMP),

''IAS''
FROM DB_IAW_DEV_STAGING_POCIA.IAS_COMMISSION_POCIA.SHAREHIST;
';

EXECUTE IMMEDIATE :INS_PRE_QUERY;
EXECUTE IMMEDIATE :INS_QUERY;
END
$$;

create procedure IAS.SP_CONV_LOADSTG_IAS_NBIN_TO_STG_FINANCIAL_TRANSACTIONS_IAVMBK(ENV VARCHAR)
    returns VARCHAR
    language SQL
    strict
as
$$
DECLARE
INS_DELETE STRING;
INS_INSERT STRING;
INS_UPDATE STRING;
BEGIN
INS_DELETE := 'DELETE FROM DB_IAW_'||ENV||'_STG.IAS.FINANCIAL_TRANSACTIONS_IAVMBK WHERE 1=1';
INS_INSERT := 'INSERT INTO DB_IAW_'||ENV||'_STG.IAS.FINANCIAL_TRANSACTIONS_IAVMBK (MD_START_DT,MD_SOURCE,A_C_ID,A_C_REPRESENTATIVE,TI_ALTERNATE_ID,TI_ALTERNATE_TI_TYPE,TRAN_ENTRY_DESCRIPTION,TRAN_USER_DESCRIPTION,TRAN_TRADING_TYPE,"TRANSACTION",TRAN_TRADING_GROSS_AMT,TRAN_TRADING_CURRENCY,TRAN_TRADING_NET_AMT,TRAN_TRADING_TRADE_DATE,TRAN_TRADING_SETT_DATE,TRAN_PROCESS_DATE,TI_SYMBOL,TRAN_QTY,TI_PRIMARY_MARKET,TRAN_TXN_REFERENCE_ID,TRAN_AMOUNT_2,MD_EXTRACT_DT,MD_SRC_SYSTEM,TI_UNDERLYING_CDN_PRICE,TI_BASIS_POINT,TI_FACE_VALUE,TI_ISSUE_PRICE,STRIKE_PRICE,TI_UNDERLYING_USD_PRICE)
SELECT
	TRAN_TRADING_TRADE_DATE,
	''IAS.PRODUCTION_SHARE_TEST_TRANSACTIONS'',
	A_C_ID,
	A_C_REPRESENTATIVE,
	TI_ALTERNATE_ID,
	TI_ALTERNATE_TI_TYPE,
	TRAN_ENTRY_DESCRIPTION,
	TRAN_USER_DESCRIPTION,
	TRAN_TRADING_TYPE,
	"TRANSACTION",
	TRAN_TRADING_GROSS_AMT,
	TRAN_TRADING_CURRENCY,
	TRAN_TRADING_NET_AMT,
	TRAN_TRADING_TRADE_DATE,
	TRAN_TRADING_SETT_DATE,
	TRAN_PROCESS_DATE,
	TI_SYMBOL,
	TRAN_QTY,
	TI_PRIMARY_MARKET,
	TRAN_TXN_REFERENCE_ID,
	TRAN_AMOUNT_2,
	--MD_SRC,
	TO_DATE(SYSTIMESTAMP()),
	MD_SRCSYSTEM,
	TI_UNDERLYING_CDN_PRICE,
	TI_BASIS_POINT,
	TI_FACE_VALUE,
	TI_ISSUE_PRICE,
	STRIKE_PRICE,
	TI_UNDERLYING_USD_PRICE
	FROM DB_IAW_'||ENV||'_STG.IAS.PRODUCTION_SHARE_TEST_TRANSACTIONS
				';
INS_UPDATE := 'UPDATE DB_IAW_'||ENV||'_STG.IAS.FINANCIAL_TRANSACTIONS_IAVMBK
SET
HK_LINK=
SHA1(UPPER(CONCAT(COALESCE(TRIM(MD_SRC_SYSTEM), ''#NULL#''), ''|'' , COALESCE(TRIM("TRANSACTION"), ''#NULL#''), ''|'' , COALESCE(TRIM(A_C_ID), ''#NULL#''), ''|'' , COALESCE(TRIM(A_C_REPRESENTATIVE), ''#NULL#''), ''|'' , COALESCE(TRIM(TI_ALTERNATE_ID), ''#NULL#'')))),
HK_HUB_CONTRACT=
--SHA1(UPPER(CONCAT(COALESCE(TRIM(MD_SRC_SYSTEM), ''#NULL#''), ''|'' , COALESCE(TRIM(A_C_ID), ''#NULL#'')))),
DECODE(TRUE, A_C_ID IS NULL ,''0'',SHA1(UPPER(CONCAT(COALESCE(TRIM(MD_SRC_SYSTEM), ''#NULL#''), ''|'' , COALESCE(TRIM(A_C_ID), ''#NULL#'') ,''|'', ''#NULL#'' ,''|'', ''#NULL#'' )))),
HK_HUB_REGISTERED_REPRESENTATIVE=
--SHA1(UPPER(CONCAT(COALESCE(TRIM(MD_SRC_SYSTEM), ''#NULL#''), ''|'' , COALESCE(TRIM(A_C_REPRESENTATIVE), ''#NULL#'')))),
DECODE(TRUE, A_C_REPRESENTATIVE IS NULL ,''0'',SHA1(UPPER(CONCAT(COALESCE(TRIM(MD_SRC_SYSTEM), ''#NULL#''), ''|'' , COALESCE(TRIM(A_C_REPRESENTATIVE), ''#NULL#''))))),
HK_HUB_INVESTMENT_PRODUCT_TYPE=
DECODE(TRUE, TI_ALTERNATE_ID IS NULL ,''0'',SHA1(UPPER(CONCAT(COALESCE(TRIM(MD_SRC_SYSTEM), ''#NULL#''), ''|'' , COALESCE(TRIM(TI_ALTERNATE_ID), ''#NULL#''))))),
MD_HASHDIFF=
SHA1(CONCAT(COALESCE(TI_ALTERNATE_TI_TYPE, ''#NULL#''), ''|'',COALESCE(TRAN_ENTRY_DESCRIPTION, ''#NULL#''), ''|'' , COALESCE(TRAN_USER_DESCRIPTION, ''#NULL#''), ''|'' ,
COALESCE(TRAN_TRADING_TYPE, ''#NULL#''), ''|'' , COALESCE(TO_VARCHAR(TRAN_TRADING_GROSS_AMT),''#NULL#''), ''|'',
COALESCE(TRAN_TRADING_CURRENCY,''#NULL#''), ''|'', COALESCE(TO_VARCHAR(TRAN_TRADING_NET_AMT),''#NULL#'') , ''|'', COALESCE(TO_VARCHAR(TRAN_TRADING_TRADE_DATE),''#NULL#''), ''|'', COALESCE(TO_VARCHAR(TRAN_TRADING_SETT_DATE),''#NULL#''), ''|'', COALESCE(TO_VARCHAR(TRAN_PROCESS_DATE),''#NULL#'')
, ''|'', COALESCE(TI_SYMBOL,''#NULL#''), ''|'', COALESCE(TO_VARCHAR(TRAN_QTY),''#NULL#''), ''|'', COALESCE(TO_VARCHAR(TI_PRIMARY_MARKET),''#NULL#'')
, ''|'', COALESCE(TO_VARCHAR(TRAN_TXN_REFERENCE_ID),''#NULL#''), ''|'', COALESCE(TO_VARCHAR(TRAN_AMOUNT_2),''#NULL#''), ''|'', COALESCE(TO_VARCHAR(TI_UNDERLYING_CDN_PRICE),''#NULL#'')
, ''|'', COALESCE(TO_VARCHAR(TI_BASIS_POINT),''#NULL#''), ''|'', COALESCE(TO_VARCHAR(TI_FACE_VALUE),''#NULL#''), ''|'', COALESCE(TO_VARCHAR(TI_ISSUE_PRICE),''#NULL#'')
, ''|'', COALESCE(TO_VARCHAR(STRIKE_PRICE),''#NULL#''), ''|'', COALESCE(TO_VARCHAR(TI_UNDERLYING_USD_PRICE),''#NULL#'')
)),	
MD_CREATION_DT=SYSTIMESTAMP()
Where 1=1
				';
EXECUTE IMMEDIATE :INS_DELETE;
EXECUTE IMMEDIATE :INS_INSERT;
EXECUTE IMMEDIATE :INS_UPDATE;
END
$$;

create procedure IAS.SP_CONV_LOADSTG_IAS_NBIN_TO_STG_FINANCIAL_TRANSACTIONS_IAVMBK_IAPW(ENV VARCHAR, IO_PATH VARCHAR)
    returns VARCHAR
    language SQL
    strict
as
$$
DECLARE
INS_PRE_QUERY STRING;
INS_COPY_QUERY STRING;
INS_UPDATE STRING;
BEGIN
INS_PRE_QUERY := 'DELETE FROM DB_IAW_'||ENV||'_STG.IAS.FINANCIAL_TRANSACTIONS_IAVMBK WHERE 1=1;';
INS_COPY_QUERY := '
COPY INTO
	DB_IAW_'||ENV||'_STG.IAS.FINANCIAL_TRANSACTIONS_IAVMBK (
	MD_SOURCE,
	A_C_ID,
	A_C_REPRESENTATIVE,
	TI_ALTERNATE_ID, 
	TI_ALTERNATE_TI_TYPE, 
	TRAN_ENTRY_DESCRIPTION, 
	TRAN_USER_DESCRIPTION, 
	TRAN_TRADING_TYPE, 
	TRANSACTION, 
	TRAN_TRADING_GROSS_AMT, 
	TRAN_TRADING_CURRENCY, 
	TRAN_TRADING_NET_AMT, 
	TRAN_TRADING_TRADE_DATE, 
	TRAN_TRADING_SETT_DATE, 
	TRAN_PROCESS_DATE, 
	TI_SYMBOL, 
	TRAN_QTY, 
	TI_PRIMARY_MARKET, 
	TRAN_TXN_REFERENCE_ID, 
	TRAN_AMOUNT_2, 
	MD_EXTRACT_DT,
	MD_SRC_SYSTEM,
	TI_UNDERLYING_CDN_PRICE, 
	TI_BASIS_POINT, 
	TI_FACE_VALUE, 
	TI_ISSUE_PRICE, 
	STRIKE_PRICE, 
	TI_UNDERLYING_USD_PRICE )
FROM
	(
	SELECT
		metadata$filename,t.$1, t.$2, t.$3, t.$4, t.$5, t.$6, t.$7, t.$8, t.$9, t.$10,t.$11, t.$12, t.$13, t.$14, t.$15, t.$16, t.$17, t.$18, t.$19, t.$21
		,t.$22, t.$23, t.$24, t.$25, t.$26, t.$27, t.$28
	FROM
		@DATALAKE.'||io_PATH||' T
	) pattern = ''.*MISSING_TRANSACTIONS.csv'' file_format =(format_name = DB_IAW_'||ENV||'_STG.IAS.PIPE_UTF16);
              ';
INS_UPDATE := '
UPDATE DB_IAW_'||ENV||'_STG.IAS.FINANCIAL_TRANSACTIONS_IAVMBK
SET 
	HK_LINK=
	SHA1(UPPER(CONCAT(COALESCE(TRIM(MD_SRC_SYSTEM), ''#NULL#''), ''|'' , COALESCE(TRIM(TRANSACTION), ''#NULL#''), ''|'' , COALESCE(TRIM(A_C_ID), ''#NULL#''), ''|'' , COALESCE(TRIM(A_C_REPRESENTATIVE), ''#NULL#''), ''|'' , COALESCE(TRIM(TI_ALTERNATE_ID), ''#NULL#'')))),

	HK_HUB_CONTRACT=
	DECODE(TRUE, A_C_ID IS NULL ,''0'',SHA1(UPPER(CONCAT(COALESCE(TRIM(MD_SRC_SYSTEM), ''#NULL#''), ''|'' , COALESCE(TRIM(A_C_ID), ''#NULL#'') ,''|'', ''#NULL#'' ,''|'', ''#NULL#'' )))),

	HK_HUB_REGISTERED_REPRESENTATIVE=
	DECODE(TRUE, A_C_REPRESENTATIVE IS NULL ,''0'',SHA1(UPPER(CONCAT(COALESCE(TRIM(MD_SRC_SYSTEM), ''#NULL#''), ''|'' , COALESCE(TRIM(A_C_REPRESENTATIVE), ''#NULL#''))))),

	HK_HUB_INVESTMENT_PRODUCT_TYPE=
	DECODE(TRUE, TI_ALTERNATE_ID IS NULL ,''0'',SHA1(UPPER(CONCAT(COALESCE(TRIM(MD_SRC_SYSTEM), ''#NULL#''), ''|'' , COALESCE(TRIM(TI_ALTERNATE_ID), ''#NULL#''))))),

	MD_HASHDIFF=
	SHA1(CONCAT(COALESCE(TI_ALTERNATE_TI_TYPE, ''#NULL#''), ''|'',COALESCE(TRAN_ENTRY_DESCRIPTION, ''#NULL#''), ''|'' , COALESCE(TRAN_USER_DESCRIPTION, ''#NULL#''), ''|'' , 
	COALESCE(TRAN_TRADING_TYPE, ''#NULL#''), ''|'' , COALESCE(TO_VARCHAR(TRAN_TRADING_GROSS_AMT),''#NULL#''), ''|'', 
	COALESCE(TRAN_TRADING_CURRENCY,''#NULL#''), ''|'', COALESCE(TO_VARCHAR(TRAN_TRADING_NET_AMT),''#NULL#'') , ''|'', COALESCE(TO_VARCHAR(TRAN_TRADING_TRADE_DATE),''#NULL#''), ''|'', COALESCE(TO_VARCHAR(TRAN_TRADING_SETT_DATE),''#NULL#''), ''|'', COALESCE(TO_VARCHAR(TRAN_PROCESS_DATE),''#NULL#'')
	, ''|'', COALESCE(TI_SYMBOL,''#NULL#''), ''|'', COALESCE(TO_VARCHAR(TRAN_QTY),''#NULL#''), ''|'', COALESCE(TO_VARCHAR(TI_PRIMARY_MARKET),''#NULL#'')
	, ''|'', COALESCE(TO_VARCHAR(TRAN_TXN_REFERENCE_ID),''#NULL#''), ''|'', COALESCE(TO_VARCHAR(TRAN_AMOUNT_2),''#NULL#''), ''|'', COALESCE(TO_VARCHAR(TI_UNDERLYING_CDN_PRICE),''#NULL#'')
	, ''|'', COALESCE(TO_VARCHAR(TI_BASIS_POINT),''#NULL#''), ''|'', COALESCE(TO_VARCHAR(TI_FACE_VALUE),''#NULL#''), ''|'', COALESCE(TO_VARCHAR(TI_ISSUE_PRICE),''#NULL#'')
	, ''|'', COALESCE(TO_VARCHAR(STRIKE_PRICE),''#NULL#''), ''|'', COALESCE(TO_VARCHAR(TI_UNDERLYING_USD_PRICE),''#NULL#'')
	)),	
	MD_CREATION_DT=SYSTIMESTAMP(),
	MD_START_DT = DATEADD(DAY,1,TRAN_PROCESS_DATE)
Where 1=1;
';
EXECUTE IMMEDIATE :INS_PRE_QUERY;
EXECUTE IMMEDIATE :INS_COPY_QUERY;
EXECUTE IMMEDIATE :INS_UPDATE;
END
$$;

create procedure PUBLIC.SP_CONV_LOADSTG_IAS_NBIN_TO_STG_FINANCIAL_TRANSACTIONS_IAVMBK_IAPW(ENV VARCHAR, IO_PATH VARCHAR)
    returns VARCHAR
    language SQL
    strict
as
$$
DECLARE
INS_PRE_QUERY STRING;
INS_COPY_QUERY STRING;
INS_UPDATE STRING;
BEGIN
INS_PRE_QUERY := 'DELETE FROM DB_IAW_'||ENV||'_STG.IAS.FINANCIAL_TRANSACTIONS_IAVMBK WHERE 1=1;';
INS_COPY_QUERY := '
COPY INTO
	DB_IAW_'||ENV||'_STG.IAS.FINANCIAL_TRANSACTIONS_IAVMBK (
	MD_SOURCE,
	A_C_ID,
	A_C_REPRESENTATIVE,
	TI_ALTERNATE_ID, 
	TI_ALTERNATE_TI_TYPE, 
	TRAN_ENTRY_DESCRIPTION, 
	TRAN_USER_DESCRIPTION, 
	TRAN_TRADING_TYPE, 
	TRANSACTION, 
	TRAN_TRADING_GROSS_AMT, 
	TRAN_TRADING_CURRENCY, 
	TRAN_TRADING_NET_AMT, 
	TRAN_TRADING_TRADE_DATE, 
	TRAN_TRADING_SETT_DATE, 
	TRAN_PROCESS_DATE, 
	TI_SYMBOL, 
	TRAN_QTY, 
	TI_PRIMARY_MARKET, 
	TRAN_TXN_REFERENCE_ID, 
	TRAN_AMOUNT_2, 
	MD_EXTRACT_DT,
	MD_SRC_SYSTEM,
	TI_UNDERLYING_CDN_PRICE, 
	TI_BASIS_POINT, 
	TI_FACE_VALUE, 
	TI_ISSUE_PRICE, 
	STRIKE_PRICE, 
	TI_UNDERLYING_USD_PRICE )
FROM
	(
	SELECT
		metadata$filename,t.$1, t.$2, t.$3, t.$4, t.$5, t.$6, t.$7, t.$8, t.$9, t.$10,t.$11, t.$12, t.$13, t.$14, t.$15, t.$16, t.$17, t.$18, t.$19, t.$21
		,t.$22, t.$23, t.$24, t.$25, t.$26, t.$27, t.$28
	FROM
		@DATALAKE.'||io_PATH||' T
	) pattern = ''.*MISSING_TRANSACTIONS.csv'' file_format =(format_name = DB_IAW_'||ENV||'_STG.IAS.PIPE_UTF16);
              ';
INS_UPDATE := '
UPDATE DB_IAW_'||ENV||'_STG.IAS.FINANCIAL_TRANSACTIONS_IAVMBK
SET 
	HK_LINK=
	SHA1(UPPER(CONCAT(COALESCE(TRIM(MD_SRC_SYSTEM), ''#NULL#''), ''|'' , COALESCE(TRIM(TRANSACTION), ''#NULL#''), ''|'' , COALESCE(TRIM(A_C_ID), ''#NULL#''), ''|'' , COALESCE(TRIM(A_C_REPRESENTATIVE), ''#NULL#''), ''|'' , COALESCE(TRIM(TI_ALTERNATE_ID), ''#NULL#'')))),

	HK_HUB_CONTRACT=
	DECODE(TRUE, A_C_ID IS NULL ,''0'',SHA1(UPPER(CONCAT(COALESCE(TRIM(MD_SRC_SYSTEM), ''#NULL#''), ''|'' , COALESCE(TRIM(A_C_ID), ''#NULL#'') ,''|'', ''#NULL#'' ,''|'', ''#NULL#'' )))),

	HK_HUB_REGISTERED_REPRESENTATIVE=
	DECODE(TRUE, A_C_REPRESENTATIVE IS NULL ,''0'',SHA1(UPPER(CONCAT(COALESCE(TRIM(MD_SRC_SYSTEM), ''#NULL#''), ''|'' , COALESCE(TRIM(A_C_REPRESENTATIVE), ''#NULL#''))))),

	HK_HUB_INVESTMENT_PRODUCT_TYPE=
	DECODE(TRUE, TI_ALTERNATE_ID IS NULL ,''0'',SHA1(UPPER(CONCAT(COALESCE(TRIM(MD_SRC_SYSTEM), ''#NULL#''), ''|'' , COALESCE(TRIM(TI_ALTERNATE_ID), ''#NULL#''))))),

	MD_HASHDIFF=
	SHA1(CONCAT(COALESCE(TI_ALTERNATE_TI_TYPE, ''#NULL#''), ''|'',COALESCE(TRAN_ENTRY_DESCRIPTION, ''#NULL#''), ''|'' , COALESCE(TRAN_USER_DESCRIPTION, ''#NULL#''), ''|'' , 
	COALESCE(TRAN_TRADING_TYPE, ''#NULL#''), ''|'' , COALESCE(TO_VARCHAR(TRAN_TRADING_GROSS_AMT),''#NULL#''), ''|'', 
	COALESCE(TRAN_TRADING_CURRENCY,''#NULL#''), ''|'', COALESCE(TO_VARCHAR(TRAN_TRADING_NET_AMT),''#NULL#'') , ''|'', COALESCE(TO_VARCHAR(TRAN_TRADING_TRADE_DATE),''#NULL#''), ''|'', COALESCE(TO_VARCHAR(TRAN_TRADING_SETT_DATE),''#NULL#''), ''|'', COALESCE(TO_VARCHAR(TRAN_PROCESS_DATE),''#NULL#'')
	, ''|'', COALESCE(TI_SYMBOL,''#NULL#''), ''|'', COALESCE(TO_VARCHAR(TRAN_QTY),''#NULL#''), ''|'', COALESCE(TO_VARCHAR(TI_PRIMARY_MARKET),''#NULL#'')
	, ''|'', COALESCE(TO_VARCHAR(TRAN_TXN_REFERENCE_ID),''#NULL#''), ''|'', COALESCE(TO_VARCHAR(TRAN_AMOUNT_2),''#NULL#''), ''|'', COALESCE(TO_VARCHAR(TI_UNDERLYING_CDN_PRICE),''#NULL#'')
	, ''|'', COALESCE(TO_VARCHAR(TI_BASIS_POINT),''#NULL#''), ''|'', COALESCE(TO_VARCHAR(TI_FACE_VALUE),''#NULL#''), ''|'', COALESCE(TO_VARCHAR(TI_ISSUE_PRICE),''#NULL#'')
	, ''|'', COALESCE(TO_VARCHAR(STRIKE_PRICE),''#NULL#''), ''|'', COALESCE(TO_VARCHAR(TI_UNDERLYING_USD_PRICE),''#NULL#'')
	)),	
	MD_CREATION_DT=SYSTIMESTAMP(),
	MD_START_DT = DATEADD(DAY,1,TRAN_PROCESS_DATE)
Where 1=1;
';
EXECUTE IMMEDIATE :INS_PRE_QUERY;
EXECUTE IMMEDIATE :INS_COPY_QUERY;
EXECUTE IMMEDIATE :INS_UPDATE;
END
$$;

create procedure STEWARDSHIP.SP_CONV_LOADSTG_IAS_STEWARDSHIP_TO_STG_REF_MAPPING_OPER_TYPE(ENV VARCHAR)
    returns VARCHAR
    language javascript
as
$$ 
var delete_query = "DELETE FROM DB_IAW_<env>_stg.STEWARDSHIP.REF_MAPPING_OPER_TYPE WHERE 1=1";
var delete_query_ENV = delete_query.replaceAll("_<env>_","_"+ ENV + "_");
var sql_statement1 = snowflake.createStatement({
  sqlText: delete_query_ENV
});
var result1_scan = sql_statement1.execute(); 
INS_QUERY = "INSERT INTO DB_IAW_<env>_stg.STEWARDSHIP.REF_MAPPING_OPER_TYPE "+
"("+
"MD_START_DT,"+
"MD_SOURCE,"+
"DESCRIPTION_EN, "+
"DESCRIPTION_SHORT_EN, "+
"DESCRIPTION_FR, "+
"DESCRIPTION_SHORT_FR, "+
"IBMSOURCE, "+
'"LEVEL", '+
"OPERATION_TYPE, "+
"DISPLAY, "+
"CASHFLOW_SUMMARY, "+
"ISCASHFLOW,"+
"MD_EXTRACT_DT,"+
"MD_SRC_SYSTEM"+
") "+
"SELECT "+
"'2019-01-01',"+
"'DB_IAW_<env>_stg.STEWARDSHIP.PRODUCTION_SHARE_TEST_MAPPING_OPER_TYPE',"+
"DESCRIPTION_EN, "+
"DESCRIPTION_SHORT_EN, "+
"DESCRIPTION_FR, "+
"DESCRIPTION_SHORT_FR, "+
"IBMSOURCE, "+
'"LEVEL", '+
"OPERATION_TYPE, "+
"DISPLAY, "+
"CASHFLOW_SUMMARY, "+
"ISCASHFLOW,"+
"TO_DATE(SYSTIMESTAMP()),"+
"'STEWARDSHIP'"+
"FROM DB_IAW_<env>_stg.STEWARDSHIP.PRODUCTION_SHARE_TEST_MAPPING_OPER_TYPE";
var INS_QUERY_ENV = INS_QUERY.replaceAll("_<env>_","_"+ ENV + "_");
var sql_statement2 = snowflake.createStatement({
  sqlText: INS_QUERY_ENV
});
 var result2_scan = sql_statement2.execute(); 
 var update_query = "UPDATE DB_IAW_<env>_stg.STEWARDSHIP.REF_MAPPING_OPER_TYPE "+
 "SET "+
 "HK_HUB="+
 "SHA1(UPPER(CONCAT(COALESCE(TRIM(IBMSOURCE), '#NULL#'), '|' , COALESCE(TRIM(TO_VARCHAR(" + '"LEVEL"'+")), '#NULL#'), '|' , COALESCE(TRIM(MD_SRC_SYSTEM), '#NULL#') ))), "+
 "MD_HASHDIFF="+
 "SHA1(CONCAT(COALESCE(DESCRIPTION_EN, '#NULL#')"+
 ", '|', COALESCE(DESCRIPTION_SHORT_EN, '#NULL#')"+
 ", '|', COALESCE(DESCRIPTION_FR, '#NULL#')"+
 ", '|', COALESCE(DESCRIPTION_SHORT_FR, '#NULL#')"+
 ", '|', COALESCE(OPERATION_TYPE, '#NULL#')"+
 ", '|', COALESCE(TO_VARCHAR(DISPLAY), '#NULL#')"+
 ", '|', COALESCE(CASHFLOW_SUMMARY, '#NULL#')"+
 ", '|', COALESCE(TO_VARCHAR(ISCASHFLOW), '#NULL#')"+
 ")),	"+
 "MD_CREATION_DT=systimestamp()"+
 "Where 1=1";
var update_query_ENV = update_query.replaceAll("_<env>_","_"+ ENV + "_");
var sql_statement3 = snowflake.createStatement({ 
  sqlText: update_query_ENV
});
 var result3_scan = sql_statement3.execute(); 
$$;

create procedure STEWARDSHIP.SP_CONV_LOADSTG_IAS_TO_STG_REF_MANUAL_ADVISOR_RVP(ENV VARCHAR, I_DATA_START_DATE VARCHAR)
    returns VARCHAR
    language SQL
    strict
as
$$
DECLARE
INS_PRE_QUERY STRING;
INS_QUERY STRING;
UPD_QUERY STRING;

BEGIN
i_DATA_START_DATE :=CHAR(39)||i_DATA_START_DATE||CHAR(39);
INS_PRE_QUERY := 'DELETE FROM DB_IAW_'||ENV||'_STG.STEWARDSHIP.REF_MANUAL_ADVISOR_RVP WHERE 1=1;';
INS_QUERY := '
INSERT INTO DB_IAW_'||ENV||'_STG.STEWARDSHIP.REF_MANUAL_ADVISOR_RVP
(
MD_START_DT,
MD_SOURCE,
ADVISOR,
TEAM,
REPID,
RVP,
PROVINCE ,
IND_EXCLUDE,
MD_EXTRACT_DT,
MD_SRC_SYSTEM
)
SELECT
TO_DATE('||i_DATA_START_DATE||',''YYYY-MM-DD''),
''STEWARDSHIP.PRODUCTION_SHARE_TEST_MANUAL_ADVISOR_RVP'',
ADVISOR,
TEAM,
REPID,
RVP,
PROVINCE,
EXCLUDE,
TO_DATE(CURRENT_TIMESTAMP),
''STEWARDSHIP''
FROM STEWARDSHIP.PRODUCTION_SHARE_TEST_MANUAL_ADVISOR_RVP;
              ';
			  
UPD_QUERY := '
UPDATE DB_IAW_'||ENV||'_STG.STEWARDSHIP.REF_MANUAL_ADVISOR_RVP
SET
HK_HUB=
SHA1(UPPER(CONCAT(COALESCE(TRIM(MD_SRC_SYSTEM), ''#NULL#''), ''|'' , COALESCE(TRIM(REPID), ''#NULL#'')))),
MD_HASHDIFF=
SHA1(CONCAT(
   COALESCE(ADVISOR, ''#NULL#''), ''|''
,  COALESCE(TEAM, ''#NULL#''), ''|''
,  COALESCE(RVP, ''#NULL#''), ''|''
,  COALESCE(PROVINCE, ''#NULL#''), ''|''
,  COALESCE(TO_VARCHAR(IND_EXCLUDE), ''#NULL#'')
)),	
MD_CREATION_DT=systimestamp()
Where 1=1;
';


EXECUTE IMMEDIATE :INS_PRE_QUERY;
EXECUTE IMMEDIATE :INS_QUERY;
EXECUTE IMMEDIATE :UPD_QUERY;
END
$$;

create procedure STEWARDSHIP.SP_CONV_LOADSTG_IAS_TO_STG_REF_MONTHLY_MILESTONES(ENV VARCHAR, I_DATA_START_DATE VARCHAR)
    returns VARCHAR
    language SQL
    strict
as
$$
DECLARE
INS_PRE_QUERY STRING;
INS_QUERY STRING;
UPD_QUERY STRING;

BEGIN
i_DATA_START_DATE :=CHAR(39)||i_DATA_START_DATE||CHAR(39);
INS_PRE_QUERY := 'DELETE FROM DB_IAW_'||ENV||'_STG.STEWARDSHIP.REF_MONTHLY_MILESTONES WHERE 1=1;';
INS_QUERY := '
INSERT INTO DB_IAW_'||ENV||'_STG.STEWARDSHIP.REF_MONTHLY_MILESTONES
(
MD_START_DT,
MD_SOURCE,
ADVISOR ,
TEAM ,
REPID ,
RVP ,
PROVINCE,
AUA_DEC,
AUA_JAN,
AUA_FEB,
MD_EXTRACT_DT,
MD_SRC_SYSTEM
)
SELECT
TO_DATE('||i_DATA_START_DATE||',''YYYY-MM-DD''),
''STEWARDSHIP.PRODUCTION_SHARE_TEST_MONTHLY_MILESTONES'',
ADVISOR,
TEAM,
REPID,
RVP,
PROVINCE,
AUA_DEC,
AUA_JAN,
AUA_FEB,
TO_DATE(SYSTIMESTAMP()),
''STEWARDSHIP''
FROM STEWARDSHIP.PRODUCTION_SHARE_TEST_MONTHLY_MILESTONES;
 ';
 UPD_QUERY := '
UPDATE DB_IAW_'||ENV||'_STG.STEWARDSHIP.REF_MONTHLY_MILESTONES
SET
HK_HUB=
SHA1(UPPER(CONCAT(COALESCE(TRIM(MD_SRC_SYSTEM), ''NULL#''), ''|'' , COALESCE(TRIM(REPID), ''#NULL#'')))),
MD_HASHDIFF=
SHA1(CONCAT(
   COALESCE(ADVISOR, ''#NULL#''), ''|''
,  COALESCE(TEAM, ''#NULL#''), ''|''
,  COALESCE(RVP, ''#NULL#''), ''|''
,  COALESCE(PROVINCE, ''#NULL#''), ''|''
,  COALESCE(TO_VARCHAR(AUA_DEC), ''#NULL#''), ''|''
,  COALESCE(TO_VARCHAR(AUA_JAN), ''#NULL#''), ''|''
,  COALESCE(TO_VARCHAR(AUA_FEB), ''#NULL#'')
)),	
MD_CREATION_DT=systimestamp()
Where 1=1;
';

EXECUTE IMMEDIATE :INS_PRE_QUERY;
EXECUTE IMMEDIATE :INS_QUERY;
EXECUTE IMMEDIATE :UPD_QUERY;
END
$$;

create procedure STEWARDSHIP.SP_CONV_LOADSTG_IAS_TO_STG_REF_PRODUCT_ASSET_CATEGORY(ENV VARCHAR, I_DATA_START_DATE VARCHAR)
    returns VARCHAR
    language SQL
    strict
as
$$
DECLARE
INS_PRE_DEL STRING;
INS_INSERT STRING;
INS_UPDATE STRING;

BEGIN
i_DATA_START_DATE :=CHAR(39)||i_DATA_START_DATE||CHAR(39);
INS_PRE_DEL := 'DELETE FROM DB_IAW_'||ENV||'_STG.STEWARDSHIP.REF_PRODUCT_ASSET_CATEGORY WHERE 1=1; ';
INS_INSERT := '
INSERT INTO DB_IAW_'||ENV||'_STG.STEWARDSHIP.REF_PRODUCT_ASSET_CATEGORY(
MD_START_DT,
MD_SOURCE,
TI_ALTERNATE_TI_TYPE,
ASSET_CATEGORY,
MD_EXTRACT_DT,
MD_SRC_SYSTEM 
) 
SELECT 
	TO_DATE('||i_DATA_START_DATE||',''YYYY-MM-DD''),
	''DB_IAW_'||ENV||'_STG.STEWARDSHIP.PRODUCTION_SHARE_TEST_PRODUCT_ASSET_CATEGORY'',
	TI_ALTERNATE_TI_TYPE, 
	ASSET_CATEGORY,
	CURRENT_TIMESTAMP,
	''STEWARDSHIP''
	FROM DB_IAW_'||ENV||'_STG.STEWARDSHIP.PRODUCTION_SHARE_TEST_PRODUCT_ASSET_CATEGORY;
			 ';

INS_UPDATE :=' UPDATE DB_IAW_'||ENV||'_STG.STEWARDSHIP.REF_PRODUCT_ASSET_CATEGORY

SET 
	HK_HUB=
	SHA1(UPPER(CONCAT(COALESCE(TRIM(MD_SRC_SYSTEM), ''#NULL#''), ''|'' , COALESCE(TRIM(TI_ALTERNATE_TI_TYPE), ''#NULL#'')))),

	MD_HASHDIFF=
	SHA1(CONCAT(COALESCE(ASSET_CATEGORY, ''#NULL#'') )),	
	MD_CREATION_DT=systimestamp()

WHERE 1=1;
			';
EXECUTE IMMEDIATE :INS_PRE_DEL;
EXECUTE IMMEDIATE :INS_INSERT;
EXECUTE IMMEDIATE :INS_UPDATE;

END
$$;

create procedure STEWARDSHIP.SP_CONV_LOADSTG_IAS_TO_STG_REF_RAPCODE_PLAN(ENV VARCHAR, IO_PATH VARCHAR)
    returns VARCHAR
    language SQL
    strict
as
$$
DECLARE
INS_PRE_DEL STRING;
INS_PRE_INSERT STRING;
INS_POST_UPDATE STRING;
BEGIN
INS_PRE_DEL :='DELETE FROM DB_IAW_'||ENV||'_STG.STEWARDSHIP.REF_RAPCODE_PLAN WHERE 1=1';
INS_PRE_INSERT :='INSERT INTO DB_IAW_'||ENV||'_STG.STEWARDSHIP.REF_RAPCODE_PLAN
(
	MD_START_DT,
	MD_SOURCE,
	ACCOUNT_RAP_CODE,
	RETAIL_PLAN,
	PLAN_LABEL,
	ACCOUNT_TYPE,
	GROUP_TYPE_CODE,
	ASC_1_RESP_PLAN_TYPES,
	ACCUMULATION_TYPE,
	MD_EXTRACT_DT,
	MD_SRC_SYSTEM
)
SELECT
	''2019-01-01'',
	''DB_IAW_DEV_DATAMART_POCIA.BR.IAS_RAPCODE_PLAN'',
	ACCOUNT_RAP_CODE,
	RETAIL_PLAN,
	PLAN_LABEL,
	ACCOUNT_TYPE,
	GROUP_TYPE_CODE,
	ASC_1_RESP_PLAN_TYPES,
	ACCUMULATION_TYPE,
	TO_DATE(SYSTIMESTAMP()),
	''STEWARDSHIP''
FROM DB_IAW_'||ENV||'_DATAMART_POCIA.BR.IAS_RAPCODE_PLAN';

INS_POST_UPDATE := '
UPDATE DB_IAW_'||ENV||'_STG.STEWARDSHIP.REF_RAPCODE_PLAN
SET
HK_HUB=
SHA1(UPPER(CONCAT(COALESCE(TRIM(MD_SRC_SYSTEM), ''#NULL#''), ''|''
,  COALESCE(TRIM(ACCOUNT_RAP_CODE), ''#NULL#''), ''|''
,  COALESCE(TRIM(RETAIL_PLAN), ''#NULL#''), ''|''
,  COALESCE(TRIM(ASC_1_RESP_PLAN_TYPES), ''#NULL#'')
))),
MD_HASHDIFF=
SHA1(CONCAT(
   COALESCE(PLAN_LABEL, ''#NULL#''), ''|''
,  COALESCE(ACCOUNT_TYPE, ''#NULL#''), ''|''
,  COALESCE(GROUP_TYPE_CODE, ''#NULL#''), ''|''
,  COALESCE(ACCUMULATION_TYPE, ''#NULL#'')
)),	
MD_CREATION_DT=systimestamp()
Where 1=1';

EXECUTE IMMEDIATE :INS_PRE_DEL;
EXECUTE IMMEDIATE :INS_PRE_INSERT;
EXECUTE IMMEDIATE :INS_POST_UPDATE;
END
$$;

create procedure IAS_UNIVERIS.SP_CONV_LOADSTG_IAS_UNIVERIS_TO_STG_COM_PRODUCTION(ENV VARCHAR)
    returns VARCHAR
    language javascript
as
$$
var truncate_query = "TRUNCATE TABLE DB_IAW_" + ENV + "_stg.IAS_UNIVERIS.S_COM_PRODUCTION"; 

var sql_statement = snowflake.createStatement(
          {
          sqlText: truncate_query
          }
       );
var result_scan = sql_statement.execute();	
 var ins_query = "INSERT INTO DB_IAW_" + ENV + "_stg.IAS_UNIVERIS.S_COM_PRODUCTION(" 
                + "MD_START_DT,MD_SOURCE,COM_PRODUCTION_CD,COM_PRODUCTION_MNEM,COM_PRODUCTION_DESC,COM_PRODUCTION_LONG_DESC,COM_PRODUCTION_MNEM_ENG,COM_PRODUCTION_MNEM_FRE,COM_PRODUCTION_DESC_ENG,"
                + "COM_PRODUCTION_DESC_FRE,COM_PRODUCTION_LONG_DESC_ENG,COM_PRODUCTION_LONG_DESC_FRE,CRC_TRND_RPT_CAT,COMMISSION_LEVEL,CAC_TYPE_CD,ACC_REPORT_IND,MD_SRC_SYSTEM,MD_EXTRACT_DT) " 
               + "SELECT '2019-01-01','DB_IAW_PROD_STAGING_POCIA.IAS_UNIVERIS.S_COM_PRODUCTION',COM_PROD_CD,COM_PROD_MNEM,COM_PROD_DESC,COM_PROD_LONG_DESC,COM_PROD_MNEM_ENG,COM_PROD_MNEM_FRE,COM_PROD_DESC_ENG,"
                + "COM_PROD_DESC_FRE,COM_PROD_LONG_DESC_ENG,COM_PROD_LONG_DESC_FRE,CRC_TRND_RPT_CAT,COMMISSION_LEVEL,CAC_TYPE_CD,ACC_REPORT_IND,'IAS-UNIVERIS',TO_DATE(SYSTIMESTAMP())"
                + " FROM  DB_IAW_" + ENV + "_stg_pocia.IAS_UNIVERIS_POCIA.S_COM_PROD";
   
sql_statement = snowflake.createStatement(
          {
          sqlText: ins_query
          });
 result_scan = sql_statement.execute();	

$$;

create procedure IAS_UNIVERIS.SP_CONV_LOADSTG_IAS_UNIVERIS_TO_STG_HOLDINGS(ENV VARCHAR, IO_PATH VARCHAR)
    returns VARCHAR
    language SQL
    strict
as
$$
DECLARE
INS_PRE_DEL STRING;
INS_PRE_COPY STRING;
INS_UPDATE STRING;
BEGIN
INS_PRE_DEL := 'DELETE FROM DB_IAW_'||ENV||'_STG.IAS_UNIVERIS.HOLDINGS WHERE 1=1';
INS_PRE_COPY := '
COPY INTO DB_IAW_'||ENV||'_STG.IAS_UNIVERIS.HOLDINGS
 (
	  MD_START_DT
	, MD_SOURCE	
	, MD_SEQ
	, ACT_SYSID
	, IVD_SYSID
	, REP_SYSID
	, IVR_SYSID
	, PLN_SYSID
	, FISCAL_SYSID
	, BAL_DATE
	, MV
	, CURRENCY_CD
	, EXCH_DT
	, EXCH_RATE
	, AUA
	, PRICE
	, UNITS
	, BV
	, ACB
	, NI_T
	, NI_P
	, FREQ_CD
	, UNITS_TRD_DT
	, FISCAL_TD_UNITS
	, IVD_LOAD_FLAG
	, WF_IND	
	, MD_EXTRACT_DT
	, MD_SRC_SYSTEM
	
	)
FROM
	(
	SELECT
		TO_DATE(split_part(split_part(metadata$filename, ''__'', 2), ''.'', 0)),metadata$filename, metadata$file_row_number,
		t.$1, t.$2, t.$3, t.$4, t.$5, t.$6, t.$7, t.$8, t.$9, t.$10, t.$11, t.$12, t.$13, t.$14, t.$15, t.$16, t.$17, t.$18, t.$19, t.$20, t.$21, t.$22, t.$23, t.$24, t.$25
	FROM
		@DATALAKE.'||IO_PATH||' t
	) pattern = ''.*/HOLDINGS_.*csv'' file_format =(format_name = DB_IAW_'||ENV||'_STG.IAS.PIPE_UTF16)
		';
	
INS_UPDATE:='UPDATE DB_IAW_'||ENV||'_STG.IAS_UNIVERIS.HOLDINGS
SET
	HK_LINK = SHA1(UPPER(CONCAT(
	  COALESCE(TRIM(MD_SEQ), ''#NULL#''), ''|''
	, COALESCE(TRIM(MD_SRC_SYSTEM), ''#NULL#''), ''|''
	, COALESCE(TRIM(MD_EXTRACT_DT), ''#NULL#''), ''|''
	, ''#NULL#'', ''|''
	, COALESCE(TRIM(IVD_SYSID), ''#NULL#''), ''|''
	, COALESCE(TRIM(PLN_SYSID), ''#NULL#''), ''|''
	, COALESCE(TRIM(IVR_SYSID), ''#NULL#'')
	))),
	HK_HUB_CONTRACT = DECODE(TRUE, PLN_SYSID IS NULL AND IVR_SYSID IS NULL ,''0'',SHA1(UPPER(CONCAT(COALESCE(TRIM(MD_SRC_SYSTEM), ''#NULL#''), ''|'' ,''#NULL#'',''|'', COALESCE(TRIM(PLN_SYSID), ''#NULL#'')	,''|'', COALESCE(TRIM(IVR_SYSID), ''#NULL#''))))),
	HK_HUB_INVESTMENT_PRODUCT_TYPE = DECODE(TRUE, IVD_SYSID IS NULL ,''0'',SHA1(UPPER(CONCAT(COALESCE(TRIM(MD_SRC_SYSTEM), ''#NULL#''), ''|'' , COALESCE(TRIM(IVD_SYSID), ''#NULL#''))))),
	MD_HASHDIFF=SHA1(CONCAT(
	  COALESCE(TO_VARCHAR(ACT_SYSID),''#NULL#''), ''|''
	, COALESCE(TO_VARCHAR(REP_SYSID),''#NULL#''), ''|''
	, COALESCE(TO_VARCHAR(FISCAL_SYSID),''#NULL#''), ''|''
	, COALESCE(BAL_DATE,''#NULL#''),''|''
	, COALESCE(TO_VARCHAR(MV),''#NULL#''), ''|''
	, COALESCE(TO_VARCHAR(CURRENCY_CD),''#NULL#''), ''|''
	, COALESCE(TO_VARCHAR(EXCH_DT),''#NULL#''), ''|''
	, COALESCE(TO_VARCHAR(EXCH_RATE),''#NULL#''), ''|''
	, COALESCE(TO_VARCHAR(AUA),''#NULL#''), ''|''
	, COALESCE(TO_VARCHAR(PRICE),''#NULL#''), ''|''
	, COALESCE(TO_VARCHAR(UNITS),''#NULL#''), ''|''
	, COALESCE(TO_VARCHAR(BV),''#NULL#''), ''|''
	, COALESCE(TO_VARCHAR(ACB),''#NULL#''), ''|''
	, COALESCE(TO_VARCHAR(NI_T),''#NULL#''), ''|''
	, COALESCE(TO_VARCHAR(NI_P),''#NULL#''), ''|''
	, COALESCE(FREQ_CD,''#NULL#''),''|''
	, COALESCE(TO_VARCHAR(UNITS_TRD_DT),''#NULL#''), ''|''
	, COALESCE(TO_VARCHAR(FISCAL_TD_UNITS),''#NULL#''), ''|''
	, COALESCE(IVD_LOAD_FLAG,''#NULL#''),''|''
	, COALESCE(TO_VARCHAR(WF_IND),''#NULL#'')
	)),	
	MD_CREATION_DT= SYSTIMESTAMP()
	Where 1=1
		';
EXECUTE IMMEDIATE :INS_PRE_DEL;
EXECUTE IMMEDIATE :INS_PRE_COPY;
EXECUTE IMMEDIATE :INS_UPDATE;
END
$$;

create procedure INVESTIA_UNIVERIS.SP_CONV_LOADSTG_INVESTIA_UNIVERIS_TO_STG_FINANCIAL_TRANSACTIONS(ENV VARCHAR, IO_FILE_NAME VARCHAR)
    returns VARCHAR
    language SQL
    strict
as
$$
DECLARE
INS_COPY_QUERY STRING;
INS_UPDATE STRING;

BEGIN
IO_FILE_NAME :=CHAR(39)||IO_FILE_NAME||CHAR(39);
INS_COPY_QUERY := '
COPY INTO 
	DB_IAW_'||ENV||'_STG.INVESTIA_UNIVERIS.FINANCIAL_TRANSACTIONS
(
MD_START_DT,
MD_SOURCE,
TRX_SYSID,
IVR_SYSID,
REP_SYSID,
PLN_SYSID,
ACT_SYSID,
IVD_SYSID,
TRX_STATUS,
TRX_ST_DESC_ENG,
TRADE_DT,
MGT_CD,
MGT_NAME_ENG,
DLR_SYSID,
RGN_SYSID,
BRN_SYSID,
TRX_UNIT,
TRX_PRICE,
TRX_GROSS,
TRX_NET,
TRX_GROSS_CAD,
SPR_FACTOR,
CURRENCY_CD,
DLR_CD,
RGN_CD,
BRN_CD,
REP_CD,
PLN_TYPE,
SPR_CTGY,
TRX_MNEM_ENG,
REVERSAL_IND,
MD_EXTRACT_DT,
MD_SRC_SYSTEM
)
FROM
	(
	SELECT
		t.$9, metadata$filename,t.$1, t.$2, t.$3, t.$4, t.$5, t.$6, t.$7, t.$8, t.$9, t.$10,t.$11, t.$12, t.$13, t.$14, t.$15, t.$16, t.$17, t.$18, t.$19, t.$20
		,t.$21, t.$22, t.$23, t.$24, t.$25, t.$26, t.$27, t.$28, t.$29, t.$30, t.$31
	FROM
		@DATALAKE.raw/INVESTIA/INITIAL_LOADING T 
	) pattern = '||io_file_name||' file_format =(format_name = DB_IAW_'||ENV||'_STG.INVESTIA_UNIVERIS.PIPE_UTF16);
             ';
INS_UPDATE := '
UPDATE DB_IAW_'||ENV||'_STG.INVESTIA_UNIVERIS.FINANCIAL_TRANSACTIONS
SET
HK_LINK =
SHA1(UPPER(CONCAT(COALESCE(TRIM(MD_SRC_SYSTEM), ''#NULL#'')
, ''|'' , COALESCE(TRIM(TRX_SYSID), ''#NULL#'')
, ''|'' , ''#NULL#''
, ''|'' , ''#NULL#''
, ''|'' , COALESCE(TRIM(IVD_SYSID), ''#NULL#'')
, ''|'' , COALESCE(TRIM(PLN_SYSID), ''#NULL#'')
, ''|'' , COALESCE(TRIM(IVR_SYSID), ''#NULL#'')))),
HK_HUB_CONTRACT = DECODE(TRUE, PLN_SYSID IS NULL AND IVR_SYSID IS NULL ,''0'',SHA1(UPPER(CONCAT(COALESCE(TRIM(MD_SRC_SYSTEM), ''#NULL#''), ''|'' ,''#NULL#'',''|'', COALESCE(TRIM(PLN_SYSID), ''#NULL#'')	,''|'', COALESCE(TRIM(IVR_SYSID), ''#NULL#''))))),
HK_HUB_INVESTMENT_PRODUCT_TYPE = DECODE(TRUE, IVD_SYSID IS NULL ,''0'',SHA1(UPPER(CONCAT(COALESCE(TRIM(MD_SRC_SYSTEM), ''#NULL#''), ''|'' , COALESCE(TRIM(IVD_SYSID), ''#NULL#''))))),
MD_HASHDIFF = ''0'',
MD_START_DT = DATEADD(DAY,1,TRADE_DT)
Where 1=1;
';
EXECUTE IMMEDIATE :INS_COPY_QUERY;
EXECUTE IMMEDIATE :INS_UPDATE;
END
$$;

create procedure INVESTIA_UNIVERIS.SP_CONV_LOADSTG_INVESTIA_UNIVERIS_TO_STG_HOLDINGS(ENV VARCHAR, IO_FILE_NAME VARCHAR)
    returns VARCHAR
    language SQL
    strict
as
$$
DECLARE
INS_COPY_QUERY STRING;
INS_UPDATE STRING;

BEGIN
IO_FILE_NAME :=CHAR(39)||IO_FILE_NAME||CHAR(39);
INS_COPY_QUERY := '
COPY INTO 
	DB_IAW_'||ENV||'_STG.INVESTIA_UNIVERIS.HOLDINGS (
	  MD_START_DT
	, MD_SOURCE	
	, MD_SEQ
	, ACT_SYSID
	, IVD_SYSID
	, REP_SYSID
	, IVR_SYSID
	, PLN_SYSID
	, FISCAL_SYSID
	, BAL_DATE
	, MV
	, CURRENCY_CD
	, EXCH_DT
	, EXCH_RATE
	, AUA
	, PRICE
	, UNITS
	, BV
	, ACB
	, NI_T
	, NI_P
	, FREQ_CD
	, UNITS_TRD_DT
	, FISCAL_TD_UNITS
	, IVD_LOAD_FLAG
	, WF_IND	
	, MD_EXTRACT_DT
	, MD_SRC_SYSTEM
	)
FROM
	(
	SELECT
    t.$7,metadata$filename, metadata$file_row_number,
		t.$1, t.$2, t.$3, t.$4, t.$5, t.$6, t.$7, t.$8, t.$9, t.$10, t.$11, t.$12, t.$13, t.$14, t.$15, t.$16, t.$17, t.$18, t.$19, t.$20, t.$21, t.$22, t.$23, t.$24, t.$25
	FROM
		@DATALAKE.raw/INVESTIA/INITIAL_LOADING T 
	) pattern = '||io_file_name||' file_format =(format_name = DB_IAW_'||ENV||'_STG.INVESTIA_UNIVERIS.PIPE_UTF16);
             ';
INS_UPDATE := '
UPDATE DB_IAW_'||ENV||'_STG.INVESTIA_UNIVERIS.HOLDINGS
SET 
	HK_LINK = SHA1(UPPER(CONCAT(
	  COALESCE(TRIM(MD_SEQ), ''#NULL#''), ''|'' 
	, COALESCE(TRIM(MD_SRC_SYSTEM), ''#NULL#''), ''|'' 
	, COALESCE(TRIM(MD_EXTRACT_DT), ''#NULL#''), ''|'' 
	, ''#NULL#'', ''|'' 
	, COALESCE(TRIM(IVD_SYSID), ''#NULL#''), ''|''
	, COALESCE(TRIM(PLN_SYSID), ''#NULL#''), ''|'' 
	, COALESCE(TRIM(IVR_SYSID), ''#NULL#'')
	))),
	HK_HUB_CONTRACT = DECODE(TRUE, PLN_SYSID IS NULL AND IVR_SYSID IS NULL ,''0'',SHA1(UPPER(CONCAT(COALESCE(TRIM(MD_SRC_SYSTEM), ''#NULL#''), ''|'' ,''#NULL#'',''|'', COALESCE(TRIM(PLN_SYSID), ''#NULL#'')	,''|'', COALESCE(TRIM(IVR_SYSID), ''#NULL#''))))),
	HK_HUB_INVESTMENT_PRODUCT_TYPE = DECODE(TRUE, IVD_SYSID IS NULL ,''0'',SHA1(UPPER(CONCAT(COALESCE(TRIM(MD_SRC_SYSTEM), ''#NULL#''), ''|'' , COALESCE(TRIM(IVD_SYSID), ''#NULL#''))))),
	MD_HASHDIFF=SHA1(CONCAT(
	  COALESCE(TO_VARCHAR(ACT_SYSID),''#NULL#''), ''|'' 
	, COALESCE(TO_VARCHAR(REP_SYSID),''#NULL#''), ''|'' 
	, COALESCE(TO_VARCHAR(FISCAL_SYSID),''#NULL#''), ''|'' 
	, COALESCE(BAL_DATE,''#NULL#''),''|'' 
	, COALESCE(TO_VARCHAR(MV),''#NULL#''), ''|'' 
	, COALESCE(TO_VARCHAR(CURRENCY_CD),''#NULL#''), ''|'' 
	, COALESCE(TO_VARCHAR(EXCH_DT),''#NULL#''), ''|'' 
	, COALESCE(TO_VARCHAR(EXCH_RATE),''#NULL#''), ''|'' 
	, COALESCE(TO_VARCHAR(AUA),''#NULL#''), ''|'' 
	, COALESCE(TO_VARCHAR(PRICE),''#NULL#''), ''|'' 
	, COALESCE(TO_VARCHAR(UNITS),''#NULL#''), ''|'' 
	, COALESCE(TO_VARCHAR(BV),''#NULL#''), ''|'' 
	, COALESCE(TO_VARCHAR(ACB),''#NULL#''), ''|'' 
	, COALESCE(TO_VARCHAR(NI_T),''#NULL#''), ''|'' 
	, COALESCE(TO_VARCHAR(NI_P),''#NULL#''), ''|'' 
	, COALESCE(FREQ_CD,''#NULL#''),''|'' 
	, COALESCE(TO_VARCHAR(UNITS_TRD_DT),''#NULL#''), ''|'' 
	, COALESCE(TO_VARCHAR(FISCAL_TD_UNITS),''#NULL#''), ''|'' 
	, COALESCE(IVD_LOAD_FLAG,''#NULL#''),''|'' 
	, COALESCE(TO_VARCHAR(WF_IND),''#NULL#'')
	)),	
	MD_CREATION_DT= SYSTIMESTAMP(),
	MD_START_DT = DATEADD(DAY,1,BAL_DATE)
Where 1=1;
';
EXECUTE IMMEDIATE :INS_COPY_QUERY;
EXECUTE IMMEDIATE :INS_UPDATE;
END
$$;

create procedure IAS_UNIVERIS.SP_CONV_LOADSTG_INVESTIA_UNIVERIS_TO_STG_HOLDINGS(ENV VARCHAR, IO_FILE_NAME VARCHAR)
    returns VARCHAR
    language SQL
    strict
as
$$
DECLARE
INS_COPY_QUERY STRING;
INS_UPDATE STRING;

BEGIN
INS_COPY_QUERY := '
COPY INTO 
	DB_IAW_'||ENV||'_STG.INVESTIA_UNIVERIS.HOLDINGS (
	  MD_START_DT
	, MD_SOURCE	
	, MD_SEQ
	, ACT_SYSID
	, IVD_SYSID
	, REP_SYSID
	, IVR_SYSID
	, PLN_SYSID
	, FISCAL_SYSID
	, BAL_DATE
	, MV
	, CURRENCY_CD
	, EXCH_DT
	, EXCH_RATE
	, AUA
	, PRICE
	, UNITS
	, BV
	, ACB
	, NI_T
	, NI_P
	, FREQ_CD
	, UNITS_TRD_DT
	, FISCAL_TD_UNITS
	, IVD_LOAD_FLAG
	, WF_IND	
	, MD_EXTRACT_DT
	, MD_SRC_SYSTEM
	)
FROM
	(
	SELECT
    t.$7,metadata$filename, metadata$file_row_number,
		t.$1, t.$2, t.$3, t.$4, t.$5, t.$6, t.$7, t.$8, t.$9, t.$10, t.$11, t.$12, t.$13, t.$14, t.$15, t.$16, t.$17, t.$18, t.$19, t.$20, t.$21, t.$22, t.$23, t.$24, t.$25
	FROM
		@DATALAKE.raw/INVESTIA/INITIAL_LOADING T 
	) pattern = '||io_file_name||' file_format =(format_name = DB_IAW_'||ENV||'_STG.INVESTIA_UNIVERIS.PIPE_UTF16);
             ';
INS_UPDATE := '
UPDATE DB_IAW_'||ENV||'_STG.INVESTIA_UNIVERIS.HOLDINGS
SET 
	HK_LINK = SHA1(UPPER(CONCAT(
	  COALESCE(TRIM(MD_SEQ), ''#NULL#''), ''|'' 
	, COALESCE(TRIM(MD_SRC_SYSTEM), ''#NULL#''), ''|'' 
	, COALESCE(TRIM(MD_EXTRACT_DT), ''#NULL#''), ''|'' 
	, ''#NULL#'', ''|'' 
	, COALESCE(TRIM(IVD_SYSID), ''#NULL#''), ''|''
	, COALESCE(TRIM(PLN_SYSID), ''#NULL#''), ''|'' 
	, COALESCE(TRIM(IVR_SYSID), ''#NULL#'')
	))),
	HK_HUB_CONTRACT = DECODE(TRUE, PLN_SYSID IS NULL AND IVR_SYSID IS NULL ,''0'',SHA1(UPPER(CONCAT(COALESCE(TRIM(MD_SRC_SYSTEM), ''#NULL#''), ''|'' ,''#NULL#'',''|'', COALESCE(TRIM(PLN_SYSID), ''#NULL#'')	,''|'', COALESCE(TRIM(IVR_SYSID), ''#NULL#''))))),
	HK_HUB_INVESTMENT_PRODUCT_TYPE = DECODE(TRUE, IVD_SYSID IS NULL ,''0'',SHA1(UPPER(CONCAT(COALESCE(TRIM(MD_SRC_SYSTEM), ''#NULL#''), ''|'' , COALESCE(TRIM(IVD_SYSID), ''#NULL#''))))),
	MD_HASHDIFF=SHA1(CONCAT(
	  COALESCE(TO_VARCHAR(ACT_SYSID),''#NULL#''), ''|'' 
	, COALESCE(TO_VARCHAR(REP_SYSID),''#NULL#''), ''|'' 
	, COALESCE(TO_VARCHAR(FISCAL_SYSID),''#NULL#''), ''|'' 
	, COALESCE(BAL_DATE,''#NULL#''),''|'' 
	, COALESCE(TO_VARCHAR(MV),''#NULL#''), ''|'' 
	, COALESCE(TO_VARCHAR(CURRENCY_CD),''#NULL#''), ''|'' 
	, COALESCE(TO_VARCHAR(EXCH_DT),''#NULL#''), ''|'' 
	, COALESCE(TO_VARCHAR(EXCH_RATE),''#NULL#''), ''|'' 
	, COALESCE(TO_VARCHAR(AUA),''#NULL#''), ''|'' 
	, COALESCE(TO_VARCHAR(PRICE),''#NULL#''), ''|'' 
	, COALESCE(TO_VARCHAR(UNITS),''#NULL#''), ''|'' 
	, COALESCE(TO_VARCHAR(BV),''#NULL#''), ''|'' 
	, COALESCE(TO_VARCHAR(ACB),''#NULL#''), ''|'' 
	, COALESCE(TO_VARCHAR(NI_T),''#NULL#''), ''|'' 
	, COALESCE(TO_VARCHAR(NI_P),''#NULL#''), ''|'' 
	, COALESCE(FREQ_CD,''#NULL#''),''|'' 
	, COALESCE(TO_VARCHAR(UNITS_TRD_DT),''#NULL#''), ''|'' 
	, COALESCE(TO_VARCHAR(FISCAL_TD_UNITS),''#NULL#''), ''|'' 
	, COALESCE(IVD_LOAD_FLAG,''#NULL#''),''|'' 
	, COALESCE(TO_VARCHAR(WF_IND),''#NULL#'')
	)),	
	MD_CREATION_DT= SYSTIMESTAMP(),
	MD_START_DT = DATEADD(DAY,1,BAL_DATE)
Where 1=1;
';
EXECUTE IMMEDIATE :INS_COPY_QUERY;
EXECUTE IMMEDIATE :INS_UPDATE;
END
$$;

create procedure INVESTIA_UNIVERIS.SP_CONV_LOADSTG_INVESTIA_UNIVERIS_TO_STG_HOLDINGS_DEL(ENV VARCHAR, IO_FILE_NAME VARCHAR)
    returns VARCHAR
    language SQL
    strict
as
$$
DECLARE
INS_COPY_QUERY STRING;
INS_UPDATE STRING;

BEGIN
INS_COPY_QUERY := '
COPY INTO 
	DB_IAW_'||ENV||'_STG.INVESTIA_UNIVERIS.HOLDINGS (
	  MD_START_DT
	, MD_SOURCE	
	, MD_SEQ
	, ACT_SYSID
	, IVD_SYSID
	, REP_SYSID
	, IVR_SYSID
	, PLN_SYSID
	, FISCAL_SYSID
	, BAL_DATE
	, MV
	, CURRENCY_CD
	, EXCH_DT
	, EXCH_RATE
	, AUA
	, PRICE
	, UNITS
	, BV
	, ACB
	, NI_T
	, NI_P
	, FREQ_CD
	, UNITS_TRD_DT
	, FISCAL_TD_UNITS
	, IVD_LOAD_FLAG
	, WF_IND	
	, MD_EXTRACT_DT
	, MD_SRC_SYSTEM
	)
FROM
	(
	SELECT
    t.$7,metadata$filename, metadata$file_row_number,
		t.$1, t.$2, t.$3, t.$4, t.$5, t.$6, t.$7, t.$8, t.$9, t.$10, t.$11, t.$12, t.$13, t.$14, t.$15, t.$16, t.$17, t.$18, t.$19, t.$20, t.$21, t.$22, t.$23, t.$24, t.$25
	FROM
		@DATALAKE.raw/INVESTIA/INITIAL_LOADING T 
	) pattern = '||io_file_name||' file_format =(format_name = DB_IAW_'||ENV||'_STG.INVESTIA_UNIVERIS.PIPE_UTF16);
             ';
INS_UPDATE := '
UPDATE DB_IAW_'||ENV||'_STG.INVESTIA_UNIVERIS.HOLDINGS
SET 
	HK_LINK = SHA1(UPPER(CONCAT(
	  COALESCE(TRIM(MD_SEQ), ''#NULL#''), ''|'' 
	, COALESCE(TRIM(MD_SRC_SYSTEM), ''#NULL#''), ''|'' 
	, COALESCE(TRIM(MD_EXTRACT_DT), ''#NULL#''), ''|'' 
	, ''#NULL#'', ''|'' 
	, COALESCE(TRIM(IVD_SYSID), ''#NULL#''), ''|''
	, COALESCE(TRIM(PLN_SYSID), ''#NULL#''), ''|'' 
	, COALESCE(TRIM(IVR_SYSID), ''#NULL#'')
	))),
	HK_HUB_CONTRACT = DECODE(TRUE, PLN_SYSID IS NULL AND IVR_SYSID IS NULL ,''0'',SHA1(UPPER(CONCAT(COALESCE(TRIM(MD_SRC_SYSTEM), ''#NULL#''), ''|'' ,''#NULL#'',''|'', COALESCE(TRIM(PLN_SYSID), ''#NULL#'')	,''|'', COALESCE(TRIM(IVR_SYSID), ''#NULL#''))))),
	HK_HUB_INVESTMENT_PRODUCT_TYPE = DECODE(TRUE, IVD_SYSID IS NULL ,''0'',SHA1(UPPER(CONCAT(COALESCE(TRIM(MD_SRC_SYSTEM), ''#NULL#''), ''|'' , COALESCE(TRIM(IVD_SYSID), ''#NULL#''))))),
	MD_HASHDIFF=SHA1(CONCAT(
	  COALESCE(TO_VARCHAR(ACT_SYSID),''#NULL#''), ''|'' 
	, COALESCE(TO_VARCHAR(REP_SYSID),''#NULL#''), ''|'' 
	, COALESCE(TO_VARCHAR(FISCAL_SYSID),''#NULL#''), ''|'' 
	, COALESCE(BAL_DATE,''#NULL#''),''|'' 
	, COALESCE(TO_VARCHAR(MV),''#NULL#''), ''|'' 
	, COALESCE(TO_VARCHAR(CURRENCY_CD),''#NULL#''), ''|'' 
	, COALESCE(TO_VARCHAR(EXCH_DT),''#NULL#''), ''|'' 
	, COALESCE(TO_VARCHAR(EXCH_RATE),''#NULL#''), ''|'' 
	, COALESCE(TO_VARCHAR(AUA),''#NULL#''), ''|'' 
	, COALESCE(TO_VARCHAR(PRICE),''#NULL#''), ''|'' 
	, COALESCE(TO_VARCHAR(UNITS),''#NULL#''), ''|'' 
	, COALESCE(TO_VARCHAR(BV),''#NULL#''), ''|'' 
	, COALESCE(TO_VARCHAR(ACB),''#NULL#''), ''|'' 
	, COALESCE(TO_VARCHAR(NI_T),''#NULL#''), ''|'' 
	, COALESCE(TO_VARCHAR(NI_P),''#NULL#''), ''|'' 
	, COALESCE(FREQ_CD,''#NULL#''),''|'' 
	, COALESCE(TO_VARCHAR(UNITS_TRD_DT),''#NULL#''), ''|'' 
	, COALESCE(TO_VARCHAR(FISCAL_TD_UNITS),''#NULL#''), ''|'' 
	, COALESCE(IVD_LOAD_FLAG,''#NULL#''),''|'' 
	, COALESCE(TO_VARCHAR(WF_IND),''#NULL#'')
	)),	
	MD_CREATION_DT= SYSTIMESTAMP(),
	MD_START_DT = DATEADD(DAY,1,BAL_DATE)
Where 1=1;
';
EXECUTE IMMEDIATE :INS_COPY_QUERY;
EXECUTE IMMEDIATE :INS_UPDATE;
END
$$;

create procedure IAS.SP_CONV_LOADSTG_INVESTIA_UNIVERIS_TO_STG_REVENUE_PAYABLE(ENV VARCHAR, IO_FILE_NAME VARCHAR)
    returns VARCHAR
    language SQL
    strict
as
$$
DECLARE
INS_COPY_QUERY STRING;
INS_UPDATE STRING;

BEGIN
INS_COPY_QUERY := '
COPY INTO 
	DB_IAW_'||ENV||'_STG.INVESTIA_UNIVERIS.REVENUE_PAYABLE (
	MD_START_DT, 
	MD_SOURCE,
	PAY_SYSID,
	PYBL_STATUS,
	EVENT_PROC_SYSID,
	EVENT_RPT_SYSID,
	BEN_SYSID,
	REP_SYSID,
	DEAL_SYSID,
	COM_SYSID,
	DIST_SYSID,
	TRX_SYSID,
	IVR_SYSID,
	PLN_SYSID,
	ACT_SYSID,
	IVD_SYSID,
	MGT_CD,
	TRX_CD,
	PROC_DT,
	PAID_DT,
	PAY_PERIOD,
	TAX_YEAR,
	TRADE_DT,
	GRSS_AMT,
	COM_DLR,
	COM_PYBL,
	COM_BEN_PYBL,
	TICKET_CHG,
	PAY_CD,
	COM_PRODUCTION_CD,
	AMOUNT,
	USR_SYSID,
	OTX_SYSID,
	DISPLAY_FLAG,
	DLR_MINIMUM,
	ORIG_PAY_PER,
	IVT_TYPE,
	COM_PAY_SYSID,
	INTERNAL_COMM,
	WRHS_IND,
	MD_EXTRACT_DT,
	MD_SRC_SYSTEM ) 
FROM
	(
	SELECT
		t.$18, metadata$filename,t.$1,t.$2,t.$3,t.$4,t.$5,t.$6,t.$7,t.$8,t.$9,t.$10,
		t.$11,t.$12,t.$13,t.$14,t.$15,t.$16,t.$17,t.$18,t.$19,t.$20,t.$21,t.$22,t.$23,t.$24,
		t.$25,t.$26,t.$27,t.$28,t.$29,t.$30,t.$31,t.$32,t.$33,t.$34,
		t.$35,t.$36,t.$37,t.$38,t.$39,t.$40
	FROM
		@DATALAKE.raw/INVESTIA/INITIAL_LOADING T
	) pattern = '||io_file_name||' file_format =(format_name = DB_IAW_'||ENV||'_STG.INVESTIA_UNIVERIS.PIPE_UTF16);
             ';
INS_UPDATE := '
UPDATE DB_IAW_'||ENV||'_STG.INVESTIA_UNIVERIS.REVENUE_PAYABLE
SET 
HK_LINK= SHA1(UPPER(CONCAT(COALESCE(TRIM(MD_SRC_SYSTEM), ''#NULL#''), ''|'' , 
COALESCE(TO_VARCHAR(PAY_SYSID), ''#NULL#''), ''|'' , 
COALESCE(TO_VARCHAR(PAID_DT), ''#NULL#''), ''|'' ,
COALESCE(TO_VARCHAR(PLN_SYSID), ''#NULL#''), ''|'' ,
COALESCE(TO_VARCHAR(IVR_SYSID), ''#NULL#''), ''|'' ,
COALESCE(TO_VARCHAR(IVD_SYSID), ''#NULL#''), ''|'' ,
''#NULL#''))),
HK_HUB_CONTRACT=DECODE(TRUE, PLN_SYSID IS NULL AND IVR_SYSID IS NULL,''0'',SHA1(UPPER(CONCAT(COALESCE(TRIM(MD_SRC_SYSTEM), ''#NULL#''), ''|'' ,''#NULL#'',''|'', COALESCE(TO_VARCHAR(PLN_SYSID), ''#NULL#'')	,''|'', COALESCE(TO_VARCHAR(IVR_SYSID), ''#NULL#''))))),
HK_HUB_INVESTMENT_PRODUCT_TYPE = DECODE(TRUE, IVD_SYSID IS NULL ,''0'',SHA1(UPPER(CONCAT(COALESCE(TRIM(MD_SRC_SYSTEM), ''#NULL#''), ''|'' , COALESCE(TO_VARCHAR(TO_VARCHAR(IVD_SYSID)), ''#NULL#''))))),
MD_HASHDIFF = SHA1(CONCAT(
	COALESCE(PYBL_STATUS, ''#NULL#''), ''|'' , 
	COALESCE(TO_VARCHAR(EVENT_PROC_SYSID),''#NULL#''), ''|'', 
	COALESCE(TO_VARCHAR(EVENT_RPT_SYSID),''#NULL#''), ''|'', 
	COALESCE(TO_VARCHAR(BEN_SYSID),''#NULL#''), ''|'', 
	COALESCE(TO_VARCHAR(REP_SYSID),''#NULL#''), ''|'', 
	COALESCE(TO_VARCHAR(DEAL_SYSID),''#NULL#''), ''|'', 
	COALESCE(TO_VARCHAR(COM_SYSID),''#NULL#''), ''|'', 
	COALESCE(TO_VARCHAR(DIST_SYSID),''#NULL#''), ''|'', 
	COALESCE(TO_VARCHAR(TRX_SYSID),''#NULL#''), ''|'', 
	COALESCE(TO_VARCHAR(ACT_SYSID),''#NULL#''), ''|'', 
	COALESCE(MGT_CD, ''#NULL#''), ''|'' , 
	COALESCE(TO_VARCHAR(TRX_CD),''#NULL#''), ''|'', 
	COALESCE(TO_VARCHAR(PROC_DT),''#NULL#''), ''|'', 
	COALESCE(PAY_PERIOD, ''#NULL#''), ''|'' , 
	COALESCE(TAX_YEAR, ''#NULL#''), ''|'' , 
	COALESCE(TO_VARCHAR(TRADE_DT),''#NULL#''), ''|'', 
	COALESCE(TO_VARCHAR(GRSS_AMT),''#NULL#''), ''|'', 
	COALESCE(TO_VARCHAR(COM_DLR),''#NULL#''), ''|'', 
	COALESCE(TO_VARCHAR(COM_PYBL),''#NULL#''), ''|'', 
	COALESCE(TO_VARCHAR(COM_BEN_PYBL),''#NULL#''), ''|'', 
	COALESCE(TO_VARCHAR(TICKET_CHG),''#NULL#''), ''|'', 
	COALESCE(PAY_CD, ''#NULL#''), ''|'' , 
	COALESCE(COM_PRODUCTION_CD, ''#NULL#''), ''|'' , 
	COALESCE(TO_VARCHAR(AMOUNT),''#NULL#''), ''|'', 
	COALESCE(TO_VARCHAR(USR_SYSID),''#NULL#''), ''|'', 
	COALESCE(TO_VARCHAR(OTX_SYSID),''#NULL#''), ''|'', 
	COALESCE(TO_VARCHAR(DISPLAY_FLAG),''#NULL#''), ''|'', 
	COALESCE(DLR_MINIMUM, ''#NULL#''), ''|'' , 
	COALESCE(ORIG_PAY_PER, ''#NULL#''), ''|'' , 
	COALESCE(IVT_TYPE, ''#NULL#''), ''|'' , 
	COALESCE(TO_VARCHAR(COM_PAY_SYSID),''#NULL#''), ''|'', 
	COALESCE(TO_VARCHAR(INTERNAL_COMM),''#NULL#''), ''|'', 
	COALESCE(TO_VARCHAR(WRHS_IND),''#NULL#''))),	
MD_CREATION_DT=systimestamp(),
MD_START_DT = DATEADD(DAY,1,COALESCE(PAID_DT,PROC_DT))
Where 1=1;
';
--EXECUTE IMMEDIATE :INS_COPY_QUERY;
--EXECUTE IMMEDIATE :INS_UPDATE;

RETURN INS_COPY_QUERY;
END
$$;

create procedure IAS_UNIVERIS.SP_CONV_LOADSTG_INVESTIA_UNIVERIS_TO_STG_REVENUE_PAYABLE(ENV VARCHAR, IO_FILE_NAME VARCHAR)
    returns VARCHAR
    language SQL
    strict
as
$$
DECLARE
INS_COPY_QUERY STRING;
INS_UPDATE STRING;

BEGIN
INS_COPY_QUERY := '
COPY INTO 
	DB_IAW_'||ENV||'_STG.INVESTIA_UNIVERIS.REVENUE_PAYABLE (
	MD_START_DT, 
	MD_SOURCE,
	PAY_SYSID,
	PYBL_STATUS,
	EVENT_PROC_SYSID,
	EVENT_RPT_SYSID,
	BEN_SYSID,
	REP_SYSID,
	DEAL_SYSID,
	COM_SYSID,
	DIST_SYSID,
	TRX_SYSID,
	IVR_SYSID,
	PLN_SYSID,
	ACT_SYSID,
	IVD_SYSID,
	MGT_CD,
	TRX_CD,
	PROC_DT,
	PAID_DT,
	PAY_PERIOD,
	TAX_YEAR,
	TRADE_DT,
	GRSS_AMT,
	COM_DLR,
	COM_PYBL,
	COM_BEN_PYBL,
	TICKET_CHG,
	PAY_CD,
	COM_PRODUCTION_CD,
	AMOUNT,
	USR_SYSID,
	OTX_SYSID,
	DISPLAY_FLAG,
	DLR_MINIMUM,
	ORIG_PAY_PER,
	IVT_TYPE,
	COM_PAY_SYSID,
	INTERNAL_COMM,
	WRHS_IND,
	MD_EXTRACT_DT,
	MD_SRC_SYSTEM ) 
FROM
	(
	SELECT
		t.$18, metadata$filename,t.$1,t.$2,t.$3,t.$4,t.$5,t.$6,t.$7,t.$8,t.$9,t.$10,
		t.$11,t.$12,t.$13,t.$14,t.$15,t.$16,t.$17,t.$18,t.$19,t.$20,t.$21,t.$22,t.$23,t.$24,
		t.$25,t.$26,t.$27,t.$28,t.$29,t.$30,t.$31,t.$32,t.$33,t.$34,
		t.$35,t.$36,t.$37,t.$38,t.$39,t.$40
	FROM
		@DATALAKE.raw/INVESTIA/INITIAL_LOADING T
	) pattern = '||io_file_name||' file_format =(format_name = DB_IAW_'||ENV||'_STG.INVESTIA_UNIVERIS.PIPE_UTF16);
             ';
INS_UPDATE := '
UPDATE DB_IAW_'||ENV||'_STG.INVESTIA_UNIVERIS.REVENUE_PAYABLE
SET 
HK_LINK= SHA1(UPPER(CONCAT(COALESCE(TRIM(MD_SRC_SYSTEM), ''#NULL#''), ''|'' , 
COALESCE(TO_VARCHAR(PAY_SYSID), ''#NULL#''), ''|'' , 
COALESCE(TO_VARCHAR(PAID_DT), ''#NULL#''), ''|'' ,
COALESCE(TO_VARCHAR(PLN_SYSID), ''#NULL#''), ''|'' ,
COALESCE(TO_VARCHAR(IVR_SYSID), ''#NULL#''), ''|'' ,
COALESCE(TO_VARCHAR(IVD_SYSID), ''#NULL#''), ''|'' ,
''#NULL#''))),
HK_HUB_CONTRACT=DECODE(TRUE, PLN_SYSID IS NULL AND IVR_SYSID IS NULL,''0'',SHA1(UPPER(CONCAT(COALESCE(TRIM(MD_SRC_SYSTEM), ''#NULL#''), ''|'' ,''#NULL#'',''|'', COALESCE(TO_VARCHAR(PLN_SYSID), ''#NULL#'')	,''|'', COALESCE(TO_VARCHAR(IVR_SYSID), ''#NULL#''))))),
HK_HUB_INVESTMENT_PRODUCT_TYPE = DECODE(TRUE, IVD_SYSID IS NULL ,''0'',SHA1(UPPER(CONCAT(COALESCE(TRIM(MD_SRC_SYSTEM), ''#NULL#''), ''|'' , COALESCE(TO_VARCHAR(TO_VARCHAR(IVD_SYSID)), ''#NULL#''))))),
MD_HASHDIFF = SHA1(CONCAT(
	COALESCE(PYBL_STATUS, ''#NULL#''), ''|'' , 
	COALESCE(TO_VARCHAR(EVENT_PROC_SYSID),''#NULL#''), ''|'', 
	COALESCE(TO_VARCHAR(EVENT_RPT_SYSID),''#NULL#''), ''|'', 
	COALESCE(TO_VARCHAR(BEN_SYSID),''#NULL#''), ''|'', 
	COALESCE(TO_VARCHAR(REP_SYSID),''#NULL#''), ''|'', 
	COALESCE(TO_VARCHAR(DEAL_SYSID),''#NULL#''), ''|'', 
	COALESCE(TO_VARCHAR(COM_SYSID),''#NULL#''), ''|'', 
	COALESCE(TO_VARCHAR(DIST_SYSID),''#NULL#''), ''|'', 
	COALESCE(TO_VARCHAR(TRX_SYSID),''#NULL#''), ''|'', 
	COALESCE(TO_VARCHAR(ACT_SYSID),''#NULL#''), ''|'', 
	COALESCE(MGT_CD, ''#NULL#''), ''|'' , 
	COALESCE(TO_VARCHAR(TRX_CD),''#NULL#''), ''|'', 
	COALESCE(TO_VARCHAR(PROC_DT),''#NULL#''), ''|'', 
	COALESCE(PAY_PERIOD, ''#NULL#''), ''|'' , 
	COALESCE(TAX_YEAR, ''#NULL#''), ''|'' , 
	COALESCE(TO_VARCHAR(TRADE_DT),''#NULL#''), ''|'', 
	COALESCE(TO_VARCHAR(GRSS_AMT),''#NULL#''), ''|'', 
	COALESCE(TO_VARCHAR(COM_DLR),''#NULL#''), ''|'', 
	COALESCE(TO_VARCHAR(COM_PYBL),''#NULL#''), ''|'', 
	COALESCE(TO_VARCHAR(COM_BEN_PYBL),''#NULL#''), ''|'', 
	COALESCE(TO_VARCHAR(TICKET_CHG),''#NULL#''), ''|'', 
	COALESCE(PAY_CD, ''#NULL#''), ''|'' , 
	COALESCE(COM_PRODUCTION_CD, ''#NULL#''), ''|'' , 
	COALESCE(TO_VARCHAR(AMOUNT),''#NULL#''), ''|'', 
	COALESCE(TO_VARCHAR(USR_SYSID),''#NULL#''), ''|'', 
	COALESCE(TO_VARCHAR(OTX_SYSID),''#NULL#''), ''|'', 
	COALESCE(TO_VARCHAR(DISPLAY_FLAG),''#NULL#''), ''|'', 
	COALESCE(DLR_MINIMUM, ''#NULL#''), ''|'' , 
	COALESCE(ORIG_PAY_PER, ''#NULL#''), ''|'' , 
	COALESCE(IVT_TYPE, ''#NULL#''), ''|'' , 
	COALESCE(TO_VARCHAR(COM_PAY_SYSID),''#NULL#''), ''|'', 
	COALESCE(TO_VARCHAR(INTERNAL_COMM),''#NULL#''), ''|'', 
	COALESCE(TO_VARCHAR(WRHS_IND),''#NULL#''))),	
MD_CREATION_DT=systimestamp(),
MD_START_DT = DATEADD(DAY,1,COALESCE(PAID_DT,PROC_DT))
Where 1=1;
';
EXECUTE IMMEDIATE :INS_COPY_QUERY;
EXECUTE IMMEDIATE :INS_UPDATE;
END
$$;

create procedure INVESTIA_UNIVERIS.SP_CONV_LOADSTG_INVESTIA_UNIVERIS_TO_STG_REVENUE_PAYABLE(ENV VARCHAR, IO_FILE_NAME VARCHAR)
    returns VARCHAR
    language SQL
    strict
as
$$
DECLARE
INS_COPY_QUERY STRING;
INS_UPDATE STRING;

BEGIN
IO_FILE_NAME :=CHAR(39)||IO_FILE_NAME||CHAR(39);
INS_COPY_QUERY := '
COPY INTO 
	DB_IAW_'||ENV||'_STG.INVESTIA_UNIVERIS.REVENUE_PAYABLE (
	MD_START_DT, 
	MD_SOURCE,
	PAY_SYSID,
	PYBL_STATUS,
	EVENT_PROC_SYSID,
	EVENT_RPT_SYSID,
	BEN_SYSID,
	REP_SYSID,
	DEAL_SYSID,
	COM_SYSID,
	DIST_SYSID,
	TRX_SYSID,
	IVR_SYSID,
	PLN_SYSID,
	ACT_SYSID,
	IVD_SYSID,
	MGT_CD,
	TRX_CD,
	PROC_DT,
	PAID_DT,
	PAY_PERIOD,
	TAX_YEAR,
	TRADE_DT,
	GRSS_AMT,
	COM_DLR,
	COM_PYBL,
	COM_BEN_PYBL,
	TICKET_CHG,
	PAY_CD,
	COM_PRODUCTION_CD,
	AMOUNT,
	USR_SYSID,
	OTX_SYSID,
	DISPLAY_FLAG,
	DLR_MINIMUM,
	ORIG_PAY_PER,
	IVT_TYPE,
	COM_PAY_SYSID,
	INTERNAL_COMM,
	WRHS_IND,
	MD_EXTRACT_DT,
	MD_SRC_SYSTEM ) 
FROM
	(
	SELECT
		t.$18, metadata$filename,t.$1,t.$2,t.$3,t.$4,t.$5,t.$6,t.$7,t.$8,t.$9,t.$10,
		t.$11,t.$12,t.$13,t.$14,t.$15,t.$16,t.$17,t.$18,t.$19,t.$20,t.$21,t.$22,t.$23,t.$24,
		t.$25,t.$26,t.$27,t.$28,t.$29,t.$30,t.$31,t.$32,t.$33,t.$34,
		t.$35,t.$36,t.$37,t.$38,t.$39,t.$40
	FROM
		@DATALAKE.raw/INVESTIA/INITIAL_LOADING T
	) pattern = '||io_file_name||' file_format =(format_name = DB_IAW_'||ENV||'_STG.INVESTIA_UNIVERIS.PIPE_UTF16);
             ';
INS_UPDATE := '
UPDATE DB_IAW_'||ENV||'_STG.INVESTIA_UNIVERIS.REVENUE_PAYABLE
SET 
HK_LINK= SHA1(UPPER(CONCAT(COALESCE(TRIM(MD_SRC_SYSTEM), ''#NULL#''), ''|'' , 
COALESCE(TO_VARCHAR(PAY_SYSID), ''#NULL#''), ''|'' , 
COALESCE(TO_VARCHAR(PAID_DT), ''#NULL#''), ''|'' ,
COALESCE(TO_VARCHAR(PLN_SYSID), ''#NULL#''), ''|'' ,
COALESCE(TO_VARCHAR(IVR_SYSID), ''#NULL#''), ''|'' ,
COALESCE(TO_VARCHAR(IVD_SYSID), ''#NULL#''), ''|'' ,
''#NULL#''))),
HK_HUB_CONTRACT=DECODE(TRUE, PLN_SYSID IS NULL AND IVR_SYSID IS NULL,''0'',SHA1(UPPER(CONCAT(COALESCE(TRIM(MD_SRC_SYSTEM), ''#NULL#''), ''|'' ,''#NULL#'',''|'', COALESCE(TO_VARCHAR(PLN_SYSID), ''#NULL#'')	,''|'', COALESCE(TO_VARCHAR(IVR_SYSID), ''#NULL#''))))),
HK_HUB_INVESTMENT_PRODUCT_TYPE = DECODE(TRUE, IVD_SYSID IS NULL ,''0'',SHA1(UPPER(CONCAT(COALESCE(TRIM(MD_SRC_SYSTEM), ''#NULL#''), ''|'' , COALESCE(TO_VARCHAR(TO_VARCHAR(IVD_SYSID)), ''#NULL#''))))),
MD_HASHDIFF = SHA1(CONCAT(
	COALESCE(PYBL_STATUS, ''#NULL#''), ''|'' , 
	COALESCE(TO_VARCHAR(EVENT_PROC_SYSID),''#NULL#''), ''|'', 
	COALESCE(TO_VARCHAR(EVENT_RPT_SYSID),''#NULL#''), ''|'', 
	COALESCE(TO_VARCHAR(BEN_SYSID),''#NULL#''), ''|'', 
	COALESCE(TO_VARCHAR(REP_SYSID),''#NULL#''), ''|'', 
	COALESCE(TO_VARCHAR(DEAL_SYSID),''#NULL#''), ''|'', 
	COALESCE(TO_VARCHAR(COM_SYSID),''#NULL#''), ''|'', 
	COALESCE(TO_VARCHAR(DIST_SYSID),''#NULL#''), ''|'', 
	COALESCE(TO_VARCHAR(TRX_SYSID),''#NULL#''), ''|'', 
	COALESCE(TO_VARCHAR(ACT_SYSID),''#NULL#''), ''|'', 
	COALESCE(MGT_CD, ''#NULL#''), ''|'' , 
	COALESCE(TO_VARCHAR(TRX_CD),''#NULL#''), ''|'', 
	COALESCE(TO_VARCHAR(PROC_DT),''#NULL#''), ''|'', 
	COALESCE(PAY_PERIOD, ''#NULL#''), ''|'' , 
	COALESCE(TAX_YEAR, ''#NULL#''), ''|'' , 
	COALESCE(TO_VARCHAR(TRADE_DT),''#NULL#''), ''|'', 
	COALESCE(TO_VARCHAR(GRSS_AMT),''#NULL#''), ''|'', 
	COALESCE(TO_VARCHAR(COM_DLR),''#NULL#''), ''|'', 
	COALESCE(TO_VARCHAR(COM_PYBL),''#NULL#''), ''|'', 
	COALESCE(TO_VARCHAR(COM_BEN_PYBL),''#NULL#''), ''|'', 
	COALESCE(TO_VARCHAR(TICKET_CHG),''#NULL#''), ''|'', 
	COALESCE(PAY_CD, ''#NULL#''), ''|'' , 
	COALESCE(COM_PRODUCTION_CD, ''#NULL#''), ''|'' , 
	COALESCE(TO_VARCHAR(AMOUNT),''#NULL#''), ''|'', 
	COALESCE(TO_VARCHAR(USR_SYSID),''#NULL#''), ''|'', 
	COALESCE(TO_VARCHAR(OTX_SYSID),''#NULL#''), ''|'', 
	COALESCE(TO_VARCHAR(DISPLAY_FLAG),''#NULL#''), ''|'', 
	COALESCE(DLR_MINIMUM, ''#NULL#''), ''|'' , 
	COALESCE(ORIG_PAY_PER, ''#NULL#''), ''|'' , 
	COALESCE(IVT_TYPE, ''#NULL#''), ''|'' , 
	COALESCE(TO_VARCHAR(COM_PAY_SYSID),''#NULL#''), ''|'', 
	COALESCE(TO_VARCHAR(INTERNAL_COMM),''#NULL#''), ''|'', 
	COALESCE(TO_VARCHAR(WRHS_IND),''#NULL#''))),	
MD_CREATION_DT=systimestamp(),
MD_START_DT = DATEADD(DAY,1,COALESCE(PAID_DT,PROC_DT))
Where 1=1;
';
EXECUTE IMMEDIATE :INS_COPY_QUERY;
EXECUTE IMMEDIATE :INS_UPDATE;
END
$$;

create procedure INVESTIA_UNIVERIS.SP_CONV_LOADSTG_INVESTIA_UNIVERIS_TO_STG_TRAILER_FEES(ENV VARCHAR, IO_FILE_NAME VARCHAR)
    returns VARCHAR
    language SQL
    strict
as
$$
DECLARE
INS_COPY_QUERY STRING;
INS_UPDATE STRING;

BEGIN
IO_FILE_NAME :=CHAR(39)||IO_FILE_NAME||CHAR(39);
INS_COPY_QUERY := '
COPY INTO 
	DB_IAW_'||ENV||'_STG.INVESTIA_UNIVERIS.PLN_SRF (
	MD_START_DT, 
	MD_SOURCE,
	PLN_SRF_SYSID,
	PLN_SYSID,
	FAS_FILE_NAME,
	FROM_DT,
	TO_DT,
	MGT_CD,
	CURRENCY_CD,
	INCOME_TYPE,
	REP_CODE,
	COM_PYBL,
	EXCH_DT,
	EXCH_RATE,
	LAST_UPD_DT,
	USR_SYSID,
	FISCAL_SYSID,
	JUR_CD,
	ACT_TAX_COLLCTD,
	DLR_SYSID,
	RGN_SYSID,
	BRN_SYSID,
	REP_SYSID,
	IVR_SYSID,
	IVD_SYSID,
	MD_EXTRACT_DT,
	MD_SRC_SYSTEM ) 
FROM
	(
	SELECT
		t.$5, metadata$filename,t.$1,t.$2,t.$3,t.$4,t.$5,t.$6,t.$7,t.$8,t.$9,t.$10,
		t.$11,t.$12,t.$13,t.$14,t.$15,t.$16,t.$17,t.$18,t.$19,t.$20,t.$21,t.$22,t.$23,t.$24,t.$25
	FROM
		@DATALAKE.raw/INVESTIA/INITIAL_LOADING T
	) pattern = '||io_file_name||' file_format =(format_name = DB_IAW_'||ENV||'_STG.INVESTIA_UNIVERIS.PIPE_UTF16);
             ';
INS_UPDATE := '
UPDATE DB_IAW_'||ENV||'_STG.INVESTIA_UNIVERIS.PLN_SRF
SET 
HK_LINK= SHA1(UPPER(CONCAT(COALESCE(TRIM(MD_SRC_SYSTEM), ''#NULL#''), ''|'' , 
COALESCE(TO_VARCHAR(PLN_SRF_SYSID), ''#NULL#''), ''|'' , 
COALESCE(TO_VARCHAR(TO_DT), ''#NULL#''), ''|'' ,
COALESCE(TO_VARCHAR(PLN_SYSID), ''#NULL#''), ''|'' ,
COALESCE(TO_VARCHAR(IVR_SYSID), ''#NULL#''), ''|'' ,
COALESCE(TO_VARCHAR(IVD_SYSID), ''#NULL#''), ''|'',
''#NULL#''))),
HK_HUB_CONTRACT=DECODE(TRUE, PLN_SYSID IS NULL AND IVR_SYSID IS NULL,''0'',SHA1(UPPER(CONCAT(COALESCE(TRIM(MD_SRC_SYSTEM), ''#NULL#''), ''|'' ,''#NULL#'',''|'', COALESCE(TO_VARCHAR(PLN_SYSID), ''#NULL#'')	,''|'', COALESCE(TO_VARCHAR(IVR_SYSID), ''#NULL#''))))),
HK_HUB_INVESTMENT_PRODUCT_TYPE = DECODE(TRUE, IVD_SYSID IS NULL ,''0'',SHA1(UPPER(CONCAT(COALESCE(TRIM(MD_SRC_SYSTEM), ''#NULL#''), ''|'' , COALESCE(TO_VARCHAR(TO_VARCHAR(IVD_SYSID)), ''#NULL#''))))),
MD_HASHDIFF = SHA1(CONCAT(
	COALESCE(FAS_FILE_NAME, ''#NULL#''), ''|'' , 
	COALESCE(TO_VARCHAR(FROM_DT),''#NULL#''), ''|'', 
	COALESCE(MGT_CD, ''#NULL#''), ''|'' , 
	COALESCE(CURRENCY_CD, ''#NULL#''), ''|'' , 
	COALESCE(INCOME_TYPE, ''#NULL#''), ''|'' , 
	COALESCE(REP_CODE, ''#NULL#''), ''|'' , 
	COALESCE(TO_VARCHAR(COM_PYBL),''#NULL#''), ''|'', 
	COALESCE(TO_VARCHAR(EXCH_DT),''#NULL#''), ''|'', 
	COALESCE(TO_VARCHAR(EXCH_RATE),''#NULL#''), ''|'', 
	COALESCE(TO_VARCHAR(LAST_UPD_DT),''#NULL#''), ''|'', 
	COALESCE(TO_VARCHAR(USR_SYSID),''#NULL#''), ''|'', 
	COALESCE(TO_VARCHAR(FISCAL_SYSID),''#NULL#''), ''|'', 
	COALESCE(JUR_CD, ''#NULL#''), ''|'' , 
	COALESCE(TO_VARCHAR(ACT_TAX_COLLCTD),''#NULL#''), ''|'', 
	COALESCE(TO_VARCHAR(DLR_SYSID),''#NULL#''), ''|'', 
	COALESCE(TO_VARCHAR(RGN_SYSID),''#NULL#''), ''|'', 
	COALESCE(TO_VARCHAR(BRN_SYSID),''#NULL#''), ''|'', 
	COALESCE(TO_VARCHAR(REP_SYSID),''#NULL#''))),	
MD_CREATION_DT=systimestamp(),
MD_START_DT = DATEADD (DAY,1,TO_DT)
Where 1=1;
';
EXECUTE IMMEDIATE :INS_COPY_QUERY;
EXECUTE IMMEDIATE :INS_UPDATE;
END
$$;

create procedure INVESTIA_UNIVERIS.SP_CONV_LOADSTG_PSA_FUNDEX_UNIVERIS_TO_STG_X_DBB_MASTER_REP_FUNDEX(ENV VARCHAR, IO_FILE_NAME VARCHAR, I_DATA_START_DATE VARCHAR)
    returns VARCHAR
    language SQL
    strict
as
$$
DECLARE
INS_PRE_QUERY STRING;
INS_COPY_QUERY STRING;
INS_UPDATE STRING;
BEGIN
i_DATA_START_DATE :=CHAR(39)||i_DATA_START_DATE||CHAR(39);
IO_FILE_NAME :=CHAR(39)||IO_FILE_NAME||CHAR(39);
INS_PRE_QUERY := 'TRUNCATE TABLE DB_IAW_'||ENV||'_STG.INVESTIA_UNIVERIS.X_DBB_MASTER_REP_FUNDEX ';
INS_COPY_QUERY := '
COPY INTO DB_IAW_'||ENV||'_STG.INVESTIA_UNIVERIS.X_DBB_MASTER_REP_FUNDEX
(   MD_START_DT,
	MD_SOURCE ,
	MASTER_CD,
	REP_SYSID,
	BEN_SYSID,
	COMM_RATE,
	BRN_SYSID,
	BRN_CD,
	REP_CD_ORIGINAL,
	MD_EXTRACT_DT ,
	MD_SRCSYSTEM
)
FROM
	(
	SELECT
		TO_DATE('||i_DATA_START_DATE||',''YYYY-MM-DD''), metadata$filename, t.$1, t.$2, t.$3, t.$4, t.$5, t.$6, t.$7, t.$8, t.$9
	FROM
		@DATALAKE.raw/INVESTIA/INITIAL_LOADING T
	) pattern ='||io_file_name||' file_format=(format_name=DB_IAW_'||ENV||'_STG.INVESTIA_UNIVERIS.PIPE_UTF16);
              ';
INS_UPDATE := '
UPDATE DB_IAW_'||ENV||'_STG.INVESTIA_UNIVERIS.X_DBB_MASTER_REP_FUNDEX

SET 
	HK_LINK=SHA1(UPPER(CONCAT(''INVESTIA'' ,''|'', COALESCE(TRIM(REP_CD_ORIGINAL), ''#NULL#''), ''|'', COALESCE(TRIM(MASTER_CD), ''#NULL#''),''|'', ''#NULL#'',''|'', ''#NULL#'',''|'', ''#NULL#'' ))),
	HK_HUB_FROM= DECODE(TRUE, REP_CD_ORIGINAL IS NULL ,''0'',SHA1(UPPER(CONCAT(COALESCE(TRIM(''INVESTIA''), ''#NULL#''), ''|'' , COALESCE(TRIM(REP_CD_ORIGINAL), ''#NULL#''))))),
	HK_HUB_TO= DECODE(TRUE, MASTER_CD IS NULL ,''0'',SHA1(UPPER(CONCAT(COALESCE(TRIM(''INVESTIA''), ''#NULL#''), ''|'' , COALESCE(TRIM(MASTER_CD), ''#NULL#''))))),
	
	MD_HASHDIFF=SHA1(concat( COALESCE(TO_VARCHAR(REP_SYSID), ''#NULL#''),''|'',
	                 COALESCE(TO_VARCHAR(BEN_SYSID), ''#NULL#''),''|'',
	                 COALESCE(TO_VARCHAR(COMM_RATE), ''#NULL#''),''|'',
				     COALESCE(TO_VARCHAR(BRN_SYSID), ''#NULL#''),''|'',
				     COALESCE(BRN_CD, ''#NULL#'')
				     )),	
	MD_CREATION_DT=SYSTIMESTAMP()
Where 1=1;
';
EXECUTE IMMEDIATE :INS_PRE_QUERY;
EXECUTE IMMEDIATE :INS_COPY_QUERY;
EXECUTE IMMEDIATE :INS_UPDATE;
END
$$;

create procedure IAPW_PORTAL_API.SP_CONV_LOADSTG_PSA_IAPW_PORTAL_API_TO_ACCOUNTS_CLIENTS_SUMMARY(ENV VARCHAR, IO_PATH VARCHAR)
    returns VARCHAR
    language SQL
    strict
as
$$
DECLARE
INS_PRE_QUERY STRING;
INS_COPY_QUERY STRING;

BEGIN
INS_PRE_QUERY := 'DELETE FROM DB_IAW_'||ENV||'_STG.IAPW_PORTAL_API.ACCOUNTS_CLIENTS_SUMMARY WHERE 1=1;';
INS_COPY_QUERY := '
COPY INTO DB_IAW_'||ENV||'_STG.IAPW_PORTAL_API.ACCOUNTS_CLIENTS_SUMMARY
(
    MD_START_DT,
    MD_SOURCE,
	MD_SRC_SYSTEM,
	MD_EXTRACT_DT,
    CONTENT
    )
 FROM
	(
	SELECT
		TO_DATE(split_part(split_part(metadata$filename, ''__'', 2), ''.'', 0)), metadata$filename,''IAPW_PORTAL_API'',TO_DATE(split_part(split_part(metadata$filename, ''__'', 2), ''.'', 0)),t.$1
	FROM
		@DATALAKE.'||io_PATH||' t
	) pattern =''.*accountsAndClientsSummary__.*json'' file_format=(format_name=DB_IAW_'||ENV||'_STG.IAPW_PORTAL_API.JSON_FORMAT);
              ';

EXECUTE IMMEDIATE :INS_PRE_QUERY;
EXECUTE IMMEDIATE :INS_COPY_QUERY;
END
$$;

create procedure IAPW_PORTAL_API.SP_CONV_LOADSTG_PSA_IAPW_PORTAL_API_TO_ACCOUNTS_CLIENTS_SUMMARY_RVP(ENV VARCHAR, IO_PATH VARCHAR)
    returns VARCHAR
    language SQL
    strict
as
$$
DECLARE
INS_PRE_QUERY STRING;
INS_COPY_QUERY STRING;

BEGIN
INS_PRE_QUERY := 'DELETE FROM DB_IAW_'||ENV||'_STG.IAPW_PORTAL_API.ACCOUNTS_CLIENTS_SUMMARY_RVP WHERE 1=1;';
INS_COPY_QUERY := '
COPY INTO DB_IAW_'||ENV||'_STG.IAPW_PORTAL_API.ACCOUNTS_CLIENTS_SUMMARY_RVP
(
    MD_START_DT,
    MD_SOURCE,
	MD_SRC_SYSTEM,
	MD_EXTRACT_DT,
	RVPID,
    CONTENT
    )
 FROM
	(
	SELECT
		TO_DATE(split_part(split_part(metadata$filename, ''__'', 2), ''.'', 0)), metadata$filename,''IAPW_PORTAL_API'',TO_DATE(split_part(split_part(metadata$filename, ''__'', 2), ''.'', 0)),split_part(split_part(metadata$filename,''#'',2),''__'',0),t.$1
	FROM
		@DATALAKE.'||io_PATH||' t
	) pattern =''.*accountsAndClientsSummary_RVP.*__.*json'' file_format=(format_name=DB_IAW_'||ENV||'_STG.IAPW_PORTAL_API.JSON_FORMAT);
              ';

EXECUTE IMMEDIATE :INS_PRE_QUERY;
EXECUTE IMMEDIATE :INS_COPY_QUERY;
END
$$;

create procedure IAPW_PORTAL_API.SP_CONV_LOADSTG_PSA_IAPW_PORTAL_API_TO_ASSETS_SUMMARY_BYCOMMISSIONTYPE(ENV VARCHAR, IO_PATH VARCHAR)
    returns VARCHAR
    language SQL
    strict
as
$$
DECLARE
INS_PRE_QUERY STRING;
INS_COPY_QUERY STRING;

BEGIN
INS_PRE_QUERY := 'DELETE FROM DB_IAW_'||ENV||'_STG.IAPW_PORTAL_API.ASSETS_SUMMARY_BYCOMMISSIONTYPE WHERE 1=1;';
INS_COPY_QUERY := '
COPY INTO DB_IAW_'||ENV||'_STG.IAPW_PORTAL_API.ASSETS_SUMMARY_BYCOMMISSIONTYPE
(
    MD_START_DT,
    MD_SOURCE,
	MD_SRC_SYSTEM,
	MD_EXTRACT_DT,
    CONTENT
    )
 FROM
	(
	SELECT
		TO_DATE(split_part(split_part(metadata$filename, ''__'', 2), ''.'', 0)), metadata$filename,''IAPW_PORTAL_API'',TO_DATE(split_part(split_part(metadata$filename, ''__'', 2), ''.'', 0)),t.$1
	FROM
		@DATALAKE.'||io_PATH||' t
	) pattern =''.*assetsSummaryByCommType__.*json'' file_format=(format_name=DB_IAW_'||ENV||'_STG.IAPW_PORTAL_API.JSON_FORMAT);
              ';

EXECUTE IMMEDIATE :INS_PRE_QUERY;
EXECUTE IMMEDIATE :INS_COPY_QUERY;
END
$$;

create procedure IAPW_PORTAL_API.SP_CONV_LOADSTG_PSA_IAPW_PORTAL_API_TO_ASSETS_SUMMARY_BYCOMMISSIONTYPE_RVP(ENV VARCHAR, IO_PATH VARCHAR)
    returns VARCHAR
    language SQL
    strict
as
$$
DECLARE
INS_PRE_QUERY STRING;
INS_COPY_QUERY STRING;

BEGIN
INS_PRE_QUERY := 'DELETE FROM DB_IAW_'||ENV||'_STG.IAPW_PORTAL_API.ASSETS_SUMMARY_BYCOMMISSIONTYPE_RVP WHERE 1=1;';
INS_COPY_QUERY := '
COPY INTO DB_IAW_'||ENV||'_STG.IAPW_PORTAL_API.ASSETS_SUMMARY_BYCOMMISSIONTYPE_RVP
(
    MD_START_DT,
    MD_SOURCE,
	MD_SRC_SYSTEM,
	MD_EXTRACT_DT,
	RVPID,
    CONTENT
    )
 FROM
	(
	SELECT
		TO_DATE(split_part(split_part(metadata$filename, ''__'', 2), ''.'', 0)), metadata$filename,''IAPW_PORTAL_API'',TO_DATE(split_part(split_part(metadata$filename, ''__'', 2), ''.'', 0)),split_part(split_part(metadata$filename,''#'',2),''__'',0),t.$1
	FROM
		@DATALAKE.'||io_PATH||' t
	) pattern =''.*assetsSummaryByCommType_RVP.*__.*json'' file_format=(format_name=DB_IAW_'||ENV||'_STG.IAPW_PORTAL_API.JSON_FORMAT);
              ';

EXECUTE IMMEDIATE :INS_PRE_QUERY;
EXECUTE IMMEDIATE :INS_COPY_QUERY;
END
$$;

create procedure IAPW_PORTAL_API.SP_CONV_LOADSTG_PSA_IAPW_PORTAL_API_TO_ASSETS_SUMMARY_BYPRODUCT(ENV VARCHAR, IO_PATH VARCHAR)
    returns VARCHAR
    language SQL
    strict
as
$$
DECLARE
INS_PRE_QUERY STRING;
INS_COPY_QUERY STRING;

BEGIN
INS_PRE_QUERY := 'DELETE FROM DB_IAW_'||ENV||'_STG.IAPW_PORTAL_API.ASSETS_SUMMARY_BYPRODUCT WHERE 1=1;';
INS_COPY_QUERY := '
COPY INTO DB_IAW_'||ENV||'_STG.IAPW_PORTAL_API.ASSETS_SUMMARY_BYPRODUCT
(
    MD_START_DT,
    MD_SOURCE,
	MD_SRC_SYSTEM,
	MD_EXTRACT_DT,
    CONTENT
    )
 FROM
	(
	SELECT
		TO_DATE(split_part(split_part(metadata$filename, ''__'', 2), ''.'', 0)), metadata$filename,''IAPW_PORTAL_API'',TO_DATE(split_part(split_part(metadata$filename, ''__'', 2), ''.'', 0)),t.$1
	FROM
		@DATALAKE.'||io_PATH||' t
	) pattern =''.*assetsSummaryByProduct__.*json'' file_format=(format_name=DB_IAW_'||ENV||'_STG.IAPW_PORTAL_API.JSON_FORMAT);
              ';

EXECUTE IMMEDIATE :INS_PRE_QUERY;
EXECUTE IMMEDIATE :INS_COPY_QUERY;
END
$$;

create procedure IAPW_PORTAL_API.SP_CONV_LOADSTG_PSA_IAPW_PORTAL_API_TO_ASSETS_SUMMARY_BYPRODUCT_RVP(ENV VARCHAR, IO_PATH VARCHAR)
    returns VARCHAR
    language SQL
    strict
as
$$
DECLARE
INS_PRE_QUERY STRING;
INS_COPY_QUERY STRING;

BEGIN
INS_PRE_QUERY := 'DELETE FROM DB_IAW_'||ENV||'_STG.IAPW_PORTAL_API.ASSETS_SUMMARY_BYPRODUCT_RVP WHERE 1=1;';
INS_COPY_QUERY := '
COPY INTO DB_IAW_'||ENV||'_STG.IAPW_PORTAL_API.ASSETS_SUMMARY_BYPRODUCT_RVP
(
    MD_START_DT,
    MD_SOURCE,
	MD_SRC_SYSTEM,
	MD_EXTRACT_DT,
	RVPID,
    CONTENT
    )
 FROM
	(
	SELECT
		TO_DATE(split_part(split_part(metadata$filename, ''__'', 2), ''.'', 0)), metadata$filename,''IAPW_PORTAL_API'',TO_DATE(split_part(split_part(metadata$filename, ''__'', 2), ''.'', 0)),split_part(split_part(metadata$filename,''#'',2),''__'',0),t.$1
	FROM
		@DATALAKE.'||io_PATH||' t
	) pattern =''.*assetsSummaryByProduct_RVP.*__.*json'' file_format=(format_name=DB_IAW_'||ENV||'_STG.IAPW_PORTAL_API.JSON_FORMAT);
              ';

EXECUTE IMMEDIATE :INS_PRE_QUERY;
EXECUTE IMMEDIATE :INS_COPY_QUERY;
END
$$;

create procedure IAPW_PORTAL_API.SP_CONV_LOADSTG_PSA_IAPW_PORTAL_API_TO_ASSETS_SUMMARY_BY_COMMISSIONTYPE_AND_PRODUCT(ENV VARCHAR, IO_PATH VARCHAR)
    returns VARCHAR
    language SQL
    strict
as
$$
DECLARE
INS_PRE_QUERY STRING;
INS_COPY_QUERY STRING;

BEGIN
INS_PRE_QUERY := 'DELETE FROM DB_IAW_'||ENV||'_STG.IAPW_PORTAL_API.ASSETS_SUMMARY_BYCOMMISSIONTYPE_AND_PRODUCT WHERE 1=1;';
INS_COPY_QUERY := '
COPY INTO DB_IAW_'||ENV||'_STG.IAPW_PORTAL_API.ASSETS_SUMMARY_BYCOMMISSIONTYPE_AND_PRODUCT
(
    MD_START_DT,
    MD_SOURCE,
	MD_SRC_SYSTEM,
	MD_EXTRACT_DT,
    CONTENT
    )
 FROM
	(
	SELECT
		TO_DATE(split_part(split_part(metadata$filename, ''__'', 2), ''.'', 0)), metadata$filename,''IAPW_PORTAL_API'',TO_DATE(split_part(split_part(metadata$filename, ''__'', 2), ''.'', 0)),t.$1
	FROM
		@DATALAKE.'||io_PATH||' t
	) pattern =''.*ByCommTypeAndProduct__.*json'' file_format=(format_name=DB_IAW_'||ENV||'_STG.IAPW_PORTAL_API.JSON_FORMAT);
              ';

EXECUTE IMMEDIATE :INS_PRE_QUERY;
EXECUTE IMMEDIATE :INS_COPY_QUERY;
END
$$;

create procedure IAPW_PORTAL_API.SP_CONV_LOADSTG_PSA_IAPW_PORTAL_API_TO_ASSETS_SUMMARY_BY_COMMISSIONTYPE_AND_PRODUCT_RVP(ENV VARCHAR, IO_PATH VARCHAR)
    returns VARCHAR
    language SQL
    strict
as
$$
DECLARE
INS_PRE_QUERY STRING;
INS_COPY_QUERY STRING;

BEGIN
INS_PRE_QUERY := 'DELETE FROM DB_IAW_'||ENV||'_STG.IAPW_PORTAL_API.ASSETS_SUMMARY_BYCOMMISSIONTYPE_AND_PRODUCT_RVP WHERE 1=1;';
INS_COPY_QUERY := '
COPY INTO DB_IAW_'||ENV||'_STG.IAPW_PORTAL_API.ASSETS_SUMMARY_BYCOMMISSIONTYPE_AND_PRODUCT_RVP
(
    MD_START_DT,
    MD_SOURCE,
	MD_SRC_SYSTEM,
	MD_EXTRACT_DT,
	RVPID,
    CONTENT
    )
 FROM
	(
	SELECT
		TO_DATE(split_part(split_part(metadata$filename, ''__'', 2), ''.'', 0)), metadata$filename,''IAPW_PORTAL_API'',TO_DATE(split_part(split_part(metadata$filename, ''__'', 2), ''.'', 0)),split_part(split_part(metadata$filename,''#'',2),''__'',0),t.$1
	FROM
		@DATALAKE.'||io_PATH||' t
	) pattern =''.*ByCommTypeAndProduct_RVP#.*__.*json'' file_format=(format_name=DB_IAW_'||ENV||'_STG.IAPW_PORTAL_API.JSON_FORMAT);
              ';

EXECUTE IMMEDIATE :INS_PRE_QUERY;
EXECUTE IMMEDIATE :INS_COPY_QUERY;
END
$$;

create procedure IAPW_PORTAL_API.SP_CONV_LOADSTG_PSA_IAPW_PORTAL_API_TO_ASSETS_SUMMARY_LAST_13_MONTHS_BYCOMMISSIONTYPE(ENV VARCHAR, IO_PATH VARCHAR)
    returns VARCHAR
    language SQL
    strict
as
$$
DECLARE
INS_PRE_QUERY STRING;
INS_COPY_QUERY STRING;

BEGIN
INS_PRE_QUERY := 'DELETE FROM DB_IAW_'||ENV||'_STG.IAPW_PORTAL_API.ASSETS_SUMMARY_LAST_13_MONTHS_BYCOMMISSIONTYPE WHERE 1=1;';
INS_COPY_QUERY := '
COPY INTO DB_IAW_'||ENV||'_STG.IAPW_PORTAL_API.ASSETS_SUMMARY_LAST_13_MONTHS_BYCOMMISSIONTYPE
(
    MD_START_DT,
    MD_SOURCE,
	MD_SRC_SYSTEM,
	MD_EXTRACT_DT,
    CONTENT
    )
 FROM
	(
	SELECT
		TO_DATE(split_part(split_part(metadata$filename, ''__'', 2), ''.'', 0)), metadata$filename,''IAPW_PORTAL_API'',TO_DATE(split_part(split_part(metadata$filename, ''__'', 2), ''.'', 0)),t.$1
	FROM
		@DATALAKE.'||io_PATH||' t
	) pattern =''.*ByCommissionType_13months__.*json''file_format=(format_name=DB_IAW_'||ENV||'_STG.IAPW_PORTAL_API.JSON_FORMAT);
              ';

EXECUTE IMMEDIATE :INS_PRE_QUERY;
EXECUTE IMMEDIATE :INS_COPY_QUERY;
END
$$;

create procedure IAPW_PORTAL_API.SP_CONV_LOADSTG_PSA_IAPW_PORTAL_API_TO_ASSETS_SUMMARY_LAST_13_MONTHS_BYPRODUCT(ENV VARCHAR, IO_PATH VARCHAR)
    returns VARCHAR
    language SQL
    strict
as
$$
DECLARE
INS_PRE_QUERY STRING;
INS_COPY_QUERY STRING;

BEGIN
INS_PRE_QUERY := 'DELETE FROM DB_IAW_'||ENV||'_STG.IAPW_PORTAL_API.ASSETS_SUMMARY_LAST_13_MONTHS_BYPRODUCT WHERE 1=1;';
INS_COPY_QUERY := '
COPY INTO DB_IAW_'||ENV||'_STG.IAPW_PORTAL_API.ASSETS_SUMMARY_LAST_13_MONTHS_BYPRODUCT
(
    MD_START_DT,
    MD_SOURCE,
	MD_SRC_SYSTEM,
	MD_EXTRACT_DT,
    CONTENT
    )
 FROM
	(
	SELECT
		TO_DATE(split_part(split_part(metadata$filename, ''__'', 2), ''.'', 0)), metadata$filename,''IAPW_PORTAL_API'',TO_DATE(split_part(split_part(metadata$filename, ''__'', 2), ''.'', 0)),t.$1
	FROM
		@DATALAKE.'||io_PATH||' t
	) pattern =''.*ByProduct_13months__.*json''file_format=(format_name=DB_IAW_'||ENV||'_STG.IAPW_PORTAL_API.JSON_FORMAT);
              ';

EXECUTE IMMEDIATE :INS_PRE_QUERY;
EXECUTE IMMEDIATE :INS_COPY_QUERY;
END
$$;

create procedure INVESTIA.SP_CONV_LOADSTG_PSA_IAPW_TO_STG_MASTER_KPI_DATA_CLARINGTON(ENV VARCHAR, IO_PATH VARCHAR)
    returns VARCHAR
    language SQL
    strict
as
$$
DECLARE
INS_PRE_DEL STRING;
INS_PRE_COPY STRING;
INS_UPDATE STRING;
BEGIN
INS_PRE_DEL := 'DELETE FROM DB_IAW_'||ENV||'_STG.EXTERNAL_KPI.REF_MASTER_KPI_DATA_CLARINGTON WHERE 1=1';
INS_PRE_COPY := '

COPY INTO EXTERNAL_KPI.REF_MASTER_KPI_DATA_CLARINGTON
(
MD_START_DT,
MD_SOURCE,
MD_EXTRACT_DT,
KPI_DATE,
TRADE_ACCOUNT_PROCESSING_AUTOMATION_PCT_MF,
TRADE_ACCOUNT_PROCESSING_AUTOMATION_PCT_GIF,
FTE,
TOTAL_TRANSACTIONS_MF,
TOTAL_TRANSACTIONS_GIF,
TOTAL_TRANSACTIONS_FTE_MF,
TOTAL_TRANSACTIONS_FTE_GIF,
NO_OF_ACCOUNTS,
ACCOUNTS_FTE,
ACCOUNTS_FTE_TARGET,
YOY_NEW_ACCOUNTS_CLIENT_NAME,
YOY_NEW_ACCOUNTS_CLIENT_NOMINEE,
TOTAL_ACCOUNTS_IN_NOMINEE,
EXPENSES,
REVENUES,
EFFICIENCY_RATIO,
EXPENSES_TARGET,
REVENUE_TARGET,
EFFICIENCY_RATIO_TARGET,
TOTAL_ASSETS,
AFFILIATE_PENETRATION_IIROC,
AFFILIATE_PENETRATION_IIROC_TARGET,
AFFILIATE_PENETRATION_MFDA,
AFFILIATE_PENETRATION_MFDA_TARGET,
GROSS_MARGIN,
GROSS_MARGIN_TARGET,
NET_SALES
)
FROM
(
SELECT
TO_DATE(split_part(split_part(metadata$filename, ''__'', 2), ''.'', 0)), metadata$filename,
t.$1,t.$1, t.$2, t.$3, t.$4, t.$5, t.$6, t.$7, t.$8, t.$9, t.$10, t.$11,
t.$12, t.$13, t.$14, t.$15, t.$16, t.$17, t.$18, t.$19, t.$20, t.$21, t.$22,
t.$23, t.$24, t.$25, t.$26, t.$27, t.$28
FROM
@DATALAKE.'||IO_PATH||' t
) pattern = ''.*MASTER_KPI_DATA_CLARINGTON__.*csv'' file_format =(format_name = DB_IAW_'||ENV||'_STG.EXTERNAL_KPI.CSV_UTF8)
';
INS_UPDATE := '
	UPDATE DB_IAW_'||ENV||'_STG.EXTERNAL_KPI.REF_MASTER_KPI_DATA_CLARINGTON  
	SET
	HK_HUB=
	SHA1(COALESCE(TRIM("KPI_DATE"), ''#NULL#'')),
	MD_HASHDIFF=
	SHA1(CONCAT(
	COALESCE(TO_VARCHAR(TRADE_ACCOUNT_PROCESSING_AUTOMATION_PCT_MF) , ''#NULL#''), ''|''
,  COALESCE(TO_VARCHAR(TRADE_ACCOUNT_PROCESSING_AUTOMATION_PCT_GIF) , ''#NULL#''), ''|''
,  COALESCE(TO_VARCHAR(FTE) , ''#NULL#''), ''|''
,  COALESCE(TO_VARCHAR(TOTAL_TRANSACTIONS_MF) , ''#NULL#''), ''|''
,  COALESCE(TO_VARCHAR(TOTAL_TRANSACTIONS_GIF) , ''#NULL#''), ''|''
,  COALESCE(TO_VARCHAR(TOTAL_TRANSACTIONS_FTE_MF) , ''#NULL#''), ''|''
,  COALESCE(TO_VARCHAR(TOTAL_TRANSACTIONS_FTE_GIF) , ''#NULL#''), ''|''
,  COALESCE(TO_VARCHAR(NO_OF_ACCOUNTS) , ''#NULL#''), ''|''
,  COALESCE(TO_VARCHAR(ACCOUNTS_FTE) , ''#NULL#''), ''|''
,  COALESCE(TO_VARCHAR(ACCOUNTS_FTE_TARGET) , ''#NULL#''), ''|''
,  COALESCE(TO_VARCHAR(YOY_NEW_ACCOUNTS_CLIENT_NAME) , ''#NULL#''), ''|''
,  COALESCE(TO_VARCHAR(YOY_NEW_ACCOUNTS_CLIENT_NOMINEE) , ''#NULL#''), ''|''
,  COALESCE(TO_VARCHAR(TOTAL_ACCOUNTS_IN_NOMINEE) , ''#NULL#''), ''|''
,  COALESCE(TO_VARCHAR(EXPENSES) , ''#NULL#''), ''|''
,  COALESCE(TO_VARCHAR(REVENUES) , ''#NULL#''), ''|''
,  COALESCE(TO_VARCHAR(EFFICIENCY_RATIO) , ''#NULL#''), ''|''
,  COALESCE(TO_VARCHAR(EXPENSES_TARGET) , ''#NULL#''), ''|''
,  COALESCE(TO_VARCHAR(REVENUE_TARGET) , ''#NULL#''), ''|''
,  COALESCE(TO_VARCHAR(EFFICIENCY_RATIO_TARGET) , ''#NULL#''), ''|''
,  COALESCE(TO_VARCHAR(TOTAL_ASSETS) , ''#NULL#''), ''|''
,  COALESCE(TO_VARCHAR(AFFILIATE_PENETRATION_IIROC) , ''#NULL#''), ''|''
,  COALESCE(TO_VARCHAR(AFFILIATE_PENETRATION_IIROC_TARGET) , ''#NULL#''), ''|''
,  COALESCE(TO_VARCHAR(AFFILIATE_PENETRATION_MFDA) , ''#NULL#''), ''|''
,  COALESCE(TO_VARCHAR(AFFILIATE_PENETRATION_MFDA_TARGET) , ''#NULL#''), ''|''
,  COALESCE(TO_VARCHAR(GROSS_MARGIN) , ''#NULL#''), ''|''
,  COALESCE(TO_VARCHAR(GROSS_MARGIN_TARGET) , ''#NULL#''), ''|''
,  COALESCE(TO_VARCHAR(NET_SALES) , ''#NULL#'')
)),
MD_CREATION_DT=systimestamp(),
MD_SRC_SYSTEM =''CLARINGTON_MONTHLY_KPI''
Where 1=1';
EXECUTE IMMEDIATE :INS_PRE_DEL;
EXECUTE IMMEDIATE :INS_PRE_COPY;
EXECUTE IMMEDIATE :INS_UPDATE;
END
$$;

create procedure EXTERNAL_KPI.SP_CONV_LOADSTG_PSA_IAPW_TO_STG_MASTER_KPI_DATA_CLARINGTON(ENV VARCHAR, IO_PATH VARCHAR)
    returns VARCHAR
    language SQL
    strict
as
$$
DECLARE
INS_PRE_DEL STRING;
INS_PRE_COPY STRING;
INS_UPDATE STRING;
BEGIN
INS_PRE_DEL := 'DELETE FROM DB_IAW_'||ENV||'_STG.EXTERNAL_KPI.REF_MASTER_KPI_DATA_CLARINGTON WHERE 1=1';
INS_PRE_COPY := '

COPY INTO DB_IAW_'||ENV||'_STG.EXTERNAL_KPI.REF_MASTER_KPI_DATA_CLARINGTON
(
MD_START_DT,
MD_SOURCE,
MD_EXTRACT_DT,
KPI_DATE,
TRADE_ACCOUNT_PROCESSING_AUTOMATION_PCT_MF,
TRADE_ACCOUNT_PROCESSING_AUTOMATION_PCT_GIF,
FTE,
TOTAL_TRANSACTIONS_MF,
TOTAL_TRANSACTIONS_GIF,
TOTAL_TRANSACTIONS_FTE_MF,
TOTAL_TRANSACTIONS_FTE_GIF,
NO_OF_ACCOUNTS,
ACCOUNTS_FTE,
ACCOUNTS_FTE_TARGET,
YOY_NEW_ACCOUNTS_CLIENT_NAME,
YOY_NEW_ACCOUNTS_CLIENT_NOMINEE,
TOTAL_ACCOUNTS_IN_NOMINEE,
EXPENSES,
REVENUES,
EFFICIENCY_RATIO,
EXPENSES_TARGET,
REVENUE_TARGET,
EFFICIENCY_RATIO_TARGET,
TOTAL_ASSETS,
AFFILIATE_PENETRATION_IIROC,
AFFILIATE_PENETRATION_IIROC_TARGET,
AFFILIATE_PENETRATION_MFDA,
AFFILIATE_PENETRATION_MFDA_TARGET,
GROSS_MARGIN,
GROSS_MARGIN_TARGET,
NET_SALES
)
FROM
(
SELECT
TO_DATE(split_part(split_part(metadata$filename, ''__'', 2), ''.'', 0)), metadata$filename,
t.$1,t.$1, t.$2, t.$3, t.$4, t.$5, t.$6, t.$7, t.$8, t.$9, t.$10, t.$11,
t.$12, t.$13, t.$14, t.$15, t.$16, t.$17, t.$18, t.$19, t.$20, t.$21, t.$22,
t.$23, t.$24, t.$25, t.$26, t.$27, t.$28
FROM
@DATALAKE.'||IO_PATH||' t
) pattern = ''.*MASTER_KPI_DATA_CLARINGTON__.*csv'' file_format =(format_name = DB_IAW_'||ENV||'_STG.EXTERNAL_KPI.CSV_UTF8)
';
INS_UPDATE := '
	UPDATE DB_IAW_'||ENV||'_STG.EXTERNAL_KPI.REF_MASTER_KPI_DATA_CLARINGTON  
	SET
	HK_HUB=
	SHA1(COALESCE(TRIM("KPI_DATE"), ''#NULL#'')),
	MD_HASHDIFF=
	SHA1(CONCAT(
	COALESCE(TO_VARCHAR(TRADE_ACCOUNT_PROCESSING_AUTOMATION_PCT_MF) , ''#NULL#''), ''|''
,  COALESCE(TO_VARCHAR(TRADE_ACCOUNT_PROCESSING_AUTOMATION_PCT_GIF) , ''#NULL#''), ''|''
,  COALESCE(TO_VARCHAR(FTE) , ''#NULL#''), ''|''
,  COALESCE(TO_VARCHAR(TOTAL_TRANSACTIONS_MF) , ''#NULL#''), ''|''
,  COALESCE(TO_VARCHAR(TOTAL_TRANSACTIONS_GIF) , ''#NULL#''), ''|''
,  COALESCE(TO_VARCHAR(TOTAL_TRANSACTIONS_FTE_MF) , ''#NULL#''), ''|''
,  COALESCE(TO_VARCHAR(TOTAL_TRANSACTIONS_FTE_GIF) , ''#NULL#''), ''|''
,  COALESCE(TO_VARCHAR(NO_OF_ACCOUNTS) , ''#NULL#''), ''|''
,  COALESCE(TO_VARCHAR(ACCOUNTS_FTE) , ''#NULL#''), ''|''
,  COALESCE(TO_VARCHAR(ACCOUNTS_FTE_TARGET) , ''#NULL#''), ''|''
,  COALESCE(TO_VARCHAR(YOY_NEW_ACCOUNTS_CLIENT_NAME) , ''#NULL#''), ''|''
,  COALESCE(TO_VARCHAR(YOY_NEW_ACCOUNTS_CLIENT_NOMINEE) , ''#NULL#''), ''|''
,  COALESCE(TO_VARCHAR(TOTAL_ACCOUNTS_IN_NOMINEE) , ''#NULL#''), ''|''
,  COALESCE(TO_VARCHAR(EXPENSES) , ''#NULL#''), ''|''
,  COALESCE(TO_VARCHAR(REVENUES) , ''#NULL#''), ''|''
,  COALESCE(TO_VARCHAR(EFFICIENCY_RATIO) , ''#NULL#''), ''|''
,  COALESCE(TO_VARCHAR(EXPENSES_TARGET) , ''#NULL#''), ''|''
,  COALESCE(TO_VARCHAR(REVENUE_TARGET) , ''#NULL#''), ''|''
,  COALESCE(TO_VARCHAR(EFFICIENCY_RATIO_TARGET) , ''#NULL#''), ''|''
,  COALESCE(TO_VARCHAR(TOTAL_ASSETS) , ''#NULL#''), ''|''
,  COALESCE(TO_VARCHAR(AFFILIATE_PENETRATION_IIROC) , ''#NULL#''), ''|''
,  COALESCE(TO_VARCHAR(AFFILIATE_PENETRATION_IIROC_TARGET) , ''#NULL#''), ''|''
,  COALESCE(TO_VARCHAR(AFFILIATE_PENETRATION_MFDA) , ''#NULL#''), ''|''
,  COALESCE(TO_VARCHAR(AFFILIATE_PENETRATION_MFDA_TARGET) , ''#NULL#''), ''|''
,  COALESCE(TO_VARCHAR(GROSS_MARGIN) , ''#NULL#''), ''|''
,  COALESCE(TO_VARCHAR(GROSS_MARGIN_TARGET) , ''#NULL#''), ''|''
,  COALESCE(TO_VARCHAR(NET_SALES) , ''#NULL#'')
)),
MD_CREATION_DT=systimestamp(),
MD_SRC_SYSTEM =''CLARINGTON_MONTHLY_KPI''
Where 1=1';
EXECUTE IMMEDIATE :INS_PRE_DEL;
EXECUTE IMMEDIATE :INS_PRE_COPY;
EXECUTE IMMEDIATE :INS_UPDATE;
END
$$;

create procedure EXTERNAL_KPI.SP_CONV_LOADSTG_PSA_IAPW_TO_STG_MASTER_KPI_DATA_IAPW(ENV VARCHAR, IO_PATH VARCHAR)
    returns VARCHAR
    language SQL
    strict
as
$$
DECLARE
INS_PRE_DEL STRING;
INS_PRE_COPY STRING;
INS_UPDATE STRING;
BEGIN
INS_PRE_DEL := 'DELETE FROM DB_IAW_'||ENV||'_STG.EXTERNAL_KPI.REF_MASTER_KPI_DATA_IAPW WHERE 1=1';
INS_PRE_COPY := '
COPY INTO DB_IAW_'||ENV||'_STG.EXTERNAL_KPI.REF_MASTER_KPI_DATA_IAPW
(
MD_START_DT,
MD_SOURCE,
MD_EXTRACT_DT,
KPI_DATE,
NO_OF_ACTIVE_CLIENTS,
NO_OF_ACTIVE_ACCOUNTS,
FTE,
ACCOUNTS_FTE,
ACCOUNTS_FTE_TARGET,
APPWAY_REGISTRATION,
APPWAY_REGISTRATION_TARGET,
NO_OF_CLIENT_ID_REGISTERED,
PORTAL_REGISTRATION,
PORTAL_REGISTRATION_TARGET,
MYPORTFOLIO_TO_NEW_CLIENT,
E_DELIVERY_PORTFOLIO_STATEMENTS,
E_DELIVERY_TAX_SLIPS,
E_DELIVERY_CONFIRMS,
AVG_E_DELIVERY_REGISTRATION,
E_DELIVERY_REGISTRATION_TARGET,
RETAIL_YTD_EXPENSES,
RETAIL_YTD_REVENUES,
RETAIL_FINANCIAL_EFFICIENCY_RATIO,
RETAIL_YTD_EXPENSES_TARGET,
RETAIL_YTD_REVENUES_TARGET,
RETAIL_EFFICIENCY_RATIO_TARGET,
CAP_MRKTS_YTD_EXPENSES,
CAP_MKTS_YTD_REVENUES,
CAP_MRKTS_EFFICIENCY_RATIO,
CAP_MRKTS_YTD_EXPENSES_TARGET,
CAP_MRKTS_YTD_REVENUES_TARGET,
CAP_MRKTS_EFFICIENCY_RATIO_TARGET,
TOTAL_ASSETS,
NET_TOTAL_REVENUE,
NET_TOTAL_REVENUE_TARGET,
NET_BOND_DESK_REVENUE,
NET_BOND_DESK_REVENUE_TARGET,
CAPITAL_MKTS_REVENUE,
CAPITAL_MKTS_REVENUE_TARGET,
NET_RETAIL_REVENUE,
NET_RETAIL_REVENUE_TARGET,
RECRUITING,
TERMINATED_ADVISORS,
ORGANIC_GROWTH,
SMALL_HOUSEHOLDS,
US_ASSETS,
EBIT_RETAIL,
EBIT_TOTAL
)
FROM
(
SELECT
TO_DATE(split_part(split_part(metadata$filename, ''__'', 2), ''.'', 0)), metadata$filename,
t.$1, t.$1, t.$2, t.$3, t.$4, t.$5, t.$6, t.$7, t.$8, t.$9,t.$10, t.$11, t.$12, t.$13, t.$14, t.$15, t.$16, t.$17, t.$18,
           t.$19, t.$20, t.$21, t.$22, t.$23, t.$24, t.$25, t.$26, t.$27,t.$28, t.$29, t.$30, t.$31, t.$32, t.$33, t.$34, t.$35, t.$36,t.$37, t.$38, t.$39,t.$40,t.$41,t.$42,t.$43,t.$44,t.$45
FROM
@DATALAKE.'||IO_PATH||' t
) pattern = ''.*MASTER_KPI_DATA_IAPW__.*csv'' file_format =(format_name = EXTERNAL_KPI.CSV_UTF8);
';
INS_UPDATE := '
UPDATE DB_IAW_'||ENV||'_STG.EXTERNAL_KPI.REF_MASTER_KPI_DATA_IAPW  
SET
HK_HUB=
SHA1(COALESCE(TRIM("KPI_DATE"), ''#NULL#'')),
MD_HASHDIFF=
SHA1(CONCAT(
   COALESCE(TO_VARCHAR(NO_OF_ACTIVE_CLIENTS) , ''#NULL#''), ''|''
,  COALESCE(TO_VARCHAR(NO_OF_ACTIVE_ACCOUNTS) , ''#NULL#''), ''|''
,  COALESCE(TO_VARCHAR(FTE) , ''#NULL#''), ''|''
,  COALESCE(TO_VARCHAR(ACCOUNTS_FTE) , ''#NULL#''), ''|''
,  COALESCE(TO_VARCHAR(ACCOUNTS_FTE_TARGET) , ''#NULL#''), ''|''
,  COALESCE(TO_VARCHAR(APPWAY_REGISTRATION) , ''#NULL#''), ''|''
,  COALESCE(TO_VARCHAR(APPWAY_REGISTRATION_TARGET) , ''#NULL#''), ''|''
,  COALESCE(TO_VARCHAR(NO_OF_CLIENT_ID_REGISTERED) , ''#NULL#''), ''|''
,  COALESCE(TO_VARCHAR(PORTAL_REGISTRATION) , ''#NULL#''), ''|''
,  COALESCE(TO_VARCHAR(PORTAL_REGISTRATION_TARGET) , ''#NULL#''), ''|''
,  COALESCE(TO_VARCHAR(MYPORTFOLIO_TO_NEW_CLIENT) , ''#NULL#''), ''|''
,  COALESCE(TO_VARCHAR(E_DELIVERY_PORTFOLIO_STATEMENTS) , ''#NULL#''), ''|''
,  COALESCE(TO_VARCHAR(E_DELIVERY_TAX_SLIPS) , ''#NULL#''), ''|''
,  COALESCE(TO_VARCHAR(E_DELIVERY_CONFIRMS) , ''#NULL#''), ''|''
,  COALESCE(TO_VARCHAR(AVG_E_DELIVERY_REGISTRATION) , ''#NULL#''), ''|''
,  COALESCE(TO_VARCHAR(E_DELIVERY_REGISTRATION_TARGET) , ''#NULL#''), ''|''
,  COALESCE(TO_VARCHAR(RETAIL_YTD_EXPENSES) , ''#NULL#''), ''|''
,  COALESCE(TO_VARCHAR(RETAIL_YTD_REVENUES) , ''#NULL#''), ''|''
,  COALESCE(TO_VARCHAR(RETAIL_FINANCIAL_EFFICIENCY_RATIO) , ''#NULL#''), ''|''
,  COALESCE(TO_VARCHAR(RETAIL_YTD_EXPENSES_TARGET) , ''#NULL#''), ''|''
,  COALESCE(TO_VARCHAR(RETAIL_YTD_REVENUES_TARGET) , ''#NULL#''), ''|''
,  COALESCE(TO_VARCHAR(RETAIL_EFFICIENCY_RATIO_TARGET) , ''#NULL#''), ''|''
,  COALESCE(TO_VARCHAR(CAP_MRKTS_YTD_EXPENSES) , ''#NULL#''), ''|''
,  COALESCE(TO_VARCHAR(CAP_MKTS_YTD_REVENUES) , ''#NULL#''), ''|''
,  COALESCE(TO_VARCHAR(CAP_MRKTS_EFFICIENCY_RATIO) , ''#NULL#''), ''|''
,  COALESCE(TO_VARCHAR(CAP_MRKTS_YTD_EXPENSES_TARGET) , ''#NULL#''),''|''
,  COALESCE(TO_VARCHAR(CAP_MRKTS_YTD_REVENUES_TARGET) , ''#NULL#''), ''|''
,  COALESCE(TO_VARCHAR(CAP_MRKTS_EFFICIENCY_RATIO_TARGET) , ''#NULL#''), ''|''
,  COALESCE(TO_VARCHAR(TOTAL_ASSETS) , ''#NULL#''), ''|''
,  COALESCE(TO_VARCHAR(NET_TOTAL_REVENUE) , ''#NULL#''), ''|''
,  COALESCE(TO_VARCHAR(NET_TOTAL_REVENUE_TARGET) , ''#NULL#''), ''|''
,  COALESCE(TO_VARCHAR(NET_BOND_DESK_REVENUE) , ''#NULL#''), ''|''
,  COALESCE(TO_VARCHAR(NET_BOND_DESK_REVENUE_TARGET) , ''#NULL#''), ''|''
,  COALESCE(TO_VARCHAR(CAPITAL_MKTS_REVENUE) , ''#NULL#''), ''|''
,  COALESCE(TO_VARCHAR(CAPITAL_MKTS_REVENUE_TARGET) , ''#NULL#''), ''|''
,  COALESCE(TO_VARCHAR(NET_RETAIL_REVENUE) , ''#NULL#''), ''|''
,  COALESCE(TO_VARCHAR(NET_RETAIL_REVENUE_TARGET) , ''#NULL#''), ''|''
,  COALESCE(TO_VARCHAR(RECRUITING) , ''#NULL#''), ''|''
,  COALESCE(TO_VARCHAR(TERMINATED_ADVISORS) , ''#NULL#''), ''|''
,  COALESCE(TO_VARCHAR(ORGANIC_GROWTH) , ''#NULL#''), ''|''
,  COALESCE(TO_VARCHAR(SMALL_HOUSEHOLDS) , ''#NULL#''), ''|''
,  COALESCE(TO_VARCHAR(US_ASSETS) , ''#NULL#''), ''|''
,  COALESCE(TO_VARCHAR(EBIT_RETAIL) , ''#NULL#''), ''|''
,  COALESCE(TO_VARCHAR(EBIT_TOTAL) , ''#NULL#'')
)),
MD_CREATION_DT=systimestamp(),
MD_SRC_SYSTEM =''IAPW_MONTHLY_KPI''
Where 1=1';
EXECUTE IMMEDIATE :INS_PRE_DEL;
EXECUTE IMMEDIATE :INS_PRE_COPY;
EXECUTE IMMEDIATE :INS_UPDATE;
END
$$;

create procedure EXTERNAL_KPI.SP_CONV_LOADSTG_PSA_IAPW_TO_STG_MASTER_KPI_DATA_INVESTIA(ENV VARCHAR, IO_PATH VARCHAR)
    returns VARCHAR
    language SQL
    strict
as
$$
DECLARE
INS_PRE_DEL STRING;
INS_PRE_COPY STRING;
INS_UPDATE STRING;
BEGIN
INS_PRE_DEL := 'DELETE FROM DB_IAW_'||ENV||'_STG.EXTERNAL_KPI.REF_MASTER_KPI_DATA_INVESTIA WHERE 1=1';
INS_PRE_COPY := '
COPY INTO DB_IAW_'||ENV||'_STG.EXTERNAL_KPI.REF_MASTER_KPI_DATA_INVESTIA
(
MD_START_DT,
MD_SOURCE,
MD_EXTRACT_DT,
KPI_DATE,
NO_CLIENT_ID,
E_DELIVERY,
E_DELIVERY_PCT,
E_DELIVERY_TARGET_PCT,
PORTAL_REGISTRATION,
PORTAL_REGISTRATION_PCT,
PORTAL_REGISTRATION_TARGET,
FTE,
CLIENTS_BY_FTE,
CLIENTS_BY_FTE_TARGET,
NO_OF_ACCOUNTS,
ACCOUNTS_BY_FTE,
ACTUAL_YTD_EXPENSES,
ACTUAL_YTD_REVENUES,
EFFICIENCY_RATIO,
YTD_EXPENSES_TARGET,
YTD_REVENUES_TARGET,
EFFICIENCY_RATIO_TARGET,
AUA_IN_NOMINEE,
AUA_IN_CLIENT_NAME,
NO_OF_RPAS_IMPLEMENTED,
HOURS_SAVED_DUE_TO_RPAS,
CONTINUOUS_IMPROVEMENT_QUICK_WINS,
TOTAL_ASSETS,
ORGANIC_GROWTH,
TOTAL_REVENUE,
TOTAL_REVENUE_TARGET,
RECRUITING,
TERMINATED_ADVISORS
)
FROM
	(
	SELECT
		TO_DATE(split_part(split_part(metadata$filename, ''__'', 2), ''.'', 0)), metadata$filename,
				t.$1,t.$1, t.$2, t.$3, t.$4, t.$5, t.$6, t.$7, t.$8, t.$9, t.$10, t.$11,
					t.$12, t.$13, t.$14, t.$15, t.$16, t.$17, t.$18, t.$19, t.$20, t.$21, t.$22,
						t.$23, t.$24, t.$25, t.$26, t.$27, t.$28, t.$29, t.$30
	FROM
		@DATALAKE.'||IO_PATH||' t
	) pattern = ''.*MASTER_KPI_DATA_INVESTIA__.*csv'' file_format =(format_name = DB_IAW_'||ENV||'_STG.EXTERNAL_KPI.CSV_UTF8)
              ';
INS_UPDATE := '
	UPDATE DB_IAW_'||ENV||'_STG.EXTERNAL_KPI.REF_MASTER_KPI_DATA_INVESTIA
	SET
	HK_HUB=
	SHA1( UPPER(CONCAT(COALESCE(TRIM(KPI_DATE), ''#NULL#''))) ),
	MD_HASHDIFF=
	SHA1(CONCAT(
		   COALESCE(TRIM(NO_CLIENT_ID), ''#NULL#''), ''|''
		,  COALESCE(TO_VARCHAR(E_DELIVERY) , ''#NULL#''), ''|''
		,  COALESCE(TO_VARCHAR(E_DELIVERY_PCT) , ''#NULL#''), ''|''
		,  COALESCE(TO_VARCHAR(E_DELIVERY_TARGET_PCT) , ''#NULL#''), ''|''
		,  COALESCE(TO_VARCHAR(PORTAL_REGISTRATION) , ''#NULL#''), ''|''
		,  COALESCE(TO_VARCHAR(PORTAL_REGISTRATION_PCT) , ''#NULL#''), ''|''
		,  COALESCE(TO_VARCHAR(PORTAL_REGISTRATION_TARGET) , ''#NULL#''), ''|''
		,  COALESCE(TO_VARCHAR(FTE) , ''#NULL#''), ''|''
		,  COALESCE(TO_VARCHAR(CLIENTS_BY_FTE) , ''#NULL#''), ''|''
		,  COALESCE(TO_VARCHAR(CLIENTS_BY_FTE_TARGET) , ''#NULL#''), ''|''
		,  COALESCE(TO_VARCHAR(NO_OF_ACCOUNTS) , ''#NULL#''), ''|''
		,  COALESCE(TO_VARCHAR(ACCOUNTS_BY_FTE) , ''#NULL#''), ''|''
		,  COALESCE(TO_VARCHAR(ACTUAL_YTD_EXPENSES) , ''#NULL#''), ''|''
		,  COALESCE(TO_VARCHAR(ACTUAL_YTD_REVENUES) , ''#NULL#''), ''|''
		,  COALESCE(TO_VARCHAR(EFFICIENCY_RATIO) , ''#NULL#''), ''|''
		,  COALESCE(TO_VARCHAR(YTD_EXPENSES_TARGET) , ''#NULL#''), ''|''
		,  COALESCE(TO_VARCHAR(YTD_REVENUES_TARGET) , ''#NULL#''), ''|''
		,  COALESCE(TO_VARCHAR(EFFICIENCY_RATIO_TARGET) , ''#NULL#''), ''|''
		,  COALESCE(TO_VARCHAR(AUA_IN_NOMINEE) , ''#NULL#''), ''|''
		,  COALESCE(TO_VARCHAR(AUA_IN_CLIENT_NAME) , ''#NULL#''), ''|''
		,  COALESCE(TO_VARCHAR(NO_OF_RPAS_IMPLEMENTED) , ''#NULL#''), ''|''
		,  COALESCE(TO_VARCHAR(HOURS_SAVED_DUE_TO_RPAS) , ''#NULL#''), ''|''
		,  COALESCE(TO_VARCHAR(CONTINUOUS_IMPROVEMENT_QUICK_WINS) , ''#NULL#''), ''|''
		,  COALESCE(TO_VARCHAR(TOTAL_ASSETS) , ''#NULL#''), ''|''
		,  COALESCE(TO_VARCHAR(ORGANIC_GROWTH) , ''#NULL#''), ''|''
		,  COALESCE(TO_VARCHAR(TOTAL_REVENUE) , ''#NULL#''), ''|''
		,  COALESCE(TO_VARCHAR(TOTAL_REVENUE_TARGET) , ''#NULL#''), ''|''
		,  COALESCE(TO_VARCHAR(RECRUITING) , ''#NULL#''), ''|''
		,  COALESCE(TO_VARCHAR(TERMINATED_ADVISORS) , ''#NULL#'')
	)),	
	MD_CREATION_DT=systimestamp(),
	MD_SRC_SYSTEM =''INVESTIA_MONTHLY_KPI''
	Where 1=1';

EXECUTE IMMEDIATE :INS_PRE_DEL;
EXECUTE IMMEDIATE :INS_PRE_COPY;
EXECUTE IMMEDIATE :INS_UPDATE;
END
$$;

create procedure PUBLIC.SP_CONV_LOADSTG_PSA_IAPW_TO_STG_REF_MASTER_KPI_DATA_CLARINGTON(ENV VARCHAR, IO_PATH VARCHAR)
    returns VARCHAR
    language SQL
    strict
as
$$
DECLARE
INS_PRE_DEL STRING;
INS_PRE_COPY STRING;
INS_UPDATE STRING;
BEGIN
INS_PRE_DEL := 'DELETE FROM DB_IAW_'||ENV||'_STG.EXTERNAL_KPI.REF_MASTER_KPI_DATA_CLARINGTON WHERE 1=1';
INS_PRE_COPY := '
COPY INTO DB_IAW_'||ENV||'_STG.EXTERNAL_KPI.REF_MASTER_KPI_DATA_CLARINGTON
(
COPY INTO EXTERNAL_KPI.REF_MASTER_KPI_DATA_CLARINGTON
(
MD_START_DT,
MD_SOURCE,
MD_EXTRACT_DT,
KPI_DATE,
TRADE_ACCOUNT_PROCESSING_AUTOMATION_PCT_MF,
TRADE_ACCOUNT_PROCESSING_AUTOMATION_PCT_GIF,
FTE,
TOTAL_TRANSACTIONS_MF,
TOTAL_TRANSACTIONS_GIF,
TOTAL_TRANSACTIONS_FTE_MF,
TOTAL_TRANSACTIONS_FTE_GIF,
NO_OF_ACCOUNTS,
ACCOUNTS_FTE,
ACCOUNTS_FTE_TARGET,
YOY_NEW_ACCOUNTS_CLIENT_NAME,
YOY_NEW_ACCOUNTS_CLIENT_NOMINEE,
EXPENSES,
REVENUES,
EFFICIENCY_RATIO,
EXPENSES_TARGET,
REVENUE_TARGET,
EFFICIENCY_RATIO_TARGET,
TOTAL_ASSETS,
AFFILIATE_PENETRATION_IIROC,
AFFILIATE_PENETRATION_IIROC_TARGET,
AFFILIATE_PENETRATION_MFDA,
AFFILIATE_PENETRATION_MFDA_TARGET,
GROSS_MARGIN,
GROSS_MARGIN_TARGET,
NET_SALES,
NO_OF_ACCOUNTS_CLIENT_NAME,
NO_OF_ACCOUNTS_NOMINEE
)
FROM
(
SELECT
TO_DATE(split_part(split_part(metadata$filename, ''__'', 2), ''.'', 0)), metadata$filename,
t.$1,t.$1, t.$2, t.$3, t.$4, t.$5, t.$6, t.$7, t.$8, t.$9, t.$10, t.$11,
t.$12, t.$13, t.$14, t.$15, t.$16, t.$17, t.$18, t.$19, t.$20, t.$21, t.$22,
t.$23, t.$24, t.$25, t.$26, t.$27, t.$28, t.$29
FROM
@DATALAKE.'||IO_PATH||' t
) pattern = ''.*MASTER_KPI_DATA_CLARINGTON__.*csv'' file_format =(format_name = DB_IAW_'||ENV||'_STG.EXTERNAL_KPI.CSV_UTF8)
';
INS_UPDATE := '
	UPDATE DB_IAW_'||ENV||'_STG.EXTERNAL_KPI.REF_MASTER_KPI_DATA_CLARINGTON  
	SET
	HK_HUB=
	SHA1(COALESCE(TRIM("KPI_DATE"), ''#NULL#'')),
	MD_HASHDIFF=
	SHA1(CONCAT(
	COALESCE(TO_VARCHAR(TRADE_ACCOUNT_PROCESSING_AUTOMATION_PCT_MF) , ''#NULL#''), ''|''
,  COALESCE(TO_VARCHAR(TRADE_ACCOUNT_PROCESSING_AUTOMATION_PCT_GIF) , ''#NULL#''), ''|''
,  COALESCE(TO_VARCHAR(FTE) , ''#NULL#''), ''|''
,  COALESCE(TO_VARCHAR(TOTAL_TRANSACTIONS_MF) , ''#NULL#''), ''|''
,  COALESCE(TO_VARCHAR(TOTAL_TRANSACTIONS_GIF) , ''#NULL#''), ''|''
,  COALESCE(TO_VARCHAR(TOTAL_TRANSACTIONS_FTE_MF) , ''#NULL#''), ''|''
,  COALESCE(TO_VARCHAR(TOTAL_TRANSACTIONS_FTE_GIF) , ''#NULL#''), ''|''
,  COALESCE(TO_VARCHAR(NO_OF_ACCOUNTS) , ''#NULL#''), ''|''
,  COALESCE(TO_VARCHAR(ACCOUNTS_FTE) , ''#NULL#''), ''|''
,  COALESCE(TO_VARCHAR(ACCOUNTS_FTE_TARGET) , ''#NULL#''), ''|''
,  COALESCE(TO_VARCHAR(YOY_NEW_ACCOUNTS_CLIENT_NAME) , ''#NULL#''), ''|''
,  COALESCE(TO_VARCHAR(YOY_NEW_ACCOUNTS_CLIENT_NOMINEE) , ''#NULL#''), ''|''
,  COALESCE(TO_VARCHAR(EXPENSES) , ''#NULL#''), ''|''
,  COALESCE(TO_VARCHAR(REVENUES) , ''#NULL#''), ''|''
,  COALESCE(TO_VARCHAR(EFFICIENCY_RATIO) , ''#NULL#''), ''|''
,  COALESCE(TO_VARCHAR(EXPENSES_TARGET) , ''#NULL#''), ''|''
,  COALESCE(TO_VARCHAR(REVENUE_TARGET) , ''#NULL#''), ''|''
,  COALESCE(TO_VARCHAR(EFFICIENCY_RATIO_TARGET) , ''#NULL#''), ''|''
,  COALESCE(TO_VARCHAR(TOTAL_ASSETS) , ''#NULL#''), ''|''
,  COALESCE(TO_VARCHAR(AFFILIATE_PENETRATION_IIROC) , ''#NULL#''), ''|''
,  COALESCE(TO_VARCHAR(AFFILIATE_PENETRATION_IIROC_TARGET) , ''#NULL#''), ''|''
,  COALESCE(TO_VARCHAR(AFFILIATE_PENETRATION_MFDA) , ''#NULL#''), ''|''
,  COALESCE(TO_VARCHAR(AFFILIATE_PENETRATION_MFDA_TARGET) , ''#NULL#''), ''|''
,  COALESCE(TO_VARCHAR(GROSS_MARGIN) , ''#NULL#''), ''|''
,  COALESCE(TO_VARCHAR(GROSS_MARGIN_TARGET) , ''#NULL#''), ''|''
,  COALESCE(TO_VARCHAR(NET_SALES) , ''#NULL#''), ''|''
,  COALESCE(TO_VARCHAR(NO_OF_ACCOUNTS_CLIENT_NAME) , ''#NULL#''), ''|''
,  COALESCE(TO_VARCHAR(NO_OF_ACCOUNTS_NOMINEE) , ''#NULL#'')
)),
MD_CREATION_DT=systimestamp(),
MD_SRC_SYSTEM =''CLARINGTON_MONTHLY_KPI''
Where 1=1';
EXECUTE IMMEDIATE :INS_PRE_DEL;
EXECUTE IMMEDIATE :INS_PRE_COPY;
EXECUTE IMMEDIATE :INS_UPDATE;
END
$$;

create procedure EXTERNAL_KPI.SP_CONV_LOADSTG_PSA_IAPW_TO_STG_REF_MASTER_KPI_DATA_CLARINGTON(ENV VARCHAR, IO_PATH VARCHAR)
    returns VARCHAR
    language SQL
    strict
as
$$
DECLARE
INS_PRE_DEL STRING;
INS_PRE_COPY STRING;
INS_UPDATE STRING;
BEGIN
INS_PRE_DEL := 'DELETE FROM DB_IAW_'||ENV||'_STG.EXTERNAL_KPI.REF_MASTER_KPI_DATA_CLARINGTON WHERE 1=1';
INS_PRE_COPY := '
COPY INTO DB_IAW_'||ENV||'_STG.EXTERNAL_KPI.REF_MASTER_KPI_DATA_CLARINGTON
(
COPY INTO EXTERNAL_KPI.REF_MASTER_KPI_DATA_CLARINGTON
(
MD_START_DT,
MD_SOURCE,
MD_EXTRACT_DT,
KPI_DATE,
TRADE_ACCOUNT_PROCESSING_AUTOMATION_PCT_MF,
TRADE_ACCOUNT_PROCESSING_AUTOMATION_PCT_GIF,
FTE,
TOTAL_TRANSACTIONS_MF,
TOTAL_TRANSACTIONS_GIF,
TOTAL_TRANSACTIONS_FTE_MF,
TOTAL_TRANSACTIONS_FTE_GIF,
NO_OF_ACCOUNTS,
ACCOUNTS_FTE,
ACCOUNTS_FTE_TARGET,
YOY_NEW_ACCOUNTS_CLIENT_NAME,
YOY_NEW_ACCOUNTS_CLIENT_NOMINEE,
EXPENSES,
REVENUES,
EFFICIENCY_RATIO,
EXPENSES_TARGET,
REVENUE_TARGET,
EFFICIENCY_RATIO_TARGET,
TOTAL_ASSETS,
AFFILIATE_PENETRATION_IIROC,
AFFILIATE_PENETRATION_IIROC_TARGET,
AFFILIATE_PENETRATION_MFDA,
AFFILIATE_PENETRATION_MFDA_TARGET,
GROSS_MARGIN,
GROSS_MARGIN_TARGET,
NET_SALES,
NO_OF_ACCOUNTS_CLIENT_NAME,
NO_OF_ACCOUNTS_NOMINEE
)
FROM
(
SELECT
TO_DATE(split_part(split_part(metadata$filename, ''__'', 2), ''.'', 0)), metadata$filename,
t.$1,t.$1, t.$2, t.$3, t.$4, t.$5, t.$6, t.$7, t.$8, t.$9, t.$10, t.$11,
t.$12, t.$13, t.$14, t.$15, t.$16, t.$17, t.$18, t.$19, t.$20, t.$21, t.$22,
t.$23, t.$24, t.$25, t.$26, t.$27, t.$28, t.$29
FROM
@DATALAKE.'||IO_PATH||' t
) pattern = ''.*MASTER_KPI_DATA_CLARINGTON__.*csv'' file_format =(format_name = DB_IAW_'||ENV||'_STG.EXTERNAL_KPI.CSV_UTF8)
';
INS_UPDATE := '
	UPDATE DB_IAW_'||ENV||'_STG.EXTERNAL_KPI.REF_MASTER_KPI_DATA_CLARINGTON  
	SET
	HK_HUB=
	SHA1(COALESCE(TRIM("KPI_DATE"), ''#NULL#'')),
	MD_HASHDIFF=
	SHA1(CONCAT(
	COALESCE(TO_VARCHAR(TRADE_ACCOUNT_PROCESSING_AUTOMATION_PCT_MF) , ''#NULL#''), ''|''
,  COALESCE(TO_VARCHAR(TRADE_ACCOUNT_PROCESSING_AUTOMATION_PCT_GIF) , ''#NULL#''), ''|''
,  COALESCE(TO_VARCHAR(FTE) , ''#NULL#''), ''|''
,  COALESCE(TO_VARCHAR(TOTAL_TRANSACTIONS_MF) , ''#NULL#''), ''|''
,  COALESCE(TO_VARCHAR(TOTAL_TRANSACTIONS_GIF) , ''#NULL#''), ''|''
,  COALESCE(TO_VARCHAR(TOTAL_TRANSACTIONS_FTE_MF) , ''#NULL#''), ''|''
,  COALESCE(TO_VARCHAR(TOTAL_TRANSACTIONS_FTE_GIF) , ''#NULL#''), ''|''
,  COALESCE(TO_VARCHAR(NO_OF_ACCOUNTS) , ''#NULL#''), ''|''
,  COALESCE(TO_VARCHAR(ACCOUNTS_FTE) , ''#NULL#''), ''|''
,  COALESCE(TO_VARCHAR(ACCOUNTS_FTE_TARGET) , ''#NULL#''), ''|''
,  COALESCE(TO_VARCHAR(YOY_NEW_ACCOUNTS_CLIENT_NAME) , ''#NULL#''), ''|''
,  COALESCE(TO_VARCHAR(YOY_NEW_ACCOUNTS_CLIENT_NOMINEE) , ''#NULL#''), ''|''
,  COALESCE(TO_VARCHAR(EXPENSES) , ''#NULL#''), ''|''
,  COALESCE(TO_VARCHAR(REVENUES) , ''#NULL#''), ''|''
,  COALESCE(TO_VARCHAR(EFFICIENCY_RATIO) , ''#NULL#''), ''|''
,  COALESCE(TO_VARCHAR(EXPENSES_TARGET) , ''#NULL#''), ''|''
,  COALESCE(TO_VARCHAR(REVENUE_TARGET) , ''#NULL#''), ''|''
,  COALESCE(TO_VARCHAR(EFFICIENCY_RATIO_TARGET) , ''#NULL#''), ''|''
,  COALESCE(TO_VARCHAR(TOTAL_ASSETS) , ''#NULL#''), ''|''
,  COALESCE(TO_VARCHAR(AFFILIATE_PENETRATION_IIROC) , ''#NULL#''), ''|''
,  COALESCE(TO_VARCHAR(AFFILIATE_PENETRATION_IIROC_TARGET) , ''#NULL#''), ''|''
,  COALESCE(TO_VARCHAR(AFFILIATE_PENETRATION_MFDA) , ''#NULL#''), ''|''
,  COALESCE(TO_VARCHAR(AFFILIATE_PENETRATION_MFDA_TARGET) , ''#NULL#''), ''|''
,  COALESCE(TO_VARCHAR(GROSS_MARGIN) , ''#NULL#''), ''|''
,  COALESCE(TO_VARCHAR(GROSS_MARGIN_TARGET) , ''#NULL#''), ''|''
,  COALESCE(TO_VARCHAR(NET_SALES) , ''#NULL#''), ''|''
,  COALESCE(TO_VARCHAR(NO_OF_ACCOUNTS_CLIENT_NAME) , ''#NULL#''), ''|''
,  COALESCE(TO_VARCHAR(NO_OF_ACCOUNTS_NOMINEE) , ''#NULL#'')
)),
MD_CREATION_DT=systimestamp(),
MD_SRC_SYSTEM =''CLARINGTON_MONTHLY_KPI''
Where 1=1';
EXECUTE IMMEDIATE :INS_PRE_DEL;
EXECUTE IMMEDIATE :INS_PRE_COPY;
EXECUTE IMMEDIATE :INS_UPDATE;
END
$$;

create procedure EXTERNAL_KPI.SP_CONV_LOADSTG_PSA_IAPW_TO_STG_REF_MASTER_KPI_DATA_IAPW(ENV VARCHAR, IO_PATH VARCHAR)
    returns VARCHAR
    language SQL
    strict
as $fun$
DECLARE
INS_PRE_DEL STRING;
INS_PRE_COPY STRING;
INS_UPDATE STRING;
BEGIN
INS_PRE_DEL := 'DELETE FROM DB_IAW_'||ENV||'_STG.EXTERNAL_KPI.REF_MASTER_KPI_DATA_IAPW WHERE 1=1';
INS_PRE_COPY := '
COPY INTO EXTERNAL_KPI.REF_MASTER_KPI_DATA_IAPW
(
MD_START_DT,
MD_SOURCE,
MD_EXTRACT_DT,
KPI_DATE,
NO_OF_ACTIVE_CLIENTS,
NO_OF_ACTIVE_ACCOUNTS,
FTE,
ACCOUNTS_FTE,
ACCOUNTS_FTE_TARGET,
APPWAY_REGISTRATION,
APPWAY_REGISTRATION_TARGET,
NO_OF_CLIENT_ID_REGISTERED,
PORTAL_REGISTRATION,
PORTAL_REGISTRATION_TARGET,
MYPORTFOLIO_TO_NEW_CLIENT,
E_DELIVERY_PORTFOLIO_STATEMENTS,
E_DELIVERY_TAX_SLIPS,
E_DELIVERY_CONFIRMS,
AVG_E_DELIVERY_REGISTRATION,
E_DELIVERY_REGISTRATION_TARGET,
RETAIL_YTD_EXPENSES,
RETAIL_YTD_REVENUES,
RETAIL_FINANCIAL_EFFICIENCY_RATIO,
RETAIL_YTD_EXPENSES_TARGET,
RETAIL_YTD_REVENUES_TARGET,
RETAIL_EFFICIENCY_RATIO_TARGET,
CAP_MRKTS_YTD_EXPENSES,
CAP_MKTS_YTD_REVENUES,
CAP_MRKTS_EFFICIENCY_RATIO,
CAP_MRKTS_YTD_EXPENSES_TARGET,
CAP_MRKTS_YTD_REVENUES_TARGET,
CAP_MRKTS_EFFICIENCY_RATIO_TARGET,
TOTAL_ASSETS,
NET_TOTAL_REVENUE,
NET_TOTAL_REVENUE_TARGET,
NET_BOND_DESK_REVENUE,
NET_BOND_DESK_REVENUE_TARGET,
CAPITAL_MKTS_REVENUE,
CAPITAL_MKTS_REVENUE_TARGET,
NET_RETAIL_REVENUE,
NET_RETAIL_REVENUE_TARGET,
RETAIL_REVENUE_GROWTH,
EBIT,
SMA_ADOPTION,
INSURANCE_REVENUE,
AUA_TARGET,
DEPARTED_ADVISORS,
RECRUITING,
TERMINATED_ADVISORS
)
FROM
(
SELECT
TO_DATE(split_part(split_part(metadata$filename, ''__'', 2), ''.'', 0)), metadata$filename,
t.$1, t.$1, t.$2, t.$3, t.$4, t.$5, t.$6, t.$7, t.$8, t.$9,t.$10, t.$11, t.$12, t.$13, t.$14, t.$15, t.$16, t.$17, t.$18,
           t.$19, t.$20, t.$21, t.$22, t.$23, t.$24, t.$25, t.$26, t.$27,t.$28, t.$29, t.$30, t.$31, t.$32, t.$33, t.$34, t.$35, t.$36,t.$37, t.$38, t.$39, t.$40, t.$41, t.$42, t.$43, t.$44, t.$45,t.$46
FROM
@DATALAKE.$$io_PATH T
) pattern = ''.*MASTER_KPI_DATA_IAPW__.*csv'' file_format =(format_name = EXTERNAL_KPI.CSV_UTF8);
';
INS_UPDATE := '
UPDATE DB_IAW_'||ENV||'_STG.EXTERNAL_KPI.REF_MASTER_KPI_DATA_IAPW  
SET
HK_HUB
SHA1(COALESCE(TRIM("KPI_DATE"), ''#NULL#''))
MD_HASHDIFF=
SHA1(CONCAT(
   COALESCE(TO_VARCHAR(NO_OF_ACTIVE_CLIENTS) , ''#NULL#''), ''|''
,  COALESCE(TO_VARCHAR(NO_OF_ACTIVE_ACCOUNTS) , ''#NULL#''), ''|''
,  COALESCE(TO_VARCHAR(FTE) , ''#NULL#''), ''|''
,  COALESCE(TO_VARCHAR(ACCOUNTS_FTE) , ''#NULL#''), ''|''
,  COALESCE(TO_VARCHAR(ACCOUNTS_FTE_TARGET) , ''#NULL#''), ''|''
,  COALESCE(TO_VARCHAR(APPWAY_REGISTRATION) , ''#NULL#''), ''|''
,  COALESCE(TO_VARCHAR(APPWAY_REGISTRATION_TARGET) , ''#NULL#''), ''|''
,  COALESCE(TO_VARCHAR(NO_OF_CLIENT_ID_REGISTERED) , ''#NULL#''), ''|''
,  COALESCE(TO_VARCHAR(PORTAL_REGISTRATION) , ''#NULL#''), ''|''
,  COALESCE(TO_VARCHAR(PORTAL_REGISTRATION_TARGET) , ''#NULL#''), ''|''
,  COALESCE(TO_VARCHAR(MYPORTFOLIO_TO_NEW_CLIENT) , ''#NULL#''), ''|''
,  COALESCE(TO_VARCHAR(E_DELIVERY_PORTFOLIO_STATEMENTS) , ''#NULL#''), ''|''
,  COALESCE(TO_VARCHAR(E_DELIVERY_TAX_SLIPS) , ''#NULL#''), ''|''
,  COALESCE(TO_VARCHAR(E_DELIVERY_CONFIRMS) , ''#NULL#''), ''|''
,  COALESCE(TO_VARCHAR(AVG_E_DELIVERY_REGISTRATION) , ''#NULL#''), ''|''
,  COALESCE(TO_VARCHAR(E_DELIVERY_REGISTRATION_TARGET) , ''#NULL#''), ''|''
,  COALESCE(TO_VARCHAR(RETAIL_YTD_EXPENSES) , ''#NULL#''), ''|''
,  COALESCE(TO_VARCHAR(RETAIL_YTD_REVENUES) , ''#NULL#''), ''|''
,  COALESCE(TO_VARCHAR(RETAIL_FINANCIAL_EFFICIENCY_RATIO) , ''#NULL#''), ''|''
,  COALESCE(TO_VARCHAR(RETAIL_YTD_EXPENSES_TARGET) , ''#NULL#''), ''|''
,  COALESCE(TO_VARCHAR(RETAIL_YTD_REVENUES_TARGET) , ''#NULL#''), ''|''
,  COALESCE(TO_VARCHAR(RETAIL_EFFICIENCY_RATIO_TARGET) , ''#NULL#''), ''|''
,  COALESCE(TO_VARCHAR(CAP_MRKTS_YTD_EXPENSES) , ''#NULL#''), ''|''
,  COALESCE(TO_VARCHAR(CAP_MKTS_YTD_REVENUES) , ''#NULL#''), ''|''
,  COALESCE(TO_VARCHAR(CAP_MRKTS_EFFICIENCY_RATIO) , ''#NULL#''), ''|''
,  COALESCE(TO_VARCHAR(CAP_MRKTS_YTD_EXPENSES_TARGET) , ''#NULL#''),''|''
,  COALESCE(TO_VARCHAR(CAP_MRKTS_YTD_REVENUES_TARGET) , ''#NULL#''), ''|''
,  COALESCE(TO_VARCHAR(CAP_MRKTS_EFFICIENCY_RATIO_TARGET) , ''#NULL#''), ''|''
,  COALESCE(TO_VARCHAR(TOTAL_ASSETS) , ''#NULL#''), ''|''
,  COALESCE(TO_VARCHAR(NET_TOTAL_REVENUE) , ''#NULL#''), ''|''
,  COALESCE(TO_VARCHAR(NET_TOTAL_REVENUE_TARGET) , ''#NULL#''), ''|''
,  COALESCE(TO_VARCHAR(NET_BOND_DESK_REVENUE) , ''#NULL#''), ''|''
,  COALESCE(TO_VARCHAR(NET_BOND_DESK_REVENUE_TARGET) , ''#NULL#''), ''|''
,  COALESCE(TO_VARCHAR(CAPITAL_MKTS_REVENUE) , ''#NULL#''), ''|''
,  COALESCE(TO_VARCHAR(CAPITAL_MKTS_REVENUE_TARGET) , ''#NULL#''), ''|''
,  COALESCE(TO_VARCHAR(NET_RETAIL_REVENUE) , ''#NULL#''), ''|''
,  COALESCE(TO_VARCHAR(NET_RETAIL_REVENUE_TARGET) , ''#NULL#''), ''|''
,  COALESCE(TO_VARCHAR(RETAIL_REVENUE_GROWTH) , ''#NULL#''), ''|''
,  COALESCE(TO_VARCHAR(EBIT) , ''#NULL#''), ''|''
,  COALESCE(TO_VARCHAR(SMA_ADOPTION) , ''#NULL#''), ''|''
,  COALESCE(TO_VARCHAR(INSURANCE_REVENUE) , ''#NULL#''), ''|''
,  COALESCE(TO_VARCHAR(AUA_TARGET) , ''#NULL#''), ''|''
,  COALESCE(TO_VARCHAR(DEPARTED_ADVISORS) , ''#NULL#''), ''|''
,  COALESCE(TO_VARCHAR(RECRUITING) , ''#NULL#''), ''|''
,  COALESCE(TO_VARCHAR(TERMINATED_ADVISORS) , ''#NULL#'')
)),
MD_CREATION_DT=systimestamp(),
MD_SRC_SYSTEM =''IAPW_MONTHLY_KPI''
Where 1=1';
EXECUTE IMMEDIATE :INS_PRE_DEL;
EXECUTE IMMEDIATE :INS_PRE_COPY;
EXECUTE IMMEDIATE :INS_UPDATE;
END
$fun$;

create procedure EXTERNAL_KPI.SP_CONV_LOADSTG_PSA_IAPW_TO_STG_REF_MASTER_KPI_DATA_RVP_IAPW(ENV VARCHAR, IO_PATH VARCHAR)
    returns VARCHAR
    language SQL
    strict
as
$$
DECLARE
INS_PRE_QUERY STRING;
INS_COPY_QUERY STRING;
UPD_QUERY STRING;

BEGIN
INS_PRE_QUERY := 'DELETE FROM DB_IAW_'||ENV||'_STG.EXTERNAL_KPI.REF_MASTER_KPI_DATA_RVP_IAPW WHERE 1=1;';
INS_COPY_QUERY := '
COPY INTO DB_IAW_'||ENV||'_STG.EXTERNAL_KPI.REF_MASTER_KPI_DATA_RVP_IAPW
(
MD_START_DT,
MD_SOURCE,
MD_EXTRACT_DT,
KPI_DATE,
RVP_NAME,
PORTAL_REGISTRATION,
APPWAY_REGISTRATION,
E_DELIVERY
) 
FROM
	(
	SELECT
		TO_DATE(split_part(split_part(metadata$filename, ''__'', 2), ''.'', 0)), metadata$filename,t.$1,t.$1, t.$2, t.$3, t.$4, t.$5
	FROM
		@DATALAKE.'||io_PATH||' T 
	) pattern = ''.*MASTER_KPI_DATA_RVP_IAPW__.*csv'' file_format =(format_name = DB_IAW_'||ENV||'_STG.EXTERNAL_KPI.CSV_UTF8  SKIP_HEADER =1);
	';
UPD_QUERY := '
update DB_IAW_'||ENV||'_STG.EXTERNAL_KPI.REF_MASTER_KPI_DATA_RVP_IAPW
set
HK_HUB =
	SHA1(UPPER(CONCAT(
	coalesce(TRIM(KPI_DATE), ''#NULL#''), ''|'' 
	, coalesce(TRIM(RVP_NAME), ''#NULL#'')
	)))
,MD_HASHDIFF =
	SHA1(CONCAT(
	coalesce(TO_VARCHAR(PORTAL_REGISTRATION), ''#NULL#''), ''|''
	, coalesce(TO_VARCHAR(APPWAY_REGISTRATION), ''#NULL#''), ''|''
	, coalesce(TO_VARCHAR(E_DELIVERY), ''#NULL#'')
	))
,
MD_CREATION_DT=systimestamp(),
MD_SRC_SYSTEM =''IAPW_MONTHLY_KPI''
where
1 = 1;
';

EXECUTE IMMEDIATE :INS_PRE_QUERY;
EXECUTE IMMEDIATE :INS_COPY_QUERY;
EXECUTE IMMEDIATE :UPD_QUERY;
END
$$;

create procedure STEWARDSHIP.SP_CONV_LOADSTG_PSA_IAPW_TO_STG_REF_NEW_ADVISOR(ENV VARCHAR, IO_PATH VARCHAR)
    returns VARCHAR
    language SQL
    strict
as
$$
DECLARE
INS_PRE_QUERY STRING;
INS_COPY_QUERY STRING;
UPD_QUERY STRING;

BEGIN
INS_PRE_QUERY := 'DELETE FROM DB_IAW_'||ENV||'_STG.STEWARDSHIP.REF_NEW_ADVISOR WHERE 1=1;';
INS_COPY_QUERY := '
COPY INTO
	DB_IAW_'||ENV||'_STG.STEWARDSHIP.REF_NEW_ADVISOR (
	MD_START_DT,
	MD_SOURCE,
	ADVISOR_NAME,
	MASTER_CODE,
	TRANSITION_PERIOD_END_DATE,
	DEAL_ASSESTS,
	EXPECTED_ASSESTS,
	PREVIOUS_FIRM,
	PREVIOUS_FIRM_TYPE,
	MD_EXTRACT_DT,
	MD_SRC_SYSTEM
	)
FROM
	(
	SELECT
		TO_DATE(split_part(split_part(metadata$filename, ''__'', 2), ''.'', 0)), metadata$filename,t.$1, t.$2, t.$3, t.$4, t.$5, t.$6, t.$7, t.$8, t.$9
	FROM
		@DATALAKE.'||io_PATH||' T
	) pattern = ''.*NEW_ADVISOR__.*csv'' file_format =(format_name = DB_IAW_'||ENV||'_STG.STEWARDSHIP.CSV_UTF8);
              ';
UPD_QUERY := '
UPDATE DB_IAW_'||ENV||'_STG.STEWARDSHIP.REF_NEW_ADVISOR
SET
HK_HUB=
SHA1(UPPER(CONCAT(COALESCE(TRIM(MD_SRC_SYSTEM), ''#NULL#''), ''|'' , COALESCE(TRIM(MASTER_CODE), ''#NULL#'')))),
MD_HASHDIFF=
SHA1(CONCAT(
   COALESCE(ADVISOR_NAME , ''#NULL#''), ''|''
,  COALESCE(to_varchar(TRANSITION_PERIOD_END_DATE) , ''#NULL#''), ''|''
,  COALESCE(to_varchar(DEAL_ASSESTS) , ''#NULL#''), ''|''
,  COALESCE(to_varchar(EXPECTED_ASSESTS) , ''#NULL#''), ''|''
,  COALESCE(PREVIOUS_FIRM , ''#NULL#''), ''|''
,  COALESCE(PREVIOUS_FIRM_TYPE, ''#NULL#'')
)),	
MD_CREATION_DT=systimestamp()
Where 1=1;
';


EXECUTE IMMEDIATE :INS_PRE_QUERY;
EXECUTE IMMEDIATE :INS_COPY_QUERY;
EXECUTE IMMEDIATE :UPD_QUERY;
END
$$;

create procedure STEWARDSHIP.SP_CONV_LOADSTG_PSA_IAPW_TO_STG_REF_SERVICING_CODES(ENV VARCHAR, IO_PATH VARCHAR)
    returns VARCHAR
    language SQL
    strict
as
$$
DECLARE
INS_PRE_QUERY STRING;
INS_COPY_QUERY STRING;
UPD_QUERY STRING;

BEGIN
INS_PRE_QUERY := 'DELETE FROM DB_IAW_'||ENV||'_STG.STEWARDSHIP.REF_SERVICING_CODES WHERE 1=1;';
INS_COPY_QUERY := '
COPY INTO
	DB_IAW_'||ENV||'_STG.STEWARDSHIP.REF_SERVICING_CODES (
	 MD_START_DT,
	MD_SOURCE,
	MD_SEQ,
	ADVISOR_NAME,
	MASTER_CODE,
	END_DATE,
	REASON,
	NEW_FIRM,
	NEW_FIRM_TYPE,
	NEW_FIRM_BACK_OFFICE,
	SERVICING_CODE,
	PRESTIGE_STATUS,
	MD_EXTRACT_DT,
	MD_SRC_SYSTEM )
FROM
	(
	SELECT
		TO_DATE(split_part(split_part(metadata$filename, ''__'', 2), ''.'', 0)), metadata$filename,metadata$file_row_number,t.$1, t.$2, t.$3, t.$4, t.$5, t.$6,t.$7, t.$8,t.$9, t.$10, t.$11
	FROM
		@DATALAKE.'||io_PATH||' T
	) pattern =''.*SERVICING_CODES__.*csv'' file_format =(format_name = DB_IAW_'||ENV||'_STG.STEWARDSHIP.CSV_UTF8);
	';
UPD_QUERY := '
UPDATE DB_IAW_'||ENV||'_STG.STEWARDSHIP.REF_SERVICING_CODES
SET
HK_HUB=
SHA1(UPPER(CONCAT(COALESCE(TRIM(MD_SRC_SYSTEM), ''#NULL#''), ''|'' , COALESCE(TRIM(MASTER_CODE), ''#NULL#'')))),
MD_HASHDIFF=
SHA1(CONCAT(
   COALESCE(ADVISOR_NAME , ''#NULL#''), ''|''
,  COALESCE(TO_VARCHAR(END_DATE) , ''#NULL#''), ''|''
,  COALESCE(REASON , ''#NULL#''), ''|''
,  COALESCE(NEW_FIRM , ''#NULL#''), ''|''
,  COALESCE(NEW_FIRM_TYPE, ''#NULL#''), ''|''
,  COALESCE(NEW_FIRM_BACK_OFFICE , ''#NULL#''), ''|''
,  COALESCE(SERVICING_CODE , ''#NULL#''), ''|''
,  COALESCE(PRESTIGE_STATUS , ''#NULL#'')
)),
MD_CREATION_DT=systimestamp()
Where 1=1;
';
EXECUTE IMMEDIATE :INS_PRE_QUERY;
EXECUTE IMMEDIATE :INS_COPY_QUERY;
EXECUTE IMMEDIATE :UPD_QUERY;
END
$$;

create procedure IAS_COMMISSION.SP_CONV_LOADSTG_PSA_IAS_COMMISSION_TO_STG_INSURANCE_REVENUES(ENV VARCHAR, IO_PATH VARCHAR)
    returns VARCHAR
    language SQL
    strict
as
$$
DECLARE
INS_PRE_QUERY STRING;
INS_COPY_QUERY STRING;
INS_UPDATE STRING;

BEGIN
INS_PRE_QUERY := 'DELETE FROM DB_IAW_'||ENV||'_STG.IAS_COMMISSION.INSURANCE_REVENUES WHERE 1=1;';
INS_COPY_QUERY := '
COPY INTO DB_IAW_'||ENV||'_STG.IAS_COMMISSION.INSURANCE_REVENUES
(
MD_START_DT, 
MD_SOURCE,
	TRANSID, 
	EXTTRANSID, 
	PROCESSDATE, 
	TRANSDATE, 
	SOURCECODE, 
	CANCELIND, 
	REPID, 
	CURRENCY, 
	EXCHANGERATE, 
	ENTRY_TYPE, 
	COMMISSION, 
	COMMISSIONCAD, 
	OVERRIDEIND, 
	ACCURATEIND, 
	DESCRIPTION, 
	NUMBEROFORDERS, 
	NETCOMMISSION, 
	TRANSFEE, 
	SHAREIND, 
	AFFECTGROSSCOMMIND, 
	REVENUEONLYIND, 
	NOTE, 
	REVNO, 
	STAMP, 
	USERID,
	MD_SRC_SYSTEM,
	MD_EXTRACT_DT
) 
FROM
	(
	SELECT
		TO_DATE(split_part(split_part(metadata$filename, ''__'', 2), ''.'', 0)), metadata$filename,t.$1,t.$2,t.$3,t.$4,t.$5,t.$6,t.$7,t.$8,t.$9,t.$10,t.$11,t.$12,t.$13,t.$14,t.$15,t.$16,t.$17,t.$18,t.$19,t.$20,t.$21,t.$22,t.$23,t.$24,t.$25,t.$26,t.$27
	FROM
		@DATALAKE.'||io_PATH||' T
	) pattern =''.*INSURANCE_REVENUES_.*csv'' file_format=(format_name= DB_IAW_'||ENV||'_STG.IAS.PIPE_UTF16);
	';
   INS_UPDATE := '
	UPDATE  DB_IAW_'||ENV||'_STG.IAS_COMMISSION.INSURANCE_REVENUES
SET 
HK_LINK= SHA1(UPPER(CONCAT(COALESCE(TRIM(''IAS''), ''#NULL#''), ''|'' , COALESCE(TRIM(TRANSID), ''#NULL#''), ''|'' , COALESCE(TRIM(REPID), ''#NULL#'') ))),
HK_HUB_REGISTERED_REPRESENTATIVE =DECODE(TRUE, REPID IS NULL ,''0'',SHA1(UPPER(CONCAT(COALESCE(TRIM(''IAS''), ''#NULL#''), ''|'' , COALESCE(TRIM(REPID), ''#NULL#''))))),

MD_CREATION_DT=systimestamp()
Where 1=1';
			  
EXECUTE IMMEDIATE :INS_PRE_QUERY;
EXECUTE IMMEDIATE :INS_COPY_QUERY;
EXECUTE IMMEDIATE :INS_UPDATE;
END
$$;

create procedure IAS_COMMISSION.SP_CONV_LOADSTG_PSA_IAS_COMMISSION_TO_STG_REGREP(ENV VARCHAR)
    returns VARCHAR
    language SQL
    strict
as
$$
DECLARE
INS_PRE_DEL string;
INS_INSERT string;
INS_UPDATE string;
BEGIN
INS_PRE_DEL := 'DELETE FROM DB_IAW_'||ENV||'_STG.IAS_COMMISSION.REGISTERED_REPRESENTATIVE WHERE 1 = 1';
INS_INSERT := '
INSERT INTO DB_IAW_'||ENV||'_STG.IAS_COMMISSION.REGISTERED_REPRESENTATIVE
(MD_START_DT,
MD_SOURCE,
MD_SRC_SYSTEM,
MD_EXTRACT_DT,
REPID,
REPNAME,
FIRSTNAME,
LASTNAME,
BRANCHCODE,
BRANCHNAME,
GROUPID,
GROUPDESCRIPTION,
FIXEDFEEIND,
MANAGEDIND,
REFIND,
ACTIVEIND,
SEGFUNDIND,
REVNO,
STAMP,
USERID,
ACTIVE,
ADVISOR_ID,
COMMRATEPCT,
SHAREGROSSCOMMIND,
STARTDATE,
MAINREPCODE,
ADVISOR_ROLE)
SELECT
SRC.MD_START_DT,
SRC.MD_SOURCE,
SRC.MD_SRC_SYSTEM,
SRC.MD_EXTRACT_DT,
SRC.REPID,
SRC.REPNAME,
SRC.FIRSTNAME,
SRC.LASTNAME,
SRC.BRANCHCODE,
SRC.BRANCHNAME,
SRC.GROUPID,
SRC.GROUPDESCRIPTION,
SRC.FIXEDFEEIND,
SRC.MANAGEDIND,
SRC.REFIND,
SRC.ACTIVEIND,
SRC.SEGFUNDIND,
SRC.REVNO,
SRC.STAMP,
SRC.USERID,
SRC.ACTIVE,
SRC.ADVISOR_ID,
SRC.COMMRATEPCT,
SRC.SHAREGROSSCOMMIND,
SRC.STARTDATE,
SRC.MAINREPCODE,
SRC.ADVISOR_ROLE
FROM DB_IAW_'||ENV||'_STG.IAS_COMMISSION.REGISTERED_REPRESENTATIVE_CLEAN SRC
              ';
INS_UPDATE := '
UPDATE DB_IAW_'||ENV||'_STG.IAS_COMMISSION.REGISTERED_REPRESENTATIVE
SET
	
	HK_HUB=SHA1(UPPER(CONCAT(''IAS'', ''|'', COALESCE(TRIM(REPID), ''#NULL#'')))),
	HK_SAT=SHA1(UPPER(CONCAT(''IAS'',''|'', COALESCE(TRIM(ADVISOR_ID), ''#NULL#''),''|'', COALESCE(TRIM(FIRSTNAME), ''#NULL#''),''|'',COALESCE(TRIM(LASTNAME), ''#NULL#'')))),
	MD_HASHDIFF=SHA1(UPPER(CONCAT(COALESCE(REPNAME,''#NULL#''), ''|'', COALESCE(BRANCHCODE,''#NULL#''), ''|'',
	COALESCE(BRANCHNAME,''#NULL#''), ''|'', COALESCE(TO_CHAR(GROUPID),''#NULL#''), ''|'', COALESCE(GROUPDESCRIPTION,''#NULL#''), ''|'' ,COALESCE(TO_CHAR(FIXEDFEEIND),''#NULL#''),''|'',
	COALESCE(TO_CHAR(MANAGEDIND),''#NULL#''), ''|'',COALESCE(TO_CHAR(REFIND),''#NULL#''),''|'',COALESCE(TO_CHAR(ACTIVEIND),''#NULL#''), ''|'',COALESCE(TO_CHAR(SEGFUNDIND),''#NULL#''),''|'',
	COALESCE(TO_CHAR(REVNO),''#NULL#''), ''|'', COALESCE(TO_CHAR(STAMP),''#NULL#''), ''|'' ,COALESCE(USERID,''#NULL#''), ''|'',COALESCE(TO_CHAR(ACTIVE),''#NULL#''), ''|'', COALESCE(TO_CHAR(COMMRATEPCT),''#NULL#''), ''|'',COALESCE(TO_CHAR(SHAREGROSSCOMMIND),''#NULL#''), ''|'', COALESCE(TO_CHAR(STARTDATE),''#NULL#''),
	''|'',COALESCE(TO_CHAR(MAINREPCODE),''#NULL#''),
	''|'',COALESCE(ADVISOR_ROLE,''#NULL#'')))),
	MD_CREATION_DT=SYSTIMESTAMP()
Where 1=1
              ';
EXECUTE IMMEDIATE :INS_PRE_DEL;
EXECUTE IMMEDIATE :INS_INSERT;
EXECUTE IMMEDIATE :INS_UPDATE;
END
$$;

create procedure IAS_COMMISSION.SP_CONV_LOADSTG_PSA_IAS_COMMISSION_TO_STG_REVENUES(ENV VARCHAR, IO_PATH VARCHAR)
    returns VARCHAR
    language SQL
    strict
as
$$
DECLARE
INS_PRE_QUERY STRING;
INS_COPY_QUERY STRING;
INS_UPDATE STRING;

BEGIN
INS_PRE_QUERY := 'DELETE FROM DB_IAW_'||ENV||'_STG.IAS_COMMISSION.REVENUES WHERE 1=1;';
INS_COPY_QUERY := '
COPY INTO DB_IAW_'||ENV||'_STG.IAS_COMMISSION.REVENUES
(
MD_START_DT,
MD_SOURCE,
	REPID ,
	ADVISOR_ID ,
	PROGRAM_TYPE ,
	ACCOUNTID ,
	PROCESSDATE ,
	SOURCECODE ,
	QUANTITY ,
	TRANSTYPE ,
	REVENUE ,
	COMMISSION ,
	NETCOMMISSION ,
	TRANSFEE,
	MD_SRC_SYSTEM,
	MD_EXTRACT_DT,
	ENTRY_TYPE,
	STAMP
)
FROM
	(
	SELECT
		TO_DATE(split_part(split_part(metadata$filename, ''__'', 2), ''.'', 0)), metadata$filename,t.$1,t.$2,t.$3,t.$4,t.$5,t.$6,t.$7,t.$8,t.$9,t.$10,t.$11,t.$12,t.$13,t.$14,t.$15,t.$16
	FROM
		@DATALAKE.'||io_PATH||' T
	) pattern =''.*/REVENUES_.*csv'' file_format=(format_name = DB_IAW_'||ENV||'_STG.IAS.PIPE_UTF16);
              ';
   INS_UPDATE := '
UPDATE DB_IAW_'||ENV||'_STG.IAS_COMMISSION.REVENUES 
SET 
HK_LINK= SHA1(UPPER(CONCAT(COALESCE(TRIM(''IAS''), ''#NULL#''), ''|'' , COALESCE(TRIM(REPID), ''#NULL#''), ''|'' , COALESCE(TRIM(ADVISOR_ID), ''#NULL#''), ''|'' ,COALESCE(TRIM(PROGRAM_TYPE), ''#NULL#''), ''|'' ,COALESCE(TRIM(ACCOUNTID), ''#NULL#''), ''|'' ,
COALESCE(TRIM(TO_VARCHAR(PROCESSDATE)), ''#NULL#''), ''|'' , COALESCE(TRIM(SOURCECODE), ''#NULL#''), ''|'' ,COALESCE(TRIM(QUANTITY), ''#NULL#''), ''|'' ,COALESCE(TRIM(TRANSTYPE), ''#NULL#'') , ''|'' ,COALESCE(TRIM(ENTRY_TYPE), ''#NULL#'')
, ''|'' ,COALESCE(TRIM(TO_VARCHAR(STAMP)), ''#NULL#'') ))),
HK_HUB_CONTRACT=DECODE(TRUE, ACCOUNTID IS NULL ,''0'',SHA1(UPPER(CONCAT(COALESCE(TRIM(''IAS''),''#NULL#''),''|'',COALESCE(TRIM(ACCOUNTID),''#NULL#''),''|'', ''#NULL#'' ,''|'', ''#NULL#'' )))),
HK_HUB_PARTY_ROLE_ADVISOR =DECODE(TRUE, REPID IS NULL ,''0'',SHA1(UPPER(CONCAT(COALESCE(TRIM(''IAS''), ''#NULL#''), ''|'' , COALESCE(TRIM(REPID), ''#NULL#''))))),
MD_CREATION_DT=systimestamp(),
MD_START_DT = DATEADD(DAY, 1,STAMP)
Where 1=1';
			  
EXECUTE IMMEDIATE :INS_PRE_QUERY;
EXECUTE IMMEDIATE :INS_COPY_QUERY;
EXECUTE IMMEDIATE :INS_UPDATE;
END
$$;

create procedure IAS_COMMISSION.SP_CONV_LOADSTG_PSA_IAS_COMMISSION_TO_STG_SHARE(ENV VARCHAR, IO_PATH VARCHAR)
    returns VARCHAR
    language SQL
    strict
as
$$
DECLARE
INS_PRE_DEL STRING;
INS_PRE_COPY STRING;
INS_UPDATE STRING;
BEGIN
INS_PRE_DEL := 'DELETE FROM DB_IAW_'||ENV||'_STG.IAS_COMMISSION.SHARE WHERE 1=1';
INS_PRE_COPY := '
COPY INTO DB_IAW_'||ENV||'_STG.IAS_COMMISSION.SHARE
(   MD_START_DT,
	MD_SOURCE ,
	FROMREPID ,
	TOREPID ,
	SHARETYPE ,
	SOURCECODE ,
	PRODUCTCODE ,
	REVENUEPCT ,
	COMMISSIONPCT ,
	NETCOMMISSIONPCT ,
	FEEPCT ,
	REVNO ,
	STAMP,
	MD_EXTRACT_DT ,
	MD_SRCSYSTEM)
FROM
	(
	SELECT
		TO_DATE(split_part(split_part(metadata$filename, ''__'', 2), ''.'', 0)), metadata$filename, t.$1, t.$2, t.$3, t.$4, t.$5, t.$6, t.$7, t.$8, t.$9, t.$10, t.$11, t.$12, t.$13
	FROM
		@DATALAKE.'||IO_PATH||' t ) pattern = ''.*SHARE__.*csv'' file_format =(format_name = DB_IAW_'||ENV||'_STG.IAS.PIPE_UTF16)
              ';
INS_UPDATE := '
UPDATE DB_IAW_'||ENV||'_STG.IAS_COMMISSION.SHARE
	SET
		HK_LINK=SHA1(UPPER(CONCAT(''IAS'' ,''|'', COALESCE(TRIM(FROMREPID), ''#NULL#''), ''|'', COALESCE(TRIM(TOREPID),''#NULL#''),''|'', COALESCE(TRIM(SHARETYPE),''#NULL#''),''|'', COALESCE(TRIM(SOURCECODE),''#NULL#''),''|'', COALESCE(TRIM(PRODUCTCODE),''#NULL#'')))),
		HK_HUB_FROM= DECODE(TRUE, FROMREPID IS NULL ,''0'',SHA1(UPPER(CONCAT(COALESCE(TRIM(''IAS''), ''#NULL#''), ''|'' , COALESCE(TRIM(FROMREPID), ''#NULL#''))))),
		HK_HUB_TO= DECODE(TRUE, TOREPID IS NULL ,''0'',SHA1(UPPER(CONCAT(COALESCE(TRIM(''IAS''), ''#NULL#''), ''|'' , COALESCE(TRIM(TOREPID), ''#NULL#''))))),
		MD_HASHDIFF=SHA1(concat( COALESCE(TO_VARCHAR(REVENUEPCT), ''#NULL#''),''|'',
						 COALESCE(TO_VARCHAR(COMMISSIONPCT), ''#NULL#''),''|'',
						 COALESCE(TO_VARCHAR(NETCOMMISSIONPCT), ''#NULL#''),''|'',
						 COALESCE(TO_VARCHAR(FEEPCT), ''#NULL#''),''|'',
						 COALESCE(TO_VARCHAR(REVNO), ''#NULL#'')
						 )),	
		MD_CREATION_DT=SYSTIMESTAMP()
	Where 1=1';
EXECUTE IMMEDIATE :INS_PRE_DEL;
EXECUTE IMMEDIATE :INS_PRE_COPY;
EXECUTE IMMEDIATE :INS_UPDATE;
END
$$;

create procedure IAS_COMMISSION.SP_CONV_LOADSTG_PSA_IAS_COMMISSION_TO_STG_TRANSACTION_REVENUES(ENV VARCHAR, IO_PATH VARCHAR)
    returns VARCHAR
    language SQL
    strict
as
$$
DECLARE
INS_PRE_QUERY STRING;
INS_COPY_QUERY STRING;
INS_UPDATE STRING;

BEGIN
INS_PRE_QUERY := 'DELETE FROM DB_IAW_'||ENV||'_STG.IAS_COMMISSION.TRANSACTION_REVENUES WHERE 1=1;';
INS_COPY_QUERY := '
COPY INTO DB_IAW_'||ENV||'_STG.IAS_COMMISSION.TRANSACTION_REVENUES
(
MD_START_DT, 
MD_SOURCE,
	TRANSID, 
	EXTTRANSID, 
	PROCESSDATE, 
	TRANSDATE, 
	SOURCECODE, 
	CANCELIND, 
	REPID, 
	CURRENCY, 
	EXCHANGERATE, 
	ENTRY_TYPE, 
	COMMISSION, 
	COMMISSIONCAD, 
	OVERRIDEIND, 
	ACCURATEIND, 
	DESCRIPTION, 
	NUMBEROFORDERS, 
	NETCOMMISSION, 
	TRANSFEE, 
	SHAREIND, 
	AFFECTGROSSCOMMIND, 
	REVENUEONLYIND, 
	NOTE, 
	REVNO, 
	STAMP, 
	USERID,
	MD_SRC_SYSTEM,
	MD_EXTRACT_DT,
	PROGRAM_TYPE,
	ACCOUNTID,
	QUANTITY,
	TRANSTYPE
) 
FROM
	(
	SELECT
		TO_DATE(split_part(split_part(metadata$filename, ''__'', 2), ''.'', 0)), metadata$filename,t.$1,t.$2,t.$3,t.$4,t.$5,t.$6,t.$7,t.$8,t.$9,t.$10,t.$11,t.$12,t.$13,t.$14,t.$15,t.$16,t.$17,t.$18,t.$19,t.$20,t.$21,t.$22,t.$23,t.$24,t.$25,t.$26,t.$27,t.$28,t.$29,t.$30,t.$31
	FROM
		@DATALAKE.'||io_PATH||' T
	) pattern =''.*TRANSACTION_REVENUES__.*csv'' file_format=(format_name= DB_IAW_'||ENV||'_STG.IAS.PIPE_UTF16);
	';
INS_UPDATE := '
	UPDATE  DB_IAW_'||ENV||'_STG.IAS_COMMISSION.TRANSACTION_REVENUES
SET 
HK_LINK= SHA1(UPPER(CONCAT(COALESCE(TRIM(''IAS''), ''#NULL#''), ''|'' , COALESCE(TRIM(TRANSID), ''#NULL#''), ''|'' , COALESCE(TRIM(ACCOUNTID), ''#NULL#''), COALESCE(TRIM(TO_VARCHAR(PROCESSDATE)), ''#NULL#'' ) , COALESCE(TRIM(TO_VARCHAR(REPID)), ''#NULL#'' )  )) ),
HK_HUB_REGISTERED_REPRESENTATIVE =DECODE(TRUE, REPID IS NULL ,''0'',SHA1(UPPER(CONCAT(COALESCE(TRIM(''IAS''), ''#NULL#''), ''|'' , COALESCE(TRIM(REPID), ''#NULL#''))))),
HK_HUB_CONTRACT=DECODE(TRUE, ACCOUNTID IS NULL ,''0'',SHA1(UPPER(CONCAT(COALESCE(TRIM(''IAS''),''#NULL#''),''|'',COALESCE(TRIM(ACCOUNTID),''#NULL#''),''|'', ''#NULL#'' ,''|'', ''#NULL#'' )))),
MD_HASHDIFF = SHA1(CONCAT(	
COALESCE(EXTTRANSID,''#NULL#''), ''|'', 
COALESCE(TO_VARCHAR(TRANSDATE),''#NULL#''), ''|'',
COALESCE(SOURCECODE,''#NULL#''), ''|'', 
COALESCE(TO_VARCHAR(CANCELIND),''#NULL#''), ''|'',
COALESCE(CURRENCY,''#NULL#''), ''|'', 
COALESCE(TO_VARCHAR(EXCHANGERATE),''#NULL#''), ''|'',
COALESCE(ENTRY_TYPE,''#NULL#''), ''|'', 
COALESCE(TO_VARCHAR(COMMISSION),''#NULL#''), ''|'' ,
COALESCE(TO_VARCHAR(COMMISSIONCAD),''#NULL#''), ''|'' ,
COALESCE(TO_VARCHAR(OVERRIDEIND),''#NULL#''), ''|''  ,
COALESCE(TO_VARCHAR(ACCURATEIND),''#NULL#''), ''|''  ,
COALESCE(DESCRIPTION,''#NULL#''), ''|'', 
COALESCE(TO_VARCHAR(NUMBEROFORDERS),''#NULL#''), ''|''  ,
COALESCE(TO_VARCHAR(NETCOMMISSION),''#NULL#''), ''|''  ,
COALESCE(TO_VARCHAR(TRANSFEE),''#NULL#''), ''|''  ,
COALESCE(TO_VARCHAR(SHAREIND),''#NULL#''), ''|''  ,
COALESCE(TO_VARCHAR(AFFECTGROSSCOMMIND),''#NULL#''), ''|''  ,
COALESCE(TO_VARCHAR(REVENUEONLYIND),''#NULL#''), ''|''  ,
COALESCE(NOTE,''#NULL#''), ''|'', 
COALESCE(REVNO,''#NULL#''), ''|'', 
COALESCE(TO_VARCHAR(STAMP),''#NULL#''), ''|'',
COALESCE(USERID,''#NULL#''), ''|'', 
COALESCE(PROGRAM_TYPE,''#NULL#''), ''|'', 
COALESCE(TO_VARCHAR(QUANTITY),''#NULL#''), ''|'',
COALESCE(TO_VARCHAR(TRANSTYPE),''#NULL#'')
)),
MD_CREATION_DT=systimestamp()
Where 1=1';
	
EXECUTE IMMEDIATE :INS_PRE_QUERY;
EXECUTE IMMEDIATE :INS_COPY_QUERY;
EXECUTE IMMEDIATE :INS_UPDATE;
END
$$;

create procedure IAS.SP_CONV_LOADSTG_PSA_IAS_FUNDATA_TO_STG_FUND(ENV VARCHAR, IO_PATH VARCHAR)
    returns VARCHAR
    language SQL
    strict
as
$$
DECLARE
INS_PRE_QUERY STRING;
INS_COPY_QUERY STRING;
INS_UPDATE STRING;
BEGIN
INS_PRE_QUERY := 'DELETE FROM DB_IAW_'||ENV||'_STG.IAS_FUNDATA.FUND WHERE 1=1;';
INS_COPY_QUERY := '
COPY INTO
	DB_IAW_'||ENV||'_STG.IAS_FUNDATA.FUND (
	  MD_START_DT
	, MD_SOURCE
	, FUNDSERVID
	, FUNDID
	, FUNDDESCFR
	, FUNDDESCEN
	, FUNDTYPE
	, GROUPNAMEFR
	, GROUPNAMEEN
	, RRSPELIGIBLE
	, FUNDDESCLONGFR
	, FUNDDESCLONGEN
	, LEGALNAMEEN
	, LEGALNAMEFR
	, STAMP
	, MD_EXTRACT_DT
	, MD_SRC_SYSTEM)
FROM
	(
	SELECT
		TO_DATE(split_part(split_part(metadata$filename, ''__'', 2), ''.'', 0)),metadata$filename, t.$1, t.$2, t.$3, t.$4, t.$5, t.$6, t.$7, t.$8, t.$9, t.$10, t.$11, t.$12, t.$13, t.$14, t.$15
	FROM
		@DATALAKE.'||io_PATH||' T
	) pattern = ''.*/FUNDATA_.*csv'' file_format =(format_name = DB_IAW_'||ENV||'_STG.IAS.PIPE_UTF16);
              ';
INS_UPDATE := '
UPDATE DB_IAW_'||ENV||'_STG.IAS_FUNDATA.FUND
SET
HK_HUB=SHA1(UPPER(CONCAT(COALESCE(TRIM(MD_SRC_SYSTEM), ''#NULL#''), ''|'' , COALESCE(TRIM(FUNDSERVID), ''#NULL#'')))),
	
    MD_HASHDIFF=SHA1(CONCAT(COALESCE(FUNDID, ''#NULL#''), ''|'',COALESCE(FUNDDESCFR, ''#NULL#''), ''|'' , COALESCE(FUNDDESCEN, ''#NULL#''), ''|'' , COALESCE(FUNDTYPE, ''#NULL#''), ''|'' , COALESCE(TO_VARCHAR(GROUPNAMEFR),''#NULL#''), ''|'', COALESCE(TO_VARCHAR(GROUPNAMEEN),''#NULL#''), ''|'', COALESCE(RRSPELIGIBLE,''#NULL#''), ''|'', COALESCE(TO_VARCHAR(FUNDDESCLONGFR), ''#NULL#''), ''|'', COALESCE(FUNDDESCLONGEN,''#NULL#''), ''|'', COALESCE(LEGALNAMEEN,''#NULL#''), ''|'', COALESCE(LEGALNAMEFR,''#NULL#''), ''|'', COALESCE(STAMP,''#NULL#''))),	
	MD_CREATION_DT=SYSTIMESTAMP()
Where 1=1';
EXECUTE IMMEDIATE :INS_PRE_QUERY;
EXECUTE IMMEDIATE :INS_COPY_QUERY;
EXECUTE IMMEDIATE :INS_UPDATE;
END
$$;

create procedure IAS_FUNDATA.SP_CONV_LOADSTG_PSA_IAS_FUNDATA_TO_STG_FUND(ENV VARCHAR, IO_PATH VARCHAR)
    returns VARCHAR
    language SQL
    strict
as
$$
DECLARE
INS_PRE_QUERY STRING;
INS_COPY_QUERY STRING;
INS_UPDATE STRING;
BEGIN
INS_PRE_QUERY := 'DELETE FROM DB_IAW_'||ENV||'_STG.IAS_FUNDATA.FUND WHERE 1=1;';
INS_COPY_QUERY := '
COPY INTO
	DB_IAW_'||ENV||'_STG.IAS_FUNDATA.FUND (
	  MD_START_DT
	, MD_SOURCE
	, FUNDSERVID
	, FUNDID
	, FUNDDESCFR
	, FUNDDESCEN
	, FUNDTYPE
	, GROUPNAMEFR
	, GROUPNAMEEN
	, RRSPELIGIBLE
	, FUNDDESCLONGFR
	, FUNDDESCLONGEN
	, LEGALNAMEEN
	, LEGALNAMEFR
	, STAMP
	, MD_EXTRACT_DT
	, MD_SRC_SYSTEM)
FROM
	(
	SELECT
		TO_DATE(split_part(split_part(metadata$filename, ''__'', 2), ''.'', 0)),metadata$filename, t.$1, t.$2, t.$3, t.$4, t.$5, t.$6, t.$7, t.$8, t.$9, t.$10, t.$11, t.$12, t.$13, t.$14, t.$15
	FROM
		@DATALAKE.'||io_PATH||' T
	) pattern = ''.*/FUNDATA_.*csv'' file_format =(format_name = DB_IAW_'||ENV||'_STG.IAS.PIPE_UTF16);
              ';
INS_UPDATE := '
UPDATE DB_IAW_'||ENV||'_STG.IAS_FUNDATA.FUND
SET
HK_HUB=SHA1(UPPER(CONCAT(COALESCE(TRIM(MD_SRC_SYSTEM), ''#NULL#''), ''|'' , COALESCE(TRIM(FUNDSERVID), ''#NULL#'')))),
	
    MD_HASHDIFF=SHA1(CONCAT(COALESCE(FUNDID, ''#NULL#''), ''|'',COALESCE(FUNDDESCFR, ''#NULL#''), ''|'' , COALESCE(FUNDDESCEN, ''#NULL#''), ''|'' , COALESCE(FUNDTYPE, ''#NULL#''), ''|'' , COALESCE(TO_VARCHAR(GROUPNAMEFR),''#NULL#''), ''|'', COALESCE(TO_VARCHAR(GROUPNAMEEN),''#NULL#''), ''|'', COALESCE(RRSPELIGIBLE,''#NULL#''), ''|'', COALESCE(TO_VARCHAR(FUNDDESCLONGFR), ''#NULL#''), ''|'', COALESCE(FUNDDESCLONGEN,''#NULL#''), ''|'', COALESCE(LEGALNAMEEN,''#NULL#''), ''|'', COALESCE(LEGALNAMEFR,''#NULL#''), ''|'', COALESCE(STAMP,''#NULL#''))),	
	MD_CREATION_DT=SYSTIMESTAMP()
Where 1=1';
EXECUTE IMMEDIATE :INS_PRE_QUERY;
EXECUTE IMMEDIATE :INS_COPY_QUERY;
EXECUTE IMMEDIATE :INS_UPDATE;
END
$$;

create procedure IAS_IAVM.SP_CONV_LOADSTG_PSA_IAS_IAVM_TO_STG_ACCRUED_INTEREST(ENV VARCHAR, IO_PATH VARCHAR)
    returns VARCHAR
    language SQL
    strict
as
$$
DECLARE
INS_PRE_QUERY STRING;
INS_COPY_QUERY STRING;
INS_UPDATE STRING;
BEGIN
INS_PRE_QUERY := 'DELETE FROM DB_IAW_'||ENV||'_STG.IAS_IAVM.ACCRUED_INTEREST WHERE 1=1;';
INS_COPY_QUERY := '
COPY INTO
	DB_IAW_'||ENV||'_STG.IAS_IAVM.ACCRUED_INTEREST (
	MD_START_DT, 
	MD_SOURCE,
	PROCESS_DATE,
	PRODUCT_CODE,
	FIID,
	CUSIP,
	ISIN,
	MARKET,
	SYMBOL,
	INTEREST_RATE,
	ACCRUED_INTEREST_METHOD1,
	ACCRUED_INTEREST_METHOD2,
	DAILY_COUNT_BASIS,
	INTEREST_START_DATE,
	YEAR_FRACTION,
	BASE_ACCRUED_INTEREST,
	MD_EXTRACT_DT,
	MD_SRC_SYSTEM
)
FROM
	(
	SELECT
		TO_DATE(split_part(split_part(metadata$filename, ''__'', 2), ''.'', 0)),metadata$filename, t.$1, t.$2, t.$3, t.$4, t.$5, t.$6, t.$7, t.$8, t.$9, t.$10, t.$11, t.$12, t.$13,t.$14,t.$15,t.$16
	FROM
		@DATALAKE.'||io_PATH||' T
	) pattern = ''.*ACCRUED_INTEREST_.*csv'' file_format =(format_name = DB_IAW_'||ENV||'_STG.IAS_IAVM.PIPE_UTF16);
              '; 			  
INS_UPDATE := '
UPDATE DB_IAW_'||ENV||'_STG.IAS_IAVM.ACCRUED_INTEREST 
SET 
HK_LINK= 
           SHA1(UPPER(CONCAT(COALESCE(TRIM(''IAS''), ''#NULL#''), ''|'' , 
		                     COALESCE(TO_VARCHAR(TRIM(PROCESS_DATE)), ''#NULL#''), ''|'' , 
							 COALESCE(TRIM(FIID), ''#NULL#''), ''|'' ,
							 COALESCE(TRIM(PRODUCT_CODE), ''#NULL#''), ''|'' ,
							 COALESCE(TRIM(MARKET), ''#NULL#''), ''|'' ,
                             COALESCE(TRIM(SYMBOL), ''#NULL#''), ''|'' , 
							 COALESCE(TO_VARCHAR(TRIM(INTEREST_RATE)), ''#NULL#''), ''|'' ,
							 COALESCE(TO_VARCHAR(TRIM(INTEREST_START_DATE)), ''#NULL#''), ''|'' ,
							 COALESCE(TO_VARCHAR(TRIM(YEAR_FRACTION)), ''#NULL#'') , ''|'' ,
							 COALESCE(TO_VARCHAR(TRIM(BASE_ACCRUED_INTEREST)), ''#NULL#'') 
							 ))),
HK_HUB_INVESTMENT_PRODUCT_TYPE = DECODE(TRUE, FIID IS NULL ,''0'',SHA1(UPPER(CONCAT(COALESCE(TRIM(MD_SRC_SYSTEM), ''#NULL#''), ''|'' , COALESCE(TRIM(FIID), ''#NULL#''))))),
MD_CREATION_DT=systimestamp()
Where 1=1;
';
EXECUTE IMMEDIATE :INS_PRE_QUERY;
EXECUTE IMMEDIATE :INS_COPY_QUERY;
EXECUTE IMMEDIATE :INS_UPDATE;
END
$$;

create procedure IAS_IAVM.SP_CONV_LOADSTG_PSA_IAS_IAVM_TO_STG_POSITION_PRICE_IAS_IAVM(ENV VARCHAR, IO_PATH VARCHAR)
    returns VARCHAR
    language SQL
    strict
as
$$
DECLARE
INS_PRE_QUERY STRING;
INS_COPY_QUERY STRING;
INS_UPDATE STRING;
BEGIN
INS_PRE_QUERY := 'DELETE FROM DB_IAW_'||ENV||'_STG.IAS_IAVM.POSITION_PRICE WHERE 1=1;';
INS_COPY_QUERY := '
COPY INTO
	DB_IAW_'||ENV||'_STG.IAS_IAVM.POSITION_PRICE (
	  MD_START_DT
	, MD_SOURCE
	, ACCOUNTID
	, UNITOFMEASURE
	, PRICE
	, SYMBOL
	, MARKET
	, PROCESSDATE
	, CLOSEPRICE
	, PRICECURRENCY
	, BIDPRICE
	, ASKPRICE
	, MD_EXTRACT_DT
	, MD_SRC_SYSTEM )
FROM
	(
	SELECT
		TO_DATE(split_part(split_part(metadata$filename, ''__'', 2), ''.'', 0)),metadata$filename, t.$1, t.$2, t.$3, t.$4, t.$5, t.$6, t.$7, t.$8, t.$9, t.$10, t.$11, t.$12
	FROM
		@DATALAKE.'||io_PATH||' T
	) pattern = ''.*/POSITION_.*csv'' file_format =(format_name = DB_IAW_'||ENV||'_STG.IAS.PIPE_UTF16);
              ';
INS_UPDATE := '
UPDATE DB_IAW_'||ENV||'_STG.IAS_IAVM.POSITION_PRICE
SET
	HK_LINK=
	SHA1(UPPER(CONCAT(COALESCE(TRIM(MD_SRC_SYSTEM), ''#NULL#''), ''|'' , COALESCE(TRIM(PROCESSDATE), ''#NULL#''), ''|'' , COALESCE(TRIM(UNITOFMEASURE), ''#NULL#''), ''|'' , COALESCE(TRIM(SYMBOL), ''#NULL#''), ''|'' , COALESCE(TRIM(MARKET), ''#NULL#''), ''|'', COALESCE(TRIM(ACCOUNTID), ''#NULL#'')))),
	MD_HASHDIFF=
	SHA1(CONCAT(COALESCE(TO_VARCHAR(PRICE), ''#NULL#'')
	, ''|'', COALESCE(TO_VARCHAR(CLOSEPRICE), ''#NULL#'')
	, ''|'', COALESCE(TO_VARCHAR(PRICECURRENCY), ''#NULL#'')
	, ''|'', COALESCE(TO_VARCHAR(BIDPRICE), ''#NULL#'')
	, ''|'', COALESCE(TO_VARCHAR(ASKPRICE), ''#NULL#'')
	)),	
	MD_CREATION_DT=SYSTIMESTAMP()
Where 1=1;
';
EXECUTE IMMEDIATE :INS_PRE_QUERY;
EXECUTE IMMEDIATE :INS_COPY_QUERY;
EXECUTE IMMEDIATE :INS_UPDATE;
END
$$;

create procedure IAS.SP_CONV_LOADSTG_PSA_IAS_IAVM_TO_STG_POSITION_PRICE_IAS_IAVM_IAPW(ENV VARCHAR)
    returns VARCHAR
    language SQL
    strict
as
$$
DECLARE
INS_INSERT STRING;
INS_UPDATE STRING;

BEGIN
INS_INSERT := '
INSERT INTO DB_IAW_'||ENV||'_STG.IAS_IAVM.POSITION_PRICE (
MD_START_DT,
MD_SOURCE,
UNITOFMEASURE,
PRICE,
SYMBOL,
MARKET,
PROCESSDATE,
ACCOUNTID,
CLOSEPRICE,
PRICECURRENCY,
BIDPRICE,
ASKPRICE,
MD_EXTRACT_DT,
MD_SRC_SYSTEM ) 
SELECT 
	PROCESSDATE,
	''IAS_IAVM.PRODUCTION_SHARE_TEST_POSITION'',
	UNITOFMEASURE,
	PRICE,
	SYMBOL,
	MARKET,
	PROCESSDATE,
	ACCOUNTID,
	CLOSEPRICE,
	PRICECURRENCY,
	BIDPRICE,
	ASKPRICE,
	TO_DATE(SYSTIMESTAMP()),
	MD_SRCSYSTEM
FROM DB_IAW_'||ENV||'_STG.IAS_IAVM.PRODUCTION_SHARE_TEST_POSITION
UNION ALL 
SELECT 
	PROCESSDATE,
	''IAS_IAVM.PRODUCTION_SHARE_TEST_POSITION_HIST'',
	UNITOFMEASURE,
	PRICE,
	SYMBOL,
	MARKET,
	PROCESSDATE,
	ACCOUNTID,
	CLOSEPRICE,
	PRICECURRENCY,
	BIDPRICE,
	ASKPRICE,
	TO_DATE(SYSTIMESTAMP()),
	MD_SRCSYSTEM
FROM DB_IAW_'||ENV||'_STG.IAS_IAVM.PRODUCTION_SHARE_TEST_POSITION_HIST
			';
INS_UPDATE := 'UPDATE DB_IAW_'||ENV||'_STG.IAS_IAVM.POSITION_PRICE
SET 
	HK_LINK=
	SHA1(UPPER(CONCAT(COALESCE(TRIM(MD_SRC_SYSTEM), ''#NULL#''), ''|'' , COALESCE(TRIM(PROCESSDATE), ''#NULL#''), ''|'' , COALESCE(TRIM(UNITOFMEASURE), ''#NULL#''), ''|'' , COALESCE(TRIM(SYMBOL), ''#NULL#''), ''|'' , COALESCE(TRIM(MARKET), ''#NULL#''), ''|'', COALESCE(TRIM(ACCOUNTID), ''#NULL#'')))),

	MD_HASHDIFF=
	SHA1(CONCAT(COALESCE(TO_VARCHAR(PRICE), ''#NULL#'')
	, ''|'', COALESCE(TO_VARCHAR(CLOSEPRICE), ''#NULL#'')
	, ''|'', COALESCE(TO_VARCHAR(PRICECURRENCY), ''#NULL#'')
	, ''|'', COALESCE(TO_VARCHAR(BIDPRICE), ''#NULL#'')
	, ''|'', COALESCE(TO_VARCHAR(ASKPRICE), ''#NULL#'')
	)),	
	MD_CREATION_DT=SYSTIMESTAMP()
Where 1=1;
			';

EXECUTE IMMEDIATE :INS_INSERT;
EXECUTE IMMEDIATE :INS_UPDATE;

END
$$;

create procedure IAS_IAVM.SP_CONV_LOADSTG_PSA_IAS_IAVM_TO_STG_REF_EXCHANGE_RATE(ENV VARCHAR, IO_PATH VARCHAR)
    returns VARCHAR
    language SQL
    strict
as
$$
DECLARE
INS_PRE_QUERY STRING;
INS_COPY_QUERY STRING;
INS_UPDATE STRING;

BEGIN
INS_PRE_QUERY := 'DELETE FROM DB_IAW_'||ENV||'_STG.IAS_IAVM.REF_EXCHANGE_RATE WHERE 1=1;';
INS_COPY_QUERY := '
COPY INTO DB_IAW_'||ENV||'_STG.IAS_IAVM.REF_EXCHANGE_RATE
(
MD_START_DT,
MD_SOURCE,
EXCHANGEDATE,
EXCHANGERATE,
REVNO,
MD_EXTRACT_DT,
MD_SRC_SYSTEM

) 
FROM
	(
	SELECT
		TO_DATE(split_part(split_part(metadata$filename, ''__'', 2), ''.'', 0)), metadata$filename,t.$1, t.$2, t.$3, t.$4, t.$5
	FROM
		@DATALAKE.'||IO_PATH||' T
	) pattern = ''.*EXCHANGE_RATE__.*csv'' file_format =(format_name = DB_IAW_'||ENV||'_STG.IAS.PIPE_UTF16);
        ';      

INS_UPDATE :='UPDATE DB_IAW_'||ENV||'_STG.IAS_IAVM.REF_EXCHANGE_RATE SET HK_LINK= SHA1(UPPER(CONCAT(COALESCE(TRIM(''IAS''), ''#NULL#''), ''|'' , COALESCE(TRIM(TO_VARCHAR(EXCHANGEDATE)), ''#NULL#'')))),
MD_HASHDIFF= SHA1(CONCAT(COALESCE(TO_VARCHAR(EXCHANGERATE), ''#NULL#''), ''|'', COALESCE(TO_VARCHAR(REVNO), ''#NULL#''))),	MD_CREATION_DT=SYSTIMESTAMP() Where 1=1';

EXECUTE IMMEDIATE :INS_PRE_QUERY;
EXECUTE IMMEDIATE :INS_COPY_QUERY;
EXECUTE IMMEDIATE :INS_UPDATE;
END
$$;

create procedure IAS.SP_CONV_LOADSTG_PSA_IAS_IAVM_TO_STG_REF_HOLIDAYS(ENV VARCHAR, IO_PATH VARCHAR)
    returns VARCHAR
    language SQL
    strict
as
$$
DECLARE
INS_PRE_QUERY STRING;
INS_COPY_QUERY STRING;

BEGIN
INS_PRE_QUERY := 'DELETE FROM DB_IAW_'||ENV||'_STG.IAS_IAVM.REF_HOLIDAYS WHERE 1=1;';
INS_COPY_QUERY := '
COPY INTO
	DB_IAW_'||ENV||'_STG.IAS_IAVM.REF_HOLIDAYS (
	  MD_START_DT
	, MD_SOURCE
	, HOLIDAY_DATE
	, DESCRIPTION
	, MD_EXTRACT_DT
	, MD_SRC_SYSTEM)
FROM
	(
	SELECT
		TO_DATE(split_part(split_part(metadata$filename, ''__'', 2), ''.'', 0)),metadata$filename,t.$1, t.$2, t.$3, t.$4
	FROM
		@DATALAKE.'||io_PATH||' T
	) pattern = ''.*/HOLIDAYS_.*csv'' file_format =(format_name = DB_IAW_'||ENV||'_STG.IAS.PIPE_UTF16);
              ';

EXECUTE IMMEDIATE :INS_PRE_QUERY;
EXECUTE IMMEDIATE :INS_COPY_QUERY;
END
$$;

create procedure IAS_IAVM.SP_CONV_LOADSTG_PSA_IAS_IAVM_TO_STG_REF_HOLIDAYS(ENV VARCHAR, IO_PATH VARCHAR)
    returns VARCHAR
    language SQL
    strict
as
$$
DECLARE
INS_PRE_QUERY STRING;
INS_COPY_QUERY STRING;
INS_UPDATE STRING;
BEGIN
INS_PRE_QUERY := 'DELETE FROM DB_IAW_'||ENV||'_STG.IAS_IAVM.REF_HOLIDAYS WHERE 1=1;';
INS_COPY_QUERY := '
COPY INTO
	DB_IAW_'||ENV||'_STG.IAS_IAVM.REF_HOLIDAYS (
	  MD_START_DT
	, MD_SOURCE
	, HOLIDAY_DATE
	, DESCRIPTION
	, MD_EXTRACT_DT
	, MD_SRC_SYSTEM)
FROM
	(
	SELECT
		TO_DATE(split_part(split_part(metadata$filename, ''__'', 2), ''.'', 0)),metadata$filename,t.$1, t.$2, t.$3, t.$4
	FROM
		@DATALAKE.'||io_PATH||' T
	) pattern = ''.*/HOLIDAYS_.*csv'' file_format =(format_name = DB_IAW_'||ENV||'_STG.IAS.PIPE_UTF16);
              ';
INS_UPDATE := '
UPDATE DB_IAW_'||ENV||'_STG.IAS_IAVM.REF_HOLIDAYS
SET
	HK_HUB=
	SHA1(UPPER(CONCAT(COALESCE(TRIM(MD_SRC_SYSTEM), ''#NULL#''), ''|'' , COALESCE(TRIM(TO_VARCHAR(HOLIDAY_DATE)), ''#NULL#'')))),
	MD_HASHDIFF=
	SHA1(COALESCE(TO_VARCHAR(DESCRIPTION), ''#NULL#'')),	
	MD_CREATION_DT=SYSTIMESTAMP()
Where 1=1;
';
EXECUTE IMMEDIATE :INS_PRE_QUERY;
EXECUTE IMMEDIATE :INS_COPY_QUERY;
EXECUTE IMMEDIATE :INS_UPDATE;
END
$$;

create procedure IAS_IAVM.SP_CONV_LOADSTG_PSA_IAS_IAVM_TO_STG_REF_HOLIDAYSS(ENV VARCHAR, IO_PATH VARCHAR)
    returns VARCHAR
    language SQL
    strict
as
$$
DECLARE
INS_PRE_QUERY STRING;
INS_COPY_QUERY STRING;
BEGIN
INS_PRE_QUERY := 'DELETE FROM DB_IAW_'||ENV||'_STG.IAS_IAVM.REF_HOLIDAYS WHERE 1=1;';
INS_COPY_QUERY := '
COPY INTO
	DB_IAW_'||ENV||'_STG.IAS_IAVM.REF_HOLIDAYS (
	  MD_START_DT
	, MD_SOURCE
	, HOLIDAY_DATE
	, DESCRIPTION
	, MD_EXTRACT_DT
	, MD_SRC_SYSTEM)
FROM
	(
	SELECT
		TO_DATE(split_part(split_part(metadata$filename, ''__'', 2), ''.'', 0)),metadata$filename,t.$1, t.$2, t.$3, t.$4
	FROM
		@DATALAKE.'||io_PATH||' T
	) pattern = ''.*/HOLIDAYS_.*csv'' file_format =(format_name = DB_IAW_'||ENV||'_STG.IAS.PIPE_UTF16);
              ';
EXECUTE IMMEDIATE :INS_PRE_QUERY;
EXECUTE IMMEDIATE :INS_COPY_QUERY;

END
$$;

create procedure IAS_IAVM.SP_CONV_LOADSTG_PSA_IAS_IAVM_TO_STG_REF_MAPPING_PRODUCT_TYPE(ENV VARCHAR, IO_PATH VARCHAR)
    returns VARCHAR
    language SQL
    strict
as
$$
DECLARE
INS_PRE_QUERY STRING;
INS_COPY_QUERY STRING;
INS_UPDATE STRING;
BEGIN
INS_PRE_QUERY := 'DELETE FROM DB_IAW_'||ENV||'_STG.IAS_IAVM.REF_MAPPING_PRODUCT_TYPE
WHERE 1=1;';
INS_COPY_QUERY := '
COPY INTO
	DB_IAW_'||ENV||'_STG.IAS_IAVM.REF_MAPPING_PRODUCT_TYPE (
	  MD_START_DT
	, MD_SOURCE
	, TI_ALTERNATE_TI_TYPE
	, TI_ALTERNATE_TI_CLASS
	, DESCRIPTIONEN
	, DESCRIPTIONFR
	, PRODUCTTYPE
	, MD_EXTRACT_DT
	, MD_SRC_SYSTEM)
FROM
	(
	SELECT
		TO_DATE(split_part(split_part(metadata$filename, ''__'', 2), ''.'', 0)),metadata$filename, t.$1, t.$2, t.$3, t.$4, t.$5, t.$6, t.$7
	FROM
		@DATALAKE.'||io_PATH||' T
	) pattern = ''.*/MAPPING_PRODUCT_TYPE_.*csv'' file_format =(format_name = DB_IAW_'||ENV||'_STG.IAS.PIPE_UTF16);
              ';
INS_UPDATE := '
UPDATE DB_IAW_'||ENV||'_STG.IAS_IAVM.REF_MAPPING_PRODUCT_TYPE
SET
    HK_HUB=
	SHA1(UPPER(CONCAT(COALESCE(TRIM(MD_SRC_SYSTEM), ''#NULL#''), ''|'' , COALESCE(TRIM(TI_ALTERNATE_TI_TYPE), ''#NULL#''), ''|'' ,COALESCE(TRIM(TI_ALTERNATE_TI_CLASS), ''#NULL#'')))),
	MD_HASHDIFF=
	SHA1(CONCAT(COALESCE(DESCRIPTIONEN,''#NULL#''), ''|'',COALESCE(DESCRIPTIONFR, ''#NULL#''), ''|'' , COALESCE(PRODUCTTYPE, ''#NULL#''))),	
	MD_CREATION_DT=SYSTIMESTAMP()
Where 1=1;
';
EXECUTE IMMEDIATE :INS_PRE_QUERY;
EXECUTE IMMEDIATE :INS_COPY_QUERY;
EXECUTE IMMEDIATE :INS_UPDATE;
END
$$;

create procedure IAS_IAVM.SP_CONV_LOADSTG_PSA_IAS_IAVM_TO_STG_REGISTERED_REPRESENTATIVE(ENV VARCHAR, IO_PATH VARCHAR)
    returns VARCHAR
    language SQL
    strict
as
$$
DECLARE
INS_PRE_QUERY STRING;
INS_COPY_QUERY STRING;
INS_UPDATE STRING;
BEGIN
INS_PRE_QUERY := 'DELETE FROM DB_IAW_'||ENV||'_STG.IAS_IAVM.REGISTERED_REPRESENTATIVE WHERE 1=1;';
INS_COPY_QUERY := '
COPY INTO
	DB_IAW_'||ENV||'_STG.IAS_IAVM.REGISTERED_REPRESENTATIVE (
	  MD_START_DT
	, MD_SOURCE
	, MEMBER
	, TEAMTYPE
	, ACTIVE
	, USERTYPE
	, TEAMID
	, TEAMNAME
	, RVPID
	, RVPNAME
	, REPID
	, REPNAME
	, PROVINCE
	, MD_EXTRACT_DT
	, MD_SRC_SYSTEM )
FROM
	(
	SELECT
		TO_DATE(split_part(split_part(metadata$filename, ''__'', 2), ''.'', 0)),metadata$filename, t.$1, t.$2, t.$3, t.$4, t.$5, t.$6, t.$7, t.$8, t.$9, t.$10, t.$11, t.$12, t.$13
	FROM
		@DATALAKE.'||io_PATH||' T
	) pattern = ''.*REGISTERED_REPRESENTATIVE__.*csv'' file_format =(format_name = DB_IAW_'||ENV||'_STG.IAS_IAVM.PIPE_UTF16);
              '; 			  
INS_UPDATE := '
UPDATE DB_IAW_'||ENV||'_STG.IAS_IAVM.REGISTERED_REPRESENTATIVE
SET
    HK_HUB=SHA1(UPPER(CONCAT(''IAS'', ''|'' ,COALESCE(TRIM(REPID), ''#NULL#'') ))),
	MD_HASHDIFF=SHA1(CONCAT(
	COALESCE(MEMBER, ''#NULL#''), ''|'' ,
	COALESCE(TEAMTYPE, ''#NULL#''), ''|'' ,
	COALESCE(ACTIVE, ''#NULL#''), ''|'' ,
	COALESCE(USERTYPE, ''#NULL#''), ''|'' ,
	COALESCE(TO_VARCHAR(TEAMID), ''#NULL#''), ''|'' ,
	COALESCE(TEAMNAME, ''#NULL#''), ''|'' ,
	COALESCE(TO_VARCHAR(RVPID), ''#NULL#''), ''|'' ,
	COALESCE(RVPNAME, ''#NULL#''), ''|'' ,
	COALESCE(TO_VARCHAR(REPID), ''#NULL#''), ''|'' ,
	COALESCE(REPNAME, ''#NULL#''), ''|'' ,
	COALESCE(PROVINCE, ''#NULL#''))),
	MD_CREATION_DT=systimestamp()
Where 1=1;
';
EXECUTE IMMEDIATE :INS_PRE_QUERY;
EXECUTE IMMEDIATE :INS_COPY_QUERY;
EXECUTE IMMEDIATE :INS_UPDATE;
END
$$;

create procedure IAS_IAVM."SP_CONV_LOADSTG_PSA_IAS_IAVM_To_STG_REF_MAPPING_PRODUCT_TYPE"(ENV VARCHAR, IO_PATH VARCHAR)
    returns VARCHAR
    language SQL
    strict
as
$$
DECLARE
INS_PRE_QUERY STRING;
INS_COPY_QUERY STRING;
BEGIN
INS_PRE_QUERY := 'DELETE FROM DB_IAW_'||ENV||'_STG.IAS_IAVM.REF_MAPPING_PRODUCT_TYPE
WHERE 1=1;';
INS_COPY_QUERY := '
COPY INTO
	DB_IAW_'||ENV||'_STG.IAS_IAVM.REF_MAPPING_PRODUCT_TYPE (
	  MD_START_DT
	, MD_SOURCE
	, TI_ALTERNATE_TI_TYPE
	, TI_ALTERNATE_TI_CLASS
	, DESCRIPTIONEN
	, DESCRIPTIONFR
	, PRODUCTTYPE
	, MD_EXTRACT_DT
	, MD_SRC_SYSTEM)
FROM
	(
	SELECT
		TO_DATE(split_part(split_part(metadata$filename, ''__'', 2), ''.'', 0)),metadata$filename, t.$1, t.$2, t.$3, t.$4, t.$5, t.$6, t.$7
	FROM
		@DATALAKE.'||io_PATH||' T
	) pattern = ''.*/MAPPING_PRODUCT_TYPE_.*csv'' file_format =(format_name = DB_IAW_'||ENV||'_STG.IAS.PIPE_UTF16);
              ';
EXECUTE IMMEDIATE :INS_PRE_QUERY;
EXECUTE IMMEDIATE :INS_COPY_QUERY;
END
$$;

create procedure IAS.SP_CONV_LOADSTG_PSA_IAS_NBIN_TO_STG_CASH_HOLDINGS(ENV VARCHAR, IO_PATH VARCHAR)
    returns VARCHAR
    language SQL
    strict
as
$$
DECLARE
INS_PRE_QUERY STRING;
INS_COPY_QUERY STRING;
UPD_QUERY STRING;

BEGIN
INS_PRE_QUERY := 'DELETE FROM DB_IAW_'||ENV||'_STG.IAS.CASH_HOLDINGS WHERE 1=1;';
INS_COPY_QUERY := '
COPY INTO
	DB_IAW_'||ENV||'_STG.IAS.CASH_HOLDINGS (
	 MD_START_DT
	, MD_SOURCE
	, MD_SEQ
	, A_C_ID
	, A_C_REPRESENTATIVE
	, A_C_SUMM_BALANCE_BUS_DATE
	, A_C_SUMM_SD_NET_AMT
	, A_C_SUMM_TD_NET_AMT
	, A_C_CURRENCY
	, MD_EXTRACT_DT
	, MD_SRC_SYSTEM )
FROM
	(
	SELECT
		TO_DATE(split_part(split_part(metadata$filename, ''__'', 2), ''.'', 0)),metadata$filename, metadata$file_row_number,
		t.$1, t.$2, t.$3, t.$4, t.$5, t.$6, t.$7, t.$8
	FROM
		@DATALAKE.'||io_PATH||' T
	) pattern = ''.*CASH_HOLDINGS_.*csv'' file_format =(format_name = DB_IAW_'||ENV||'_STG.IAS.PIPE_UTF16);
              ';
UPD_QUERY := '
UPDATE DB_IAW_'||ENV||'_STG.IAS.CASH_HOLDINGS
SET
	HK_LINK = SHA1(UPPER(CONCAT(
	  COALESCE(TRIM(MD_SEQ), ''#NULL#''), ''|''
	, COALESCE(TRIM(MD_SRC_SYSTEM), ''#NULL#''), ''|''
	, COALESCE(TRIM(MD_EXTRACT_DT), ''#NULL#''), ''|''
	, COALESCE(TRIM(A_C_ID), ''#NULL#''), ''|''
	, COALESCE(TRIM(A_C_REPRESENTATIVE), ''#NULL#''), ''|''
	, ''#NULL#''
	))),
	HK_HUB_CONTRACT = DECODE(TRUE, A_C_ID IS NULL ,''0'',SHA1(UPPER(CONCAT(COALESCE(TRIM(MD_SRC_SYSTEM),''#NULL#''),''|'',COALESCE(TRIM(A_C_ID),''#NULL#''),''|'', ''#NULL#'' ,''|'', ''#NULL#'' )))),
	HK_HUB_REGISTERED_REPRESENTATIVE = DECODE(TRUE, A_C_REPRESENTATIVE IS NULL ,''0'',SHA1(UPPER(CONCAT(COALESCE(TRIM(MD_SRC_SYSTEM), ''#NULL#''), ''|'' , COALESCE(TRIM(A_C_REPRESENTATIVE), ''#NULL#''))))),
	HK_HUB_INVESTMENT_PRODUCT_TYPE = ''0'',
	
	MD_HASHDIFF=SHA1(CONCAT(
	  COALESCE(TO_VARCHAR(A_C_SUMM_BALANCE_BUS_DATE),''#NULL#''), ''|''
	, COALESCE(TO_VARCHAR(A_C_SUMM_SD_NET_AMT),''#NULL#''), ''|''
	, COALESCE(TO_VARCHAR(A_C_SUMM_TD_NET_AMT),''#NULL#''),''|''
	, COALESCE(A_C_CURRENCY,''#NULL#'')
	)),	
	
	MD_CREATION_DT= SYSTIMESTAMP()
Where 1=1;
';


EXECUTE IMMEDIATE :INS_PRE_QUERY;
EXECUTE IMMEDIATE :INS_COPY_QUERY;
EXECUTE IMMEDIATE :UPD_QUERY;
END
$$;

create procedure IAS.SP_CONV_LOADSTG_PSA_IAS_NBIN_TO_STG_CLIENTS(ENV VARCHAR, IO_PATH VARCHAR)
    returns VARCHAR
    language SQL
    strict
as
$$
DECLARE
INS_PRE_QUERY STRING;
INS_COPY_QUERY STRING;
UPD_QUERY STRING;

BEGIN
INS_PRE_QUERY := 'DELETE FROM DB_IAW_'||ENV||'_STG.IAS.ACCOUNT_HOLDER WHERE 1=1;';
INS_COPY_QUERY := '
COPY INTO
	DB_IAW_'||ENV||'_STG.IAS.ACCOUNT_HOLDER (
	 MD_START_DT,
	MD_SOURCE,
	A_C_CLIENT,
	SIN_HASH,
	CLIENT_BIRTH_DATE,
	CLIENT_TAX_RECIP_TYPE,
	CLIENT_RESIDENCE,
	CLIENT_RESIDENCE_REGION,
	CLIENT_ANNUAL_GROSS_INC,
	CLIENT_INIT_CONTRACT_DATE,
	MD_EXTRACT_DT,
	MD_SRC_SYSTEM,
    CLIENT_INV_KNOWLEDGE_LVL,
    A_C_NAME,
    A_C_FIRST_NAME,
    A_C_MIDDLE_NAME,
    A_C_LAST_NAME,
    CLIENT_FIRST_NAME,
    CLIENT_LAST_NAME )
FROM
	(
	SELECT
		TO_DATE(split_part(split_part(metadata$filename, ''__'', 2), ''.'', 0)), metadata$filename,t.$1, t.$2, t.$3, t.$4, t.$5, t.$6,t.$7, t.$8,t.$9, t.$10, t.$11, t.$12, t.$13, t.$14, t.$15, t.$16, t.$17
	FROM
		@DATALAKE.'||io_PATH||' T
	) pattern =''.*CLIENTS_.*csv'' file_format =(format_name = DB_IAW_'||ENV||'_STG.IAS.PIPE_UTF16);
              ';
UPD_QUERY := '
UPDATE DB_IAW_'||ENV||'_STG.IAS.ACCOUNT_HOLDER
SET
    HK_HUB=SHA1(UPPER(CONCAT(COALESCE(TRIM(MD_SRC_SYSTEM), ''#NULL#''), ''|'' , COALESCE(TRIM(A_C_CLIENT), ''#NULL#'')))),
	MD_HASHDIFF=SHA1(CONCAT(COALESCE(SIN_HASH, ''#NULL#''), ''|'' , COALESCE(TO_VARCHAR(CLIENT_BIRTH_DATE),''#NULL#''), ''|'', COALESCE(CLIENT_TAX_RECIP_TYPE,''#NULL#''), ''|'', COALESCE(CLIENT_RESIDENCE, ''#NULL#''), ''|'', COALESCE(CLIENT_RESIDENCE_REGION,''#NULL#''), ''|'', COALESCE(CLIENT_ANNUAL_GROSS_INC,''#NULL#''), ''|'', COALESCE(TO_VARCHAR(CLIENT_INIT_CONTRACT_DATE),''#NULL#''), ''|'', COALESCE(TO_VARCHAR(CLIENT_INV_KNOWLEDGE_LVL),''#NULL#''), ''|'', COALESCE(TO_VARCHAR(A_C_NAME),''#NULL#''), ''|'', COALESCE(TO_VARCHAR(A_C_FIRST_NAME),''#NULL#''), ''|'', COALESCE(TO_VARCHAR(A_C_MIDDLE_NAME),''#NULL#''), ''|'', COALESCE(TO_VARCHAR(A_C_LAST_NAME),''#NULL#''), ''|'', COALESCE(TO_VARCHAR(CLIENT_FIRST_NAME),''#NULL#''), ''|'', COALESCE(TO_VARCHAR(CLIENT_LAST_NAME),''#NULL#'') )),	
	MD_CREATION_DT=SYSTIMESTAMP()
Where 1=1;
';


EXECUTE IMMEDIATE :INS_PRE_QUERY;
EXECUTE IMMEDIATE :INS_COPY_QUERY;
EXECUTE IMMEDIATE :UPD_QUERY;
END
$$;

create procedure IAS.SP_CONV_LOADSTG_PSA_IAS_NBIN_TO_STG_CONTRACT(ENV VARCHAR, IO_PATH VARCHAR)
    returns VARCHAR
    language SQL
    strict
as
$$
DECLARE
INS_PRE_QUERY STRING;
INS_COPY_QUERY STRING;
INS_UPDATE STRING;
BEGIN
INS_PRE_QUERY := 'DELETE FROM DB_IAW_'||ENV||'_STG.IAS.CONTRACT WHERE 1=1;';
INS_COPY_QUERY := '
COPY INTO
	DB_IAW_'||ENV||'_STG.IAS.CONTRACT (
	  MD_START_DT
	, MD_SOURCE
	, A_C_ID
	, A_C_CLIENT
	, A_C_REPRESENTATIVE
	, ADMINISTRATOR_TYPE
	, A_C_OPEN_DATE
	, A_C_CLOSING_DATE
	, A_C_ACCOUNT_CLASS
	, RETAIL_PLAN
	, RETAIL_PLAN_RESP
	, ACCOUNT_RAP_CODE
	, ASC_3_MANAGED_TYPE
	, A_C_SPECIAL_TAG
	, ASC_1_RESP_PLAN_TYPES
	, MD_EXTRACT_DT
	, MD_SRC_SYSTEM
	, A_C_CURRENCY
	, IVT_OBJ_CDE
	, RISK_TOLERANCE
	, DOC_LAST_UPDATE
	, MANAGED_IND)
FROM
	(
	SELECT
		TO_DATE(split_part(split_part(metadata$filename, ''__'', 2), ''.'', 0)),metadata$filename, t.$1, t.$2, t.$3, t.$4, t.$5, t.$6, t.$7, t.$8, t.$9, t.$10, t.$11, t.$12, t.$13, t.$14, t.$15, t.$16, t.$17, t.$18, t.$19, t.$20
	FROM
		@DATALAKE.'||io_PATH||' T
	) pattern = ''.*/ACCOUNTS_.*csv'' file_format =(format_name = DB_IAW_'||ENV||'_STG.IAS.PIPE_UTF16);
              ';
INS_UPDATE := '
UPDATE DB_IAW_'||ENV||'_STG.IAS.CONTRACT
SET
	HK_HUB=SHA1(UPPER(CONCAT(COALESCE(TRIM(MD_SRC_SYSTEM),''#NULL#''),''|'',
								COALESCE(TRIM(A_C_ID),''#NULL#''),''|''
								, ''#NULL#'' ,''|''
								, ''#NULL#'' ))),
	MD_HASHDIFF=SHA1(CONCAT(COALESCE(A_C_CLIENT,''#NULL#''), ''|'' 
							,COALESCE(A_C_REPRESENTATIVE,''#NULL#''),''|''
							,COALESCE(ADMINISTRATOR_TYPE,''#NULL#''),''|'' 
							,COALESCE(TO_VARCHAR(A_C_OPEN_DATE),''#NULL#''),''|'' 
							,COALESCE(TO_VARCHAR(A_C_CLOSING_DATE),''#NULL#''),''|'' 
							,COALESCE(A_C_ACCOUNT_CLASS,''#NULL#''),''|'' 
							,COALESCE(RETAIL_PLAN,''#NULL#''),''|'' 
							,COALESCE(RETAIL_PLAN_RESP,''#NULL#''),''|''
							,COALESCE(ACCOUNT_RAP_CODE,''#NULL#''),''|''
							,COALESCE(ASC_3_MANAGED_TYPE,''#NULL#''),''|''
							,COALESCE(A_C_SPECIAL_TAG,''#NULL#''),''|''
							,COALESCE(ASC_1_RESP_PLAN_TYPES,''#NULL#''),''|''
							,COALESCE(A_C_CURRENCY,''#NULL#''),''|''
							,COALESCE(IVT_OBJ_CDE,''#NULL#'') ,''|''
							,COALESCE(RISK_TOLERANCE,''#NULL#''),''|''
							,COALESCE(TO_VARCHAR(DOC_LAST_UPDATE),''#NULL#''),''|''
							,COALESCE(TO_VARCHAR(MANAGED_IND),''#NULL#'')
							)
					),
	MD_CREATION_DT= SYSTIMESTAMP()
Where 1=1';
EXECUTE IMMEDIATE :INS_PRE_QUERY;
EXECUTE IMMEDIATE :INS_COPY_QUERY;
EXECUTE IMMEDIATE :INS_UPDATE;
END
$$;

create procedure IAS.SP_CONV_LOADSTG_PSA_IAS_NBIN_TO_STG_FINANCIAL_TRANSACTIONS_IAVMBK(ENV VARCHAR, IO_PATH VARCHAR)
    returns VARCHAR
    language SQL
    strict
as
$$
DECLARE
INS_PRE_QUERY STRING;
INS_COPY_QUERY STRING;
INS_UPDATE STRING;


BEGIN
INS_PRE_QUERY := 'DELETE FROM DB_IAW_'||ENV||'_STG.IAS.FINANCIAL_TRANSACTIONS_IAVMBK WHERE 1=1;';
INS_COPY_QUERY := '
COPY INTO
	DB_IAW_'||ENV||'_STG.IAS.FINANCIAL_TRANSACTIONS_IAVMBK (
	  MD_START_DT
	, MD_SOURCE
	, A_C_ID
	, A_C_REPRESENTATIVE
	, TI_ALTERNATE_ID
	, TI_ALTERNATE_TI_TYPE
	, TRAN_ENTRY_DESCRIPTION
	, TRAN_USER_DESCRIPTION
	, TRAN_TRADING_TYPE
	, TRANSACTION
	, TRAN_TRADING_GROSS_AMT
	, TRAN_TRADING_CURRENCY
	, TRAN_TRADING_NET_AMT
	, TRAN_TRADING_TRADE_DATE
	, TRAN_TRADING_SETT_DATE
	, TRAN_PROCESS_DATE
	, TI_SYMBOL
	, TRAN_QTY
	, TI_PRIMARY_MARKET
	, TRAN_TXN_REFERENCE_ID
	, TRAN_AMOUNT_2
	, MD_EXTRACT_DT
	, MD_SRC_SYSTEM
	, TI_UNDERLYING_CDN_PRICE
	, TI_BASIS_POINT
	, TI_FACE_VALUE
	, TI_ISSUE_PRICE
	, STRIKE_PRICE
	, TI_UNDERLYING_USD_PRICE )
FROM
	(
	SELECT
		TO_DATE(split_part(split_part(metadata$filename, ''__'', 2), ''.'', 0)),metadata$filename,t.$1, t.$2, t.$3, t.$4, t.$5, t.$6, t.$7, t.$8, t.$9, t.$10,t.$11, t.$12, t.$13, t.$14, t.$15, t.$16, t.$17, t.$18, t.$19, t.$21
		,t.$22, t.$23, t.$24, t.$25, t.$26, t.$27, t.$28
	FROM
		@DATALAKE.'||io_PATH||' T
	) pattern = ''.*/BK_TRANSACTIONS_.*csv'' file_format =(format_name = DB_IAW_'||ENV||'_STG.IAS.PIPE_UTF16);
              ';

INS_UPDATE :='UPDATE DB_IAW_'||ENV||'_STG.IAS.FINANCIAL_TRANSACTIONS_IAVMBK
SET 
HK_LINK=
SHA1(UPPER(CONCAT(COALESCE(TRIM(MD_SRC_SYSTEM), ''#NULL#''), ''|'' , COALESCE(TRIM("TRANSACTION"), ''#NULL#''), ''|'' , COALESCE(TRIM(A_C_ID), ''#NULL#''), ''|'' , COALESCE(TRIM(A_C_REPRESENTATIVE), ''#NULL#''), ''|'' , COALESCE(TRIM(TI_ALTERNATE_ID), ''#NULL#'')))),

HK_HUB_CONTRACT=
--SHA1(UPPER(CONCAT(COALESCE(TRIM(MD_SRC_SYSTEM), ''#NULL#''), ''|'' , COALESCE(TRIM(A_C_ID), ''#NULL#'')))),
DECODE(TRUE, A_C_ID IS NULL ,''0'',SHA1(UPPER(CONCAT(COALESCE(TRIM(MD_SRC_SYSTEM),''#NULL#''),''|'',COALESCE(TRIM(A_C_ID),''#NULL#''),''|'', ''#NULL#'' ,''|'', ''#NULL#'' )))),

HK_HUB_REGISTERED_REPRESENTATIVE=
--SHA1(UPPER(CONCAT(COALESCE(TRIM(MD_SRC_SYSTEM), ''#NULL#''), ''|'' , COALESCE(TRIM(A_C_REPRESENTATIVE), ''#NULL#'')))),
DECODE(TRUE, A_C_REPRESENTATIVE IS NULL ,''0'',SHA1(UPPER(CONCAT(COALESCE(TRIM(MD_SRC_SYSTEM), ''#NULL#''), ''|'' , COALESCE(TRIM(A_C_REPRESENTATIVE), ''#NULL#''))))),

HK_HUB_INVESTMENT_PRODUCT_TYPE=
DECODE(TRUE, TI_ALTERNATE_ID IS NULL ,''0'',SHA1(UPPER(CONCAT(COALESCE(TRIM(MD_SRC_SYSTEM), ''#NULL#''), ''|'' , COALESCE(TRIM(TI_ALTERNATE_ID), ''#NULL#''))))),

MD_HASHDIFF=
SHA1(CONCAT(COALESCE(TI_ALTERNATE_TI_TYPE, ''#NULL#''), ''|'',COALESCE(TRAN_ENTRY_DESCRIPTION, ''#NULL#''), ''|'' , COALESCE(TRAN_USER_DESCRIPTION, ''#NULL#''), ''|'' , 
COALESCE(TRAN_TRADING_TYPE, ''#NULL#''), ''|'' , COALESCE(TO_VARCHAR(TRAN_TRADING_GROSS_AMT),''#NULL#''), ''|'', 
COALESCE(TRAN_TRADING_CURRENCY,''#NULL#''), ''|'', COALESCE(TO_VARCHAR(TRAN_TRADING_NET_AMT),''#NULL#'') , ''|'', COALESCE(TO_VARCHAR(TRAN_TRADING_TRADE_DATE),''#NULL#''), ''|'', COALESCE(TO_VARCHAR(TRAN_TRADING_SETT_DATE),''#NULL#''), ''|'', COALESCE(TO_VARCHAR(TRAN_PROCESS_DATE),''#NULL#'')
, ''|'', COALESCE(TI_SYMBOL,''#NULL#''), ''|'', COALESCE(TO_VARCHAR(TRAN_QTY),''#NULL#''), ''|'', COALESCE(TO_VARCHAR(TI_PRIMARY_MARKET),''#NULL#'')
, ''|'', COALESCE(TO_VARCHAR(TRAN_TXN_REFERENCE_ID),''#NULL#''), ''|'', COALESCE(TO_VARCHAR(TRAN_AMOUNT_2),''#NULL#''), ''|'', COALESCE(TO_VARCHAR(TI_UNDERLYING_CDN_PRICE),''#NULL#'')
, ''|'', COALESCE(TO_VARCHAR(TI_BASIS_POINT),''#NULL#''), ''|'', COALESCE(TO_VARCHAR(TI_FACE_VALUE),''#NULL#''), ''|'', COALESCE(TO_VARCHAR(TI_ISSUE_PRICE),''#NULL#'')
, ''|'', COALESCE(TO_VARCHAR(STRIKE_PRICE),''#NULL#''), ''|'', COALESCE(TO_VARCHAR(TI_UNDERLYING_USD_PRICE),''#NULL#'')
)),	
MD_CREATION_DT=SYSTIMESTAMP()
Where 1=1';

EXECUTE IMMEDIATE :INS_PRE_QUERY;
EXECUTE IMMEDIATE :INS_COPY_QUERY;
EXECUTE IMMEDIATE :INS_UPDATE;
END
$$;

create procedure IAS.SP_CONV_LOADSTG_PSA_IAS_NBIN_TO_STG_HOLDINGS(ENV VARCHAR, IO_PATH VARCHAR)
    returns VARCHAR
    language SQL
    strict
as
$$
DECLARE
INS_PRE_QUERY STRING;
INS_COPY_QUERY STRING;
UPD_QUERY STRING;

BEGIN
INS_PRE_QUERY := 'DELETE FROM DB_IAW_'||ENV||'_STG.IAS.HOLDINGS WHERE 1=1;';
INS_COPY_QUERY := '
COPY INTO
	DB_IAW_'||ENV||'_STG.IAS.HOLDINGS (
	  MD_START_DT
	, MD_SOURCE
	, MD_SEQ
	, A_C_ID
	, A_C_REPRESENTATIVE
	, TI_ALTERNATE_ID
	, TRAN_SUMM_CURR_MKT_VALUE
	, TRAN_SUMM_BUSINESS_DATE
	, TI_ALTERNATE_TI_TYPE
	, B_V_SECURITY_POSITION_VAL
	, B_V_SECURITY_POSITION_COS
	, TRAN_SUMM_AVG_UNIT_COST
	, TRAN_SUMM_NET_SETT_AMT
	, TRAN_SUMM_CURRENCY
	, TRAN_SUMM_SETT_QTY
	, TRAN_SUMM_TRADE_QTY
	, MD_EXTRACT_DT
	, MD_SRC_SYSTEM
	, TI_FACE_VALUE
	, TI_BASIS_POINT
	, MKT_PRICE_DATE
	, MARKET_PRICE_BID
	, MARKET_PRICE_ASK
	, MARKET_PRICE_CLOSE
	, PRICE_CURRENCY
	, TRAN_SUMM_CURR_MKT_PRICE
	, TRAN_SUMM_SFK_QTY	
)
FROM
	(
	SELECT
		TO_DATE(split_part(split_part(metadata$filename, ''__'', 2), ''.'', 0)),metadata$filename, metadata$file_row_number,
		t.$1, t.$2, t.$3, t.$4, t.$5, t.$6, t.$7, t.$8, t.$9, t.$10, t.$11, t.$12, t.$13, t.$14, t.$15, t.$16, t.$17, t.$18, t.$19, t.$20, t.$21, t.$22, t.$23, t.$24
	FROM
		@DATALAKE.'||io_PATH||' T
	) pattern = ''.*/HOLDINGS_.*csv'' file_format =(format_name = DB_IAW_'||ENV||'_STG.IAS.PIPE_UTF16);
              ';
UPD_QUERY := '
UPDATE DB_IAW_'||ENV||'_STG.IAS.HOLDINGS
SET 
	HK_LINK = SHA1(UPPER(CONCAT(
	  COALESCE(TRIM(MD_SEQ), ''#NULL#''), ''|'' 
	, COALESCE(TRIM(MD_SRC_SYSTEM), ''#NULL#''), ''|'' 
	, COALESCE(TRIM(MD_EXTRACT_DT), ''#NULL#''), ''|'' 
	, COALESCE(TRIM(A_C_ID), ''#NULL#''), ''|'' 
	, COALESCE(TRIM(A_C_REPRESENTATIVE), ''#NULL#''), ''|'' 
	, COALESCE(TRIM(TI_ALTERNATE_ID), ''#NULL#''), ''|''
	, ''#NULL#'', ''|''
	, ''#NULL#''
	))),
		
	HK_HUB_CONTRACT = DECODE(TRUE, A_C_ID IS NULL ,''0'',SHA1(UPPER(CONCAT(COALESCE(TRIM(MD_SRC_SYSTEM), ''#NULL#''), ''|'' , COALESCE(TRIM(A_C_ID), ''#NULL#''), ''|'' ,''#NULL#'', ''|'' ,''#NULL#'' )))),
	HK_HUB_REGISTERED_REPRESENTATIVE = DECODE(TRUE, A_C_REPRESENTATIVE IS NULL ,''0'',SHA1(UPPER(CONCAT(COALESCE(TRIM(MD_SRC_SYSTEM), ''#NULL#''), ''|'' , COALESCE(TRIM(A_C_REPRESENTATIVE), ''#NULL#''))))),
	HK_HUB_INVESTMENT_PRODUCT_TYPE = DECODE(TRUE, TI_ALTERNATE_ID IS NULL ,''0'',SHA1(UPPER(CONCAT(COALESCE(TRIM(MD_SRC_SYSTEM), ''#NULL#''), ''|'' , COALESCE(TRIM(TI_ALTERNATE_ID), ''#NULL#''))))),

	MD_HASHDIFF=SHA1(CONCAT(
	  COALESCE(TO_VARCHAR(TRAN_SUMM_CURR_MKT_VALUE),''#NULL#''), ''|'' 
	, COALESCE(TO_VARCHAR(TRAN_SUMM_BUSINESS_DATE),''#NULL#''), ''|''
	, COALESCE(TI_ALTERNATE_TI_TYPE,''#NULL#''),''|'' 
	, COALESCE(TO_VARCHAR(B_V_SECURITY_POSITION_VAL),''#NULL#''),''|'' 
	, COALESCE(TO_VARCHAR(B_V_SECURITY_POSITION_COS),''#NULL#''),''|''
	, COALESCE(TO_VARCHAR(TRAN_SUMM_AVG_UNIT_COST),''#NULL#''),''|'' 
	, COALESCE(TO_VARCHAR(TRAN_SUMM_NET_SETT_AMT),''#NULL#''),''|'' 
	, COALESCE(TRAN_SUMM_CURRENCY,''#NULL#''),''|'' 
	, COALESCE(TO_VARCHAR(TRAN_SUMM_SETT_QTY),''#NULL#''),''|'' 
	, COALESCE(TO_VARCHAR(TRAN_SUMM_TRADE_QTY),''#NULL#''),''|''
	, COALESCE(TO_VARCHAR(TI_FACE_VALUE),''#NULL#''),''|'' 
	, COALESCE(TO_VARCHAR(TI_BASIS_POINT),''#NULL#''),''|''
	, COALESCE(TO_VARCHAR(MKT_PRICE_DATE),''#NULL#''),''|'' 
	, COALESCE(TO_VARCHAR(MARKET_PRICE_BID),''#NULL#''),''|'' 
	, COALESCE(TO_VARCHAR(MARKET_PRICE_ASK),''#NULL#''),''|''
	, COALESCE(TO_VARCHAR(MARKET_PRICE_CLOSE),''#NULL#''),''|''
	, COALESCE(PRICE_CURRENCY,''#NULL#''),''|'' 
	, COALESCE(TO_VARCHAR(TRAN_SUMM_CURR_MKT_PRICE),''#NULL#''),''|'' 
	, COALESCE(TO_VARCHAR(TRAN_SUMM_SFK_QTY),''#NULL#'')	
	)),	
	
	MD_CREATION_DT= SYSTIMESTAMP()
Where 1=1;
';


EXECUTE IMMEDIATE :INS_PRE_QUERY;
EXECUTE IMMEDIATE :INS_COPY_QUERY;
EXECUTE IMMEDIATE :UPD_QUERY;
END
$$;

create procedure IAS.SP_CONV_LOADSTG_PSA_IAS_NBIN_TO_STG_INVESTMENT_PRODUCT_TYPE(ENV VARCHAR, IO_PATH VARCHAR)
    returns VARCHAR
    language SQL
    strict
as
$$
DECLARE
INS_PRE_QUERY STRING;
INS_COPY_QUERY STRING;
UPD_QUERY STRING;

BEGIN
INS_PRE_QUERY := 'DELETE FROM DB_IAW_'||ENV||'_STG.IAS.INVESTMENT_PRODUCT_TYPE WHERE 1=1;';
INS_COPY_QUERY := '
COPY INTO DB_IAW_'||ENV||'_STG.IAS.INVESTMENT_PRODUCT_TYPE
(
MD_START_DT,
MD_SOURCE,
TI_ALTERNATE_ID,
TI_ALTERNATE_TI_TYPE,
TI_TYPE,
TI_ALTERNATE_TI_CLASS,
TI_CLASS,
TI_ALTERNATE_SHORT_DESC,
ENGLISH_DESCRIPTION,
TI_SYMBOL,
MD_EXTRACT_DT,
MD_SRC_SYSTEM
)
FROM
	(
	SELECT
		TO_DATE(split_part(split_part(metadata$filename, ''__'', 2), ''.'', 0)), metadata$filename,t.$1, t.$2, t.$3, t.$4, t.$5, t.$6, t.$7, t.$8, t.$9, t.$10
	FROM
		@DATALAKE.'||io_PATH||' T
	) pattern = ''.*MARKETPRODUCTS__.*csv'' file_format =(format_name = DB_IAW_'||ENV||'_STG.IAS.PIPE_UTF16);
              ';
UPD_QUERY := '
UPDATE DB_IAW_'||ENV||'_STG.IAS.INVESTMENT_PRODUCT_TYPE
SET
HK_HUB=
SHA1(UPPER(CONCAT(COALESCE(TRIM(MD_SRC_SYSTEM), ''#NULL#''), ''|'' , COALESCE(TRIM(TI_ALTERNATE_ID), ''#NULL#'')))),
MD_HASHDIFF=
SHA1(CONCAT(COALESCE(TI_ALTERNATE_TI_TYPE, ''#NULL#''), ''|'',COALESCE(TI_TYPE, ''#NULL#''), ''|'' , COALESCE(TI_ALTERNATE_TI_CLASS, ''#NULL#''), ''|'' , COALESCE(TI_CLASS, ''#NULL#''), ''|'' , COALESCE(TO_VARCHAR(TI_ALTERNATE_SHORT_DESC),''#NULL#''), ''|'', COALESCE(TO_VARCHAR(ENGLISH_DESCRIPTION),''#NULL#''), ''|'', COALESCE(TI_SYMBOL,''#NULL#'') )),	
MD_CREATION_DT= SYSTIMESTAMP()
Where 1=1;
';


EXECUTE IMMEDIATE :INS_PRE_QUERY;
EXECUTE IMMEDIATE :INS_COPY_QUERY;
EXECUTE IMMEDIATE :UPD_QUERY;
END
$$;

create procedure IAS.SP_CONV_LOADSTG_PSA_IAS_NBIN_TO_STG_PLANS(ENV VARCHAR, IO_PATH VARCHAR)
    returns VARCHAR
    language SQL
    strict
as
$$
DECLARE
INS_PRE_QUERY STRING;
INS_COPY_QUERY STRING;
UPD_QUERY STRING;

BEGIN
INS_PRE_QUERY := 'DELETE FROM DB_IAW_'||ENV||'_STG.IAS.REF_INVESTMENT_SAVING_PROGRAM_TYPES WHERE 1=1;';
INS_COPY_QUERY := '
COPY INTO DB_IAW_'||ENV||'_STG.IAS.REF_INVESTMENT_SAVING_PROGRAM_TYPES
(
MD_START_DT,
MD_SOURCE,
A_C_ACCOUNT_CLASS,
RETAIL_PLAN,
RETAIL_PLAN_RESP,
ACCOUNT_RAP_CODE,
MD_EXTRACT_DT,
MD_SRC_SYSTEM
)
FROM
	(
	SELECT
		TO_DATE(split_part(split_part(metadata$filename, ''__'', 2), ''.'', 0)), metadata$filename,t.$1, t.$2, t.$3, t.$4,t.$5, t.$6
	FROM
		@DATALAKE.'||io_PATH||' t
	) pattern =''.*PLANS_.*csv'' file_format=(format_name=DB_IAW_'||ENV||'_STG.IAS.PIPE_UTF16);
              ';
UPD_QUERY := '
UPDATE DB_IAW_'||ENV||'_STG.IAS.REF_INVESTMENT_SAVING_PROGRAM_TYPES
SET
HK_HUB=SHA1(UPPER(CONCAT(COALESCE(TRIM(MD_SRC_SYSTEM),''#NULL#'') ,''|'', ''#NULL#'',''|'', COALESCE(TRIM(A_C_ACCOUNT_CLASS),''#NULL#''), ''|'' , COALESCE(TRIM(TO_VARCHAR(RETAIL_PLAN)),''#NULL#''), ''|'', COALESCE(TRIM(RETAIL_PLAN_RESP),''#NULL#''),''|'', COALESCE(TRIM(ACCOUNT_RAP_CODE),''#NULL#'')))),
     MD_HASHDIFF=''0'' ,
	MD_CREATION_DT=SYSTIMESTAMP()
Where 1=1;
';

EXECUTE IMMEDIATE :INS_PRE_QUERY;
EXECUTE IMMEDIATE :INS_COPY_QUERY;
EXECUTE IMMEDIATE :UPD_QUERY;
END
$$;

create procedure STEWARDSHIP.SP_CONV_LOADSTG_PSA_IAS_STEWARDSHIP_TO_STG_REF_MAPPING_OPER_TYPE(ENV VARCHAR, IO_PATH VARCHAR)
    returns VARCHAR
    language SQL
    strict
as
$$
DECLARE
INS_PRE_QUERY STRING;
INS_COPY_QUERY STRING;
UPD_QUERY STRING;

BEGIN
INS_PRE_QUERY := 'DELETE FROM DB_IAW_'||ENV||'_STG.STEWARDSHIP.REF_MAPPING_OPER_TYPE WHERE 1=1;';
INS_COPY_QUERY := '
COPY INTO
	DB_IAW_'||ENV||'_STG.STEWARDSHIP.REF_MAPPING_OPER_TYPE (
	MD_START_DT,
	MD_SOURCE,
	DESCRIPTION_EN,
	DESCRIPTION_SHORT_EN,
	DESCRIPTION_FR,
	DESCRIPTION_SHORT_FR,
	IBMSOURCE,
	LEVEL,
	OPERATION_TYPE,
	DISPLAY,
	CASHFLOW_SUMMARY,
	ISCASHFLOW,
	MD_EXTRACT_DT,
	MD_SRC_SYSTEM
)
FROM
	(
	SELECT
		TO_DATE(split_part(split_part(metadata$filename, ''__'', 2), ''.'', 0)), metadata$filename,t.$1, t.$2, t.$3, t.$4, t.$5, t.$6, t.$7, t.$8, t.$9, t.$10, t.$11, t.$12
	FROM
		@DATALAKE.'||io_PATH||' T
	) pattern = ''.*MAPPING_OPER_TYPE__.*csv'' file_format =(format_name = DB_IAW_'||ENV||'_STG.IAS.PIPE_UTF16);
              ';
UPD_QUERY := '
UPDATE DB_IAW_'||ENV||'_STG.STEWARDSHIP.REF_MAPPING_OPER_TYPE
SET
HK_HUB=
SHA1(UPPER(CONCAT(COALESCE(TRIM(IBMSOURCE), ''#NULL#''), ''|'' , COALESCE(TRIM(TO_VARCHAR(LEVEL)), ''#NULL#''), ''|'' , COALESCE(TRIM(MD_SRC_SYSTEM), ''#NULL#'') ))),
MD_HASHDIFF=
SHA1(CONCAT(COALESCE(DESCRIPTION_EN, ''#NULL#'')
, ''|'', COALESCE(DESCRIPTION_SHORT_EN, ''#NULL#'')
, ''|'', COALESCE(DESCRIPTION_FR, ''#NULL#'')
, ''|'', COALESCE(DESCRIPTION_SHORT_FR, ''#NULL#'')
, ''|'', COALESCE(OPERATION_TYPE, ''#NULL#'')
, ''|'', COALESCE(TO_VARCHAR(DISPLAY), ''#NULL#'')
, ''|'', COALESCE(CASHFLOW_SUMMARY, ''#NULL#'')
, ''|'', COALESCE(TO_VARCHAR(ISCASHFLOW), ''#NULL#'')
)),	
MD_CREATION_DT=systimestamp()
Where 1=1;
';


EXECUTE IMMEDIATE :INS_PRE_QUERY;
EXECUTE IMMEDIATE :INS_COPY_QUERY;
EXECUTE IMMEDIATE :UPD_QUERY;
END
$$;

create procedure STEWARDSHIP.SP_CONV_LOADSTG_PSA_IAS_TO_STG_REF_MANUAL_ADVISOR_RVP(ENV VARCHAR, IO_PATH VARCHAR)
    returns VARCHAR
    language SQL
    strict
as
$$
DECLARE
INS_PRE_QUERY STRING;
INS_COPY_QUERY STRING;
UPD_QUERY STRING;

BEGIN
INS_PRE_QUERY := 'DELETE FROM DB_IAW_'||ENV||'_STG.STEWARDSHIP.REF_MANUAL_ADVISOR_RVP WHERE 1=1;';
INS_COPY_QUERY := '
COPY INTO
	DB_IAW_'||ENV||'_STG.STEWARDSHIP.REF_MANUAL_ADVISOR_RVP (
	 MD_START_DT,
	MD_SOURCE,
	ADVISOR,
	TEAM,
	REPID,
	RVP,
	PROVINCE ,
	IND_EXCLUDE,
	MD_EXTRACT_DT,
	MD_SRC_SYSTEM
	)
FROM
	(
	SELECT
		TO_DATE(split_part(split_part(metadata$filename, ''__'', 2), ''.'', 0)), metadata$filename,t.$1, t.$2, t.$3, t.$4, t.$5, t.$6, t.$7, t.$8
	FROM
		@DATALAKE.'||io_PATH||' T
	) pattern = ''.*MANUAL_ADVISOR_RVP__.*csv'' file_format =(format_name = DB_IAW_'||ENV||'_STG.IAS.PIPE_UTF16);
              ';
UPD_QUERY := '
UPDATE DB_IAW_'||ENV||'_STG.STEWARDSHIP.REF_MANUAL_ADVISOR_RVP
SET
HK_HUB=
SHA1(UPPER(CONCAT(COALESCE(TRIM(MD_SRC_SYSTEM), ''#NULL#''), ''|'' , COALESCE(TRIM(REPID), ''#NULL#'')))),
MD_HASHDIFF=
SHA1(CONCAT(
   COALESCE(ADVISOR, ''#NULL#''), ''|''
,  COALESCE(TEAM, ''#NULL#''), ''|''
,  COALESCE(RVP, ''#NULL#''), ''|''
,  COALESCE(PROVINCE, ''#NULL#''), ''|''
,  COALESCE(TO_VARCHAR(IND_EXCLUDE), ''#NULL#'')
)),	
MD_CREATION_DT=systimestamp()
Where 1=1;
';


EXECUTE IMMEDIATE :INS_PRE_QUERY;
EXECUTE IMMEDIATE :INS_COPY_QUERY;
EXECUTE IMMEDIATE :UPD_QUERY;
END
$$;

create procedure STEWARDSHIP.SP_CONV_LOADSTG_PSA_IAS_TO_STG_REF_MONTHLY_MILESTONES(ENV VARCHAR, IO_PATH VARCHAR)
    returns VARCHAR
    language SQL
    strict
as
$$
DECLARE
INS_PRE_QUERY STRING;
INS_COPY_QUERY STRING;
UPD_QUERY STRING;

BEGIN
INS_PRE_QUERY := 'DELETE FROM DB_IAW_'||ENV||'_STG.STEWARDSHIP.REF_MONTHLY_MILESTONES WHERE 1=1;';
INS_COPY_QUERY := '
COPY INTO
	DB_IAW_'||ENV||'_STG.STEWARDSHIP.REF_MONTHLY_MILESTONES (
	MD_START_DT,
	MD_SOURCE,
	ADVISOR ,
	TEAM ,
	REPID ,
	RVP ,
	PROVINCE,
	AUA_DEC,
	AUA_JAN,
	AUA_FEB,
	MD_EXTRACT_DT,
	MD_SRC_SYSTEM
	)
FROM
	(
	SELECT
		TO_DATE(split_part(split_part(metadata$filename, ''__'', 2), ''.'', 0)), metadata$filename,t.$1, t.$2, t.$3, t.$4, t.$5, t.$6, t.$7, t.$8, t.$9, t.$10
	FROM
		@DATALAKE.'||io_PATH||' T
	) pattern = ''.*MONTHLY_MILESTONES__.*csv''  file_format =(format_name = DB_IAW_'||ENV||'_STG.IAS.PIPE_UTF16);
              ';
			  
UPD_QUERY := '
UPDATE DB_IAW_'||ENV||'_STG.STEWARDSHIP.REF_MONTHLY_MILESTONES
SET
HK_HUB=
SHA1(UPPER(CONCAT(COALESCE(TRIM(MD_SRC_SYSTEM), ''#NULL#''), ''|'' , COALESCE(TRIM(REPID), ''#NULL#'')))),
MD_HASHDIFF=
SHA1(CONCAT(
   COALESCE(ADVISOR, ''#NULL#''), ''|''
,  COALESCE(TEAM, ''#NULL#''), ''|''
,  COALESCE(RVP, ''#NULL#''), ''|''
,  COALESCE(PROVINCE, ''#NULL#''), ''|''
,  COALESCE(TO_VARCHAR(AUA_DEC), ''#NULL#''), ''|''
,  COALESCE(TO_VARCHAR(AUA_JAN), ''#NULL#''), ''|''
,  COALESCE(TO_VARCHAR(AUA_FEB), ''#NULL#'')
)),	
MD_CREATION_DT=systimestamp()
Where 1=1;
';


EXECUTE IMMEDIATE :INS_PRE_QUERY;
EXECUTE IMMEDIATE :INS_COPY_QUERY;
EXECUTE IMMEDIATE :UPD_QUERY;
END
$$;

create procedure STEWARDSHIP.SP_CONV_LOADSTG_PSA_IAS_TO_STG_REF_PRODUCT_ASSET_CATEGORY(ENV VARCHAR, IO_PATH VARCHAR)
    returns VARCHAR
    language SQL
    strict
as
$$
DECLARE
INS_PRE_QUERY STRING;
INS_COPY_QUERY STRING;
UPD_QUERY STRING;

BEGIN
INS_PRE_QUERY := 'DELETE FROM DB_IAW_'||ENV||'_STG.STEWARDSHIP.REF_PRODUCT_ASSET_CATEGORY WHERE 1=1;';
INS_COPY_QUERY := '
COPY INTO
	DB_IAW_'||ENV||'_STG.STEWARDSHIP.REF_PRODUCT_ASSET_CATEGORY (
	MD_START_DT,
	MD_SOURCE,
	TI_ALTERNATE_TI_TYPE,
	ASSET_CATEGORY,
	MD_EXTRACT_DT,
	MD_SRC_SYSTEM
	)
FROM
	(
	SELECT
		TO_DATE(split_part(split_part(metadata$filename, ''__'', 2), ''.'', 0)), metadata$filename,t.$1, t.$2, t.$3, t.$4
	FROM
		@DATALAKE.'||io_PATH||' T
	) pattern = ''.*PRODUCT_ASSET_CATEGORY__.*csv'' file_format =(format_name = DB_IAW_'||ENV||'_STG.IAS.PIPE_UTF16);
              ';
UPD_QUERY := '
UPDATE DB_IAW_'||ENV||'_STG.STEWARDSHIP.REF_PRODUCT_ASSET_CATEGORY
SET
HK_HUB=
SHA1(UPPER(CONCAT(COALESCE(TRIM(MD_SRC_SYSTEM), ''#NULL#''), ''|'' , COALESCE(TRIM(TI_ALTERNATE_TI_TYPE), ''#NULL#'')))),
MD_HASHDIFF=
SHA1(CONCAT(COALESCE(ASSET_CATEGORY, ''#NULL#'') )),	
MD_CREATION_DT=systimestamp()
Where 1=1;
';

EXECUTE IMMEDIATE :INS_PRE_QUERY;
EXECUTE IMMEDIATE :INS_COPY_QUERY;
EXECUTE IMMEDIATE :UPD_QUERY;
END
$$;

create procedure STEWARDSHIP.SP_CONV_LOADSTG_PSA_IAS_TO_STG_REF_RAPCODE_PLAN(ENV VARCHAR, IO_PATH VARCHAR)
    returns VARCHAR
    language SQL
    strict
as
$$
DECLARE
INS_PRE_QUERY STRING;
INS_COPY_QUERY STRING;
UPD_QUERY STRING;

BEGIN
INS_PRE_QUERY := 'DELETE FROM DB_IAW_'||ENV||'_STG.STEWARDSHIP.REF_RAPCODE_PLAN WHERE 1=1;';
INS_COPY_QUERY := '
COPY INTO
	DB_IAW_'||ENV||'_STG.STEWARDSHIP.REF_RAPCODE_PLAN (
	MD_START_DT,
	MD_SOURCE,
	ACCOUNT_RAP_CODE,
	RETAIL_PLAN,
	PLAN_LABEL,
	ACCOUNT_TYPE,
	GROUP_TYPE_CODE,
	ASC_1_RESP_PLAN_TYPES,
	ACCUMULATION_TYPE,
	MD_EXTRACT_DT,
	MD_SRC_SYSTEM
	)
FROM
	(
	SELECT
		TO_DATE(split_part(split_part(metadata$filename, ''__'', 2), ''.'', 0)), metadata$filename,t.$1, t.$2, t.$3, t.$4, t.$5, t.$6, t.$7, t.$8, t.$9
	FROM
		@DATALAKE.'||io_PATH||' T
	) pattern = ''.*RAPCODE_PLAN__.*csv'' file_format =(format_name = DB_IAW_'||ENV||'_STG.IAS.PIPE_UTF16);
              ';

UPD_QUERY := '
UPDATE DB_IAW_'||ENV||'_STG.STEWARDSHIP.REF_RAPCODE_PLAN
SET
HK_HUB=
SHA1(UPPER(CONCAT(COALESCE(TRIM(MD_SRC_SYSTEM), ''#NULL#''), ''|''
,  COALESCE(TRIM(ACCOUNT_RAP_CODE), ''#NULL#''), ''|''
,  COALESCE(TRIM(RETAIL_PLAN), ''#NULL#''), ''|''
,  COALESCE(TRIM(ASC_1_RESP_PLAN_TYPES), ''#NULL#'')
))),
MD_HASHDIFF=
SHA1(CONCAT(
   COALESCE(PLAN_LABEL, ''#NULL#''), ''|''
,  COALESCE(ACCOUNT_TYPE, ''#NULL#''), ''|''
,  COALESCE(GROUP_TYPE_CODE, ''#NULL#''), ''|''
,  COALESCE(ACCUMULATION_TYPE, ''#NULL#'')
)),	
MD_CREATION_DT=systimestamp()
Where 1=1;
';
EXECUTE IMMEDIATE :INS_PRE_QUERY;
EXECUTE IMMEDIATE :INS_COPY_QUERY;
EXECUTE IMMEDIATE :UPD_QUERY;
END
$$;

create procedure IAS_UNIVERIS.SP_CONV_LOADSTG_PSA_IAS_UNIVERIS_CONTRACT(ENV VARCHAR, IO_PATH VARCHAR)
    returns VARCHAR
    language SQL
    strict
as
$$
DECLARE
INS_PRE_DEL STRING;
INS_PRE_COPY STRING;
INS_UPDATE STRING;
BEGIN
INS_PRE_DEL := 'DELETE FROM DB_IAW_'||ENV||'_STG.IAS_UNIVERIS.CONTRACT WHERE 1=1';
INS_PRE_COPY := '
COPY INTO DB_IAW_'||ENV||'_STG.IAS_UNIVERIS.CONTRACT
(
MD_START_DT,
MD_SOURCE,
PLN_SYSID,
IVR_SYSID,
PLN_CD,
PLN_STATUS,
PLN_ADM_CD,
SETUP_DT,
CLOSE_DT,
PEN_JUR_CD,
FEE_EXMP_IND,
ADMINISTRATOR_TYPE,
MD_EXTRACT_DT,
MD_SRC_SYSTEM,
REP_SYSID,
REP_CD
)
FROM
	(
	SELECT
		TO_DATE(split_part(split_part(metadata$filename, ''__'', 2), ''.'', 0)), metadata$filename,t.$1, t.$2, t.$3, t.$4, t.$5, t.$6, t.$7, t.$8, t.$9, t.$10, t.$11, t.$12, t.$13, t.$14
	FROM
		@DATALAKE.'||IO_PATH||' t
	) pattern = ''.*ACCOUNTS_.*csv'' file_format =(format_name = DB_IAW_'||ENV||'_STG.IAS_UNIVERIS.PIPE_UTF16)
		';
	
INS_UPDATE:='UPDATE DB_IAW_'||ENV||'_STG.IAS_UNIVERIS.CONTRACT
SET
    HK_HUB = SHA1(UPPER(CONCAT(COALESCE(TRIM(MD_SRC_SYSTEM), ''#NULL#''), ''|'' ,''#NULL#'',''|'', COALESCE(TRIM(PLN_SYSID), ''#NULL#'')	,''|'', COALESCE(TRIM(IVR_SYSID), ''#NULL#'')))),
	MD_HASHDIFF =  SHA1(CONCAT(COALESCE(TRIM(PLN_CD), ''#NULL#''), ''|'',
	COALESCE(TRIM(PLN_STATUS),''#NULL#''),''|'',
	COALESCE(TRIM(PLN_ADM_CD),''#NULL#''), ''|'',
	COALESCE(TRIM(TO_VARCHAR(SETUP_DT)), ''#NULL#''), ''|'',
	COALESCE(TRIM(TO_VARCHAR(CLOSE_DT)), ''#NULL#''), ''|'',
	COALESCE(TRIM(PEN_JUR_CD),''#NULL#''), ''|'',
	COALESCE(TRIM(TO_VARCHAR(FEE_EXMP_IND)),''#NULL#''), ''|'',
	COALESCE(TRIM(ADMINISTRATOR_TYPE),''#NULL#''),''|'',
	COALESCE(TRIM(TO_VARCHAR(REP_SYSID)),''#NULL#''),''|'',
	COALESCE(TRIM(REP_CD),''#NULL#''))) ,	
    MD_CREATION_DT=systimestamp()
	Where 1=1
		';
EXECUTE IMMEDIATE :INS_PRE_DEL;
EXECUTE IMMEDIATE :INS_PRE_COPY;
EXECUTE IMMEDIATE :INS_UPDATE;
END
$$;

create procedure IAS_UNIVERIS.SP_CONV_LOADSTG_PSA_IAS_UNIVERIS_TO_STG_CLIENTS(ENV VARCHAR, IO_PATH VARCHAR)
    returns VARCHAR
    language SQL
    strict
as
$$
DECLARE
DEL_QUERY STRING;
INS_QUERY STRING;
UPD_QUERY STRING;
BEGIN
DEL_QUERY := 'DELETE FROM DB_IAW_'||ENV||'_STG.IAS_UNIVERIS.ACCOUNT_HOLDER WHERE 1=1;';
INS_QUERY := '
COPY INTO DB_IAW_'||ENV||'_STG.IAS_UNIVERIS.ACCOUNT_HOLDER
(
	MD_START_DT,
	MD_SOURCE,
	IVR_SYSID,
	REP_SYSID,
	RECIPIENT_DESC_ENG,
	RECIPIENT_DESC_FRE,
	CORP_CD,
	IVR_ST_NAME_ENG,
	IVR_ST_NAME_FRE,
	IVR_REG_2,
	LANG_CD,
	IVR_RES_CD,
	IVR_SETUP_DT,
	IVR_STOP_DT,
	IVR_FRGN_CTNT,
	IVR_HOLD_MAIL,
	IVR_INC_ADR,
	IVR_STMT_FREQ,
	IVR_STMT_TYPE,
	IVR_STMT_DT,
	IVR_OLD_DLR,
	SALARY_DESC,
	IVR_KYC_DT,
	IVR_PRIM_BDT,
	MD_EXTRACT_DT,
	MD_SRC_SYSTEM,
	CREATE_DT
)
FROM
	(
	SELECT
		TO_DATE(split_part(split_part(metadata$filename, ''__'', 2), ''.'', 0)), metadata$filename,t.$1, t.$2, t.$3, t.$4, t.$5, t.$6,t.$7, t.$8,t.$9, t.$10,
		t.$11, t.$12, t.$13, t.$14, t.$15, t.$16,t.$17, t.$18,t.$19, t.$20, t.$21,t.$22, t.$23,t.$24, t.$25
	FROM
		@DATALAKE.'||IO_PATH||' T
	) pattern =''.*CLIENTS_.*csv'' file_format=(format_name=IAS_UNIVERIS.PIPE_UTF16);
	';

UPD_QUERY := 'UPDATE DB_IAW_'||ENV||'_STG.IAS_UNIVERIS.ACCOUNT_HOLDER
SET
    HK_HUB=SHA1(UPPER(CONCAT(COALESCE(TRIM(MD_SRC_SYSTEM), ''#NULL#''), ''|'' , COALESCE(TRIM(IVR_SYSID), ''#NULL#'')))),
	MD_HASHDIFF=SHA1(CONCAT(
	COALESCE(TO_VARCHAR(REP_SYSID),''#NULL#''), ''|'',
	COALESCE(RECIPIENT_DESC_ENG, ''#NULL#''), ''|'' , 	
	COALESCE(RECIPIENT_DESC_FRE, ''#NULL#''), ''|'' ,
	COALESCE(CORP_CD, ''#NULL#''), ''|'' ,
	COALESCE(IVR_ST_NAME_ENG, ''#NULL#''), ''|'' ,
	COALESCE(IVR_ST_NAME_FRE, ''#NULL#''), ''|'' ,
	COALESCE(IVR_REG_2, ''#NULL#''), ''|'' ,
	COALESCE(LANG_CD, ''#NULL#''), ''|'' ,
	COALESCE(IVR_RES_CD, ''#NULL#''), ''|'' ,
	COALESCE(TO_VARCHAR(IVR_SETUP_DT),''#NULL#''), ''|'',
	COALESCE(TO_VARCHAR(IVR_STOP_DT),''#NULL#''), ''|'',
	COALESCE(TO_VARCHAR(IVR_FRGN_CTNT),''#NULL#''), ''|'',
	COALESCE(TO_VARCHAR(IVR_HOLD_MAIL),''#NULL#''), ''|'',
	COALESCE(TO_VARCHAR(IVR_INC_ADR),''#NULL#''), ''|'',
	COALESCE(IVR_STMT_FREQ, ''#NULL#''), ''|'' ,
	COALESCE(IVR_STMT_TYPE, ''#NULL#''), ''|'' ,
	COALESCE(TO_VARCHAR(IVR_STMT_DT),''#NULL#''), ''|'',
	COALESCE(IVR_OLD_DLR, ''#NULL#''), ''|'' ,
	COALESCE(SALARY_DESC, ''#NULL#''), ''|'' ,
	COALESCE(TO_VARCHAR(IVR_KYC_DT),''#NULL#''), ''|'',
	COALESCE(TO_VARCHAR(IVR_PRIM_BDT),''#NULL#''), ''|'',
	COALESCE(TO_VARCHAR(CREATE_DT),''#NULL#''))),	
	MD_CREATION_DT=SYSTIMESTAMP()
Where 1=1;';


EXECUTE IMMEDIATE :DEL_QUERY;
EXECUTE IMMEDIATE :INS_QUERY;
EXECUTE IMMEDIATE :UPD_QUERY;
END
$$;

create procedure IAS_UNIVERIS.SP_CONV_LOADSTG_PSA_IAS_UNIVERIS_TO_STG_FINANCIAL_TRANSACTIONS(ENV VARCHAR, IO_PATH VARCHAR)
    returns VARCHAR
    language SQL
    strict
as
$$
DECLARE
INS_PRE_QUERY STRING;
INS_COPY_QUERY STRING;
UPD_QUERY STRING;

BEGIN
INS_PRE_QUERY := 'DELETE FROM DB_IAW_'||ENV||'_STG.IAS_UNIVERIS.FINANCIAL_TRANSACTIONS WHERE 1=1;';
INS_COPY_QUERY := '
COPY INTO
	DB_IAW_'||ENV||'_STG.IAS_UNIVERIS.FINANCIAL_TRANSACTIONS
(
MD_START_DT,
MD_SOURCE,
TRX_SYSID,
IVR_SYSID,
REP_SYSID,
PLN_SYSID,
ACT_SYSID,
IVD_SYSID,
TRX_STATUS,
TRX_ST_DESC_ENG,
TRADE_DT,
MGT_CD,
MGT_NAME_ENG,
DLR_SYSID,
RGN_SYSID,
BRN_SYSID,
TRX_UNIT,
TRX_PRICE,
TRX_GROSS,
TRX_NET,
TRX_GROSS_CAD,
SPR_FACTOR,
CURRENCY_CD,
DLR_CD,
RGN_CD,
BRN_CD,
REP_CD,
PLN_TYPE,
SPR_CTGY,
TRX_MNEM_ENG,
REVERSAL_IND,
MD_EXTRACT_DT,
MD_SRC_SYSTEM
)
FROM
	(
	SELECT
		TO_DATE(split_part(split_part(metadata$filename, ''__'', 2), ''.'', 0)), metadata$filename,t.$1, t.$2, t.$3, t.$4, t.$5, t.$6, t.$7, t.$8, t.$9, t.$10,t.$11, t.$12, t.$13, t.$14, t.$15, t.$16, t.$17, t.$18, t.$19, t.$20
		,t.$21, t.$22, t.$23, t.$24, t.$25, t.$26, t.$27, t.$28, t.$29, t.$30, t.$31
	FROM
		@DATALAKE.'||io_PATH||' T
	) pattern = ''.*TRANSACTIONS__.*csv'' file_format =(format_name = DB_IAW_'||ENV||'_STG.IAS_UNIVERIS.PIPE_UTF16);
              ';

UPD_QUERY := '
UPDATE DB_IAW_'||ENV||'_STG.IAS_UNIVERIS.FINANCIAL_TRANSACTIONS
SET
HK_LINK =
SHA1(UPPER(CONCAT(COALESCE(TRIM(MD_SRC_SYSTEM), ''#NULL#'')
, ''|'' , COALESCE(TRIM(TRX_SYSID), ''#NULL#'')
, ''|'' , ''#NULL#''
, ''|'' , ''#NULL#''
, ''|'' , COALESCE(TRIM(IVD_SYSID), ''#NULL#'')
, ''|'' , COALESCE(TRIM(PLN_SYSID), ''#NULL#'')
, ''|'' , COALESCE(TRIM(IVR_SYSID), ''#NULL#'')))),
HK_HUB_CONTRACT = DECODE(TRUE, PLN_SYSID IS NULL AND IVR_SYSID IS NULL ,''0'',SHA1(UPPER(CONCAT(COALESCE(TRIM(MD_SRC_SYSTEM), ''#NULL#''), ''|'' ,''#NULL#'',''|'', COALESCE(TRIM(PLN_SYSID), ''#NULL#'')	,''|'', COALESCE(TRIM(IVR_SYSID), ''#NULL#''))))),
HK_HUB_INVESTMENT_PRODUCT_TYPE = DECODE(TRUE, IVD_SYSID IS NULL ,''0'',SHA1(UPPER(CONCAT(COALESCE(TRIM(MD_SRC_SYSTEM), ''#NULL#''), ''|'' , COALESCE(TRIM(IVD_SYSID), ''#NULL#''))))),
MD_HASHDIFF = ''0'',
MD_CREATION_DT=systimestamp()
Where 1=1;
';
EXECUTE IMMEDIATE :INS_PRE_QUERY;
EXECUTE IMMEDIATE :INS_COPY_QUERY;
EXECUTE IMMEDIATE :UPD_QUERY;
END
$$;

create procedure IAS_UNIVERIS.SP_CONV_LOADSTG_PSA_IAS_UNIVERIS_TO_STG_INVESTMENT_PRODUCT_TYPE(ENV VARCHAR, IO_PATH VARCHAR)
    returns VARCHAR
    language SQL
    strict
as
$$
DECLARE
INS_PRE_QUERY STRING;
INS_COPY_QUERY STRING;
UPD_QUERY STRING;

BEGIN
INS_PRE_QUERY := 'DELETE FROM DB_IAW_'||ENV||'_STG.IAS_UNIVERIS.INVESTMENT_PRODUCT_TYPE WHERE 1=1;';
INS_COPY_QUERY := '
COPY INTO
	DB_IAW_'||ENV||'_STG.IAS_UNIVERIS.INVESTMENT_PRODUCT_TYPE
(
MD_START_DT,
MD_SOURCE,
IVD_SYSID ,
CURRENCY_CD ,
SYMBOL ,
IVD_ST_DESC_ENG ,
IVD_ST_DESC_FRE ,
IVD_LOAD_DESC_ENG ,
IVD_LOAD_DESC_FRE ,
IVT_NAME_ENG ,
IVT_NAME_FRE ,
IVT_CD_DESC_ENG ,
IVT_CD_DESC_FRE ,
IVT_ST_DESC_ENG ,
IVT_ST_DESC_FRE ,
ASSET_CLASS_DESC_ENG ,
ASSET_CLASS_DESC_FRE ,
ASSET_CTGY_DESC_ENG ,
ASSET_CTGY_DESC_FRE ,
IVT_TYPE_DESC_ENG ,
IVT_TYPE_DESC_FRE ,
CTGY_DESC_ENG ,
CTGY_DESC_FRE ,
GROUP_DESC_ENG ,
GROUP_DESC_FRE ,
MGT_CD ,
MGT_NAME_ENG ,
MGT_NAME_FRE ,
MD_EXTRACT_DT,
MD_SRC_SYSTEM
)
FROM
	(
	SELECT
		TO_DATE(split_part(split_part(metadata$filename, ''__'', 2), ''.'', 0)), metadata$filename,t.$1, t.$2, t.$3, t.$4, t.$5, t.$6, t.$7, t.$8, t.$9, t.$10,t.$11, t.$12, t.$13, t.$14, t.$15, t.$16, t.$17, t.$18, t.$19, t.$20,
		t.$21, t.$22, t.$23, t.$24, t.$25, t.$26, t.$27, t.$28
	FROM
		@DATALAKE.'||io_PATH||' T
	) pattern = ''.*MARKETPRODUCTS__.*csv'' file_format =(format_name = DB_IAW_'||ENV||'_STG.IAS_UNIVERIS.PIPE_UTF16);
              ';

UPD_QUERY := '
UPDATE DB_IAW_'||ENV||'_STG.IAS_UNIVERIS.INVESTMENT_PRODUCT_TYPE
SET
HK_HUB=
SHA1(UPPER(CONCAT(COALESCE(TRIM(MD_SRC_SYSTEM), ''#NULL#''), ''|'' , COALESCE(TO_VARCHAR(TRIM(IVD_SYSID)), ''#NULL#'')))),
MD_HASHDIFF=
SHA1(
CONCAT(
COALESCE(CURRENCY_CD, ''#NULL#''), ''|'',
COALESCE(SYMBOL, ''#NULL#''), ''|'' ,
COALESCE(IVD_ST_DESC_ENG, ''#NULL#''), ''|'' ,
COALESCE(IVD_ST_DESC_FRE, ''#NULL#''), ''|'' ,
COALESCE(IVD_LOAD_DESC_ENG, ''#NULL#''), ''|'' ,
COALESCE(IVD_LOAD_DESC_FRE, ''#NULL#''), ''|'' ,
COALESCE(IVT_NAME_ENG, ''#NULL#''), ''|'' ,
COALESCE(IVT_NAME_FRE, ''#NULL#''), ''|'' ,
COALESCE(IVT_CD_DESC_ENG, ''#NULL#''), ''|'' ,
COALESCE(IVT_CD_DESC_FRE, ''#NULL#''), ''|'' ,
COALESCE(IVT_ST_DESC_ENG, ''#NULL#''), ''|'' ,
COALESCE(IVT_ST_DESC_FRE, ''#NULL#''), ''|'' ,
COALESCE(ASSET_CLASS_DESC_ENG, ''#NULL#''), ''|'' ,
COALESCE(ASSET_CLASS_DESC_FRE, ''#NULL#''), ''|'' ,
COALESCE(ASSET_CTGY_DESC_ENG, ''#NULL#''), ''|'' ,
COALESCE(ASSET_CTGY_DESC_FRE, ''#NULL#''), ''|'' ,
COALESCE(IVT_TYPE_DESC_ENG, ''#NULL#''), ''|'' ,
COALESCE(IVT_TYPE_DESC_FRE, ''#NULL#''), ''|'' ,
COALESCE(CTGY_DESC_ENG, ''#NULL#''), ''|'' ,
COALESCE(CTGY_DESC_FRE, ''#NULL#''), ''|'' ,
COALESCE(GROUP_DESC_ENG, ''#NULL#''), ''|'' ,
COALESCE(GROUP_DESC_FRE, ''#NULL#''), ''|'' ,
COALESCE(MGT_CD,''#NULL#''), ''|'',
COALESCE(MGT_NAME_ENG,''#NULL#''), ''|'',
COALESCE(MGT_NAME_FRE,''#NULL#'')
)
),	
MD_CREATION_DT= SYSTIMESTAMP()
Where 1=1;
';
EXECUTE IMMEDIATE :INS_PRE_QUERY;
EXECUTE IMMEDIATE :INS_COPY_QUERY;
EXECUTE IMMEDIATE :UPD_QUERY;
END
$$;

create procedure INVESTIA_UNIVERIS.SP_CONV_LOADSTG_PSA_IAS_UNIVERIS_TO_STG_PLANS(ENV VARCHAR, IO_PATH VARCHAR)
    returns VARCHAR
    language SQL
    strict
as
$$
DECLARE
INS_PRE_QUERY STRING;
INS_COPY_QUERY STRING;
UPD_QUERY STRING;

BEGIN
INS_PRE_QUERY := 'DELETE FROM DB_IAW_'||ENV||'_STG.IAS_UNIVERIS.REF_INVESTMENT_SAVING_PROGRAM_TYPES WHERE 1=1;';
INS_COPY_QUERY := '
COPY INTO
	DB_IAW_'||ENV||'_STG.IAS_UNIVERIS.REF_INVESTMENT_SAVING_PROGRAM_TYPES
(
MD_START_DT,
MD_SOURCE,
PLN_CD,
PLN_REG,
PLN_MNEM,
PLN_DESC,
PLN_MNEM_F,
PLN_DESC_F,
PLN_MNEM_ENG,
PLN_DESC_ENG,
PLN_SHORT_DESC_ENG,
PLN_MNEM_FRE,
PLN_DESC_FRE,
PLN_SHORT_DESC_FRE,
STMT_GROUP_MNEM,
MD_EXTRACT_DT,
MD_SRC_SYSTEM
)
FROM
	(
	SELECT
		TO_DATE(split_part(split_part(metadata$filename, ''__'', 2), ''.'', 0)), metadata$filename,t.$1, t.$2, t.$3, t.$4, t.$5, t.$6,t.$7, t.$8, t.$9, t.$10, t.$11, t.$12, t.$13, t.$14,t.$15
	FROM
		@DATALAKE.'||io_PATH||' T
	) pattern = ''.*PLANS_.*csv'' file_format =(format_name = DB_IAW_'||ENV||'_STG.INVESTIA_UNIVERIS.PIPE_UTF16);
              ';

UPD_QUERY := '
UPDATE DB_IAW_'||ENV||'_STG.IAS_UNIVERIS.REF_INVESTMENT_SAVING_PROGRAM_TYPES
SET
    HK_HUB=SHA1(UPPER(CONCAT(COALESCE(TRIM(MD_SRC_SYSTEM), ''#NULL#''),''|'',COALESCE(TRIM(PLN_MNEM), ''#NULL#''), ''|'' ,''#NULL#'',''|'', ''#NULL#'',''|'',''#NULL#'',''|'',''#NULL#''))),
    MD_HASHDIFF=SHA1(CONCAT(COALESCE(TO_VARCHAR(PLN_CD), ''#NULL#''), ''|'',COALESCE(TO_VARCHAR(PLN_REG),''#NULL#''),''|'', COALESCE(PLN_DESC,''#NULL#''), ''|'', COALESCE(PLN_MNEM_F, ''#NULL#''), ''|'', COALESCE(PLN_DESC_F,''#NULL#''), ''|'', COALESCE(PLN_MNEM_ENG,''#NULL#''), ''|'', COALESCE(PLN_DESC_ENG,''#NULL#''),''|'', COALESCE(PLN_SHORT_DESC_ENG,''#NULL#''),''|'', COALESCE(PLN_MNEM_FRE,''#NULL#''),''|'', COALESCE(PLN_DESC_FRE,''#NULL#''),''|'', COALESCE(PLN_SHORT_DESC_FRE,''#NULL#''),''|'', COALESCE(STMT_GROUP_MNEM,''#NULL#''))),
    MD_CREATION_DT=systimestamp()
Where 1=1;
';
EXECUTE IMMEDIATE :INS_PRE_QUERY;
EXECUTE IMMEDIATE :INS_COPY_QUERY;
EXECUTE IMMEDIATE :UPD_QUERY;
END
$$;

create procedure IAS_UNIVERIS.SP_CONV_LOADSTG_PSA_IAS_UNIVERIS_TO_STG_PLANS(ENV VARCHAR, IO_PATH VARCHAR)
    returns VARCHAR
    language SQL
    strict
as
$$
DECLARE
INS_PRE_QUERY STRING;
INS_COPY_QUERY STRING;
UPD_QUERY STRING;

BEGIN
INS_PRE_QUERY := 'DELETE FROM DB_IAW_'||ENV||'_STG.IAS_UNIVERIS.REF_INVESTMENT_SAVING_PROGRAM_TYPES WHERE 1=1;';
INS_COPY_QUERY := '
COPY INTO
	DB_IAW_'||ENV||'_STG.IAS_UNIVERIS.REF_INVESTMENT_SAVING_PROGRAM_TYPES
(
MD_START_DT,
MD_SOURCE,
PLN_CD,
PLN_REG,
PLN_MNEM,
PLN_DESC,
PLN_MNEM_F,
PLN_DESC_F,
PLN_MNEM_ENG,
PLN_DESC_ENG,
PLN_SHORT_DESC_ENG,
PLN_MNEM_FRE,
PLN_DESC_FRE,
PLN_SHORT_DESC_FRE,
STMT_GROUP_MNEM,
MD_EXTRACT_DT,
MD_SRC_SYSTEM
)
FROM
	(
	SELECT
		TO_DATE(split_part(split_part(metadata$filename, ''__'', 2), ''.'', 0)), metadata$filename,t.$1, t.$2, t.$3, t.$4, t.$5, t.$6,t.$7, t.$8, t.$9, t.$10, t.$11, t.$12, t.$13, t.$14,t.$15
	FROM
		@DATALAKE.'||io_PATH||' T
	) pattern = ''.*PLANS_.*csv'' file_format =(format_name = DB_IAW_'||ENV||'_STG.INVESTIA_UNIVERIS.PIPE_UTF16);
              ';

UPD_QUERY := '
UPDATE DB_IAW_'||ENV||'_STG.IAS_UNIVERIS.REF_INVESTMENT_SAVING_PROGRAM_TYPES
SET
    HK_HUB=SHA1(UPPER(CONCAT(COALESCE(TRIM(MD_SRC_SYSTEM), ''#NULL#''),''|'',COALESCE(TRIM(PLN_MNEM), ''#NULL#''), ''|'' ,''#NULL#'',''|'', ''#NULL#'',''|'',''#NULL#'',''|'',''#NULL#''))),
    MD_HASHDIFF=SHA1(CONCAT(COALESCE(TO_VARCHAR(PLN_CD), ''#NULL#''), ''|'',COALESCE(TO_VARCHAR(PLN_REG),''#NULL#''),''|'', COALESCE(PLN_DESC,''#NULL#''), ''|'', COALESCE(PLN_MNEM_F, ''#NULL#''), ''|'', COALESCE(PLN_DESC_F,''#NULL#''), ''|'', COALESCE(PLN_MNEM_ENG,''#NULL#''), ''|'', COALESCE(PLN_DESC_ENG,''#NULL#''),''|'', COALESCE(PLN_SHORT_DESC_ENG,''#NULL#''),''|'', COALESCE(PLN_MNEM_FRE,''#NULL#''),''|'', COALESCE(PLN_DESC_FRE,''#NULL#''),''|'', COALESCE(PLN_SHORT_DESC_FRE,''#NULL#''),''|'', COALESCE(STMT_GROUP_MNEM,''#NULL#''))),
    MD_CREATION_DT=systimestamp()
Where 1=1;
';
EXECUTE IMMEDIATE :INS_PRE_QUERY;
EXECUTE IMMEDIATE :INS_COPY_QUERY;
EXECUTE IMMEDIATE :UPD_QUERY;
END
$$;

create procedure IAS_UNIVERIS.SP_CONV_LOADSTG_PSA_IAS_UNIVERIS_TO_STG_PLN_SRF(ENV VARCHAR, IO_PATH VARCHAR)
    returns VARCHAR
    language SQL
    strict
as
$$
DECLARE
INS_PRE_DEL STRING;
INS_PRE_COPY STRING;
INS_UPDATE STRING;
BEGIN
INS_PRE_DEL := 'DELETE FROM DB_IAW_'||ENV||'_STG.IAS_UNIVERIS.PLN_SRF WHERE 1=1';
INS_PRE_COPY := '
COPY INTO DB_IAW_'||ENV||'_STG.IAS_UNIVERIS.PLN_SRF
(
	MD_START_DT,
	MD_SOURCE,
	PLN_SRF_SYSID,
	PLN_SYSID,
	FAS_FILE_NAME,
	FROM_DT,
	TO_DT,
	MGT_CD,
	CURRENCY_CD,
	INCOME_TYPE,
	REP_CODE,
	COM_PYBL,
	EXCH_DT,
	EXCH_RATE,
	LAST_UPD_DT,
	USR_SYSID,
	FISCAL_SYSID,
	JUR_CD,
	ACT_TAX_COLLCTD,
	DLR_SYSID,
	RGN_SYSID,
	BRN_SYSID,
	REP_SYSID,
	IVR_SYSID,
	IVD_SYSID,
	MD_EXTRACT_DT,
	MD_SRC_SYSTEM
)
FROM
	(
	SELECT
		TO_DATE(split_part(split_part(metadata$filename, ''__'', 2), ''.'', 0)), metadata$filename,t.$1,t.$2,t.$3,t.$4,t.$5,t.$6,t.$7,t.$8,t.$9,t.$10,
		t.$11,t.$12,t.$13,t.$14,t.$15,t.$16,t.$17,t.$18,t.$19,t.$20,t.$21,t.$22,t.$23,t.$24,t.$25
	FROM
		@DATALAKE.'||IO_PATH||' T
	) pattern =''.*PLN_SRF_.*csv'' file_format=(format_name=DB_IAW_'||ENV||'_STG.IAS_UNIVERIS.PIPE_UTF16)
		';
	
INS_UPDATE:='UPDATE DB_IAW_'||ENV||'_STG.IAS_UNIVERIS.PLN_SRF
SET
HK_LINK= SHA1(UPPER(CONCAT(COALESCE(TRIM(MD_SRC_SYSTEM), ''#NULL#''), ''|'' ,
COALESCE(TO_VARCHAR(PLN_SRF_SYSID), ''#NULL#''), ''|'' ,
COALESCE(TO_VARCHAR(TO_DT), ''#NULL#''), ''|'' ,
COALESCE(TO_VARCHAR(PLN_SYSID), ''#NULL#''), ''|'' ,
COALESCE(TO_VARCHAR(IVR_SYSID), ''#NULL#''), ''|'' ,
COALESCE(TO_VARCHAR(IVD_SYSID), ''#NULL#''), ''|'',
''#NULL#''))),
HK_HUB_CONTRACT=DECODE(TRUE, PLN_SYSID IS NULL AND IVR_SYSID IS NULL,''0'',SHA1(UPPER(CONCAT(COALESCE(TRIM(MD_SRC_SYSTEM), ''#NULL#''), ''|'' ,''#NULL#'',''|'', COALESCE(TO_VARCHAR(PLN_SYSID), ''#NULL#'')	,''|'', COALESCE(TO_VARCHAR(IVR_SYSID), ''#NULL#''))))),
HK_HUB_INVESTMENT_PRODUCT_TYPE = DECODE(TRUE, IVD_SYSID IS NULL ,''0'',SHA1(UPPER(CONCAT(COALESCE(TRIM(MD_SRC_SYSTEM), ''#NULL#''), ''|'' , COALESCE(TO_VARCHAR(TO_VARCHAR(IVD_SYSID)), ''#NULL#''))))),
MD_HASHDIFF = SHA1(CONCAT(
	COALESCE(FAS_FILE_NAME, ''#NULL#''), ''|'' ,
	COALESCE(TO_VARCHAR(FROM_DT),''#NULL#''), ''|'',
	COALESCE(MGT_CD, ''#NULL#''), ''|'' ,
	COALESCE(CURRENCY_CD, ''#NULL#''), ''|'' ,
	COALESCE(INCOME_TYPE, ''#NULL#''), ''|'' ,
	COALESCE(REP_CODE, ''#NULL#''), ''|'' ,
	COALESCE(TO_VARCHAR(COM_PYBL),''#NULL#''), ''|'',
	COALESCE(TO_VARCHAR(EXCH_DT),''#NULL#''), ''|'',
	COALESCE(TO_VARCHAR(EXCH_RATE),''#NULL#''), ''|'',
	COALESCE(TO_VARCHAR(LAST_UPD_DT),''#NULL#''), ''|'',
	COALESCE(TO_VARCHAR(USR_SYSID),''#NULL#''), ''|'',
	COALESCE(TO_VARCHAR(FISCAL_SYSID),''#NULL#''), ''|'',
	COALESCE(JUR_CD, ''#NULL#''), ''|'' ,
	COALESCE(TO_VARCHAR(ACT_TAX_COLLCTD),''#NULL#''), ''|'',
	COALESCE(TO_VARCHAR(DLR_SYSID),''#NULL#''), ''|'',
	COALESCE(TO_VARCHAR(RGN_SYSID),''#NULL#''), ''|'',
	COALESCE(TO_VARCHAR(BRN_SYSID),''#NULL#''), ''|'',
	COALESCE(TO_VARCHAR(REP_SYSID),''#NULL#''))),	
	MD_CREATION_DT=systimestamp()
	Where 1=1;
		';
EXECUTE IMMEDIATE :INS_PRE_DEL;
EXECUTE IMMEDIATE :INS_PRE_COPY;
EXECUTE IMMEDIATE :INS_UPDATE;
END
$$;

create procedure IAS_UNIVERIS.SP_CONV_LOADSTG_PSA_IAS_UNIVERIS_TO_STG_REF_COM_PROD(ENV VARCHAR, IO_PATH VARCHAR)
    returns VARCHAR
    language SQL
    strict
as
$$
DECLARE
INS_PRE_DEL STRING;
INS_PRE_COPY STRING;
INS_UPDATE STRING;
BEGIN
INS_PRE_DEL := 'DELETE FROM DB_IAW_'||ENV||'_STG.IAS_UNIVERIS.S_COM_PRODUCTION WHERE 1=1';
INS_PRE_COPY := '
COPY INTO DB_IAW_'||ENV||'_STG.IAS_UNIVERIS.S_COM_PRODUCTION
(
MD_START_DT,
MD_SOURCE,
COM_PRODUCTION_CD,
COM_PRODUCTION_MNEM,
COM_PRODUCTION_DESC,
COM_PRODUCTION_LONG_DESC,
COM_PRODUCTION_MNEM_ENG,
COM_PRODUCTION_MNEM_FRE,
COM_PRODUCTION_DESC_ENG,
COM_PRODUCTION_DESC_FRE,
COM_PRODUCTION_LONG_DESC_ENG,
COM_PRODUCTION_LONG_DESC_FRE,
CRC_TRND_RPT_CAT,
COMMISSION_LEVEL,
CAC_TYPE_CD,
ACC_REPORT_IND,
MD_EXTRACT_DT,
MD_SRC_SYSTEM
)
FROM
	(
	SELECT
		TO_DATE(split_part(split_part(metadata$filename, ''__'', 2), ''.'', 0)), metadata$filename,t.$1, t.$2, t.$3, t.$4, t.$5, t.$6, t.$7, t.$8, t.$9
		,t.$10, t.$11, t.$12, t.$13, t.$14, t.$15, t.$16
	FROM
		@DATALAKE.'||IO_PATH||' T
	) pattern = ''.*S_COM_PROD__.*csv'' file_format =(format_name = DB_IAW_'||ENV||'_STG.IAS_UNIVERIS.PIPE_UTF16)
	';
INS_UPDATE:='UPDATE DB_IAW_'||ENV||'_STG.IAS_UNIVERIS.S_COM_PRODUCTION
SET HK_HUB=
	SHA1(UPPER(CONCAT(COALESCE(TRIM(MD_SRC_SYSTEM), ''#NULL#''), ''|'',  COALESCE(TRIM(COM_PRODUCTION_CD), ''#NULL#'')))),
	MD_HASHDIFF=
	SHA1(CONCAT(
	   COALESCE(COM_PRODUCTION_MNEM, ''#NULL#''), ''|''
	,  COALESCE(COM_PRODUCTION_DESC, ''#NULL#''), ''|''
	,  COALESCE(COM_PRODUCTION_LONG_DESC, ''#NULL#''), ''|''
	,  COALESCE(COM_PRODUCTION_MNEM_ENG, ''#NULL#''), ''|''
	,  COALESCE(COM_PRODUCTION_MNEM_FRE, ''#NULL#''), ''|''
	,  COALESCE(COM_PRODUCTION_DESC_ENG, ''#NULL#''), ''|''
	,  COALESCE(COM_PRODUCTION_DESC_FRE, ''#NULL#''), ''|''
	,  COALESCE(COM_PRODUCTION_LONG_DESC_ENG, ''#NULL#''), ''|''
	,  COALESCE(COM_PRODUCTION_LONG_DESC_FRE, ''#NULL#''), ''|''
	,  COALESCE(CRC_TRND_RPT_CAT, ''#NULL#''), ''|''
	,  COALESCE(TO_VARCHAR(COMMISSION_LEVEL), ''#NULL#''), ''|''
	,  COALESCE(TO_VARCHAR(CAC_TYPE_CD), ''#NULL#''), ''|''
	,  COALESCE(TO_VARCHAR(ACC_REPORT_IND), ''#NULL#'')
	)),	
	MD_CREATION_DT=systimestamp()
	Where 1=1
		';
EXECUTE IMMEDIATE :INS_PRE_DEL;
EXECUTE IMMEDIATE :INS_PRE_COPY;
EXECUTE IMMEDIATE :INS_UPDATE;
END
$$;

create procedure IAS_UNIVERIS.SP_CONV_LOADSTG_PSA_IAS_UNIVERIS_TO_STG_REGISTERED_REPRESENTATIVE(ENV VARCHAR, IO_PATH VARCHAR)
    returns VARCHAR
    language SQL
    strict
as
$$
DECLARE
INS_PRE_DEL STRING;
INS_PRE_COPY STRING;
INS_UPDATE STRING;
BEGIN
INS_PRE_DEL := 'DELETE FROM DB_IAW_'||ENV||'_STG.IAS_UNIVERIS.REGISTERED_REPRESENTATIVE  WHERE 1=1';
INS_PRE_COPY := '
COPY INTO DB_IAW_'||ENV||'_STG.IAS_UNIVERIS.REGISTERED_REPRESENTATIVE
(
	MD_START_DT,
	MD_SOURCE,
	COMPANY_CD,
	COMPANY_NAME,
	REGULATORY_ORG_CD,
	REGULATORY_ORG_NAME,
	DLR_SYSID,
	DLR_CD,
	DLR_NAME_ENG,
	RGN_SYSID,
	RGN_CD,
	RGN_NAME,
	RGN_MGR,
	BRN_SYSID,
	BRN_CD,
	BRN_NAME,
	REP_TEAM_CD,
	REP_TEAM_NAME,
	REP_SYSID,
	NK_REP_CD,
	NK_REP_CORP_NAME,
	REP_LNAME,
	REP_FNAME,
	REP_ST_NAME,
	REP_GRP_RSP,
    MD_EXTRACT_DT,
	MD_SRC_SYSTEM
)
FROM
	(
	SELECT
		TO_DATE(split_part(split_part(metadata$filename, ''__'', 2), ''.'', 0)), metadata$filename,t.$1, t.$2, t.$3, t.$4, t.$5, t.$6, t.$7, t.$8, t.$9, t.$10, t.$11, t.$12, t.$13, t.$14,
		t.$15, t.$16, t.$17, t.$18, t.$19, t.$20, t.$21, t.$22, t.$23, t.$24, t.$25
	FROM
		@DATALAKE.'||IO_PATH||' t
	) pattern = ''.*REGISTERED_REPRESENTATIVE__.*csv'' file_format =(format_name = DB_IAW_'||ENV||'_STG.IAS_UNIVERIS.PIPE_UTF16)
		';
	
INS_UPDATE:='UPDATE DB_IAW_'||ENV||'_STG.IAS_UNIVERIS.REGISTERED_REPRESENTATIVE
SET
    HK_HUB=SHA1(UPPER(CONCAT(''IAS'', ''|'' ,COALESCE(TRIM(TO_VARCHAR(NK_REP_CD)), ''#NULL#'') ))),
	MD_HASHDIFF=SHA1(CONCAT(
	COALESCE(COMPANY_CD, ''#NULL#''), ''|'' ,
	COALESCE(COMPANY_NAME, ''#NULL#''), ''|'' ,
	COALESCE(REGULATORY_ORG_CD, ''#NULL#''), ''|'' ,
	COALESCE(REGULATORY_ORG_NAME, ''#NULL#''), ''|'' ,
	COALESCE(TO_VARCHAR(DLR_SYSID),''#NULL#''), ''|'',
	COALESCE(DLR_CD, ''#NULL#''), ''|'' ,
	COALESCE(DLR_NAME_ENG, ''#NULL#''), ''|'' ,
	COALESCE(TO_VARCHAR(RGN_SYSID),''#NULL#''), ''|'',
	COALESCE(RGN_CD, ''#NULL#''), ''|'' ,
	COALESCE(RGN_NAME, ''#NULL#''), ''|'' ,
	COALESCE(RGN_MGR, ''#NULL#''), ''|'' ,
	COALESCE(TO_VARCHAR(BRN_SYSID),''#NULL#''), ''|'',
	COALESCE(BRN_CD, ''#NULL#''), ''|'' ,
	COALESCE(BRN_NAME, ''#NULL#''), ''|'' ,
	COALESCE(REP_TEAM_CD, ''#NULL#''), ''|'' ,
	COALESCE(REP_TEAM_NAME, ''#NULL#''), ''|'' ,
	COALESCE(TO_VARCHAR(REP_SYSID),''#NULL#''), ''|'',
	COALESCE(NK_REP_CORP_NAME, ''#NULL#''), ''|'' ,
	COALESCE(REP_LNAME, ''#NULL#''), ''|'' ,
	COALESCE(REP_FNAME, ''#NULL#''), ''|'' ,
	COALESCE(REP_ST_NAME, ''#NULL#''), ''|'' ,
	COALESCE(REP_GRP_RSP, ''#NULL#''))),	
	MD_CREATION_DT=systimestamp()
	Where 1=1
		';
EXECUTE IMMEDIATE :INS_PRE_DEL;
EXECUTE IMMEDIATE :INS_PRE_COPY;
EXECUTE IMMEDIATE :INS_UPDATE;
END
$$;

create procedure IAS_UNIVERIS.SP_CONV_LOADSTG_PSA_IAS_UNIVERIS_TO_STG_REVENUE_PAYABLE(ENV VARCHAR, IO_PATH VARCHAR)
    returns VARCHAR
    language SQL
    strict
as
$$
DECLARE
INS_PRE_DEL STRING;
INS_PRE_COPY STRING;
INS_UPDATE STRING;
BEGIN
INS_PRE_DEL := 'DELETE FROM DB_IAW_'||ENV||'_STG.IAS_UNIVERIS.REVENUE_PAYABLE WHERE 1=1';
INS_PRE_COPY := '
COPY INTO DB_IAW_'||ENV||'_STG.IAS_UNIVERIS.REVENUE_PAYABLE
 (
MD_START_DT,
MD_SOURCE,
PAY_SYSID,
PYBL_STATUS,
EVENT_PROC_SYSID,
EVENT_RPT_SYSID,
BEN_SYSID,
REP_SYSID,
DEAL_SYSID,
COM_SYSID,
DIST_SYSID,
TRX_SYSID,
IVR_SYSID,
PLN_SYSID,
ACT_SYSID,
IVD_SYSID,
MGT_CD,
TRX_CD,
PROC_DT,
PAID_DT,
PAY_PERIOD,
TAX_YEAR,
TRADE_DT,
GRSS_AMT,
COM_DLR,
COM_PYBL,
COM_BEN_PYBL,
TICKET_CHG,
PAY_CD,
COM_PRODUCTION_CD,
AMOUNT,
USR_SYSID,
OTX_SYSID,
DISPLAY_FLAG,
DLR_MINIMUM,
ORIG_PAY_PER,
IVT_TYPE,
COM_PAY_SYSID,
INTERNAL_COMM,
WRHS_IND,
MD_EXTRACT_DT,
MD_SRC_SYSTEM
)
FROM
	(
	SELECT
		TO_DATE(split_part(split_part(metadata$filename, ''__'', 2), ''.'', 0)), metadata$filename,t.$1,t.$2,t.$3,t.$4,t.$5,t.$6,t.$7,t.$8,t.$9,t.$10,
		t.$11,t.$12,t.$13,t.$14,t.$15,t.$16,t.$17,t.$18,t.$19,t.$20,t.$21,t.$22,t.$23,t.$24,
		t.$25,t.$26,t.$27,t.$28,t.$29,t.$30,t.$31,t.$32,t.$33,t.$34,
		t.$35,t.$36,t.$37,t.$38,t.$39,t.$40
	FROM
		@DATALAKE.'||IO_PATH||' t
	) pattern =''.*REVENUE_PAYABLE__.*csv'' file_format=(format_name=DB_IAW_'||ENV||'_STG.IAS_UNIVERIS.PIPE_UTF16)
		';
	
INS_UPDATE:='UPDATE DB_IAW_'||ENV||'_STG.IAS_UNIVERIS.REVENUE_PAYABLE
SET
HK_LINK= SHA1(UPPER(CONCAT(COALESCE(TRIM(MD_SRC_SYSTEM), ''#NULL#''), ''|'' ,
COALESCE(TO_VARCHAR(PAY_SYSID), ''#NULL#''), ''|'' ,
COALESCE(TO_VARCHAR(PAID_DT), ''#NULL#''), ''|'' ,
COALESCE(TO_VARCHAR(PLN_SYSID), ''#NULL#''), ''|'' ,
COALESCE(TO_VARCHAR(IVR_SYSID), ''#NULL#''), ''|'' ,
COALESCE(TO_VARCHAR(IVD_SYSID), ''#NULL#''), ''|'' ,
COALESCE(TO_VARCHAR(PROC_DT), ''#NULL#'')))),
HK_HUB_CONTRACT=DECODE(TRUE, PLN_SYSID IS NULL AND IVR_SYSID IS NULL,''0'',SHA1(UPPER(CONCAT(COALESCE(TRIM(MD_SRC_SYSTEM), ''#NULL#''), ''|'' ,''#NULL#'',''|'', COALESCE(TO_VARCHAR(PLN_SYSID), ''#NULL#'')	,''|'', COALESCE(TO_VARCHAR(IVR_SYSID), ''#NULL#''))))),
HK_HUB_INVESTMENT_PRODUCT_TYPE = DECODE(TRUE, IVD_SYSID IS NULL ,''0'',SHA1(UPPER(CONCAT(COALESCE(TRIM(MD_SRC_SYSTEM), ''#NULL#''), ''|'' , COALESCE(TO_VARCHAR(TO_VARCHAR(IVD_SYSID)), ''#NULL#''))))),
MD_HASHDIFF = SHA1(CONCAT(
	COALESCE(PYBL_STATUS, ''#NULL#''), ''|'' ,
	COALESCE(TO_VARCHAR(EVENT_PROC_SYSID),''#NULL#''), ''|'',
	COALESCE(TO_VARCHAR(EVENT_RPT_SYSID),''#NULL#''), ''|'',
	COALESCE(TO_VARCHAR(BEN_SYSID),''#NULL#''), ''|'',
	COALESCE(TO_VARCHAR(REP_SYSID),''#NULL#''), ''|'',
	COALESCE(TO_VARCHAR(DEAL_SYSID),''#NULL#''), ''|'',
	COALESCE(TO_VARCHAR(COM_SYSID),''#NULL#''), ''|'',
	COALESCE(TO_VARCHAR(DIST_SYSID),''#NULL#''), ''|'',
	COALESCE(TO_VARCHAR(TRX_SYSID),''#NULL#''), ''|'',
	COALESCE(TO_VARCHAR(ACT_SYSID),''#NULL#''), ''|'',
	COALESCE(MGT_CD, ''#NULL#''), ''|'' ,
	COALESCE(TO_VARCHAR(TRX_CD),''#NULL#''), ''|'',
	COALESCE(PAY_PERIOD, ''#NULL#''), ''|'' ,
	COALESCE(TAX_YEAR, ''#NULL#''), ''|'' ,
	COALESCE(TO_VARCHAR(TRADE_DT),''#NULL#''), ''|'',
	COALESCE(TO_VARCHAR(GRSS_AMT),''#NULL#''), ''|'',
	COALESCE(TO_VARCHAR(COM_DLR),''#NULL#''), ''|'',
	COALESCE(TO_VARCHAR(COM_PYBL),''#NULL#''), ''|'',
	COALESCE(TO_VARCHAR(COM_BEN_PYBL),''#NULL#''), ''|'',
	COALESCE(TO_VARCHAR(TICKET_CHG),''#NULL#''), ''|'',
	COALESCE(PAY_CD, ''#NULL#''), ''|'' ,
	COALESCE(COM_PRODUCTION_CD, ''#NULL#''), ''|'' ,
	COALESCE(TO_VARCHAR(AMOUNT),''#NULL#''), ''|'',
	COALESCE(TO_VARCHAR(USR_SYSID),''#NULL#''), ''|'',
	COALESCE(TO_VARCHAR(OTX_SYSID),''#NULL#''), ''|'',
	COALESCE(TO_VARCHAR(DISPLAY_FLAG),''#NULL#''), ''|'',
	COALESCE(DLR_MINIMUM, ''#NULL#''), ''|'' ,
	COALESCE(ORIG_PAY_PER, ''#NULL#''), ''|'' ,
	COALESCE(IVT_TYPE, ''#NULL#''), ''|'' ,
	COALESCE(TO_VARCHAR(COM_PAY_SYSID),''#NULL#''), ''|'',
	COALESCE(TO_VARCHAR(INTERNAL_COMM),''#NULL#''), ''|'',
	COALESCE(TO_VARCHAR(WRHS_IND),''#NULL#''))),	
	MD_CREATION_DT=systimestamp()
	Where 1=1
		';
EXECUTE IMMEDIATE :INS_PRE_DEL;
EXECUTE IMMEDIATE :INS_PRE_COPY;
EXECUTE IMMEDIATE :INS_UPDATE;
END
$$;

create procedure IAPW_PORTAL_API.SP_CONV_LOADSTG_PSA_IAWP_PORTAL_API_TO_ASSETS_SUMMARY_BYACCOUNTTYPE(ENV VARCHAR, IO_PATH VARCHAR)
    returns VARCHAR
    language SQL
    strict
as
$$
DECLARE
INS_PRE_QUERY STRING;
INS_COPY_QUERY STRING;
BEGIN
INS_PRE_QUERY := 'DELETE FROM DB_IAW_'||ENV||'_STG.IAPW_PORTAL_API.ASSETS_SUMMARY_BYACCOUNTTYPE WHERE 1=1';
INS_COPY_QUERY := '
COPY INTO DB_IAW_'||ENV||'_STG.IAPW_PORTAL_API.ASSETS_SUMMARY_BYACCOUNTTYPE
(
    MD_START_DT,
    MD_SOURCE,
	MD_SRC_SYSTEM,
	MD_EXTRACT_DT,
    CONTENT
    )
 FROM
	(
	SELECT
		TO_DATE(split_part(split_part(metadata$filename, ''__'', 2), ''.'', 0)), metadata$filename,''IAPW_PORTAL_API'',TO_DATE(split_part(split_part(metadata$filename, ''__'', 2), ''.'', 0)),t.$1
	FROM
		@DATALAKE.'||IO_PATH||' t
	) pattern =''.*assetsSummaryByAccountType__.*json'' file_format=(format_name=DB_IAW_'||ENV||'_STG.IAPW_PORTAL_API.JSON_FORMAT)
              ';
EXECUTE IMMEDIATE :INS_PRE_QUERY;
EXECUTE IMMEDIATE :INS_COPY_QUERY;
END
$$;

create procedure IAPW_PORTAL_API.SP_CONV_LOADSTG_PSA_IAWP_PORTAL_API_TO_ASSETS_SUMMARY_BYACCOUNTTYPE_RVP(ENV VARCHAR, IO_PATH VARCHAR)
    returns VARCHAR
    language SQL
    strict
as
$$
DECLARE
INS_PRE_QUERY STRING;
INS_COPY_QUERY STRING;
BEGIN
INS_PRE_QUERY := 'DELETE FROM DB_IAW_'||ENV||'_STG.IAPW_PORTAL_API.ASSETS_SUMMARY_BYACCOUNTTYPE_RVP WHERE 1=1';
INS_COPY_QUERY := '
COPY INTO DB_IAW_'||ENV||'_STG.IAPW_PORTAL_API.ASSETS_SUMMARY_BYACCOUNTTYPE_RVP
(
    MD_START_DT,
    MD_SOURCE,
	MD_SRC_SYSTEM,
	MD_EXTRACT_DT,
	RVPID,
    CONTENT
    )
 FROM
	(
	SELECT
		TO_DATE(split_part(split_part(metadata$filename, ''__'', 2), ''.'', 0)), metadata$filename,''IAPW_PORTAL_API'',TO_DATE(split_part(split_part(metadata$filename, ''__'', 2), ''.'', 0)),split_part(split_part(metadata$filename,''#'',2),''__'',0),t.$1
	FROM
		@DATALAKE.'||IO_PATH||' t
	) pattern =''.*assetsSummaryByAccountType_RVP#.*__.*json'' file_format=(format_name=DB_IAW_'||ENV||'_STG.IAPW_PORTAL_API.JSON_FORMAT);
              ';
EXECUTE IMMEDIATE :INS_PRE_QUERY;
EXECUTE IMMEDIATE :INS_COPY_QUERY;
END
$$;

create procedure IAPW_PORTAL_API.SP_CONV_LOADSTG_PSA_IAWP_PORTAL_API_TO_ASSETS_SUMMARY_BYPROVINCE(ENV VARCHAR, IO_PATH VARCHAR)
    returns VARCHAR
    language SQL
    strict
as
$$
DECLARE
INS_PRE_QUERY STRING;
INS_COPY_QUERY STRING;
BEGIN
INS_PRE_QUERY := 'DELETE FROM DB_IAW_'||ENV||'_STG.IAPW_PORTAL_API.ASSETS_SUMMARY_BYPROVINCE WHERE 1=1';
INS_COPY_QUERY := '
COPY INTO DB_IAW_'||ENV||'_STG.IAPW_PORTAL_API.ASSETS_SUMMARY_BYPROVINCE
(
    MD_START_DT,
    MD_SOURCE,
	MD_SRC_SYSTEM,
	MD_EXTRACT_DT,
    CONTENT
    )
 FROM
	(
	SELECT
		TO_DATE(split_part(split_part(metadata$filename, ''__'', 2), ''.'', 0)), metadata$filename,''IAPW_PORTAL_API'',TO_DATE(split_part(split_part(metadata$filename, ''__'', 2), ''.'', 0)),t.$1
	FROM
		@DATALAKE.'||IO_PATH||' t
	) pattern =''.*assetsSummaryByProvince__.*json'' file_format=(format_name=DB_IAW_'||ENV||'_STG.IAPW_PORTAL_API.JSON_FORMAT);
              ';
EXECUTE IMMEDIATE :INS_PRE_QUERY;
EXECUTE IMMEDIATE :INS_COPY_QUERY;
END
$$;

create procedure IAPW_PORTAL_API.SP_CONV_LOADSTG_PSA_IAWP_PORTAL_API_TO_ASSETS_SUMMARY_BYPROVINCE_RVP(ENV VARCHAR, IO_PATH VARCHAR)
    returns VARCHAR
    language SQL
    strict
as
$$
DECLARE
INS_PRE_QUERY STRING;
INS_COPY_QUERY STRING;
BEGIN
INS_PRE_QUERY := 'DELETE FROM DB_IAW_'||ENV||'_STG.IAPW_PORTAL_API.ASSETS_SUMMARY_BYPROVINCE_RVP WHERE 1=1';
INS_COPY_QUERY := '
COPY INTO DB_IAW_'||ENV||'_STG.IAPW_PORTAL_API.ASSETS_SUMMARY_BYPROVINCE_RVP
(
     MD_START_DT,
    MD_SOURCE,
	MD_SRC_SYSTEM,
	MD_EXTRACT_DT,
	RVPID,
    CONTENT
    )
 FROM
	(
	SELECT
		TO_DATE(split_part(split_part(metadata$filename, ''__'', 2), ''.'', 0)), metadata$filename,''IAPW_PORTAL_API'',TO_DATE(split_part(split_part(metadata$filename, ''__'', 2), ''.'', 0)),split_part(split_part(metadata$filename,''#'',2),''__'',0),t.$1
	FROM
		@DATALAKE.'||IO_PATH||' t
	) pattern =''.*assetsSummaryByProvince_RVP#.*__.*json'' file_format=(format_name=DB_IAW_'||ENV||'_STG.IAPW_PORTAL_API.JSON_FORMAT);
              ';
EXECUTE IMMEDIATE :INS_PRE_QUERY;
EXECUTE IMMEDIATE :INS_COPY_QUERY;
END
$$;

create procedure INVESTIA_UNIVERIS.SP_CONV_LOADSTG_PSA_INVESTIA_TO_STG_INVESTMENT_PRODUCT_TYPE(ENV VARCHAR, IO_PATH VARCHAR)
    returns VARCHAR
    language SQL
    strict
as
$$
DECLARE
INS_PRE_QUERY STRING;
INS_COPY_QUERY STRING;
UPD_QUERY STRING;
BEGIN
INS_PRE_QUERY := 'DELETE FROM DB_IAW_'||ENV||'_STG.INVESTIA_UNIVERIS.MARKETPRODUCTS WHERE 1=1';
INS_COPY_QUERY := '
COPY INTO 
DB_IAW_'||ENV||'_STG.INVESTIA_UNIVERIS.MARKETPRODUCTS
(
MD_START_DT,
MD_SOURCE,
IVD_SYSID ,
CURRENCY_CD ,
SYMBOL ,
IVD_ST_DESC_ENG ,
IVD_ST_DESC_FRE ,
IVD_LOAD_DESC_ENG ,
IVD_LOAD_DESC_FRE ,
IVT_NAME_ENG ,
IVT_NAME_FRE ,
IVT_CD_DESC_ENG ,
IVT_CD_DESC_FRE ,
IVT_ST_DESC_ENG ,
IVT_ST_DESC_FRE ,
ASSET_CLASS_DESC_ENG ,
ASSET_CLASS_DESC_FRE ,
ASSET_CTGY_DESC_ENG ,
ASSET_CTGY_DESC_FRE ,
IVT_TYPE_DESC_ENG ,
IVT_TYPE_DESC_FRE ,
CTGY_DESC_ENG ,
CTGY_DESC_FRE ,
GROUP_DESC_ENG ,
GROUP_DESC_FRE ,
MGT_CD ,
MGT_NAME_ENG ,
MGT_NAME_FRE ,
MD_EXTRACT_DT,
MD_SRC_SYSTEM
)
FROM
	(
	SELECT
		TO_DATE(split_part(split_part(metadata$filename, ''__'', 2), ''.'', 0)), metadata$filename,t.$1, t.$2, t.$3, t.$4, t.$5, t.$6, t.$7, t.$8, t.$9, t.$10,t.$11, t.$12, t.$13, t.$14, t.$15, t.$16, t.$17, t.$18, t.$19, t.$20,
		t.$21, t.$22, t.$23, t.$24, t.$25, t.$26, t.$27, t.$28
	FROM
		@DATALAKE.'||io_PATH||' T
	) pattern = ''.*MARKETPRODUCTS__.*csv'' file_format=(format_name=DB_IAW_'||ENV||'_STG.INVESTIA_UNIVERIS.PIPE_UTF16);
	';                                            
	UPD_QUERY := '
	UPDATE DB_IAW_'||ENV||'_STG.INVESTIA_UNIVERIS.MARKETPRODUCTS
	SET
HK_HUB=
SHA1(UPPER(CONCAT(COALESCE(TRIM(MD_SRC_SYSTEM), ''#NULL#''), ''|'' , COALESCE(TO_VARCHAR(TRIM(IVD_SYSID)), ''#NULL#'')))),
MD_HASHDIFF=
SHA1(
CONCAT(
COALESCE(CURRENCY_CD, ''#NULL#''), ''|'',
COALESCE(SYMBOL, ''#NULL#''), ''|'' ,
COALESCE(IVD_ST_DESC_ENG, ''#NULL#''), ''|'' ,
COALESCE(IVD_ST_DESC_FRE, ''#NULL#''), ''|'' ,
COALESCE(IVD_LOAD_DESC_ENG, ''#NULL#''), ''|'' ,
COALESCE(IVD_LOAD_DESC_FRE, ''#NULL#''), ''|'' ,
COALESCE(IVT_NAME_ENG, ''#NULL#''), ''|'' ,
COALESCE(IVT_NAME_FRE, ''#NULL#''), ''|'' ,
COALESCE(IVT_CD_DESC_ENG, ''#NULL#''), ''|'' ,
COALESCE(IVT_CD_DESC_FRE, ''#NULL#''), ''|'' ,
COALESCE(IVT_ST_DESC_ENG, ''#NULL#''), ''|'' ,
COALESCE(IVT_ST_DESC_FRE, ''#NULL#''), ''|'' ,
COALESCE(ASSET_CLASS_DESC_ENG, ''#NULL#''), ''|'' ,
COALESCE(ASSET_CLASS_DESC_FRE, ''#NULL#''), ''|'' ,
COALESCE(ASSET_CTGY_DESC_ENG, ''#NULL#''), ''|'' ,
COALESCE(ASSET_CTGY_DESC_FRE, ''#NULL#''), ''|'' ,
COALESCE(IVT_TYPE_DESC_ENG, ''#NULL#''), ''|'' ,
COALESCE(IVT_TYPE_DESC_FRE, ''#NULL#''), ''|'' ,
COALESCE(CTGY_DESC_ENG, ''#NULL#''), ''|'' ,
COALESCE(CTGY_DESC_FRE, ''#NULL#''), ''|'' ,
COALESCE(GROUP_DESC_ENG, ''#NULL#''), ''|'' ,
COALESCE(GROUP_DESC_FRE, ''#NULL#''), ''|'' ,
COALESCE(MGT_CD,''#NULL#''), ''|'',
COALESCE(MGT_NAME_ENG,''#NULL#''), ''|'',
COALESCE(MGT_NAME_FRE,''#NULL#'')
)),	
MD_CREATION_DT= SYSTIMESTAMP()
Where 1=1;
';
EXECUTE IMMEDIATE :INS_PRE_QUERY;
EXECUTE IMMEDIATE :INS_COPY_QUERY;
EXECUTE IMMEDIATE :UPD_QUERY;
END
$$;

create procedure INVESTIA_UNIVERIS.SP_CONV_LOADSTG_PSA_INVESTIA_UNIVERIS_TO_STG(ENV VARCHAR, IO_PATH VARCHAR)
    returns VARCHAR
    language SQL
    strict
as
$$
DECLARE
DEL_QUERY STRING;
INS_QUERY STRING;
UPD_QUERY STRING;
BEGIN
DEL_QUERY := 'DELETE FROM DB_IAW_'||ENV||'_STG.INVESTIA_UNIVERIS.ACCOUNT_HOLDER_CLONE_rf WHERE 1=1;';
INS_QUERY := '
COPY INTO DB_IAW_'||ENV||'_STG.INVESTIA_UNIVERIS.ACCOUNT_HOLDER_CLONE_rf
(
	MD_START_DT,
	MD_SOURCE,
	IVR_SYSID,
	REP_SYSID,
	RECIPIENT_DESC_ENG,
	RECIPIENT_DESC_FRE,
	CORP_CD,
	IVR_ST_NAME_ENG,
	IVR_ST_NAME_FRE,
	IVR_REG_2,
	LANG_CD,
	IVR_RES_CD,
	IVR_SETUP_DT,
	IVR_STOP_DT,
	IVR_FRGN_CTNT,
	IVR_HOLD_MAIL,
	IVR_INC_ADR,
	IVR_STMT_FREQ,
	IVR_STMT_TYPE,
	IVR_STMT_DT,
	IVR_OLD_DLR,
	SALARY_DESC,
	IVR_KYC_DT,
	IVR_PRIM_BDT,
	MD_EXTRACT_DT,
	MD_SRC_SYSTEM,
	CREATE_DT
)
FROM
	(
	SELECT
		TO_DATE(split_part(split_part(metadata$filename, ''__'', 2), ''.'', 0)), metadata$filename,t.$1, t.$2, t.$3, t.$4, t.$5, t.$6,t.$7, t.$8,t.$9, t.$10,
		t.$11, t.$12, t.$13, t.$14, t.$15, t.$16,t.$17, t.$18,t.$19, t.$20, t.$21,t.$22, t.$23,t.$24, t.$25
	FROM
		@DATALAKE.'||IO_PATH||' T
	) pattern =''.*CLIENTS_.*csv''file_format=(format_name=INVESTIA.PIPE_UTF16);
	';

UPD_QUERY := 'UPDATE DB_IAW_'||ENV||'_STG.INVESTIA_UNIVERIS.ACCOUNT_HOLDER_CLONE_rf
SET
    HK_HUB=SHA1(UPPER(CONCAT(COALESCE(TRIM(MD_SRC_SYSTEM), ''#NULL#''), ''|'' , COALESCE(TRIM(IVR_SYSID), ''#NULL#'')))),
	MD_HASHDIFF=SHA1(CONCAT(
	COALESCE(TO_VARCHAR(REP_SYSID),''#NULL#''), ''|'',
	COALESCE(RECIPIENT_DESC_ENG, ''#NULL#''), ''|'' , 	
	COALESCE(RECIPIENT_DESC_FRE, ''#NULL#''), ''|'' ,
	COALESCE(CORP_CD, ''#NULL#''), ''|'' ,
	COALESCE(IVR_ST_NAME_ENG, ''#NULL#''), ''|'' ,
	COALESCE(IVR_ST_NAME_FRE, ''#NULL#''), ''|'' ,
	COALESCE(IVR_REG_2, ''#NULL#''), ''|'' ,
	COALESCE(LANG_CD, ''#NULL#''), ''|'' ,
	COALESCE(IVR_RES_CD, ''#NULL#''), ''|'' ,
	COALESCE(TO_VARCHAR(IVR_SETUP_DT),''#NULL#''), ''|'',
	COALESCE(TO_VARCHAR(IVR_STOP_DT),''#NULL#''), ''|'',
	COALESCE(TO_VARCHAR(IVR_FRGN_CTNT),''#NULL#''), ''|'',
	COALESCE(TO_VARCHAR(IVR_HOLD_MAIL),''#NULL#''), ''|'',
	COALESCE(TO_VARCHAR(IVR_INC_ADR),''#NULL#''), ''|'',
	COALESCE(IVR_STMT_FREQ, ''#NULL#''), ''|'' ,
	COALESCE(IVR_STMT_TYPE, ''#NULL#''), ''|'' ,
	COALESCE(TO_VARCHAR(IVR_STMT_DT),''#NULL#''), ''|'',
	COALESCE(IVR_OLD_DLR, ''#NULL#''), ''|'' ,
	COALESCE(SALARY_DESC, ''#NULL#''), ''|'' ,
	COALESCE(TO_VARCHAR(IVR_KYC_DT),''#NULL#''), ''|'',
	COALESCE(TO_VARCHAR(IVR_PRIM_BDT),''#NULL#''), ''|'',
	COALESCE(TO_VARCHAR(CREATE_DT),''#NULL#''))),	
	MD_CREATION_DT=SYSTIMESTAMP()
Where 1=1;';


EXECUTE IMMEDIATE :DEL_QUERY;
EXECUTE IMMEDIATE :INS_QUERY;
EXECUTE IMMEDIATE :UPD_QUERY;
END
$$;

create procedure INVESTIA_UNIVERIS.SP_CONV_LOADSTG_PSA_INVESTIA_UNIVERIS_TO_STG_CLIENTS(ENV VARCHAR, IO_PATH VARCHAR)
    returns VARCHAR
    language SQL
    strict
as
$$
DECLARE
DEL_QUERY STRING;
INS_QUERY STRING;
UPD_QUERY STRING;
BEGIN
DEL_QUERY := 'DELETE FROM DB_IAW_'||ENV||'_STG.INVESTIA_UNIVERIS.ACCOUNT_HOLDER WHERE 1=1;';
INS_QUERY := '
COPY INTO DB_IAW_'||ENV||'_STG.INVESTIA_UNIVERIS.ACCOUNT_HOLDER
(
	MD_START_DT,
	MD_SOURCE,
	IVR_SYSID,
	REP_SYSID,
	RECIPIENT_DESC_ENG,
	RECIPIENT_DESC_FRE,
	CORP_CD,
	IVR_ST_NAME_ENG,
	IVR_ST_NAME_FRE,
	IVR_REG_2,
	LANG_CD,
	IVR_RES_CD,
	IVR_SETUP_DT,
	IVR_STOP_DT,
	IVR_FRGN_CTNT,
	IVR_HOLD_MAIL,
	IVR_INC_ADR,
	IVR_STMT_FREQ,
	IVR_STMT_TYPE,
	IVR_STMT_DT,
	IVR_OLD_DLR,
	SALARY_DESC,
	IVR_KYC_DT,
	IVR_PRIM_BDT,
	MD_EXTRACT_DT,
	MD_SRC_SYSTEM,
	CREATE_DT
)
FROM
	(
	SELECT
		TO_DATE(split_part(split_part(metadata$filename, ''__'', 2), ''.'', 0)), metadata$filename,t.$1, t.$2, t.$3, t.$4, t.$5, t.$6,t.$7, t.$8,t.$9, t.$10,
		t.$11, t.$12, t.$13, t.$14, t.$15, t.$16,t.$17, t.$18,t.$19, t.$20, t.$21,t.$22, t.$23,t.$24, t.$25
	FROM
		@DATALAKE.'||IO_PATH||' T
	) pattern =''.*CLIENTS_.*csv''file_format=(format_name=INVESTIA.PIPE_UTF16);
	';

UPD_QUERY := 'UPDATE DB_IAW_'||ENV||'_STG.INVESTIA_UNIVERIS.ACCOUNT_HOLDER
SET
    HK_HUB=SHA1(UPPER(CONCAT(COALESCE(TRIM(MD_SRC_SYSTEM), ''#NULL#''), ''|'' , COALESCE(TRIM(IVR_SYSID), ''#NULL#'')))),
	MD_HASHDIFF=SHA1(CONCAT(
	COALESCE(TO_VARCHAR(REP_SYSID),''#NULL#''), ''|'',
	COALESCE(RECIPIENT_DESC_ENG, ''#NULL#''), ''|'' , 	
	COALESCE(RECIPIENT_DESC_FRE, ''#NULL#''), ''|'' ,
	COALESCE(CORP_CD, ''#NULL#''), ''|'' ,
	COALESCE(IVR_ST_NAME_ENG, ''#NULL#''), ''|'' ,
	COALESCE(IVR_ST_NAME_FRE, ''#NULL#''), ''|'' ,
	COALESCE(IVR_REG_2, ''#NULL#''), ''|'' ,
	COALESCE(LANG_CD, ''#NULL#''), ''|'' ,
	COALESCE(IVR_RES_CD, ''#NULL#''), ''|'' ,
	COALESCE(TO_VARCHAR(IVR_SETUP_DT),''#NULL#''), ''|'',
	COALESCE(TO_VARCHAR(IVR_STOP_DT),''#NULL#''), ''|'',
	COALESCE(TO_VARCHAR(IVR_FRGN_CTNT),''#NULL#''), ''|'',
	COALESCE(TO_VARCHAR(IVR_HOLD_MAIL),''#NULL#''), ''|'',
	COALESCE(TO_VARCHAR(IVR_INC_ADR),''#NULL#''), ''|'',
	COALESCE(IVR_STMT_FREQ, ''#NULL#''), ''|'' ,
	COALESCE(IVR_STMT_TYPE, ''#NULL#''), ''|'' ,
	COALESCE(TO_VARCHAR(IVR_STMT_DT),''#NULL#''), ''|'',
	COALESCE(IVR_OLD_DLR, ''#NULL#''), ''|'' ,
	COALESCE(SALARY_DESC, ''#NULL#''), ''|'' ,
	COALESCE(TO_VARCHAR(IVR_KYC_DT),''#NULL#''), ''|'',
	COALESCE(TO_VARCHAR(IVR_PRIM_BDT),''#NULL#''), ''|'',
	COALESCE(TO_VARCHAR(CREATE_DT),''#NULL#''))),	
	MD_CREATION_DT=SYSTIMESTAMP()
Where 1=1;';


EXECUTE IMMEDIATE :DEL_QUERY;
EXECUTE IMMEDIATE :INS_QUERY;
EXECUTE IMMEDIATE :UPD_QUERY;
END
$$;

create procedure INVESTIA_UNIVERIS.SP_CONV_LOADSTG_PSA_INVESTIA_UNIVERIS_TO_STG_CLIENTS_RF_TEST(ENV VARCHAR, IO_PATH VARCHAR)
    returns VARCHAR
    language SQL
    strict
as
$$
DECLARE
DEL_QUERY STRING;
INS_QUERY STRING;
UPD_QUERY STRING;
BEGIN
DEL_QUERY := 'DELETE FROM DB_IAW_'||ENV||'_STG.INVESTIA_UNIVERIS.ACCOUNT_HOLDER_CLONE_rf WHERE 1=1;';
INS_QUERY := '
COPY INTO DB_IAW_'||ENV||'_STG.INVESTIA_UNIVERIS.ACCOUNT_HOLDER_CLONE_rf
(
	MD_START_DT,
	MD_SOURCE,
	IVR_SYSID,
	REP_SYSID,
	RECIPIENT_DESC_ENG,
	RECIPIENT_DESC_FRE,
	CORP_CD,
	IVR_ST_NAME_ENG,
	IVR_ST_NAME_FRE,
	IVR_REG_2,
	LANG_CD,
	IVR_RES_CD,
	IVR_SETUP_DT,
	IVR_STOP_DT,
	IVR_FRGN_CTNT,
	IVR_HOLD_MAIL,
	IVR_INC_ADR,
	IVR_STMT_FREQ,
	IVR_STMT_TYPE,
	IVR_STMT_DT,
	IVR_OLD_DLR,
	SALARY_DESC,
	IVR_KYC_DT,
	IVR_PRIM_BDT,
	MD_EXTRACT_DT,
	MD_SRC_SYSTEM,
	CREATE_DT
)
FROM
	(
	SELECT
		TO_DATE(split_part(split_part(metadata$filename, ''__'', 2), ''.'', 0)), metadata$filename,t.$1, t.$2, t.$3, t.$4, t.$5, t.$6,t.$7, t.$8,t.$9, t.$10,
		t.$11, t.$12, t.$13, t.$14, t.$15, t.$16,t.$17, t.$18,t.$19, t.$20, t.$21,t.$22, t.$23,t.$24, t.$25
	FROM
		@DATALAKE.'||IO_PATH||' T
	) pattern =''.*CLIENTS_.*csv''file_format=(format_name=INVESTIA.PIPE_UTF16);
	';

UPD_QUERY := 'UPDATE DB_IAW_'||ENV||'_STG.INVESTIA_UNIVERIS.ACCOUNT_HOLDER_CLONE_rf
SET
    HK_HUB=SHA1(UPPER(CONCAT(COALESCE(TRIM(MD_SRC_SYSTEM), ''#NULL#''), ''|'' , COALESCE(TRIM(IVR_SYSID), ''#NULL#'')))),
	MD_HASHDIFF=SHA1(CONCAT(
	COALESCE(TO_VARCHAR(REP_SYSID),''#NULL#''), ''|'',
	COALESCE(RECIPIENT_DESC_ENG, ''#NULL#''), ''|'' , 	
	COALESCE(RECIPIENT_DESC_FRE, ''#NULL#''), ''|'' ,
	COALESCE(CORP_CD, ''#NULL#''), ''|'' ,
	COALESCE(IVR_ST_NAME_ENG, ''#NULL#''), ''|'' ,
	COALESCE(IVR_ST_NAME_FRE, ''#NULL#''), ''|'' ,
	COALESCE(IVR_REG_2, ''#NULL#''), ''|'' ,
	COALESCE(LANG_CD, ''#NULL#''), ''|'' ,
	COALESCE(IVR_RES_CD, ''#NULL#''), ''|'' ,
	COALESCE(TO_VARCHAR(IVR_SETUP_DT),''#NULL#''), ''|'',
	COALESCE(TO_VARCHAR(IVR_STOP_DT),''#NULL#''), ''|'',
	COALESCE(TO_VARCHAR(IVR_FRGN_CTNT),''#NULL#''), ''|'',
	COALESCE(TO_VARCHAR(IVR_HOLD_MAIL),''#NULL#''), ''|'',
	COALESCE(TO_VARCHAR(IVR_INC_ADR),''#NULL#''), ''|'',
	COALESCE(IVR_STMT_FREQ, ''#NULL#''), ''|'' ,
	COALESCE(IVR_STMT_TYPE, ''#NULL#''), ''|'' ,
	COALESCE(TO_VARCHAR(IVR_STMT_DT),''#NULL#''), ''|'',
	COALESCE(IVR_OLD_DLR, ''#NULL#''), ''|'' ,
	COALESCE(SALARY_DESC, ''#NULL#''), ''|'' ,
	COALESCE(TO_VARCHAR(IVR_KYC_DT),''#NULL#''), ''|'',
	COALESCE(TO_VARCHAR(IVR_PRIM_BDT),''#NULL#''), ''|'',
	COALESCE(TO_VARCHAR(CREATE_DT),''#NULL#''))),	
	MD_CREATION_DT=SYSTIMESTAMP()
Where 1=1;';


EXECUTE IMMEDIATE :DEL_QUERY;
EXECUTE IMMEDIATE :INS_QUERY;
EXECUTE IMMEDIATE :UPD_QUERY;
END
$$;

create procedure INVESTIA_UNIVERIS.SP_CONV_LOADSTG_PSA_INVESTIA_UNIVERIS_TO_STG_CONTRACT(ENV VARCHAR, IO_PATH VARCHAR)
    returns VARCHAR
    language SQL
    strict
as
$$
DECLARE
INS_PRE_QUERY STRING;
INS_COPY_QUERY STRING;
UPD_QUERY STRING;

BEGIN
INS_PRE_QUERY := 'DELETE FROM DB_IAW_'||ENV||'_STG.INVESTIA_UNIVERIS.CONTRACT WHERE 1=1;';
INS_COPY_QUERY := '
COPY INTO
	DB_IAW_'||ENV||'_STG.INVESTIA_UNIVERIS.CONTRACT
(
MD_START_DT,
MD_SOURCE,
PLN_SYSID,
IVR_SYSID,
PLN_CD,
PLN_STATUS,
PLN_ADM_CD,
SETUP_DT,
CLOSE_DT,
PEN_JUR_CD,
FEE_EXMP_IND,
ADMINISTRATOR_TYPE,
MD_EXTRACT_DT,
MD_SRC_SYSTEM,
REP_SYSID,
REP_CD
)
FROM
	(
	SELECT
		TO_DATE(split_part(split_part(metadata$filename, ''__'', 2), ''.'', 0)), metadata$filename,t.$1, t.$2, t.$3, t.$4, t.$5, t.$6, t.$7, t.$8, t.$9, t.$10, t.$11, t.$12, t.$13, t.$14
	FROM
		@DATALAKE.'||io_PATH||' T
	) pattern = ''.*ACCOUNTS_.*csv'' file_format =(format_name = DB_IAW_'||ENV||'_STG.IAS_UNIVERIS.PIPE_UTF16);
              ';

UPD_QUERY := '
UPDATE DB_IAW_'||ENV||'_STG.INVESTIA_UNIVERIS.CONTRACT
SET
    HK_HUB = SHA1(UPPER(CONCAT(COALESCE(TRIM(MD_SRC_SYSTEM), ''#NULL#''), ''|'' ,''#NULL#'',''|'', COALESCE(TRIM(PLN_SYSID), ''#NULL#'')	,''|'', COALESCE(TRIM(IVR_SYSID), ''#NULL#'')))),
	MD_HASHDIFF =  SHA1(CONCAT(COALESCE(TRIM(PLN_CD), ''#NULL#''), ''|'',
	COALESCE(TRIM(PLN_STATUS),''#NULL#''),''|'',
	COALESCE(TRIM(PLN_ADM_CD),''#NULL#''), ''|'',
	COALESCE(TRIM(TO_VARCHAR(SETUP_DT)), ''#NULL#''), ''|'',
	COALESCE(TRIM(TO_VARCHAR(CLOSE_DT)), ''#NULL#''), ''|'',
	COALESCE(TRIM(PEN_JUR_CD),''#NULL#''), ''|'',
	COALESCE(TRIM(TO_VARCHAR(FEE_EXMP_IND)),''#NULL#''), ''|'',
	COALESCE(TRIM(ADMINISTRATOR_TYPE),''#NULL#''),''|'',
	COALESCE(TRIM(TO_VARCHAR(REP_SYSID)),''#NULL#''),''|'',
	COALESCE(TRIM(REP_CD),''#NULL#''))) ,	
    MD_CREATION_DT=systimestamp()
Where 1=1;
';
EXECUTE IMMEDIATE :INS_PRE_QUERY;
EXECUTE IMMEDIATE :INS_COPY_QUERY;
EXECUTE IMMEDIATE :UPD_QUERY;
END
$$;

create procedure INVESTIA_UNIVERIS.SP_CONV_LOADSTG_PSA_INVESTIA_UNIVERIS_TO_STG_FINANCIAL_TRANSACTIONS(ENV VARCHAR, IO_PATH VARCHAR)
    returns VARCHAR
    language SQL
    strict
as
$$
DECLARE
INS_PRE_QUERY STRING;
INS_COPY_QUERY STRING;
UPD_QUERY STRING;

BEGIN
INS_PRE_QUERY := 'DELETE FROM DB_IAW_'||ENV||'_STG.INVESTIA_UNIVERIS.FINANCIAL_TRANSACTIONS WHERE 1=1;';
INS_COPY_QUERY := '
COPY INTO DB_IAW_'||ENV||'_STG.INVESTIA_UNIVERIS.FINANCIAL_TRANSACTIONS
(
MD_START_DT,
MD_SOURCE,
TRX_SYSID, 
IVR_SYSID, 
REP_SYSID, 
PLN_SYSID, 
ACT_SYSID, 
IVD_SYSID, 
TRX_STATUS, 
TRX_ST_DESC_ENG, 
TRADE_DT, 
MGT_CD, 
MGT_NAME_ENG, 
DLR_SYSID, 
RGN_SYSID, 
BRN_SYSID, 
TRX_UNIT, 
TRX_PRICE, 
TRX_GROSS, 
TRX_NET, 
TRX_GROSS_CAD, 
SPR_FACTOR, 
CURRENCY_CD, 
DLR_CD, 
RGN_CD, 
BRN_CD, 
REP_CD, 
PLN_TYPE, 
SPR_CTGY, 
TRX_MNEM_ENG, 
REVERSAL_IND,
MD_EXTRACT_DT,
MD_SRC_SYSTEM
 
) 
FROM
	(
	SELECT
		TO_DATE(split_part(split_part(metadata$filename, ''__'', 2), ''.'', 0)), metadata$filename,t.$1, t.$2, t.$3, t.$4, t.$5, t.$6, t.$7, t.$8, t.$9, t.$10,t.$11, t.$12, t.$13, t.$14, t.$15, t.$16, t.$17, t.$18, t.$19, t.$20
		,t.$21, t.$22, t.$23, t.$24, t.$25, t.$26, t.$27, t.$28, t.$29, t.$30, t.$31
	FROM
		@DATALAKE.'||IO_PATH||' T
	) pattern = ''.*TRANSACTIONS__.*csv'' file_format =(format_name = DB_IAW_'||ENV||'_STG.INVESTIA_UNIVERIS.PIPE_UTF16);
        ';      
UPD_QUERY := 'UPDATE DB_IAW_'||ENV||'_STG.INVESTIA_UNIVERIS.FINANCIAL_TRANSACTIONS
SET 
HK_LINK =
SHA1(UPPER(CONCAT(COALESCE(TRIM(MD_SRC_SYSTEM), ''#NULL#'')
, ''|'' , COALESCE(TRIM(TRX_SYSID), ''#NULL#'')
, ''|'' , ''#NULL#''
, ''|'' , ''#NULL#''
, ''|'' , COALESCE(TRIM(IVD_SYSID), ''#NULL#'')
, ''|'' , COALESCE(TRIM(PLN_SYSID), ''#NULL#'')
, ''|'', COALESCE(TRIM(IVR_SYSID), ''#NULL#'')))),
HK_HUB_CONTRACT = DECODE(TRUE, PLN_SYSID IS NULL AND IVR_SYSID IS NULL ,''0'',SHA1(UPPER(CONCAT(COALESCE(TRIM(MD_SRC_SYSTEM), ''#NULL#''), ''|'' ,''#NULL#'',''|'',
COALESCE(TRIM(PLN_SYSID), ''#NULL#'')	,''|'', COALESCE(TRIM(IVR_SYSID), ''#NULL#''))))),
HK_HUB_INVESTMENT_PRODUCT_TYPE = DECODE(TRUE, IVD_SYSID IS NULL ,''0'',SHA1(UPPER(CONCAT(COALESCE(TRIM(MD_SRC_SYSTEM), ''#NULL#''), ''|'' , COALESCE(TRIM(IVD_SYSID), ''#NULL#''))))),
MD_HASHDIFF = ''0'',
MD_CREATION_DT=systimestamp()
Where 1=1;      
      ';
 
EXECUTE IMMEDIATE :INS_PRE_QUERY;
EXECUTE IMMEDIATE :INS_COPY_QUERY;
EXECUTE IMMEDIATE :UPD_QUERY;
END
$$;

create procedure INVESTIA_UNIVERIS.SP_CONV_LOADSTG_PSA_INVESTIA_UNIVERIS_TO_STG_HOLDINGS(ENV VARCHAR, IO_PATH VARCHAR)
    returns VARCHAR
    language SQL
    strict
as
$$
DECLARE
INS_PRE_QUERY STRING;
INS_COPY_QUERY STRING;
UPD_QUERY STRING;

BEGIN
INS_PRE_QUERY := 'DELETE FROM DB_IAW_'||ENV||'_STG.INVESTIA_UNIVERIS.HOLDINGS WHERE 1=1;';
INS_COPY_QUERY := '

COPY INTO 
DB_IAW_'||ENV||'_STG.INVESTIA_UNIVERIS.HOLDINGS (
	  MD_START_DT
	, MD_SOURCE	
	, MD_SEQ
	, ACT_SYSID
	, IVD_SYSID
	, REP_SYSID
	, IVR_SYSID
	, PLN_SYSID
	, FISCAL_SYSID
	, BAL_DATE
	, MV
	, CURRENCY_CD
	, EXCH_DT
	, EXCH_RATE
	, AUA
	, PRICE
	, UNITS
	, BV
	, ACB
	, NI_T
	, NI_P
	, FREQ_CD
	, UNITS_TRD_DT
	, FISCAL_TD_UNITS
	, IVD_LOAD_FLAG
	, WF_IND	
	, MD_EXTRACT_DT
	, MD_SRC_SYSTEM
	
	)
FROM
	(
	SELECT
		TO_DATE(split_part(split_part(metadata$filename, ''__'', 2), ''.'', 0)),metadata$filename, metadata$file_row_number,
		t.$1, t.$2, t.$3, t.$4, t.$5, t.$6, t.$7, t.$8, t.$9, t.$10, t.$11, t.$12, t.$13, t.$14, t.$15, t.$16, t.$17, t.$18, t.$19, t.$20, t.$21, t.$22, t.$23, t.$24, t.$25
	FROM
		@DATALAKE.'||io_PATH||' T
	) pattern = ''.*/HOLDINGS_.*csv'' file_format =(format_name =DB_IAW_'||ENV||'_STG. IAS.PIPE_UTF16);
	';
	UPD_QUERY := '
UPDATE DB_IAW_'||ENV||'_STG.INVESTIA_UNIVERIS.HOLDINGS

SET
	HK_LINK = SHA1(UPPER(CONCAT(
	  COALESCE(TRIM(MD_SEQ), ''#NULL#''), ''|''
	, COALESCE(TRIM(MD_SRC_SYSTEM), ''#NULL#''), ''|''
	, COALESCE(TRIM(MD_EXTRACT_DT), ''#NULL#''), ''|''
	, ''#NULL#'', ''|''
	, COALESCE(TRIM(IVD_SYSID), ''#NULL#''), ''|''
	, COALESCE(TRIM(PLN_SYSID), ''#NULL#''),''|''
	, COALESCE(TRIM(IVR_SYSID), ''#NULL#'')
	))),
	HK_HUB_CONTRACT = DECODE(TRUE, PLN_SYSID IS NULL AND IVR_SYSID IS NULL ,''0'',SHA1(UPPER(CONCAT(COALESCE(TRIM(MD_SRC_SYSTEM), ''#NULL#''), ''|'' ,''#NULL#'',''|'', COALESCE(TRIM(PLN_SYSID), ''#NULL#'')	,''|'', COALESCE(TRIM(IVR_SYSID), ''#NULL#''))))),
	HK_HUB_INVESTMENT_PRODUCT_TYPE = DECODE(TRUE, IVD_SYSID IS NULL ,''0'',SHA1(UPPER(CONCAT(COALESCE(TRIM(MD_SRC_SYSTEM), ''#NULL#''), ''|'' , COALESCE(TRIM(IVD_SYSID), ''#NULL#''))))),
	MD_HASHDIFF=SHA1(CONCAT(
	  COALESCE(TO_VARCHAR(ACT_SYSID),''#NULL#''), ''|''
	, COALESCE(TO_VARCHAR(REP_SYSID),''#NULL#''), ''|''
	, COALESCE(TO_VARCHAR(FISCAL_SYSID),''#NULL#''), ''|''
	, COALESCE(BAL_DATE,''#NULL#''),''|''
	, COALESCE(TO_VARCHAR(MV),''#NULL#''), ''|''
	, COALESCE(TO_VARCHAR(CURRENCY_CD),''#NULL#''), ''|''
	, COALESCE(TO_VARCHAR(EXCH_DT),''#NULL#''), ''|''
	, COALESCE(TO_VARCHAR(EXCH_RATE),''#NULL#''), ''|''
	, COALESCE(TO_VARCHAR(AUA),''#NULL#''), ''|''
	, COALESCE(TO_VARCHAR(PRICE),''#NULL#''), ''|''
	, COALESCE(TO_VARCHAR(UNITS),''#NULL#''), ''|''
	, COALESCE(TO_VARCHAR(BV),''#NULL#''), ''|''
	, COALESCE(TO_VARCHAR(ACB),''#NULL#''), ''|''
	, COALESCE(TO_VARCHAR(NI_T),''#NULL#''), ''|''
	, COALESCE(TO_VARCHAR(NI_P),''#NULL#''), ''|''
	, COALESCE(FREQ_CD,''#NULL#''),''|''
	, COALESCE(TO_VARCHAR(UNITS_TRD_DT),''#NULL#''), ''|''
	, COALESCE(TO_VARCHAR(FISCAL_TD_UNITS),''#NULL#''), ''|''
	, COALESCE(IVD_LOAD_FLAG,''#NULL#''),''|''
	, COALESCE(TO_VARCHAR(WF_IND),''#NULL#'')
	)),	
MD_CREATION_DT= SYSTIMESTAMP()
Where 1=1;
';
EXECUTE IMMEDIATE :INS_PRE_QUERY;
EXECUTE IMMEDIATE :INS_COPY_QUERY;
EXECUTE IMMEDIATE :UPD_QUERY;
END
$$;

create procedure INVESTIA_UNIVERIS.SP_CONV_LOADSTG_PSA_INVESTIA_UNIVERIS_TO_STG_PLANS(ENV VARCHAR, IO_PATH VARCHAR)
    returns VARCHAR
    language SQL
    strict
as
$$
DECLARE
INS_PRE_QUERY STRING;
INS_COPY_QUERY STRING;
UPD_QUERY STRING;
 
BEGIN
INS_PRE_QUERY := 'DELETE FROM DB_IAW_'||ENV||'_STG.INVESTIA_UNIVERIS.REF_INVESTMENT_SAVING_PROGRAM_TYPES WHERE 1=1;';
INS_COPY_QUERY := '
COPY INTO DB_IAW_'||ENV||'_STG.INVESTIA_UNIVERIS.REF_INVESTMENT_SAVING_PROGRAM_TYPES
(
MD_START_DT,
MD_SOURCE,
PLN_CD,
PLN_REG,
PLN_MNEM,
PLN_DESC,
PLN_MNEM_F,
PLN_DESC_F,
PLN_MNEM_ENG,
PLN_DESC_ENG,
PLN_SHORT_DESC_ENG,
PLN_MNEM_FRE,
PLN_DESC_FRE,
PLN_SHORT_DESC_FRE,
STMT_GROUP_MNEM,
MD_EXTRACT_DT,
MD_SRC_SYSTEM
 
) 
FROM
	(
	SELECT
		TO_DATE(split_part(split_part(metadata$filename, ''__'', 2), ''.'', 0)), metadata$filename,$1, t.$2, t.$3, t.$4, t.$5, t.$6,t.$7, t.$8, t.$9, t.$10, t.$11, t.$12, t.$13, t.$14,t.$15
	FROM
		@DATALAKE.'||IO_PATH||' T
	) pattern = ''.*PLANS_.*csv'' file_format =(format_name = DB_IAW_'||ENV||'_STG.IAS_UNIVERIS.PIPE_UTF16);
        ';   
UPD_QUERY := 'UPDATE DB_IAW_'||ENV||'_STG.INVESTIA_UNIVERIS.REF_INVESTMENT_SAVING_PROGRAM_TYPES
SET
    HK_HUB=SHA1(UPPER(CONCAT(COALESCE(TRIM(MD_SRC_SYSTEM), ''#NULL#''),
	''|'',COALESCE(TRIM(PLN_MNEM), ''#NULL#''), ''|'' ,''#NULL#'',''|'', 
	''#NULL#'',''|'',''#NULL#'',''|'',''#NULL#''))),
    MD_HASHDIFF=SHA1(CONCAT(COALESCE(TO_VARCHAR(PLN_CD), ''#NULL#''),''|'',COALESCE(TO_VARCHAR(PLN_REG),''#NULL#''),''|'',
	COALESCE(PLN_DESC,''#NULL#''), ''|'', COALESCE(PLN_MNEM_F, ''#NULL#''),	''|'',
    COALESCE(PLN_DESC_F,''#NULL#''), ''|'', COALESCE(PLN_MNEM_ENG,''#NULL#''), ''|'', 
	COALESCE(PLN_DESC_ENG,''#NULL#''),''|'', COALESCE(PLN_SHORT_DESC_ENG,''#NULL#''),''|'',
	COALESCE(PLN_MNEM_FRE,''#NULL#''),''|'', COALESCE(PLN_DESC_FRE,''#NULL#''),''|'', 
	COALESCE(PLN_SHORT_DESC_FRE,''#NULL#''),''|'', 
	COALESCE(STMT_GROUP_MNEM,''#NULL#''))),
    MD_CREATION_DT=systimestamp()
Where 1=1;      
      ';
 
EXECUTE IMMEDIATE :INS_PRE_QUERY;
EXECUTE IMMEDIATE :INS_COPY_QUERY;
EXECUTE IMMEDIATE :UPD_QUERY;
END
$$;

create procedure INVESTIA_UNIVERIS.SP_CONV_LOADSTG_PSA_INVESTIA_UNIVERIS_TO_STG_PLN_SRF(ENV VARCHAR, IO_PATH VARCHAR)
    returns VARCHAR
    language SQL
    strict
as
$$
DECLARE
INS_PRE_QUERY STRING;
INS_COPY_QUERY STRING;
UPD_QUERY STRING;

BEGIN
INS_PRE_QUERY := 'DELETE FROM DB_IAW_'||ENV||'_STG.INVESTIA_UNIVERIS.PLN_SRF WHERE 1=1;';
INS_COPY_QUERY := '

COPY INTO 
DB_IAW_'||ENV||'_STG.INVESTIA_UNIVERIS.PLN_SRF
 (
 MD_START_DT,
	MD_SOURCE,
	PLN_SRF_SYSID,
	PLN_SYSID,
	FAS_FILE_NAME,
	FROM_DT,
	TO_DT,
	MGT_CD,
	CURRENCY_CD,
	INCOME_TYPE,
	REP_CODE,
	COM_PYBL,
	EXCH_DT,
	EXCH_RATE,
	LAST_UPD_DT,
	USR_SYSID,
	FISCAL_SYSID,
	JUR_CD,
	ACT_TAX_COLLCTD,
	DLR_SYSID,
	RGN_SYSID,
	BRN_SYSID,
	REP_SYSID,
	IVR_SYSID,
	IVD_SYSID,
	MD_EXTRACT_DT,
	MD_SRC_SYSTEM
)
FROM
	(
	SELECT
		TO_DATE(split_part(split_part(metadata$filename, ''__'', 2), ''.'', 0)), metadata$filename,t.$1,t.$2,t.$3,t.$4,t.$5,t.$6,t.$7,t.$8,t.$9,t.$10,
		t.$11,t.$12,t.$13,t.$14,t.$15,t.$16,t.$17,t.$18,t.$19,t.$20,t.$21,t.$22,t.$23,t.$24,t.$25
	FROM
		@DATALAKE.'||io_PATH||' T
	) pattern =''.*PLN_SRF_.*csv'' file_format=(format_name=INVESTIA_UNIVERIS.PIPE_UTF16);
	';
	UPD_QUERY := '
UPDATE DB_IAW_'||ENV||'_STG. INVESTIA_UNIVERIS.PLN_SRF
SET
HK_LINK= SHA1(UPPER(CONCAT(COALESCE(TRIM(MD_SRC_SYSTEM), ''#NULL#''), ''|'' ,
COALESCE(TO_VARCHAR(PLN_SRF_SYSID), ''#NULL#''), ''|'' ,
COALESCE(TO_VARCHAR(TO_DT), ''#NULL#''), ''|'' ,
COALESCE(TO_VARCHAR(PLN_SYSID), ''#NULL#''), ''|'' ,
COALESCE(TO_VARCHAR(IVR_SYSID), ''#NULL#''), ''|'' ,
COALESCE(TO_VARCHAR(IVD_SYSID), ''#NULL#''), ''|'',
''#NULL#''))),
HK_HUB_CONTRACT=DECODE(TRUE, PLN_SYSID IS NULL AND IVR_SYSID IS NULL,''0'',SHA1(UPPER(CONCAT(COALESCE(TRIM(MD_SRC_SYSTEM), ''#NULL#''), ''|'' ,''#NULL#'',''|'', COALESCE(TO_VARCHAR(PLN_SYSID), ''#NULL#''),''|'', COALESCE(TO_VARCHAR(IVR_SYSID), ''#NULL#''))))),
HK_HUB_INVESTMENT_PRODUCT_TYPE = DECODE(TRUE, IVD_SYSID IS NULL ,''0'',SHA1(UPPER(CONCAT(COALESCE(TRIM(MD_SRC_SYSTEM), ''#NULL#''), ''|'' , COALESCE(TO_VARCHAR(TO_VARCHAR(IVD_SYSID)), ''#NULL#''))))),
MD_HASHDIFF = SHA1(CONCAT(
	COALESCE(FAS_FILE_NAME, ''#NULL#''), ''|'' ,
	COALESCE(TO_VARCHAR(FROM_DT),''#NULL#''), ''|'',
	COALESCE(MGT_CD, ''#NULL#''), ''|'' ,
	COALESCE(CURRENCY_CD, ''#NULL#''), ''|'' ,
	COALESCE(INCOME_TYPE, ''#NULL#''), ''|'' ,
	COALESCE(REP_CODE, ''#NULL#''), ''|'' ,
	COALESCE(TO_VARCHAR(COM_PYBL),''#NULL#''), ''|'',
	COALESCE(TO_VARCHAR(EXCH_DT),''#NULL#''), ''|'',
	COALESCE(TO_VARCHAR(EXCH_RATE),''#NULL#''), ''|'',
	COALESCE(TO_VARCHAR(LAST_UPD_DT),''#NULL#''), ''|'',
	COALESCE(TO_VARCHAR(USR_SYSID),''#NULL#''), ''|'',
	COALESCE(TO_VARCHAR(FISCAL_SYSID),''#NULL#''), ''|'',
	COALESCE(JUR_CD, ''#NULL#''), ''|'' ,
	COALESCE(TO_VARCHAR(ACT_TAX_COLLCTD),''#NULL#''), ''|'',
	COALESCE(TO_VARCHAR(DLR_SYSID),''#NULL#''), ''|'',
	COALESCE(TO_VARCHAR(RGN_SYSID),''#NULL#''), ''|'',
	COALESCE(TO_VARCHAR(BRN_SYSID),''#NULL#''), ''|'',
	COALESCE(TO_VARCHAR(REP_SYSID),''#NULL#''))),	
MD_CREATION_DT=systimestamp()
Where 1=1;
';
EXECUTE IMMEDIATE :INS_PRE_QUERY;
EXECUTE IMMEDIATE :INS_COPY_QUERY;
EXECUTE IMMEDIATE :UPD_QUERY;
END
$$;

create procedure INVESTIA_UNIVERIS.SP_CONV_LOADSTG_PSA_INVESTIA_UNIVERIS_TO_STG_REF_COM_PROD(ENV VARCHAR, IO_PATH VARCHAR)
    returns VARCHAR
    language SQL
    strict
as
$$
DECLARE
INS_PRE_QUERY STRING;
INS_COPY_QUERY STRING;
UPD_QUERY STRING;
BEGIN
INS_PRE_QUERY := 'DELETE FROM DB_IAW_'||ENV||'_STG.INVESTIA_UNIVERIS.S_COM_PRODUCTION WHERE 1=1';
INS_COPY_QUERY := '
COPY INTO 
DB_IAW_'||ENV||'_STG.INVESTIA_UNIVERIS.S_COM_PRODUCTION
(
MD_START_DT,
MD_SOURCE,
COM_PRODUCTION_CD,
COM_PRODUCTION_MNEM,
COM_PRODUCTION_DESC,
COM_PRODUCTION_LONG_DESC,
COM_PRODUCTION_MNEM_ENG,
COM_PRODUCTION_MNEM_FRE,
COM_PRODUCTION_DESC_ENG,
COM_PRODUCTION_DESC_FRE,
COM_PRODUCTION_LONG_DESC_ENG,
COM_PRODUCTION_LONG_DESC_FRE,
CRC_TRND_RPT_CAT,
COMMISSION_LEVEL,
CAC_TYPE_CD,
ACC_REPORT_IND,
MD_EXTRACT_DT,
MD_SRC_SYSTEM
)
FROM
	(
	SELECT
		TO_DATE(split_part(split_part(metadata$filename, ''__'', 2), ''.'', 0)), metadata$filename,t.$1, t.$2, t.$3, t.$4, t.$5, t.$6, t.$7, t.$8, t.$9
		,t.$10, t.$11, t.$12, t.$13, t.$14, t.$15, t.$16
	FROM
		@DATALAKE.'||io_PATH||' T
	) pattern = ''.*S_COM_PROD__.*csv'' file_format =(format_name =DB_IAW_'||ENV||'_STG.INVESTIA_UNIVERIS.PIPE_UTF16);
	';                                            
	UPD_QUERY := '
	UPDATE DB_IAW_'||ENV||'_STG.INVESTIA_UNIVERIS.S_COM_PRODUCTION
	SET
HK_HUB=
SHA1(UPPER(CONCAT(COALESCE(TRIM(MD_SRC_SYSTEM), ''#NULL#''), ''|''
,  COALESCE(TRIM(COM_PRODUCTION_CD), ''#NULL#'')
))),
MD_HASHDIFF=
SHA1(CONCAT(
   COALESCE(COM_PRODUCTION_MNEM, ''#NULL#''), ''|''
,  COALESCE(COM_PRODUCTION_DESC, ''#NULL#''), ''|''
,  COALESCE(COM_PRODUCTION_LONG_DESC, ''#NULL#''), ''|''
,  COALESCE(COM_PRODUCTION_MNEM_ENG, ''#NULL#''), ''|''
,  COALESCE(COM_PRODUCTION_MNEM_FRE, ''#NULL#''), ''|''
,  COALESCE(COM_PRODUCTION_DESC_ENG, ''#NULL#''), ''|''
,  COALESCE(COM_PRODUCTION_DESC_FRE, ''#NULL#''), ''|''
,  COALESCE(COM_PRODUCTION_LONG_DESC_ENG, ''#NULL#''), ''|''
,  COALESCE(COM_PRODUCTION_LONG_DESC_FRE, ''#NULL#''), ''|''
,  COALESCE(CRC_TRND_RPT_CAT, ''#NULL#''), ''|''
,  COALESCE(TO_VARCHAR(COMMISSION_LEVEL), ''#NULL#''), ''|''
,  COALESCE(TO_VARCHAR(CAC_TYPE_CD), ''#NULL#''), ''|''
,  COALESCE(TO_VARCHAR(ACC_REPORT_IND), ''#NULL#'')
)),	
MD_CREATION_DT=systimestamp()
Where 1=1;
';
EXECUTE IMMEDIATE :INS_PRE_QUERY;
EXECUTE IMMEDIATE :INS_COPY_QUERY;
EXECUTE IMMEDIATE :UPD_QUERY;
END
$$;

create procedure INVESTIA_UNIVERIS.SP_CONV_LOADSTG_PSA_INVESTIA_UNIVERIS_TO_STG_REF_PROVINCE(ENV VARCHAR, IO_PATH VARCHAR)
    returns VARCHAR
    language SQL
    strict
as
$$
DECLARE
INS_PRE_QUERY STRING;
INS_COPY_QUERY STRING;
UPD_QUERY STRING;
BEGIN
INS_PRE_QUERY := 'DELETE FROM DB_IAW_'||ENV||'_STG.INVESTIA_UNIVERIS.REF_PROVINCE WHERE 1=1';
INS_COPY_QUERY := '
COPY INTO 
DB_IAW_'||ENV||'_STG.INVESTIA_UNIVERIS.REF_PROVINCE
(
MD_START_DT,
MD_SOURCE,
PROV_CD ,
PROV_DESC ,
MD_EXTRACT_DT,
MD_SRC_SYSTEM
)
FROM
	(
	SELECT
		TO_DATE(split_part(split_part(metadata$filename, ''__'', 2), ''.'', 0)), metadata$filename,t.$1, t.$2, t.$3, t.$4
	FROM
		@DATALAKE.'||io_PATH||' T
	) pattern = ''.*PROVINCE__.*csv'' file_format =(format_name =DB_IAW_'||ENV||'_STG.IAS.PIPE_UTF16);
	';                                            
	UPD_QUERY := '
	UPDATE DB_IAW_'||ENV||'_STG.INVESTIA_UNIVERIS.REF_PROVINCE
	SET
HK_HUB=
SHA1(UPPER(COALESCE(TRIM(TO_VARCHAR(PROV_CD)), ''#NULL#''))),
MD_HASHDIFF=
SHA1(COALESCE(TO_VARCHAR(PROV_DESC), ''#NULL#'')),	
MD_CREATION_DT=SYSTIMESTAMP()
Where 1=1;
';
EXECUTE IMMEDIATE :INS_PRE_QUERY;
EXECUTE IMMEDIATE :INS_COPY_QUERY;
EXECUTE IMMEDIATE :UPD_QUERY;
END
$$;

create procedure INVESTIA_UNIVERIS.SP_CONV_LOADSTG_PSA_INVESTIA_UNIVERIS_TO_STG_REGISTERED_REPRESENTATIVE(ENV VARCHAR, IO_PATH VARCHAR)
    returns VARCHAR
    language SQL
    strict
as
$$
DECLARE
INS_PRE_QUERY STRING;
INS_COPY_QUERY STRING;
UPD_QUERY STRING;
BEGIN
INS_PRE_QUERY := 'DELETE FROM DB_IAW_'||ENV||'_STG.INVESTIA_UNIVERIS.REGISTERED_REPRESENTATIVE WHERE 1=1';
INS_COPY_QUERY := '

COPY INTO 
DB_IAW_'||ENV||'_STG.INVESTIA_UNIVERIS.REGISTERED_REPRESENTATIVE
(
	MD_START_DT,
	MD_SOURCE,
	REP_CD,
	COMPANY_CD,
	COMPANY_NAME,
	REGULATORY_ORG_CD,
	REGULATORY_ORG_NAME,
	DLR_SYSID,
	REP_CORP_NAME,	
	REP_LNAME,
	REP_FNAME,
	REP_ST_NAME,
	REP_GRP_RSP,
	DLR_CD,
	DLR_NAME_ENG,
	RGN_SYSID,
	RGN_CD,
	RGN_NAME,
	RGN_MGR,
	BRN_SYSID,
	BRN_CD,
	BRN_NAME,
	PROV_CD,
	REP_TEAM_CD,
	REP_TEAM_NAME,
    MD_EXTRACT_DT,
	MD_SRC_SYSTEM,
	CREATE_DT,
	TERMINATE_DT,
	REP_SYSID,
	REP_TITLE_DESC
)
FROM
	(
	SELECT
		TO_DATE(split_part(split_part(metadata$filename, ''__'', 2), ''.'', 0)), metadata$filename,t.$1, t.$2, t.$3, t.$4, t.$5, t.$6, t.$7, t.$8, t.$9, t.$10, t.$11, t.$12, t.$13, t.$14,
		t.$15, t.$16, t.$17, t.$18, t.$19, t.$20, t.$21, t.$22, t.$23, t.$24, t.$25, t.$26, t.$27, t.$28, t.$29
	FROM	@DATALAKE.'||io_PATH||' T
	) pattern = ''.*REGISTERED_REPRESENTATIVE__.*csv'' file_format =(format_name =DB_IAW_'||ENV||'_STG.INVESTIA_UNIVERIS.PIPE_UTF16);
	';                                            
	UPD_QUERY := '
UPDATE DB_IAW_'||ENV||'_STG.INVESTIA_UNIVERIS.REGISTERED_REPRESENTATIVE
SET
    HK_HUB=SHA1(UPPER(CONCAT(''INVESTIA'', ''|'' ,COALESCE(TRIM(TO_VARCHAR(REP_CD)), ''#NULL#'') ))),
	MD_HASHDIFF=SHA1(CONCAT(
	COALESCE(COMPANY_CD, ''#NULL#''), ''|'' ,
	COALESCE(COMPANY_NAME, ''#NULL#''), ''|'' ,
	COALESCE(REGULATORY_ORG_CD, ''#NULL#''), ''|'' ,
	COALESCE(REGULATORY_ORG_NAME, ''#NULL#''), ''|'' ,
	COALESCE(TO_VARCHAR(DLR_SYSID),''#NULL#''), ''|'',
	COALESCE(DLR_CD, ''#NULL#''), ''|'' ,
	COALESCE(DLR_NAME_ENG, ''#NULL#''), ''|'' ,
	COALESCE(TO_VARCHAR(RGN_SYSID),''#NULL#''), ''|'',
	COALESCE(RGN_CD, ''#NULL#''), ''|'' ,
	COALESCE(RGN_NAME, ''#NULL#''), ''|'' ,
	COALESCE(RGN_MGR, ''#NULL#''), ''|'' ,
	COALESCE(TO_VARCHAR(BRN_SYSID),''#NULL#''), ''|'',
	COALESCE(BRN_CD, ''#NULL#''), ''|'' ,
	COALESCE(BRN_NAME, ''#NULL#''), ''|'' ,
	COALESCE(REP_TEAM_CD, ''#NULL#''), ''|'' ,
	COALESCE(REP_TEAM_NAME, ''#NULL#''), ''|'' ,
	COALESCE(TO_VARCHAR(REP_SYSID),''#NULL#''), ''|'',
	COALESCE(REP_CORP_NAME, ''#NULL#''), ''|'' ,
	COALESCE(REP_LNAME, ''#NULL#''), ''|'' ,
	COALESCE(REP_FNAME, ''#NULL#''), ''|'' ,
	COALESCE(REP_ST_NAME, ''#NULL#''), ''|'' ,
	COALESCE(REP_GRP_RSP, ''#NULL#''),	
	COALESCE(PROV_CD, ''#NULL#''),
	COALESCE(REP_TITLE_DESC, ''#NULL#''),
	COALESCE(TO_VARCHAR(TERMINATE_DT), ''#NULL#''),
	COALESCE(TO_VARCHAR(CREATE_DT), ''#NULL#'')
	)),	
	MD_CREATION_DT=SYSTIMESTAMP()
Where 1=1;
';
EXECUTE IMMEDIATE :INS_PRE_QUERY;
EXECUTE IMMEDIATE :INS_COPY_QUERY;
EXECUTE IMMEDIATE :UPD_QUERY;
END
$$;

create procedure INVESTIA_UNIVERIS.SP_CONV_LOADSTG_PSA_INVESTIA_UNIVERIS_TO_STG_REVENUE_PAYABLE(ENV VARCHAR, IO_PATH VARCHAR)
    returns VARCHAR
    language SQL
    strict
as
$$
DECLARE
INS_PRE_QUERY STRING;
INS_COPY_QUERY STRING;
UPD_QUERY STRING;
BEGIN
INS_PRE_QUERY := 'DELETE FROM DB_IAW_'||ENV||'_STG.INVESTIA_UNIVERIS.REVENUE_PAYABLE WHERE 1=1';
INS_COPY_QUERY := '
COPY INTO 
DB_IAW_'||ENV||'_STG.INVESTIA_UNIVERIS.REVENUE_PAYABLE
(
MD_START_DT,
MD_SOURCE,
PAY_SYSID,
PYBL_STATUS,
EVENT_PROC_SYSID,
EVENT_RPT_SYSID,
BEN_SYSID,
REP_SYSID,
DEAL_SYSID,
COM_SYSID,
DIST_SYSID,
TRX_SYSID,
IVR_SYSID,
PLN_SYSID,
ACT_SYSID,
IVD_SYSID,
MGT_CD,
TRX_CD,
PROC_DT,
PAID_DT,
PAY_PERIOD,
TAX_YEAR,
TRADE_DT,
GRSS_AMT,
COM_DLR,
COM_PYBL,
COM_BEN_PYBL,
TICKET_CHG,
PAY_CD,
COM_PRODUCTION_CD,
AMOUNT,
USR_SYSID,
OTX_SYSID,
DISPLAY_FLAG,
DLR_MINIMUM,
ORIG_PAY_PER,
IVT_TYPE,
COM_PAY_SYSID,
INTERNAL_COMM,
WRHS_IND,
MD_EXTRACT_DT,
MD_SRC_SYSTEM
)
FROM
	(
	SELECT
		TO_DATE(split_part(split_part(metadata$filename, ''__'', 2), ''.'', 0)), metadata$filename,t.$1,t.$2,t.$3,t.$4,t.$5,t.$6,t.$7,t.$8,t.$9,t.$10,
		t.$11,t.$12,t.$13,t.$14,t.$15,t.$16,t.$17,t.$18,t.$19,t.$20,t.$21,t.$22,t.$23,t.$24,
		t.$25,t.$26,t.$27,t.$28,t.$29,t.$30,t.$31,t.$32,t.$33,t.$34,
		t.$35,t.$36,t.$37,t.$38,t.$39,t.$40
	FROM
		@DATALAKE.'||io_PATH||' T
	) pattern =''.*REVENUE_PAYABLE__.*csv''	file_format=(format_name=DB_IAW_'||ENV||'_STG.INVESTIA_UNIVERIS.PIPE_UTF16);
	';                                            
	UPD_QUERY := '
	UPDATE DB_IAW_'||ENV||'_STG.INVESTIA_UNIVERIS.REVENUE_PAYABLE
	SET
HK_LINK= SHA1(UPPER(CONCAT(COALESCE(TRIM(MD_SRC_SYSTEM), ''#NULL#''), ''|'' ,
COALESCE(TO_VARCHAR(PAY_SYSID), ''#NULL#''), ''|'' ,
COALESCE(TO_VARCHAR(PAID_DT), ''#NULL#''), ''|'' ,
COALESCE(TO_VARCHAR(PLN_SYSID), ''#NULL#''), ''|'' ,
COALESCE(TO_VARCHAR(IVR_SYSID), ''#NULL#''), ''|'' ,
COALESCE(TO_VARCHAR(IVD_SYSID), ''#NULL#''), ''|'' ,
''#NULL#''))),
HK_HUB_CONTRACT=DECODE(TRUE, PLN_SYSID IS NULL AND IVR_SYSID IS NULL,''0'',SHA1(UPPER(CONCAT(COALESCE(TRIM(MD_SRC_SYSTEM),''#NULL#''), ''|'' ,''#NULL#'',''|'', COALESCE(TO_VARCHAR(PLN_SYSID), ''#NULL#'')	,''|'', COALESCE(TO_VARCHAR(IVR_SYSID), ''#NULL#''))))),
HK_HUB_INVESTMENT_PRODUCT_TYPE = DECODE(TRUE, IVD_SYSID IS NULL ,''0'',SHA1(UPPER(CONCAT(COALESCE(TRIM(MD_SRC_SYSTEM),''#NULL#''), ''|'' , COALESCE(TO_VARCHAR(TO_VARCHAR(IVD_SYSID)), ''#NULL#''))))),
MD_HASHDIFF = SHA1(CONCAT(
	COALESCE(PYBL_STATUS, ''#NULL#''), ''|'' ,
	COALESCE(TO_VARCHAR(EVENT_PROC_SYSID),''#NULL#''), ''|'',
	COALESCE(TO_VARCHAR(EVENT_RPT_SYSID),''#NULL#''), ''|'',
	COALESCE(TO_VARCHAR(BEN_SYSID),''#NULL#''), ''|'',
	COALESCE(TO_VARCHAR(REP_SYSID),''#NULL#''), ''|'',
	COALESCE(TO_VARCHAR(DEAL_SYSID),''#NULL#''), ''|'',
	COALESCE(TO_VARCHAR(COM_SYSID),''#NULL#''), ''|'',
	COALESCE(TO_VARCHAR(DIST_SYSID),''#NULL#''), ''|'',
	COALESCE(TO_VARCHAR(TRX_SYSID),''#NULL#''), ''|'',
	COALESCE(TO_VARCHAR(ACT_SYSID),''#NULL#''), ''|'',
	COALESCE(MGT_CD, ''#NULL#''), ''|'' ,
	COALESCE(TO_VARCHAR(TRX_CD),''#NULL#''), ''|'',
	COALESCE(TO_VARCHAR(PROC_DT),''#NULL#''), ''|'',
	COALESCE(PAY_PERIOD,''#NULL#''), ''|'' ,
	COALESCE(TAX_YEAR, ''#NULL#''), ''|'' ,
	COALESCE(TO_VARCHAR(TRADE_DT),''#NULL#''), ''|'',
	COALESCE(TO_VARCHAR(GRSS_AMT),''#NULL#''), ''|'',
	COALESCE(TO_VARCHAR(COM_DLR),''#NULL#''), ''|'',
	COALESCE(TO_VARCHAR(COM_PYBL),''#NULL#''), ''|'',
	COALESCE(TO_VARCHAR(COM_BEN_PYBL),''#NULL#''), ''|'',
	COALESCE(TO_VARCHAR(TICKET_CHG),''#NULL#''), ''|'',
	COALESCE(PAY_CD, ''#NULL#''), ''|'' ,
	COALESCE(COM_PRODUCTION_CD, ''#NULL#''), ''|'' ,
	COALESCE(TO_VARCHAR(AMOUNT),''#NULL#''), ''|'',
	COALESCE(TO_VARCHAR(USR_SYSID),''#NULL#''), ''|'',
	COALESCE(TO_VARCHAR(OTX_SYSID),''#NULL#''),''|'',
	COALESCE(TO_VARCHAR(DISPLAY_FLAG),''#NULL#''), ''|'',
	COALESCE(DLR_MINIMUM, ''#NULL#''), ''|'' ,
	COALESCE(ORIG_PAY_PER, ''#NULL#''), ''|'' ,
	COALESCE(IVT_TYPE, ''#NULL#''), ''|'' ,
	COALESCE(TO_VARCHAR(COM_PAY_SYSID),''#NULL#''), ''|'',
	COALESCE(TO_VARCHAR(INTERNAL_COMM),''#NULL#''), ''|'',
	COALESCE(TO_VARCHAR(WRHS_IND),''#NULL#''))),	
MD_CREATION_DT=systimestamp()
Where 1=1;
';
EXECUTE IMMEDIATE :INS_PRE_QUERY;
EXECUTE IMMEDIATE :INS_COPY_QUERY;
EXECUTE IMMEDIATE :UPD_QUERY;
END
$$;

create procedure INVESTIA_UNIVERIS.SP_CONV_LOADSTG_PSA_INVESTIA_UNIVERIS_TO_STG_WRAP_FEE(ENV VARCHAR, IO_PATH VARCHAR)
    returns VARCHAR
    language SQL
    strict
as
$$
DECLARE
INS_PRE_DEL STRING;
INS_PRE_COPY STRING;
INS_QUERY STRING;
BEGIN
INS_PRE_DEL :='DELETE FROM DB_IAW_'||ENV||'_STG.INVESTIA_UNIVERIS.WRAP_FEE WHERE 1=1';
INS_PRE_COPY :='COPY INTO DB_IAW_'||ENV||'_STG.INVESTIA_UNIVERIS.WRAP_FEE
(
	MD_START_DT,
	MD_SOURCE,	
	WF_SYSID,
	BATCH_SYSID,
	STATUS_CD,
	CET_WF_SYSID,
	IVR_SYSID,
	WF_IND,
	PLN_SYSID,
	ACT_SYSID,
	OTX_SYSID,
	AVG_MV,
	CREATE_DT,
	FEE_AMT,
	FEE_GST,
	FEE_PST,
	FEE_TOTAL_AMT,
	DLR_SYSID,
	RGN_SYSID,
	BRN_SYSID,
	REP_SYSID,
	USR_SYSID,
	DESCRIPTION,
	LAST_UPD_DT,
	SRF_SYSID,
	OTHER_COM_SYSID,
	FISCAL_SYSID,
	PAYMENT_DT,
	MD_EXTRACT_DT,
	MD_SRC_SYSTEM
)
FROM
	(
	SELECT
		TO_DATE(split_part(split_part(metadata$filename, ''__'', 2), ''.'', 0)), metadata$filename,t.$1,t.$2,t.$3,t.$4,t.$5,t.$6,t.$7,t.$8,t.$9,t.$10,
		t.$11,t.$12,t.$13,t.$14,t.$15,t.$16,t.$17,t.$18,t.$19,t.$20,t.$21,t.$22,t.$23,t.$24,t.$25,t.$26,t.$27,t.$28
	FROM
		@DATALAKE.'||IO_PATH||' T
	) pattern =''.*WRAP_FEE__.*csv'' file_format=(format_name=DB_IAW_'||ENV||'_STG.INVESTIA_UNIVERIS.PIPE_UTF16)';

INS_QUERY := '
UPDATE DB_IAW_'||ENV||'_STG.INVESTIA_UNIVERIS.WRAP_FEE
SET
HK_LINK= SHA1(UPPER(CONCAT(COALESCE(TRIM(MD_SRC_SYSTEM), ''#NULL#''), ''|'' ,
COALESCE(TO_VARCHAR(WF_SYSID), ''#NULL#''), ''|'' ,
COALESCE(TO_VARCHAR(PAYMENT_DT), ''#NULL#''), ''|'' ,
COALESCE(TO_VARCHAR(PLN_SYSID), ''#NULL#''), ''|'' ,
COALESCE(TO_VARCHAR(IVR_SYSID), ''#NULL#''), ''|'' ,
''#NULL#'', ''|'',
''#NULL#''))),
HK_HUB_CONTRACT=DECODE(TRUE, PLN_SYSID IS NULL AND IVR_SYSID IS NULL,''0'',SHA1(UPPER(CONCAT(COALESCE(TRIM(MD_SRC_SYSTEM),''#NULL#''), ''|'' ,''#NULL#'',''|'', COALESCE(TO_VARCHAR(PLN_SYSID),''#NULL#'')	,''|'', COALESCE(TO_VARCHAR(IVR_SYSID),''#NULL#''))))),
HK_HUB_INVESTMENT_PRODUCT_TYPE =''0'',
MD_HASHDIFF = SHA1(CONCAT(
	COALESCE(TO_VARCHAR(BATCH_SYSID),''#NULL#''), ''|'' ,
	COALESCE(STATUS_CD,''#NULL#''), ''|'',
	COALESCE(TO_VARCHAR(CET_WF_SYSID),''#NULL#''), ''|'' ,
	COALESCE(TO_VARCHAR(WF_IND),''#NULL#''), ''|'' ,
	COALESCE(TO_VARCHAR(ACT_SYSID),''#NULL#''), ''|'',
	COALESCE(TO_VARCHAR(OTX_SYSID),''#NULL#''), ''|'',
	COALESCE(TO_VARCHAR(AVG_MV),''#NULL#''), ''|'',
	COALESCE(TO_VARCHAR(CREATE_DT),''#NULL#''), ''|'',
	COALESCE(TO_VARCHAR(FEE_AMT),''#NULL#''), ''|'',
	COALESCE(TO_VARCHAR(FEE_GST),''#NULL#''), ''|'',
	COALESCE(TO_VARCHAR(FEE_PST),''#NULL#''), ''|'' ,
	COALESCE(TO_VARCHAR(FEE_TOTAL_AMT),''#NULL#''), ''|'',
	COALESCE(TO_VARCHAR(DLR_SYSID),''#NULL#''), ''|'',
	COALESCE(TO_VARCHAR(RGN_SYSID),''#NULL#''), ''|'',
	COALESCE(TO_VARCHAR(BRN_SYSID),''#NULL#''), ''|'',
	COALESCE(TO_VARCHAR(REP_SYSID),''#NULL#''), ''|'',
	COALESCE(TO_VARCHAR(USR_SYSID),''#NULL#''), ''|'',
	COALESCE(DESCRIPTION,''#NULL#''), ''|'',
	COALESCE(TO_VARCHAR(LAST_UPD_DT),''#NULL#''), ''|'',
	COALESCE(TO_VARCHAR(SRF_SYSID),''#NULL#''), ''|'',
	COALESCE(TO_VARCHAR(OTHER_COM_SYSID),''#NULL#''), ''|'',
	COALESCE(TO_VARCHAR(FISCAL_SYSID),''#NULL#''))),	
MD_CREATION_DT=systimestamp()
Where 1=1';

EXECUTE IMMEDIATE :INS_PRE_DEL;
EXECUTE IMMEDIATE :INS_PRE_COPY;
EXECUTE IMMEDIATE :INS_QUERY;
END
$$;

create procedure INVESTIA_UNIVERIS.SP_CONV_LOADSTG_PSA_INVESTIA_UNIVERIS_TO_STG_X_DBB_MASTER_REP(ENV VARCHAR, IO_PATH VARCHAR)
    returns VARCHAR
    language SQL
    strict
as
$$
DECLARE
INS_PRE_QUERY STRING;
INS_COPY_QUERY STRING;
UPD_QUERY STRING;

BEGIN
INS_PRE_QUERY := 'DELETE FROM DB_IAW_'||ENV||'_STG.INVESTIA_UNIVERIS.X_DBB_MASTER_REP WHERE 1=1;';
INS_COPY_QUERY := '

COPY INTO 
DB_IAW_'||ENV||'_STG.INVESTIA_UNIVERIS.X_DBB_MASTER_REP
 (
  MD_START_DT,
	MD_SOURCE ,
	MASTER_CD,
	REP_SYSID,
	BEN_SYSID,
	COMM_RATE,
	BRN_SYSID,
	BRN_CD,
	REP_CD_ORIGINAL,
	MD_EXTRACT_DT ,
	MD_SRCSYSTEM
)
FROM
	(
	SELECT
		TO_DATE(split_part(split_part(metadata$filename, ''__'', 2), ''.'', 0)), metadata$filename, t.$1, t.$2, t.$3, t.$4, t.$5, t.$6, t.$7, t.$8, t.$9
	FROM
		@DATALAKE.'||io_PATH||' T 
		) pattern = ''.*x_DBB_MASTER_REP__.*csv'' file_format =(format_name = IAS.PIPE_UTF16);
		';
	UPD_QUERY := '
	UPDATE DB_IAW_'||ENV||'_STG. INVESTIA_UNIVERIS.X_DBB_MASTER_REP
	SET
	HK_LINK=SHA1(UPPER(CONCAT(''INVESTIA'' ,''|'', COALESCE(TRIM(REP_CD_ORIGINAL), ''#NULL#''), ''|'', COALESCE(TRIM(MASTER_CD), ''#NULL#''),''|'', ''#NULL#'',''|'', ''#NULL#'',''|'', ''#NULL#'' ))),
	HK_HUB_FROM= DECODE(TRUE, REP_CD_ORIGINAL IS NULL ,''0'',SHA1(UPPER(CONCAT(COALESCE(TRIM(''INVESTIA''), ''#NULL#''), ''|'' , COALESCE(TRIM(REP_CD_ORIGINAL), ''#NULL#''))))),
	HK_HUB_TO= DECODE(TRUE, MASTER_CD IS NULL ,''0'',SHA1(UPPER(CONCAT(COALESCE(TRIM(''INVESTIA''), ''#NULL#''), ''|'' , COALESCE(TRIM(MASTER_CD), ''#NULL#''))))),
	
	MD_HASHDIFF=SHA1(concat( COALESCE(TO_VARCHAR(REP_SYSID), ''#NULL#''),''|'',
	                 COALESCE(TO_VARCHAR(BEN_SYSID), ''#NULL#''),''|'',
	                 COALESCE(TO_VARCHAR(COMM_RATE), ''#NULL#''),''|'',
				     COALESCE(TO_VARCHAR(BRN_SYSID), ''#NULL#''),''|'',
				     COALESCE(BRN_CD, ''#NULL#'')
				     )),	
	MD_CREATION_DT=SYSTIMESTAMP()
Where 1=1;
';
EXECUTE IMMEDIATE :INS_PRE_QUERY;
EXECUTE IMMEDIATE :INS_COPY_QUERY;
EXECUTE IMMEDIATE :UPD_QUERY;
END
$$;

create procedure INVESTIA_UNIVERIS.SP_CONV_LOADSTG_PSA_INVESTIA_UNIVERIS_TO_STG_X_DBB_MASTER_REP(ENV VARCHAR, IO_FILE_NAME VARCHAR, I_DATA_START_DATE VARCHAR)
    returns VARCHAR
    language SQL
    strict
as
$$
DECLARE
INS_PRE_QUERY STRING;
INS_COPY_QUERY STRING;
INS_UPDATE STRING;
BEGIN
i_DATA_START_DATE :=CHAR(39)||i_DATA_START_DATE||CHAR(39);
INS_PRE_QUERY := 'TRUNCATE TABLE DB_IAW_'||ENV||'_STG.INVESTIA_UNIVERIS.X_DBB_MASTER_REP ';
INS_COPY_QUERY := '
COPY INTO DB_IAW_'||ENV||'_STG.INVESTIA_UNIVERIS.X_DBB_MASTER_REP
(   MD_START_DT,
	MD_SOURCE ,
	MASTER_CD,
	REP_SYSID,
	BEN_SYSID,
	COMM_RATE,
	BRN_SYSID,
	BRN_CD,
	REP_CD_ORIGINAL,
	MD_EXTRACT_DT ,
	MD_SRCSYSTEM
)
FROM
	(
	SELECT
		TO_DATE('||i_DATA_START_DATE||',''YYYY-MM-DD''), metadata$filename, t.$1, t.$2, t.$3, t.$4, t.$5, t.$6, t.$7, t.$8, t.$9
	FROM
		@DATALAKE.raw/INVESTIA/INITIAL_LOADING T
	) pattern ='||io_file_name||' file_format=(format_name=DB_IAW_'||ENV||'_STG.INVESTIA_UNIVERIS.PIPE_UTF16);
              ';
INS_UPDATE := '
UPDATE DB_IAW_'||ENV||'_STG.INVESTIA_UNIVERIS.X_DBB_MASTER_REP

SET 
	HK_LINK=SHA1(UPPER(CONCAT(''INVESTIA'' ,''|'', COALESCE(TRIM(REP_CD_ORIGINAL), ''#NULL#''), ''|'', COALESCE(TRIM(MASTER_CD), ''#NULL#''),''|'', ''#NULL#'',''|'', ''#NULL#'',''|'', ''#NULL#'' ))),
	HK_HUB_FROM= DECODE(TRUE, REP_CD_ORIGINAL IS NULL ,''0'',SHA1(UPPER(CONCAT(COALESCE(TRIM(''INVESTIA''), ''#NULL#''), ''|'' , COALESCE(TRIM(REP_CD_ORIGINAL), ''#NULL#''))))),
	HK_HUB_TO= DECODE(TRUE, MASTER_CD IS NULL ,''0'',SHA1(UPPER(CONCAT(COALESCE(TRIM(''INVESTIA''), ''#NULL#''), ''|'' , COALESCE(TRIM(MASTER_CD), ''#NULL#''))))),
	
	MD_HASHDIFF=SHA1(concat( COALESCE(TO_VARCHAR(REP_SYSID), ''#NULL#''),''|'',
	                 COALESCE(TO_VARCHAR(BEN_SYSID), ''#NULL#''),''|'',
	                 COALESCE(TO_VARCHAR(COMM_RATE), ''#NULL#''),''|'',
				     COALESCE(TO_VARCHAR(BRN_SYSID), ''#NULL#''),''|'',
				     COALESCE(BRN_CD, ''#NULL#'')
				     )),	
	MD_CREATION_DT=SYSTIMESTAMP()
Where 1=1;
';
EXECUTE IMMEDIATE :INS_PRE_QUERY;
EXECUTE IMMEDIATE :INS_COPY_QUERY;
EXECUTE IMMEDIATE :INS_UPDATE;
END
$$;

create procedure INVESTIA_UNIVERIS.SP_CONV_LOADSTG_PSA_INVESTIA_UNIVERIS_TO_STG_X_DBB_MASTER_REP_UNIVERIS(ENV VARCHAR, IO_FILE_NAME VARCHAR, I_DATA_START_DATE VARCHAR)
    returns VARCHAR
    language SQL
    strict
as
$$
DECLARE
INS_PRE_QUERY STRING;
INS_COPY_QUERY STRING;
INS_UPDATE STRING;
BEGIN
i_DATA_START_DATE :=CHAR(39)||i_DATA_START_DATE||CHAR(39);
IO_FILE_NAME :=CHAR(39)||IO_FILE_NAME||CHAR(39);
INS_PRE_QUERY := 'TRUNCATE TABLE DB_IAW_'||ENV||'_STG.INVESTIA_UNIVERIS.X_DBB_MASTER_REP ';
INS_COPY_QUERY := '
COPY INTO DB_IAW_'||ENV||'_STG.INVESTIA_UNIVERIS.X_DBB_MASTER_REP
(   MD_START_DT,
	MD_SOURCE ,
	MASTER_CD,
	REP_SYSID,
	BEN_SYSID,
	COMM_RATE,
	BRN_SYSID,
	BRN_CD,
	REP_CD_ORIGINAL,
	MD_EXTRACT_DT ,
	MD_SRCSYSTEM
)
FROM
	(
	SELECT
		TO_DATE('||i_DATA_START_DATE||',''YYYY-MM-DD''), metadata$filename, t.$1, t.$2, t.$3, t.$4, t.$5, t.$6, t.$7, t.$8, t.$9
	FROM
		@DATALAKE.raw/INVESTIA/INITIAL_LOADING T
	) pattern ='||io_file_name||' file_format=(format_name=DB_IAW_'||ENV||'_STG.INVESTIA_UNIVERIS.PIPE_UTF16);
              ';
INS_UPDATE := '
UPDATE DB_IAW_'||ENV||'_STG.INVESTIA_UNIVERIS.X_DBB_MASTER_REP

SET 
	HK_LINK=SHA1(UPPER(CONCAT(''INVESTIA'' ,''|'', COALESCE(TRIM(REP_CD_ORIGINAL), ''#NULL#''), ''|'', COALESCE(TRIM(MASTER_CD), ''#NULL#''),''|'', ''#NULL#'',''|'', ''#NULL#'',''|'', ''#NULL#'' ))),
	HK_HUB_FROM= DECODE(TRUE, REP_CD_ORIGINAL IS NULL ,''0'',SHA1(UPPER(CONCAT(COALESCE(TRIM(''INVESTIA''), ''#NULL#''), ''|'' , COALESCE(TRIM(REP_CD_ORIGINAL), ''#NULL#''))))),
	HK_HUB_TO= DECODE(TRUE, MASTER_CD IS NULL ,''0'',SHA1(UPPER(CONCAT(COALESCE(TRIM(''INVESTIA''), ''#NULL#''), ''|'' , COALESCE(TRIM(MASTER_CD), ''#NULL#''))))),
	
	MD_HASHDIFF=SHA1(concat( COALESCE(TO_VARCHAR(REP_SYSID), ''#NULL#''),''|'',
	                 COALESCE(TO_VARCHAR(BEN_SYSID), ''#NULL#''),''|'',
	                 COALESCE(TO_VARCHAR(COMM_RATE), ''#NULL#''),''|'',
				     COALESCE(TO_VARCHAR(BRN_SYSID), ''#NULL#''),''|'',
				     COALESCE(BRN_CD, ''#NULL#'')
				     )),	
	MD_CREATION_DT=SYSTIMESTAMP()
Where 1=1;
';
EXECUTE IMMEDIATE :INS_PRE_QUERY;
EXECUTE IMMEDIATE :INS_COPY_QUERY;
EXECUTE IMMEDIATE :INS_UPDATE;
END
$$;

create procedure STEWARDSHIP.SP_CONV_LOADSTG_PSA_STEWARDSHIP_TO_STG_REF_KPI_TARGET_FIRM(ENV VARCHAR, IO_PATH VARCHAR)
    returns VARCHAR
    language SQL
    strict
as
$$
DECLARE
INS_PRE_QUERY STRING;
INS_COPY_QUERY STRING;
UPD_QUERY STRING;

BEGIN
INS_PRE_QUERY := 'DELETE FROM DB_IAW_'||ENV||'_STG.STEWARDSHIP.REF_KPI_TARGET_FIRM WHERE 1=1;';
INS_COPY_QUERY := '
COPY INTO DB_IAW_'||ENV||'_STG.STEWARDSHIP.REF_KPI_TARGET_FIRM
(
MD_START_DT,
MD_SOURCE,
KPI_DATE,
METRIC_NAME,
TARGET,
MD_EXTRACT_DT,
MD_SRC_SYSTEM 
) 
FROM
	(
	SELECT
		TO_DATE(split_part(split_part(metadata$filename, ''__'', 2), ''.'', 0)), metadata$filename,t.$1, t.$2, t.$3, t.$4, t.$5
		FROM
		@DATALAKE.'||io_PATH||' T 
	) pattern = ''.*KPI_TARGET_FIRM__.*csv'' file_format =(format_name = DB_IAW_'||ENV||'_STG.STEWARDSHIP.CSV_UTF8  SKIP_HEADER =1);
	';
UPD_QUERY := '
UPDATE DB_IAW_'||ENV||'_STG.STEWARDSHIP.REF_KPI_TARGET_FIRM
SET 
HK_HUB=
SHA1(UPPER(CONCAT(COALESCE(TRIM(MD_SRC_SYSTEM), ''#NULL#''), ''|''
,  COALESCE(TRIM(KPI_DATE), ''#NULL#''), ''|'' 
,  COALESCE(TRIM(METRIC_NAME), ''#NULL#''), ''|'' 
 ))),

MD_HASHDIFF=
SHA1(CONCAT(
   COALESCE(TO_VARCHAR(TARGET), ''#NULL#''), ''|''
)),	
MD_CREATION_DT = systimestamp()
Where 1=1;
';

EXECUTE IMMEDIATE :INS_PRE_QUERY;
EXECUTE IMMEDIATE :INS_COPY_QUERY;
EXECUTE IMMEDIATE :UPD_QUERY;
END
$$;

create procedure STEWARDSHIP.SP_CONV_LOADSTG_PSA_STEWARDSHIP_TO_STG_REF_KPI_TARGET_RVP(ENV VARCHAR, IO_PATH VARCHAR)
    returns VARCHAR
    language SQL
    strict
as
$$
DECLARE
INS_PRE_QUERY STRING;
INS_COPY_QUERY STRING;
UPD_QUERY STRING;

BEGIN
INS_PRE_QUERY := 'DELETE FROM DB_IAW_'||ENV||'_STG.STEWARDSHIP.REF_KPI_TARGET_RVP WHERE 1=1;';
INS_COPY_QUERY := '
COPY INTO DB_IAW_'||ENV||'_STG.STEWARDSHIP.REF_KPI_TARGET_RVP
(
MD_START_DT,
MD_SOURCE,
KPI_DATE,
METRIC_NAME,
TARGET,
RVP_NAME,
RVP_ID,
MD_EXTRACT_DT,
MD_SRC_SYSTEM 
) 
FROM
	(
	SELECT
		TO_DATE(split_part(split_part(metadata$filename, ''__'', 2), ''.'', 0)), metadata$filename,t.$1, t.$2, t.$3, t.$4, t.$5, t.$6, t.$7
	FROM
		@DATALAKE.'||io_PATH||' T 
	) pattern = ''.*KPI_TARGET_RVP__.*csv'' file_format =(format_name = DB_IAW_'||ENV||'_STG.STEWARDSHIP.CSV_UTF8  SKIP_HEADER =1);
	';
UPD_QUERY := '
update DB_IAW_'||ENV||'_STG.STEWARDSHIP.REF_KPI_TARGET_RVP
set
HK_HUB =
	SHA1(UPPER(CONCAT(
	coalesce(TRIM(MD_SRC_SYSTEM), ''#NULL#''), ''|''
	, coalesce(TRIM(KPI_DATE), ''#NULL#''), ''|'' 
	, coalesce(TRIM(METRIC_NAME), ''#NULL#''), ''|'' 
	, coalesce(TRIM(RVP_ID), ''#NULL#'')
	)))
,MD_HASHDIFF =
	SHA1(CONCAT(
	coalesce(TO_VARCHAR(TARGET), ''#NULL#''), ''|''
	, coalesce(TRIM(RVP_NAME), ''#NULL#'')
	))
,MD_CREATION_DT = systimestamp()
where
1 = 1;
';

EXECUTE IMMEDIATE :INS_PRE_QUERY;
EXECUTE IMMEDIATE :INS_COPY_QUERY;
EXECUTE IMMEDIATE :UPD_QUERY;
END
$$;

create procedure STEWARDSHIP.SP_CONV_LOADSTG_PSA_STEWARDSHIP_TO_STG_REF_ORGANIC_GROWTH_EXCEPTION_PROCESS_IAPW(ENV VARCHAR, IO_PATH VARCHAR)
    returns VARCHAR
    language SQL
    strict
as
$$ -- missing source code
$$;

create procedure IAS_CERTS.SP_CONV_LOADSTG_SPLIT_VIEW_TO_STG_REG_REP_IAS_CERTS(ENV VARCHAR)
    returns VARCHAR
    language SQL
    strict
as
$$
DECLARE
INS_PRE_DEL STRING;
INS_INSERT STRING;
INS_UPDATE STRING;
BEGIN
INS_PRE_DEL := 'DELETE FROM DB_IAW_'||ENV||'_STG.IAS_CERTS.REGISTERED_REPRESENTATIVE WHERE 1=1';
INS_INSERT := '
INSERT INTO DB_IAW_'||ENV||'_STG.IAS_CERTS.REGISTERED_REPRESENTATIVE
(	MD_START_DT,
	MD_SOURCE,
	MD_EXTRACT_DT,
	CID,
	FIRST_NAME,
	LAST_NAME,
	FULL_NAME,
	PRIMARY_ROLE,
	RVP,
	BRANCH_NRD,
	BRANCH_NAME,
	PROVINCE,
	IS_ACTIVE,
	RR_CD,
	TRADE_NAME,
	PORTAL_IDS,
	BEGIN_DT,
	END_DT,
	ADVISOR_BIRTH_DATE,
	REP_EMAIL,		 
	CBM, 			 
	BRANCH_ADDRESS1,	 
	BRANCH_ADDRESS2,	 
	BRANCH_CITY,		 
	BRANCH_POSTAL_CODE
)
SELECT
	src.MD_START_DT,
	src.MD_SOURCE,
	src.MD_EXTRACT_DT,
	src.CID,
	src.FIRST_NAME,
	src.LAST_NAME,
	src.FULL_NAME,
	src.PRIMARY_ROLE,
	src.RVP,
	src.BRANCH_NRD,
	src.BRANCH_NAME,
	src.PROVINCE,
	src.IS_ACTIVE,
	src.REP_CODE,
	src.TRADE_NAME,
	src.PORTAL_IDS,
	src.BEGIN_DT,
	src.END_DT,
	src.ADVISOR_BIRTH_DATE,
	src.REP_EMAIL,		 
	src.CBM, 			 
	src.BRANCH_ADDRESS1,	 
	src.BRANCH_ADDRESS2,	 
	src.BRANCH_CITY,		 
	src.BRANCH_POSTAL_CODE
FROM DB_IAW_'||ENV||'_STG.IAS_CERTS.VW_REGISTERED_REPRESENTATIVE_SPLIT src
              ';
INS_UPDATE :='
UPDATE DB_IAW_'||ENV||'_STG.IAS_CERTS.REGISTERED_REPRESENTATIVE
SET
	HK_HUB=SHA1(UPPER(CONCAT(''IAS'', ''|'', COALESCE(TRIM(RR_CD), ''#NULL#'')))),
	HK_SAT=SHA1(UPPER(CONCAT(TRIM(CID)))),
	MD_HASHDIFF=SHA1(UPPER(CONCAT(COALESCE(FIRST_NAME,''#NULL#''), ''|'', COALESCE(LAST_NAME,''#NULL#''), ''|'',
	COALESCE(LAST_NAME,''#NULL#''), ''|'', COALESCE(PRIMARY_ROLE,''#NULL#''), ''|'', COALESCE(RVP,''#NULL#''), ''|'' ,COALESCE(BRANCH_NRD,''#NULL#''),''|'',
	COALESCE(BRANCH_NAME,''#NULL#''), ''|'',COALESCE(PROVINCE,''#NULL#''),''|'',COALESCE(TO_CHAR(IS_ACTIVE),''#NULL#''),''|'',
	COALESCE(TRADE_NAME,''#NULL#''), ''|'', COALESCE(PORTAL_IDS,''#NULL#''),''|'',COALESCE(TO_CHAR(BEGIN_DT),''#NULL#''), ''|'', 
    COALESCE(TO_CHAR(END_DT),''#NULL#''), ''|'' ,COALESCE(TO_CHAR(ADVISOR_BIRTH_DATE),''#NULL#''),
    ''|'' ,COALESCE(REP_EMAIL,''#NULL#''), ''|'' ,	COALESCE(CBM,''#NULL#''), ''|'' , COALESCE(BRANCH_ADDRESS1,''#NULL#''), ''|'' ,	COALESCE(BRANCH_ADDRESS2,''#NULL#''), ''|'' ,
    COALESCE(BRANCH_CITY,''#NULL#''), ''|'' ,COALESCE(BRANCH_POSTAL_CODE,''#NULL#'')
    ))),
	MD_CREATION_DT=SYSTIMESTAMP(),
	MD_SRC_SYSTEM=''IAS_CERTS''
	Where 1=1
		';
EXECUTE IMMEDIATE :INS_PRE_DEL;
EXECUTE IMMEDIATE :INS_INSERT;
EXECUTE IMMEDIATE :INS_UPDATE;
END
$$;

create procedure IAS_COMMISSION.SP_INITIAL_LOAD_PSA_IAS_COMMISSION_TO_STG_TRANSACTION_REVENUES(ENV VARCHAR, IO_PATH VARCHAR)
    returns VARCHAR
    language SQL
    strict
as
$$
DECLARE
INS_PRE_QUERY STRING;
INS_COPY_QUERY STRING;
INS_UPDATE STRING;

BEGIN
INS_PRE_QUERY := 'DELETE FROM DB_IAW_'||ENV||'_STG.IAS_COMMISSION.TRANSACTION_REVENUES WHERE 1=1;';
INS_COPY_QUERY := '
COPY INTO DB_IAW_'||ENV||'_STG.IAS_COMMISSION.TRANSACTION_REVENUES
(
MD_START_DT, 
MD_SOURCE,
	TRANSID, 
	EXTTRANSID, 
	PROCESSDATE, 
	TRANSDATE, 
	SOURCECODE, 
	CANCELIND, 
	REPID, 
	CURRENCY, 
	EXCHANGERATE, 
	ENTRY_TYPE, 
	COMMISSION, 
	COMMISSIONCAD, 
	OVERRIDEIND, 
	ACCURATEIND, 
	DESCRIPTION, 
	NUMBEROFORDERS, 
	NETCOMMISSION, 
	TRANSFEE, 
	SHAREIND, 
	AFFECTGROSSCOMMIND, 
	REVENUEONLYIND, 
	NOTE, 
	REVNO, 
	STAMP, 
	USERID,
	MD_SRC_SYSTEM,
	MD_EXTRACT_DT,
	PROGRAM_TYPE,
	ACCOUNTID,
	QUANTITY,
	TRANSTYPE
) 
FROM
	(
	SELECT
		TO_DATE(t.$24), metadata$filename,t.$1,t.$2,t.$3,t.$4,t.$5,t.$6,t.$7,t.$8,t.$9,t.$10,t.$11,t.$12,t.$13,t.$14,t.$15,t.$16,t.$17,t.$18,t.$19,t.$20,t.$21,t.$22,t.$23,t.$24,t.$25,t.$26,t.$27,t.$28,t.$29,t.$30,t.$31
	FROM
		@DATALAKE.'||io_PATH||' T
	) pattern =''.*TRANSACTION_REVENUES__.*csv'' file_format=(format_name= DB_IAW_'||ENV||'_STG.IAS.PIPE_UTF16);
	';
INS_UPDATE := '
	UPDATE  DB_IAW_'||ENV||'_STG.IAS_COMMISSION.TRANSACTION_REVENUES
SET 
HK_LINK= SHA1(UPPER(CONCAT(COALESCE(TRIM(''IAS''), ''#NULL#''), ''|'' , COALESCE(TRIM(TRANSID), ''#NULL#''), ''|'' , COALESCE(TRIM(ACCOUNTID), ''#NULL#''), COALESCE(TRIM(TO_VARCHAR(PROCESSDATE)), ''#NULL#'' ) , COALESCE(TRIM(TO_VARCHAR(REPID)), ''#NULL#'' )  )) ),
HK_HUB_REGISTERED_REPRESENTATIVE =DECODE(TRUE, REPID IS NULL ,''0'',SHA1(UPPER(CONCAT(COALESCE(TRIM(''IAS''), ''#NULL#''), ''|'' , COALESCE(TRIM(REPID), ''#NULL#''))))),
HK_HUB_CONTRACT=DECODE(TRUE, ACCOUNTID IS NULL ,''0'',SHA1(UPPER(CONCAT(COALESCE(TRIM(''IAS''),''#NULL#''),''|'',COALESCE(TRIM(ACCOUNTID),''#NULL#''),''|'', ''#NULL#'' ,''|'', ''#NULL#'' )))),
MD_HASHDIFF = SHA1(CONCAT(	
COALESCE(EXTTRANSID,''#NULL#''), ''|'', 
COALESCE(TO_VARCHAR(TRANSDATE),''#NULL#''), ''|'',
COALESCE(SOURCECODE,''#NULL#''), ''|'', 
COALESCE(TO_VARCHAR(CANCELIND),''#NULL#''), ''|'',
COALESCE(CURRENCY,''#NULL#''), ''|'', 
COALESCE(TO_VARCHAR(EXCHANGERATE),''#NULL#''), ''|'',
COALESCE(ENTRY_TYPE,''#NULL#''), ''|'', 
COALESCE(TO_VARCHAR(COMMISSION),''#NULL#''), ''|'' ,
COALESCE(TO_VARCHAR(COMMISSIONCAD),''#NULL#''), ''|'' ,
COALESCE(TO_VARCHAR(OVERRIDEIND),''#NULL#''), ''|''  ,
COALESCE(TO_VARCHAR(ACCURATEIND),''#NULL#''), ''|''  ,
COALESCE(DESCRIPTION,''#NULL#''), ''|'', 
COALESCE(TO_VARCHAR(NUMBEROFORDERS),''#NULL#''), ''|''  ,
COALESCE(TO_VARCHAR(NETCOMMISSION),''#NULL#''), ''|''  ,
COALESCE(TO_VARCHAR(TRANSFEE),''#NULL#''), ''|''  ,
COALESCE(TO_VARCHAR(SHAREIND),''#NULL#''), ''|''  ,
COALESCE(TO_VARCHAR(AFFECTGROSSCOMMIND),''#NULL#''), ''|''  ,
COALESCE(TO_VARCHAR(REVENUEONLYIND),''#NULL#''), ''|''  ,
COALESCE(NOTE,''#NULL#''), ''|'', 
COALESCE(REVNO,''#NULL#''), ''|'', 
COALESCE(TO_VARCHAR(STAMP),''#NULL#''), ''|'',
COALESCE(USERID,''#NULL#''), ''|'', 
COALESCE(PROGRAM_TYPE,''#NULL#''), ''|'', 
COALESCE(TO_VARCHAR(QUANTITY),''#NULL#''), ''|'',
COALESCE(TO_VARCHAR(TRANSTYPE),''#NULL#'')
)),
MD_CREATION_DT=systimestamp()
Where 1=1';
	
EXECUTE IMMEDIATE :INS_PRE_QUERY;
EXECUTE IMMEDIATE :INS_COPY_QUERY;
EXECUTE IMMEDIATE :INS_UPDATE;
END
$$;

create procedure IAS_UNIVERIS.SP_LOADSTG_IAS_UNIVERIS_TO_STG_COM_PRODUCTION(ENV VARCHAR)
    returns VARCHAR
    language javascript
as
$$
var truncate_query = "TRUNCATE TABLE DB_IAW_" + ENV + "_stg.IAS_UNIVERIS.S_COM_PRODUCTION"; 

var sql_statement = snowflake.createStatement(
          {
          sqlText: truncate_query
          }
       );
var result_scan = sql_statement.execute();	
 var ins_query = "INSERT INTO DB_IAW_" + ENV + "_stg.IAS_UNIVERIS.S_COM_PRODUCTION(" 
                + "MD_START_DT,MD_SOURCE,COM_PRODUCTION_CD,COM_PRODUCTION_MNEM,COM_PRODUCTION_DESC,COM_PRODUCTION_LONG_DESC,COM_PRODUCTION_MNEM_ENG,COM_PRODUCTION_MNEM_FRE,COM_PRODUCTION_DESC_ENG,"
                + "COM_PRODUCTION_DESC_FRE,COM_PRODUCTION_LONG_DESC_ENG,COM_PRODUCTION_LONG_DESC_FRE,CRC_TRND_RPT_CAT,COMMISSION_LEVEL,CAC_TYPE_CD,ACC_REPORT_IND,MD_SRC_SYSTEM,MD_EXTRACT_DT) " 
               + "SELECT '2019-01-01','DB_IAW_PROD_STAGING_POCIA.IAS_UNIVERIS.S_COM_PRODUCTION',COM_PROD_CD,COM_PROD_MNEM,COM_PROD_DESC,COM_PROD_LONG_DESC,COM_PROD_MNEM_ENG,COM_PROD_MNEM_FRE,COM_PROD_DESC_ENG,"
                + "COM_PROD_DESC_FRE,COM_PROD_LONG_DESC_ENG,COM_PROD_LONG_DESC_FRE,CRC_TRND_RPT_CAT,COMMISSION_LEVEL,CAC_TYPE_CD,ACC_REPORT_IND,'IAS-UNIVERIS',TO_DATE(SYSTIMESTAMP())"
                + " FROM  DB_IAW_" + ENV + "_stg_pocia.IAS_UNIVERIS_POCIA.S_COM_PROD";
   
sql_statement = snowflake.createStatement(
          {
          sqlText: ins_query
          });
 result_scan = sql_statement.execute();	

$$;

create procedure IAS.SP_LOADSTG_PSA_IAS_COMMISSION_TO_STG_REVENUES(ENV VARCHAR, IO_PATH VARCHAR)
    returns VARCHAR
    language SQL
    strict
as
$$
DECLARE
INS_PRE_QUERY STRING;
INS_COPY_QUERY STRING;

BEGIN
INS_PRE_QUERY := 'DELETE FROM DB_IAW_'||ENV||'_STG.IAS_COMMISSION.REVENUES WHERE 1=1;';
INS_COPY_QUERY := '
COPY INTO DB_IAW_'||ENV||'_STG.IAS_COMMISSION.REVENUES
(
MD_START_DT,
MD_SOURCE,
	REPID ,
	ADVISOR_ID ,
	PROGRAM_TYPE ,
	ACCOUNTID ,
	PROCESSDATE ,
	SOURCECODE ,
	QUANTITY ,
	TRANSTYPE ,
	REVENUE ,
	COMMISSION ,
	NETCOMMISSION ,
	TRANSFEE,
	MD_SRC_SYSTEM,
	MD_EXTRACT_DT
)
FROM
	(
	SELECT
		TO_DATE(split_part(split_part(metadata$filename, ''__'', 2), ''.'', 0)), metadata$filename,t.$1,t.$2,t.$3,t.$4,t.$5,t.$6,t.$7,t.$8,t.$9,t.$10,t.$11,t.$12,t.$13,t.$14
	FROM
		@DATALAKE.'||io_PATH||' T
	) pattern =''.*REVENUES__.*csv'' file_format=(format_name=IAS.PIPE_UTF16);
              ';

EXECUTE IMMEDIATE :INS_PRE_QUERY;
EXECUTE IMMEDIATE :INS_COPY_QUERY;
END
$$;

create procedure IAS_COMMISSION.SP_LOADSTG_PSA_IAS_COMMISSION_TO_STG_REVENUES(ENV VARCHAR, IO_PATH VARCHAR)
    returns VARCHAR
    language SQL
    strict
as
$$
DECLARE
INS_PRE_QUERY STRING;
INS_COPY_QUERY STRING;

BEGIN
INS_PRE_QUERY := 'DELETE FROM DB_IAW_'||ENV||'_STG.IAS_COMMISSION.REVENUES WHERE 1=1;';
INS_COPY_QUERY := '
COPY INTO DB_IAW_'||ENV||'_STG.IAS_COMMISSION.REVENUES
(
MD_START_DT,
MD_SOURCE,
	REPID ,
	ADVISOR_ID ,
	PROGRAM_TYPE ,
	ACCOUNTID ,
	PROCESSDATE ,
	SOURCECODE ,
	QUANTITY ,
	TRANSTYPE ,
	REVENUE ,
	COMMISSION ,
	NETCOMMISSION ,
	TRANSFEE,
	MD_SRC_SYSTEM,
	MD_EXTRACT_DT
)
FROM
	(
	SELECT
		TO_DATE(split_part(split_part(metadata$filename, ''__'', 2), ''.'', 0)), metadata$filename,t.$1,t.$2,t.$3,t.$4,t.$5,t.$6,t.$7,t.$8,t.$9,t.$10,t.$11,t.$12,t.$13,t.$14
	FROM
		@DATALAKE.'||io_PATH||' T
	) pattern =''.*REVENUES_.*csv'' file_format=(format_name = DB_IAW_'||ENV||'_STG.IAS.PIPE_UTF16);
              ';

EXECUTE IMMEDIATE :INS_PRE_QUERY;
EXECUTE IMMEDIATE :INS_COPY_QUERY;
END
$$;

create procedure IAS_FUNDATA.SP_LOADSTG_PSA_IAS_FUNDATA_TO_STG_FUND(ENV VARCHAR, IO_PATH VARCHAR)
    returns VARCHAR
    language SQL
    strict
as
$$
DECLARE
INS_PRE_QUERY STRING;
INS_COPY_QUERY STRING;
BEGIN
INS_PRE_QUERY := 'DELETE FROM DB_IAW_'||ENV||'_STG.IAS_FUNDATA.FUND WHERE 1=1;';
INS_COPY_QUERY := '
COPY INTO
	DB_IAW_'||ENV||'_STG.IAS.IAS_FUNDATA.FUND (
	  MD_START_DT
	, MD_SOURCE
	, FUNDSERVID
	, FUNDID
	, FUNDDESCFR
	, FUNDDESCEN
	, FUNDTYPE
	, GROUPNAMEFR
	, GROUPNAMEEN
	, RRSPELIGIBLE
	, FUNDDESCLONGFR
	, FUNDDESCLONGEN
	, LEGALNAMEEN
	, LEGALNAMEFR
	, STAMP
	, MD_EXTRACT_DT
	, MD_SRC_SYSTEM)
FROM
	(
	SELECT
		TO_DATE(split_part(split_part(metadata$filename, ''__'', 2), ''.'', 0)),metadata$filename, t.$1, t.$2, t.$3, t.$4, t.$5, t.$6, t.$7, t.$8, t.$9, t.$10, t.$11, t.$12, t.$13, t.$14, t.$15
	FROM
		@DATALAKE.'||io_PATH||' T
	) pattern = ''.*/FUNDATA_.*csv'' file_format =(format_name = DB_IAW_'||ENV||'_STG.IAS.PIPE_UTF16);
              ';
EXECUTE IMMEDIATE :INS_PRE_QUERY;
EXECUTE IMMEDIATE :INS_COPY_QUERY;
END
$$;

create procedure IAS.SP_LOADSTG_PSA_IAS_NBIN_TO_STG_CASH_HOLDINGS(ENV VARCHAR, IO_PATH VARCHAR)
    returns VARCHAR
    language SQL
    strict
as
$$
DECLARE
INS_PRE_QUERY STRING;
INS_COPY_QUERY STRING;
BEGIN
INS_PRE_QUERY := 'DELETE FROM DB_IAW_'||ENV||'_STG.IAS.CASH_HOLDINGS WHERE 1=1;';
INS_COPY_QUERY := '
COPY INTO
	DB_IAW_'||ENV||'_STG.IAS.CASH_HOLDINGS (
	  MD_START_DT
	, MD_SOURCE
	, MD_SEQ
	, A_C_ID
	, A_C_CLIENT
	, A_C_REPRESENTATIVE
	, A_C_SUMM_BALANCE_BUS_DATE
	, A_C_SUMM_SD_NET_AMT
	, A_C_SUMM_TD_NET_AMT
	, A_C_CURRENCY
	, MD_EXTRACT_DT
	, MD_SRC_SYSTEM )
FROM
	(
	SELECT
		TO_DATE(split_part(split_part(metadata$filename, ''__'', 2), ''.'', 0)),metadata$filename, t.$1, t.$2, t.$3, t.$4, t.$5, t.$6, t.$7, t.$8
	FROM
		@DATALAKE.'||io_PATH||' T
	) pattern = ''.*/CASH_HOLDINGS_.*csv'' file_format =(format_name = DB_IAW_'||ENV||'_STG.IAS.PIPE_UTF16);
              ';
EXECUTE IMMEDIATE :INS_PRE_QUERY;
EXECUTE IMMEDIATE :INS_COPY_QUERY;
END
$$;

create procedure IAS.SP_LOADSTG_PSA_IAS_NBIN_TO_STG_CLIENTS(ENV VARCHAR)
    returns VARCHAR
    language javascript
as
$$

var UPD_QUERY = "UPDATE DB_IAW_"+ENV+"_STG.IAS.ACCOUNT_HOLDER SET \
				HK_HUB=SHA1(UPPER(CONCAT(COALESCE(TRIM(MD_SRC_SYSTEM), '#NULL#'), '|' , COALESCE(TRIM(A_C_CLIENT), '#NULL#')))), \
				MD_HASHDIFF=SHA1(CONCAT(COALESCE(SIN_HASH, '#NULL#'), '|' , COALESCE(TO_VARCHAR(CLIENT_BIRTH_DATE),'#NULL#'), '|', COALESCE(CLIENT_TAX_RECIP_TYPE,'#NULL#'), '|',  COALESCE(CLIENT_RESIDENCE, '#NULL#'), '|', COALESCE(CLIENT_RESIDENCE_REGION,'#NULL#'), '|', COALESCE(CLIENT_ANNUAL_GROSS_INC,'#NULL#'), '|', COALESCE(TO_VARCHAR(CLIENT_INIT_CONTRACT_DATE),'#NULL#'))), MD_CREATION_DT=SYSTIMESTAMP() Where 1=1;";

var sql_statement = snowflake.createStatement(
          {
          sqlText: UPD_QUERY
          }
       );
   var result_scan = sql_statement.execute();	
 
$$;

create procedure IAS.SP_LOADSTG_PSA_IAS_NBIN_TO_STG_HOLDINGS(ENV VARCHAR, IO_PATH VARCHAR)
    returns VARCHAR
    language SQL
    strict
as
$$
DECLARE
INS_PRE_QUERY STRING;
INS_COPY_QUERY STRING;

BEGIN
INS_PRE_QUERY := 'DELETE FROM DB_IAW_'||ENV||'_STG.IAS.HOLDINGS WHERE 1=1;';
INS_COPY_QUERY := '
COPY INTO
	DB_IAW_'||ENV||'_STG.IAS.HOLDINGS (
	  MD_START_DT
	, MD_SOURCE
	, MD_SEQ
	, A_C_ID
	, A_C_REPRESENTATIVE
	, TI_ALTERNATE_ID
	, TRAN_SUMM_CURR_MKT_VALUE
	, TRAN_SUMM_BUSINESS_DATE
	, TI_ALTERNATE_TI_TYPE
	, B_V_SECURITY_POSITION_VAL
	, B_V_SECURITY_POSITION_COS
	, TRAN_SUMM_AVG_UNIT_COST
	, TRAN_SUMM_NET_SETT_AMT
	, TRAN_SUMM_CURRENCY
	, TRAN_SUMM_SETT_QTY
	, TRAN_SUMM_TRADE_QTY
	, MD_EXTRACT_DT
	, MD_SRC_SYSTEM )
FROM
	(
	SELECT
		TO_DATE(split_part(split_part(metadata$filename, ''__'', 2), ''.'', 0)),metadata$filename, metadata$file_row_number,
		t.$1, t.$2, t.$3, t.$4, t.$5, t.$6, t.$7, t.$8, t.$9, t.$10, t.$11, t.$12, t.$13, t.$14, t.$15
	FROM
		@DATALAKE.'||io_PATH||' T
	) pattern = ''.*/HOLDINGS_.*csv'' file_format =(format_name = DB_IAW_'||ENV||'_STG.IAS.PIPE_UTF16);
              ';

EXECUTE IMMEDIATE :INS_PRE_QUERY;
EXECUTE IMMEDIATE :INS_COPY_QUERY;
END
$$;

create procedure PUBLIC.SP_LOADSTG_PSA_INVESTIA_UNIVERIS_TO_STG_WRAP_FEE(IO_PATH VARCHAR)
    returns VARCHAR
    language javascript
as $fun$
DECLARE
INS_PRE_DEL STRING;
INS_PRE_COPY STRING;
INS_QUERY STRING;
BEGIN
INS_PRE_DEL :='DELETE FROM DB_IAW_DEV_STG.INVESTIA_UNIVERIS.WRAP_FEE WHERE 1=1';
INS_PRE_COPY :='COPY INTO DB_IAW_DEV_STG.INVESTIA_UNIVERIS.WRAP_FEE
(
	MD_START_DT,
	MD_SOURCE,	
	WF_SYSID,
	BATCH_SYSID,
	STATUS_CD,
	CET_WF_SYSID,
	IVR_SYSID,
	WF_IND,
	PLN_SYSID,
	ACT_SYSID,
	OTX_SYSID,
	AVG_MV,
	CREATE_DT,
	FEE_AMT,
	FEE_GST,
	FEE_PST,
	FEE_TOTAL_AMT,
	DLR_SYSID,
	RGN_SYSID,
	BRN_SYSID,
	REP_SYSID,
	USR_SYSID,
	DESCRIPTION,
	LAST_UPD_DT,
	SRF_SYSID,
	OTHER_COM_SYSID,
	FISCAL_SYSID,
	PAYMENT_DT,
	MD_EXTRACT_DT,
	MD_SRC_SYSTEM
)
FROM
	(
	SELECT
		TO_DATE(split_part(split_part(metadata$filename, ''__'', 2), ''.'', 0)), metadata$filename,t.$1,t.$2,t.$3,t.$4,t.$5,t.$6,t.$7,t.$8,t.$9,t.$10,
		t.$11,t.$12,t.$13,t.$14,t.$15,t.$16,t.$17,t.$18,t.$19,t.$20,t.$21,t.$22,t.$23,t.$24,t.$25,t.$26,t.$27,t.$28
	FROM
		@DATALAKE.$$io_PATH T
	) pattern =''.*WRAP_FEE__.*csv'' file_format=(format_name=INVESTIA_UNIVERIS.PIPE_UTF16)';

INS_QUERY := '
UPDATE INVESTIA_UNIVERIS.WRAP_FEE
SET
HK_LINK= SHA1(UPPER(CONCAT(COALESCE(TRIM(MD_SRC_SYSTEM), ''#NULL#''), ''|'' ,
COALESCE(TO_VARCHAR(WF_SYSID), ''#NULL#''), ''|'' ,
COALESCE(TO_VARCHAR(PAYMENT_DT), ''#NULL#''), ''|'' ,
COALESCE(TO_VARCHAR(PLN_SYSID), ''#NULL#''), ''|'' ,
COALESCE(TO_VARCHAR(IVR_SYSID), ''#NULL#''), ''|'' ,
''#NULL#'', ''|'',
''#NULL#''))),
HK_HUB_CONTRACT=DECODE(TRUE, PLN_SYSID IS NULL AND IVR_SYSID IS NULL,''0'',SHA1(UPPER(CONCAT(COALESCE(TRIM(MD_SRC_SYSTEM),''#NULL#''), ''|'' ,''#NULL#'',''|'', COALESCE(TO_VARCHAR(PLN_SYSID),''#NULL#'')	,''|'', COALESCE(TO_VARCHAR(IVR_SYSID),''#NULL#''))))),
HK_HUB_INVESTMENT_PRODUCT_TYPE =''0'',
MD_HASHDIFF = SHA1(CONCAT(
	COALESCE(TO_VARCHAR(BATCH_SYSID),''#NULL#''), ''|'' ,
	COALESCE(STATUS_CD,''#NULL#''), ''|'',
	COALESCE(TO_VARCHAR(CET_WF_SYSID),''#NULL#''), ''|'' ,
	COALESCE(TO_VARCHAR(WF_IND),''#NULL#''), ''|'' ,
	COALESCE(TO_VARCHAR(ACT_SYSID),''#NULL#''), ''|'',
	COALESCE(TO_VARCHAR(OTX_SYSID),''#NULL#''), ''|'',
	COALESCE(TO_VARCHAR(AVG_MV),''#NULL#''), ''|'',
	COALESCE(TO_VARCHAR(CREATE_DT),''#NULL#''), ''|'',
	COALESCE(TO_VARCHAR(FEE_AMT),''#NULL#''), ''|'',
	COALESCE(TO_VARCHAR(FEE_GST),''#NULL#''), ''|'',
	COALESCE(TO_VARCHAR(FEE_PST),''#NULL#''), ''|'' ,
	COALESCE(TO_VARCHAR(FEE_TOTAL_AMT),''#NULL#''), ''|'',
	COALESCE(TO_VARCHAR(DLR_SYSID),''#NULL#''), ''|'',
	COALESCE(TO_VARCHAR(RGN_SYSID),''#NULL#''), ''|'',
	COALESCE(TO_VARCHAR(BRN_SYSID),''#NULL#''), ''|'',
	COALESCE(TO_VARCHAR(REP_SYSID),''#NULL#''), ''|'',
	COALESCE(TO_VARCHAR(USR_SYSID),''#NULL#''), ''|'',
	COALESCE(DESCRIPTION,''#NULL#''), ''|'',
	COALESCE(TO_VARCHAR(LAST_UPD_DT),''#NULL#''), ''|'',
	COALESCE(TO_VARCHAR(SRF_SYSID),''#NULL#''), ''|'',
	COALESCE(TO_VARCHAR(OTHER_COM_SYSID),''#NULL#''), ''|'',
	COALESCE(TO_VARCHAR(FISCAL_SYSID),''#NULL#''))),	
MD_CREATION_DT=systimestamp()
Where 1=1';

EXECUTE IMMEDIATE :INS_PRE_DEL STRING;
EXECUTE IMMEDIATE :INS_PRE_COPY STRING;
EXECUTE IMMEDIATE :INS_QUERY STRING;
END
$fun$;

create procedure INVESTIA.SP_STG_COUNT(JOB_NAME VARCHAR, DATA_START_DT VARCHAR, ENV VARCHAR, TBL_SCHEMA VARCHAR,
                                       TABLE_NAME VARCHAR)
    returns VARCHAR
    language javascript
as
$$
var cmd =  "SELECT COUNT(*) ROW_CNT FROM DB_IAWT_"+ENV+"_STG."+TBL_SCHEMA+"."+TABLE_NAME+ " WHERE MD_EXTRACT_DT  IS NOT NULL";
var st = snowflake.createStatement( { sqlText: cmd } );
var res = st.execute();
var op=''
while (res.next())  {
 op= res.getColumnValue(1);
 var cmd_upd = "UPDATE TOOLS.AUDIT_JOBS_EXECUTIONS SET JOB_ROW_COUNT =" + op + " WHERE JOB_NAME = '" + JOB_NAME + "' AND DATA_START_DT = '" + DATA_START_DT + "'";
   var st_upd = snowflake.createStatement( { sqlText: cmd_upd } );
   st_upd.execute();
 return op
}
;
$$;

create procedure IAS_COMMISSION.TEST1(ENV VARCHAR)
    returns VARCHAR
    language javascript
as
$$ -- missing source code
$$;

create procedure IAS.TEST1(ENV VARCHAR)
    returns VARCHAR
    language javascript
as
$$ -- missing source code
$$;

create procedure TOOLS.USP_AUDIT_START_JOB_NEXT_DATE(JOB_NAME VARCHAR, JOB_AUDIT_ID VARCHAR)
    returns VARCHAR
    language javascript
as
$$

//remove cotes
JOB_NAME= JOB_NAME.replace("'", "");
JOB_AUDIT_ID= JOB_AUDIT_ID.replace("'", "");

// Update status command
var cmdUpdStatus = "UPDATE TOOLS.AUDIT_JOBS_EXECUTIONS SET UPDATE_JOB_AUDIT_ID='"+JOB_AUDIT_ID+"', JOB_STATUS=";
var cmdUpdStatusWhereClause = " WHERE JOB_NAME ='" + JOB_NAME + "'";

// Check last execution
var cmd = "SELECT TOP 1 aje.DATA_START_DT::VARCHAR, aje.JOB_STATUS FROM TOOLS.AUDIT_JOBS_EXECUTIONS aje WHERE aje.JOB_NAME ='" + JOB_NAME + "' AND aje.JOB_STATUS IS NOT NULL AND aje.JOB_STATUS<>'' ORDER BY aje.DATA_START_DT DESC";
var st = snowflake.createStatement( { sqlText: cmd } );
var res = st.execute();


var stUpdStatus;
var resUpdStatus;


// A previous execution is found
if (res.next())
{
	var dtLastJobStart = res.getColumnValue(1);
	var strLastJobStatus = res.getColumnValue(2);

	//var cmdDG = "INSERT INTO TOOLS.DEBUG_LOG VALUES ('"+ dtLastJobStart +"')";
	//var stDG = snowflake.createStatement( { sqlText: cmdDG } );
	//var resDG = stDG.execute();

	// Job is executed before for the same date but without success 
	// => It is correct to re-execute it  
	if (strLastJobStatus != "SUCCESS" && strLastJobStatus != "IN PROGRESS")
	{
		cmdUpdStatus += "'IN PROGRESS',  JOB_ACTION_RESULT='SUCCESS', JOB_STATUS_DESC = COALESCE(JOB_STATUS_DESC,'') || CHAR(10) || '" + JOB_AUDIT_ID + "(' || CURRENT_TIMESTAMP() || ') START_JOB : Job restart. '" + cmdUpdStatusWhereClause + " AND DATA_START_DT='"+res.getColumnValue(1)+"'";	
		stUpdStatus = snowflake.createStatement( { sqlText: cmdUpdStatus } );
		resUpdStatus = stUpdStatus.execute();
		return res.getColumnValue(1);
	}
	else
	{
		// The last execution was successful
		// => Execute for next date
		if (strLastJobStatus == "SUCCESS")
		{
			// Check last execution
			var cmdNext = "SELECT TOP 1 aje.DATA_START_DT::VARCHAR, aje.JOB_STATUS FROM TOOLS.AUDIT_JOBS_EXECUTIONS aje WHERE aje.JOB_NAME ='" + JOB_NAME + "' AND DATA_START_DT>'"+res.getColumnValue(1)+"' ORDER BY aje.DATA_START_DT ASC";
			var stNext = snowflake.createStatement( { sqlText: cmdNext } );
			var resNext = stNext.execute();
			if (resNext.next())
			{


				//Check dependent jobs execution, if there are any
				var statementDep = snowflake.createStatement( { sqlText: "CALL TOOLS.USP_AUDIT_CHECK_DEPENDENT_JOBS('" + JOB_NAME + "','" + resNext.getColumnValue(1) + "')" } );
				var dependencyRslt = statementDep.execute();
				dependencyRslt.next();
				var dependencyMsg = dependencyRslt.getColumnValue(1);
				if(dependencyMsg != "1")
				{
				//throw dependencyMsg;
                
                cmdUpdStatus = "UPDATE TOOLS.AUDIT_JOBS_EXECUTIONS SET JOB_ACTION_RESULT='ERROR_04', JOB_STATUS_DESC = COALESCE(JOB_STATUS_DESC,'') || CHAR(10) || '"+JOB_AUDIT_ID+"<' || CURRENT_TIMESTAMP() || '> START_JOB ERROR_04 : "+ dependencyMsg +" '"+ cmdUpdStatusWhereClause + " AND DATA_START_DT='"+resNext.getColumnValue(1)+"'";	
				stUpdStatus = snowflake.createStatement( { sqlText: cmdUpdStatus } );
				resUpdStatus = stUpdStatus.execute();
				return "0000-00-00";
                
				}


				cmdUpdStatus += "'IN PROGRESS',  JOB_ACTION_RESULT='SUCCESS', JOB_STATUS_DESC = COALESCE(JOB_STATUS_DESC,'') || CHAR(10) || '"+JOB_AUDIT_ID+"<' || CURRENT_TIMESTAMP() || '> START_JOB : Job start. '" + cmdUpdStatusWhereClause + " AND DATA_START_DT='"+resNext.getColumnValue(1)+"'";	;
				stUpdStatus = snowflake.createStatement( { sqlText: cmdUpdStatus } );
				resUpdStatus = stUpdStatus.execute();
				return resNext.getColumnValue(1);
			}
		}
		// Already executing for this date (IN PROGRESS)
		// Error
		else
		{
			cmdUpdStatus = "UPDATE TOOLS.AUDIT_JOBS_EXECUTIONS SET JOB_ACTION_RESULT='ERROR_03', JOB_STATUS_DESC = COALESCE(JOB_STATUS_DESC,'') || CHAR(10) || '"+JOB_AUDIT_ID+"<' || CURRENT_TIMESTAMP() || '> START_JOB ERROR_03 : Trying to execute a running Job. '"+ cmdUpdStatusWhereClause + " AND DATA_START_DT='"+res.getColumnValue(1)+"'";	
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
	var cmdFirst = "SELECT TOP 1 aje.DATA_START_DT::VARCHAR, aje.JOB_STATUS FROM TOOLS.AUDIT_JOBS_EXECUTIONS aje WHERE aje.JOB_NAME ='" + JOB_NAME + "' ORDER BY aje.DATA_START_DT ASC";
	var stFirst = snowflake.createStatement( { sqlText: cmdFirst } );
	var resFirst = stFirst.execute();
	
	if (resFirst.next())
	{

                //Check dependent jobs execution, if there are any
				var statementDep = snowflake.createStatement( { sqlText: "CALL TOOLS.USP_AUDIT_CHECK_DEPENDENT_JOBS('" + JOB_NAME + "','" + resFirst.getColumnValue(1) + "')" } );
				var dependencyRslt = statementDep.execute();
				dependencyRslt.next();
				var dependencyMsg = dependencyRslt.getColumnValue(1);
				if(dependencyMsg != "1")
				{

				//throw dependencyMsg;

                cmdUpdStatus = "UPDATE TOOLS.AUDIT_JOBS_EXECUTIONS SET JOB_ACTION_RESULT='ERROR_04', JOB_STATUS_DESC = COALESCE(JOB_STATUS_DESC,'') || CHAR(10) || '"+JOB_AUDIT_ID+"<' || CURRENT_TIMESTAMP() || '> START_JOB ERROR_04 : "+ dependencyMsg +" '"+ cmdUpdStatusWhereClause + " AND DATA_START_DT='"+dependencyRslt.getColumnValue(1)+"'";	
				stUpdStatus = snowflake.createStatement( { sqlText: cmdUpdStatus } );
				resUpdStatus = stUpdStatus.execute();
				return "0000-00-00";
				}

		cmdUpdStatus += "'IN PROGRESS',  JOB_ACTION_RESULT='SUCCESS', JOB_STATUS_DESC = COALESCE(JOB_STATUS_DESC,'') || CHAR(10) || '"+JOB_AUDIT_ID+"<' || CURRENT_TIMESTAMP() || '> START_JOB : Job first start. '" + cmdUpdStatusWhereClause + " AND DATA_START_DT='"+resFirst.getColumnValue(1)+"'";
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

$$;

create procedure INVESTIA.USP_AUDIT_START_ONDEMAND_JOB(JOB_NAME VARCHAR, DATA_START_DT VARCHAR, JOB_AUDIT_ID VARCHAR)
    returns VARCHAR
    language javascript
as
$$
// Update status command
var cmdUpdStatus = "UPDATE TOOLS.AUDIT_JOBS_EXECUTIONS SET UPDATE_JOB_AUDIT_ID='"+JOB_AUDIT_ID+"', JOB_STATUS=";
var cmdUpdStatusWhereClause = " WHERE JOB_NAME ='" + JOB_NAME + "' AND DATA_START_DT = '"+DATA_START_DT+"'";
// Check last execution
var cmd = "SELECT TOP 1 aje.DATA_START_DT::VARCHAR, aje.JOB_STATUS, aje.DATA_NEXT_START_DT::VARCHAR FROM TOOLS.AUDIT_JOBS_EXECUTIONS aje WHERE aje.JOB_NAME ='" + JOB_NAME + "' AND aje.JOB_STATUS IS NOT NULL AND aje.JOB_STATUS<>'' AND aje.DATA_START_DT <= '"+DATA_START_DT+"' ORDER BY aje.DATA_START_DT DESC";
var st = snowflake.createStatement( { sqlText: cmd } );
var res = st.execute();
var stUpdStatus;
var resUpdStatus;
var InsCmd = "SELECT DISTINCT JOB_NAME FROM TOOLS.AUDIT_JOBS_EXECUTIONS aje WHERE aje.JOB_NAME ='" + JOB_NAME + "' AND aje.DATA_START_DT = '" + DATA_START_DT +"'";
var InsSt = snowflake.createStatement( { sqlText: InsCmd } );
var InsRes = InsSt.execute();

try
{   
if (InsRes.next())
{
    // A previous execution is found
    if (res.next())
    {
        var dtLastJobStart = res.getColumnValue(1);
        var strLastJobStatus = res.getColumnValue(2);
        var dtLastJobNextStart = res.getColumnValue(3);
        // Job is executed before for the same date but without success 
        // => It is correct to re-execute it  
        if (dtLastJobStart == DATA_START_DT && strLastJobStatus != "SUCCESS" && strLastJobStatus != "IN PROGRESS")
        {
            cmdUpdStatus += "'IN PROGRESS', JOB_ACTION_RESULT='SUCCESS',  JOB_STATUS_DESC = COALESCE(JOB_STATUS_DESC,'') || '" + JOB_AUDIT_ID + "(' || CURRENT_TIMESTAMP() || ') : Job restart. '" + cmdUpdStatusWhereClause; 
            stUpdStatus = snowflake.createStatement( { sqlText: cmdUpdStatus } );
            resUpdStatus = stUpdStatus.execute();
            return "IN PROGRESS";
        }
        else
        {
            // Job is not executed before with the same date
            if (dtLastJobStart < DATA_START_DT) 
            {
                //Check if the execution next start date is not skipped
                if (dtLastJobNextStart != DATA_START_DT)
                {
                    cmdUpdStatus += "'', JOB_ACTION_RESULT='ERROR_06', JOB_STATUS_DESC = COALESCE(JOB_STATUS_DESC,'') || '"+JOB_AUDIT_ID+"<' || CURRENT_TIMESTAMP() || '> ERROR_06 : The execution of "+dtLastJobNextStart +" image was skipped. '" + cmdUpdStatusWhereClause;
                    stUpdStatus = snowflake.createStatement( { sqlText: cmdUpdStatus } );
                    resUpdStatus = stUpdStatus.execute();
                    return "ERROR_06";
                }
                // The last execution was successful
                // => Execute for current date
                else if (strLastJobStatus == "SUCCESS")
                {
                    cmdUpdStatus += "'IN PROGRESS', JOB_ACTION_RESULT='SUCCESS', JOB_STATUS_DESC = COALESCE(JOB_STATUS_DESC,'') || '"+JOB_AUDIT_ID+"<' || CURRENT_TIMESTAMP() || '> : Job start. '" + cmdUpdStatusWhereClause;
                    stUpdStatus = snowflake.createStatement( { sqlText: cmdUpdStatus } );
                    resUpdStatus = stUpdStatus.execute();
                    return "IN PROGRESS";
                }
                // The last execution is not successful or not done
                // => Error
                else
                {
                    cmdUpdStatus += "'', JOB_ACTION_RESULT='ERROR_01', JOB_STATUS_DESC = COALESCE(JOB_STATUS_DESC,'') || '"+JOB_AUDIT_ID+"<' || CURRENT_TIMESTAMP() || '> ERROR_01 : The previous execution is not done or not successful. '" + cmdUpdStatusWhereClause;
                    stUpdStatus = snowflake.createStatement( { sqlText: cmdUpdStatus } );
                    resUpdStatus = stUpdStatus.execute();
                    return "ERROR_01";
                }
            }
            // Already successfully executed or executing for this date
            // => Error
            else
            {
                // Already successfully executed
                if (strLastJobStatus == "SUCCESS")
                {
                    cmdUpdStatus += "'SUCCESS', JOB_ACTION_RESULT='ERROR_02', JOB_STATUS_DESC = COALESCE(JOB_STATUS_DESC,'') || '"+JOB_AUDIT_ID+"<' || CURRENT_TIMESTAMP() || '> ERROR_02 : Trying to re-execute a successfully executed job. '" + cmdUpdStatusWhereClause;
                    stUpdStatus = snowflake.createStatement( { sqlText: cmdUpdStatus } );
                    resUpdStatus = stUpdStatus.execute();
                    return "ERROR_02";
                }
                // Already executing for this date (IN PROGRESS)
                else
                {
                    cmdUpdStatus += "'"+strLastJobStatus+"', JOB_ACTION_RESULT='ERROR_03', JOB_STATUS_DESC = COALESCE(JOB_STATUS_DESC,'') || '"+JOB_AUDIT_ID+"<' || CURRENT_TIMESTAMP() || '> ERROR_03 : Trying to execute a running Job. '"+ cmdUpdStatusWhereClause;
                    stUpdStatus = snowflake.createStatement( { sqlText: cmdUpdStatus } );
                    resUpdStatus = stUpdStatus.execute();
                    return "ERROR_03";
                }   
            }   
        }   
    }
    // First execution of the job : no previous job
    else
    {
        cmdUpdStatus += "'IN PROGRESS', JOB_ACTION_RESULT='SUCCESS', JOB_STATUS_DESC = COALESCE(JOB_STATUS_DESC,'') || '"+JOB_AUDIT_ID+"<' || CURRENT_TIMESTAMP() || '> : Job first start. '" + cmdUpdStatusWhereClause;
        stUpdStatus = snowflake.createStatement( { sqlText: cmdUpdStatus } );
        resUpdStatus = stUpdStatus.execute();
        return "IN PROGRESS";
    }
}
else
{
	return "ERROR_07";
}
}
// Technical error
catch(er)
{
    cmdUpdStatus = "UPDATE TOOLS.AUDIT_JOBS_EXECUTIONS SET UPDATE_JOB_AUDIT_ID='"+JOB_AUDIT_ID+"', JOB_STATUS=";
    cmdUpdStatus += "'ERROR', JOB_ACTION_RESULT='ERROR_04', JOB_STATUS_DESC = COALESCE(JOB_STATUS_DESC,'') || '"+JOB_AUDIT_ID+"<' || CURRENT_TIMESTAMP() || '> ERROR_04 : technical error :"+er+". '"+ cmdUpdStatusWhereClause;
    stUpdStatus = snowflake.createStatement( { sqlText: cmdUpdStatus } );
    resUpdStatus = stUpdStatus.execute();
    return "ERROR_04";  
return er;
}
cmdUpdStatus += "'ERROR', JOB_ACTION_RESULT='ERROR_05', JOB_STATUS_DESC = COALESCE(JOB_STATUS_DESC,'') || '"+JOB_AUDIT_ID+"<' || CURRENT_TIMESTAMP() || '>ERROR_05 : Unknown error. '"+ cmdUpdStatusWhereClause;
stUpdStatus = snowflake.createStatement( { sqlText: cmdUpdStatus } );
resUpdStatus = stUpdStatus.execute();
return "ERROR_05";  
$$;

create procedure TOOLS.USP_BWS_BUILD_DATAMART_PERSISTENT()
    returns VARCHAR
    language javascript
as
$$
//*************************************************************************************************************************************    
  // loading Persistent tables FUNDEX
//*************************************************************************************************************************************  

  var st = snowflake.createStatement( { sqlText: "insert into DB_IAW_DEV_STAGING.FUNDEX.HOLDINGS_P select * from  DB_IAW_DEV_STAGING.FUNDEX.HOLDINGS;" } );
  st.execute();

  var st = snowflake.createStatement( { sqlText: "insert into DB_IAW_DEV_STAGING.FUNDEX.ACCOUNTS_P select * from  DB_IAW_DEV_STAGING.FUNDEX.ACCOUNTS;" } );
  st.execute();
  
  var st = snowflake.createStatement( { sqlText: "insert into DB_IAW_DEV_STAGING.FUNDEX.ADVISORS_P select * from DB_IAW_DEV_STAGING.FUNDEX.ADVISORS ;" } );
  st.execute();

  var st = snowflake.createStatement( { sqlText: "insert into DB_IAW_DEV_STAGING.FUNDEX.CLIENTS_P select * from DB_IAW_DEV_STAGING.FUNDEX.CLIENTS ;" } );
  st.execute();

  var st = snowflake.createStatement( { sqlText: "insert into DB_IAW_DEV_STAGING.FUNDEX.COM_SRF_P select * from DB_IAW_DEV_STAGING.FUNDEX.COM_SRF ;" } );
  st.execute();

  var st = snowflake.createStatement( { sqlText: "insert into DB_IAW_DEV_STAGING.FUNDEX.COUNTRY_P select * from DB_IAW_DEV_STAGING.FUNDEX.COUNTRY ;" } );
  st.execute();

  var st = snowflake.createStatement( { sqlText: "insert into DB_IAW_DEV_STAGING.FUNDEX.MARKETPRODUCTS_P select * from DB_IAW_DEV_STAGING.FUNDEX.MARKETPRODUCTS ;" } );
  st.execute();

  var st = snowflake.createStatement( { sqlText: "insert into DB_IAW_DEV_STAGING.FUNDEX.PLANS_P select * from DB_IAW_DEV_STAGING.FUNDEX.PLANS ;" } );
  st.execute();

  var st = snowflake.createStatement( { sqlText: "insert into DB_IAW_DEV_STAGING.FUNDEX.PLN_SRF_P select * from DB_IAW_DEV_STAGING.FUNDEX.PLN_SRF ;" } );
  st.execute();

  var st = snowflake.createStatement( { sqlText: "insert into DB_IAW_DEV_STAGING.FUNDEX.PROVINCE_P select * from DB_IAW_DEV_STAGING.FUNDEX.PROVINCE ;" } );
  st.execute();

  var st = snowflake.createStatement( { sqlText: "insert into DB_IAW_DEV_STAGING.FUNDEX.REGISTERED_REPRESENTATIVE_P select * from DB_IAW_DEV_STAGING.FUNDEX.REGISTERED_REPRESENTATIVE ;" } );
  st.execute();

  var st = snowflake.createStatement( { sqlText: "insert into DB_IAW_DEV_STAGING.FUNDEX.REVENUES_P select * from DB_IAW_DEV_STAGING.FUNDEX.REVENUES ;" } );
  st.execute();

  var st = snowflake.createStatement( { sqlText: "insert into DB_IAW_DEV_STAGING.FUNDEX.REVENUE_PAYABLE_P select * from DB_IAW_DEV_STAGING.FUNDEX.REVENUE_PAYABLE ;" } );
  st.execute();

  var st = snowflake.createStatement( { sqlText: "insert into DB_IAW_DEV_STAGING.FUNDEX.TRANSACTIONS_P select * from DB_IAW_DEV_STAGING.FUNDEX.TRANSACTIONS ;" } );
  st.execute();

  var st = snowflake.createStatement( { sqlText: "insert into DB_IAW_DEV_STAGING.FUNDEX.WRAP_FEE_P select * from DB_IAW_DEV_STAGING.FUNDEX.WRAP_FEE ;" } );
  st.execute();

  var st = snowflake.createStatement( { sqlText: "insert into  DB_IAW_DEV_STAGING.FUNDEX.X_DBB_MASTER_REP_P select * from DB_IAW_DEV_STAGING.FUNDEX.X_DBB_MASTER_REP ;" } );
  st.execute();
  
//************************************************************************************************************************************* 
   //clearing Temporary tables FUNDEX  
//************************************************************************************************************************************* 

  var st = snowflake.createStatement( { sqlText: "TRUNCATE TABLE DB_IAW_DEV_STAGING.FUNDEX.ACCOUNTS;" } );
  st.execute();

  var st = snowflake.createStatement( { sqlText: "TRUNCATE TABLE DB_IAW_DEV_STAGING.FUNDEX.ADVISORS ;" } );
  st.execute();

  var st = snowflake.createStatement( { sqlText: "TRUNCATE TABLE DB_IAW_DEV_STAGING.FUNDEX.CLIENTS ;" } );
  st.execute();

  var st = snowflake.createStatement( { sqlText: "TRUNCATE TABLE DB_IAW_DEV_STAGING.FUNDEX.COM_SRF ;" } );
  st.execute();

  var st = snowflake.createStatement( { sqlText: "TRUNCATE TABLE DB_IAW_DEV_STAGING.FUNDEX.COUNTRY ;" } );
  st.execute();

  var st = snowflake.createStatement( { sqlText: "TRUNCATE TABLE DB_IAW_DEV_STAGING.FUNDEX.HOLDINGS ;" } );
  st.execute();

  var st = snowflake.createStatement( { sqlText: "TRUNCATE TABLE DB_IAW_DEV_STAGING.FUNDEX.MARKETPRODUCTS ;" } );
  st.execute();

  var st = snowflake.createStatement( { sqlText: "TRUNCATE TABLE DB_IAW_DEV_STAGING.FUNDEX.PLANS ;" } );
  st.execute();

  var st = snowflake.createStatement( { sqlText: "TRUNCATE TABLE DB_IAW_DEV_STAGING.FUNDEX.PLN_SRF ;" } );
  st.execute();

  var st = snowflake.createStatement( { sqlText: "TRUNCATE TABLE DB_IAW_DEV_STAGING.FUNDEX.PROVINCE ;" } );
  st.execute();

  var st = snowflake.createStatement( { sqlText: "TRUNCATE TABLE DB_IAW_DEV_STAGING.FUNDEX.REGISTERED_REPRESENTATIVE ;" } );
  st.execute();

  var st = snowflake.createStatement( { sqlText: "TRUNCATE TABLE DB_IAW_DEV_STAGING.FUNDEX.REVENUES ;" } );
  st.execute();

  var st = snowflake.createStatement( { sqlText: "TRUNCATE TABLE DB_IAW_DEV_STAGING.FUNDEX.REVENUE_PAYABLE ;" } );
  st.execute();

  var st = snowflake.createStatement( { sqlText: "TRUNCATE TABLE DB_IAW_DEV_STAGING.FUNDEX.TRANSACTIONS ;" } );
  st.execute();

  var st = snowflake.createStatement( { sqlText: "TRUNCATE TABLE DB_IAW_DEV_STAGING.FUNDEX.WRAP_FEE ;" } );
  st.execute();

  var st = snowflake.createStatement( { sqlText: "TRUNCATE TABLE DB_IAW_DEV_STAGING.FUNDEX.X_DBB_MASTER_REP ;" } );
  st.execute();
  

//*************************************************************************************************************************************   
//************************************************************************************************************************************* 
  // loading Persistent tables INVESTIA
//*************************************************************************************************************************************   
  
var st = snowflake.createStatement( { sqlText: "insert into DB_IAW_DEV_STAGING.INVESTIA.HOLDINGS_P select * from  DB_IAW_DEV_STAGING.INVESTIA.HOLDINGS;" } );
  st.execute();

  var st = snowflake.createStatement( { sqlText: "insert into DB_IAW_DEV_STAGING.INVESTIA.ACCOUNTS_P select * from  DB_IAW_DEV_STAGING.INVESTIA.ACCOUNTS;" } );
  st.execute();
  
  var st = snowflake.createStatement( { sqlText: "insert into DB_IAW_DEV_STAGING.INVESTIA.ADVISORS_P select * from DB_IAW_DEV_STAGING.INVESTIA.ADVISORS ;" } );
  st.execute();

  var st = snowflake.createStatement( { sqlText: "insert into DB_IAW_DEV_STAGING.INVESTIA.CLIENTS_P select * from DB_IAW_DEV_STAGING.INVESTIA.CLIENTS ;" } );
  st.execute();

  var st = snowflake.createStatement( { sqlText: "insert into DB_IAW_DEV_STAGING.INVESTIA.COM_SRF_P select * from DB_IAW_DEV_STAGING.INVESTIA.COM_SRF ;" } );
  st.execute();

  var st = snowflake.createStatement( { sqlText: "insert into DB_IAW_DEV_STAGING.INVESTIA.COUNTRY_P select * from DB_IAW_DEV_STAGING.INVESTIA.COUNTRY ;" } );
  st.execute();

  var st = snowflake.createStatement( { sqlText: "insert into DB_IAW_DEV_STAGING.INVESTIA.MARKETPRODUCTS_P select * from DB_IAW_DEV_STAGING.INVESTIA.MARKETPRODUCTS ;" } );
  st.execute();

  var st = snowflake.createStatement( { sqlText: "insert into DB_IAW_DEV_STAGING.INVESTIA.PLANS_P select * from DB_IAW_DEV_STAGING.INVESTIA.PLANS ;" } );
  st.execute();

  var st = snowflake.createStatement( { sqlText: "insert into DB_IAW_DEV_STAGING.INVESTIA.PLN_SRF_P select * from DB_IAW_DEV_STAGING.INVESTIA.PLN_SRF ;" } );
  st.execute();

  var st = snowflake.createStatement( { sqlText: "insert into DB_IAW_DEV_STAGING.INVESTIA.PROVINCE_P select * from DB_IAW_DEV_STAGING.INVESTIA.PROVINCE ;" } );
  st.execute();

  var st = snowflake.createStatement( { sqlText: "insert into DB_IAW_DEV_STAGING.INVESTIA.REGISTERED_REPRESENTATIVE_P select * from DB_IAW_DEV_STAGING.INVESTIA.REGISTERED_REPRESENTATIVE ;" } );
  st.execute();

  var st = snowflake.createStatement( { sqlText: "insert into DB_IAW_DEV_STAGING.INVESTIA.REVENUES_P select * from DB_IAW_DEV_STAGING.INVESTIA.REVENUES ;" } );
  st.execute();

  var st = snowflake.createStatement( { sqlText: "insert into DB_IAW_DEV_STAGING.INVESTIA.REVENUE_PAYABLE_P select * from DB_IAW_DEV_STAGING.INVESTIA.REVENUE_PAYABLE ;" } );
  st.execute();

  var st = snowflake.createStatement( { sqlText: "insert into DB_IAW_DEV_STAGING.INVESTIA.TRANSACTIONS_P select * from DB_IAW_DEV_STAGING.INVESTIA.TRANSACTIONS ;" } );
  st.execute();

  var st = snowflake.createStatement( { sqlText: "insert into DB_IAW_DEV_STAGING.INVESTIA.WRAP_FEE_P select * from DB_IAW_DEV_STAGING.INVESTIA.WRAP_FEE ;" } );
  st.execute();

  var st = snowflake.createStatement( { sqlText: "insert into  DB_IAW_DEV_STAGING.INVESTIA.X_DBB_MASTER_REP_P select * from DB_IAW_DEV_STAGING.INVESTIA.X_DBB_MASTER_REP ;" } );
  st.execute();
  
//************************************************************************************************************************************* 
   //clearing Temporary tables INVESTIA  
//************************************************************************************************************************************* 

  var st = snowflake.createStatement( { sqlText: "TRUNCATE TABLE DB_IAW_DEV_STAGING.INVESTIA.ACCOUNTS;" } );
  st.execute();

  var st = snowflake.createStatement( { sqlText: "TRUNCATE TABLE DB_IAW_DEV_STAGING.INVESTIA.ADVISORS ;" } );
  st.execute();

  var st = snowflake.createStatement( { sqlText: "TRUNCATE TABLE DB_IAW_DEV_STAGING.INVESTIA.CLIENTS ;" } );
  st.execute();

  var st = snowflake.createStatement( { sqlText: "TRUNCATE TABLE DB_IAW_DEV_STAGING.INVESTIA.COM_SRF ;" } );
  st.execute();

  var st = snowflake.createStatement( { sqlText: "TRUNCATE TABLE DB_IAW_DEV_STAGING.INVESTIA.COUNTRY ;" } );
  st.execute();

  var st = snowflake.createStatement( { sqlText: "TRUNCATE TABLE DB_IAW_DEV_STAGING.INVESTIA.HOLDINGS ;" } );
  st.execute();

  var st = snowflake.createStatement( { sqlText: "TRUNCATE TABLE DB_IAW_DEV_STAGING.INVESTIA.MARKETPRODUCTS ;" } );
  st.execute();

  var st = snowflake.createStatement( { sqlText: "TRUNCATE TABLE DB_IAW_DEV_STAGING.INVESTIA.PLANS ;" } );
  st.execute();

  var st = snowflake.createStatement( { sqlText: "TRUNCATE TABLE DB_IAW_DEV_STAGING.INVESTIA.PLN_SRF ;" } );
  st.execute();

  var st = snowflake.createStatement( { sqlText: "TRUNCATE TABLE DB_IAW_DEV_STAGING.INVESTIA.PROVINCE ;" } );
  st.execute();

  var st = snowflake.createStatement( { sqlText: "TRUNCATE TABLE DB_IAW_DEV_STAGING.INVESTIA.REGISTERED_REPRESENTATIVE ;" } );
  st.execute();

  var st = snowflake.createStatement( { sqlText: "TRUNCATE TABLE DB_IAW_DEV_STAGING.INVESTIA.REVENUES ;" } );
  st.execute();

  var st = snowflake.createStatement( { sqlText: "TRUNCATE TABLE DB_IAW_DEV_STAGING.INVESTIA.REVENUE_PAYABLE ;" } );
  st.execute();

  var st = snowflake.createStatement( { sqlText: "TRUNCATE TABLE DB_IAW_DEV_STAGING.INVESTIA.TRANSACTIONS ;" } );
  st.execute();

  var st = snowflake.createStatement( { sqlText: "TRUNCATE TABLE DB_IAW_DEV_STAGING.INVESTIA.WRAP_FEE ;" } );
  st.execute();

  var st = snowflake.createStatement( { sqlText: "TRUNCATE TABLE DB_IAW_DEV_STAGING.INVESTIA.X_DBB_MASTER_REP ;" } );
  st.execute();

//*************************************************************************************************************************************   
//************************************************************************************************************************************* 
  // loading Persistent tables IAS
//*************************************************************************************************************************************   
  
  var st = snowflake.createStatement( { sqlText: "insert into DB_IAW_DEV_STAGING.IAS.ACCOUNTS_P select * from DB_IAW_DEV_STAGING.IAS.ACCOUNTS;" } );
  st.execute();

  var st = snowflake.createStatement( { sqlText: "insert into DB_IAW_DEV_STAGING.IAS.CLIENTS_P select * from DB_IAW_DEV_STAGING.IAS.CLIENTS ;" } );
  st.execute();

  var st = snowflake.createStatement( { sqlText: "insert into DB_IAW_DEV_STAGING.IAS.EXCHANGERATE_P select * from DB_IAW_DEV_STAGING.IAS.EXCHANGERATE ;" } );
  st.execute();

  var st = snowflake.createStatement( { sqlText: "insert into DB_IAW_DEV_STAGING.IAS.HOLDINGS_P select * from DB_IAW_DEV_STAGING.IAS.HOLDINGS ;" } );
  st.execute();

  var st = snowflake.createStatement( { sqlText: "insert into DB_IAW_DEV_STAGING.IAS.MARKETPRODUCTS_P select * from DB_IAW_DEV_STAGING.IAS.MARKETPRODUCTS ;" } );
  st.execute();

  var st = snowflake.createStatement( { sqlText: "insert into DB_IAW_DEV_STAGING.IAS.PLANS_P select * from DB_IAW_DEV_STAGING.IAS.PLANS ;" } );
  st.execute();

  var st = snowflake.createStatement( { sqlText: "insert into DB_IAW_DEV_STAGING.IAS.REGISTERED_REPRESENTATIVE_P select * from DB_IAW_DEV_STAGING.IAS.REGISTERED_REPRESENTATIVE ;" } );
  st.execute();

  var st = snowflake.createStatement( { sqlText: "insert into DB_IAW_DEV_STAGING.IAS.TRANSACTIONS_P select * from DB_IAW_DEV_STAGING.IAS.TRANSACTIONS ;" } );
  st.execute();

//************************************************************************************************************************************* 
   //clearing Temporary tables IAS  
//************************************************************************************************************************************* 

  var st = snowflake.createStatement( { sqlText: "TRUNCATE TABLE DB_IAW_DEV_STAGING.IAS.ACCOUNTS;" } );
  st.execute();

  var st = snowflake.createStatement( { sqlText: "TRUNCATE TABLE DB_IAW_DEV_STAGING.IAS.CLIENTS;" } );
  st.execute();

  var st = snowflake.createStatement( { sqlText: "TRUNCATE TABLE DB_IAW_DEV_STAGING.IAS.EXCHANGERATE;" } );
  st.execute();

  var st = snowflake.createStatement( { sqlText: "TRUNCATE TABLE DB_IAW_DEV_STAGING.IAS.HOLDINGS;" } );
  st.execute();

  var st = snowflake.createStatement( { sqlText: "TRUNCATE TABLE DB_IAW_DEV_STAGING.IAS.MARKETPRODUCTS;" } );
  st.execute();

  var st = snowflake.createStatement( { sqlText: "TRUNCATE TABLE DB_IAW_DEV_STAGING.IAS.PLANS;" } );
  st.execute();

  var st = snowflake.createStatement( { sqlText: "TRUNCATE TABLE DB_IAW_DEV_STAGING.IAS.REGISTERED_REPRESENTATIVE;" } );
  st.execute();

  var st = snowflake.createStatement( { sqlText: "TRUNCATE TABLE DB_IAW_DEV_STAGING.IAS.TRANSACTIONS;" } );
  st.execute();

//************************************************************************************************************************************* 
  // loading Persistent tables IAS_CERTS
//*************************************************************************************************************************************   
  
  var st = snowflake.createStatement( { sqlText: "insert into DB_IAW_DEV_STAGING.IAS_CERTS.REGISTERED_REPRESENTATIVE_P select * from DB_IAW_DEV_STAGING.IAS_CERTS.REGISTERED_REPRESENTATIVE ;" } );
  st.execute();

//************************************************************************************************************************************* 
   //clearing Temporary tables IAS_CERTS  
//************************************************************************************************************************************* 

  var st = snowflake.createStatement( { sqlText: "TRUNCATE TABLE DB_IAW_DEV_STAGING.IAS_CERTS.REGISTERED_REPRESENTATIVE;" } );
  st.execute();

//************************************************************************************************************************************* 
  // loading Persistent tables IAS_COMMISSION
//*************************************************************************************************************************************   
  
  var st = snowflake.createStatement( { sqlText: "insert into DB_IAW_DEV_STAGING.IAS_COMMISSION.REGISTERED_REPRESENTATIVE_P select * from DB_IAW_DEV_STAGING.IAS_COMMISSION.REGISTERED_REPRESENTATIVE ;" } );
  st.execute();

  var st = snowflake.createStatement( { sqlText: "insert into DB_IAW_DEV_STAGING.IAS_COMMISSION.REVENUES_P select * from DB_IAW_DEV_STAGING.IAS_COMMISSION.REVENUES ;" } );
  st.execute();

  var st = snowflake.createStatement( { sqlText: "insert into DB_IAW_DEV_STAGING.IAS_COMMISSION.SHARE_P select * from DB_IAW_DEV_STAGING.IAS_COMMISSION.SHARE ;" } );
  st.execute();

//************************************************************************************************************************************* 
   //clearing Temporary tables IAS_COMMISSION  
//************************************************************************************************************************************* 

  var st = snowflake.createStatement( { sqlText: "TRUNCATE TABLE DB_IAW_DEV_STAGING.IAS_COMMISSION.REGISTERED_REPRESENTATIVE;" } );
  st.execute();

  var st = snowflake.createStatement( { sqlText: "TRUNCATE TABLE DB_IAW_DEV_STAGING.IAS_COMMISSION.REVENUES;" } );
  st.execute();

  var st = snowflake.createStatement( { sqlText: "TRUNCATE TABLE DB_IAW_DEV_STAGING.IAS_COMMISSION.SHARE;" } );
  st.execute();

//*************************************************************************************************************************************   
//************************************************************************************************************************************* 
  // loading Persistent tables IAS_UNIVERIS
//*************************************************************************************************************************************   
  
var st = snowflake.createStatement( { sqlText: "insert into DB_IAW_DEV_STAGING.IAS_UNIVERIS.HOLDINGS_P select * from  DB_IAW_DEV_STAGING.IAS_UNIVERIS.HOLDINGS;" } );
  st.execute();

  var st = snowflake.createStatement( { sqlText: "insert into DB_IAW_DEV_STAGING.IAS_UNIVERIS.ACCOUNTS_P select * from  DB_IAW_DEV_STAGING.IAS_UNIVERIS.ACCOUNTS;" } );
  st.execute();

  var st = snowflake.createStatement( { sqlText: "insert into DB_IAW_DEV_STAGING.IAS_UNIVERIS.CLIENTS_P select * from DB_IAW_DEV_STAGING.IAS_UNIVERIS.CLIENTS ;" } );
  st.execute();

  var st = snowflake.createStatement( { sqlText: "insert into DB_IAW_DEV_STAGING.IAS_UNIVERIS.COM_SRF_P select * from DB_IAW_DEV_STAGING.IAS_UNIVERIS.COM_SRF ;" } );
  st.execute();

  var st = snowflake.createStatement( { sqlText: "insert into DB_IAW_DEV_STAGING.IAS_UNIVERIS.COUNTRY_P select * from DB_IAW_DEV_STAGING.IAS_UNIVERIS.COUNTRY ;" } );
  st.execute();

  var st = snowflake.createStatement( { sqlText: "insert into DB_IAW_DEV_STAGING.IAS_UNIVERIS.MARKETPRODUCTS_P select * from DB_IAW_DEV_STAGING.IAS_UNIVERIS.MARKETPRODUCTS ;" } );
  st.execute();

  var st = snowflake.createStatement( { sqlText: "insert into DB_IAW_DEV_STAGING.IAS_UNIVERIS.PLANS_P select * from DB_IAW_DEV_STAGING.IAS_UNIVERIS.PLANS ;" } );
  st.execute();

  var st = snowflake.createStatement( { sqlText: "insert into DB_IAW_DEV_STAGING.IAS_UNIVERIS.PLN_SRF_P select * from DB_IAW_DEV_STAGING.IAS_UNIVERIS.PLN_SRF ;" } );
  st.execute();

  var st = snowflake.createStatement( { sqlText: "insert into DB_IAW_DEV_STAGING.IAS_UNIVERIS.PROVINCE_P select * from DB_IAW_DEV_STAGING.IAS_UNIVERIS.PROVINCE ;" } );
  st.execute();

  var st = snowflake.createStatement( { sqlText: "insert into DB_IAW_DEV_STAGING.IAS_UNIVERIS.REGISTERED_REPRESENTATIVE_P select * from DB_IAW_DEV_STAGING.IAS_UNIVERIS.REGISTERED_REPRESENTATIVE ;" } );
  st.execute();


  var st = snowflake.createStatement( { sqlText: "insert into DB_IAW_DEV_STAGING.IAS_UNIVERIS.REVENUE_PAYABLE_P select * from DB_IAW_DEV_STAGING.IAS_UNIVERIS.REVENUE_PAYABLE ;" } );
  st.execute();

  var st = snowflake.createStatement( { sqlText: "insert into DB_IAW_DEV_STAGING.IAS_UNIVERIS.TRANSACTIONS_P select * from DB_IAW_DEV_STAGING.IAS_UNIVERIS.TRANSACTIONS ;" } );
  st.execute();

 //************************************************************************************************************************************* 
   //clearing Temporary tables IAS_UNIVERIS  
//************************************************************************************************************************************* 

  var st = snowflake.createStatement( { sqlText: "TRUNCATE TABLE DB_IAW_DEV_STAGING.IAS_UNIVERIS.ACCOUNTS;" } );
  st.execute();


  var st = snowflake.createStatement( { sqlText: "TRUNCATE TABLE DB_IAW_DEV_STAGING.IAS_UNIVERIS.CLIENTS ;" } );
  st.execute();

  var st = snowflake.createStatement( { sqlText: "TRUNCATE TABLE DB_IAW_DEV_STAGING.IAS_UNIVERIS.COM_SRF ;" } );
  st.execute();

  var st = snowflake.createStatement( { sqlText: "TRUNCATE TABLE DB_IAW_DEV_STAGING.IAS_UNIVERIS.COUNTRY ;" } );
  st.execute();

  var st = snowflake.createStatement( { sqlText: "TRUNCATE TABLE DB_IAW_DEV_STAGING.IAS_UNIVERIS.HOLDINGS ;" } );
  st.execute();

  var st = snowflake.createStatement( { sqlText: "TRUNCATE TABLE DB_IAW_DEV_STAGING.IAS_UNIVERIS.MARKETPRODUCTS ;" } );
  st.execute();

  var st = snowflake.createStatement( { sqlText: "TRUNCATE TABLE DB_IAW_DEV_STAGING.IAS_UNIVERIS.PLANS ;" } );
  st.execute();

  var st = snowflake.createStatement( { sqlText: "TRUNCATE TABLE DB_IAW_DEV_STAGING.IAS_UNIVERIS.PLN_SRF ;" } );
  st.execute();

  var st = snowflake.createStatement( { sqlText: "TRUNCATE TABLE DB_IAW_DEV_STAGING.IAS_UNIVERIS.PROVINCE ;" } );
  st.execute();

  var st = snowflake.createStatement( { sqlText: "TRUNCATE TABLE DB_IAW_DEV_STAGING.IAS_UNIVERIS.REGISTERED_REPRESENTATIVE ;" } );
  st.execute();


  var st = snowflake.createStatement( { sqlText: "TRUNCATE TABLE DB_IAW_DEV_STAGING.IAS_UNIVERIS.REVENUE_PAYABLE ;" } );
  st.execute();

  var st = snowflake.createStatement( { sqlText: "TRUNCATE TABLE DB_IAW_DEV_STAGING.IAS_UNIVERIS.TRANSACTIONS ;" } );
  st.execute();


 

$$;

create procedure INVESTIA.USP_DLY_BATCH_RECOCILE_CHECK(NAME VARCHAR, DATA_START_DT VARCHAR, AUDIT_ID VARCHAR,
                                                       USE_PATTERN VARCHAR)
    returns VARCHAR
    language javascript
as
$$

//Stage 0: Check the Arguments Signature are Valid for the process to continue.
if ( NAME.length <= 0 || DATA_START_DT.length <= 0 )
{
return 0;
}

//Stage 1: Compose the string based on Use Pattern
	var ValCmd;
	if (USE_PATTERN==null)
	{
	ValCmd = " SELECT NAME, DESCRIPTION, QUERY,  CURRENT_DATABASE() FROM DB_IAW_DEV_DM.VALIDATIONS.RECONCILE_RULE_ENGINE WHERE NAME = '" + NAME + "' AND MD_END_DT IS NULL ";
	}
	else
	{
	ValCmd = " SELECT NAME, DESCRIPTION, QUERY,  CURRENT_DATABASE() FROM DB_IAW_DEV_DM.VALIDATIONS.RECONCILE_RULE_ENGINE WHERE NAME LIKE '%" + USE_PATTERN + "%' AND MD_END_DT IS NULL ";
	}

//Stage 2: Get the Rule query from the table object.
	var ValSt = snowflake.createStatement( { sqlText: ValCmd } );
	var ValRes = ValSt.execute();
	var name;
	var dbname;
	while (ValRes.next())
	{
		name = ValRes.getColumnValue(1);
		var desc = ValRes.getColumnValue(2);
		var query = ValRes.getColumnValue(3); //Stage 3: Search and replace place holder for Audit and Data Start Date.
			query = query.replace(/@DBNAME@/g, dbname);
			query = query.replace(/@NAME@/g, name);
			query = query.replace(/@DATA_START_DT@/g, DATA_START_DT);
			query = query.replace(/@AUDIT_ID@/g,AUDIT_ID); //Stage 4: Query fetched will be used to be executed for the final results.
		//return query
		var Val2Cmd = query;
		var Val2St = snowflake.createStatement( { sqlText: Val2Cmd } );
		var Val2Res = Val2St.execute();
	}
return 0;
$$;

create procedure TOOLS.USP_IAW_ADD_ENTITY_TABLE(SCHEMA_NAME VARCHAR, ENTITY_NAME VARCHAR, ENTITY_TYPE VARCHAR)
    returns VARCHAR
    language javascript
as
$$
var cmdTable = "CREATE ";
var cmd = "SELECT etp.ENTITY_TYPE_NAME_PATTERN, etp.ENTITY_OPTIONS_PATTERN FROM TOOLS.ENTITY_TYPES_PATTERNS etp WHERE etp.ENTITY_TYPE_ID ='" + ENTITY_TYPE + "'";
var st = snowflake.createStatement( { sqlText: cmd } );
var res = st.execute();
if (res.next())
{
	// Build table name
	var strEntityNamePattern = res.getColumnValue(1);
	strEntityNamePattern = strEntityNamePattern.replace("{ENTITY}", ENTITY_NAME);
	var strEntityOptPattern = res.getColumnValue(2);
	strEntityOptPattern = strEntityOptPattern.replace("{ENTITY}", ENTITY_NAME);
	cmdTable += strEntityOptPattern + " TABLE " + SCHEMA_NAME + ".";
	cmdTable += strEntityNamePattern + "(";
	
	// Add columns to the create statement
	var cmdCol = "SELECT COLUMN_NAME_PATTERN, COLUMN_TYPE_PATTERN, COLUMN_OPTIONS_PATTERN, COLUMN_COMMENTS_PATTERN FROM TOOLS.ENTITY_TYPES_COLUMNS_PATTERNS WHERE ENTITY_TYPE_ID='"+ENTITY_TYPE+"' ORDER BY COLUMN_ORDER";
	var stCol = snowflake.createStatement( { sqlText: cmdCol } );
	var resCol = stCol.execute();

	var i = 0
	// Loop over columns to add to the table
	while(resCol.next())
	{
		if (i>0) { cmdTable += ", " }
		var strColName = resCol.getColumnValue(1);
		strColName = strColName.replace("{ENTITY}", ENTITY_NAME);
		var strColType = resCol.getColumnValue(2);
		var strColOpt = resCol.getColumnValue(3);
		var strColCom = resCol.getColumnValue(4);
		cmdTable += strColName + " " + strColType + " " + strColOpt + " COMMENT '" + strColCom + "'";
		i += 1;  
	}
	cmdTable += ")"
	var stTable = snowflake.createStatement( { sqlText: cmdTable } );
	
	// Execute table DDL
	try
	{
		stTable.execute();
		return "Table <" + SCHEMA_NAME +"."+strEntityNamePattern + "> added.";
	}
	catch(er)
	{
		return "Error While adding table : " + cmdTable + " Error : " + er; 
	}
	
}
else
{
	return "Entity type <" + ENTITY_TYPE + "> not found!";
}

$$;

create procedure INVESTIA.USP_VALIDATION_CHECK(NAME VARCHAR, DATA_START_DT VARCHAR, AUDIT_ID VARCHAR)
    returns VARCHAR
    language javascript
as
$$
var InsCmd = "SELECT COUNT (0) FROM DB_IAW_DEV_DM.VALIDATIONS.VAL_DEFINITIONS WHERE NAME ='" + NAME + "'";
var InsSt = snowflake.createStatement( { sqlText: InsCmd } );
var InsRes = InsSt.execute();
// throw an error if checking integrity is not applicable (wrong database name)
if ((InsRes == 0))
{
	var error = 'QUERY  for ' + NAME  + ' is not available.';
	throw error;
}
var i;
var ERROR_MSG = '';
var queries_dv = [ `SELECT QUERY FROM DB_IAW_DEV_DM.VALIDATIONS.VAL_DEFINITIONS WHERE JOB_NAME ='" + NAME + "'` ];
for (i = 0; i < queries_dv.length; i++) {
		var RESULT_RI_ISSUES = snowflake.createStatement( {sqlText: queries_dv[i] } );
		var FINAL_RESULT = RESULT_RI_ISSUES.execute();
	}
var dec = "VALIDATION CHECK FOR " + NAME + " " + DATA_START_DT + " IS SUCCESSFUL";
return dec ;
  $$;

create file format INVESTIA.CSV_PIPE
    type = CSV
        FIELD_DELIMITER = '|'
        VALIDATE_UTF8 = false;

create file format FUNDEX.CSV_PIPE
    type = CSV
        FIELD_DELIMITER = '|';

create file format STEWARDSHIP.CSV_UTF8
    type = CSV
        FIELD_DELIMITER = ';';

create file format EXTERNAL_KPI.CSV_UTF8
    type = CSV
        FIELD_DELIMITER = ';'
        NULL_IF = ('NULL', '')
        SKIP_HEADER = 1;

create file format IAS.JSON_FORMAT
    type = JSON
        NULL_IF = ('');

create file format IAPW_PORTAL_API.JSON_FORMAT
    type = JSON
        NULL_IF = ('');

create file format IAS.META_CSV_FILE_FORMAT
    type = CSV;

create file format INVESTIA_UNIVERIS.MY_CSV_FORMAT
    type = CSV
        ENCODING = 'UTF16'
        ESCAPE = '\\'
        FIELD_DELIMITER = '|'
        NULL_IF = ('NULL', 'null')
        SKIP_HEADER = 1;

create file format INVESTIA.PIPE_UTF16
    type = CSV
        ESCAPE = '\\'
        FIELD_DELIMITER = '|';

create file format IAS_IAVM.PIPE_UTF16
    type = CSV
        ENCODING = 'UTF-16'
        ESCAPE_UNENCLOSED_FIELD = 'NONE'
        FIELD_DELIMITER = '|'
        NULL_IF = ('0000-00-00');

create file format FUNDEX.PIPE_UTF16
    type = CSV
        ENCODING = 'UTF16'
        ESCAPE = '\\'
        FIELD_DELIMITER = '|';

create file format IAS_CERTS.PIPE_UTF16
    type = CSV
        ENCODING = 'UTF-16'
        ESCAPE_UNENCLOSED_FIELD = 'NONE'
        FIELD_DELIMITER = '|'
        NULL_IF = ('0000-00-00');

create file format IAS_UNIVERIS.PIPE_UTF16
    type = CSV
        ENCODING = 'UTF-16'
        ESCAPE_UNENCLOSED_FIELD = 'NONE'
        FIELD_DELIMITER = '|'
        NULL_IF = ('0000-00-00');

create file format FUNDATA.PIPE_UTF16
    type = CSV
        FIELD_DELIMITER = '|';

create file format STEWARDSHIP.PIPE_UTF16
    type = CSV
        ENCODING = 'UTF-16'
        ESCAPE_UNENCLOSED_FIELD = 'NONE'
        FIELD_DELIMITER = '|'
        NULL_IF = ('0000-00-00');

create file format IAS_COMMISSION.PIPE_UTF16
    type = CSV
        ENCODING = 'UTF-16'
        ESCAPE_UNENCLOSED_FIELD = 'NONE'
        FIELD_DELIMITER = '|'
        NULL_IF = ('0000-00-00');

create file format INVESTIA_UNIVERIS.PIPE_UTF16
    type = CSV
        FIELD_DELIMITER = '|';

create file format IAS.PIPE_UTF16
    type = CSV
        ENCODING = 'UTF-16'
        ESCAPE_UNENCLOSED_FIELD = 'NONE'
        FIELD_DELIMITER = '|'
        NULL_IF = ('0000-00-00');

create file format IAS_FUNDATA.PIPE_UTF16
    type = CSV
        ENCODING = 'UTF-16'
        ESCAPE_UNENCLOSED_FIELD = 'NONE'
        FIELD_DELIMITER = '|'
        NULL_IF = ('0000-00-00');

create file format IAS_COMMISSION.PIPE_UTF8
    type = CSV
        FIELD_DELIMITER = '|';

