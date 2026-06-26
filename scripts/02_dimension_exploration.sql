/*
-------------------------------------------------------
Dimensions Exploration
-------------------------------------------------------
Purpose:
    * To know the distinct material in a column
	
 Functions Used:
    * DISTINCT
    * ORDER BY
-------------------------------------------------------
*/

-- Find the list of unique countries from which customers originate
SELECT DISTINCT 
    country 
FROM gold.dim_customers
ORDER BY country;

-- Retrieve a list of unique categories, subcategories, and products
SELECT DISTINCT 
    category, 
    subcategory, 
    product_name 
FROM gold.dim_products
ORDER BY category, subcategory, product_name;
