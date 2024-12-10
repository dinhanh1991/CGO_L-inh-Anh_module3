<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>View Student</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<div class="container mt-5">
  <h2 class="text-primary">Student Details</h2>

  <div class="card shadow-sm mb-4">
    <div class="card-body">
      <h5 class="card-title">Student Information</h5>
      <dl class="row">
        <dt class="col-sm-3">ID:</dt>
        <dd class="col-sm-9">${student.id}</dd>

        <dt class="col-sm-3">Name:</dt>
        <dd class="col-sm-9">${student.name}</dd>

        <dt class="col-sm-3">Class:</dt>
        <dd class="col-sm-9">${student.className}</dd>

        <dt class="col-sm-3">Email:</dt>
        <dd class="col-sm-9">${student.email}</dd>

        <dt class="col-sm-3">Average Score:</dt>
        <dd class="col-sm-9">${student.averageScore}</dd>

        <dt class="col-sm-3">Teacher ID:</dt>
        <dd class="col-sm-9">${student.teacherId}</dd>

        <dt class="col-sm-3">Password:</dt>
        <dd class="col-sm-9">${student.password}</dd>
      </dl>
    </div>
  </div>

  <a href="<%= request.getContextPath() %>/students?action=list" class="btn btn-secondary">Back to List</a>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
