package com.example.school.model.dao.student_dao;

import com.example.school.model.Student;
import com.example.school.model.dao.db_connection.DBConnection;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.Collections;
import java.util.List;

public class StudentDAO implements IStudentDAO {
    private final DBConnection dbConnection = new DBConnection();
    private final Connection connection=dbConnection.getConnection();
    @Override
    public void insertStudent(Student student) throws SQLException {

    }

    @Override
    public Student selectStudent(String id) {
        return null;
    }

    @Override
    public List<Student> selectAllStudent() {
        return Collections.emptyList();
    }

    @Override
    public void updateStudent(Student student) throws SQLException {

    }

    @Override
    public void deleteStudent(String id) throws SQLException {

    }

    @Override
    public List<Student> sortStudentByScore() {
        return Collections.emptyList();
    }

    @Override
    public List<Student> rankStudentByScore() {
        return Collections.emptyList();
    }
}
