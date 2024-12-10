package com.example.school.model.dao.student_dao;

import com.example.school.model.Result;
import com.example.school.model.Student;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public interface IStudentDAO {
    public void insertStudent(Student student,Result result) throws SQLException;
    public Student selectStudent(String id);
    public List<Student> selectAllStudent();
    public boolean updateStudent(Student student, Result result) throws SQLException;
    public boolean deleteStudent(String id) throws SQLException;
    public List<Student> sortStudentByScore(String orderType, String field) throws SQLException;
    public List<Student> classifyStudent();
}
