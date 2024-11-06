select student.student_name,class.class_name
from student
-- inner join class on student.class_id=class.class_id;
RIGHT JOIN class ON student.class_id = class.class_id;