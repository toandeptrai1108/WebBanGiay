<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!doctype html>
<html lang="en">
<head>
<title>Thống kê doanh thu theo sản phẩm</title>
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
				<h3 class="fw-bold fs-4 text-start">DashBoard</h3>
				<!--Start DashBoard-->
				<div class="row">
					<!-- Thêm nội dung tại đây -->
					<div class="col-12 col-sm-6 col-md-4 col-lg-3">
						<a class="text-decoration-none" href="#">
							<div class="dash-single-item dsi-1">
								<div
									class="dash-item-wrapper d-flex justify-content-between align-items-start">
									<div class="dash-item-ico">
										<i class="fa-solid fa-cart-shopping text-light fs-2"></i>
									</div>
									<div class="dash-item-details text-end">
										<div class="dash-item-name fw-bold">Số lượng đơn hàng</div>
										<span class="dash-item-numb fw-bold">${tongDonHang}</span>
									</div>
								</div>
							</div>
						</a>
					</div>
					<!-- Thêm nội dung tại đây -->
					<div class="col-12 col-sm-6 col-md-4 col-lg-3">
						<a class="text-decoration-none" href="#">
							<div class="dash-single-item dsi-2">
								<div
									class="dash-item-wrapper d-flex justify-content-between align-items-start">
									<div class="dash-item-ico">
										<i class="fa-solid fa-cart-arrow-down text-light fs-2"></i>
									</div>
									<div class="dash-item-details text-end">
										<div class="dash-item-name fw-bold">Tổng số lượng bán ra</div>
										<span class="dash-item-numb fw-bold">${tongSoLuongBanRa}</span>
									</div>
								</div>
							</div>
						</a>
					</div>
					<!-- Thêm nội dung tại đây -->
					<div class="col-12 col-sm-6 col-md-4 col-lg-3">
						<a class="text-decoration-none" href="#">
							<div class="dash-single-item dsi-3">
								<div
									class="dash-item-wrapper d-flex justify-content-between align-items-start">
									<div class="dash-item-ico">
										<i class="fa-solid fa-dollar-sign text-light fs-2"></i>
									</div>
									<div class="dash-item-details text-end">
										<div class="dash-item-name fw-bold">Tổng doanh thu</div>
										<span class="dash-item-numb fw-bold"><fmt:formatNumber
												value="${tongDoanhThu}" type="number" groupingUsed="true"
												pattern="###,###" /> VND</span>
									</div>
								</div>
							</div>
						</a>
					</div>

					<!-- Thêm nội dung tại đây -->
					<div class="col-12 col-sm-6 col-md-4 col-lg-3">
						<a class="text-decoration-none" href="#">
							<div class="dash-single-item dsi-4">
								<div
									class="dash-item-wrapper d-flex justify-content-between align-items-start">
									<div class="dash-item-ico">
										<i class="fa-solid fa-comment text-light fs-2"></i>
									</div>
									<div class="dash-item-details text-end">
										<div class="dash-item-name fw-bold">Tổng đánh giá</div>
										<span class="dash-item-numb fw-bold">${tongDanhGia}</span>
									</div>
								</div>
							</div>
						</a>
					</div>
				</div>
				<h3 class="fw-bold fs-4 text-start mt-5 text-center">Thống kê
					doanh thu theo sản phẩm</h3>
				<!-- Chọn ngày -->
				<div class="row g-3 mt-3 mb-3">
					<div class="col-md-4">
						<h3 class="fw-bold fs-6 text-start">
							<span class="text-danger">*</span>Ngày bắt đầu
						</h3>
						<input class="form-control" id="ngayBatDau" type="date"
							name="ngayBatDau" value="${ngayBatDau}">
						<!-- <p class="text-danger">Ngày bắt đầu lớn hơn ngày hiện tại</p>
						<p class="text-danger">Ngày bắt đầu lớn hơn ngày kết thúc</p> -->
						<p class="text-danger">${loiNgayBatDau1}</p>
						<p class="text-danger">${loiNgayBatDau2}</p>
						<p class="text-danger">${loiNgayBatDau3}</p>
					</div>
					<div class="col-md-4">
						<h3 class="fw-bold fs-6 text-start">
							<span class="text-danger">*</span>Ngày kết thúc
						</h3>
						<input class="form-control" id="ngayKetThuc" type="date"
							name="ngayKetThuc" value="${ngayKetThuc}">
						<!-- <p class="text-danger">Ngày kết thúc nhỏ hơn ngày bắt đầu</p> -->
						<p class="text-danger">${loiNgayKetThuc1}</p>
					</div>
					<div class="col-md-3">
						<a href="#tuan" class="btn btn-primary">Tuần</a> <a href="#tuan"
							class="btn btn-primary">Tháng</a> <a href="#tuan"
							class="btn btn-primary">Năm</a>
						<button id="xuatExcel" class="btn btn-success w-50 mt-3">
							Xuất Excel <i class="fa-regular fa-file-excel"></i>
						</button>
					</div>
				</div>
				<!-- Bảng thống kê -->
				<div class="col-12 ">
					<table class="table table-striped mt-3">
						<thead>
							<tr class="highlight">
								<th class="align-middle" scope="col">STT</th>
								<th class="align-middle" scope="col">Sản phẩm</th>
								<th class="align-middle" scope="col">Tên sản phẩm</th>
								<th class="align-middle" scope="col">Danh mục</th>
								<th class="align-middle" scope="col">Hãng</th>
								<th class="align-middle" scope="col">Số lượng bán</th>
								<th class="align-middle" scope="col">Doanh thu</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${listDonHangTheoNgay}" var="item"
								varStatus="loop">
								<tr>
									<th scope="row" class="align-middle">${loop.index + 1}</th>
									<td><img
										src="/assets/img/product/${item.sanpham.anhdaidien}"
										alt="Ảnh ${item.sanpham.tensanpham}" class="product-image"></td>
									<td class="align-middle">${item.sanpham.tensanpham}</td>
									<td class="align-middle">${item.sanpham.danhmuc.tendanhmuc}</td>
									<td class="align-middle">${item.sanpham.hang.tenhang}</td>
									<td class="align-middle">${item.soluong}</td>
									<td class="align-middle"><fmt:formatNumber
											value="${item.tongtien}" type="number" groupingUsed="true"
											pattern="###,###" /> VND</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>

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
		document.getElementById('ngayKetThuc')
				.addEventListener(
						'change',
						function() {
							let urlCu = new URL(window.location.href);
							window.history.pushState({}, '', '/');
							let url = new URL(window.location.href
									+ "thongke/dashboard");
							let ngayBatDau = document
									.getElementById('ngayBatDau').value;
							let ngayKetThuc = document
									.getElementById('ngayKetThuc').value;
							if (ngayBatDau != "") {
								url.searchParams.set("ngayBatDau", ngayBatDau);
							}
							if (ngayKetThuc != "") {
								url.searchParams
										.set("ngayKetThuc", ngayKetThuc);
							}
							window.location.href = url;
						});

		document.getElementById('xuatExcel')
				.addEventListener(
						'click',
						function() {
							let urlCu = new URL(window.location.href);
							window.history.pushState({}, '', '/');
							let url = new URL(window.location.href
									+ "thongke/exportExcel");
							let ngayBatDau = document
									.getElementById('ngayBatDau').value;
							let ngayKetThuc = document
									.getElementById('ngayKetThuc').value;
							if (ngayBatDau != "") {
								url.searchParams.set("ngayBatDau", ngayBatDau);
							}
							if (ngayKetThuc != "") {
								url.searchParams
										.set("ngayKetThuc", ngayKetThuc);
							}
							window.location.href = url;
						});
	</script>
</body>



</html>