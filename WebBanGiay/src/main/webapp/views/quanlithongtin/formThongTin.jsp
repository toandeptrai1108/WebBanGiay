<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container mt-5">
    <div class="card">
        <div class="card-header">Chỉnh Sửa Thông Tin Người Dùng</div>
        <div class="card-body">
            <form:form action="/updateUser" modelAttribute="user" class="form-group">

                <!-- Trường nhập cho tên -->
                <div class="mb-3">
                    <label for="ten" class="form-label">Tên:</label>
                    <form:input path="ten" placeholder="Tên" class="form-control" />
                </div>

                <!-- Trường nhập cho email -->
                <div class="mb-3">
                    <label for="email" class="form-label">Email:</label>
                    <form:input path="email" placeholder="Email" class="form-control" readonly="true"/>
                </div>

                <!-- Trường nhập cho tên đăng nhập -->
                <div class="mb-3">
                    <label for="username" class="form-label">Tên đăng nhập:</label>
                    <form:input path="username" placeholder="Tên đăng nhập" class="form-control" />
                </div>

                <!-- Trường nhập cho mật khẩu -->
                <div class="mb-3">
                    <label for="password" class="form-label">Mật khẩu:</label>
                    <form:input path="password" placeholder="Mật khẩu" type="password" class="form-control" disabled="true"/>
                </div>

                <!-- Trường nhập cho số điện thoại -->
                <div class="mb-3">
                    <label for="sodienthoai" class="form-label">Số điện thoại:</label>
                    <form:input path="sodienthoai" placeholder="Số điện thoại" class="form-control" />
                </div>

                <!-- Trường nhập cho ngày sinh -->
                <div class="mb-3">
                    <label for="ngaysinh" class="form-label">Ngày sinh:</label>
                    <form:input path="ngaysinh" type="date" class="form-control" />
                </div>

                <!-- Trường chọn cho giới tính -->
                <div class="mb-3 form-check">
                    <form:checkbox path="gioitinh" class="form-check-input" id="gioitinh" />
                    <label for="gioitinh" class="form-check-label">Giới tính</label>
                </div>

                <!-- Trường nhập cho ảnh đại diện -->
                <div class="mb-3">
                    <label for="anhdaidien" class="form-label">Ảnh đại diện:</label>
                    <form:input path="anhdaidien" placeholder="Ảnh đại diện" class="form-control" />
                </div>

                <!-- Trường chọn cho trạng thái -->
                <div class="mb-3 form-check">
                    <form:checkbox path="trangthai" class="form-check-input" id="trangthai" disabled="true"/>
                    <label for="trangthai" class="form-check-label">Trạng thái</label>
                </div>

                <!-- Trường chọn cho vai trò -->
                <div class="mb-3 form-check">
                    <form:hidden path="role" class="form-check-input" id="role" />
                </div>

                <hr>

                <button formaction="/quanlithongtin/updateUser" type="submit" class="btn btn-warning ms-3">Cập nhật</button>
               
                <!--  <a href="/quanlithongtin/reset" class="btn btn-secondary ms-3">Đặt lại</a>-->
            </form:form>
        </div>
    </div>
</div>
</body>
</html>