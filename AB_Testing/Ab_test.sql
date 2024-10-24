SELECT
    location_id,
    promotion,
    AVG(sales_in_thousands) AS avg_sales,
    COUNT(week) AS weeks_count
FROM
    `tc-da-1.turing_data_analytics.wa_marketing_campaign`


GROUP BY
    location_id,
    promotion
ORDER BY
    promotion, location_id;
