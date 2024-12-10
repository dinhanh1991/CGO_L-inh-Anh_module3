<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Classified Students</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
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
            </tr>
        </c:forEach>
        </tbody>
    </table>

    <a href="<%= request.getContextPath() %>/students?action=list" class="btn btn-secondary">Back to List</a>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
