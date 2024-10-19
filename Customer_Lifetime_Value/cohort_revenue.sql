WITH user_first_visit AS (
  SELECT
    user_pseudo_id,
    DATE_TRUNC(PARSE_DATE('%Y%m%d', MIN(event_date)), WEEK) AS cohort_week
  FROM
    tc-da-1.turing_data_analytics.raw_events
  GROUP BY
    1
),
weekly_revenue AS (
  SELECT
    user_pseudo_id,
    DATE_TRUNC(PARSE_DATE('%Y%m%d', event_date), WEEK) AS revenue_week,
    SUM(purchase_revenue_in_usd) AS revenue
  FROM
    tc-da-1.turing_data_analytics.raw_events
  GROUP BY
    user_pseudo_id,
    revenue_week
)
SELECT
  ufv.cohort_week,
  COUNT(DISTINCT ufv.user_pseudo_id) AS cohort_size,
   SUM(CASE WHEN
          wr.revenue_week = ufv.cohort_week
          THEN wr.revenue
          END)  as Week0,
   SUM(CASE WHEN
          wr.revenue_week = DATE_ADD(ufv.cohort_week, INTERVAL 1 week)
          THEN wr.revenue
          END)  as Week1,
  SUM(CASE WHEN
          wr.revenue_week = DATE_ADD(ufv.cohort_week, INTERVAL 2 week)
          THEN wr.revenue
          END)  as Week2,
  SUM(CASE WHEN
          wr.revenue_week = DATE_ADD(ufv.cohort_week, INTERVAL 3 week)
          THEN wr.revenue
          END)  as Week3,
  SUM(CASE WHEN
          wr.revenue_week = DATE_ADD(ufv.cohort_week, INTERVAL 4 week)
          THEN wr.revenue
          END)  as Week4,
  SUM(CASE WHEN
          wr.revenue_week = DATE_ADD(ufv.cohort_week, INTERVAL 5 week)
          THEN wr.revenue
          END)  as Week5,
  SUM(CASE WHEN
          wr.revenue_week = DATE_ADD(ufv.cohort_week, INTERVAL 6 week)
          THEN wr.revenue
          END)  as Week6,
  SUM(CASE WHEN
          wr.revenue_week = DATE_ADD(ufv.cohort_week, INTERVAL 7 week)
          THEN wr.revenue
          END)  as Week7,
  SUM(CASE WHEN
          wr.revenue_week = DATE_ADD(ufv.cohort_week, INTERVAL 8 week)
          THEN wr.revenue
          END)  as Week8,
  SUM(CASE WHEN
          wr.revenue_week = DATE_ADD(ufv.cohort_week, INTERVAL 9 week)
          THEN wr.revenue
          END)  as Week9,
  SUM(CASE WHEN
          wr.revenue_week = DATE_ADD(ufv.cohort_week, INTERVAL 10 week)
          THEN wr.revenue
          END)  as Week10,
  SUM(CASE WHEN
          wr.revenue_week = DATE_ADD(ufv.cohort_week, INTERVAL 11 week)
          THEN wr.revenue
          END)  as Week11,
  SUM(CASE WHEN
          wr.revenue_week = DATE_ADD(ufv.cohort_week, INTERVAL 12 week)
          THEN wr.revenue
          END)  as Week12,
FROM
  user_first_visit as ufv
LEFT JOIN
  weekly_revenue as wr
ON
  ufv.user_pseudo_id = wr.user_pseudo_id
WHERE
  ufv.cohort_week <= DATE("2021-01-24")
GROUP BY
  1
ORDER BY
  1
