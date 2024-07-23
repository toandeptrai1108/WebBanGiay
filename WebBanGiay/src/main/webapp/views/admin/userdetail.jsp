<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!doctype html>
<html lang="en">
<head>
<title>Quản lý người dùng</title>
<!-- Required meta tags -->
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<!-- Bootstrap CSS v5.2.1 -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous" />
<!-- Font awesome -->
<script src="https://kit.fontawesome.com/c5fd529f32.js"
	crossorigin="anonymous"></script>
<!-- CSS -->
<link rel="stylesheet" href="/assets/css/dashboard.css">
<link rel="stylesheet"
	href="https://cdn.lineicons.com/4.0/lineicons.css" />
<style type="text/css">
.product-image {
	width: 5rem;
	height: 5rem;
	object-fit: cover;
}
</style>
</head>

<body>
<body class="dark">

	<div class="wrapper">
		<!-- Include aside-->
		<jsp:include page="aside_admin.jsp" />
		<div class="main wrapper">
			<!-- Include nav -->
			<jsp:include page="nav_admin.jsp" />
			<main class="content px-3 py-4 mt-3">
				<h3 class="fw-bold fs-4 text-start">Chi Tiết User</h3>
				<!--Start DashBoard-->
				<div class="row">
					<div class="card">
						<div class="col-12">
							<form:form modelAttribute="user" action="/usermanager">
								<div class="row">
									<div class="col-md-6">
										<label class="form-label">Tên người dùng</label>
										<form:input class="form-control" path="ten" type="text"
											value="" />
									</div>

									<div class="col-md-6">
										<label class="form-label">Trạng thái</label>
										<form:select path="trangthai" class="form-control" id="">
											<form:option value="true" label="Cho phép hoạt động" />
											<form:option value="false" label="Chặn người dùng" />
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
					</div>
				</div>
			</main>
			<footer class="footer">
				<div class="container-fluid">
					<div class="row text-body-secondary">
						<div class="col-6 text-start">
							<a href="#" class="text-body-secondary"> <strong>User
									Panel</strong>
							</a>
						</div>
					</div>
				</div>
			</footer>
		</div>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
		integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
		crossorigin="anonymous"></script>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js"
		integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+"
		crossorigin="anonymous"></script>
	<script src="/assets/js/dashboard.js"></script>
	<script type="text/javascript">
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
</body>
</html>