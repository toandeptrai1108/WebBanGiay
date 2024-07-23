<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!doctype html>
<html lang="en">
<head>
<title>Quản lý sản phẩm</title>
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
						<form:form action="/productmanager" class="row g-3"
							modelAttribute="sp" method="post">
							<div class="col-md-6">
								<label for="" class="form-label">Tên Sản Phẩm</label>
								<form:input path="tensanpham" type="text" class="form-control" />
							</div>
							<div class="col-md-6">
								<label for="" class="form-label">Hãng</label>
								<form:select path="hang" class="form-control" id="">
									<form:option value="" label="-- Chọn hãng --" />
									<c:forEach items="${listHang}" var="items">
										<form:option value="${items.mahang}" label="${items.tenhang}" />
									</c:forEach>
								</form:select>
							</div>
							<div class="col-md-12">
								<form:checkbox path="trangthai" class="form-check-input" />
								<label for="" class="form-check-label">Còn hàng</label>
							</div>
							<div class="col-md-6">
								<label for="" class="form-label">Nội dung sản phẩm</label>
								<form:input path="noidungsanpham" type="text"
									class="form-control" id="" />
							</div>
							<div class="col-md-6">
								<label for="" class="form-label">Giá gốc</label>
								<form:input path="giagoc" type="number" class="form-control"
									id="" />
							</div>
							<div class="col-md-12">
								<label for="" class="form-label">Giảm Giá</label>
								<form:input path="giamgia" type="number" class="form-control"
									id="" />
							</div>
							<div class="col-md-12">
								<label for="" class="form-label">Giá</label>
								<form:input path="gia" type="number" class="form-control" id="" />
							</div>
							<div class="col-md-12">
								<label for="" class="form-label">Danh mục sản phẩm</label>
								<form:select path="danhmuc" class="form-control"
									id="madonvivanchuyen">
									<form:option value="" label="-- Chọn danh mục sản phẩm --" />
									<c:forEach items="${listDanhMuc}" var="items">
										<form:option value="${items.madanhmuc}"
											label="${items.tendanhmuc}" />
									</c:forEach>
								</form:select>
							</div>
							<div class="col-12">
								<label for="" class="form-label">Chọn ảnh đại điện</label> 
								<form:input
									class="form-control " path="anhdaidien" type="file" placeholder="Thêm hình ảnh"/>
							</div>
							<hr>
							<div class="col-12 mt-0">
								<button formaction="/createproduct" type="submit"
									class="btn btn-success">Thêm Sản Phẩm</button>
								<button formaction="/updateproduct" type="submit"
									class="btn btn-warning">Cập nhật</button>
								<button formaction="/updateproduct" type="submit"
									class="btn btn-danger">Xóa</button>
							</div>

						</form:form>
						<table class="table table-bordered mt-3">
							<tr>
								<th>STT</th>
								<th>Tên Sản Phẩm</th>
								<th>Trạng Thái</th>
								<th>Chi Tiết</th>
							</tr>
							<c:forEach items="${listSP}" var="item" varStatus="loop">
								<tr>
									<td>${loop.index + 1}</td>
									<td>${item.tensanpham}</td>
									<td><c:if test="${item.trangthai}">
											<span class="badge bg-success">Còn hàng</span>
										</c:if> <c:if test="${item.trangthai==false}">
											<span class="badge bg-warning">Hết hàng</span>
										</c:if></td>
									<td><a class="btn btn-warning"
										href="/productmanager/chitietsanpham/${item.masanpham}">Edit</a>
										<a class="btn btn-danger"
										href="/productmanager/chitietsanpham/${item.masanpham}">Xóa</a>
										<a class="btn btn-primary"
										href="/productmanager/chitietsanpham/${item.masanpham}">Chi
											Tiết Sản Phẩm</a>
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