package com.example.school.model.dao.student_dao;

import com.example.school.model.Student;

import java.sql.SQLException;
import java.util.List;

public interface IStudentDAO {
    public void insertStudent(Student student) throws SQLException;
    public Student selectStudent(String id);
    public List<Student> selectAllStudent();
    public void updateStudent(Student student) throws SQLException;
    public void deleteStudent(String id) throws SQLException;
    public List<Student> sortStudentByScore();
    public List<Student> rankStudentByScore();
}
