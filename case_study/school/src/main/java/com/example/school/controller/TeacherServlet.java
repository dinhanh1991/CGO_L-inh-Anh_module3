package com.example.school.controller;

import com.example.school.model.Teacher;
import com.example.school.model.TeacherAssignment;
import com.example.school.model.dao.teacher_dao.TeacherDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "Teachers", value = "/teachers")
public class TeacherServlet extends HttpServlet {
    private final TeacherDAO teacherDAO = new TeacherDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }

        switch (action) {
            case "new":
                showNewForm(request, response);
                break;
            case "edit":
                showEditForm(request, response);
                break;
            case "delete":
                deleteTeacher(request, response);
                break;
            case "view":
                viewTeacherDetail(request, response);
                break;
            default:
                listTeachers(request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }

        switch (action) {
            case "insert":
                insertTeacher(request, response);
                break;
            case "update":
                updateTeacher(request, response);
                break;
            default:
                response.sendRedirect("teachers");
                break;
        }
    }

    private void listTeachers(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Teacher> teachers = teacherDAO.selectAllTeacher();
        request.setAttribute("teachers", teachers);
        request.getRequestDispatcher("teacher/list.jsp").forward(request, response);
    }

    private void showNewForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("teacher/formAdd.jsp").forward(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        Teacher existingTeacher = teacherDAO.selectTeacher(id);
        request.setAttribute("teacher", existingTeacher);
        request.getRequestDispatcher("teacher/form.jsp").forward(request, response);
    }

    private void insertTeacher(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String homeRoomClassName = request.getParameter("homeRoomClassName");
        String subject = request.getParameter("subject");
        String teachingClass = request.getParameter("teachingClass");
        String idTeacherAssignment = request.getParameter("idTeacherAssignment");
        Teacher newTeacher = new Teacher(id,name, email, homeRoomClassName, subject, teachingClass);
        TeacherAssignment newTA =new TeacherAssignment(idTeacherAssignment);
        try {
            teacherDAO.insertTeacher(newTeacher, newTA);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        response.sendRedirect("teachers");
    }

    private void updateTeacher(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String homeRoomClassName = request.getParameter("homeRoomClassName");
        String subject = request.getParameter("subject");
        String teachingClass = request.getParameter("teachingClass");

        Teacher teacher = new Teacher(id, name, email, homeRoomClassName, subject, teachingClass);
        try {
            teacherDAO.updateTeacher(teacher);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        response.sendRedirect("teachers");
    }

    private void deleteTeacher(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String id = request.getParameter("id");
        try {
            teacherDAO.deleteTeacher(id);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        response.sendRedirect("teachers");
    }
    private void viewTeacherDetail(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       String id = request.getParameter("id");
        Teacher teacher = teacherDAO.selectTeacher(id);
        if (teacher != null) {
            request.setAttribute("teacher", teacher);
            request.getRequestDispatcher("teacher/view.jsp").forward(request, response);
        } else {
            response.sendRedirect("teachers");
        }
    }
}
