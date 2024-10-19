# Subscription Cohort Analysis and Retention Insights
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
- SQL Query: I used the following [SQL query](Retention.sql) to extract and analyze data from BigQuery

## Visualization and Analysis
After retrieving the necessary data, I visualized the retention rates using Google Sheets, applying conditional formatting to highlight trends in retention rates for each cohort over time. Additionally, I created [churn and retention charts](Retention.xlsx) to easily display the drop-off of subscribers over the 6-week period.

### Key Insights

- Overall Strong Retention Performance: The retention data shows consistently high retention rates, with many cohorts maintaining over 90% retention throughout the first six weeks. This suggests a healthy onboarding process and strong user engagement strategies.

- Retention Improved After December 2020: Starting from the 12/6/2020 cohort, there is a noticeable improvement in retention rates compared to earlier cohorts. Cohorts from 12/6/2020 onward consistently maintain retention rates in the mid-90s, with minimal drop-offs over time. For example, the 12/20/2020 cohort retains 94% of users after six weeks, which is significantly higher than earlier cohorts like 11/1/2020, which retains only 85% by week 6.

- Week 2 Drop-off in Early Cohorts: For cohorts before 12/6/2020, there is a significant drop in retention after week 1. Retention dips to 90% or lower for these earlier cohorts, with further gradual decline in subsequent weeks. For instance, the 11/8/2020 cohort drops to 89% in week 2 and continues to decline to 85% by week 6.

- Recent Cohorts Show Consistent Retention: From 12/6/2020 onwards, cohorts display remarkable consistency, with retention rates staying above 90% even up to week 6. The 12/13/2020 cohort maintains a retention rate of 92% by week 6, which is a marked improvement over earlier cohorts.

- Stable Retention Plateau in Week 4 for Recent Cohorts: The data shows that recent cohorts (from 12/6/2020 onward) experience a retention plateau starting from week 4. The 12/13/2020 and 12/20/2020 cohorts, for example, exhibit minimal declines after week 4, suggesting that subscribers who remain active by this point are likely to stay longer-term.

- Perfect Retention in the Most Recent Week (1/31/2021): The 1/31/2021 cohort shows 100% retention in week 1, indicating a promising start for this group. While it’s still early to fully assess long-term retention, this is a positive sign for new subscribers.

### Recommendations

- Focus on Second Week Engagement for Early Cohorts: Given the noticeable drop-off in retention after week 1 for cohorts before 12/6/2020, it's crucial to investigate what factors contributed to this. Consider targeted engagement strategies for the second week, such as personalized email campaigns, tutorials, or special promotions, to retain more users during this critical period.

- Replicate the Success of Recent Cohorts: Since cohorts after 12/6/2020 show significantly improved retention, it would be valuable to analyze what changed in the onboarding or product experience. Were there updates in the platform, new features, or changes in user communication? Replicating these strategies could further improve retention for future cohorts.

- Minimize Drop-offs for Early Cohorts: While retention has been healthy in recent cohorts, older cohorts like those from November 2020 still display sharper declines. Investigating potential causes for lower retention during this period—such as product bugs, feature usability, or external factors—could help prevent similar issues in the future.

- Maintain Current Strategies Beyond Week 4: The plateau in retention for recent cohorts starting from week 4 suggests that users who stay active until this point are more likely to remain long-term. Focus on reinforcing engagement beyond this period by offering loyalty rewards, exclusive content, or additional resources to keep these users invested.

- Longer-Term Retention Analysis: While the 6-week retention rate is informative, conducting a longer-term analysis (e.g., over 12 weeks or more) would provide insights into subscriber behavior and help identify long-term loyal customers. Understanding what keeps users engaged in the long run can drive strategies for subscription renewals or upselling opportunities

## Conclusion
This cohort analysis provided a granular view of subscriber retention for Turing’s EdTech platform. The insights gained highlight critical periods of churn and areas where the company can improve engagement. Retention rates are currently healthy, but focusing on the second week of the subscriber journey could further enhance long-term user retention.
