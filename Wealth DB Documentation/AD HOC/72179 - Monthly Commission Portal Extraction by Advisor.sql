set
    my_date = to_date('2022-01-04');
set
    this_month = month($my_date);
set
    last_month = month(dateadd(month, -1, $my_date));
set
    this_year = year($my_date);
set
    last_year = $this_year - 1;

WITH LatestVersionAdvisors as (
        select
            master_code,
            team_name,
            advisor_fullname
        from
            DB_IAW_ACCP_DM.SHARED.DIM_ADVISOR
        where
            HK_HUB <> '0'
            and new_advisor <> 1  
            and md_start_dt <= $my_date QUALIFY ROW_NUMBER() OVER (
                PARTITION BY HK_HUB
                ORDER BY
                    MD_START_DT DESC
            ) = 1
    ),
    ThisMonthReport AS (
        SELECT
            A.MASTER_CODE,
            coalesce(
                sum(
                    DECODE(FT.CASH_FLOW_TYPE, 'IN FLOW', FT.GROSS_AMOUNT)
                ),
                0
            ) InflowGrossAmt,
            coalesce(
                sum(
                    DECODE(FT.CASH_FLOW_TYPE, 'OUT FLOW', FT.GROSS_AMOUNT)
                ),
                0
            ) OutflowGrossAmt,
            InflowGrossAmt + OutflowGrossAmt AS "Net Organic Growth"
        FROM
            DB_IAW_ACCP_DM."SHARED".DIM_ADVISOR A
            JOIN DB_IAW_ACCP_DM."TRANSACTIONS".FACT_TRANSACTIONS FT ON FT.SK_DIM_ADVISORS = A.ID
        where
            month(FT.TRADE_DATE) = $this_month
            and year(FT.trade_date) = $this_year
            and A.new_advisor <> 1
            and ft.departed_advisor_ind <> 1
        GROUP BY
            A.MASTER_CODE 
    ),
    LastMonthReport AS (
        SELECT
            A.MASTER_CODE,
            coalesce(
                sum(
                    DECODE(FT.CASH_FLOW_TYPE, 'IN FLOW', FT.GROSS_AMOUNT) 
                ),
                0
            ) InflowGrossAmt,
            coalesce(
                sum(
                    DECODE(FT.CASH_FLOW_TYPE, 'OUT FLOW', FT.GROSS_AMOUNT)
                ),
                0
            ) OutflowGrossAmt,
            InflowGrossAmt + OutflowGrossAmt AS "Net Organic Growth"
        FROM
            DB_IAW_ACCP_DM."SHARED".DIM_ADVISOR A
            JOIN DB_IAW_ACCP_DM."TRANSACTIONS".FACT_TRANSACTIONS FT ON FT.SK_DIM_ADVISORS = A.ID
        where
            month(FT.TRADE_DATE) = $last_month
            and year(FT.trade_date) = $last_year
            and A.new_advisor <> 1
            and ft.departed_advisor_ind <> 1
        GROUP BY
            A.MASTER_CODE
    ),
    YTDReport AS (
        SELECT
            A.MASTER_CODE,
            coalesce(
                sum(
                    DECODE(FT.CASH_FLOW_TYPE, 'IN FLOW', FT.GROSS_AMOUNT)
                ),
                0
            ) YTD_Inflow_GrossAmt,
            coalesce(
                sum(
                    DECODE(FT.CASH_FLOW_TYPE, 'OUT FLOW', FT.GROSS_AMOUNT)
                ),
                0
            ) YTD_Outflow_GrossAmt,
            YTD_Inflow_GrossAmt + YTD_Outflow_GrossAmt AS "YTD Net Organic Growth"
        FROM
            DB_IAW_ACCP_DM."SHARED".DIM_ADVISOR A
            JOIN DB_IAW_ACCP_DM."TRANSACTIONS".FACT_TRANSACTIONS FT ON FT.SK_DIM_ADVISORS = A.ID
        where
            month(FT.TRADE_DATE) <= $this_month
            and year(FT.trade_date) = $this_year
            and A.new_advisor <> 1
            and ft.departed_advisor_ind <> 1
        GROUP BY
            A.MASTER_CODE
    ),
    PrevYTDReport AS (
        SELECT
            A.MASTER_CODE,
            coalesce(
                sum(
                    DECODE(FT.CASH_FLOW_TYPE, 'IN FLOW', FT.GROSS_AMOUNT)
                ),
                0
            ) YTD_Inflow_GrossAmt,
            coalesce(
                sum(
                    DECODE(FT.CASH_FLOW_TYPE, 'OUT FLOW', FT.GROSS_AMOUNT)
                ),
                0
            ) YTD_Outflow_GrossAmt,
            YTD_Inflow_GrossAmt + YTD_Outflow_GrossAmt AS "YTD Net Organic Growth"
        FROM
            DB_IAW_ACCP_DM."SHARED".DIM_ADVISOR A
            JOIN DB_IAW_ACCP_DM."TRANSACTIONS".FACT_TRANSACTIONS FT ON FT.SK_DIM_ADVISORS = A.ID
        where
            month(FT.TRADE_DATE) <= $this_month
            and year(FT.trade_date) = $last_year
            and A.new_advisor <> 1
            and ft.departed_advisor_ind <> 1
        GROUP BY
            A.MASTER_CODE
    )
