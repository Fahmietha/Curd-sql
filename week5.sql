CREATE DATABASE Week5DB;
USE Week5DB;

-- 1. Unnormalized Table
CREATE TABLE Orders_UNF (
    OrderID INT,
    CustomerName VARCHAR(50),
    Products VARCHAR(100)
);

INSERT INTO Orders_UNF VALUES
(101, 'Ravi', 'Laptop, Mouse'),
(102, 'Arun', 'Keyboard');

SELECT * FROM Orders_UNF;


-- 2. First Normal Form (1NF)
-- Each product is stored in a separate row
CREATE TABLE Orders_1NF (
    OrderID INT,
    CustomerName VARCHAR(50),
    Product VARCHAR(50)
);

INSERT INTO Orders_1NF VALUES
(101, 'Ravi', 'Laptop'),
(101, 'Ravi', 'Mouse'),
(102, 'Arun', 'Keyboard');

SELECT * FROM Orders_1NF;


-- 3. Second Normal Form (2NF)
-- Remove partial dependency
CREATE TABLE Customer (
    OrderID INT,
    CustomerName VARCHAR(50)
);

CREATE TABLE OrderDetails (
    OrderID INT,
    Product VARCHAR(50)
);


-- 4. Insert Customer Data
INSERT INTO Customer VALUES
(101, 'Ravi'),
(102, 'Arun');


-- 5. Insert Order Details
INSERT INTO OrderDetails VALUES
(101, 'Laptop'),
(101, 'Mouse'),
(102, 'Keyboard');


-- 6. Retrieve Data Using JOIN
SELECT
    C.OrderID,
    C.CustomerName,
    O.Product
FROM Customer C
JOIN OrderDetails O
ON C.OrderID = O.OrderID;
