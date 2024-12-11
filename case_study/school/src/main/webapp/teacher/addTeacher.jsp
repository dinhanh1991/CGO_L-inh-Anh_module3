<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Teacher</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
    <h2 class="text-center mb-4">Add Teacher</h2>
    <form action="/teachers?action=insert" method="post" class="p-4 shadow rounded bg-light">
        <div class="mb-3">
            <label for="id" class="form-label fw-bold">Teacher ID</label>
            <input type="text" class="form-control" id="id" name="id" placeholder="Enter Teacher ID" required>
        </div>
        <div class="mb-3">
            <label for="name" class="form-label fw-bold">Name</label>
            <input type="text" class="form-control" id="name" name="name" placeholder="Enter Teacher Name" required>
        </div>
        <div class="mb-3">
            <label for="email" class="form-label fw-bold">Email</label>
            <input type="email" class="form-control" id="email" name="email" placeholder="Enter Email Address" required>
        </div>
        <div class="mb-3">
            <label for="homeRoomClassName" class="form-label fw-bold">Homeroom Class</label>
            <input type="text" class="form-control" id="homeRoomClassName" name="homeRoomClassName" placeholder="Enter Homeroom Class Name">
        </div>
        <div class="mb-3">
            <label for="subject" class="form-label fw-bold">Subject</label>
            <input type="text" class="form-control" id="subject" name="subject" placeholder="Enter Subject Taught">
        </div>
        <div class="mb-3">
            <label for="teachingClass" class="form-label fw-bold">Teaching Class</label>
            <input type="text" class="form-control" id="teachingClass" name="teachingClass" placeholder="Enter Teaching Class">
        </div>
        <div class="mb-3">
            <label for="idTeacherAssignment" class="form-label fw-bold">Teacher Assignment ID</label>
            <input type="text" class="form-control" id="idTeacherAssignment" name="idTeacherAssignment" placeholder="Enter Assignment ID">
        </div>
        <button type="submit" class="btn btn-primary d-flex align-items-center justify-content-center w-100">
            <i class="bi bi-person-plus me-2"></i>Add Teacher
        </button>
    </form>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.js"></script>
</body>
</html>