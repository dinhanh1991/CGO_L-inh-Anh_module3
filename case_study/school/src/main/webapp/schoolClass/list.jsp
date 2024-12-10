<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Class List</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Thêm liên kết Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
    <h1 class="text-center">Class List</h1>
    <div class="row justify-content-center mb-4">
        <div class="col-md-6">
            <form action="classes?action=search" method="post" class="d-flex">
                <input type="text" name="query" class="form-control me-2" placeholder="Search classes">
                <button type="submit" class="btn btn-outline-success">Search</button>
            </form>
        </div>
    </div>
    <table class="table table-striped">
        <thead>
        <tr>
            <th>Class ID</th>
            <th>Class Name</th>
            <th>Teacher ID</th>
            <th>Total Students</th>
            <th>Actions</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="classItem" items="${classList}">
            <tr>
                <td>${classItem.id}</td>
                <td>${classItem.className}</td>
                <td>${classItem.teacherId}</td>
                <td>${classItem.totalStudents}</td>
                <td>
                    <!-- Nút Edit với icon -->
                    <a href="classes?action=edit&id=${classItem.id}" class="btn btn-warning btn-sm">
                        <i class="fas fa-edit"></i> Edit
                    </a>
                    <!-- Nút Delete với icon -->
                    <a href="classes?action=delete&id=${classItem.id}" class="btn btn-danger btn-sm" onclick="return confirm('Are you sure you want to delete this class?')">
                        <i class="fas fa-trash-alt"></i> Delete
                    </a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <a href="classes?action=insert" class="btn btn-primary">
        <i class="fas fa-plus-circle"></i> Add New Class
    </a>
</div>
</body>
</html>
