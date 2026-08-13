CREATE DATABASE ecommerce_db;
USE ecommerce_db;

CREATE TABLE User (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50),
    email VARCHAR(100),
    password VARCHAR(50),
    role VARCHAR(20)
);

INSERT INTO User (username, email, password, role)
VALUES
('Ayaan', 'ayaan@gmail.com', 'pass123', 'Customer'),
('Zainab', 'zainab@gmail.com', 'pass123', 'Customer'),
('Arham', 'arham@gmail.com', 'pass123', 'Customer'),
('Fatima', 'fatima@gmail.com', 'pass123', 'Seller'),
('Rehan', 'rehan@gmail.com', 'pass123', 'Seller'),
('Ayesha', 'ayesha@gmail.com', 'pass123', 'Customer'),
('Ibrahim', 'ibrahim@gmail.com', 'pass123', 'Customer'),
('Hafsa', 'hafsa@gmail.com', 'pass123', 'Customer'),
('Faizan', 'faizan@gmail.com', 'pass123', 'Seller'),
('Mariam', 'mariam@gmail.com', 'pass123', 'Customer');

SELECT * FROM User;

DESC User;

UPDATE User
SET email = 'ayaan123@gmail.com'
WHERE user_id = 1;

SELECT * FROM User;

DELETE FROM User
WHERE user_id = 10;

SELECT * FROM User;
