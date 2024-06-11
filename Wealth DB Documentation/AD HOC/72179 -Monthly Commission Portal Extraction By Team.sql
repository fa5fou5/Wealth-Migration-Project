SET START_DATE = '2022-05-03';
WITH LatestVersionAdvisors AS (
		SELECT distinct 
			team_name
		FROM DB_IAW_PROD_DM.SHARED.DIM_ADVISOR
		WHERE (
            HK_HUB <> '0'
            AND new_advisor <> 1
             --AND month(md_start_dt) = month(dateadd(months, - 1, to_date($START_DATE)))
			AND year (md_start_dt) = year(to_date($START_DATE))  -- Consider only the team members of this year
            )
            OR  (md_end_dt is null and HK_HUB <> '0')
		)
	,ThisMonthReport AS (
		SELECT A.TEAM_NAME
			,coalesce(sum(DECODE(FT.CASH_FLOW_TYPE, 'IN FLOW', FT.GROSS_AMOUNT)), 0) InflowGrossAmt
			,coalesce(sum(DECODE(FT.CASH_FLOW_TYPE, 'OUT FLOW', FT.GROSS_AMOUNT)), 0) OutflowGrossAmt
			,InflowGrossAmt + OutflowGrossAmt AS NetOrganicGrowth
		FROM DB_IAW_PROD_DM.SHARED.DIM_ADVISOR A
		JOIN DB_IAW_PROD_DM.TRANSACTIONS.FACT_TRANSACTIONS FT ON FT.SK_DIM_ADVISORS = A.ID
		WHERE month(FT.TRADE_DATE) = month(dateadd(months, - 1, to_date($START_DATE)))
			AND year(FT.trade_date) = year(to_date($START_DATE))
			AND A.new_advisor <> 1
			AND ft.departed_advisor_ind <> 1
		GROUP BY A.TEAM_NAME
		)
	,LastMonthReport AS (
		SELECT
            A.TEAM_NAME
			,coalesce(sum(DECODE(FT.CASH_FLOW_TYPE, 'IN FLOW', FT.GROSS_AMOUNT)), 0) InflowGrossAmt
			,coalesce(sum(DECODE(FT.CASH_FLOW_TYPE, 'OUT FLOW', FT.GROSS_AMOUNT)), 0) OutflowGrossAmt
			,InflowGrossAmt + OutflowGrossAmt AS NetOrganicGrowth
		FROM DB_IAW_PROD_DM.SHARED.DIM_ADVISOR A
		JOIN DB_IAW_PROD_DM.TRANSACTIONS.FACT_TRANSACTIONS FT ON FT.SK_DIM_ADVISORS = A.ID
		WHERE month(FT.TRADE_DATE) = month(dateadd(months, - 2, to_date($START_DATE)))
			AND year(FT.trade_date) = year(dateadd(months, - 2, to_date($START_DATE)))
			AND A.new_advisor <> 1
			AND ft.departed_advisor_ind <> 1
		GROUP BY A.TEAM_NAME
		)
	,YTDReport AS (
		SELECT 
            A.TEAM_NAME
			,coalesce(sum(DECODE(FT.CASH_FLOW_TYPE, 'IN FLOW', FT.GROSS_AMOUNT)), 0) YTD_Inflow_GrossAmt
			,coalesce(sum(DECODE(FT.CASH_FLOW_TYPE, 'OUT FLOW', FT.GROSS_AMOUNT)), 0) YTD_Outflow_GrossAmt
			,YTD_Inflow_GrossAmt + YTD_Outflow_GrossAmt AS YTDNetOrganicGrowth
		FROM DB_IAW_PROD_DM.SHARED.DIM_ADVISOR A
		JOIN DB_IAW_PROD_DM.TRANSACTIONS.FACT_TRANSACTIONS FT ON FT.SK_DIM_ADVISORS = A.ID
		WHERE month(FT.TRADE_DATE) <= month(dateadd(months, - 1, to_date($START_DATE)))
			AND year(FT.trade_date) = year(to_date($START_DATE))
			AND A.new_advisor <> 1
			AND ft.departed_advisor_ind <> 1
		GROUP BY A.TEAM_NAME
		)
	,PrevYTDReport AS (
		SELECT 
            A.TEAM_NAME
			,coalesce(sum(DECODE(FT.CASH_FLOW_TYPE, 'IN FLOW', FT.GROSS_AMOUNT)), 0) YTD_Inflow_GrossAmt
			,coalesce(sum(DECODE(FT.CASH_FLOW_TYPE, 'OUT FLOW', FT.GROSS_AMOUNT)), 0) YTD_Outflow_GrossAmt
			,YTD_Inflow_GrossAmt + YTD_Outflow_GrossAmt AS YTDNetOrganicGrowth
		FROM DB_IAW_PROD_DM.SHARED.DIM_ADVISOR A
		JOIN DB_IAW_PROD_DM.TRANSACTIONS.FACT_TRANSACTIONS FT ON FT.SK_DIM_ADVISORS = A.ID
		WHERE month(FT.TRADE_DATE) <= month(dateadd(months, - 1, to_date($START_DATE)))
			AND year(FT.trade_date) = year(dateadd(years, - 1, to_date($START_DATE)))
			AND A.new_advisor <> 1
			AND ft.departed_advisor_ind <> 1
		GROUP BY A.TEAM_NAME 
		)

