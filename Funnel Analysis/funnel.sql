WITH FilteredEvents AS (
    -- Select unique events for each user_pseudo_id and event_name
    SELECT 
        user_pseudo_id,
        country,
        event_name,
        ROW_NUMBER() OVER (PARTITION BY user_pseudo_id, event_name ORDER BY event_timestamp) AS rn
    FROM `tc-da-1.turing_data_analytics.raw_events`
    WHERE event_name IN ('first_visit', 'view_item', 'add_to_cart', 'begin_checkout', 'purchase')
),
EventOrderMapping AS (
    -- Map events to funnel stages (1 to 5)
    SELECT 
        event_name,
        ROW_NUMBER() OVER (ORDER BY CASE event_name
                                        WHEN 'first_visit' THEN 1
                                        WHEN 'view_item' THEN 2
                                        WHEN 'add_to_cart' THEN 3
                                        WHEN 'begin_checkout' THEN 4
                                        WHEN 'purchase' THEN 5
                                      END) AS event_order
    FROM (SELECT DISTINCT event_name FROM FilteredEvents) t
),
UserEventCounts AS (
    -- Count users per event and country, keeping only the first occurrence of each event
    SELECT
        fe.user_pseudo_id,
        fe.event_name,
        fe.country
    FROM FilteredEvents fe
    WHERE rn = 1
),
TopCountries AS (
    -- Identify top 3 countries by overall unique user count (across all event types)
    SELECT 
        country,
        COUNT(DISTINCT user_pseudo_id) AS user_count
    FROM UserEventCounts
    GROUP BY country
    ORDER BY user_count DESC
    LIMIT 3
),
FunnelStepCounts AS (
    -- Count users per event for the top 3 countries
    SELECT 
        eom.event_order,
        uec.event_name,
        COUNT(DISTINCT uec.user_pseudo_id) AS total_users,
        SUM(CASE WHEN uec.country = (SELECT country FROM TopCountries LIMIT 1 OFFSET 0) THEN 1 ELSE 0 END) AS top_country_1_users,
        SUM(CASE WHEN uec.country = (SELECT country FROM TopCountries LIMIT 1 OFFSET 1) THEN 1 ELSE 0 END) AS top_country_2_users,
        SUM(CASE WHEN uec.country = (SELECT country FROM TopCountries LIMIT 1 OFFSET 2) THEN 1 ELSE 0 END) AS top_country_3_users
    FROM UserEventCounts uec
    JOIN EventOrderMapping eom ON uec.event_name = eom.event_name
    WHERE uec.country IN (SELECT country FROM TopCountries)
    GROUP BY eom.event_order, uec.event_name
),
TotalFirstVisit AS (
    -- Get total users from the top 3 countries that performed the first_visit event
    SELECT 
        COUNT(DISTINCT user_pseudo_id) AS total_first_visit,
        SUM(CASE WHEN country = (SELECT country FROM TopCountries LIMIT 1 OFFSET 0) THEN 1 ELSE 0 END) AS top_country_1_first_visit,
        SUM(CASE WHEN country = (SELECT country FROM TopCountries LIMIT 1 OFFSET 1) THEN 1 ELSE 0 END) AS top_country_2_first_visit,
        SUM(CASE WHEN country = (SELECT country FROM TopCountries LIMIT 1 OFFSET 2) THEN 1 ELSE 0 END) AS top_country_3_first_visit
