-- Check if the database 'Inventory' exists, if not, exit with an error message.
IF NOT EXISTS(SELECT name FROM sys.databases WHERE name = 'Inventory')
BEGIN
    RAISERROR ('Database Inventory does not exist.', 16, 1);
    RETURN;
END
GO

USE Inventory;
GO

-- Create a 'categories' table and related 'products' table if they do not already exist.
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'categories')
BEGIN
    CREATE TABLE categories (
        id INT PRIMARY KEY,
        name NVARCHAR(50)
    );
END
GO

IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'products')
BEGIN
    CREATE TABLE products (
        id INT PRIMARY KEY,
        name NVARCHAR(50),
        price DECIMAL(10, 2),
        category_id INT FOREIGN KEY REFERENCES categories(id)
    );
END
GO

-- Remove all rows from the tables.
TRUNCATE TABLE products;
TRUNCATE TABLE categories;
GO

-- Populate the 'categories' table with sample data.
INSERT INTO categories VALUES (1, 'Electronics');
INSERT INTO categories VALUES (2, 'Furniture');
GO

-- Populate the 'products' table with sample data.
INSERT INTO products VALUES (1, 'TV', 500.00, 1);
INSERT INTO products VALUES (2, 'Sofa', 1000.00, 2);
GO

-- Create stored procedures to get all categories.
CREATE PROCEDURE GetAllCategories AS
BEGIN
    SELECT * FROM categories;
END
GO

-- Create a stored procedure to get all products in a specific category.
CREATE PROCEDURE GetProductsByCategory @categoryId INT AS
BEGIN
    SELECT * FROM products WHERE category_id = @categoryId;
END
GO

-- Create a stored procedure to get all products in a specific price range sorted by price in ascending order.
CREATE PROCEDURE GetProductsByPriceRange @minPrice DECIMAL(10, 2), @maxPrice DECIMAL(10, 2) AS
BEGIN
    SELECT * FROM products WHERE price BETWEEN @minPrice AND @maxPrice ORDER BY price ASC;
END
GO