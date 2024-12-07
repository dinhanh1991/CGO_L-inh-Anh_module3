USE school;
CREATE TABLE teacher (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    class_name VARCHAR(50) UNIQUE,
    subject ENUM('Toán', 'Lý', 'Hóa', 'Văn', 'Sử', 'Địa', 'Anh', 'Tin học', 'Thể dục', 'Giáo dục công dân') NOT NULL,
    teaching_class varchar(50)
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
    FOREIGN KEY (student_id) REFERENCES student(id)ON DELETE CASCADE
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
alter table student
    ADD COLUMN email VARCHAR(255) NOT NULL;
select * from Student;
SELECT
    id,
    name,
    class_name,
    average_score,
    CASE
        WHEN average_score >= 8.0 THEN 'Giỏi'
        WHEN average_score >= 6.5 THEN 'Khá'
        WHEN average_score >= 5.0 THEN 'Trung bình'
        ELSE 'Yếu'
        END AS classification
FROM student
ORDER BY classification, average_score DESC;
DELIMITER //

CREATE PROCEDURE UpdateStudentAndResult(
    IN studentId INT,
    IN studentName VARCHAR(100),
    IN className VARCHAR(50),
    IN teacherId INT,
    IN averageScore FLOAT,
    IN math FLOAT,
    IN physics FLOAT,
    IN chemistry FLOAT,
    IN literature FLOAT,
    IN history FLOAT,
    IN geography FLOAT,
    IN english FLOAT,
    IN informatics FLOAT,
    IN physical_education FLOAT,
    IN civic_education FLOAT
)
BEGIN
    DECLARE oldClassName VARCHAR(50);

    -- Lưu tên lớp hiện tại
SELECT class_name INTO oldClassName FROM student WHERE id = studentId;

-- Cập nhật thông tin học sinh
UPDATE student
SET
    name = studentName,
    class_name = className,
    teacher_id = teacherId,
    average_score = (math + physics + chemistry + literature + history + geography + english + informatics + physical_education + civic_education) / 10
WHERE id = studentId;

-- Cập nhật bảng result
UPDATE result
SET
    math = math,
    physics = physics,
    chemistry = chemistry,
    literature = literature,
    history = history,
    geography = geography,
    english = english,
    informatics = informatics,
    physical_education = physical_education,
    civic_education = civic_education,
    average_score = (math + physics + chemistry + literature + history + geography + english + informatics + physical_education + civic_education) / 10
WHERE student_id = studentId;

-- Cập nhật số học sinh trong lớp
IF oldClassName <> className THEN
        -- Giảm số học sinh của lớp cũ
UPDATE class
SET total_students = total_students - 1
WHERE class_name = oldClassName;

-- Kiểm tra lớp mới có tồn tại không
IF EXISTS (SELECT 1 FROM class WHERE class_name = className) THEN
            -- Tăng số học sinh của lớp mới
UPDATE class
SET total_students = total_students + 1
WHERE class_name = className;
END IF;
END IF;
END //

DELIMITER ;
    DELIMITER $$

CREATE PROCEDURE insert_student (
    IN p_name VARCHAR(100),
    IN p_class_name VARCHAR(50),
    IN p_teacher_id INT,
    IN p_average_score FLOAT,
    IN p_password VARCHAR(255),
    IN p_email VARCHAR(255)
)
BEGIN
    DECLARE class_exists INT;
    DECLARE teacher_exists INT;
    DECLARE last_student_id INT;
SELECT COUNT(*) INTO class_exists
FROM class WHERE class_name = p_class_name;
SELECT COUNT(*) INTO teacher_exists
FROM teacher WHERE class_name = p_class_name;
IF class_exists > 0 THEN
UPDATE class
SET total_students = total_students + 1
WHERE class_name = p_class_name;
END IF;

    IF teacher_exists > 0 THEN
        SET p_teacher_id = (SELECT id FROM teacher WHERE class_name = p_class_name LIMIT 1);
ELSE
        SET p_teacher_id = NULL;
END IF;

INSERT INTO student (name, class_name, teacher_id, average_score, password, email)
VALUES (p_name, p_class_name, p_teacher_id, p_average_score, p_password, p_email);

SET last_student_id = LAST_INSERT_ID();

INSERT INTO result (student_id, math, physics, chemistry, literature, history, geography, english, informatics, physical_education, civic_education, average_score)
VALUES (last_student_id, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, p_average_score);
END$$

DELIMITER ;
DELIMITER $$

CREATE PROCEDURE UpdateTeacherAndAssignment(
    IN teacherId INT,
    IN teacherName VARCHAR(100),
    IN teacherEmail VARCHAR(100),
    IN homeRoomClassName VARCHAR(50),
    IN subject VARCHAR(50),
    IN teachingClass VARCHAR(50),
    IN assignmentSubject VARCHAR(50),
    IN assignmentTeachingClasses TEXT,
    IN assignmentHomeroomClass VARCHAR(50)
)
BEGIN
    DECLARE homeroomClass VARCHAR(50);
    DECLARE newTeacherId INT;

    -- Kiểm tra giáo viên có phải là giáo viên chủ nhiệm không
SELECT homeroom_class INTO homeroomClass
FROM teacher_assignment
WHERE teacher_id = teacherId;

-- Nếu giáo viên có lớp chủ nhiệm, tìm giáo viên thay thế chưa có lớp chủ nhiệm
IF homeroomClass IS NOT NULL THEN
        -- Chọn ngẫu nhiên giáo viên chưa chủ nhiệm lớp nào
SELECT id INTO newTeacherId
FROM teacher
WHERE id NOT IN (SELECT teacher_id FROM teacher_assignment WHERE homeroom_class IS NOT NULL)
ORDER BY RAND()  -- Sắp xếp ngẫu nhiên
    LIMIT 1;

-- Nếu có giáo viên thay thế, cập nhật các bảng liên quan
IF newTeacherId IS NOT NULL THEN
            -- Cập nhật bảng class: Gán giáo viên thay thế vào lớp chủ nhiệm cũ
UPDATE class
SET teacher_id = newTeacherId
WHERE class_name = homeroomClass;

-- Cập nhật bảng teacher_assignment: Gán lớp chủ nhiệm cho giáo viên mới
UPDATE teacher_assignment
SET homeroom_class = homeroomClass
WHERE teacher_id = newTeacherId;

-- Cập nhật bảng student: Cập nhật teacher_id cho học sinh
UPDATE student
SET teacher_id = newTeacherId
WHERE class_name = homeroomClass;
ELSE
            -- Nếu không có giáo viên thay thế, báo lỗi
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No available teacher to replace the homeroom teacher';
END IF;
END IF;

    -- Cập nhật bảng teacher với thông tin mới
UPDATE teacher
SET name = teacherName,
    email = teacherEmail,
    home_room_class_name = homeRoomClassName,
    subject = subject,
    teaching_class = teachingClass
WHERE id = teacherId;

-- Cập nhật bảng teacher_assignment nếu giáo viên có lớp chủ nhiệm mới
IF homeroomClass IS NULL OR homeroomClass <> assignmentHomeroomClass THEN
UPDATE teacher_assignment
SET subject = assignmentSubject,
    teaching_classes = assignmentTeachingClasses,
    homeroom_class = assignmentHomeroomClass
WHERE teacher_id = teacherId;
END IF;

END$$

DELIMITER ;


