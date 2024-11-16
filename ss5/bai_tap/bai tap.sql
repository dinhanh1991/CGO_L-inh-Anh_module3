create database demo2;
use demo2;
create table products(
products_id int not null auto_increment primary key,
products_code varchar(30),
products_name varchar (25),
product_pride int,
product_amount int,
product_Description varchar(30),
product_Status bit
);
DROP TABLE IF EXISTS Products;
CREATE TABLE Products (
    products_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    products_code VARCHAR(30),
    products_name VARCHAR(25),
    product_price DECIMAL(10, 2), -- Đảm bảo tên cột chính xác là product_price
    product_amount INT,
    product_Description VARCHAR(100),
    product_Status BIT
);
INSERT INTO Products (products_code, products_name, product_price, product_amount, product_Description, product_Status)
VALUES 
('P001', 'Laptop Dell', 1200.00, 10, 'High-performance laptop', 1),
('P002', 'iPhone 14', 999.99, 5, 'Latest model iPhone', 1),
('P003', 'Samsung Galaxy', 850.00, 7, 'Popular Android phone', 1),
('P004', 'Sony Headphones', 150.00, 20, 'Noise-cancelling headphones', 0),
('P005', 'Apple Watch', 400.00, 8, 'Smartwatch with health tracking', 1);
CREATE UNIQUE INDEX idx_product_code ON Products(products_code);
CREATE INDEX idx_product_name_price ON Products(products_name, product_price);
EXPLAIN SELECT * FROM Products WHERE products_code = 'P001';
EXPLAIN SELECT * FROM Products WHERE products_name = 'iPhone 14' AND product_price = 999.99;
CREATE VIEW ProductInfo AS
SELECT products_code, products_name, product_price, product_Status
FROM Products;
SELECT * FROM ProductInfo;
CREATE OR REPLACE VIEW ProductInfo AS
SELECT products_code, products_name, product_price, product_Status, product_amount
FROM Products;
DROP VIEW IF EXISTS ProductInfo;
DELIMITER //

CREATE PROCEDURE GetAllProducts()
BEGIN
    SELECT * FROM Products;
END //

DELIMITER ;
CALL GetAllProducts();
DELIMITER //

CREATE PROCEDURE AddProduct(
    IN code VARCHAR(30), 
    IN name VARCHAR(25), 
    IN price DECIMAL(10, 2), 
    IN amount INT, 
    IN description VARCHAR(30), 
    IN status BIT
)
BEGIN
    INSERT INTO Products (products_code, products_name, product_price, product_amount, product_Description, product_Status)
    VALUES (code, name, price, amount, description, status);
END //
DELIMITER ;
CALL AddProduct('P006', 'MacBook Air', 1500.00, 5, 'Lightweight laptop', 1);
DELIMITER //

CREATE PROCEDURE UpdateProduct(
    IN prod_id INT,
    IN new_price DECIMAL(10, 2),
    IN new_amount INT
)
BEGIN
    UPDATE Products
    SET product_price = new_price, product_amount = new_amount
    WHERE products_id = prod_id;
END //

DELIMITER ;
CALL UpdateProduct(1, 1100.00, 12);
DELIMITER //

CREATE PROCEDURE DeleteProduct(IN prod_id INT)
BEGIN
    DELETE FROM Products WHERE products_id = prod_id;
END //

DELIMITER ;
CALL DeleteProduct(5);