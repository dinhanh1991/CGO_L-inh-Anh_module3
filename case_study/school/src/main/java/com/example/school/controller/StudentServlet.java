package com.example.school.controller;

import com.example.school.model.Result;
import com.example.school.model.Student;
import com.example.school.respoitory.student_dao.StudentDAO;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "Students", value = "/students")
public class StudentServlet extends HttpServlet {

    private final StudentDAO studentDAO = new StudentDAO();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }

        try {
            switch (action) {
                case "view":
                    viewStudent(request, response);
                    break;
                case "list":
                    listStudents(request, response);
                    break;
                case "sort":
                    sortStudents(request, response);
                    break;
                case "classify":
                    classifyStudents(request, response);
                    break;
                case "delete":
                    deleteStudent(request, response);
                    break;
                default:
                    listStudents(request, response);
                    break;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    private void viewStudent(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        String id = request.getParameter("id");
        Student student = studentDAO.selectStudent(id);
        request.setAttribute("student", student);
        RequestDispatcher dispatcher = request.getRequestDispatcher("student/viewStudent.jsp");
        dispatcher.forward(request, response);
    }

    private void listStudents(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        List<Student> students = studentDAO.selectAllStudent();
        request.setAttribute("students", students);
        RequestDispatcher dispatcher = request.getRequestDispatcher("student/listStudents.jsp");
        dispatcher.forward(request, response);
    }

    private void sortStudents(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        String orderType = request.getParameter("orderType");
        String field = request.getParameter("field");
        List<Student> students = studentDAO.sortStudentByScore(orderType, field);
        request.setAttribute("students", students);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/student/listStudents.jsp");
        dispatcher.forward(request, response);
    }

    private void classifyStudents(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        List<Student> students = studentDAO.classifyStudent();
        request.setAttribute("students", students);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/student/classifiedStudents.jsp");
        dispatcher.forward(request, response);
    }

    private void deleteStudent(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        String id = request.getParameter("id");
        boolean isDeleted = studentDAO.deleteStudent(id);
        if (isDeleted) {
            response.sendRedirect(request.getContextPath() + "/students?action=list");
        } else {
            request.setAttribute("message", "Failed to delete student");
            RequestDispatcher dispatcher = request.getRequestDispatcher("student/listStudents.jsp");
            dispatcher.forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        try {
            switch (action) {
                case "add":
                    addStudent(request, response);
                    break;
                case "update":
                    updateStudent(request, response);
                    break;
                default:
                    listStudents(request, response);
                    break;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    private void addStudent(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String className = request.getParameter("className");
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        Student student = new Student(id,name, className, password, email);
        String idResult =request.getParameter("idResult");
        float mathScore = Float.parseFloat(request.getParameter("math"));
        float physicsScore = Float.parseFloat(request.getParameter("physics"));
        float chemistryScore = Float.parseFloat(request.getParameter("chemistry"));
        float literatureScore = Float.parseFloat(request.getParameter("literature"));
        float historyScore = Float.parseFloat(request.getParameter("history"));
        float geographyScore = Float.parseFloat(request.getParameter("geography"));
        float englishScore = Float.parseFloat(request.getParameter("english"));
        float informaticsScore = Float.parseFloat(request.getParameter("informatics"));
        float physicalEducation = Float.parseFloat(request.getParameter("physicalEducation"));
        float civicEducation = Float.parseFloat(request.getParameter("civicEducation"));
        Result result =new Result(idResult,id,mathScore,physicsScore,chemistryScore,literatureScore,historyScore
        ,geographyScore,englishScore,informaticsScore,physicalEducation,civicEducation);
        studentDAO.insertStudent(student, result);
        response.sendRedirect(request.getContextPath() + "/students?action=list");
    }

    private void updateStudent(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String className = request.getParameter("className");
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        float mathScore = parseFloatOrDefault(request.getParameter("math"));
        float physicsScore = parseFloatOrDefault(request.getParameter("physics"));
        float chemistryScore = parseFloatOrDefault(request.getParameter("chemistry"));
        float literatureScore = parseFloatOrDefault(request.getParameter("literature"));
        float historyScore = parseFloatOrDefault(request.getParameter("history"));
        float geographyScore = parseFloatOrDefault(request.getParameter("geography"));
        float englishScore = parseFloatOrDefault(request.getParameter("english"));
        float informaticsScore = parseFloatOrDefault(request.getParameter("informatics"));
        float physicalEducation = parseFloatOrDefault(request.getParameter("physicalEducation"));
        float civicEducation = parseFloatOrDefault(request.getParameter("civicEducation"));
        Student student = new Student(id, name, className, password, email);
        Result result =new Result(mathScore,physicsScore,chemistryScore,literatureScore,historyScore
                ,geographyScore,englishScore,informaticsScore,physicalEducation,civicEducation);
        studentDAO.updateStudent(student, result);
        response.sendRedirect(request.getContextPath() + "/students?action=list");
    }
    private float parseFloatOrDefault(String value) {
        try {
            return value.isEmpty() ? 0 : Float.parseFloat(value);
        } catch (NumberFormatException e) {
            return 0;
        }
    }
}
