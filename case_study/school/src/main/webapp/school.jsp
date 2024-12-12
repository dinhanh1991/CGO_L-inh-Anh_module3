<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>School Management</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">
            <i class="fas fa-school"></i> School Management
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item">
                    <a class="nav-link active" href="#">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#loginModal" data-bs-toggle="modal">
                        <i class="fas fa-sign-in-alt"></i> Login
                    </a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<div class="container mt-5">
    <h1 class="text-center mb-4">Welcome to the School Management System</h1>
    <div class="row">
    </div>
    <div class="col-md-4">
        <div class="card">
            <div class="card-header bg-primary text-white">
                <i class="fas fa-chalkboard"></i> Classes
            </div>
            <div class="card-body">
                <p>Manage all classes in the school.</p>
                <a href="/classes" class="btn btn-primary">
                    <i class="fas fa-list"></i> View Classes
                </a>
            </div>
        </div>
    </div>


    <div class="col-md-4">
        <div class="card">
            <div class="card-header bg-success text-white">
                <i class="fas fa-chalkboard-teacher"></i> Teachers
            </div>
            <div class="card-body">
                <p>View and manage teachers.</p>
                <a href="/teachers" class="btn btn-success">
                    <i class="fas fa-users"></i> View Teachers
                </a>
            </div>
        </div>
    </div>


    <div class="col-md-4">
        <div class="card">
            <div class="card-header bg-warning text-white">
                <i class="fas fa-user-graduate"></i> Students
            </div>
            <div class="card-body">
                <p>View and manage students.</p>
                <a href="/students" class="btn btn-warning text-white">
                    <i class="fas fa-user-friends"></i> View Students
                </a>
            </div>
        </div>
    </div>

</div>


</div>

<div class="modal fade" id="loginModal" tabindex="-1" aria-labelledby="loginModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="loginModalLabel">
                    <i class="fas fa-sign-in-alt"></i> Login
                </h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form action="/school" method="post">
                    <div class="mb-3">
                        <label for="username" class="form-label">Username</label>
                        <input type="text" class="form-control" id="username" name="username" required>
                    </div>
                    <div class="mb-3">
                        <label for="password" class="form-label">Password</label>
                        <input type="password" class="form-control" id="password" name="password" required>
                    </div>
                    <div class="mb-3">
                        <label for="role" class="form-label">Role</label>
                        <select class="form-select" id="role" name="role" required>
                            <option value="">Select Role</option>
                            <option value="student">Student</option>
                            <option value="teacher">Teacher</option>
                            <option value="admin">Admin</option>
                        </select>
                    </div>
                    <button type="submit" class="btn btn-primary w-100">
                        <i class="fas fa-sign-in-alt"></i> Login
                    </button>
                </form>
                <c:if test="${not empty errorMessage}">
                    <div class="alert alert-danger mt-3">
                            ${errorMessage}
                    </div>
                </c:if>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
