<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
				<li class="sidebar-item"><a href="#" class="sidebar-link">
						<i class="lni lni-user"></i> <span>Profile</span>
				</a></li>
				<li class="sidebar-item"><a href="#" class="sidebar-link">
						<i class="fa-regular fa-clock"></i> <span>Lịch sử đặt hàng</span>
				</a></li>
				<li class="sidebar-item"><a href="/diachi/diaChi" class="sidebar-link">
						<i class="fa-solid fa-location-dot"></i><span>Địa chỉ nhận hàng</span>
				</a></li>
				<li class="sidebar-item"><a href="#"
					class="sidebar-link has-dropdown collapsed"
					data-bs-toggle="collapse" data-bs-target="#auth"
					aria-expanded="false" aria-controls="auth"> <i class="fa-solid fa-gear"></i> <span>Cài đặt</span>
				</a>
					<ul id="auth" class="sidebar-dropdown list-unstyled "
						data-bs-parent="#sidebar">
						<li class="sidebar-item"><a href="#" class="sidebar-link">Login</a>
						</li>
						<li class="sidebar-item"><a href="#" class="sidebar-link">Login</a>
						</li>
						<li class="sidebar-item"><a href="#" class="sidebar-link">Register</a>
						</li>
					</ul></li>
				<li class="sidebar-item"><a href="#" class="sidebar-link"
					id="toggle-mode"> <i class="lni lni-sun"></i> <span>Sáng</span>
				</a></li>

			</ul>
		</aside>

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
								<a href="#" class="dropdown-item"> <i class="lni lni-timer"></i>
									<span>Analytics</span>
								</a> <a href="#" class="dropdown-item"> <i class="lni lni-cog"></i>
									<span>Settings</span>
								</a>
								<div class="dropdown-divider"></div>
								<a href="#" class="dropdown-item"> <i
									class="lni lni-question-circle"></i> <span>Help</span>
								</a>
							</div></li>
					</ul>
				</div>
			</nav>
			<main class="content px-3 py-4 mt-3">
				<!-- -----------------------------------------------------------------------------------  -->
				<h3 class="fw-bold fs-4 mt-5 text-center"><i class="fa-solid fa-location-dot"></i>Thêm địa chỉ nhận hàng</h3>

				<div class="col-md-9 m-auto">
					<div class="container mt-5">
						<div class="card mb-4">
							<jsp:include page="formDiaChi.jsp" />
						</div>

						<div class="card mb-4">
							<jsp:include page="tableDiaChi.jsp" />
						</div>
					</div>
				</div>
				<!-- ------------------------------------------------ -->
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