-- ==========================================================
-- E-COMMERCE ORDER MANAGEMENT DATABASE SYSTEM
-- WEEK 2
-- PRODUCT AND CATEGORY MANAGEMENT SYSTEM
-- ==========================================================

-- ==========================================================
-- 1. SELECT DATABASE
-- ==========================================================

USE ecommerce_db;

-- Verify selected database
SELECT DATABASE();

-- ==========================================================
-- 2. CREATE CATEGORY TABLE
-- ==========================================================

CREATE TABLE category ( category_id INT PRIMARY KEY AUTO_INCREMENT,  category_name VARCHAR(50) NOT NULL UNIQUE, description VARCHAR(200));

-- Check category table structure
DESC category;

-- ==========================================================
-- 3. INSERT CATEGORY DATA
-- ==========================================================

INSERT INTO category (category_name, description) VALUES ('Electronics', 'Electronic devices and accessories'), ('Clothing', 'Men and women clothing products'), ('Books', 'Educational and general books'), ('Home Appliances', 'Appliances used at home');

-- Display categories
SELECT * FROM category;

-- ==========================================================
-- 4. CREATE PRODUCT TABLE
-- ==========================================================

CREATE TABLE product ( product_id INT PRIMARY KEY AUTO_INCREMENT,product_name VARCHAR(100) NOT NULL,category_id INT NOT NULL, price DECIMAL(10,2) NOT NULL CHECK (price > 0), stock_quantity INT NOT NULL CHECK (stock_quantity >= 0), FOREIGN KEY (category_id) REFERENCES category(category_id) );

-- Check product table structure
DESC product;

-- Check complete table definition
SHOW CREATE TABLE product;

-- ==========================================================
-- 5. INSERT PRODUCT DATA
-- ==========================================================

INSERT INTO product
(product_name, category_id, price, stock_quantity)
VALUES
('Laptop', 1, 55000, 20),
('Smartphone', 1, 25000, 35),
('Headphones', 1, 2500, 50),
('T-Shirt', 2, 800, 60),
('Jeans', 2, 1800, 40),
('Python Programming', 3, 650, 30),
('Database Management Systems', 3, 750, 25),
('Refrigerator', 4, 32000, 10),
('Washing Machine', 4, 28000, 15),
('Smart Watch', 1, 4500, 25);

-- Display all products
SELECT * FROM product;

-- ==========================================================
-- 6. CATEGORY SELECT OPERATIONS
-- ==========================================================

-- Query 1: Display all categories
SELECT *
FROM category;

-- Query 2: Display category names
SELECT category_name
FROM category;

-- Query 3: Search for Electronics
SELECT *
FROM category
WHERE category_name = 'Electronics';

-- Query 4: Display categories alphabetically
SELECT *
FROM category
ORDER BY category_name ASC;

-- Query 5: Display unique category names
SELECT DISTINCT category_name
FROM category;

-- ==========================================================
-- 7. PRODUCT SELECT OPERATIONS
-- ==========================================================

-- Query 1: Display all products
SELECT *
FROM product;

-- Query 2: Display product name and price
SELECT product_name, price
FROM product;

-- Query 3: Products costing more than 10000
SELECT *
FROM product
WHERE price > 10000;

-- Query 4: Products with stock less than 20
SELECT *
FROM product
WHERE stock_quantity < 20;

-- Query 5: Display Electronics products
SELECT *
FROM product
WHERE category_id = 1;

-- Query 6: Products beginning with S
SELECT *
FROM product
WHERE product_name LIKE 'S%';

-- Query 7: Products within price range
SELECT *
FROM product
WHERE price BETWEEN 1000 AND 30000;

-- Query 8: Products from multiple categories
SELECT *
FROM product
WHERE category_id IN (1, 2);

-- Query 9: Sort products by price
SELECT *
FROM product
ORDER BY price DESC;

-- Query 10: Count total products
SELECT COUNT(*) AS total_products
FROM product;

-- ==========================================================
-- 8. INSERT NEW PRODUCT
-- ==========================================================

INSERT INTO product
(product_name, category_id, price, stock_quantity)
VALUES
('Tablet', 1, 18000, 20);

-- Verify inserted product
SELECT *
FROM product
WHERE product_name = 'Tablet';

-- ==========================================================
-- 9. UPDATE PRODUCT PRICE
-- ==========================================================

-- Check product before update
SELECT *
FROM product
WHERE product_id = 1;

-- Update laptop price
UPDATE product
SET price = 57000
WHERE product_id = 1;

-- Verify update
SELECT *
FROM product
WHERE product_id = 1;

-- ==========================================================
-- 10. UPDATE PRODUCT STOCK
-- ==========================================================

-- Increase laptop stock after new shipment
UPDATE product
SET stock_quantity = stock_quantity + 20
WHERE product_id = 1;

-- Verify stock update
SELECT product_name, stock_quantity
FROM product
WHERE product_id = 1;

-- ==========================================================
-- 11. UPDATE MULTIPLE PRODUCT VALUES
-- ==========================================================

UPDATE product
SET price = 26000,
    stock_quantity = 40
