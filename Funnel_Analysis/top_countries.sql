WITH FilteredEvents AS (
SELECT
user_pseudo_id,
country,
event_name,
ROW_NUMBER() OVER (PARTITION BY user_pseudo_id, event_name ORDER BY event_timestamp) AS rn
FROM `tc-da-1.turing_data_analytics.raw_events`
WHERE event_name IN ('first_visit', 'view_item', 'add_to_cart', 'begin_checkout', 'purchase')
)
SELECT
country,
COUNT(*) AS event_count
FROM FilteredEvents
WHERE rn = 1
GROUP BY country
ORDER BY event_count DESC
LIMIT 3;
