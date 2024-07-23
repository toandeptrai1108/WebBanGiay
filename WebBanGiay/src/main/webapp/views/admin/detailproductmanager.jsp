<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!doctype html>
<html lang="en">
<head>
<title>Quản lý chi tiết sản phẩm</title>
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
				<h3 class="fw-bold fs-4 text-start">Quản lý chi tiết sản phẩm</h3>
				<!--Start DashBoard-->
				<div class="row">
					<div class="card">
						<form:form action="" modelAttribute="entity" class="row g-3">
							<div class="col-md-6 d-none">
								<form:input class="form-control" path="sanpham.masanpham"
									value="${idSP}" id="masanpham" />
							</div>
							<div class="col-12 d-none">
								<label for="" class="form-label">Mã chi tiết sản phẩm</label>
								<form:input path="machitietsanpham" type="number"
									class="form-control" />
							</div>
							<div class="col-12">
								<label for="" class="form-label">Giá</label>
								<form:input path="giatien" type="number" class="form-control" />
							</div>

							<div class="col-md-6">
								<label for="" class="form-label">Màu Sắc</label>
								<form:input path="mausac" type="text" class="form-control" />
							</div>
							<div class="col-md-6">
								<label for="" class="form-label">Size</label>
								<form:input path="size" type="text" class="form-control" id="" />
							</div>

							<div class="col-12">
								<label for="" class="form-label">Số Lượng</label>
								<form:input path="soluong" type="number" class="form-control"
									id="" />
							</div>
							<hr>
							<div class="col-12 mt-0 mb-3">
								<button formaction="/createdetailproduct" type="submit"
									class="btn btn-success">Thêm Chi Tiết Sản Phẩm</button>
								<button formaction="/update/detailproduct" type="submit"
									class="btn btn-warning">Cập nhật sản phẩm</button>
								<button formaction="/reset/detailproduct" type="submit"
									class="btn btn-primary">Làm mới</button>
							</div>
						</form:form>

						<table class="table table-bordered ">
							<tr>
								<th>STT</th>
								<th>Màu Sắc</th>
								<th>Size</th>
								<th>Số Lượng</th>
								<th>Giá Tiền</th>
								<th>Chỉnh sửa</th>
							</tr>
							<c:forEach items="${ctsp}" var="item" varStatus="loop">
								<tr>
									<td>${loop.index + 1}</td>
									<td>${item.mausac}</td>
									<td>${item.size}</td>
									<td>${item.soluong}</td>
									<td><fmt:formatNumber value="${item.giatien}"></fmt:formatNumber>
										VND</td>
									<td><a class="btn btn-warning"
										href="/productmanager/chitietsanpham/edit/${item.machitietsanpham}">Edit</a>
										<a class="btn btn-danger"
										href="/productmanager/chitietsanpham/delete/${item.machitietsanpham}">Delete</a>
									</td>
								</tr>
							</c:forEach>
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
</body>
</html>