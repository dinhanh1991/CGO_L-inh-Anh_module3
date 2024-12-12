package com.example.school.service.student_login;

import com.example.school.model.Result;
import com.example.school.model.Student;
import com.example.school.respoitory.db_connection.DBConnection;
import com.example.school.respoitory.student_dao.StudentDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class StudentLogin {
    private final StudentDAO studentDAO=new StudentDAO();
    private static final String SELECT_ALL_RESULT = "select * from result";
    private static final String SELECT_RESULT_BY_ID = "select math, physics, chemistry, literature, history, geography, english, informatics, physical_education, civic_education, average_score from student where student_id =?";
    private final DBConnection dbConnection = new DBConnection();
    private final Connection connection = dbConnection.getConnection();
    public boolean login(String id, String password ) {
        List<Student> students =studentDAO.selectAllStudent();
        for (Student student : students) {
            if (student.getId().equals(id) && student.getPassword().equals(password)) {
                return true;
            }
        }
       boolean isUser =false;
       return isUser;
    }
    public Map<String, Object> informScoreStudent(String idStudent) throws SQLException {
        Map<String, Object> informScoreStudent = new HashMap<>();
        Result result =new Result();
        try (PreparedStatement preparedStatement = connection.prepareStatement(SELECT_RESULT_BY_ID)) {
            preparedStatement.setString(1, idStudent);
            ResultSet rs = preparedStatement.executeQuery();
            List<Student> studentList = studentDAO.selectAllStudent();
            while (rs.next()) {
                String name ="";
                String classifyStudent ="";
                for (Student student : studentList) {
                    if (student.getId().equals(idStudent)) {
                        name = student.getName();
                        classifyStudent = result.getClassify(rs.getFloat("average_score"));
                        break;
                    }
                }
                informScoreStudent.put("name",name);
                informScoreStudent.put(rs.getString("math"), rs.getFloat("math"));
                informScoreStudent.put(rs.getString("physics"), rs.getFloat("physics"));
                informScoreStudent.put(rs.getString("english"), rs.getFloat("english"));
                informScoreStudent.put(rs.getString("informatics"), rs.getFloat("informatics"));
                informScoreStudent.put(rs.getString("chemistry"), rs.getFloat("chemistry"));
                informScoreStudent.put(rs.getString("literature"), rs.getFloat("literature"));
                informScoreStudent.put(rs.getString("geography"), rs.getFloat("geography"));
                informScoreStudent.put(rs.getString("history"), rs.getFloat("history"));
                informScoreStudent.put(rs.getString("physical_education"), rs.getFloat("physical_education"));
                informScoreStudent.put(rs.getString("civic_education"), rs.getFloat("civic_education"));
                informScoreStudent.put(rs.getString("average_score"), rs.getFloat("average_score"));
                informScoreStudent.put("classifyStudent", classifyStudent);
            }
        }
        return informScoreStudent;
    }

    public List<Map<String, Object>> selectAllResult() {
        List<Map<String, Object>> resultStudents = new ArrayList<>();
        try (PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_RESULT)) {
            List<Student> studentList = studentDAO.selectAllStudent();
            preparedStatement.execute();
            ResultSet resultSet = preparedStatement.getResultSet();
            while (resultSet.next()) {
                Map<String, Object> resultStudent = new HashMap<>();
                resultStudent.put("studentID", resultSet.getString("student_id"));
                String name;
                for (Student student : studentList) {
                    if (student.getId().equals(resultSet.getString("student_id"))) {
                        name = student.getName();
                        break;
                    }
                }
                resultStudent.put("math", resultSet.getString("math"));
                resultStudent.put("physics", resultSet.getString("physics"));
                resultStudent.put("chemistry", resultSet.getString("chemistry"));
                resultStudent.put("literature", resultSet.getString("literature"));
                resultStudent.put("history", resultSet.getString("history"));
                resultStudent.put("geography", resultSet.getString("geography"));
                resultStudent.put("english", resultSet.getString("english"));
                resultStudent.put("informatics", resultSet.getString("informatics"));
                resultStudent.put("physical_education", resultSet.getString("physical_education"));
                resultStudent.put("civic_education", resultSet.getString("civic_education"));
                resultStudent.put("average_score", resultSet.getString("average_score"));
                resultStudents.add(resultStudent);
            }
        } catch (SQLException e) {
            System.out.println("Error while executing: " + SELECT_ALL_RESULT);
            e.printStackTrace();
        }
        return resultStudents;
    }
}
