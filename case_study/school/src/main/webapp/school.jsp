<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>TEACHER</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
        }

        .container {
            max-width: 1200px;
        }

        h1 {
            color: #007bff;
        }

        .nav-list {
            list-style-type: none;
            padding-left: 0;
        }

        .nav-list li {
            margin: 10px 0;
        }

        .nav-link {
            text-decoration: none;
            padding: 10px 15px;
            display: block;
        }

        .nav-link:hover {
            background-color: #007bff;
            color: white;
        }
    </style>
</head>
<body>
<div class="container mt-5">
    <h1 class="text-center mb-4">HIGH SCHOOL</h1>

    <ul class="nav-list text-center">
        <li><a href="/students" class="btn btn-primary nav-link">Student List</a></li>
        <li><a href="/teachers" class="btn btn-success nav-link">Teacher List</a></li>
        <li><a href="/classes" class="btn btn-info nav-link">Class List</a></li>
    </ul>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
