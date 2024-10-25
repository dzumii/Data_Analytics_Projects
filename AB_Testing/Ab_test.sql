WITH mean_table AS (
SELECT
    location_id,
    promotion,
    SUM(sales_in_thousands) AS sum_sales,
    COUNT(week) AS weeks_count
FROM
    `tc-da-1.turing_data_analytics.wa_marketing_campaign`

GROUP BY
    location_id,
    promotion
ORDER BY
    promotion, location_id
)

SELECT 
promotion,
ROUND(AVG(sum_sales) ,2) as avg_sales,
ROUND(STDDEV(sum_sales),2) as stddev_sales,
COUNT (location_id) as no_of_locations
FROM mean_table
GROUP BY
promotion;

