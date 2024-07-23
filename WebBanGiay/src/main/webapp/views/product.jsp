<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
</html>
<!doctype html>
<html lang="en">

<head>
    <title>Title</title>
    <!-- Required meta tags -->
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />

    <!-- Bootstrap CSS v5.2.1 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous" />
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
    <link rel="stylesheet" href="/assets/css/index.css">
    <link rel="stylesheet" href="/assets/css/style.css">
    <link rel="stylesheet" class="js-color-style" href="/assets/css/colors/color-1.css">
    <script src="https://kit.fontawesome.com/c5fd529f32.js" crossorigin="anonymous"></script>
</head>

<body>
    <main>
        <nav class="navbar navbar-expand-lg bg-light">
            <div class="container-fluid">
                <!-- Item 1 -->
                <a class="navbar-brand text-success fw-bold" href="#!assets/views/home">
                    <img src="/assets/img/icon/Logodao.png" class="w" alt="">
                </a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                    data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                    aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <!-- Item 2 -->
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item">
                            <a class="nav-link active p-3" aria-current="page"
                                href="#!assets/views/trang_thuong/aboutus">Trang chủ</a>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle p-3" href="product.html" role="button"
                                data-bs-toggle="dropdown" aria-expanded="false">
                                Mua sắm
                            </a>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="/views/product.jsp">Danh mục sản phẩm</a>
                                </li>
                                <li>
                                    <hr class="dropdown-divider">
                                </li>
                                <li><a class="dropdown-item" href="#">Quần áo</a></li>
                                <li><a class="dropdown-item" href="#">Trẻ em</a></li>
                                <li><a class="dropdown-item" href="#">Giày nam</a></li>
                                <li><a class="dropdown-item" href="#">Giày nữ</a></li>
                            </ul>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active p-3 " aria-current="page"
                                href="#!assets/views/trang_thuong/contact">Cửa hàng</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active p-3" aria-current="page"
                                href="#!assets/views/trang_thuong/feedback">FLASH⚡SALE</a>
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
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle mt-1" href="#" role="button" data-bs-toggle="dropdown"
                                aria-expanded="false">
                                <i class="fa-regular fa-sun"></i>
                            </a>
                            <ul class="dropdown-menu">
                                <!-- Nếu username khác null thì cho xem trang profile -->
                                <li ng-if="username!=null"><a ng-click="profile()" class="dropdown-item"
                                        href="#!assets/views/accounts/profile">Profile</a></li>
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
                                <li ng-if="username!=null"><a ng-click="dangXuat()" class="dropdown-item" href="#">Đăng
                                        xuất</a></li>
                            </ul>
                        </li>
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
        <div class="container col-12 ">
            <div class="row">
                <div class="col-3">
                    <div class="mt-4">
                        <p class="mt-3 fw-bold ">DANH MỤC SẢN PHẨM</p>
                        <div>
                            <a href="#" class="text-decoration-none text-black-50">
                                FLASH⚡SALE
                            </a>
                        </div>
                        <div class="mt-1">
                            <a href="#" class="text-decoration-none text-black-50">
                                Nike
                            </a>
                        </div>
                        <div class="mt-1">
                            <a href="#" class="text-decoration-none text-black-50">
                                Giày Nam
                            </a>
                        </div>
                        <div class="mt-1">
                            <a href="#" class="text-decoration-none text-black-50">
                                Giày Nữ
                            </a>
                        </div>
                        <div class="mt-1">
                            <a href="#" class="text-decoration-none text-black-50">
                                MLB
                            </a>
                        </div>
                        <div class="mt-1">
                            <a href="#" class="text-decoration-none text-black-50">
                                Balenciaga
                            </a>
                        </div>
                    </div>
                </div>
                <div class="col-md-9 mt-3">
                    <div class="row">
                        <div class="mb-4">
                            <div class="row">
                                <div class="col-auto">
                                    <span class="fw-bold">Loại sản phẩm:</span>
                                </div>
                                <div class="col-auto mb-3">
                                    <input type="text" class="form-control h-75 w-100" >
                                </div>          
                                <div class="col-auto">
                                    <span class="fw-bold">Hãng:</span>
                                </div>
                                <div class="col-auto mb-3">
                                    <input type="text" class="form-control h-75 w-100">
                                </div>
                                <form role="search" class="col-auto mb-3">
                                <button class="btn btn-light" type="submit">
                                    <i class="fa-solid fa-filter"></i>
                                </button>
                            </form>
                            </div>
  
                        </div>
                        <div class="col-4 mb-3">
                            <div class="card">
                                <a href="detaiProduct.html" class="text-decoration-none text-black">
                                    <img src="/assets/img/images/giay.jpg"
                                    class="img-top-cart object-fit-cover d-inline-block w-100 img-fluid m-0 px-0"
                                    alt="...">
                                    <div class="card-img-overlay d-flex align-items-center">
                                        <div
                                            class="badge text-white position-absolute start-0 top-0 mt-4 fs-6 rounded-0 ">
                                            Sale 20%</div>
                                        <div
                                            class="hot text-white position-absolute top-0 end-0 offset-9 bg-danger rounded-1 text-center">
                                            HOT <img src="/assets/img/icon/flame.png" class="img-fluid w-25 mb-1" alt="">
                                        </div>
                                    </div>
                                    <div class="card-body text-center">
                                        <h5 class="card-title mb-2">Product name</h5>
                                        <p class="card-text ct mb-2">Product description</p>
                                        <span class="price ct text-decoration-line-through">Price: 100.000VND</span>
                                        <span class="price ctn">100.000VND</span>
                                    </div>
                                </a>
                            </div>
                        </div>
                        <div class="col-4 mb-3">
                            <div class="card">
                                <a href="detaiProduct.html" class="text-decoration-none text-black">
                                    <img src="/assets/img/images/2.png"
                                    class="img-top-cart object-fit-cover d-inline-block w-100 img-fluid m-0 px-0"
                                    alt="...">
                                    <div class="card-img-overlay d-flex align-items-center">
                                        <div
                                            class="badge text-white position-absolute start-0 top-0 mt-4 fs-6 rounded-0 ">
                                            Sale 20%</div>
                                        <div
                                            class="hot text-white position-absolute top-0 end-0 offset-9 bg-danger rounded-1 text-center">
                                            HOT <img src="/assets/img/icon/flame.png" class="img-fluid w-25 mb-1" alt="">
                                        </div>
                                    </div>
                                    <div class="card-body text-center ">
                                        <h5 class="card-title mb-2">Product name</h5>
                                        <p class="card-text ct mb-2">Product description</p>
                                        <span class="price ct text-decoration-line-through">Price: 100.000VND</span>
                                        <span class="price ctn">100.000VND</span>
                                    </div>
                                </a>
                            </div>
                        </div>
                        <div class="col-4 mb-3">
                            <div class="card">
                                <a href="detaiProduct.html" class="text-decoration-none text-black">
                                    <img src="/assets/img/images/3.jpg"
                                    class="img-top-cart object-fit-cover d-inline-block w-100 img-fluid m-0 px-0"
                                    alt="...">
                                    <div class="card-img-overlay d-flex align-items-center">
                                        <div
                                            class="badge text-white position-absolute start-0 top-0 mt-4 fs-6 rounded-0 ">
                                            Sale 20%</div>
                                        <div
                                            class="hot text-white position-absolute top-0 end-0 offset-9 bg-danger rounded-1 text-center">
                                            HOT <img src="/assets/img/icon/flame.png" class="img-fluid w-25 mb-1" alt="">
                                        </div>
                                    </div>
                                    <div class="card-body text-center ">
                                        <h5 class="card-title mb-2">Product name</h5>
                                        <p class="card-text ct mb-2">Product description</p>
                                        <span class="price ct text-decoration-line-through">Price: 100.000VND</span>
                                        <span class="price ctn">100.000VND</span>
                                    </div>
                                </a>
                            </div>
                        </div>
                        <div class="col-4 mb-3">
                            <div class="card">
                                <a href="detaiProduct.html" class="text-decoration-none text-black">
                                    <img src="/assets/img/images/4.jpg"
                                    class="img-top-cart object-fit-cover d-inline-block w-100 img-fluid m-0 px-0"
                                    alt="...">
                                    <div class="card-img-overlay d-flex align-items-center">
                                        <div
                                            class="badge text-white position-absolute start-0 top-0 mt-4 fs-6 rounded-0 ">
                                            Sale 20%</div>
                                        <div
                                            class="hot text-white position-absolute top-0 end-0 offset-9 bg-danger rounded-1 text-center">
                                            HOT <img src="/assets/img/icon/flame.png" class="img-fluid w-25 mb-1" alt="">
                                        </div>
                                    </div>
                                    <div class="card-body text-center ">
                                        <h5 class="card-title mb-2">Product name</h5>
                                        <p class="card-text ct mb-2">Product description</p>
                                        <span class="price ct text-decoration-line-through">Price: 100.000VND</span>
                                        <span class="price ctn">100.000VND</span>
                                    </div>
                                </a>
                            </div>
                        </div>
                        <div class="col-4 mb-3">
                            <div class="card">
                                <a href="detaiProduct.html" class="text-decoration-none text-black">
                                    <img src="/assets/img/images/5.jpg"
                                    class="img-top-cart object-fit-cover d-inline-block w-100 img-fluid m-0 px-0"
                                    alt="...">
                                    <div class="card-img-overlay d-flex align-items-center">
                                        <div
                                            class="badge text-white position-absolute start-0 top-0 mt-4 fs-6 rounded-0 ">
                                            Sale 20%</div>
                                        <div
                                            class="hot text-white position-absolute top-0 end-0 offset-9 bg-danger rounded-1 text-center">
                                            HOT <img src="/assets/img/icon/flame.png" class="img-fluid w-25 mb-1" alt="">
                                        </div>
                                    </div>
                                    <div class="card-body text-center ">
                                        <h5 class="card-title mb-2">Product name</h5>
                                        <p class="card-text ct mb-2">Product description</p>
                                        <span class="price ct text-decoration-line-through">Price: 100.000VND</span>
                                        <span class="price ctn">100.000VND</span>
                                    </div>
                                </a>
                            </div>
                        </div>
                        <div class="col-4 mb-3">
                            <div class="card">
                                <a href="detaiProduct.html" class="text-decoration-none text-black">
                                    <img src="/assets/img/images/6.jpg"
                                    class="img-top-cart object-fit-cover d-inline-block w-100 img-fluid m-0 px-0"
                                    alt="...">
                                    <div class="card-img-overlay d-flex align-items-center">
                                        <div
                                            class="badge text-white position-absolute start-0 top-0 mt-4 fs-6 rounded-0 ">
                                            Sale 20%</div>
                                        <div
                                            class="hot text-white position-absolute top-0 end-0 offset-9 bg-danger rounded-1 text-center">
                                            HOT <img src="/assets/img/icon/flame.png" class="img-fluid w-25 mb-1" alt="">
                                        </div>
                                    </div>
                                    <div class="card-body text-center ">
                                        <h5 class="card-title mb-2">Product name</h5>
                                        <p class="card-text ct mb-2">Product description</p>
                                        <span class="price ct text-decoration-line-through">Price: 100.000VND</span>
                                        <span class="price ctn">100.000VND</span>
                                    </div>
                                </a>
                            </div>
                        </div>
                        
                    </div>
                    <div class="offset-4 mb-3">
                        <nav aria-label="Page navigation example">
                            <ul class="pagination">
                              <li class="page-item">
                                <a class="page-link" href="#" aria-label="Previous">
                                  <span aria-hidden="true">&laquo;</span>
                                </a>
                              </li>
                              <li class="page-item"><a class="page-link" href="#">1</a></li>
                              <li class="page-item"><a class="page-link" href="#">2</a></li>
                              <li class="page-item"><a class="page-link" href="#">3</a></li>
                              <li class="page-item">
                                <a class="page-link" href="#" aria-label="Next">
                                  <span aria-hidden="true">&raquo;</span>
                                </a>
                              </li>
                            </ul>
                          </nav>
                    </div>
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
                                    <li><a href="https://www.facebook.com/"><i class="fab fa-facebook social-icon"></i>
                                            facebook</a></li>
                                    <li><a href="https://twitter.com/"><i class="fab fa-twitter social-icon"></i>
                                            twitter</a></li>
                                    <li><a href="https://www.instagram.com/?hl=en"><i
                                                class="fab fa-instagram social-icon"></i> instagram</a></li>
                                    <li><a href="https://www.youtube.com/"><i class="fab fa-youtube social-icon"></i>
                                            youtube</a></li>
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
                    <p class="m-0 py-4 text-center">copyright &copy;2024 <a href="home.html">HK2T TEAM -
                            SD18310</a></p>
                </div>
            </div>
        </div>
    </footer>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
        integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
        crossorigin="anonymous"></script>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js"
        integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+"
        crossorigin="anonymous"></script>
</body>

</html>