<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Insert Class</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
  <div class="row justify-content-center">
    <div class="col-lg-6 col-md-8 col-sm-10">
      <div class="card shadow-sm">
        <div class="card-header text-center bg-primary text-white">
          <h3>Add New Class</h3>
        </div>
        <div class="card-body">
          <form action="/classes?action=insert" method="post">
            <div class="mb-3">
              <label for="className" class="form-label">Class Name</label>
              <input type="text" class="form-control" id="className" name="className" placeholder="Enter class name" required>
            </div>
            <div class="mb-3">
              <label for="teacherId" class="form-label">Teacher ID</label>
              <input type="text" class="form-control" id="teacherId" name="teacherId" placeholder="Enter teacher ID" required>
            </div>
            <div class="mb-3">
              <label for="totalStudents" class="form-label">Total Students</label>
              <input type="number" class="form-control" id="totalStudents" name="totalStudents" placeholder="Enter total students" required>
            </div>
            <div class="text-center">
              <button type="submit" class="btn btn-primary w-100">Add Class</button>
            </div>
          </form>
        </div>
      </div>
      <div class="mt-3 text-center">
        <a href="classes?action=list" class="btn btn-secondary">Back to Class List</a>
      </div>
    </div>
  </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
