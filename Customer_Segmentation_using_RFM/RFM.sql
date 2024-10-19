WITH 
-- Step 1: Calculate Frequency (F) & Monetary (M)
t1 AS (
    SELECT  
        CustomerID,
        Country,
        MAX(InvoiceDate) AS last_purchase_date,
        COUNT(DISTINCT InvoiceNo) AS frequency, 
        SUM(Quantity * UnitPrice) AS monetary 
    FROM 
        `tc-da-1.turing_data_analytics.rfm`
    WHERE 
        InvoiceDate BETWEEN '2010-12-01' AND '2011-12-01'
        AND CustomerID IS NOT NULL
    GROUP BY 
        CustomerID, Country
),

-- Step 2: Calculate Recency (R)
t2 AS (
    SELECT *, 
           DATE_DIFF(DATE('2011-12-01'), DATE(last_purchase_date), DAY) AS recency
    FROM t1
),

-- Step 3: Calculate RFM Quartiles using APPROX_QUANTILES
t3 AS (
    SELECT 
        a.*, 
        b.percentiles[offset(1)] AS m25, 
        b.percentiles[offset(2)] AS m50, 
        b.percentiles[offset(3)] AS m75, 
        b.percentiles[offset(3)] AS m100, -- Using the maximum value as m100
        c.percentiles[offset(1)] AS f25, 
        c.percentiles[offset(2)] AS f50, 
        c.percentiles[offset(3)] AS f75, 
        c.percentiles[offset(3)] AS f100, -- Using the maximum value as f100
        d.percentiles[offset(1)] AS r25, 
        d.percentiles[offset(2)] AS r50, 
        d.percentiles[offset(3)] AS r75, 
        d.percentiles[offset(3)] AS r100  -- Using the maximum value as r100
    FROM 
        t2 a,
        (SELECT APPROX_QUANTILES(monetary, 4) percentiles FROM t2) b,
        (SELECT APPROX_QUANTILES(frequency, 4) percentiles FROM t2) c,
        (SELECT APPROX_QUANTILES(recency, 4) percentiles FROM t2) d
),

-- Step 4: Assign R, F, M scores
t4 AS (
    SELECT *,
        CASE 
            WHEN recency <= r25 THEN 4
            WHEN recency <= r50 THEN 3
            WHEN recency <= r75 THEN 2
            ELSE 1
        END AS r_score,
        CASE 
            WHEN frequency >= f75 THEN 4
            WHEN frequency >= f50 THEN 3
            WHEN frequency >= f25 THEN 2
            ELSE 1
        END AS f_score,
        CASE 
            WHEN monetary >= m75 THEN 4
            WHEN monetary >= m50 THEN 3
            WHEN monetary >= m25 THEN 2
            ELSE 1
        END AS m_score
    FROM t3
),

-- Step 5: Segment Customers based on their RFM scores
t5 AS (
    SELECT 
        CustomerID, 
        Country, 
        recency, 
        frequency, 
        monetary, 
        r_score, 
        f_score, 
        m_score,
        -- Define customer segments based on RFM scores
        CASE 
             WHEN r_score = 4 AND f_score = 4 AND m_score = 4 THEN 'Best Customers'
    WHEN f_score = 4 AND m_score >= 3 THEN 'Loyal Customers'
    WHEN m_score = 4 THEN 'Big Spenders'
    WHEN r_score = 1 AND f_score <= 2 THEN 'Lost Customers'
    WHEN r_score = 4 THEN 'Promising'
    WHEN r_score = 3 AND f_score >= 3 THEN 'Potential Loyalists'
    WHEN r_score = 4 AND f_score = 1 THEN 'Recent Customers'
    WHEN r_score = 3 AND f_score <= 2 THEN 'Customers Needing Attention'
    WHEN r_score = 2 AND f_score >= 3 AND m_score >= 2 THEN 'At Risk'
    WHEN r_score = 2 AND f_score >= 3 AND m_score = 1 THEN 'Customers Needing Attention'
    WHEN r_score = 2 AND f_score <= 2 THEN 'About to Sleep'
    WHEN r_score = 1 AND f_score >= 3 THEN 'Cant Lose Them'
    WHEN r_score = 1 AND f_score = 1 THEN 'Hibernating'
   
        END AS rfm_segment
    FROM t4
)

-- Final output
SELECT * FROM t5
ORDER BY rfm_segment;
