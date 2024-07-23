<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!doctype html>
<html lang="en">
<head>
<title>Lịch sử đặt hàng</title>
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
<body>

	<aside id="sidebar">
		<div class="d-flex">
			<button id="toggle-btn" type="button">
				<i class="fa-solid fa-bars"></i>
			</button>
			<div class="sidebar-logo">
				<a href="#">User Profile</a>
			</div>
		</div>
		<ul class="sidebar-nav list-unstyled">
			<!-- ----------------------------------------------------------------  -->
			<li class="sidebar-item"><a href="/quanlithongtin/indexQLTT"
				class="sidebar-link"> <i class="lni lni-user"></i> <span>Profile</span>
			</a></li>
			<li class="sidebar-item"><a href="/lichsuthanhtoan"
				class="sidebar-link"> <i class="fa-regular fa-clock"></i> <span>Lịch
						sử đặt hàng</span>
			</a></li>
			<li class="sidebar-item"><a href="/diachi/diaChi"
				class="sidebar-link"> <i class="fa-solid fa-location-dot"></i><span>Địa
						chỉ nhận hàng</span>
			</a></li>
			<li class="sidebar-item"><a href="#"
				class="sidebar-link has-dropdown collapsed"
				data-bs-toggle="collapse" data-bs-target="#auth"
				aria-expanded="false" aria-controls="auth"> <i
					class="fa-solid fa-gear"></i> <span>Cài đặt</span>
			</a>
				<ul id="auth" class="sidebar-dropdown list-unstyled "
					data-bs-parent="#sidebar">
					<li class="sidebar-item"><a href="/userproduct"
						class="sidebar-link">Mua hàng<i
							class="fa-solid fa-bag-shopping ms-3"></i>
					</a></li>
					<li class="sidebar-item"><a href="/account/dangxuat"
						class="sidebar-link">Đăng xuất<i
							class="fa-solid fa-right-from-bracket ms-3"></i>
					</a></li>
				</ul></li>
			<li class="sidebar-item"><a href="#" class="sidebar-link"
				id="toggle-mode"> <i class="lni lni-sun"></i> <span>Sáng</span>
			</a></li>
			<!-- ----------------------------------------------------------------  -->
		</ul>
	</aside>

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