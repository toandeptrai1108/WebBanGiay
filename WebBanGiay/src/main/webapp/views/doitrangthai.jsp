<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin />
</head>
<body>
	<div class="container">
		<form:form modelAttribute="user" action="/usermanager">
			<div class="row">
				<div class="col-md-6">
					<label class="form-label">Tên người dùng</label>
					<form:input class="form-control" path="ten" type="text" value="" />
				</div>

				<div class="col-md-6">
					<label class="form-label">Hot</label>
					<form:select path="trangthai" class="form-control" id="">
						<form:option value="false" label="Không Còn Hoạt Động" />
						<form:option value="true" label="Còn Hoạt Động" />
					</form:select>
				</div>
				<div class="col-md-12">
					<form:input class="form-control" path="manguoidung" />
				</div>
				<div class="col-md-12">
					<form:input class="form-control" path="username" />
				</div>
				<div class="col-md-12">
					<form:input class="form-control" path="password" />
				</div>

				<div class="col-md-12">
					<form:input class="form-control" path="sodienthoai" />
				</div>
				<div class="col-md-12">
					<form:input class="form-control" path="ngaysinh" />
				</div>
				<div class="col-md-12">
					<form:input class="form-control" path="gioitinh" />
				</div>
				<div class="col-md-12">
					<form:input class="form-control" path="anhdaidien" />
				</div>
				<div class="col-md-12">
					<form:input class="form-control" path="role" />
				</div>
				<div class="col-md-12">
					<form:input class="form-control" path="email" />
				</div>
				<button class="mt-3 btn btn-primary"
					formaction="/usermanager/update">Update</button>
			</div>

		</form:form>

	</div>
</body>
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
	integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
	crossorigin="anonymous"></script>

<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js"
	integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+"
	crossorigin="anonymous"></script>
<script>
	var inputElement = document.getElementById("manguoidung"); // Lấy phần tử đứng trước input, nghĩa là nhãn
	var inputUsername = document.getElementById("username");
	var inputPassword = document.getElementById("password");
	var inputEmail = document.getElementById("email");
	var inputSodienthoai = document.getElementById("sodienthoai");
	var inputNgaysinh = document.getElementById("ngaysinh");
	var inputGioitinh = document.getElementById("gioitinh");
	var inputAnhdaidien = document.getElementById("anhdaidien");
	var inputRole = document.getElementById("role");
	// Ẩn input và nhãn
	inputElement.style.display = "none";
	inputUsername.style.display = "none";
	inputPassword.style.display = "none";
	inputSodienthoai.style.display = "none";
	inputNgaysinh.style.display = "none";
	inputGioitinh.style.display = "none";
	inputAnhdaidien.style.display = "none";
	inputRole.style.display = "none";
	inputEmail.style.display = "none";
</script>
</html>