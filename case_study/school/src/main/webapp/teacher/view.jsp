<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Chi Tiết Giáo Viên</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<div class="container mt-5">
  <div class="card shadow-lg">
    <div class="card-header bg-primary text-white text-center">
      <h2>Chi Tiết Giáo Viên</h2>
    </div>
    <div class="card-body">
      <div class="mb-3">
        <label class="form-label fw-bold">ID:</label>
        <p class="form-control-plaintext">${teacher.id}</p>
      </div>
      <div class="mb-3">
        <label class="form-label fw-bold">Tên:</label>
        <p class="form-control-plaintext">${teacher.name}</p>
      </div>
      <div class="mb-3">
        <label class="form-label fw-bold">Email:</label>
        <p class="form-control-plaintext">${teacher.email}</p>
      </div>
      <div class="mb-3">
        <label class="form-label fw-bold">Lớp Chủ Nhiệm:</label>
        <p class="form-control-plaintext">${teacher.homeRoomClassName}</p>
      </div>
      <div class="mb-3">
        <label class="form-label fw-bold">Môn Giảng Dạy:</label>
        <p class="form-control-plaintext">${teacher.subject}</p>
      </div>
      <div class="mb-3">
        <label class="form-label fw-bold">Lớp Giảng Dạy:</label>
        <p class="form-control-plaintext">${teacher.teachingClass}</p>
      </div>
    </div>
    <div class="card-footer text-center">
      <a href="teachers" class="btn btn-secondary">Quay lại Danh Sách</a>
    </div>
  </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
