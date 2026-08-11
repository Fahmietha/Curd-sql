-- CREATE DATABASE
CREATE DATABASE customer_db;

-- USE DATABASE
USE customer_db;


-- CREATE CUSTOMER TABLE
CREATE TABLE customer (
    cust_id INT PRIMARY KEY,
    cust_name VARCHAR(30),
    age INT,
    gender VARCHAR(10),
    address VARCHAR(50),
    district VARCHAR(30),
    customer_type VARCHAR(20)
);


-- INSERT 15 RECORDS
INSERT INTO customer VALUES
(1,'Farhan',25,'Male','Gandhipuram','Erode','Premier'),
(2,'Fardeen',30,'Male','Perundurai','Erode','Normal'),
(3,'Faizal',45,'Male','Bhavani','Erode','Premier'),
(4,'Faiyaz',28,'Male','Erode Road','Erode','Normal'),
(5,'Faizan',35,'Male','Kangeyam','Tiruppur','Premier'),
(6,'Nizamudeen',82,'Male','Avinashi','Tiruppur','Normal'),
(7,'Hafiz',50,'Male','Dharapuram','Tiruppur','Premier'),
(8,'Farooq',32,'Male','Erode Town','Erode','Normal'),
(9,'Fahim',40,'Male','Gobichettipalayam','Erode','Premier'),
(10,'Famitha',22,'Female','Erode Main Road','Erode','Normal'),
(11,'Chandhini',27,'Female','Avinashi Road','Tiruppur','Normal'),
(12,'Archana',36,'Female','Kumar Nagar','Tiruppur','Normal'),
(13,'Jayshree',29,'Female','Dharapuram Road','Tiruppur','Normal'),
(14,'Mumeena',55,'Female','Perundurai Road','Erode','Premier'),
(15,'Divya',75,'Female','Tiruppur North','Tiruppur','Normal');


-- DISPLAY ALL CUSTOMERS
SELECT * FROM customer;


-- SELECT CUSTOMERS FROM ERODE
SELECT * FROM customer
WHERE district = 'Erode';


-- SELECT PREMIER CUSTOMERS
SELECT * FROM customer
WHERE customer_type = 'Premier';


-- SELECT MALE CUSTOMERS FROM ERODE
SELECT * FROM customer
WHERE gender = 'Male'
AND district = 'Erode';


-- SELECT FEMALE, TIRUPPUR, NORMAL CUSTOMERS
SELECT * FROM customer
WHERE gender = 'Female'
AND district = 'Tiruppur'
AND customer_type = 'Normal';


-- UPDATE AGE
UPDATE customer
SET age = 34
WHERE cust_id = 10;


-- UPDATE ADDRESS
UPDATE customer
SET address = 'Salem Main Road'
WHERE cust_id = 10;


-- UPDATE CUSTOMER TYPE
UPDATE customer
SET customer_type = 'Premier'
WHERE cust_id = 10;


-- DELETE AGE ABOVE 80
DELETE FROM customer
WHERE age > 80;


-- DELETE CUSTOMER BY SPECIFIC ID
DELETE FROM customer
WHERE cust_id = 15;


-- DELETE BELOW AVERAGE AGE
DELETE FROM customer
WHERE age < (SELECT AVG(age)
             FROM (SELECT age FROM customer) AS temp);