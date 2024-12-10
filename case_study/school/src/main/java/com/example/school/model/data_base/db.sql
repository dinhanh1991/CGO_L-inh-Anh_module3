use highschool;
CREATE TABLE teacher (
     id varchar(20) PRIMARY KEY not null,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL ,
    homeroom_class VARCHAR(50) ,
    subject varchar(50) NOT NULL,
    teaching_class varchar(50),
    password varchar(50) default '123456',
     CHECK (teaching_class REGEXP '^(10|11|12)(A|B|C)[1-9][0-9]*$') ,
      CHECK (homeroom_class REGEXP '^(10|11|12)(A|B|C)[1-9][0-9]*$') 
    
);
CREATE TABLE class (
    id varchar(20) PRIMARY KEY,
    class_name VARCHAR(50) NOT NULL UNIQUE , 
    teacher_id varchar(20) NOT null,
    total_students INT ,
    FOREIGN KEY (teacher_id) REFERENCES teacher(id),
    CHECK (class_name REGEXP '^(10|11|12)(A|B|C)[1-9][0-9]*$') 
);
CREATE TABLE student (
   id varchar(20) PRIMARY KEY not null,
    name VARCHAR(100) NOT NULL,
    class_name VARCHAR(50),
    teacher_id varchar(20) NOT null,
    average_score FLOAT,
    email varchar(50),
    password varchar(50) default '123456',
    UNIQUE (name, class_name),
    FOREIGN KEY (class_name) REFERENCES class(class_name),
    FOREIGN KEY (teacher_id) REFERENCES teacher(id)
);
CREATE TABLE result (
   id varchar(20) PRIMARY KEY,
    student_id VARCHAR(20) NOT NULL,
    math FLOAT,
    physics FLOAT,
    chemistry FLOAT,
    literature FLOAT,
    history FLOAT,
    geography FLOAT,
    english FLOAT,
    informatics FLOAT,
    physical_education FLOAT,
    civic_education FLOAT,
    average_score FLOAT,
    FOREIGN KEY (student_id) REFERENCES student(id)ON DELETE CASCADE
);
CREATE TABLE teacher_assignment (
   id varchar(20) PRIMARY KEY,
    TEACHER_ID varchar(20) NOT NULL,
    homeroom_class VARCHAR(50),
    subject varchar(50) NOT NULL,
    teaching_class varchar(50),
    FOREIGN KEY (teacher_id) REFERENCES teacher(id) ON UPDATE CASCADE ON DELETE CASCADE,
    CHECK (teaching_class REGEXP '^(10|11|12)(A|B|C)[1-9][0-9]*$') ,
      CHECK (homeroom_class REGEXP '^(10|11|12)(A|B|C)[1-9][0-9]*$') 
);
INSERT INTO student (id, name, class_name, teacher_id, average_score, email) VALUES
('10A1001','Trần Văn Ân', '10A1', 'T01', 8.0, 'antran@gmail.com'),
('10A1002','Tần Hông Miên', '10A1', 'T01', 7.0, 'mientran@gmail.com'),
('10A1003','Cam Bảo Bảo', '10A1', 'T01', 9.0, 'baobao@gmail.com'),
('10A2001','Đoàn Diên Khánh', '10A2', 'T02', 5.0, 'khanhdoan@gmail.com'),
('10A2002','Chu Thông', '10A2', 'T02', 6.5, 'thongchu@gmail.com'),
('11B1001','Mai Siêu Phong', '11B1', 'T03', 7.8, 'tromkinhthu@gmail.com'),
('11B1002','Trần Huyền Phong', '11B1', 'T03', 8.0, 'tromnudode@gmail.com'),
('11B1003','Khúc Linh Phong', '11B1', 'T03', 7.4, 'tromkhobau@gmail.com'),
('11B2001','Khang Mẫn', '11B2', 'T04', 5.2, 'soatu@gmail.com'),
('11B2002','Nguyễn A châu', '11B2', 'T04', 8.9, 'chaunguyen@gmail.com'),
('11B2003','Nguyễn A Tử', '11B2', 'T04', 4.9, 'acnu@gmail.com'),
('11B2004','Nguyễn Tinh Trúc', '11B2', 'T04', 5.7, 'soatu@gmail.com'),
('11B3001','Viên Thừa Chí', '11B3', 'T05', 7.6, 'yeuduoi@gmail.com'),
('11B3002','Hạ Thanh Thanh', '11B3', 'T05', 6.9, 'hayghen@gmail.com'),
('11B3003','Vi Tieu Bao', '11B3', 'T05', 9.0, 'luumanhnghiakhi@gmail.com'),
('11B3004','Triệu Thị Mẫn', '11B3', 'T05', 8.6, 'yeunumongco@gmail.com'),
('12C3001','Trịnh Thi Hà', '12C1', 'T06', 8.1, 'yeunuhanghieu@gmail.com'),
('12C3002','Mộc Uyển Thanh', '12C1', 'T06', 9.1, 'depgai@gmail.com'),
('12C3004','Doãn Chí Bình', '12C1', 'T06', 9.1, 'daosi@gmail.com'),
('12C3005','Dương Thiết Tâm', '12C2', 'T07', 9.7, 'daosi@gmail.com');
INSERT INTO teacher (id, name, email, homeroom_class, subject, teaching_class) VALUES
('T01', 'Nguyễn Văn A', 'teacher01@gmail.com', '10A1', 'Math', '10A1'),
('T02', 'Trần Thị B', 'teacher02@gmail.com', '10A2', 'Physics', '10A2'),
('T03', 'Lê Văn C', 'teacher03@gmail.com', '11B1', 'Literature', '11B1'),
('T04', 'Phạm Thị D', 'teacher04@gmail.com', '11B2', 'History', '11B2'),
('T05', 'Hoàng Văn E', 'teacher05@gmail.com', '11B3', 'Chemistry', '11B3'),
('T06', 'Vũ Thị F', 'teacher06@gmail.com', '12C1', 'English', '12C1'),
('T07', 'Đặng Văn G', 'teacher07@gmail.com', '12C2', 'Geography', '12C2');
INSERT INTO teacher (id, name, email, homeroom_class, subject, teaching_class) VALUES
('T08', 'Hoàng Dược Sư', 'duocsu@gmail.com', Null, 'Infomation', '10A1'),
('T09', 'Trần Thị B', 'teacher02@gmail.com', Null, 'physical_education', '10A2'),
('T10', 'Lê Văn C', 'teacher03@gmail.com', Null, ' civic_education', '11B1');
INSERT INTO class (id, class_name, teacher_id, total_students) VALUES
('C01', '10A1', 'T01', 3),
('C02', '10A2', 'T02', 2),
('C03', '11B1', 'T03', 3),
('C04', '11B2', 'T04', 4),
('C05', '11B3', 'T05', 4),
('C06', '12C1', 'T06', 3),
('C07', '12C2', 'T07', 1);
INSERT INTO teacher_assignment (id, teacher_id, homeroom_class, subject, teaching_class) VALUES
('A01', 'T01', '10A1', 'Math', '10A1'),
('A02', 'T02', '10A2', 'Physics', '10A2'),
('A03', 'T03', '11B1', 'Literature', '11B1'),
('A04', 'T04', '11B2', 'History', '11B2'),
('A05', 'T05', '11B3', 'Chemistry', '11B3'),
('A06', 'T06', '12C1', 'English', '12C1'),
('A07', 'T07', '12C2', 'Geography', '12C2'),

