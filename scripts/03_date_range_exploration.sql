/*
---------------------------------------------------
Date Range Exploration
---------------------------------------------------
Purpose:
   * To determine the minimum and maximum dates for critical data attributes.
 * To evaluate the historical range and completeness of the dataset.

Functions Used:
    * MIN(), MAX(), DATEDIFF()
---------------------------------------------------
*/

-- Determine the first and last order date and the total duration in months
 SELECT
 MIN(order_date) AS last_order_date,
 MAX(order_date) AS first_order_date,
 DATEDIFF(month, MIN(order_date),MAX(order_date)) AS order_duration
 FROM gold.fact_sales;

-- Find the youngest and oldest customer based on birthdate
 SELECT 
 MAX(birthdate) youngest_customer,
  DATEDIFF(year, MAX(birthdate), GETDATE()) AS youngest_age,
 MIN(birthdate) oldest_customer,
 DATEDIFF(year, MIN(birthdate), GETDATE()) AS oldest_age
 FROM gold.dim_customers;
