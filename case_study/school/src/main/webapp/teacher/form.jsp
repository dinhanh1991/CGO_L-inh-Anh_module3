<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thêm/Sửa Giáo Viên</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<div class="container mt-5">
    <div class="card shadow-lg">
        <div class="card-header bg-primary text-white text-center">
            <h2>${teacher == null ? 'Thêm Giáo Viên Mới' : 'Sửa Thông Tin Giáo Viên'}</h2>
        </div>
        <div class="card-body">
            <form action="teachers" method="post">
                <input type="hidden" name="action" value="${teacher == null ? 'insert' : 'update'}">
                <input type="hidden" name="id" value="${teacher != null ? teacher.id : ''}">

                <%--<div class="mb-3">
                    <label for="id" class="form-label">ID:</label>
                    <input type="text" class="form-control" name="id" id="id"
                           value="${teacher != null ? teacher.id : ''}"
                    ${teacher != null ? 'readonly' : ''} required>
                </div>--%>
<c:if test="${teacher == null}">
    <div class="mb-3">
        <label for="idNew" class="form-label">ID:</label>
        <input type="text" class="form-control" name="id" id="idNew" value="" required>
    </div>
</c:if>

<c:if test="${teacher != null}">
    <!-- Hiển thị input khi teacher có giá trị -->
    <div class="mb-3">
    <label for="id" class="form-label">ID:</label>
    <input type="text" class="form-control" name="id" id="id"
    value="${teacher.id}"
    readonly required>
    </div>

</c:if>
                <div class="mb-3">
                    <label for="name" class="form-label">Tên:</label>
                    <input type="text" class="form-control" name="name" id="name" value="${teacher != null ? teacher.name : ''}" required>
                </div>

                <div class="mb-3">
                    <label for="email" class="form-label">Email:</label>
                    <input type="email" class="form-control" name="email" id="email" value="${teacher != null ? teacher.email : ''}" required>
                </div>

                <div class="mb-3">
                    <label for="homeRoomClassName" class="form-label">Tên Lớp Chủ Nhiệm:</label>
                    <input type="text" class="form-control" name="homeRoomClassName" id="homeRoomClassName" value="${teacher != null ? teacher.homeRoomClassName : ''}" required>
                </div>

                <div class="mb-3">
                    <label for="subject" class="form-label">Môn Giảng Dạy:</label>
                    <input type="text" class="form-control" name="subject" id="subject" value="${teacher != null ? teacher.subject : ''}" required>
                </div>

                <div class="mb-3">
                    <label for="teachingClass" class="form-label">Lớp Giảng Dạy:</label>
                    <input type="text" class="form-control" name="teachingClass" id="teachingClass" value="${teacher != null ? teacher.teachingClass : ''}" required>
                </div>

                <div class="mb-3">
                    <label for="idTeacherAssignment" class="form-label">ID Phân Công Giáo Viên:</label>
                    <c:if test="${teacher == null}">
                        <input type="text" class="form-control" name="idTeacherAssignment" id="idTeacherAssignment" value="" required>
                    </c:if>
                </div>

                <div class="d-flex justify-content-between">
                    <button type="submit" class="btn btn-primary">${teacher == null ? 'Thêm Giáo Viên' : 'Cập Nhật'}</button>
                    <a href="teachers" class="btn btn-secondary">Quay lại</a>
                </div>
            </form>
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
