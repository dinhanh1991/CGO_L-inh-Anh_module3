package com.example.school.controller;

import com.example.school.service.student_login.StudentLogin;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.Map;

@WebServlet(name="school",value = "/school")
public class StudentLoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private final StudentLogin studentLoginService = new StudentLogin();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String studentId = request.getParameter("username");
        String password = request.getParameter("password");
        String role = request.getParameter("role");
        boolean isLoggedIn = false;
        if ("student".equals(role)) {
            isLoggedIn = studentLoginService.login(studentId, password);
        }
        if (isLoggedIn) {
            request.getSession().setAttribute("userId", studentId);
            request.getSession().setAttribute("role", role);
            if ("student".equals(role)) {
                response.sendRedirect("/student/student-dashboard.jsp");
            }
        }else {

            request.setAttribute("errorMessage", "Invalid username or password.");
            request.getRequestDispatcher("/school.jsp").forward(request, response);
        }

    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userId = (String) request.getSession().getAttribute("userId");
        String role = (String) request.getSession().getAttribute("role");
        if (userId != null) {
            try {
                if ("student".equals(role)) {
                    Map<String, Object> studentInfo = studentLoginService.informScoreStudent(userId);
                    request.setAttribute("studentInfo", studentInfo);
                    request.getRequestDispatcher("/student/student-dashboard.jsp").forward(request, response);
                }
            } catch (SQLException e) {
                e.printStackTrace();
                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            }
        } else {
            response.sendRedirect("/school.jsp");
        }
    }
}
