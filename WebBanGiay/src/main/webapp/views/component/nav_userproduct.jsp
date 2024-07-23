<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
</html>
<!doctype html>
<html lang="en">

<head>
<title>HK2T</title>
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
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<link rel="stylesheet" href="/assets/css/index.css">
<link rel="stylesheet" href="/assets/css/style.css">
<link rel="stylesheet" class="js-color-style"
	href="/assets/css/colors/color-1.css">
<script src="https://kit.fontawesome.com/c5fd529f32.js"
	crossorigin="anonymous"></script>
</head>

<body>
	<nav class="navbar navbar-expand-lg bg-light">
		<div class="container-fluid">
			<!-- Item 1 -->
			<a class="navbar-brand text-success fw-bold"
				href="#!assets/views/home"> <img
				src="/assets/img/icon/Logodao.png" class="w" alt="">
			</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<!-- Item 2 -->
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item"><a class="nav-link active p-3"
						aria-current="page" href="#!assets/views/trang_thuong/aboutus">Trang
							chủ</a></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle p-3" href="product.html"
						role="button" data-bs-toggle="dropdown" aria-expanded="false">
							Mua sắm </a>
						<ul class="dropdown-menu">
							<li><a class="dropdown-item" href="/views/product.jsp">Danh
									mục sản phẩm</a></li>
							<li>
								<hr class="dropdown-divider">
							</li>
							<li><a class="dropdown-item" href="#">Quần áo</a></li>
							<li><a class="dropdown-item" href="#">Trẻ em</a></li>
							<li><a class="dropdown-item" href="#">Giày nam</a></li>
							<li><a class="dropdown-item" href="#">Giày nữ</a></li>
						</ul></li>
					<li class="nav-item"><a class="nav-link active p-3 "
						aria-current="page" href="/userproduct">Cửa hàng</a></li>
					<li class="nav-item"><a class="nav-link active p-3"
						aria-current="page" href="/userproduct/flashSale">FLASH⚡SALE</a></li>
				</ul>
				<ul class="navbar-nav d-flex ">
					<li>
						<form role="search">
							<button class="btn btn-light mt-md-2" type="submit">
								<i class="fa-solid fa-magnifying-glass"></i>
							</button>
						</form>
					</li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle mt-1" href="#" role="button"
						data-bs-toggle="dropdown" aria-expanded="false"> <i
							class="fa-regular fa-sun"></i>
					</a>
						<ul class="dropdown-menu">
							<!-- Nếu username khác null thì cho xem trang profile -->
							<li ng-if="username!=null"><a ng-click="profile()"
								class="dropdown-item" href="/quanlithongtin">Profile</a></li>
							<li>
								<hr class="dropdown-divider">
							</li>
							<!-- Nếu  chưa đăng nhập thì hiển thị đăng nhập , đăng ký -->
							<li ng-if="username==null"><a class="dropdown-item"
								href="#!assets/views/accounts/login">Đăng nhập</a></li>
							<li ng-if="username==null"><a class="dropdown-item"
								href="#!assets/views/accounts/register">Đăng ký</a></li>
							<!-- Nếu đã đăng nhập thì cho đổi mật khẩu -->
							<li ng-if="username!=null"><a class="dropdown-item"
								href="#!assets/views/accounts/resetpass">Đổi mật khẩu</a></li>
							<li>
								<hr class="dropdown-divider">
							</li>
							<!-- Nếu đã đăng nhập thì cho đăng xuất -->
							<li ng-if="username!=null"><a ng-click="dangXuat()"
								class="dropdown-item" href="#">Đăng xuất</a></li>
						</ul></li>
					<li>
						<!--Giỏ hàng -->
						<form role="search">
							<a href="/cart" class="btn btn-light mt-2"> <i
								class="fa-solid fa-cart-shopping"></i>
							</a>
						</form>
					</li>
				</ul>

			</div>
		</div>
	</nav>
</body>
</html>