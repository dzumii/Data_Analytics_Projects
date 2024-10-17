# Subscription Cohort Analysis and Retention Insights for Turing Platform
#  Project Overview
## Introduction
Subscription-based platforms rely heavily on retaining customers over time, and one of the most insightful ways to track customer retention is through cohort analysis. This project focuses on understanding Turing’s weekly subscription churn by tracking subscriber retention over a 6-week period. Using Turing's subscriptions dataset, I examined how many subscribers started in a particular week and how many remained active through subsequent weeks. This analysis was done to provide actionable insights for improving subscriber retention and engagement.

## Objective
The goal of this analysis was to provide a more granular view of retention, avoiding the long wait for monthly data insights. By breaking down retention by week, the product manager requested an in-depth look at when subscribers are churning and what strategies might be applied to improve early-stage retention. 

## Data Preparation
The analysis was based on the turing_data_analytics.subscriptions table, with a focus on tracking weekly cohorts of subscribers. Using SQL on BigQuery, I grouped subscribers into weekly cohorts based on their subscription start dates and calculated their retention status over a 6-week span. Here’s a brief explanation of how the data was structured and processed:

- Cohort Week: Each cohort was formed by grouping subscribers who started their subscriptions in the same week. Weeks were defined from Sunday to Saturday.  
- Weekly Retention: For each cohort, I calculated how many subscribers remained active in week 0 (the week of subscription) through week 6.  
- Subscription End Dates: For inactive subscribers, their subscription end dates were taken into account to measure retention over time.  
- SQL Query: I used the following SQL query to extract and analyze data from BigQuery

## Visualization and Analysis
After retrieving the necessary data, I visualized the retention rates using Google Sheets, applying conditional formatting to highlight trends in retention rates for each cohort over time. Additionally, I created churn charts and retention curves to easily display the drop-off of subscribers over the 6-week period.

### Key Insights

- Healthy Retention Rates: According to an industry benchmark for EdTech platforms, the average retention rate is around 27%. Based on this, Turing’s 6-week retention rate appears healthy, suggesting that their user onboarding and retention strategies are effective.

- Drop-off in Week 2: The most significant retention drop-off occurs between weeks 1 and 2, suggesting that this period is critical for keeping new subscribers engaged.

- Improved Recent Retention: Since December 6, 2020, newer cohorts have shown improved retention compared to earlier cohorts, possibly due to changes in customer engagement strategies or product updates.

- Steady Decline in Recent Cohorts: While recent cohorts show a steady decrease in retention, earlier cohorts experience a sharper drop-off. This suggests that recent improvements in onboarding may have played a role in keeping subscribers engaged for longer.

### Recommendations

- Enhance Second-Week Engagement: Focus efforts on engaging new subscribers during their second week, as this is the critical period where churn spikes. Personalized communication, educational content, and special offers could help reduce churn during this time.

- Analyze Early Cohorts: Investigate the patterns and reasons behind the lower retention rates in earlier cohorts. Were there differences in the product or onboarding experience that could have contributed to the higher churn rate?

- Leverage Insights from Recent Cohorts: Study what has improved in recent cohorts to extend these strategies across all subscribers. If certain features or engagement strategies have led to improved retention, those insights can help refine the customer retention process.

- Longer-Term Retention Analysis: Conduct a longer-term retention analysis to understand how subscribers behave over several months. This could help identify long-term loyal customers and potential areas for subscription renewal campaigns.

## Conclusion
This cohort analysis provided a granular view of subscriber retention for Turing’s EdTech platform. The insights gained highlight critical periods of churn and areas where the company can improve engagement. Retention rates are currently healthy, but focusing on the second week of the subscriber journey could further enhance long-term user retention.
