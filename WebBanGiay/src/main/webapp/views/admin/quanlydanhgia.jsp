<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!doctype html>
<html lang="en">
<head>
<title>Quản lý đánh giá</title>
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
								<i class="fa-solid fa-list"></i> Danh sách Đánh giá
							</h1>
						</div>
						<div class="card-body p-0">
							<table class="table table-bordered">
								<thead>
									<tr class="text-center">
										<th scope="col" class="bg-info p-2 text-white">Nội dung</th>
										<th scope="col" class="bg-info p-2 text-white">Số sao</th>
										<th scope="col" class="bg-info p-2 text-white">Ngày đánh
											giá</th>
										<th scope="col" class="bg-info p-2 text-white">Sản phẩm</th>
										<th scope="col" class="bg-info p-2 text-white">Người dùng</th>
										<th scope="col" class="bg-info p-2 text-white">Phản hồi</th>
										<th colspan="3" class="bg-info p-2 text-white">Hành động</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${DSDanhGia}" var="danhGia">
										<tr class="text-center">
											<td>${danhGia.noidung}</td>
											<td>${danhGia.sosao}</td>
											<td>${danhGia.ngaydanhgia}</td>
											<td><c:choose>
													<c:when test="${not empty danhGia.sanpham}">
                                                ${danhGia.sanpham.tensanpham}
                                            </c:when>
													<c:otherwise>
														<span class="text-danger">Không có sản phẩm</span>
													</c:otherwise>
												</c:choose></td>
											<td><c:choose>
													<c:when test="${not empty danhGia.user}">
                                                ${danhGia.user.ten}
                                            </c:when>
													<c:otherwise>
														<span class="text-danger">Không có người dùng</span>
													</c:otherwise>
												</c:choose></td>
											<td><c:choose>
													<c:when test="${not empty danhGia.phanhoi}">
                                                ${danhGia.phanhoi}
                                            </c:when>
													<c:otherwise>
														<span class="text-warning">Chưa có phản hồi</span>
													</c:otherwise>
												</c:choose></td>
											<td><a href="#"
												onclick="confirmDelete('${danhGia.madanhgia}')"
												class="btn btn-outline-danger"> <i class="fa-solid fa-x"></i>
													Xóa
											</a></td>

											<td><a
												href="${pageContext.request.contextPath}/quanlidanhgia/phanhoi/${danhGia.madanhgia}"
												class="btn btn-outline-success"> <i
													class="fa-solid fa-reply"></i> Phản hồi
											</a></td>
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
		function confirmDelete(maDanhGia) {
			if (confirm('Bạn có chắc chắn muốn xóa đánh giá này không?')) {
				window.location.href = '/quanlidanhgia/delete/' + maDanhGia;
			}
		}
	</script>
</body>
</html>