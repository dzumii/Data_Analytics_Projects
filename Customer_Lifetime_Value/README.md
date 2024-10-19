# Customer Lifetime Value (CLV) Analysis
# Project Overview
## Introduction
Customer Lifetime Value (CLV) is a key metric used to estimate the total revenue a business can expect from a customer over the entire duration of their relationship. Understanding CLV helps businesses make informed decisions about customer acquisition, retention strategies, and long-term financial forecasting. In this project, CLV is calculated for different customer cohorts to analyze purchasing patterns and to identify growth opportunities by improving customer retention and engagement.

## Objective
The primary objective of this project is to calculate the CLV for different customer cohorts over a 12-week period, analyze revenue trends, and provide actionable insights to enhance customer retention, maximize revenue, and inform strategic business decisions. Specifically, the goal is to identify how customer spending behavior changes across different cohort weeks and provide recommendations to improve CLV.

## Data Preparation
The data used for this project includes customer transactions, segmented by cohorts based on the week of their first transaction. Each cohort's revenue is tracked for 12 weeks, and the dataset provides details on the number of subscribers, weekly average revenue per user, and cumulative revenue for each cohort. The following steps were taken to prepare the data for analysis:

- Data Collection: Transaction data was collected on a weekly basis, starting from each cohort's Week 0 (first interaction) through Week 12.
- Cohort Segmentation: Customers were segmented into cohorts based on their first interaction date (e.g., week of 11/1/2020, 11/8/2020, etc.).
- Revenue Calculation: For each cohort, the total weekly revenue was divided by the cohort size to obtain the average revenue per user (ARPU) for each week. Cumulative revenue was then calculated by adding weekly revenues.
- Data Cleaning: The dataset was checked for missing or inconsistent values, and relevant columns such as cohort week, cohort size, weekly average revenue, and cumulative revenue were properly formatted for analysis.
## Visualization and Analysis
To analyze CLV trends, visualizations such as cohort retention curves and revenue growth patterns were created. The following steps were taken for the visualization and analysis phase:


Average Weekly Revenue per User (ARPU): Calculated the average weekly revenue per each cohort by dividing the total revenue by the number of customers for each cohort.
Cumulative Revenue per Cohort: Calculated the cummulative average weekly revenue per each cohort over the 12-week period, highlighting key differences between early and later cohorts using conditional formatting.
Growth Rates: A cumulative growth percentage  was created to observe how quickly revenue plateaus for each cohort, identifying where growth slows down.
Average Weekly Revenue Prediction by Cohorts: using the growth percentage, I predicted future average weekly revenue.													
## Insights
From the analysis, the following insights were derived:

- Revenue Decline Post-Week 0: Across all cohorts, revenue drops sharply after Week 0, indicating a significant decrease in customer engagement or spending right after the initial purchase.
- Retention Variations Across Cohorts: Earlier cohorts (especially those from November 2020) tend to generate higher cumulative revenue compared to more recent cohorts, suggesting a possible decline in customer retention or acquisition quality.
- Flattening Revenue Growth: Growth rates stabilize by Week 3 across most cohorts, with cumulative growth slowing down significantly from this point onward. This indicates that most of the revenue potential is captured within the first few weeks.
- High-Performing Cohorts: The 11/1/2020 and 11/8/2020 cohorts show the highest CLV, reflecting better retention and engagement strategies during this period compared to later cohorts.
## Recommendations
Based on the insights from the analysis, the following recommendations can be made:

- Improve Early Retention: Introduce targeted retention campaigns for customers in Week 1 and Week 2 to prevent revenue loss. This can include personalized emails, special discounts, or loyalty rewards aimed at keeping users engaged beyond their initial interaction.
- Upsell and Cross-sell Opportunities: Implement upselling and cross-selling strategies after Week 3, when revenue tends to plateau. Offering complementary products or upgrading to premium services can help boost revenue for stagnating cohorts.
- Enhance Customer Onboarding: Since most revenue loss occurs immediately after Week 0, refining the customer onboarding process to emphasize long-term value can improve early retention and reduce churn.
- Cohort-Specific Engagement: Analyze the characteristics of high-performing cohorts (e.g., 11/1/2020 and 11/8/2020) to identify successful engagement strategies. Apply similar approaches to newer cohorts to replicate their success.
- Improve Acquisition Quality: Cohorts starting from December 2020 onwards show a steep drop in CLV. Investigate changes in acquisition strategies and optimize for quality over quantity, ensuring that newly acquired customers have a higher engagement potential.
## Conclusion
The CLV analysis reveals that customer engagement tends to decline rapidly after the initial purchase, with revenue plateauing by Week 3 across most cohorts. While earlier cohorts show higher CLVs, more recent cohorts are struggling with retention. By focusing on improving early customer retention, introducing upsell strategies, and enhancing the onboarding process, the business can increase overall CLV and revenue generation.