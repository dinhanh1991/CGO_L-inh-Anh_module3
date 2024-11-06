create database sellingmanage;
use sellingmanage;
create table Customer(
customer_id int not null auto_increment primary key,
customer_name varchar(25),
customer_age tinyint
);
create table OrderP(
order_id int not null auto_increment primary key,
customer_id int not null,
order_date datetime,
order_total_price int
);
create table Product(
product_id int not null auto_increment primary key,
product_name varchar(25),
product_price int
);
create table Order_detail(
order_id int not null,
product_id int not null,
order_quantity int not null
);
ALTER TABLE OrderP
ADD CONSTRAINT fk_customer
FOREIGN KEY (customer_id) REFERENCES Customer(customer_id);
ALTER TABLE Order_detail
ADD CONSTRAINT fk_order
FOREIGN KEY (order_id) REFERENCES OrderP(order_id),
ADD CONSTRAINT fk_product
FOREIGN KEY (product_id) REFERENCES Product(product_id);
insert into customer (customer_name,customer_age) value
('Minh Quân',10),
('Ngọc Anh',20),
('Hồng Hà',50);
insert into orderp(customer_id,order_date,order_total_price) value 
(1,'2006-3-21',null),
(2,'2006-3-23',null),
(1,'2006-3-16',null);
insert into product(product_name,product_price) value 
('may giat',3),
('tu lanh',5),
('dieu hoa',7),
('Quat',1),
('Bep Dien',2);
insert into order_detail(order_id,product_id,order_quantity) value
(1,1,3),
(1,3,7),
(1,4,2),
(2,1,1),
(3,1,8),
(2,5,4),
(2,3,3);
SELECT order_id AS oID, order_date AS oDate, order_total_price AS oPrice
FROM OrderP;
SELECT c.customer_name AS Customer, p.product_name AS Product
FROM Customer c
JOIN OrderP o ON c.customer_id = o.customer_id
JOIN Order_detail od ON o.order_id = od.order_id
JOIN Product p ON od.product_id = p.product_id;
SELECT customer_name
FROM Customer
WHERE customer_id NOT IN (SELECT customer_id FROM OrderP);
SELECT o.order_id AS OrderID, 
       o.order_date AS OrderDate, 
       SUM(od.order_quantity * p.product_price) AS TotalPrice
FROM OrderP o
JOIN Order_detail od ON o.order_id = od.order_id
JOIN Product p ON od.product_id = p.product_id
GROUP BY o.order_id, o.order_date;