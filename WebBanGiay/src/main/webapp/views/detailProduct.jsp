<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
</html>
<!doctype html>
<html lang="en">

<head>

<!-- Bootstrap CSS v5.2.1 -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous" />
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<link rel="stylesheet" href="assets/css/index.css">
<script src="https://kit.fontawesome.com/c5fd529f32.js"
	crossorigin="anonymous"></script>
</head>

<body>
	<main>
		<nav class="navbar navbar-expand-lg bg-light">
			<div class="container-fluid">
				<!-- Item 1 -->
				<a class="navbar-brand text-success fw-bold"
					href="#!assets/views/home"> <img
					src="assets/img/icon/Logodao.png" class="w" alt="">
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
								<li><a class="dropdown-item"
									href="#!assets/views/courses/courses">Danh mục sản phẩm</a></li>
								<li>
									<hr class="dropdown-divider">
								</li>
								<li><a class="dropdown-item" href="#">Quần áo</a></li>
								<li><a class="dropdown-item" href="#">Trẻ em</a></li>
								<li><a class="dropdown-item" href="#">Giày nam</a></li>
								<li><a class="dropdown-item" href="#">Giày nữ</a></li>
							</ul></li>
						<li class="nav-item"><a class="nav-link active p-3 "
							aria-current="page" href="#!assets/views/trang_thuong/contact">Cửa
								hàng</a></li>
						<li class="nav-item"><a class="nav-link active p-3"
							aria-current="page" href="#!assets/views/trang_thuong/feedback">FLASH⚡SALE</a>
						</li>
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
									class="dropdown-item" href="#!assets/views/accounts/profile">Profile</a></li>
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
		<div class="container col-12 mt-4">
			<div class="row">
				<div class="col-5">
					<div>
						<img src="/RoomBooking/img/can-tho-ecolodge.jpg" id="mainImage"
							alt="Image" style="max-width: 100%; height: 650px;">
						<!-- Đặt kích thước cố định cho hình ảnh hàng trên -->
					</div>

					<!-- Hàng dưới -->
					<div class="row mt-4" id="thumbnailRow">
						<div class="col-md-2">
							<img src="/WebBanGiay/img/product/product2abc.jpg"
								class="img-thumbnail thumbnail" alt="">
						</div>
						<div class="col-md-2">
							<img src="/WebBanGiay/img/product/product2abc.jpg"
								class="img-thumbnail thumbnail" alt="">
						</div>
						<div class="col-md-2">
							<img src="/WebBanGiay/img/product/product3abc.jpg"
								class="img-thumbnail thumbnail" alt="">
						</div>
						<div class="col-md-2">
							<img src="/WebBanGiay/img/product/product4abc.jpg"
								class="img-thumbnail thumbnail" alt="">
						</div>
						<div class="col-md-2">
							<img src="/WebBanGiay/img/product/product2abc.jpg"
								class="img-thumbnail thumbnail" alt="">
						</div>
					</div>
				</div>
				<div class="col-md-6 ms-5">
					<div class="row">
						<h1 class="fw-bold">Giày NIKE</h1>
						<div class="fs-6 mt-1">
							<div style="display: flex;">
								<span class="price fw-bold fs-5 ">Giá:</span> <span
									class="price text-decoration-line-through ms-2 mg mt-1">100.000
									đ</span> <span class="price text-danger fw-bold ms-2 mg mt-1">90.000
									đ</span>
							</div>
							<div class="d-flex align-items-center mb-2 mt-1">
								<label for="" class="fw-bold fs-5">Màu: </label>
								<div class="form-check ms-2 mt-1">
									<input class="form-check-input" type="radio"
										name="exampleRadios" id="exampleRadios1" value="option1"
										checked> <label class="form-check-label"
										for="exampleRadios1"> Trắng </label>
								</div>
								<div class="form-check ms-3">
									<input class="form-check-input" type="radio"
										name="exampleRadios" id="exampleRadios2" value="option2">
									<label class="form-check-label" for="exampleRadios2">
										Đen </label>
								</div>
								<div class="form-check ms-3">
									<input class="form-check-input" type="radio"
										name="exampleRadios" id="exampleRadios2" value="option2">
									<label class="form-check-label" for="exampleRadios2">
										Xanh </label>
								</div>
								<div class="form-check ms-3">
									<input class="form-check-input" type="radio"
										name="exampleRadios" id="exampleRadios2" value="option2">
									<label class="form-check-label" for="exampleRadios2">
										Đỏ </label>
								</div>
							</div>
							<div class="d-flex align-items-center mb-2 mt-1">
								<label for="" class="fw-bold fs-5">Size: </label>
								<div class="form-check ms-2 mt-1">
									<input class="form-check-input" type="radio"
										name="exampleRadios" id="exampleRadios1" value="option1"
										checked> <label class="form-check-label"
										for="exampleRadios1"> 37 </label>
								</div>
								<div class="form-check ms-3">
									<input class="form-check-input" type="radio"
										name="exampleRadios" id="exampleRadios2" value="option2">
									<label class="form-check-label" for="exampleRadios2">
										38 </label>
								</div>
								<div class="form-check ms-3">
									<input class="form-check-input" type="radio"
										name="exampleRadios" id="exampleRadios2" value="option2">
									<label class="form-check-label" for="exampleRadios2">
										39 </label>
								</div>
								<div class="form-check ms-3">
									<input class="form-check-input" type="radio"
										name="exampleRadios" id="exampleRadios2" value="option2">
									<label class="form-check-label" for="exampleRadios2">
										40 </label>
								</div>
							</div>
							<div style="display: flex;" class="mb-2">
								<span class="price fw-bold fs-5 ">Trạng thái:</span> <span
									class="price ms-2 mg text-success mt-1">Còn hàng</span>
							</div>
							<div style="display: flex;" class="mb-2">
								<span class="price fw-bold fs-5 ">Số Lượng:</span> <span
									class="price ms-2 mg mt-1">Còn 30 sản phẩm</span>
							</div>
							<a type="button" class="" data-bs-toggle="modal"
								data-bs-target="#exampleModal"> Bảng tính size </a>

							<!-- Modal -->
							<div class="modal fade" id="exampleModal" tabindex="-1"
								aria-labelledby="exampleModalLabel" aria-hidden="true">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<h5 class="modal-title" id="exampleModalLabel">Bảng Size
												Giày</h5>
											<button type="button" class="btn-close"
												data-bs-dismiss="modal" aria-label="Close"></button>
										</div>
										<div class="modal-body p-0">
											<div class="d-flex align-items-center justify-content-center">
												<img
													src="https://giaycaosmartmen.com/wp-content/uploads/2020/09/bang-size-giay-chuan.png"
													class="w-100" alt="...">
											</div>
										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-secondary"
												data-bs-dismiss="modal">Đóng</button>
										</div>
									</div>
								</div>
							</div>
						</div>
						<button type="button"
							class="btn btn-outline-primary w-25  mt-3 ms-1">Mua Ngay</button>
						<button type="button"
							class="btn btn-outline-primary w-50 mt-3 ms-1">Thêm vào
							giỏ hàng</button>
						<p class="fs-5 fw-bold mt-3">Mô tả:</p>
						<p>Giày Nike là một loại giày thể thao và thời trang được
							thiết kế, phát triển, sản xuất và phân phối bởi công ty Nike,
							Inc. Đây là một trong những thương hiệu giày thể thao và thời
							trang lớn nhất thế giới, được nhiều người ưa chuộng và sử dụng
							rộng rãi. Giày Nike có nhiều kiểu dáng và mẫu mã khác nhau, từ
							giày chạy bộ, giày bóng đá, giày bóng rổ, giày tennis, đến giày
							thời trang và giày casual. Chúng được thiết kế để đáp ứng nhu cầu
							của các vận động viên và người tiêu dùng, với các tính năng như
							độ bền, độ thoải mái, và độ ổn định.</p>
					</div>
				</div>
			</div>
		</div>
	</main>

	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
		integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
		crossorigin="anonymous"></script>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js"
		integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+"
		crossorigin="anonymous"></script>
</body>

</html>