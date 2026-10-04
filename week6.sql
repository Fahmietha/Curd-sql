CREATE DATABASE Week6DB;
USE Week6DB;

-- 1. Third Normal Form (3NF)

CREATE TABLE Customer (
    CustomerID VARCHAR(10) PRIMARY KEY,
    CustomerName VARCHAR(50),
    City VARCHAR(50)
);

CREATE TABLE City (
    City VARCHAR(50) PRIMARY KEY,
    State VARCHAR(50)
);

-- Insert 3NF Data
INSERT INTO City VALUES
('Chennai', 'Tamil Nadu'),
('Bangalore', 'Karnataka');

INSERT INTO Customer VALUES
('C1', 'Ravi', 'Chennai'),
('C2', 'Arun', 'Bangalore');

SELECT * FROM Customer;
SELECT * FROM City;


-- 2. BCNF

CREATE TABLE Teacher (
    Teacher VARCHAR(50),
    Subject VARCHAR(50)
);

CREATE TABLE SubjectRoom (
    Subject VARCHAR(50),
    Room VARCHAR(50)
);

-- Insert BCNF Data
INSERT INTO Teacher VALUES
('Kumar', 'DBMS'),
('Ravi', 'Java');

INSERT INTO SubjectRoom VALUES
('DBMS', 'Room101'),
('Java', 'Room102');

SELECT * FROM Teacher;
SELECT * FROM SubjectRoom;


-- 3. Final Normalized Online Order Management System

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID VARCHAR(10),
    OrderDate DATE,
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);

CREATE TABLE Product (
    ProductID VARCHAR(10) PRIMARY KEY,
    ProductName VARCHAR(50),
    Price DECIMAL(10,2)
);

CREATE TABLE OrderDetails (
    OrderID INT,
    ProductID VARCHAR(10),
    Quantity INT,
    PRIMARY KEY (OrderID, ProductID),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
);


-- 4. Insert Product Data
INSERT INTO Product VALUES
('P1', 'Laptop', 50000),
('P2', 'Mouse', 500),
('P3', 'Keyboard', 1000);


-- 5. Insert Order Data
INSERT INTO Orders VALUES
(101, 'C1', '2026-10-01'),
(102, 'C2', '2026-10-02');


-- 6. Insert Order Details
INSERT INTO OrderDetails VALUES
(101, 'P1', 1),
(101, 'P2', 2),
(102, 'P3', 1);


-- 7. Retrieve Final Normalized Data
SELECT
    O.OrderID,
    C.CustomerName,
    P.ProductName,
    OD.Quantity
FROM Orders O
JOIN Customer C
    ON O.CustomerID = C.CustomerID
JOIN OrderDetails OD
    ON O.OrderID = OD.OrderID
JOIN Product P
    ON OD.ProductID = P.ProductID;
