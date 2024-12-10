<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>View Student</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <!-- Font Awesome for icons -->
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
  <style>
    dt:hover {
      background-color: #f1f1f1;
      cursor: pointer;
    }
  </style>
</head>
<body class="bg-light">
<div class="container mt-5">
  <h2 class="text-primary">Student Details</h2>

  <div class="card shadow-sm mb-4">
    <div class="card-body">
      <h5 class="card-title">Student Information</h5>
      <dl class="row">
        <dt class="col-sm-3">
          <i class="fas fa-id-badge"></i> ID:
        </dt>
        <dd class="col-sm-9">${student.id}</dd>

        <dt class="col-sm-3">
          <i class="fas fa-user"></i> Name:
        </dt>
        <dd class="col-sm-9">${student.name}</dd>

        <dt class="col-sm-3">
          <i class="fas fa-chalkboard"></i> Class:
        </dt>
        <dd class="col-sm-9">${student.className}</dd>

        <dt class="col-sm-3">
          <i class="fas fa-envelope"></i> Email:
        </dt>
        <dd class="col-sm-9">${student.email}</dd>

        <dt class="col-sm-3">
          <i class="fas fa-chart-bar"></i> Average Score:
        </dt>
        <dd class="col-sm-9">${student.averageScore}</dd>

        <dt class="col-sm-3">
          <i class="fas fa-chalkboard-teacher"></i> Teacher ID:
        </dt>
        <dd class="col-sm-9">${student.teacherId}</dd>
        <dt class="col-sm-3">
          <i class="fas fa-key"></i> Password:
        </dt>
        <dd class="col-sm-9">${student.password}</dd>
      </dl>
    </div>
  </div>

  <a href="<%= request.getContextPath() %>/students?action=list" class="btn btn-secondary">
    <i class="fas fa-arrow-left"></i> Back to List
  </a>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
