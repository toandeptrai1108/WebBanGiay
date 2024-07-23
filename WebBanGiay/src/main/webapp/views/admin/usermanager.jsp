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
				<h3 class="fw-bold fs-4 text-start">Quản lý sản phẩm</h3>
				<!--Start DashBoard-->
				<div class="row">
					<div class="card">
						<div class="col-12">
							<table class="table table-bordered text-center">
								<tr>
									<th>STT</th>
									<th>Tên Người Dùng</th>
									<th>Username</th>
									<th>Email</th>
									<th>Số Điện Thoại</th>
									<th>Ngày Sinh</th>
									<th>Giới Tính</th>
									<th>Trạng Thái</th>
									<th>Vai Trò</th>
									<th>Sửa</th>
									<th>Xóa</th>
								</tr>
								<c:forEach items="${listuser}" var="item" varStatus="loop">
									<tr>
										<td>${loop.index + 1}</td>
										<td>${item.ten}</td>
										<td>${item.username}</td>
										<td>${item.email}</td>
										<td>${item.sodienthoai}</td>
										<td>${item.ngaysinh}</td>
										<td>${item.gioitinh ? "Nam" : "Nữ"}</td>
										<td>${item.trangthai? "Còn Hoạt Động" : "Không Còn Hoạt Động"}</td>
										<td>${item.role ? "Admin" : "Khách Hàng"}</td>
										<td><a href="/usermanager/edit/${item.manguoidung}"
											class="btn btn-primary"><i class="fa-solid fa-pen"></i>
												Edit</a></td>
										<td><a href="/deleteuser/${item.manguoidung}"
											class="btn btn-danger"><i class="fa-solid fa-trash"></i>
												Xóa</a></td>
									</tr>
								</c:forEach>
							</table>
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
</body>
</html>