WHERE product_id = 2;

-- Verify update
SELECT *
FROM product
WHERE product_id = 2;

-- ==========================================================
-- 12. UPDATE PRODUCTS USING CONDITIONS
-- ==========================================================

-- Increase stock for Electronics products
UPDATE product
SET stock_quantity = stock_quantity + 10
WHERE category_id = 1;

-- Increase stock for low-stock products
UPDATE product
SET stock_quantity = stock_quantity + 5
WHERE stock_quantity < 20;

-- Verify
SELECT *
FROM product;

-- ==========================================================
-- 13. DELETE PRODUCT
-- ==========================================================

-- Check product before deleting
SELECT *
FROM product
WHERE product_id = 3;

-- Delete discontinued product
DELETE FROM product
WHERE product_id = 3;

-- Verify deletion
SELECT *
FROM product
WHERE product_id = 3;

-- ==========================================================
-- 14. JOIN CATEGORY AND PRODUCT
-- ==========================================================

-- Display category and product information
SELECT
    c.category_id,
    c.category_name,
    p.product_id,
    p.product_name,
    p.price,
    p.stock_quantity
FROM category c
JOIN product p
ON c.category_id = p.category_id;

-- ==========================================================
-- 15. DISPLAY PRODUCTS UNDER EACH CATEGORY
-- ==========================================================

SELECT
    c.category_name,
    p.product_name,
    p.price,
    p.stock_quantity
FROM category c
JOIN product p
ON c.category_id = p.category_id
ORDER BY c.category_name;

-- ==========================================================
-- 16. COUNT PRODUCTS BY CATEGORY
-- ==========================================================

SELECT
    c.category_name,
    COUNT(p.product_id) AS product_count
FROM category c
LEFT JOIN product p
ON c.category_id = p.category_id
GROUP BY c.category_name;

-- ==========================================================
-- 17. HIGHEST-PRICED PRODUCT BY CATEGORY
-- ==========================================================

SELECT
    c.category_name,
    MAX(p.price) AS highest_price
FROM category c
JOIN product p
ON c.category_id = p.category_id
GROUP BY c.category_name;

-- ==========================================================
-- 18. AVERAGE PRODUCT PRICE BY CATEGORY
-- ==========================================================

SELECT
    c.category_name,
    AVG(p.price) AS average_price
FROM category c
JOIN product p
ON c.category_id = p.category_id
GROUP BY c.category_name;

-- ==========================================================
-- 19. CATEGORIES HAVING MORE THAN 5 PRODUCTS
-- ==========================================================

SELECT
    c.category_name,
    COUNT(p.product_id) AS product_count
FROM category c
JOIN product p
ON c.category_id = p.category_id
GROUP BY c.category_name
HAVING COUNT(p.product_id) > 5;

-- ==========================================================
-- 20. TOTAL STOCK BY CATEGORY
-- ==========================================================

SELECT
    c.category_name,
    SUM(p.stock_quantity) AS total_stock
FROM category c
JOIN product p
ON c.category_id = p.category_id
GROUP BY c.category_name;

-- ==========================================================
-- 21. LOW-STOCK PRODUCT REPORT
-- ==========================================================

SELECT
    product_id,
    product_name,
    stock_quantity
FROM product
WHERE stock_quantity < 20;

-- ==========================================================
-- 22. HIGH-VALUE PRODUCT REPORT
-- ==========================================================

SELECT
    product_id,
    product_name,
    price
FROM product
WHERE price > 20000
ORDER BY price DESC;

-- ==========================================================
-- 23. CONSTRAINT TESTING
-- ==========================================================

-- Test 1: Duplicate category
-- This should produce a UNIQUE constraint error.

INSERT INTO category
(category_name, description)
VALUES
('Electronics', 'Duplicate electronics category');

-- Test 2: Invalid category ID
-- This should produce a FOREIGN KEY constraint error.

INSERT INTO product
(product_name, category_id, price, stock_quantity)
VALUES
('Test Product', 999, 1000, 10);

-- Test 3: Negative price
-- This should produce a CHECK constraint error.

INSERT INTO product
(product_name, category_id, price, stock_quantity)
VALUES
('Invalid Price Product', 1, -500, 10);

-- Test 4: Negative stock
-- This should produce a CHECK constraint error.

INSERT INTO product
(product_name, category_id, price, stock_quantity)
VALUES
('Invalid Stock Product', 1, 1000, -10);

-- ==========================================================
-- 24. FINAL VERIFICATION
-- ==========================================================

-- Display all tables
SHOW TABLES;

-- Display category structure
DESC category;

-- Display product structure
DESC product;

-- Display final category data
SELECT *
FROM category;

-- Display final product data
SELECT *
FROM product;

-- Display category-wise product report
SELECT
    c.category_name,
    p.product_name,
    p.price,
    p.stock_quantity
FROM category c
JOIN product p
ON c.category_id = p.category_id
ORDER BY c.category_name;

-- ==========================================================
-- END OF WEEK 2
-- PRODUCT AND CATEGORY MANAGEMENT SYSTEM
-- ==========================================================