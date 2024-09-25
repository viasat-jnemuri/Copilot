/*
This file contains a script of Transact SQL (T-SQL) command to interact with a database named 'Inventory'.
Requirements:
- SQL Server 2022 is installed and running
- database 'Inventory' already exists.
The script performs the following tasks:
- Check if the database 'Inventory' exists, if not, exit with an error message.
- Sets the default database to 'Inventory'.
- Create a 'categories' table and related 'products' table if they do not already exist.
- Remove all rows from the tables.
- Populate the 'categories' table with sample data.
- Populate the 'products' table with sample data.
- Create stored procedures to get all categories.
- Create a stored procedure to get all products in a specific category.
- Create a stored procudure to get all products in a specific price range sorted by price in ascending order.
*/

-- Check if the database 'Inventory' exists, if not, exit with an error message.
IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = 'Inventory')
BEGIN
    PRINT 'The database Inventory does not exist. Please create the database and run this script again.'
    RETURN
END

-- Set the default database to 'Inventory'.
USE Inventory

-- Create a 'categories' table and related 'products' table if they do not already exist.
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'categories')
BEGIN
    CREATE TABLE categories (
        id INT PRIMARY KEY,
        name NVARCHAR(50) NOT NULL,
        -- Add a 'description' column to the categories table
        description NVARCHAR(255)
    )
END

-- Create a 'products' table if it does not already exist.
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'products')
BEGIN
    CREATE TABLE products (
        id INT PRIMARY KEY,
        name NVARCHAR(50) NOT NULL,
        price DECIMAL(10, 2) NOT NULL,
        category_id INT FOREIGN KEY REFERENCES categories(id),
        -- Add a created_at column to the products table
        created_at DATETIME,
        -- Add a updated_at column to the products table
        updated_at DATETIME
    )
END

-- Remove all rows from the 'products' table.
TRUNCATE TABLE products

-- Remove all rows from the 'categories' table.
TRUNCATE TABLE categories

-- Populate the 'categories' table with sample data.
INSERT INTO categories (id, name, description) VALUES
(1, 'Electronics', 'Electronic devices and accessories'),
(2, 'Clothing', 'Clothing items and accessories'),
(3, 'Home & Kitchen', 'Home and kitchen appliances and accessories')

-- Populate the 'products' table with sample data.
INSERT INTO products (id, name, price, category_id, created_at, updated_at) VALUES
(1, 'Laptop', 999.99, 1, GETDATE(), GETDATE()),
(2, 'Smartphone', 499.99, 1, GETDATE(), GETDATE()),
(3, 'T-shirt', 19.99, 2, GETDATE(), GETDATE()),
(4, 'Jeans', 39.99, 2, GETDATE(), GETDATE()),
(5, 'Coffee Maker', 49.99, 3, GETDATE(), GETDATE()),
(6, 'Toaster', 29.99, 3, GETDATE(), GETDATE())

-- Create a stored procedure to get all categories.
IF OBJECT_ID('GetAllCategories') IS NOT NULL
BEGIN
    DROP PROCEDURE GetAllCategories
END

CREATE PROCEDURE GetAllCategories
AS
BEGIN
    SELECT * FROM categories
END

-- Create a stored procedure to get all products in a specific category.
IF OBJECT_ID('GetProductsByCategory') IS NOT NULL
BEGIN
    DROP PROCEDURE GetProductsByCategory
END

CREATE PROCEDURE GetProductsByCategory
    @category_id INT
AS
BEGIN
    SELECT * FROM products WHERE category_id = @category_id
END

-- Create a stored procedure to get all products in a specific price range sorted by price in ascending order.
IF OBJECT_ID('GetProductsByPriceRange') IS NOT NULL
BEGIN
    DROP PROCEDURE GetProductsByPriceRange
END

CREATE PROCEDURE GetProductsByPriceRange
    @min_price DECIMAL(10, 2),
    @max_price DECIMAL(10, 2)
AS
BEGIN
    SELECT * FROM products WHERE price BETWEEN @min_price AND @max_price ORDER BY price ASC
END



