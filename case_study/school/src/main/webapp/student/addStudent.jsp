<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="ISO-8859-1">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Add New Student</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet"> <!-- Bootstrap Icons -->
</head>
<body class="bg-light">
<div class="container mt-5">
  <h2 class="text-primary">Add New Student</h2>

  <form action="<%= request.getContextPath() %>/students?action=add" method="post" class="bg-white p-4 rounded shadow-sm">
    <div class="mb-3">
      <label for="idStudent" class="form-label"><i class="bi bi-person-fill"></i> Id:</label>
      <input type="text" id="idStudent" name="id" class="form-control" required>
    </div>
    <div class="mb-3">
      <label for="name" class="form-label"><i class="bi bi-person-lines-fill"></i> Name:</label>
      <input type="text" id="name" name="name" class="form-control" required>
    </div>

    <div class="mb-3">
      <label for="className" class="form-label"><i class="bi bi-house-door-fill"></i> Class:</label>
      <input type="text" id="className" name="className" class="form-control" required>
    </div>

    <div class="mb-3">
      <label for="password" class="form-label"><i class="bi bi-lock-fill"></i> Password:</label>
      <input type="password" id="password" name="password" class="form-control" required>
    </div>

    <div class="mb-3">
      <label for="email" class="form-label"><i class="bi bi-envelope-fill"></i> Email:</label>
      <input type="email" id="email" name="email" class="form-control" required>
    </div>
    <div class="mb-3">
      <label for="idResult" class="form-label"><i class="bi bi-clipboard-fill"></i> Result ID:</label>
      <input type="text" id="idResult" name="idResult" class="form-control" required>
    </div>
    <h4><i class="bi bi-file-earmark-spreadsheet"></i> Scores:</h4>

    <div class="mb-3">
      <label for="math" class="form-label"><i class="bi bi-bar-chart-fill"></i> Math:</label>
      <input type="text" id="math" name="math" class="form-control" required>
    </div>

    <div class="mb-3">
      <label for="physics" class="form-label"><i class="bi bi-bar-chart-line-fill"></i> Physics:</label>
      <input type="text" id="physics" name="physics" class="form-control" required>
    </div>

    <div class="mb-3">
      <label for="chemistry" class="form-label"><i class="bi bi-flask-fill"></i> Chemistry:</label>
      <input type="number" id="chemistry" name="chemistry" class="form-control" required>
    </div>

    <div class="mb-3">
      <label for="literature" class="form-label"><i class="bi bi-book-fill"></i> Literature:</label>
      <input type="number" id="literature" name="literature" class="form-control" required>
    </div>

    <div class="mb-3">
      <label for="history" class="form-label"><i class="bi bi-clock-fill"></i> History:</label>
      <input type="number" id="history" name="history" class="form-control" required>
    </div>

    <div class="mb-3">
      <label for="geography" class="form-label"><i class="bi bi-map-fill"></i> Geography:</label>
      <input type="number" id="geography" name="geography" class="form-control" required>
    </div>

    <div class="mb-3">
      <label for="english" class="form-label"><i class="bi bi-translate"></i> English:</label>
      <input type="number" id="english" name="english" class="form-control" required>
    </div>

    <div class="mb-3">
      <label for="informatics" class="form-label"><i class="bi bi-laptop-fill"></i> Informatics:</label>
      <input type="number" id="informatics" name="informatics" class="form-control" required>
    </div>

    <div class="mb-3">
      <label for="physicalEducation" class="form-label"><i class="bi bi-person-bounding-box"></i> Physical Education:</label>
      <input type="number" id="physicalEducation" name="physicalEducation" class="form-control" required>
    </div>

    <div class="mb-3">
      <label for="civicEducation" class="form-label"><i class="bi bi-person-check-fill"></i> Civic Education:</label>
      <input type="number" id="civicEducation" name="civicEducation" class="form-control" required>
    </div>

    <div class="mb-3">
      <button type="submit" class="btn btn-primary"><i class="bi bi-person-plus-fill"></i> Add Student</button>
    </div>
  </form>

  <a href="<%= request.getContextPath() %>/students?action=list" class="btn btn-secondary mt-3"><i class="bi bi-arrow-left-circle"></i> Back to List</a>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
