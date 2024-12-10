<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Student</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<div class="container mt-5">
    <h2 class="text-primary">Update Student Information</h2>
    <form action="${pageContext.request.contextPath}/students?action=update" method="post" class="mt-4">
        <input type="hidden"  name="id" value="${param.id}" class="form-control mb-3"  />
        <p>Student ID: ${param.id}</p>
        <div class="mb-3">
            <label for="name" class="form-label">Name:</label>
            <input type="text" id="name" name="name" value="${student.name}" class="form-control" required />
        </div>

        <div class="mb-3">
            <label for="className" class="form-label">Class:</label>
            <input type="text" id="className" name="className" value="${student.className}" class="form-control" required />
        </div>

        <div class="mb-3">
            <label for="email" class="form-label">Email:</label>
            <input type="email" id="email" name="email" value="${student.email}" class="form-control" required />
        </div>

        <div class="mb-3">
            <label for="password" class="form-label">Password:</label>
            <input type="password" id="password" name="password" value="${student.password}" class="form-control" required />
        </div>

        <h3 class="mt-4">Scores:</h3>
        <div class="row g-3">
            <div class="col-md-6">
                <label for="math" class="form-label">Math:</label>
                <input type="number" step="0.01" id="math" name="math" value="${result.mathScore}" class="form-control" required />
            </div>
            <div class="col-md-6">
                <label for="physics" class="form-label">Physics:</label>
                <input type="number" step="0.01" id="physics" name="physics" value="${result.physicsScore}" class="form-control" required />
            </div>
            <div class="col-md-6">
                <label for="chemistry" class="form-label">Chemistry:</label>
                <input type="number" step="0.01" id="chemistry" name="chemistry" value="${result.chemistryScore}" class="form-control" required />
            </div>
            <div class="col-md-6">
                <label for="literature" class="form-label">Literature:</label>
                <input type="number" step="0.01" id="literature" name="literature" value="${result.literatureScore}" class="form-control" required />
            </div>
            <div class="col-md-6">
                <label for="history" class="form-label">History:</label>
                <input type="number" step="0.01" id="history" name="history" value="${result.historyScore}" class="form-control" required />
            </div>
            <div class="col-md-6">
                <label for="geography" class="form-label">Geography:</label>
                <input type="number" step="0.01" id="geography" name="geography" value="${result.geographyScore}" class="form-control" required />
            </div>
            <div class="col-md-6">
                <label for="english" class="form-label">English:</label>
                <input type="number" step="0.01" id="english" name="english" value="${result.englishScore}" class="form-control" required />
            </div>
            <div class="col-md-6">
                <label for="informatics" class="form-label">Informatics:</label>
                <input type="number" step="0.01" id="informatics" name="informatics" value="${result.informaticsScore}" class="form-control" required />
            </div>
            <div class="col-md-6">
                <label for="physicalEducation" class="form-label">Physical Education:</label>
                <input type="number" step="0.01" id="physicalEducation" name="physicalEducation" value="${result.physicalEducation}" class="form-control" required />
            </div>
            <div class="col-md-6">
                <label for="civicEducation" class="form-label">Civic Education:</label>
                <input type="number" step="0.01" id="civicEducation" name="civicEducation" value="${result.civicEducation}" class="form-control" required />
            </div>
        </div>

        <br>
        <button type="submit" class="btn btn-primary">Update Student</button>
    </form>

    <br>
    <a href="${pageContext.request.contextPath}/students?action=list" class="btn btn-secondary">Back to Student List</a>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
