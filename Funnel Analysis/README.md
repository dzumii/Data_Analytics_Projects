Building a Funnel Chart for Website Events: Insights from User Behavior Data
Overview
In this project, I worked with a dataset capturing various user events from a website, including actions such as first visits, viewing items, adding items to the cart, beginning checkout, and making purchases. The goal of the project was to create a sales funnel chart that visualizes user behavior across these key stages and provides insights into drop-offs at each step. Additionally, I split the data by the top three countries to compare user behavior across different regions.

Task Description
The core objective was to generate a funnel chart that shows the percentage of users who transitioned through different stages of the sales process. The funnel starts from a user’s first visit to the website, progressing through viewing an item, adding it to the cart, beginning the checkout process, and finally making a purchase.

To accomplish this, I followed these steps:

Data Analysis: The dataset in the raw_events table contains numerous user interactions recorded with timestamps. Since the same user may perform an event multiple times (e.g., visiting the site or adding items to the cart multiple times), duplicate data can inflate results. This means we need to ensure that only the first occurrence of each event is considered for the funnel analysis.

Unique Event Selection: To eliminate duplicate entries, I wrote a query that selects only the first occurrence of each event for each user. This ensured that the funnel chart accurately represented user behavior without overestimating the number of users in each stage.

Top Countries Identification: The business was particularly interested in understanding differences in user behavior between the top three countries by total event count. I first identified the top countries by the overall number of unique events, not just limited to first visits, ensuring that countries with the most engagement were represented.

Funnel Chart Creation: Using the cleaned data, I focused on five key events:

first_visit
view_item
add_to_cart
begin_checkout
purchase
I calculated the number of users at each stage for the top three countries and the percentage drop-off between stages.
