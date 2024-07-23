<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!doctype html>
<html lang="en">
<head>
<title>Đăng nhập</title>
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
<link rel="stylesheet" href="/assets/css/dangnhap.css">
<link rel="stylesheet" href="/assets/css/style.css">
<link rel="stylesheet" class="js-color-style"
	href="/assets/css/colors/color-1.css">
<!-- Thêm không biết -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>

</head>

<body>
	<!-- BẮT ĐẦU HEADER VÀ MAIN -->
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
		<!-- BẮT ĐẦU ĐĂNG NHẬP -->
		<main>
			<div class="container pt-5 pb-5" id="screen">
				<div class="row">
					<!--row Start-->
					<div class="col-lg-6 my-auto">
						<!--col-lg-6 Start-->
						<div id="login">
							<form name="loginform" action="/account/dangnhap" method="post">
								<!-- Form Start -->
								<h4>
									Chào mừng bạn đến với <span class="text-success">HK2T</span>
								</h4>
								<p class="text-muted">Vui lòng đăng nhập để sử dụng</p>
								<!-- USERNAME -->
								<div class="form-floating mb-3">
									<input required ng-model="u" name="username" type="text"
										class="form-control" placeholder="Nhập username"> <label>
										USERNAME </label> <em class="text-danger"
										ng-show="frmdn.username.$invalid">${message}</em>
								</div>
								<!-- PASSWORD -->
								<div class="form-floating mb-3">
									<input required ng-model="p" name="password" type="password"
										class="form-control" placeholder="Nhập mật khẩu"> <label>
										PASSWORD </label> <em class="text-danger"
										ng-show="frmdn.password.$invalid"> ${message1}</em>
								</div>
								<button ng-click="dangNhap()" type="submit"
									class="btn btn-login fs-5 fw-semibold btn-success ">
									Đăng nhập</button>
							</form>
							<!-- Form End -->

							<!--Sign Up-->
							<div class="text-center text-muted mt-2 mb-0"
								style="font-size: 14px;">
								Bạn chưa có tài khoản? <a href="/account/dangky"
									class="text-primary text-decoration-none"> Đăng ký tại đây
								</a>
							</div>
							<!--Sign Up End-->
														<div class="text-center text-muted mt-2 mb-0"
								style="font-size: 14px;">
								<a href="/account/quenmatkhau"
									class="text-primary text-decoration-none">Quên mật khẩu 
								</a>
							</div>
						</div>
					</div>
					<!--col-lg-6 End-->
					<div class="col-lg-6 login-image d-none d-lg-block my-auto">
						<img src="/assets/img/images/login-image-shoe.png" class="w-100"
							alt="Login Image">
					</div>
				</div>
				<!--row End-->
			</div>
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
							copyright &copy;2024 <a href="home.html">HK2T TEAM - SD18310</a>
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
        function signIn() {
            let oauth2Endpoint = 'https://accounts.google.com/o/oauth2/v2/auth';
            let form = document.createElement('form');
            form.setAttribute('method', 'GET');
            form.setAttribute('action', oauth2Endpoint);
            let params = {

                'client_id': '469624213594-2mutcv5s1s65a7ej4n3ftkov2c0u3m2h.apps.googleusercontent.com', //đăng ký google để lấy id này
                'redirect_uri': 'http://localhost:8080/account/dangnhap',
                'response_type': 'token', // Loại phản hồi mong đợi từ việc xác thực
                // https://www.googleapis.com/auth/userinfo.profile https://www.googleapis.com/auth/userinfo.email   https://www.googleapis.com/auth/youtube.readonly
                'scope': 'https://www.googleapis.com/auth/userinfo.email https://www.googleapis.com/auth/userinfo.profile',
                'include_granted_scopes': 'true',
                'state': 'pass-through-value'
            }
            for (let p in params) {
                // if (params.hasOwnProperty(p)) {
                let input = document.createElement('input');
                input.setAttribute('type', 'hidden');
                input.setAttribute('name', p);
                input.setAttribute('value', params[p]);
                form.appendChild(input);
                // }
            }
            document.body.appendChild(form)
            form.submit();

        }
    </script>

		<script>
        // Kiểm tra và điền thông tin tài khoản nếu đã lưu
        window.onload = function () {
            const savedUsername = localStorage.getItem('savedUsername');
            const savedPassword = localStorage.getItem('savedPassword');
            const rememberMeCheckbox = document.getElementById('rememberMe');
            const usernameInput = document.getElementById('username');
            const passwordInput = document.getElementById('idpassword');

            if (savedUsername && savedPassword) {
                rememberMeCheckbox.checked = true;
                usernameInput.value = savedUsername;
                passwordInput.value = savedPassword;
            }
        };

        // Hàm đăng nhập
        function login() {
            alert('s');
            const username = document.getElementById('username').value;
            const password = document.getElementById('idpassword').value;
            const rememberMeCheckbox = document.getElementById('rememberMe');

            // Kiểm tra và lưu thông tin tài khoản nếu chọn "Ghi nhớ đăng nhập"
            if (rememberMeCheckbox.checked) {
                localStorage.setItem('savedUsername', username);
                localStorage.setItem('savedPassword', password);
            } else {
                localStorage.removeItem('savedUsername');
                localStorage.removeItem('savedPassword');
            }
	
            // Điều hướng tới trang sau khi đăng nhập (ở đây là ví dụ redirect tới trang chính)
            window.location.href = "index";
        }
    </script>
</body>

</html>