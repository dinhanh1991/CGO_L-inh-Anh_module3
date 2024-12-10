<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Classified Students</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet"> <!-- Bootstrap Icons -->
    <style>
        body {
            font-family: 'Roboto', sans-serif; /* Chỉnh font chữ */
        }
        th, td {
            text-align: center; /* Căn giữa bảng */
        }
        .table th {
            font-weight: bold; /* Đậm cho tiêu đề bảng */
        }
    </style>
</head>
<body class="bg-light">
<div class="container mt-5">
    <h2 class="text-primary mb-4">Classified Students</h2>

    <table class="table table-bordered table-striped table-hover">
        <thead class="table-dark">
        <tr>
            <th>Student Id</th>
            <th>Student Name</th>
            <th>Homeroom Class Name</th>
            <th>Average Score</th>
            <th>Classification</th>
            <th>Actions</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="student" items="${students}">
            <tr>
                <td>${student.id}</td>
                <td>${student.name}</td>
                <td>${student.className}</td>
                <td>${student.averageScore}</td>
                <td>${student.classifyStudent}</td>
                <td>
                    <a href="<%= request.getContextPath() %>/students?action=view&id=${student.id}" class="btn btn-info btn-sm">
                        <i class="bi bi-eye"></i> View
                    </a>
                    <a href="<%= request.getContextPath() %>/students?action=delete&id=${student.id}" class="btn btn-danger btn-sm" onclick="return confirm('Are you sure?')">
                        <i class="bi bi-trash"></i> Delete
                    </a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

    <a href="<%= request.getContextPath() %>/students?action=list" class="btn btn-secondary">
        <i class="bi bi-arrow-left"></i> Back to List
    </a>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
