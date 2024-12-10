DELIMITER //
CREATE PROCEDURE DELETE_STUDENT(
    IN studentID  VARCHAR(20)
)
BEGIN
DECLARE oldClassName VARCHAR(50);
    
    SELECT class_name INTO oldClassName FROM student WHERE id = ID_STUDENT;
    
    IF oldClassName <> (SELECT class_name FROM student WHERE id = ID_STUDENT) THEN
        UPDATE class
        SET total_students = total_students - 1
        WHERE class_name = oldClassName;
    END IF;

    DELETE FROM student WHERE id = ID_STUDENT;
END;
DELIMITER;
DELIMITER //
CREATE PROCEDURE UpdateStudentAndResult(
   IN studentId VARCHAR(20),
    IN studentName VARCHAR(100),
    IN className VARCHAR(50),
    IN pass_word VARCHAR(50),
    IN email_student VARCHAR(50),
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
    DECLARE n_teacher_id VARCHAR(20);

    IF NOT EXISTS (SELECT 1 FROM class WHERE class_name = className) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Class name does not exist';
    END IF;

    SELECT teacher_id
    INTO n_teacher_id
    FROM class
    WHERE class_name = className;

    SELECT class_name 
    INTO oldClassName 
    FROM student 
    WHERE id = studentId;

    UPDATE student
    SET 
        name = studentName,
        class_name = className,
        teacher_id = n_teacher_id,
        average_score = (
            COALESCE(math, 0) + COALESCE(physics, 0) + COALESCE(chemistry, 0) +
            COALESCE(literature, 0) + COALESCE(history, 0) + COALESCE(geography, 0) +
            COALESCE(english, 0) + COALESCE(informatics, 0) + COALESCE(physical_education, 0) +
            COALESCE(civic_education, 0)
        ) / 10,
        password = pass_word,
        email = email_student
    WHERE id = studentId;

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
        average_score = (
            COALESCE(math, 0) + COALESCE(physics, 0) + COALESCE(chemistry, 0) +
            COALESCE(literature, 0) + COALESCE(history, 0) + COALESCE(geography, 0) +
            COALESCE(english, 0) + COALESCE(informatics, 0) + COALESCE(physical_education, 0) +
            COALESCE(civic_education, 0)
        ) / 10
    WHERE student_id = studentId;

    IF oldClassName IS NOT NULL AND oldClassName <> className THEN
        -- Giảm số học sinh của lớp cũ
        UPDATE class
        SET total_students = total_students - 1
        WHERE class_name = oldClassName;

        UPDATE class
        SET total_students = total_students + 1
        WHERE class_name = className;
    END IF;
    END;
DELIMITER;
DELIMITER //
CREATE PROCEDURE GetStudentClassification()
BEGIN
 SELECT id, 
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
END;
DELIMITER;
DELIMITER //
CREATE  PROCEDURE insert_teacher(
    IN p_id varchar(20),
    IN p_name VARCHAR(100),
    IN p_email VARCHAR(100),
    IN p_home_room_class VARCHAR(50),
    IN p_subject varchar(50),
    IN p_teaching_classes VARCHAR(50),
    In p_aTeacher_id varchar(20)
)
BEGIN
    DECLARE class_exists INT;
    DECLARE last_teacher_id varchar(20);
    declare new_teacher_id varchar(20);

    SELECT COUNT(*) INTO class_exists
    FROM class
    WHERE class_name = p_home_room_class;

    IF class_exists > 0 THEN

        SELECT id INTO last_teacher_id
        FROM teacher
        WHERE class_name = p_home_room_class
        LIMIT 1;
        UPDATE teacher
        SET class_name = NULL
        WHERE id = last_teacher_id;
    END IF;
    INSERT INTO teacher (id,name, email, homeroom_class, subject, teaching_class)
    VALUES (p_id, p_name, p_email, p_home_room_class, p_subject, p_teaching_classes);
    SET new_teacher_id = LAST_INSERT_ID();
    insert into teacher_assignment (id,teacher_id,subject,teaching_classes,homeroom_class)
   VALUES (p_aTeacher_id, new_teacher_id, p_subject, p_teaching_classes, p_home_room_class);
    UPDATE class c
    JOIN teacher t ON c.class_name = t.class_name
    SET c.teacher_id = t.id;

    UPDATE student s
    JOIN teacher t ON s.class_name = t.class_name
    SET s.teacher_id = t.id;

    UPDATE teacher_assignment ta
    JOIN teacher t ON ta.teacher_id = t.id
    SET 
        ta.teacher_id = t.id,
        ta.subject = t.subject,
        ta.teaching_classes = t.teaching_class,
        ta.homeroom_class = t.class_name;
END;
DELIMITER;
DELIMITER //
CREATE  PROCEDURE Delete_teacher (IN id_teacher VARCHAR(20))
BEGIN
    DECLARE v_old_homeroom_class VARCHAR(50);

    -- Kiểm tra giáo viên có tồn tại hay không
    IF NOT EXISTS (SELECT 1 FROM teacher WHERE id = id_teacher) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Teacher does not exist';
    END IF;

    -- Lấy lớp chủ nhiệm hiện tại của giáo viên
    SELECT class_name INTO v_old_homeroom_class
    FROM teacher
    WHERE id = id_teacher;

    -- Xử lý logic nếu không có lớp chủ nhiệm
    IF v_old_homeroom_class IS NULL THEN
    DELETE FROM class WHERE teacher_id = id_teacher;
        DELETE FROM teacher WHERE id = id_teacher;
    ELSE
        -- Chuyển lớp chủ nhiệm cho giáo viên khác (nếu cần)
        UPDATE teacher
        SET class_name = v_old_homeroom_class
        WHERE class_name IS NULL
        ORDER BY RAND()
        LIMIT 1;
        -- Xóa giáo viên
        DELETE FROM teacher WHERE id = id_teacher;
    END IF;

   
    UPDATE class c
    JOIN teacher t ON c.class_name = t.class_name
    SET c.teacher_id = t.id;

    UPDATE student s
    JOIN teacher t ON s.class_name = t.class_name
    SET s.teacher_id = t.id;

    UPDATE teacher_assignment ta
    JOIN teacher t ON ta.teacher_id = t.id
    SET 
        ta.teacher_id = t.id,
        ta.subject = t.subject,
        ta.teaching_classes = t.teaching_class,
        ta.homeroom_class = t.class_name;
END;
DELIMITER;
DELIMITER //
CREATE  PROCEDURE UpdateTeacherAndAssignment (
	IN p_teacher_id VARCHAR(20),
    IN p_name VARCHAR(100),
    IN p_email VARCHAR(100),
    IN p_subject VARCHAR(50),
    IN p_class_name VARCHAR(50),
    IN p_teaching_class VARCHAR(50))
BEGIN
    DECLARE v_old_homeroom_class VARCHAR(50);
     DECLARE v_teacher_id VARCHAR(20);
    -- Kiểm tra xem giáo viên có tồn tại không
    IF NOT EXISTS (SELECT 1 FROM teacher WHERE id = p_teacher_id) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Teacher does not exist';
    END IF;
    -- Lấy lớp chủ nhiệm cũ của giáo viên
    SELECT class_name INTO v_old_homeroom_class
    FROM teacher
    WHERE id = p_teacher_id;
    if v_old_homeroom_class is null then
    if (SELECT COUNT(*) FROM class WHERE class_name = p_class_name) <1 or p_class_name is null  then
    UPDATE teacher
        SET name = p_name, email = p_email, subject = p_subject, class_name = null,teaching_class =p_teaching_class
        WHERE id = p_teacher_id;
        else
        update teacher
        set class_name = null
        where class_name =p_class_name;
        UPDATE teacher
        SET name = p_name, email = p_email, subject = p_subject, class_name = p_class_name,teaching_class =p_teaching_class
        WHERE id = p_teacher_id;
    end if ;
    else
    if (SELECT COUNT(*) FROM class WHERE class_name = p_class_name) <1 or p_class_name is null  then
    SELECT id INTO v_teacher_id FROM teacher WHERE class_name IS NULL ORDER BY RAND() LIMIT 1;
    update teacher
    set class_name=v_old_homeroom_class
	WHERE id = v_teacher_id;
UPDATE teacher
        SET name = p_name, email = p_email, subject = p_subject, class_name = null,teaching_class =p_teaching_class
        WHERE id = p_teacher_id;
        else 
         SELECT id INTO v_teacher_id FROM teacher WHERE class_name IS NULL ORDER BY RAND() LIMIT 1;
        update teacher
    set class_name=v_old_homeroom_class
	WHERE id = v_teacher_id;
UPDATE teacher
        SET name = p_name, email = p_email, subject = p_subject, class_name = p_class_name,teaching_class =p_teaching_class
        WHERE id = p_teacher_id;
    end if ;
    end if;
    UPDATE class c
JOIN teacher t ON c.class_name = t.class_name
SET c.teacher_id = t.id;
UPDATE student s
JOIN teacher t ON s.class_name = t.class_name
SET s.teacher_id = t.id;
 UPDATE teacher_assignment ta
JOIN teacher t ON ta.teacher_id = t.id
SET ta.teaching_classes = t.teaching_class,
    ta.homeroom_class = t.class_name,
    ta.subject=t.subject; 
END;
DELIMITER;
DELIMITER //
CREATE PROCEDURE insert_student(
    IN studentID  VARCHAR(20),
    IN studentName VARCHAR(100),
    IN className VARCHAR(50),
    IN pass_word VARCHAR(50),
    IN email_student VARCHAR(50),
    IN idResult VARCHAR(20),
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
    DECLARE n_teacher_id INT;
    DECLARE n_average_score FLOAT;
    DECLARE new_student_id INT;
    
    SET n_average_score = (
        COALESCE(math, 0) + COALESCE(physics, 0) + COALESCE(chemistry, 0) +
        COALESCE(literature, 0) + COALESCE(history, 0) + COALESCE(geography, 0) +
        COALESCE(english, 0) + COALESCE(informatics, 0) + COALESCE(physical_education, 0) +
        COALESCE(civic_education, 0)
    ) / 10;
    IF NOT EXISTS (SELECT 1 FROM class WHERE class_name = className) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Class name does not exist';
    END IF;

    SELECT teacher_id
    INTO n_teacher_id
    FROM class
    WHERE class_name = className;

    INSERT INTO student (id,name, class_name, teacher_id, average_score, password, email)
    VALUES (studentID,studentName, className, n_teacher_id, n_average_score, pass_word, email_student);
    -- Lấy giá trị ID tự động tăng của học sinh vừa được thêm
    SET new_student_id = LAST_INSERT_ID();
    -- Thêm thông tin vào bảng result
    INSERT INTO result (id,student_id, math, physics, chemistry, literature, history, geography, english, informatics, physical_education, civic_education, average_score)
    VALUES (idResult,new_student_id, math, physics, chemistry, literature, history, geography, english, informatics, physical_education, civic_education, n_average_score);
    -- Tăng số học sinh của lớp mới
    UPDATE class
    SET total_students = total_students + 1
    WHERE class_name = className;
END;
DELIMITER;
DELIMITER $$

CREATE PROCEDURE Insert_class(
    IN class_name VARCHAR(50),
    IN total_students INT
)
BEGIN
    DECLARE teacher_id VARCHAR(20);
    DECLARE class_exists INT;

    -- Kiểm tra xem tên lớp đã tồn tại chưa
    SELECT COUNT(*) INTO class_exists
    FROM class
    WHERE class_name = class_name;

    IF class_exists > 0 THEN
        -- Nếu lớp đã tồn tại, báo lỗi
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Class name already exists!';
    ELSE
        -- Chọn ngẫu nhiên teacher_id mà homeroom_class là NULL
        SELECT id INTO teacher_id
        FROM teacher
        WHERE homeroom_class IS NULL
        LIMIT 1;

        IF teacher_id IS NOT NULL THEN
            -- Cập nhật homeroom_class của giáo viên được chọn
            UPDATE teacher
            SET homeroom_class = class_name
            WHERE id = teacher_id;

            -- Thêm lớp mới vào bảng class
            INSERT INTO class (class_name, teacher_id, total_students)
            VALUES (class_name, teacher_id, total_students);
        ELSE
            -- Nếu không tìm thấy giáo viên chưa có công tác chủ nhiệm
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No teacher available for homeroom!';
        END IF;
    END IF;
END $$

DELIMITER ;
