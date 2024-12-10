package com.example.school.model.dao.teacher_dao;

import com.example.school.model.Teacher;
import com.example.school.model.TeacherAssignment;
import com.example.school.model.dao.db_connection.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class TeacherDAO implements ITeacherDAO {
    private static final String INSERT_TEACHER_SQL = "{CALL insert_teacher(?, ?, ?, ?, ?,?,?)}";
    private static final String SELECT_TEACHER_SQL = "SELECT ID,NAME,EMAIL,HOMEROOM_CLASS,SUBJECT,TEACHING_CLASS,PASSWORD  FROM teacher WHERE id=?";
    private static final String SELECT_ALL_TEACHER_SQL = "SELECT * FROM teacher";
    private static final String UPDATE_TEACHER_BY_ID = "{CALL UpdateTeacherAndAssignment(?, ?, ?, ?, ?, ?)}";
    private static final String DELETE_TEACHER_BY_ID="{CALL Delete_teacher(?)}";
    private final DBConnection dbConnection = new DBConnection();
    private final Connection connection = dbConnection.getConnection();

    @Override
    public void insertTeacher(Teacher teacher, TeacherAssignment teacherAssignment) throws SQLException {
        connection.setAutoCommit(false);  // Tắt chế độ tự động commit
        try (CallableStatement callableStatement = connection.prepareCall(INSERT_TEACHER_SQL)) {
            callableStatement.setString(1, teacher.getId());
            callableStatement.setString(2, teacher.getName());
            callableStatement.setString(3, teacher.getEmail());
            callableStatement.setString(4, teacher.getHomeRoomClassName());
            callableStatement.setString(5, teacher.getSubject());
            callableStatement.setString(6, teacher.getTeachingClass());
            callableStatement.setString(7, teacherAssignment.getId());

            callableStatement.execute();
        } catch (SQLException e) {
            connection.rollback();
            System.err.println("Error while inserting teacher: " + e.getMessage());
            throw e;
        } finally {
            connection.setAutoCommit(true);
        }
    }

    @Override
    public Teacher selectTeacher(String id) {
        Teacher teacher = null;
        try (PreparedStatement preparedStatement = connection.prepareStatement(SELECT_TEACHER_SQL)) {
            preparedStatement.setString(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                String name = resultSet.getString("NAME");
                String email = resultSet.getString("EMAIL");
                String homeRoomClassName = resultSet.getString("HOMEROOM_CLASS");
                String subject = resultSet.getString("SUBJECT");
                String teachingClass = resultSet.getString("TEACHING_CLASS");
                String password = resultSet.getString("PASSWORD");
                teacher = new Teacher(id,password,teachingClass, subject, homeRoomClassName, email ,name);
            }
        } catch (SQLException e) {
            System.err.println("Error while retrieving teacher with ID " + id + ": " + e.getMessage());
        }
        return teacher;
    }

    @Override
    public List<Teacher> selectAllTeacher() {
        List<Teacher> teachers = new ArrayList<>();
        try (PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_TEACHER_SQL)) {
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                String id = resultSet.getString("ID");
                String name = resultSet.getString("NAME");
                String email = resultSet.getString("EMAIL");
                String homeRoomClassName = resultSet.getString("HOMEROOM_CLASS");
                String subject = resultSet.getString("SUBJECT");
                String teachingClass = resultSet.getString("TEACHING_CLASS");
                String password = resultSet.getString("PASSWORD");
                teachers.add(new Teacher(id,password,teachingClass, subject, homeRoomClassName, email ,name));
            }
        } catch (SQLException e) {
            System.err.println("Error while retrieving all teachers: " + e.getMessage());
        }
        return teachers;
    }

    @Override
    public boolean updateTeacher(Teacher teacher) throws SQLException {
        boolean isUpdate = false;
        connection.setAutoCommit(false);
        try (CallableStatement callableStatement = connection.prepareCall(UPDATE_TEACHER_BY_ID)) {
            callableStatement.setString(1, teacher.getId());
            callableStatement.setString(2, teacher.getName());
            callableStatement.setString(3, teacher.getEmail());
            callableStatement.setString(4, teacher.getSubject());
            callableStatement.setString(5, teacher.getHomeRoomClassName());
            callableStatement.setString(6, teacher.getTeachingClass());
            System.out.println("SQL: " + callableStatement.toString());
            System.out.println("Executing SQL with parameters: ");
            System.out.println("ID: " + teacher.getId());
            System.out.println("Name: " + teacher.getName());
            System.out.println("Email: " + teacher.getEmail());
            System.out.println("Subject: " + teacher.getSubject());
            System.out.println("Class Name: " + teacher.getHomeRoomClassName());
            System.out.println("Teaching Class: " + teacher.getTeachingClass());
            isUpdate = callableStatement.executeUpdate() > 0;
            System.out.println("Rows Affected: " + callableStatement.executeUpdate());
            if (isUpdate) {
                connection.commit();
            } else {
                connection.rollback();
            }
        } catch (SQLException e) {
            System.err.println("Error while updating teacher: " + e.getMessage());
            connection.rollback();
        }
        return isUpdate;
    }

    @Override
    public boolean deleteTeacher(String id) throws SQLException {
        boolean isDelete = false;
        connection.setAutoCommit(false);
        try (CallableStatement callableStatement = connection.prepareCall(DELETE_TEACHER_BY_ID)) {

            callableStatement.setString(1, id);
            isDelete = callableStatement.executeUpdate() > 0;

            if (isDelete) {
                connection.commit();
            }
        } catch (SQLException e) {
            connection.rollback();
            System.err.println("Error while deleting teacher with ID: " + id + ". Message: " + e.getMessage());
        } finally {
            connection.setAutoCommit(true);
        }
        return isDelete;
    }
}