('A08', 'T08', NULL, 'Infomation', '10A1'),
('A09', 'T09', NULL, 'physical_education', '10A2'),
('A10', 'T10', NULL, 'civic_education', '11B1');
INSERT INTO result (id, student_id, math, physics, chemistry, literature, history, geography, english, informatics, physical_education, civic_education, average_score) VALUES
('R01', '10A1001', 8.0, 7.5, 8.5, 9.0, 7.8, 8.2, 8.0, 8.5, 8.0, 7.9, 8.0),
('R02', '10A1002', 7.0, 7.0, 7.2, 8.0, 6.8, 7.0, 7.5, 7.3, 7.1, 6.9, 7.0),
('R03', '10A1003', 9.0, 8.5, 9.2, 9.5, 8.8, 9.0, 9.1, 9.0, 9.0, 8.9, 9.0),
('R04', '10A2001', 5.0, 4.8, 5.2, 5.5, 5.0, 5.1, 5.3, 5.2, 5.0, 5.0, 5.0),
('R05', '10A2002', 6.5, 6.0, 6.7, 7.0, 6.5, 6.8, 6.9, 6.7, 6.5, 6.4, 6.5),
('R06', '11B1001', 7.8, 7.5, 7.6, 8.0, 7.9, 7.8, 7.7, 7.6, 7.5, 7.4, 7.8),
('R07', '11B1002', 8.0, 7.9, 8.2, 8.5, 8.1, 8.0, 8.0, 8.0, 7.9, 7.8, 8.0),
('R08', '11B1003', 7.4, 7.2, 7.5, 7.8, 7.5, 7.4, 7.3, 7.2, 7.4, 7.3, 7.4),
('R09', '11B2001', 5.2, 5.0, 5.3, 5.5, 5.2, 5.3, 5.1, 5.0, 5.2, 5.0, 5.2),
('R10', '11B2002', 8.9, 8.5, 8.7, 9.0, 8.8, 8.9, 8.8, 8.7, 8.6, 8.5, 8.9),
('R11', '11B2003', 4.9, 5.0, 4.8, 5.0, 5.1, 4.9, 4.8, 5.0, 4.7, 4.6, 4.9),
('R12', '11B2004', 5.7, 5.8, 5.6, 5.5, 5.7, 5.6, 5.5, 5.4, 5.3, 5.2, 5.7),
('R13', '11B3001', 7.6, 7.5, 7.4, 7.8, 7.6, 7.7, 7.5, 7.4, 7.3, 7.2, 7.6),
('R14', '11B3002', 6.9, 7.0, 7.2, 7.1, 6.9, 7.0, 6.8, 6.7, 6.6, 6.5, 6.9),
('R15', '11B3003', 9.0, 8.8, 9.2, 9.1, 9.0, 9.0, 9.1, 9.0, 9.2, 9.3, 9.0),
('R16', '11B3004', 8.6, 8.7, 8.5, 8.8, 8.7, 8.6, 8.8, 8.7, 8.5, 8.4, 8.6),
('R17', '12C3001', 8.1, 8.0, 8.2, 8.3, 8.1, 8.0, 8.1, 8.0, 8.2, 8.1, 8.1),
('R18', '12C3002', 9.1, 9.0, 9.2, 9.3, 9.1, 9.2, 9.0, 9.1, 9.3, 9.2, 9.1),
('R19', '12C3004', 9.1, 9.2, 9.0, 9.3, 9.1, 9.2, 9.0, 9.1, 9.2, 9.1, 9.1),
('R20', '12C3005', 9.7, 9.6, 9.8, 9.9, 9.7, 9.8, 9.9, 9.7, 9.6, 9.5, 9.7);
INSERT INTO class (id, class_name,teacher_id,total_students) VALUES
('C08', '12C3','T11',0);

