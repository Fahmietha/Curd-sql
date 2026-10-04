CREATE TABLE Sellers (
    Seller_ID INT AUTO_INCREMENT PRIMARY KEY,
    Seller_Code VARCHAR(10) NOT NULL UNIQUE,
    Seller_Name VARCHAR(150) NOT NULL,
    Email VARCHAR(150) NOT NULL UNIQUE,
    Phone VARCHAR(20) NOT NULL,
    Address TEXT,
    Created_At DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Seller_Product (
    SP_ID INT AUTO_INCREMENT PRIMARY KEY,
    Seller_ID INT NOT NULL,
    Product_ID INT NOT NULL,
    Supply_Price DECIMAL(10,2),
    Active BOOLEAN DEFAULT TRUE,
    UNIQUE (Seller_ID, Product_ID),
    FOREIGN KEY (Seller_ID) REFERENCES Sellers(Seller_ID),
    FOREIGN KEY (Product_ID) REFERENCES Products(Product_ID)
);

CREATE TABLE Inventory (
    Inventory_ID INT AUTO_INCREMENT PRIMARY KEY,
    Product_ID INT NOT NULL UNIQUE,
    Total_Stock INT NOT NULL DEFAULT 0 CHECK (Total_Stock >= 0),
    Stock_Status VARCHAR(20) NOT NULL DEFAULT 'Out of Stock',
    Last_Updated DATE NOT NULL DEFAULT (CURRENT_DATE),
    FOREIGN KEY (Product_ID) REFERENCES Products(Product_ID)
);

INSERT INTO Sellers
(Seller_Code,Seller_Name,Email,Phone,Address)
VALUES
('S101','ABC Electronics','abc@electronics.com','9876543210','No.12, Industrial Rd'),
('S102','Fashion World','contact@fashionworld.in','9445566778','12, Market Street'),
('S103','Homeware Hub','sales@homeware.com','9123456780','45, Central Ave');

INSERT INTO Seller_Product
(Seller_ID,Product_ID,Supply_Price)
VALUES
(1,1,45000.00),
(2,2,1200.00),
(3,4,3500.00),
(1,4,3400.00);

INSERT INTO Inventory
(Product_ID,Total_Stock,Stock_Status,Last_Updated)
VALUES
(1,25,'Available','2026-08-10'),
(2,0,'Out of Stock','2026-08-12'),
(3,8,'Available','2026-08-14');

INSERT INTO Sellers
(Seller_Code,Seller_Name,Email,Phone,Address)
VALUES
('S104','Gadget Store','hello@gadgetstore.com','9001122334','88, Tech Park');

INSERT INTO Seller_Product
(Seller_ID,Product_ID,Supply_Price)
VALUES
(4,204,2500.00);

SELECT s.Seller_Name,p.Product_ID,p.Product_Name
FROM Sellers s
JOIN Seller_Product sp ON s.Seller_ID=sp.Seller_ID
JOIN Products p ON sp.Product_ID=p.Product_ID
ORDER BY s.Seller_Name;

SELECT s.Seller_Name,COUNT(sp.Product_ID) AS Product_Count
FROM Sellers s
LEFT JOIN Seller_Product sp ON s.Seller_ID=sp.Seller_ID
GROUP BY s.Seller_ID,s.Seller_Name;

UPDATE Sellers
SET Email='newemail@domain.com',Phone='9000000000'
WHERE Seller_ID=2;

SELECT p.Product_ID,p.Product_Name,i.Total_Stock
FROM Products p
JOIN Inventory i ON p.Product_ID=i.Product_ID
WHERE i.Stock_Status='Available';

SELECT p.Product_ID,p.Product_Name
FROM Products p
JOIN Inventory i ON p.Product_ID=i.Product_ID
WHERE i.Stock_Status='Out of Stock';

SELECT p.Product_ID,p.Product_Name,i.Total_Stock
FROM Products p
JOIN Inventory i ON p.Product_ID=i.Product_ID
WHERE i.Total_Stock<10;

UPDATE Inventory
SET Total_Stock=Total_Stock+50,
Stock_Status=CASE
WHEN Total_Stock+50>0 THEN 'Available'
ELSE 'Out of Stock'
END,
Last_Updated=CURRENT_DATE
WHERE Product_ID=3;

SELECT s.Seller_Name,
COUNT(sp.Product_ID) AS Products_Supplied,
COALESCE(SUM(i.Total_Stock),0) AS Available_Stock
FROM Sellers s
LEFT JOIN Seller_Product sp ON s.Seller_ID=sp.Seller_ID
LEFT JOIN Inventory i ON sp.Product_ID=i.Product_ID
GROUP BY s.Seller_ID,s.Seller_Name
ORDER BY Available_Stock DESC;

SELECT p.Product_Name,i.Total_Stock,i.Stock_Status,i.Last_Updated
FROM Products p
JOIN Inventory i ON p.Product_ID=i.Product_ID
ORDER BY i.Total_Stock DESC;

SELECT COUNT(*) AS Total_Products_Available
FROM Inventory
WHERE Total_Stock>0;

SELECT COUNT(*) AS Out_Of_Stock
FROM Inventory
WHERE Total_Stock=0;

SELECT p.Product_Name,i.Total_Stock
FROM Products p
JOIN Inventory i ON p.Product_ID=i.Product_ID
ORDER BY i.Total_Stock DESC
LIMIT 5;

SELECT ROUND(AVG(Total_Stock),2) AS Avg_Stock
FROM Inventory;
