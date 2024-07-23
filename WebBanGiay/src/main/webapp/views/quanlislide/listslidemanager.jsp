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
				<!--Start DashBoard-->
				<div class="row">
					<div class="card">
						<div class="card-header bg-primary text-light">
							<h1 class="text-center">
								<i class="fa-solid fa-list"></i> Danh sách Slide
							</h1>
						</div>
						<div class="card-body p-0">
							<table class="table table-bordered">
								<thead>
									<tr class="text-center">
										<th scope="col" class="bg-info p-2 text-white">Ảnh Slide</th>
										<th scope="col" class="bg-info p-2 text-white">Link</th>
										<th scope="col" class="bg-info p-2 text-white">Trạng Thái</th>
										<th colspan="3" class="bg-info p-2 text-white">Hành động</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${DSSlide}" var="slide">
										<tr class="text-center">
											<td><img src="/assets/img/slide/${slide.anhdaidien}"
												alt="Image" width="100" /></td>
											<td>${slide.link}</td>
											<td><c:choose>
													<c:when test="${slide.trangthai}">
														<span class="badge bg-success">Active</span>
													</c:when>
													<c:otherwise>
														<span class="badge bg-secondary">Inactive</span>
													</c:otherwise>
												</c:choose>
											<td><a href="#"
												onclick="confirmDelete('${slide.maslide}')"
												class="btn btn-outline-danger"><i class="fa-solid fa-x"></i>
													Xóa</a></td>
											<td><a
												href="${pageContext.request.contextPath}/quanlislide/edit/${slide.maslide}"
												class="btn btn-outline-success"> <i
													class="fa-solid fa-pen-to-square"></i> Sửa
											</a></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
						<div class="card-footer">
							<a href="/quanlislide/create"
								class="btn btn-outline-primary float-end">Thêm Slide mới <i
								class="fa-duotone fa-plus fs-5 fw-bold"></i>
							</a>
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
		function confirmDelete(maslide) {
			if (confirm("Bạn có chắc chắn muốn xóa slide này?")) {
				window.location.href = "${pageContext.request.contextPath}/quanlislide/delete/"
						+ maslide;
			}
		}
	</script>
</body>
</html>