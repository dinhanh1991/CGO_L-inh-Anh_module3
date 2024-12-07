package com.example.school.model.dao.class_dao;

import com.example.school.model.SchoolClass;
import com.example.school.model.dao.db_connection.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class ClassDAO implements IClass {
    private static final String INSERT_CLASS_SQL = "{CALL Insert_class(?)}";
    private final String SELECT_CLASS_SQL = "SELECT id,class_name,teacher_id,total_students from class where id  =? ";
    private final String SELECT_ALL_CLASS_SQL = "SELECT * from class ";
    private final String GET_INFORMATION_BY_NAME_SQL = "SELECT \n" +
            "    c.class_name AS \"Class Name\",\n" +
            "    t.name AS \"Homeroom Teacher\",\n" +
            "    s.id AS \"Student ID\",\n" +
            "    s.name AS \"Student Name\",\n" +
            "    s.average_score AS \"Average Score\"\n" +
            "FROM \n" +
            "    class c\n" +
            "LEFT JOIN teacher t ON c.teacher_id = t.id\n" +
            "LEFT JOIN student s ON c.class_name = s.class_name\n" +
            "WHERE \n" +
            "    c.class_name = ?; ";
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
    public SchoolClass selectClass(int id) {
        SchoolClass schoolClass = null;
        try(PreparedStatement preparedStatement = connection.prepareStatement(SELECT_CLASS_SQL)){
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                String className = resultSet.getString("class_name");
                int teacherId = resultSet.getInt("teacher_id");
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
                String className = resultSet.getString("class_name");
                int teacherId = resultSet.getInt("teacher_id");
                int totalStudents = resultSet.getInt("total_students");
                schoolClasses.add(new SchoolClass(className, teacherId, totalStudents));
            }
        }catch (SQLException e) {
            System.err.println("Error while selecting classes: " + e.getMessage());
        }
        return schoolClasses;
    }
    @Override
    public List<String[]> searchClass(String className) {
        List<String[]> classes = new ArrayList<>();
        try(PreparedStatement preparedStatement =connection.prepareStatement(GET_INFORMATION_BY_NAME_SQL)){
            preparedStatement.setString(1, className);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                String teacherName = resultSet.getString("Homeroom Teacher");
                String studentId = String.valueOf(resultSet.getInt("Student ID"));
                String studentName = resultSet.getString("Student Name");
                String averageScore = String.valueOf(resultSet.getFloat("Average Score"));
                String[] classString ={teacherName,studentId,studentName,averageScore};
                classes.add(classString);
            }
        }catch (SQLException e) {
            System.err.println("Error while selecting class: " + e.getMessage());
        }
        return classes;
    }
}
