<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Search Results</title>
    <!-- Thêm liên kết đến Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<div class="container mt-4">
    <h1>Search Results for: "${query}"</h1>
    <table class="table table-striped">
        <thead>
        <tr>
            <th>STT</th>
            <th>Class ID</th>
            <th>Class Name</th>
            <th>Teacher ID</th>
            <th>Total Students</th>
        </tr>
        </thead>
        <tbody>
        <!-- Sử dụng JSTL để lặp qua các kết quả tìm kiếm -->
        <c:forEach var="classItem" items="${results}" varStatus="status">
            <tr>
                <td>${status.index + 1}</td>
                <td>${classItem.teacherName}</td>
                <td>${classItem.studentId}</td>
                <td>${classItem.studentName}</td>
                <td>${classItem.averageScore}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <a href="/classes?action=search" class="btn btn-primary">Search again</a>
</div>

<!-- Thêm Bootstrap JS và jQuery -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>
