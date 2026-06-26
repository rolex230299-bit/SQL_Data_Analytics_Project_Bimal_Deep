/*
-------------------------------------------------------------
Create Database, Tables and Schemas
-------------------------------------------------------------
Script Purpose:
This script creates a new database named 'DataWarehouseAnalytics' after
checking whether it already exists. If the database exists, it is dropped
and recreated. Additionally, this script creates a schema called 'gold'.

WARNING:
Running this script will drop the entire 'DataWarehouseAnalytics' database
if it already exists. All data within the database will be permanently
deleted. Proceed with caution and ensure that proper backups are available
before executing this script.
*/

USE master;
GO

-- Drop and recreate the 'DataWarehouseAnalytics' database
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'DataWarehouseAnalytics')
BEGIN
    ALTER DATABASE DataWarehouseAnalytics SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE DataWarehouseAnalytics;
END;
GO

-- Create the 'DataWarehouseAnalytics' database
CREATE DATABASE DataWarehouseAnalytics;
GO

USE DataWarehouseAnalytics;
GO

-- Create Schemas

CREATE SCHEMA gold;
GO

CREATE TABLE gold.dim_customers(
	customer_key int,
	customer_id int,
	customer_number nvarchar(50),
	first_name nvarchar(50),
	last_name nvarchar(50),
	country nvarchar(50),
	marital_status nvarchar(50),
	gender nvarchar(50),
	birthdate date,
	create_date date
);
GO

CREATE TABLE gold.dim_products(
	product_key int ,
	product_id int ,
	product_number nvarchar(50) ,
	product_name nvarchar(50) ,
	category_id nvarchar(50) ,
	category nvarchar(50) ,
	subcategory nvarchar(50) ,
	maintenance nvarchar(50) ,
	cost int,
	product_line nvarchar(50),
	start_date date 
);
GO

CREATE TABLE gold.fact_sales(
	order_number nvarchar(50),
	product_key smallint,
	customer_key smallint,
	order_date date,
	shipping_date date,
	due_date date,
	sales_amount smallint,
	quantity tinyint,
	price smallint 
);
GO

-- vacating all the materials from the table if it already exist
TRUNCATE TABLE gold.dim_customers;
GO
  
-- Inserting file into the table : gold.dim_customers
BULK INSERT gold.dim_customers
FROM 'C:\Users\asus\Desktop\SQL DATA ANALYTICS PROJECT\gold.dim_customers.csv'
WITH (
	FIRSTROW = 2,
	FIELDTERMINATOR = ',',
	TABLOCK
);
GO

  -- vacating all the materials from the table if it already exist
TRUNCATE TABLE gold.dim_products;
GO

  -- Inserting file into the table :gold.dim_products
BULK INSERT gold.dim_products
FROM 'C:\Users\asus\Desktop\SQL DATA ANALYTICS PROJECT\gold.dim_products.csv'
WITH (
	FIRSTROW = 2,
	FIELDTERMINATOR = ',',
	TABLOCK
);
GO

  -- vacating all the materials from the table if it already exist
TRUNCATE TABLE gold.fact_sales;
GO

   -- Inserting file into the table : gold.fact_sales
BULK INSERT gold.fact_sales
FROM 'C:\Users\asus\Downloads\sql-data-analytics-project.zip\sql-data-analytics-project\datasets\flat-files\gold.fact_sales.csv'
WITH (
	FIRSTROW = 2,
	FIELDTERMINATOR = ',',
	TABLOCK
);
GO
