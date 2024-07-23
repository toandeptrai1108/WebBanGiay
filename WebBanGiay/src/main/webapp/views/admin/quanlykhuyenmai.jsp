<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!doctype html>
<html lang="en">
<head>
<title>Quản lý khuyến mãi</title>
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
				<h3 class="fw-bold fs-4 text-start">Quản lý khuyến mãi</h3>
				<!--Start DashBoard-->
				<div class="row">
					<div class="card">
						<div class="container mt-5">
							<form:form action="/khuyenmai/indexKhuyenMai"
								modelAttribute="item" class="form-group" id="categoryForm">
								<form:input path="tenkhuyenmai" placeholder="Tên khuyến mãi?"
									class="form-control mb-3" />
								<form:input path="phantramkhuyenmai"
									placeholder="Phần trăm khuyến mãi?" class="form-control mb-3" />
								<form:input path="sotientoida"
									placeholder="Số tiền tối đa?" class="form-control mb-3" />
								<form:input type="date" path="ngaybatdau" id="ngaybatdau"
									placeholder="Ngày bắt đầu " class="form-control mb-3" />
								<form:input type="date" path="ngayketthuc" id="ngayketthuc"
									placeholder="Ngày kết thúc" class="form-control mb-3" />
								<hr>
								<button type="button" class="btn btn-success"
									onclick="validateForm()">Create</button>
								<button formaction="/khuyenmai/update"
									class="btn btn-warning ms-3">Update</button>
								<a href="/khuyenmai/delete/${item.makhuyenmai}"
									class="btn btn-danger ms-3">Delete</a>
								<a href="/khuyenmai/indexKhuyenMai"
									class="btn btn-secondary ms-3">Reset</a>
							</form:form>
						</div>


						<hr>
						<table class="table table-striped table-bordered">
							<thead>
								<tr>
									<th scope="col">Tên khuyến mãi</th>
									<th scope="col">Phần trăm khuyến mãi</th>
									<th scope="col">Số tiền tối đa</th>
									<th scope="col">Ngày bắt đầu</th>
									<th scope="col">Ngày kết thúc</th>
									<th scope="col"></th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="item" items="${items}">
									<tr>
										<td>${item.tenkhuyenmai}</td>
										<td>${item.phantramkhuyenmai}</td>
										<td>${item.sotientoida}</td>
										<td>${item.ngaybatdau}</td>
										<td>${item.ngayketthuc}</td>
										<td><a href="/khuyenmai/edit/${item.makhuyenmai}"
											class="btn btn-primary btn-sm">Edit</a></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
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
	<script>
		function validateForm() {
			var tenKhuyenMai = document.getElementById('tenkhuyenmai').value;
			var phanTramKhuyenMai = document
					.getElementById('phantramkhuyenmai').value;
			var ngayBatDau = document.getElementById('ngaybatdau').value;
			var ngayKetThuc = document.getElementById('ngayketthuc').value;

			if (!tenKhuyenMai || !phanTramKhuyenMai || !ngayBatDau
					|| !ngayKetThuc) {
				alert("Vui lòng nhập đầy đủ thông tin");
				return;
			}

			var ngayBatDauObj = new Date(ngayBatDau);
			var ngayKetThucObj = new Date(ngayKetThuc);

			if (ngayBatDauObj > ngayKetThucObj) {
				alert("Ngày bắt đầu phải nhỏ hơn ngày kết thúc");
				return;
			}

			// Nếu tất cả thông tin hợp lệ, gửi form đi
			document.getElementById('categoryForm').submit();
		}
	</script>
</body>
</html>