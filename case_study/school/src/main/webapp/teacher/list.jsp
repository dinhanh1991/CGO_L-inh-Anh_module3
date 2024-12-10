<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Danh Sách Giáo Viên</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<div class="container mt-5">
  <div class="d-flex justify-content-between align-items-center mb-3">
    <h1 class="text-primary">Danh Sách Giáo Viên</h1>
    <a href="teachers?action=new" class="btn btn-success">Thêm Giáo Viên Mới</a>
  </div>
  <table class="table table-bordered table-striped table-hover">
    <thead class="table-primary">
    <tr>
      <th>ID</th>
      <th>Tên</th>
      <th>Email</th>
      <th>Lớp Chủ Nhiệm</th>
      <th>Môn Giảng Dạy</th>
      <th>Lớp Giảng Dạy</th>
      <th>Thao Tác</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="teacher" items="${teachers}">
      <tr>
        <td>${teacher.id}</td>
        <td>${teacher.name}</td>
        <td>${teacher.email}</td>
        <td>${teacher.homeRoomClassName}</td>
        <td>${teacher.subject}</td>
        <td>${teacher.teachingClass}</td>
        <td>
          <div class="d-flex gap-2">
            <a href="teachers?action=view&id=${teacher.id}" class="btn btn-info btn-sm">Xem</a>
            <a href="teachers?action=edit&id=${teacher.id}" class="btn btn-warning btn-sm">Sửa</a>
            <a href="teachers?action=delete&id=${teacher.id}"
               class="btn btn-danger btn-sm"
               onclick="return confirm('Bạn có chắc chắn không?')">Xóa</a>
          </div>
        </td>
      </tr>
    </c:forEach>
    </tbody>
  </table>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
