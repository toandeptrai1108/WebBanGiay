<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!doctype html>
<html lang="en">
<head>
    <title>Đăng ký tài khoản</title>
    <!-- Required meta tags -->
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <!-- Bootstrap CSS v5.2.1 -->
    <link
        href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
        rel="stylesheet"
        integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
        crossorigin="anonymous" />
    <!-- Font awesome -->
    <script src="https://kit.fontawesome.com/c5fd529f32.js"
        crossorigin="anonymous"></script>
    <!-- SweetAlert2 CSS -->
    <link
        href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css"
        rel="stylesheet">

    <!-- SweetAlert2 JS -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
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

    <style>
        /* CSS to style the notification box */
        .notification {
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            padding: 20px;
            border-radius: 10px;
            display: none; /* Initially hidden */
            align-items: center;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            text-align: center;
            background-color: white;
            max-width: 400px;
            width: 80%;
        }

        .notification.success {
            border: 1px solid #d4edda;
        }

        .notification.error {
            border: 1px solid #f8d7da;
        }

        .notification-icon {
            font-size: 50px;
            margin-bottom: 10px;
        }

        .notification-title {
            font-size: 20px;
            font-weight: bold;
            margin-bottom: 10px;
        }

        .notification-message {
            font-size: 16px;
        }

        .success-icon {
            color: #28a745;
        }

        .error-icon {
            color: #dc3545;
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
                                    href="/account/dangnhap">Đăng nhập</a></li>
                                <li ng-if="username==null"><a class="dropdown-item"
                                    href="/account/dangky">Đăng ký</a></li>
                                <!-- Nếu đã đăng nhập thì cho đổi mật khẩu -->
                                <li ng-if="username!=null"><a class="dropdown-item"
                                    href="/account/doimatkhau">Đổi mật khẩu</a></li>
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
        <main>
            <!-- Your navbar code -->
            <div class="container pt-5 pb-5" id="screen">
                <div class="row">
                    <div class="col-lg-6 my-auto">
                        <div id="login">
                            <form name="frmdk" action="/account/dangky" method="post">
                                <!-- Form Start -->
                                <h4>
                                    Chào mừng đến với <span class="text-success">HK2T</span>
                                </h4>
                                <p class="text-muted">Vui lòng đăng ký để sử dụng</p>
                                <!-- Họ và Tên -->
                                <div class="form-floating mb-3">
                                    <input required name="fullname" type="text"
                                        class="form-control" placeholder="Nhập họ và tên"> <label>Họ
                                        và Tên</label>
                                </div>
                                <!-- Giới tính -->
                                <div class="form-floating mb-3">
                                    <select required name="gender" class="form-select form-control"
                                        placeholder="Chọn giới tính">
                                        <option value="true">Nam</option>
                                        <option value="false">Nữ</option>
                                    </select> <label>Giới tính</label>
                                </div>
                                <!-- Email -->
                                <div class="form-floating mb-3">
                                    <input required name="email" type="email" class="form-control"
                                        placeholder="Enter Email"> <label>Email</label> <em
                                        class="text-danger"><%= request.getAttribute("messageEmail") != null ? request.getAttribute("messageEmail") : "" %></em>
                                </div>
                                <!-- Số điện thoại -->
                                <div class="form-floating mb-3">
                                    <input required name="phonenumber" type="text"
                                        class="form-control" placeholder="Enter Phone Number">
                                    <label>Số điện thoại</label> <em class="text-danger"><%= request.getAttribute("messagePhone") != null ? request.getAttribute("messagePhone") : "" %></em>
                                </div>
                                <!-- Username -->
                                <div class="form-floating mb-3">
                                    <input required name="username" type="text"
                                        class="form-control" placeholder="Nhập username"> <label>Tên
                                        đăng nhập</label> <em class="text-danger"><%= request.getAttribute("messageName") != null ? request.getAttribute("messageName") : "" %></em>
                                </div>
                                <!-- Password -->
                                <div class="form-floating mb-3">
                                    <input required name="password" type="password"
                                        class="form-control" placeholder="Nhập mật khẩu"> <label>Mật
                                        khẩu</label> <em class="text-danger"><%= request.getAttribute("messagePass") != null ? request.getAttribute("messagePass") : "" %></em>
                                </div>
                                <button type="submit"
                                    class="btn btn-login fs-5 fw-semibold btn-success">Đăng
                                    Ký</button>
                                <em class="text-success"><%= request.getAttribute("message1") != null ? request.getAttribute("message1") : "" %></em>
                            </form>
                            <div class="text-center text-muted mt-2 mb-0"
                                style="font-size: 14px;">
                                Hãy đăng nhập khi đã có tài khoản: <a href="/account/dangnhap"
                                    class="text-primary text-decoration-none"> Đăng Nhập tại
                                    đây </a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 login-image d-none d-lg-block my-auto">
                        <img src="/assets/img/images/login-image-shoe.png" class="w-100"
                            alt="Login Image">
                    </div>
                </div>
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
            integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQ+zqX6gSbd85u4mG4QzX+"
            crossorigin="anonymous"></script>

        <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js"
            integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+"
            crossorigin="anonymous"></script>
<script>
  $(document).ready(function () {
    const showAlert = (type, message) => {
      Swal.fire({
        icon: type,
        title: type === 'success' ? 'Đăng ký thành công' : 'Đăng ký thất bại',
        text: message,
        showConfirmButton: false,
        timer: 2500
      }).then(() => {
        if (type === 'success') {
        	window.location.href = "index";
        }
      });
    };

    <% if (request.getAttribute("success") != null) { %>
      <% if ((boolean) request.getAttribute("success")) { %>
        showAlert('success', 'Bạn đã đăng ký thành công!');
      <% } else { %>
        <% if (request.getAttribute("message") != null) { %>
          showAlert('error', '<%= request.getAttribute("message") %>');
        <% } else { %>
          showAlert('error', 'Đăng ký thất bại. Vui lòng kiểm tra lại thông tin.');
        <% } %>
      <% } %>
    <% } %>
  });
</script>

    </body>
</html>
