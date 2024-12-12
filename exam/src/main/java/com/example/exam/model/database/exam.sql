use product;
CREATE TABLE category (
  id int NOT NULL AUTO_INCREMENT,
  name varchar(100) NOT NULL,
  PRIMARY KEY (id)
);
CREATE TABLE product (
  id int NOT NULL AUTO_INCREMENT,
  name varchar(255) NOT NULL,
  price decimal(15,2) NOT NULL,
  quantity int NOT NULL,
  color enum('Đỏ','Xanh','Đen','Trắng','Vàng') NOT NULL,
  description text,
  category_id int DEFAULT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (category_id) REFERENCES Category(id)
) ;