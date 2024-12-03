USE school;
CREATE TABLE teacher (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    class_name VARCHAR(50) UNIQUE,
    subject ENUM('Toán', 'Lý', 'Hóa', 'Văn', 'Sử', 'Địa', 'Anh', 'Tin học', 'Thể dục', 'Giáo dục công dân') NOT NULL
);
CREATE TABLE class (
    id INT AUTO_INCREMENT PRIMARY KEY,
    class_name VARCHAR(50) NOT NULL UNIQUE, 
    teacher_id INT UNIQUE,
    total_students INT DEFAULT 0,
    FOREIGN KEY (teacher_id) REFERENCES teacher(id),
    CHECK (class_name REGEXP '^(10|11|12)(A|B|C)[1-9][0-9]*$') 
);
CREATE TABLE student (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    class_name VARCHAR(50),
    teacher_id INT,
    average_score FLOAT,
    UNIQUE (name, class_name),
    FOREIGN KEY (class_name) REFERENCES class(class_name),
    FOREIGN KEY (teacher_id) REFERENCES teacher(id)
);
CREATE TABLE result (
    id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT NOT NULL,
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
    FOREIGN KEY (student_id) REFERENCES student(id)
);
CREATE TABLE teacher_assignment (
    id INT AUTO_INCREMENT PRIMARY KEY,
    teacher_id INT NOT NULL,
    subject VARCHAR(50) NOT NULL,
    teaching_classes TEXT NOT NULL,
    homeroom_class VARCHAR(50),
    FOREIGN KEY (teacher_id) REFERENCES teacher(id),
    FOREIGN KEY (homeroom_class) REFERENCES class(class_name),
    CHECK (homeroom_class REGEXP '^(10|11|12)(A|B|C)[1-9][0-9]*$' OR homeroom_class IS NULL)
);
ALTER TABLE teacher DROP INDEX class_name;
ALTER TABLE student 
ADD COLUMN password VARCHAR(255) NOT NULL;
INSERT INTO teacher (name, email, class_name, subject) VALUES
('Nguyễn Văn A', 'nguyenvana@example.com', '10A1', 'Toán'),
('Trần Thị B', 'tranthib@example.com', '11B1', 'Lý'),
('Lê Quang C', 'lequangc@example.com', '12C1', 'Hóa'),
('Phạm Thị D', 'phamthid@example.com', '10A1', 'Văn'),
('Nguyễn Thị E', 'nguyenthie@example.com', '11B1', 'Sử');
INSERT INTO class (class_name, teacher_id, total_students) VALUES
('10A1', 1, 30),
('11B1', 2, 28),
('12C1', 3, 32),
('10A2', 4, 25),
('11B2', 5, 27);
INSERT INTO student (name, class_name, teacher_id, average_score) VALUES
('Lê Minh H', '10A1', 1, 8.5),
('Nguyễn Mai T', '10A1', 1, 7.8),
('Trần Quang L', '11B1', 2, 9.0),
('Phan Ánh M', '11B1', 2, 6.5),
('Đỗ Lệ P', '12C1', 3, 8.2),
('Vũ Thiện Q', '12C1', 3, 7.0);
INSERT INTO result (student_id, math, physics, chemistry, literature, history, geography, english, informatics, physical_education, civic_education, average_score) VALUES
(1, 9.0, 8.5, 8.7, 7.5, 8.0, 9.0, 8.5, 9.0, 8.0, 8.0, 8.4),
(2, 7.5, 7.2, 8.0, 7.8, 6.5, 7.8, 8.0, 8.0, 7.5, 7.5, 7.6),
(3, 9.5, 9.0, 9.2, 8.5, 9.0, 8.8, 9.0, 9.5, 9.0, 9.0, 9.2),
(4, 6.8, 6.5, 7.0, 6.7, 6.0, 6.5, 7.0, 6.8, 6.5, 6.2, 6.5),
(5, 8.0, 8.0, 8.5, 8.2, 8.0, 7.8, 8.5, 8.0, 8.0, 8.2, 8.1),
(6, 7.5, 7.2, 7.8, 7.0, 7.5, 7.0, 7.8, 7.5, 7.0, 7.5, 7.4);
INSERT INTO teacher_assignment (teacher_id, subject, teaching_classes, homeroom_class) VALUES
(1, 'Toán', '10A1, 10A2', '10A1'),
(2, 'Lý', '11B1, 11B2', '11B1'),
(3, 'Hóa', '12C1', '12C1'),
(4, 'Văn', '10A1, 10A2', '10A2'),
(5, 'Sử', '11B1, 11B2', '11B1');
