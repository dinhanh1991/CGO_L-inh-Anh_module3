package com.example.school.respoitory.class_dao;

import com.example.school.model.SchoolClass;
import com.example.school.respoitory.db_connection.DBConnection;

import java.sql.*;
import java.util.*;

import static java.sql.DriverManager.getConnection;

public class ClassDAO implements IClass {
    private static final String INSERT_CLASS_SQL = "{CALL Insert_class(?,?)}";
    private final String SELECT_CLASS_SQL = "SELECT id,class_name,teacher_id,total_students from class where id  =? ";
    private final String SELECT_ALL_CLASS_SQL = "SELECT * from class ";
    private final String GET_INFORMATION_BY_NAME_SQL = "SELECT c.class_name AS \"Class Name\", t.name AS \"Homeroom Teacher\",     s.id AS \"Student ID\",     s.name AS \"Student Name\", s.average_score AS \"Average Score\" FROM class c LEFT JOIN teacher t ON c.teacher_id = t.id LEFT JOIN student s ON c.class_name = s.class_name WHERE c.class_name = ?";
    private final DBConnection dbConnection = new DBConnection();
    private final Connection connection = dbConnection.getConnection();

    @Override
    public void insertClass(SchoolClass schoolClass) throws SQLException {
        connection.setAutoCommit(false);
        try (CallableStatement callableStatement = connection.prepareCall(INSERT_CLASS_SQL)) {
            callableStatement.setString(1, schoolClass.getClassName());
            callableStatement.execute();

            connection.commit();
        } catch (SQLException e) {
            connection.rollback();
            System.err.println("Error while inserting class: " + e.getMessage());
        } finally {
            try {
                connection.setAutoCommit(true);
            } catch (SQLException e) {
                System.err.println("Error while resetting auto-commit: " + e.getMessage());
            }
        }
    }

    @Override
    public SchoolClass selectClass(String id) {
        SchoolClass schoolClass = null;
        try(PreparedStatement preparedStatement = connection.prepareStatement(SELECT_CLASS_SQL)){
            preparedStatement.setString(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                String className = resultSet.getString("class_name");
                String teacherId = resultSet.getString("teacher_id");
                int totalStudents = resultSet.getInt("total_students");
                schoolClass = new SchoolClass(id, className, teacherId, totalStudents);
            }
        }catch (SQLException e) {
            System.err.println("Error while selecting class: " + e.getMessage());
        }
        return schoolClass;
    }

    @Override
    public List<SchoolClass> selectAllClasses() {
        List<SchoolClass> schoolClasses = new ArrayList<>();
        try(PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_CLASS_SQL)) {
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                String id = resultSet.getString("id");
                String className = resultSet.getString("class_name");
                String teacherId = resultSet.getString("teacher_id");
                int totalStudents = resultSet.getInt("total_students");
                schoolClasses.add(new SchoolClass(id,className, teacherId, totalStudents));
            }
        }catch (SQLException e) {
            System.err.println("Error while selecting classes: " + e.getMessage());
        }
        return schoolClasses;
    }
    @Override
    public  List<Map<String, Object>> searchClass(String className) {
        List<Map<String, Object>> classes = new ArrayList<>();
        try (PreparedStatement preparedStatement = connection.prepareStatement(GET_INFORMATION_BY_NAME_SQL)) {
            preparedStatement.setString(1, className);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                Map<String, Object> classInfo = new HashMap<>();
                classInfo.put("teacherName", resultSet.getString("Homeroom Teacher"));
                classInfo.put("studentId", resultSet.getString("Student ID"));
                classInfo.put("studentName", resultSet.getString("Student Name"));
                classInfo.put("averageScore", resultSet.getFloat("Average Score"));

                classes.add(classInfo);
            }
        } catch (SQLException e) {
            System.err.println("Error while selecting class: " + e.getMessage());
        }
        return classes;
    }
    public List<SchoolClass> searchClassesByKeyword(String keyword) throws SQLException {
        List<SchoolClass> classes = new ArrayList<>();
        String sql = "SELECT * FROM class WHERE class_name LIKE ?";
        try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setString(1, "%" + keyword + "%");
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                String id = resultSet.getString("id");
                String className = resultSet.getString("class_name");
                String teacherId = resultSet.getString("teacher_id");
                int totalStudents = resultSet.getInt("total_students");
                classes.add(new SchoolClass(id, className, teacherId, totalStudents));
            }
        }
        return classes;
    }

}
