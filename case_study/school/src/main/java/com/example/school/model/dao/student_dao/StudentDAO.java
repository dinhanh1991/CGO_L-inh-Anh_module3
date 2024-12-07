package com.example.school.model.dao.student_dao;

import com.example.school.model.Result;
import com.example.school.model.Student;
import com.example.school.model.dao.db_connection.DBConnection;

import java.sql.*;
import java.util.*;

public class StudentDAO implements IStudentDAO {
    private static final String INSERT_STUDENT_SQL ="{CALL insert_student(?, ?, ?, ?, ?,?, ?, ?, ?, ?, ?, ?, ?, ?)}";
    private static final String SELECT_STUDENT_BY_ID = "select id,name, class_name,teacher_id,average_score,password,email from student where id =?";
    private static final String SELECT_ALL_STUDENT = "select * from student";
    private static final String DELETE_STUDENT_SQL = "{CALL DELETE_STUDENT(?)}";
    private static final String UPDATE_STUDENT_SQL = "{CALL UpdateStudentAndResult(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,?)}";
    private final DBConnection dbConnection = new DBConnection();
    private final Connection connection = dbConnection.getConnection();

    @Override
    public void insertStudent(Student student,Result result) throws SQLException {
        connection.setAutoCommit(false);
        try (CallableStatement stmt = connection.prepareCall(INSERT_STUDENT_SQL)) {
            stmt.setString(1, student.getName());
            stmt.setString(2, student.getClassName());
            stmt.setString(3, student.getPassword());
            stmt.setString(4, student.getEmail());
            stmt.setFloat(5, result.getMath());
            stmt.setFloat(6, result.getPhysics());
            stmt.setFloat(7, result.getChemistry());
            stmt.setFloat(8, result.getLiterature());
            stmt.setFloat(9, result.getHistory());
            stmt.setFloat(10, result.getGeography());
            stmt.setFloat(11, result.getEnglish());
            stmt.setFloat(12, result.getInformatics());
            stmt.setFloat(13, result.getPhysicalEducation());
            stmt.setFloat(14, result.getCivicEducation());
            stmt.executeUpdate();
        }catch (SQLException e) {
            System.out.println(INSERT_STUDENT_SQL);
        }
    }

    @Override
    public Student selectStudent(int id) {
        Student student = null;
        try(PreparedStatement preparedStatement = connection.prepareStatement(SELECT_STUDENT_BY_ID)){
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                String name = resultSet.getString("name");
                String className = resultSet.getString("class_name");
                int teacherId = resultSet.getInt("teacher_id");
                float averageScore = resultSet.getFloat("average_score");
                String password = resultSet.getString("password");
                String email = resultSet.getString("email");
                student =new Student(id,name,className,teacherId,averageScore,password,email);
            }
        }catch (SQLException e) {
            throw new RuntimeException("Error retrieving student with ID: " + id, e);
        }
        return student;
    }

    @Override
    public List<Student> selectAllStudent() {
        List<Student> students = new ArrayList<>();
        try(PreparedStatement preparedStatement =connection.prepareStatement(SELECT_ALL_STUDENT)) {
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                String className = resultSet.getString("class_name");
                int teacherId = resultSet.getInt("teacher_id");
                float averageScore = resultSet.getFloat("average_score");
                String password = resultSet.getString("password");
                String email = resultSet.getString("email");
                students.add(new Student(id,name,className,teacherId,averageScore,password,email));
            }
        }catch (SQLException e) {
            e.printStackTrace();
        }
        return students;
    }

    @Override
    public boolean updateStudent(Student student, Result result) throws SQLException {
        boolean isUpdated = false;
        connection.setAutoCommit(false);
        try(CallableStatement callableStatement = connection.prepareCall(UPDATE_STUDENT_SQL);){
            callableStatement.setInt(1, student.getId());
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
           isUpdated = callableStatement.executeUpdate()>0;
        }catch (SQLException e) {
            System.out.println(UPDATE_STUDENT_SQL);
        }
        return isUpdated;
    }
    @Override
    public boolean deleteStudent(String id) throws SQLException {
        boolean isDeleted = false;
        connection.setAutoCommit(false);
        try (CallableStatement callableStatement = connection.prepareCall(DELETE_STUDENT_SQL)) {
            int studentId;
            try {
                studentId = Integer.parseInt(id);
            } catch (NumberFormatException e) {
                throw new IllegalArgumentException("Student ID must be a valid integer", e);
            }

            callableStatement.setInt(1, studentId);

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
            connection.setAutoCommit(true); // Khôi phục chế độ tự động commit
        }
        return isDeleted;
    }

    @Override
    public List<Student> sortStudentByScore(String orderType) {
        String query ="SELECT * FROM student ORDER BY average_score "+orderType;
        List<Student> students = new ArrayList<>();
        try(PreparedStatement statement = connection.prepareStatement(query)){
            try (ResultSet resultSet = statement.executeQuery()){
                while (resultSet.next()) {
                    int id = resultSet.getInt("id");
                    String name = resultSet.getString("name");
                    String className = resultSet.getString("class_name");
                    int teacherId = resultSet.getInt("teacher_id");
                    float averageScore = resultSet.getFloat("average_score");
                    String password = resultSet.getString("password");
                    String email = resultSet.getString("email");
                    students.add(new Student(id,name,className,teacherId,averageScore,password,email));
                }
            }
        }catch (SQLException e) {
            e.printStackTrace();
        }
        return students;
    }

    @Override
    public List<Map<String, Object>> classifyStudent() {
        String query ="SELECT \n" +
                "    id, \n" +
                "    name, \n" +
                "    class_name, \n" +
                "    average_score,\n" +
                "    CASE\n" +
                "        WHEN average_score >= 8.0 THEN 'Giỏi'\n" +
                "        WHEN average_score >= 6.5 THEN 'Khá'\n" +
                "        WHEN average_score >= 5.0 THEN 'Trung bình'\n" +
                "        ELSE 'Yếu'\n" +
                "    END AS classification\n" +
                "FROM student\n" +
                "ORDER BY classification, average_score DESC;";

        List<Map<String, Object>> students = new ArrayList<>();

        try (PreparedStatement statement = connection.prepareStatement(query);
             ResultSet resultSet = statement.executeQuery()) {
            while (resultSet.next()) {
                Map<String, Object> studentData = new HashMap<>();
                studentData.put("id", resultSet.getInt("id"));
                studentData.put("name", resultSet.getString("name"));
                studentData.put("className", resultSet.getString("class_name"));
                studentData.put("averageScore", resultSet.getFloat("average_score"));
                studentData.put("classification", resultSet.getString("classification"));
                students.add(studentData);
            }
        }catch (SQLException e) {
            e.printStackTrace();
        }
        return students;
    }
}
