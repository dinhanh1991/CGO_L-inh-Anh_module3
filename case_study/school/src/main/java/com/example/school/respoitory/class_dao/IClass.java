package com.example.school.respoitory.class_dao;

import com.example.school.model.SchoolClass;
import com.example.school.model.Teacher;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public interface IClass {
    public void insertClass(SchoolClass schoolClass) throws SQLException;
    public SchoolClass selectClass(String id);
    public List<SchoolClass> selectAllClasses();
    public  List<Map<String, Object>> searchClass(String className);
}
