package com.example.school.controller;

import com.example.school.model.SchoolClass;
import com.example.school.model.dao.class_dao.ClassDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

@WebServlet(name = "HighSchoolClass", value = "/classes")
public class ClassServlet extends HttpServlet {
    private final ClassDAO classDAO = new ClassDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }

        try {
            switch (action) {
                case "insert":
                    showInsertForm(request, response);
                    break;
                case "search":
                    showSearchForm(request, response);
                    break;
                default:
                    listClasses(request, response);
                    break;
            }
        } catch (SQLException e) {
            throw new ServletException("Error in doGet: " + e.getMessage(), e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }

        try {
            switch (action) {
                case "insert":
                    insertClass(request, response);
                    break;
                case "search":
                    searchClass(request, response);
                    break;
                default:
                    response.sendRedirect("classes");
                    break;
            }
        } catch (SQLException e) {
            throw new ServletException("Error in doPost: " + e.getMessage(), e);
        }
    }

    private void listClasses(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        List<SchoolClass> classList = classDAO.selectAllClasses();
        request.setAttribute("classList", classList);
        request.getRequestDispatcher("/schoolClass/list.jsp").forward(request, response);
    }

    private void showInsertForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/schoolClass/insert.jsp").forward(request, response);
    }

    private void insertClass(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
        String className = request.getParameter("className");
        String teacherId = request.getParameter("teacherId");
        int totalStudents = Integer.parseInt(request.getParameter("totalStudents"));

        SchoolClass schoolClass = new SchoolClass(null, className, teacherId, totalStudents);
        classDAO.insertClass(schoolClass);

        response.sendRedirect("classes");
    }

    private void showSearchForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/schoolClass/search.jsp").forward(request, response);
    }

    private void searchClass(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        String query = request.getParameter("query");
        System.out.println(query);
        List<Map<String, Object>>  results = classDAO.searchClass(query);
        request.setAttribute("query", query);
        request.setAttribute("results", results);
        request.getRequestDispatcher("/schoolClass/result.jsp").forward(request, response);
    }
}
