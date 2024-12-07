package com.example.school.model.dao.class_dao;

import com.example.school.model.SchoolClass;
import com.example.school.model.Teacher;

import java.sql.SQLException;
import java.util.List;

public interface IClass {
    public void insertClass(SchoolClass schoolClass) throws SQLException;
    public SchoolClass selectClass(int id);
    public List<SchoolClass> selectAllClasses();
    public List<String[]> searchClass(String className);
}