Select resultat.*,
   dense_rank() over( order by "YTD Net Organic Growth / Team" desc ) as "Team Rank"
    from (  
        Select
            LTV.MASTER_CODE,
            LTV.TEAM_NAME,
            LTV.advisor_fullname,
            coalesce(TM.InflowGrossAmt,0) AS MONTH_IN_FLOW,
            coalesce(TM.OutFlowGrossAmt,0) AS MONTH_OUT_FLOW,
            coalesce(TM."Net Organic Growth",0) AS "Actual Monthly Net Organic Growth",
            coalesce(LM."Net Organic Growth",0) AS "Prev Monthly Net Organic Growth",
            "Actual Monthly Net Organic Growth" - "Prev Monthly Net Organic Growth" AS "Month over Month growth ($)",
            coalesce(round(
                (
                    (
                        "Actual Monthly Net Organic Growth" - "Prev Monthly Net Organic Growth"
                    ) / nullif(abs("Prev Monthly Net Organic Growth"), 0) * 100
                ),
                2
            ),0) as "Month over Month growth (%)",
            coalesce(YTD.YTD_Inflow_GrossAmt,0) as YTD_Inflow_GrossAmt, 
            coalesce(YTD.YTD_Outflow_GrossAmt,0) as YTD_Outflow_GrossAmt,
            coalesce(YTD."YTD Net Organic Growth",0) as YTD_Net_Organic_Growth,
            coalesce(PYTD."YTD Net Organic Growth",0) as Previous_YTD_Net_Organic_Growth,
            YTD_Net_Organic_Growth - Previous_YTD_Net_Organic_Growth as "YTD Period over period growth ($)",
            coalesce(round(
                (
                    (
                        YTD_Net_Organic_Growth - Previous_YTD_Net_Organic_Growth
                    ) / nullif(abs(Previous_YTD_Net_Organic_Growth), 0) * 100
                ),
                2
            ),0) as "YTD Period over period growth (%)",
            sum (YTD_Net_Organic_Growth) over (partition by  LTV.team_name) as "YTD Net Organic Growth / Team"    
        from
            LatestVersionAdvisors LTV
            left join THISMONTHREPORT TM on LTV.MASTER_CODE = TM.MASTER_CODE
            left join LASTMONTHREPORT LM  on LTV.MASTER_CODE = LM.MASTER_CODE 
            left join YTDReport YTD on LTV.MASTER_CODE = YTD.MASTER_CODE
            left join PREVYTDREPORT PYTD on LTV.MASTER_CODE = PYTD.MASTER_CODE
      
    ) as resultat ;
    
