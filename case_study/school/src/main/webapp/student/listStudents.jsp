<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Student List</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
</head>
<body class="bg-light">
<div class="container mt-5">
  <div class="d-flex justify-content-between align-items-center mb-4">
    <h2 class="text-primary">Student List</h2>
    <a href="<%= request.getContextPath() %>/student/addStudent.jsp" class="btn btn-success">
      <i class="bi bi-person-plus"></i> Add New Student
    </a>
  </div>
  <form action="<%= request.getContextPath() %>/students?action=sort" method="get" class="row g-3 mb-4">
    <div class="col-md-4">
      <label for="field" class="form-label">Sort by:</label>
      <select name="field" id="field" class="form-select">
        <option value="averageScore">Average Score</option>
        <option value="name">Name</option>
        <option value="id">ID</option>
      </select>
    </div>
    <div class="col-md-4">
      <label for="orderType" class="form-label">Order:</label>
      <select name="orderType" id="orderType" class="form-select">
        <option value="asc">Ascending</option>
        <option value="desc">Descending</option>
      </select>
    </div>
    <div class="col-md-4 d-flex align-items-end">
      <button type="submit" class="btn btn-primary w-100">
        <i class="bi bi-sort"></i> Sort
      </button>
    </div>
  </form>

  <table class="table table-bordered table-striped table-hover">
    <thead class="table-primary">
    <tr>
      <th>ID <i class="bi bi-sort"></i></th>
      <th>Name <i class="bi bi-sort"></i></th>
      <th>Class <i class="bi bi-sort"></i></th>
      <th>Email <i class="bi bi-sort"></i></th>
      <th>Password <i class="bi bi-sort"></i></th>
      <th>Teacher ID <i class="bi bi-sort"></i></th>
      <th>Average Score <i class="bi bi-sort"></i></th>
      <th>Actions</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="student" items="${students}">
      <tr>
        <td>${student.id}</td>
        <td>${student.name}</td>
        <td>${student.className}</td>
        <td>${student.email}</td>
        <td>${student.password}</td>
        <td>${student.teacherId}</td>
        <td>${student.averageScore}</td>
        <td>
          <div class="d-flex gap-2">
            <a href="<%= request.getContextPath() %>/students?action=view&id=${student.id}"
               class="btn btn-info btn-sm">
              <i class="bi bi-eye"></i> View
            </a>
            <a href="<%= request.getContextPath() %>/students?action=delete&id=${student.id}"
               class="btn btn-danger btn-sm"
               onclick="return confirm('Are you sure?')">
              <i class="bi bi-trash"></i> Delete
            </a>
            <a href="${pageContext.request.contextPath}/student/updateStudentForm.jsp?action=update&id=${student.id}"
               class="btn btn-warning btn-sm">
              <i class="bi bi-pencil"></i> Edit
            </a>
          </div>
        </td>
      </tr>
    </c:forEach>
    </tbody>
  </table>
  <div class="mt-3">
    <a href="<%= request.getContextPath() %>/students?action=classify" class="btn btn-secondary">
      <i class="bi bi-filter"></i> Classify Student List
    </a>
  </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
