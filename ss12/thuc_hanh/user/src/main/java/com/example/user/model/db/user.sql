create database user;
use user;
CREATE TABLE User (
  id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(120) NOT NULL,
  email VARCHAR(220) NOT NULL,
  country VARCHAR(120),
  PRIMARY KEY (id)
);
insert into user(name, email, country) values('Minh','minh@codegym.vn','Viet Namuser');
insert into user(name, email, country) values('Kante','kante@che.uk','Kenia');
select * from user;
RENAME TABLE `user` TO `User`;
