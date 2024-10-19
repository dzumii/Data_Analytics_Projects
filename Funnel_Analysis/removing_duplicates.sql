WITH RankedEvents AS (
SELECT
*,
ROW_NUMBER() OVER (PARTITION BY user_pseudo_id, event_name ORDER BY event_timestamp) AS rn
FROM `tc-da-1.turing_data_analytics.raw_events`
)
SELECT *
FROM RankedEvents
WHERE rn = 1
LIMIT 50;
