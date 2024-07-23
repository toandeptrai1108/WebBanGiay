<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!doctype html>
<html lang="en">
<head>
<title>Thêm địa chỉ nhận hàng</title>
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

</head>

<body>
<body class="dark">
	<div class="wrapper">
		<jsp:include page="aside_user.jsp" />
		<div class="main wrapper">

			<nav class="navbar navbar-expand px-4 py-3">
				<div class="navbar-collapse collapse">
					<ul class="navbar-nav ms-auto">
						<li class="nav-item dropdown"><a href="#"
							class="nav-icon pe-md-0" data-bs-toggle="dropdown">
								<div class="d-flex gap-3 align-items-center">
									<h3 class="mt-2">HT2K</h3>
									<img src="/assets/img/user/huydeptrai.jpg" alt="user"
										class="avatar">
								</div>
						</a>
							<div class="dropdown-menu dropdown-menu-end rounded">
								<a href="/historyOrder" class="dropdown-item"> <i
									class="lni lni-timer"></i> <span>Lịch sử đặt hàng</span>
								</a> <a href="#" class="dropdown-item"> <i class="lni lni-cog"></i>
									<span>Cài đặt</span>
								</a>
								<div class="dropdown-divider"></div>
								<a href="#" class="dropdown-item"> <i
									class="lni lni-question-circle"></i> <span>Hỗ trợ?</span>
								</a>
							</div></li>
					</ul>
				</div>
			</nav>
			<main class="content px-3 py-4 mt-3">
				<!-- -----------------------------------------------------------------------------------  -->
				<div class="card">
					<div class="fs-4 text-center mt-3">Profile</div>
					<form:form action="/updateUser" modelAttribute="user"
						class="form-group m-3">

						<!-- Trường nhập cho tên -->
						<div class="mb-3">
							<label for="ten" class="form-label">Tên:</label>
							<form:input path="ten" placeholder="Tên" class="form-control" />
						</div>

						<!-- Trường nhập cho email -->
						<div class="mb-3">
							<label for="email" class="form-label">Email:</label>
							<form:input path="email" placeholder="Email" class="form-control"
								readonly="true" />
						</div>

						<!-- Trường nhập cho tên đăng nhập -->
						<div class="mb-3">
							<label for="username" class="form-label">Tên đăng nhập:</label>
							<form:input path="username" placeholder="Tên đăng nhập"
								class="form-control" />
						</div>

						<!-- Trường nhập cho số điện thoại -->
						<div class="mb-3">
							<label for="sodienthoai" class="form-label">Số điện
								thoại:</label>
							<form:input path="sodienthoai" placeholder="Số điện thoại"
								class="form-control" />
						</div>

						<!-- Trường nhập cho ngày sinh -->
						<div class="mb-3">
							<label for="ngaysinh" class="form-label">Ngày sinh:</label>
							<form:input path="ngaysinh" type="date" class="form-control" />
						</div>

						<!-- Trường chọn cho giới tính -->
						<div class="mb-3 form-check">
							<form:checkbox path="gioitinh" class="form-check-input"
								id="gioitinh" />
							<label for="gioitinh" class="form-check-label">Nam</label>
						</div>
						<!-- Trường chọn cho vai trò -->
						<div class="mb-3 form-check">
							<form:hidden path="role" class="form-check-input" id="role" />
						</div>

						<hr>

						<button formaction="/quanlithongtin/updateUser" type="submit"
							class="btn btn-warning ms-3">Lưu thay đổi</button>
					</form:form>
				</div>
				<!-- -------------------------------------------------------------------------------------- -->
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

</body>



</html>