package com.example.school.respoitory.student_dao;

import com.example.school.model.Result;
import com.example.school.model.Student;
import com.example.school.respoitory.db_connection.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class StudentDAO implements IStudentDAO {
    private static final String INSERT_STUDENT_SQL = "{CALL insert_student(?, ?, ?, ?, ?,?, ?, ?, ?, ?, ?, ?, ?, ?,?,?)}";
    private static final String SELECT_STUDENT_BY_ID = "select  student_id, math, physics, chemistry, literature, history, geography, english, informatics, physical_education, civic_education, average_score from result where id =?";
    private static final String SELECT_ALL_STUDENT = "select * from student";
    private static final String DELETE_STUDENT_SQL = "{CALL DELETE_STUDENT(?)}";
    private static final String UPDATE_STUDENT_SQL = "{CALL UpdateStudentAndResult(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";
    private static final String CLASSIFY_STUDENT_SQL = "{CALL GetStudentClassification()}";
    private final DBConnection dbConnection = new DBConnection();
    private final Connection connection = dbConnection.getConnection();

    @Override
    public void insertStudent(Student student, Result result) throws SQLException {
        connection.setAutoCommit(false);
        try (CallableStatement stmt = connection.prepareCall(INSERT_STUDENT_SQL)) {
            stmt.setString(1, student.getId());
            stmt.setString(2, student.getName());
            stmt.setString(3, student.getClassName());
            stmt.setString(4, student.getPassword());
            stmt.setString(5, student.getEmail());
            stmt.setString(6, result.getId());
            stmt.setFloat(7, result.getMath());
            stmt.setFloat(8, result.getPhysics());
            stmt.setFloat(9, result.getChemistry());
            stmt.setFloat(10, result.getLiterature());
            stmt.setFloat(11, result.getHistory());
            stmt.setFloat(12, result.getGeography());
            stmt.setFloat(13, result.getEnglish());
            stmt.setFloat(14, result.getInformatics());
            stmt.setFloat(15, result.getPhysicalEducation());
            stmt.setFloat(16, result.getCivicEducation());
            stmt.executeUpdate();
            connection.commit();
        } catch (SQLException e) {
            connection.rollback();
            System.out.println("Error executing SQL: " + e.getMessage());
            throw e;
        } finally {
            connection.setAutoCommit(true);
        }
    }

    @Override
    public Student selectStudent(String id) {
        Student student = null;
        try (PreparedStatement preparedStatement = connection.prepareStatement(SELECT_STUDENT_BY_ID)) {
            preparedStatement.setString(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                String name = resultSet.getString("name");
                String className = resultSet.getString("class_name");
                String teacherId = resultSet.getString("teacher_id");
                float averageScore = resultSet.getFloat("average_score");
                String password = resultSet.getString("password");
                String email = resultSet.getString("email");
                student = new Student(id, name, className, teacherId, averageScore, password, email);
            }
        } catch (SQLException e) {
            throw new RuntimeException("Error retrieving student with ID: " + id, e);
        }
        return student;
    }

    @Override
    public List<Student> selectAllStudent() {
        List<Student> students = new ArrayList<>();
        try (PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_STUDENT)) {
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                String id = resultSet.getString("id");
                String name = resultSet.getString("name");
                String className = resultSet.getString("class_name");
                String teacherId = resultSet.getString("teacher_id");
                float averageScore = resultSet.getFloat("average_score");
                String password = resultSet.getString("password");
                String email = resultSet.getString("email");
                students.add(new Student(id, name, className, teacherId, averageScore, password, email));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return students;
    }

    @Override
    public boolean updateStudent(Student student, Result result) throws SQLException {
        boolean isUpdated = false;
        connection.setAutoCommit(false);
        try (CallableStatement callableStatement = connection.prepareCall(UPDATE_STUDENT_SQL)) {
            callableStatement.setString(1, student.getId());
            callableStatement.setString(2, student.getName());
            callableStatement.setString(3, student.getClassName());
            callableStatement.setString(4, student.getPassword());
            callableStatement.setString(5, student.getEmail());
            callableStatement.setFloat(6, result.getMath());
            callableStatement.setFloat(7, result.getPhysics());
            callableStatement.setFloat(8, result.getChemistry());
            callableStatement.setFloat(9, result.getLiterature());
            callableStatement.setFloat(10, result.getHistory());
            callableStatement.setFloat(11, result.getGeography());
            callableStatement.setFloat(12, result.getEnglish());
            callableStatement.setFloat(13, result.getInformatics());
            callableStatement.setFloat(14, result.getPhysicalEducation());
            callableStatement.setFloat(15, result.getCivicEducation());

            isUpdated = callableStatement.executeUpdate() > 0;
            connection.commit();
        } catch (SQLException e) {
            connection.rollback();
            System.out.println("Error executing SQL: " + e.getMessage());
            throw e;
        } finally {
            connection.setAutoCommit(true);  // Đảm bảo set lại auto commit
        }
        return isUpdated;
    }

    @Override
    public boolean deleteStudent(String id) throws SQLException {
        boolean isDeleted = false;
        connection.setAutoCommit(false);
        try (CallableStatement callableStatement = connection.prepareCall(DELETE_STUDENT_SQL)) {
            callableStatement.setString(1, id);
            int delete = callableStatement.executeUpdate();
            if (delete > 0) {
                isDeleted = true;
                connection.commit();
            }
        } catch (SQLException e) {
            connection.rollback();
            System.err.println("Error while executing: " + DELETE_STUDENT_SQL + " for ID: " + id);
            System.err.println("SQL Error: " + e.getMessage());
        } finally {
            connection.setAutoCommit(true);
        }
        return isDeleted;
    }

    @Override
    public List<Student> sortStudentByScore(String orderType, String field) {
        List<Student> students = new ArrayList<>();
        String sql = "SELECT * FROM students ORDER BY " + field + " " + orderType;

        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Student student = new Student();
                student.setId(rs.getString("id"));
                student.setName(rs.getString("name"));
                student.setClassName(rs.getString("class_name"));
                student.setEmail(rs.getString("email"));
                student.setPassword(rs.getString("password"));
                student.setTeacherId(rs.getString("teacher_id"));
                student.setAverageScore(rs.getFloat("average_score"));
                students.add(student);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return students;
    }

    @Override
    public List<Student> classifyStudent() {
        List<Student> students = new ArrayList<>();
        try (CallableStatement callableStatement = connection.prepareCall(CLASSIFY_STUDENT_SQL);
             ResultSet resultSet = callableStatement.executeQuery()) {
            while (resultSet.next()) {
                String id = resultSet.getString("id");
                String name = resultSet.getString("name");
                String className = resultSet.getString("class_name");
                float averageScore = resultSet.getFloat("average_score");
                String classification = resultSet.getString("classification");
                Student student = new Student(id, name, className, averageScore, classification);
                students.add(student);
            }
            if (students.isEmpty()) {
                System.out.println("No students found from classification procedure.");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return students;
    }
}
