use studentmanagement;
select address,count(Student_id) as 'Số lượng học viên'
from student
group by Address;
select s.student_id,s.StudentName,avg(mark)
from student s join mark m on s.Student_id=m.Student_id
group by s.Student_id,s.StudentName;
select s.studentName,s.student_id, avg(mark)
from student s join mark m on s.Student_id=m.Student_id
group by s.Student_id,s.StudentName;
select s.student_id, s.studentName,avg(mark)
from student s join mark m on s.Student_id=m.Student_id
group by s.Student_id,s.StudentName
 having avg(Mark)>15;
 select s.studentName,s.student_id, avg(mark)
from student s join mark m on s.Student_id=m.Student_id
group by s.Student_id,s.StudentName;
select s.student_id, s.studentName,avg(mark)
from student s join mark m on s.Student_id=m.Student_id
group by s.Student_id,s.StudentName
having avg(Mark) >= all(select avg(Mark) from mark group by mark.Student_id);