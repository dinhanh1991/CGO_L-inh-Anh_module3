use studentmanagement;
SELECT *
FROM Subjecta
WHERE Credit = (SELECT MAX(Credit) FROM Subjecta);
SELECT s.sub_name, MAX(m.Mark) AS highest_score
FROM subjecta s
JOIN mark m ON s.Subid = m.Subid
group by s.sub_name;
SELECT s.sub_name, m.Mark
FROM subjecta s
JOIN mark m ON s.Subid = m.Subid
WHERE m.Mark = (SELECT MAX(Mark) FROM mark);
SELECT s.StudentName, s.Student_id, AVG(m.Mark) AS average_score
FROM student s
JOIN mark m ON s.Student_id = m.Student_id
GROUP BY s.Student_id, s.StudentName
ORDER BY average_score DESC;