SELECT DISTINCT dense_rank() OVER (
		ORDER BY YTD_Net_Organic_Growth_By_Team DESC
		) AS Team_Rank
	,resultat.team_name
	,resultat.Monthly_Net_Organic_Growth_By_Team
	,resultat.YTD_Net_Organic_Growth_By_Team
FROM (
	SELECT
		LTV.TEAM_NAME
		,coalesce(TM.InflowGrossAmt, 0) AS MONTH_IN_FLOW
		,coalesce(TM.OutFlowGrossAmt, 0) AS MONTH_OUT_FLOW
		,coalesce(TM.NetOrganicGrowth, 0) AS Actual_Monthly_Net_Organic_Growth
		,coalesce(LM.NetOrganicGrowth, 0) AS Prev_Monthly_Net_Organic_Growth
		,Actual_Monthly_Net_Organic_Growth - Prev_Monthly_Net_Organic_Growth AS Month_over_Month_growth
		,coalesce(round(((Actual_Monthly_Net_Organic_Growth - Prev_Monthly_Net_Organic_Growth) / nullif(abs(Prev_Monthly_Net_Organic_Growth), 0) * 100), 2), 0) AS Month_over_Month_growth_Percentage
		,coalesce(YTD.YTD_Inflow_GrossAmt, 0) AS YTD_Inflow_GrossAmt
		,coalesce(YTD.YTD_Outflow_GrossAmt, 0) AS YTD_Outflow_GrossAmt
		,coalesce(YTD.YTDNetOrganicGrowth, 0) AS YTD_Net_Organic_Growth
		,coalesce(PYTD.YTDNetOrganicGrowth, 0) AS Previous_YTD_Net_Organic_Growth
		,YTD_Net_Organic_Growth - Previous_YTD_Net_Organic_Growth AS YTD_Period_over_period_growth
		,coalesce(round(((YTD_Net_Organic_Growth - Previous_YTD_Net_Organic_Growth) / nullif(abs(Previous_YTD_Net_Organic_Growth), 0) * 100), 2), 0) AS YTD_Period_over_period_growth_Percentage
		,round(sum(YTD_Net_Organic_Growth) OVER (PARTITION BY LTV.team_name), 2) AS YTD_Net_Organic_Growth_By_Team
		,round(sum(Actual_Monthly_Net_Organic_Growth) OVER (PARTITION BY LTV.team_name), 2) AS Monthly_Net_Organic_Growth_By_Team
	FROM LatestVersionAdvisors LTV
	LEFT JOIN THISMONTHREPORT TM    ON   LTV.TEAM_NAME = TM.TEAM_NAME  
	LEFT JOIN LASTMONTHREPORT LM    ON   LTV.TEAM_NAME = LM.TEAM_NAME  
	LEFT JOIN YTDReport YTD         ON   LTV.TEAM_NAME = YTD.TEAM_NAME  
	LEFT JOIN PREVYTDREPORT PYTD    ON   LTV.TEAM_NAME = PYTD.TEAM_NAME
	) AS resultat
WHERE resultat.YTD_Net_Organic_Growth_By_Team <> 0
	AND resultat.team_name NOT IN (
		'iA House'
		,'National Branch'
		,''
		)
ORDER BY Team_Rank;
