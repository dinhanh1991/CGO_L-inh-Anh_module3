<%@ page import="java.util.Map" %>
<%@ page import="java.util.Set" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Student Dashboard</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">School Management</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav ms-auto">
        <li class="nav-item">
          <a class="nav-link active" href="student-dashboard.jsp">Dashboard</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/school.jsp">Logout</a>
        </li>
      </ul>
    </div>
  </div>
</nav>

<div class="container mt-5">
  <h1 class="text-center mb-4">Student Dashboard</h1>

  <div class="card">
    <div class="card-header bg-primary text-white">
      <i class="fas fa-user-graduate"></i> Student Information
    </div>
    <div class="card-body">
      <h4>Name: ${studentInfo.name}</h4>
      <p><strong>Classified as: </strong>${studentInfo.classifyStudent}</p>

      <table class="table table-bordered">
        <thead>
        <tr>
          <th>Subject</th>
          <th>Score</th>
        </tr>
        </thead>
        <tbody>
        <tr>
          <td>Math</td>
          <td>${studentInfo.math}</td>
        </tr>
        <tr>
          <td>Physics</td>
          <td>${studentInfo.physics}</td>
        </tr>
        <tr>
          <td>Chemistry</td>
          <td>${studentInfo.chemistry}</td>
        </tr>
        <tr>
          <td>Literature</td>
          <td>${studentInfo.literature}</td>
        </tr>
        <tr>
          <td>History</td>
          <td>${studentInfo.history}</td>
        </tr>
        <tr>
          <td>Geography</td>
          <td>${studentInfo.geography}</td>
        </tr>
        <tr>
          <td>English</td>
          <td>${studentInfo.english}</td>
        </tr>
        <tr>
          <td>Informatics</td>
          <td>${studentInfo.informatics}</td>
        </tr>
        <tr>
          <td>Physical Education</td>
          <td>${studentInfo.physical_education}</td>
        </tr>
        <tr>
          <td>Civic Education</td>
          <td>${studentInfo.civic_education}</td>
        </tr>
        <tr>
          <td><strong>Average Score</strong></td>
          <td><strong>${studentInfo.average_score}</strong></td>
        </tr>
        </tbody>
      </table>
    </div>
  </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
