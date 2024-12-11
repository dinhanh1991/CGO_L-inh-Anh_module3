<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sort Students</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-4">
    <h2>Sort Students</h2>
    <form action="${pageContext.request.contextPath}/students?action=sort" method="get" class="mb-4">
        <div class="row">
            <div class="col-md-4">
                <label for="field">Sort by:</label>
                <select name="field" id="field" class="form-control">
                    <option value="averageScore">Average Score</option>
                    <option value="name">Name</option>
                    <!-- Add other fields as necessary -->
                </select>
            </div>
            <div class="col-md-4">
                <label for="orderType">Order:</label>
                <select name="orderType" id="orderType" class="form-control">
                    <option value="asc">Ascending</option>
                    <option value="desc">Descending</option>
                </select>
            </div>
            <div class="col-md-4">
                <button type="submit" class="btn btn-primary mt-4">Sort</button>
            </div>
        </div>
    </form>

    <h3>Sorted Students List</h3>
    <table class="table">
        <thead>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Class</th>
            <th>Email</th>
            <th>Average Score</th>
        </tr>
        </thead>
        <tbody>
        <!-- Display sorted students -->
        <c:forEach var="student" items="${students}">
            <tr>
                <td>${student.id}</td>
                <td>${student.name}</td>
                <td>${student.className}</td>
                <td>${student.email}</td>
                <td>${student.averageScore}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
</body>
</html>
