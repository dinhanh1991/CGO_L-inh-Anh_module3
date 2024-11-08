create database demo;
use demo;
create table jame_account(
	user_name varchar(50) primary key,
    password varchar(50)
);
create table class(
	class_id int primary key auto_increment,
    class_name varchar(50)
);
create table student(
	student_id int primary key auto_increment,
    student_name varchar(50),
    student_birthday date,
    student_gender bit,
    student_email varchar(50),
    student_point double,
    user_name varchar(50),
    class_id int,
    foreign key(user_name) references jame_account(user_name),
    foreign key(class_id) references class(class_id)
);

create table instructor(
	instructor_id int primary key auto_increment,
	instructor_name varchar(50),
    instructor_birthday date,
	instructor_salary double
);
create table instructor_class(
	class_id int,
    instructor_id int,
    primary key(class_id,instructor_id),
    foreign key(class_id) references class(class_id),
    foreign key(instructor_id) references instructor(instructor_id)
);
insert into class (class_name) value ('c1121g1'), ('c1221g1'), ('a0821i1'), ('a0921i1');
insert into jame_account(user_name,password)
 values('cunn','12345'),('chunglh','12345'),('hoanhh','12345'),('dungd','12345'),('huynhtd','12345'),
 ('hainm','12345'),('namtv','12345'),('hieuvm','12345'),('kynx','12345'),('vulm','12345'),('anv','12345'),('bnv','12345');
 insert into instructor(instructor_name,instructor_birthday, instructor_salary)
 values('tran van chanh','1985-02-03',100),('dang chi trung','1985-02-03',200),('nguyen vu thanh tien','1985-02-03',300);
 insert into student(student_name,student_birthday, student_gender,student_point, class_id,user_name) 
 values ('nguyen ngoc cu','1981-12-12',1,8,1,'cunn'),('le hai chung','1981-12-12',1,5,1,'chunglh'),
 ('hoang huu hoan','1990-12-12',1,6,2,'hoanhh'),('dau dung','1987-12-12',1,8,1,'dungd'),
 ('ta dinh huynh','1981-12-12',1,7,2,'huynhtd'),('nguyen minh hai','1987-12-12',1,9,1,'hainm'),
 ('tran van nam','1989-12-12',1,4,2,'namtv'),('vo minh hieu','1981-12-12',1,3,1,'hieuvm'),
 ('le xuan ky','1981-12-12',1,7,2,'kynx'),('le minh vu','1981-12-12',1,7,1,'vulm'),
 ('nguyen van a','1981-12-12',1,8,null,'anv'),('tran van b','1981-12-12',1,5,null,'bnv');
 insert into instructor_class(class_id,instructor_id) values (1,1),(1,2),(2,1),(2,2),(3,1),(3,2);
select student.*,class.class_name
from student
inner join class On student.class_id=class.class_id;
select student.*,class.class_name
from student
left join class On student.class_id=class.class_id;
select* from student
where student_name like '%hai'or student_name LIKE '%huynh';
select* from student
where student_point > 5;
SELECT *
FROM student
WHERE student_name LIKE 'Nguyen%';
SELECT student_point, COUNT(*) AS total_students
FROM student
GROUP BY student_point;
SELECT student_point, COUNT(*) AS total_students
FROM student
WHERE student_point > 5
GROUP BY student_point;
SELECT student_point, COUNT(*) AS total_students
FROM student
WHERE student_point > 5
GROUP BY student_point
HAVING total_students >= 2;
SELECT student.*
FROM student
INNER JOIN class ON student.class_id = class.class_id
WHERE class.class_name = 'c1121g1'
ORDER BY substring(student.student_name,' ',-1) ;
-- 1. Hiển thị số lượng học sinh theo học và số lượng mỗi lớp.
select class.class_name,count(student.student_id) as so_luong_hoc_vien
from class
left join student on class.class_id=student.student_id
group by class.class_id;
select max(student_point)
from student ;
select class.class_name,max(student.student_point) as Highest_score
from class
inner join student on class.class_id=student.class_id
group by class.class_name;
select class.class_name,avg(student.student_point) as Avange_score
from class
inner join student on class.class_id=student.class_id
group by class.class_name;
SELECT instructor_name AS name, instructor_birthday AS birthday
FROM instructor
UNION
SELECT student_name AS name, student_birthday AS birthday
FROM student;
SELECT student_name, student_point
FROM student
ORDER BY student_point DESC
LIMIT 3;
SELECT student_name, student_point
FROM student
WHERE student_point = (SELECT MAX(student_point) FROM student);
CREATE INDEX idx_email ON student(student_email);
DROP INDEX idx_email ON student;
CREATE VIEW student_view AS
SELECT student_id, student_name
FROM student;
DROP VIEW student_view;
DELIMITER $$

CREATE PROCEDURE findByName(IN search_name VARCHAR(50))
BEGIN
    SELECT student_id, student_name
    FROM student
    WHERE student_name LIKE CONCAT('%', search_name, '%');
END $$

DELIMITER ;
CALL findByName('Nguyen');