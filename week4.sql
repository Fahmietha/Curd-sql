CREATE DATABASE OnlineOrderDB;
USE OnlineOrderDB;

-- 1. Unnormalized Orders Table
CREATE TABLE Orders (
    OrderID INT,
    CustomerID VARCHAR(10),
    CustomerName VARCHAR(50),
    ProductID VARCHAR(10),
    ProductName VARCHAR(50),
    Quantity INT
);

-- Insert Data
INSERT INTO Orders VALUES
(101, 'C1', 'Ravi', 'P1', 'Laptop', 1),
(102, 'C1', 'Ravi', 'P2', 'Mouse', 2),
(103, 'C2', 'Arun', 'P1', 'Laptop', 1);

-- View Data
SELECT * FROM Orders;

-- 2. Functional Dependencies
-- CustomerID -> CustomerName
-- ProductID -> ProductName
-- OrderID -> CustomerID

-- 3. Update Anomaly
UPDATE Orders
SET CustomerName = 'Ravi Kumar'
WHERE CustomerID = 'C1';

SELECT * FROM Orders;

-- 4. Insertion Anomaly
-- Customer cannot be inserted alone because Orders needs order/product details.

-- 5. Deletion Anomaly
DELETE FROM Orders
WHERE OrderID = 103;

SELECT * FROM Orders;

-- 6. Normalized Customer Table
CREATE TABLE Customer (
    CustomerID VARCHAR(10),
    CustomerName VARCHAR(50)
);

-- 7. Normalized Product Table
CREATE TABLE Product (
    ProductID VARCHAR(10),
    ProductName VARCHAR(50)
);

-- 8. New Orders Table
CREATE TABLE Orders_New (
    OrderID INT,
    CustomerID VARCHAR(10),
    ProductID VARCHAR(10),
    Quantity INT
);

-- Insert Customer Data
INSERT INTO Customer VALUES
('C1', 'Ravi'),
('C2', 'Arun');

-- Insert Product Data
INSERT INTO Product VALUES
('P1', 'Laptop'),
('P2', 'Mouse');

-- Insert Order Data
INSERT INTO Orders_New VALUES
(101, 'C1', 'P1', 1),
(102, 'C1', 'P2', 2),
(103, 'C2', 'P1', 1);

-- 9. Retrieve Normalized Data Using JOIN
SELECT 
    O.OrderID,
    C.CustomerName,
    P.ProductName,
    O.Quantity
FROM Orders_New O
JOIN Customer C 
    ON O.CustomerID = C.CustomerID
JOIN Product P 
    ON O.ProductID = P.ProductID;
