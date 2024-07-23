<%@page import="com.fpoly.entity.User"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!doctype html>
<html lang="en">
<head>
<title>Title</title>
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
<link rel="stylesheet" href="/assets/css/index.css">
<link rel="stylesheet" href="/assets/css/style.css">
<link rel="stylesheet" class="js-color-style"
	href="/assets/css/colors/color-1.css">
<!-- Thêm không biết -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>

<style type="text/css">
.my-dropdown-menu {
	max-height: calc(100vh - 120px);
	/* Điều chỉnh chiều cao tối đa của dropdown-menu, trừ điều chỉnh tùy chỉnh tùy chọn */
	overflow-y: auto; /* Cho phép cuộn khi nội dung quá dài */
}
</style>
</head>

<body>
	<!-- BẮT ĐẦU HEADER VÀ MAIN -->
	<main>
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
						aria-current="page" href="/index">Trang chủ</a></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle p-3" href="/views/product.jsp"
						role="button" data-bs-toggle="dropdown" aria-expanded="false">
							Mua sắm </a>
						<ul class="dropdown-menu">
							<li><a class="dropdown-item" href="/userproduct">Danh
									mục sản phẩm</a></li>
							<li>
								<hr class="dropdown-divider">
							</li>
							<c:forEach items="${listDanhMuc}" var="danhMuc">
								<li><a class="dropdown-item"
									href="/userproduct/danhmuc/${danhMuc.madanhmuc}">${danhMuc.tendanhmuc}</a></li>
							</c:forEach>

						</ul></li>
					<li class="nav-item"><a class="nav-link active p-3 "
						aria-current="page" href="/userproduct/map">Cửa
							hàng</a></li>
					<li class="nav-item"><a class="nav-link active p-3"
						aria-current="page" href="/userproduct/flashSale">FLASH⚡SALE</a></li>
				</ul>
					<ul class="navbar-nav d-flex ">
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle mt-1" href="#" role="button"
							data-bs-toggle="dropdown" aria-expanded="false"> <i
								class="fa-regular fa-sun"></i>
						</a>
							<ul class="dropdown-menu dropdown-menu-end my-dropdown-menu">
							
							
							
								<!-- Nếu username khác null thì cho xem trang profile -->
								<!-- Nếu  chưa đăng nhập thì hiển thị đăng nhập , đăng ký -->
								<%@ page session="true"%>
								<%
								// Retrieve the 'user' attribute from the session
								User user = (User) session.getAttribute("user");

								// Extract username and email if user is not null
								String username = (user != null) ? user.getUsername() : null;

								// Set request attributes for username and email
								request.setAttribute("username", username);
								%>

								<!-- JSTL core library tag for conditional statements -->
								<c:if test="${empty username}">
									<!-- Display login and registration options if username or email is empty -->
									<li><a class="dropdown-item" href="/account/dangnhap">Đăng
											nhập</a></li>
									<li><a class="dropdown-item" href="/account/dangky">Đăng
											ký</a></li>
								</c:if>

								<c:if test="${not empty username}">
									<!-- Display user options if both username and email are not empty -->
									<li><a ng-click="profile()" class="dropdown-item"
										href="/quanlithongtin/indexQLTT">Profile</a></li>
									<li><hr class="dropdown-divider"></li>
									<li><a class="dropdown-item" href="/diachi/diaChi">Địa
											chỉ giao hàng</a></li>
									<li><hr class="dropdown-divider"></li>
									<li><a class="dropdown-item" href="/account/doimatkhau">Đổi
											mật khẩu</a></li>
									<li><hr class="dropdown-divider"></li>
									<li><a ng-click="dangXuat()" onclick="logoutSuccess()"
										class="dropdown-item" href="/account/dangxuat">Đăng xuất</a></li>
								</c:if>






							</ul></li>
						<li>
							<form role="search">
								<button class="btn btn-light mt-2" type="submit">
									<i class="fa-solid fa-cart-shopping"></i>
								</button>
							</form>
						</li>
					</ul>

				</div>
			</div>
		</nav>
		<div id="carouselExampleIndicators" class="carousel slide"
			data-bs-ride="carousel">
			<div class="carousel-indicators">
				<button type="button" data-bs-target="#carouselExampleIndicators"
					data-bs-slide-to="0" class="active" aria-current="true"
					aria-label="Slide 1"></button>
				<button type="button" data-bs-target="#carouselExampleIndicators"
					data-bs-slide-to="1" aria-label="Slide 2"></button>
				<button type="button" data-bs-target="#carouselExampleIndicators"
					data-bs-slide-to="2" aria-label="Slide 3"></button>
			</div>
			<div class="carousel-inner">
				<div class="carousel-item active">
					<div class="image-wrap">
						<img src="/assets/img/images/14.jpg" class="w-100" alt="...">
					</div>
				</div>
				<div class="carousel-item">
					<div class="image-wrap">
						<img src="/assets/img/images/9.jpg" class="w-100" alt="...">
					</div>
				</div>
				<div class="carousel-item">
					<div class="image-wrap">
						<img src="/assets/img/images/10.jpg" class="w-100" alt="...">
					</div>
				</div>
			</div>
			<button class="carousel-control-prev" type="button"
				data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Previous</span>
			</button>
			<button class="carousel-control-next" type="button"
				data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
				<span class="carousel-control-next-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Next</span>
			</button>
		</div>
		<section class="container py-5">
			<div class="row">
				<div class="">
					<form class="input-group mb-3">
						<span class="offset-4 fs-4 fw-bold">TOP SẢN PHẨM BÁN CHẠY <img
							src="assets/img/icon/flame.png" class="w-img" alt=""></span>
					</form>
				</div>
			</div>
		</section>
		<section class="products container">
			<div class="row row-cols-3">
				<c:forEach var="sp" items="${topSellingProducts}">
					<div class="col-4 mb-3">
						<div class="card">
							<a href="/userproduct/chitietsanpham/${sp.masanpham}"
								class="text-decoration-none text-black"> <img
								src="/assets/img/product/${sp.anhdaidien}"
								class="img-top-cart object-fit-cover d-inline-block w-100 img-fluid m-0 px-0"
								alt="...">
								<div class="card-img-overlay d-flex align-items-center">
									<c:if test="${Math.round((sp.giamgia/sp.giagoc)*100) != 0}">
										<div
											class="badge text-white position-absolute start-0 top-0 mt-4 fs-6 rounded-0 ">
											Sale ${Math.round((sp.giamgia/sp.giagoc)*100)}%</div>
									</c:if>
									<c:if test="${sp.hot == true}">
										<div
											class="ps-2 text-white position-absolute top-0 end-0 offset-9 bg-danger rounded-1 text-center">
											HOT🔥</div>
									</c:if>
								</div>
								<div class="card-body text-center">
									<h6 class="card-title mb-2">${sp.tensanpham}</h6>
									<span class="price ct text-decoration-line-through"> <fmt:formatNumber
											value="${sp.giagoc}" type="number" groupingUsed="true"
											pattern="###,###" /> VND
									</span> <span class="price fs-6 ctn ms-2"> <fmt:formatNumber
											value="${sp.gia}" type="number" groupingUsed="true"
											pattern="###,###" /> VND
									</span>
								</div>
							</a>
						</div>
					</div>
				</c:forEach>
			</div>
		</section>
	</main>
	<!-- BẮT ĐẦU FOOTER -->
	<hr class="featurette-divider">
	<!-- footer start -->
	<footer>
		<div class="footer">
			<div class="footer-top">
				<div class="container">
					<div class="row">
						<div class="col-sm-6 col-lg-3">
							<div class="footer-item">
								<h3 class="footer-logo text-success">HT2K</h3>
								<ul>
									<li><a href="#">Về chúng tôi</a></li>
									<li><a href="#">Đóng góp ý kiến</a></li>
									<li><a href="#">Hỏi đáp</a></li>
									<li><a href="#">Liên hệ</a></li>
									<li><a href="#">Blog</a></li>
								</ul>
							</div>
						</div>
						<div class="col-sm-6 col-lg-3">
							<div class="footer-item">
								<h3>HK2T</h3>
								<ul>
									<li><a href="#">Tải ứng dụng</a></li>
									<li><a href="#">Các chương trình khuyến mãi</a></li>
								</ul>
							</div>
						</div>
						<div class="col-sm-6 col-lg-3">
							<div class="footer-item">
								<h3>more</h3>
								<ul>
									<li><a href="#">Chi nhánh</a></li>
								</ul>
							</div>
						</div>
						<div class="col-sm-6 col-lg-3">
							<div class="footer-item">
								<h3>Media pages</h3>
								<ul>
									<li><a href="https://www.facebook.com/"><i
											class="fab fa-facebook social-icon"></i> facebook</a></li>
									<li><a href="https://twitter.com/"><i
											class="fab fa-twitter social-icon"></i> twitter</a></li>
									<li><a href="https://www.instagram.com/?hl=en"><i
											class="fab fa-instagram social-icon"></i> instagram</a></li>
									<li><a href="https://www.youtube.com/"><i
											class="fab fa-youtube social-icon"></i> youtube</a></li>
									<!-- <li><a href="https://www.linkedin.com/"><i
                                            class="fab fa-linkedin social-icon"></i> linkedin</a></li> -->
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="footer-bottom pb-5">
				<div class="container">
					<p class="m-0 py-4 text-center">
						copyright &copy;2024 <a href="/index">HK2T TEAM - SD18310</a>
					</p>
				</div>
			</div>
		</div>
	</footer>

	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
		integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
		crossorigin="anonymous"></script>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js"
		integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+"
		crossorigin="anonymous"></script>
	<script>
		function logoutSuccess() {
			alert('Bạn đã đăng xuất thành công!');
			// Proceed with the logout
			window.location.href = '/account/dangxuat';
		}
	</script>
</body>

</html>
