package com.example.school.model.dao.teacher_dao;

import com.example.school.model.Result;
import com.example.school.model.Student;
import com.example.school.model.Teacher;
import com.example.school.model.TeacherAssignment;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public interface ITeacherDAO {
    public void insertTeacher(Teacher teacher) throws SQLException;
    public Teacher selectTeacher(int id);
    public List<Teacher> selectAllTeacher();
    public boolean updateTeacher(Teacher teacher) throws SQLException;
    public boolean deleteTeacher(String id) throws SQLException;
}
