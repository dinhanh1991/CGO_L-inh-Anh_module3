create database Studentmanagement;
use Studentmanagement;
create table class(
ClassID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,

          ClassName VARCHAR(60) NOT NULL,

          StartDate DATETIME NOT NULL,

          Status BIT
);
create table Student(
Student_id int not null AUTO_INCREMENT PRIMARY KEY,
 StudentName VARCHAR(30) NOT NULL,

          Address VARCHAR(50),

          Phone VARCHAR(20),

          Status BIT,

          ClassId INT NOT NULL,

          FOREIGN KEY (ClassId) REFERENCES Class (ClassID)
);
create table Subjecta(
Subid int not null auto_Increment primary key,
sub_name varchar(30) not null,
Credit TINYINT NOT NULL DEFAULT 1 CHECK ( Credit >= 1 ),
         Status BIT DEFAULT 1
);
create table Mark(
mark_id int not null auto_increment primary key,
Subid int not null,
Student_id int not null,
Mark FLOAT DEFAULT 0 CHECK ( Mark BETWEEN 0 AND 100),
ExamTime Tinyint default 1,
Unique(Subid,Student_id),
foreign key(Subid) references Subjecta(Subid),
foreign key (Student_id) references student(Student_id)
);
insert into class (ClassName,StartDate,Status) value('A1','2008-12-20',1),('A2','2008-12-20',0),('B1',current_date(),0);
insert into student(StudentName,Address,Phone,Status,ClassId) value 
('Hung', 'Ha Noi', '0912113113', 1, 1),
('Hoa', 'Hai phong',null, 1, 1),
('Manh', 'HCM', '0123123123', 0, 2);
INSERT INTO subjecta
VALUES (1, 'CF', 5, 1),
 (2, 'C', 6, 1),
 (3, 'HDJ', 5, 1),
 (4, 'RDBMS', 10, 1);
insert into mark (Subid,Student_id,Mark,ExamTime) value 
(1, 1, 8, 1),
 (1, 2, 10, 2),
 (2, 1, 12, 1);
 Select * from student;
 select * from student
 where status =true;
 select *from subjecta
 where Credit<10;
 SELECT * FROM student
WHERE StudentName LIKE 'h%';
SELECT * FROM class
WHERE MONTH(StartDate) = 12;
SELECT * FROM subjecta
WHERE Credit BETWEEN 3 AND 5;
UPDATE student
SET ClassId = 2
WHERE StudentName = 'Hung' AND Student_id = 1; 
sELECT s.StudentName, sub.sub_name, m.Mark
FROM mark m
JOIN student s ON m.Student_id = s.Student_id
JOIN subjecta sub ON m.Subid = sub.Subid
ORDER BY m.Mark DESC, s.StudentName ASC;