INSERT INTO result (id, student_id, math, physics, chemistry, literature, history, geography, english, informatics, physical_education, civic_education, average_score)
VALUES
    ('R01', '10A1001', 7.8, 8.2, 8.1, 5.6, 6.7, 7.5, 8.3, 8.7, 5.9, 7.7, 7.45),
    ('R02', '10A1002', 7.0, 7.0, 7.2, 8.0, 6.8, 7.0, 7.5, 7.3, 7.1, 6.9, 7.0),
    ('R03', '10A1003', 9.0, 8.5, 9.2, 9.5, 8.8, 9.0, 9.1, 9.0, 9.0, 8.9, 9.0),
    ('R04', '10A2001', 5.0, 4.8, 5.2, 5.5, 5.0, 5.1, 5.3, 5.2, 5.0, 5.0, 5.0),
    ('R05', '10A2002', 6.5, 6.0, 6.7, 7.0, 6.5, 6.8, 6.9, 6.7, 6.5, 6.4, 6.5),
    ('R06', '11B1001', 7.8, 7.5, 7.6, 8.0, 7.9, 7.8, 7.7, 7.6, 7.5, 7.4, 7.8),
    ('R07', '11B1002', 8.0, 7.9, 8.2, 8.5, 8.1, 8.0, 8.0, 8.0, 7.9, 7.8, 8.0),
    ('R08', '11B1003', 7.4, 7.2, 7.5, 7.8, 7.5, 7.4, 7.3, 7.2, 7.4, 7.3, 7.4),
    ('R09', '11B2001', 5.2, 5.0, 5.3, 5.5, 5.2, 5.3, 5.1, 5.0, 5.2, 5.0, 5.2),
    ('R10', '11B2002', 8.9, 8.5, 8.7, 9.0, 8.8, 8.9, 8.8, 8.7, 8.6, 8.5, 8.9),
    ('R11', '11B2003', 4.9, 5.0, 4.8, 5.0, 5.1, 4.9, 4.8, 5.0, 4.7, 4.6, 4.9),
    ('R12', '11B2004', 5.7, 5.8, 5.6, 5.5, 5.7, 5.6, 5.5, 5.4, 5.3, 5.2, 5.7),
    ('R13', '11B3001', 7.6, 7.5, 7.4, 7.8, 7.6, 7.7, 7.5, 7.4, 7.3, 7.2, 7.6),
    ('R14', '11B3002', 6.9, 7.0, 7.2, 7.1, 6.9, 7.0, 6.8, 6.7, 6.6, 6.5, 6.9),
    ('R15', '11B3003', 9.0, 8.8, 9.2, 9.1, 9.0, 9.0, 9.1, 9.0, 9.2, 9.3, 9.0),
    ('R16', '11B3004', 8.6, 8.7, 8.5, 8.8, 8.7, 8.6, 8.8, 8.7, 8.5, 8.4, 8.6),
    ('R18', '12C3002', 9.1, 9.0, 9.2, 9.3, 9.1, 9.2, 9.0, 9.1, 9.3, 9.2, 9.1),
    ('R19', '12C3004', 9.1, 9.2, 9.0, 9.3, 9.1, 9.2, 9.0, 9.1, 9.2, 9.1, 9.1),
    ('R20', '12C3005', 7.0, 7.0, 7.0, 7.0, 7.0, 7.0, 7.0, 7.0, 7.0, 7.0, 7.0);
    SELECT * FROM student ;
 