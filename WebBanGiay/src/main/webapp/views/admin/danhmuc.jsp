<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!doctype html>
<html lang="en">
<head>
<title>Quản lý danh mục</title>
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
				<h3 class="fw-bold fs-4 text-start">Quản lý danh mục</h3>
				<!--Start DashBoard-->
				<div class="row">
					<div class="card">
						<div class="col-12 mt-3">
							<form:form action="/danhmuc" modelAttribute="danhmuc"
								class="row g-3">
								<div class="col-md-6">
									<label class="form-label">Tên Danh Mục</label>
									<form:input class="form-control" path="tendanhmuc" type="text" />
									<span class="text-danger">${error}</span>
								</div>

								<div class="col-md-6">
									<label class="form-label">Hot</label>
									<form:select path="hot" class="form-control" id="">
										<form:option value="false" label="Không Hot" />
										<form:option value="true" label="Hot" />
									</form:select>
								</div>
								<div class="col-md-12">
									<label class="form-label">Trạng Thái</label>
									<form:select path="trangthai" class="form-control" id="">
										<form:option value="false" label="Không Hiển Thị" />
										<form:option value="true" label="Hiển Thị" />
									</form:select>
								</div>
								<div class="col-md-12">
									<label class="form-label">Ảnh</label>
									<form:input class="form-control" path="anhdaidien" type="file" />
								</div>
								<form:input path="madanhmuc" value="${idDM}" id="madanhmuc"/>
								<hr>
								<div class="col-md-6">
								<button formaction="/createdanhmuc" class="btn btn-success m-0">Thêm
									danh mục</button>
									<button formaction="/updatedanhmuc" class="btn btn-success m-0">Cập nhật
									danh mục</button>
								</div>		
							</form:form>
							<table class="table table-bordered mt-3">
								<tr class="text-center">
									<th>STT</th>
									<th>Tên danh mục</th>
									<th>Hot</th>
									<th>Trạng thái</th>
									<th>Ảnh</th>
									<th></th>
								</tr>
								<c:forEach items="${listdm}" var="item" varStatus="loop">
									<tr class="text-center">
										<td>${loop.index + 1}</td>
										<td>${item.tendanhmuc}</td>
										<td>${item.hot ? "Đang Hot" : "Không Hot"}</td>
										<td>${item.trangthai ? "Hiển Thị" : "Không Hiển Thị"}</td>
										<td><img src="/assets/img/danhmuc/${item.anhdaidien}"
											alt="Ảnh" class="product-image"></td>
										<td><a href="/danhmuc/editdanhmuc/${item.madanhmuc}">Edit</a></td>
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
		<script>
		var inputElement = document.getElementById("madanhmuc");

		inputElement.style.display = "none";
	</script>
</body>
</html>