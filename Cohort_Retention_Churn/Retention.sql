WITH cohort AS (
  SELECT
    PARSE_DATE('%Y-%m-%d', '2021-02-07') AS analysis_date,
    DATE_TRUNC(DATE(subscription_start), WEEK(SUNDAY)) AS cohort_week,
    user_pseudo_id,
    subscription_start,
    COALESCE(subscription_end, PARSE_DATE('%Y-%m-%d', '2021-02-07')) AS subscription_end
  FROM 
    `tc-da-1.turing_data_analytics.subscriptions`
)
SELECT
  cohort_week,
  COUNT(DISTINCT CASE 
      WHEN (subscription_end >= cohort_week) THEN user_pseudo_id 
  END) AS week_0,
  COUNT(DISTINCT CASE 
      WHEN (subscription_end >= DATE_ADD(cohort_week, INTERVAL 1 WEEK)) THEN user_pseudo_id 
  END) AS week_1,
  COUNT(DISTINCT CASE 
      WHEN (subscription_end >= DATE_ADD(cohort_week, INTERVAL 2 WEEK)) THEN user_pseudo_id 
  END) AS week_2,
  COUNT(DISTINCT CASE 
      WHEN (subscription_end >= DATE_ADD(cohort_week, INTERVAL 3 WEEK)) THEN user_pseudo_id 
  END) AS week_3,
  COUNT(DISTINCT CASE 
      WHEN (subscription_end >= DATE_ADD(cohort_week, INTERVAL 4 WEEK)) THEN user_pseudo_id 
  END) AS week_4,
  COUNT(DISTINCT CASE 
      WHEN (subscription_end >= DATE_ADD(cohort_week, INTERVAL 5 WEEK)) THEN user_pseudo_id 
  END) AS week_5,
  COUNT(DISTINCT CASE 
      WHEN (subscription_end >= DATE_ADD(cohort_week, INTERVAL 6 WEEK)) THEN user_pseudo_id 
  END) AS week_6
FROM cohort
GROUP BY cohort_week
ORDER BY cohort_week;
