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
<body class="dark">

	<div class="wrapper">
		<jsp:include page="aside_user.jsp" />
		<div class="main wrapper">
			<nav class="navbar navbar-expand px-4 py-3">
				<div class="navbar-collapse collapse">
					<ul class="navbar-nav ms-auto">
						<li class="nav-item dropdown"><a href="#"
							class="nav-icon pe-md-0" data-bs-toggle="dropdown">
								<div class="d-flex gap-3 align-items-center">
									<h3 class="mt-2">HK2T Team</h3>
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
				<h3 class="fw-bold fs-4 mt-5">Lịch sử đặt hàng và thanh toán</h3>
				<div class="row"></div>
				<div class="col-12 ">
					<table class="table table-striped mt-3">
						<thead>
							<tr class="highlight">
								<th scope="col">STT</th>
								<th scope="col">Ngày đặt hàng</th>
								<th scope="col">Địa chỉ giao hàng</th>
								<th scope="col">Tổng số sản phẩm</th>
								<th scope="col">Tổng tiền</th>
								<th scope="col">Trạng thái đơn hàng</th>
								<th scope="col">Hành động</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${list}" var="item">
								<tr>
									<th scope="row" class="th-scope">
										<%-- ${item.index + 1} --%>
									</th>
									<td><fmt:formatDate value="${item.ngaydathang}"
											pattern="d MMMM yyyy" /></td>
									<td>${item.diachigiaohang.tinh}, ${item.diachigiaohang.huyen}, ${item.diachigiaohang.xa}</td>
									<td>${item.tongsosanpham}</td>
									<td><fmt:formatNumber value="${item.tongtien}"
											type="number" groupingUsed="true" pattern="###,###" /> VND</td>
									<td>
										<!--------------------------------------------> <c:if
											test="${item.trangthaidonhang == 0 && item.trangthaivanchuyen ==0}">
											<a href="#" class="btn btn-warning">Đang chờ xác nhận <i
												class="fa-regular fa-hourglass"></i></a>
										</c:if> <c:if
											test="${ item.trangthaidonhang == 3 && item.trangthaivanchuyen ==0}">
											<a href="#" class="btn btn-warning">Đang chờ xác nhận và
												đã thanh toán <i class="fa-regular fa-hourglass"></i>
											</a>
										</c:if> <!--------------------------------------------> <c:if
											test="${item.trangthaidonhang == 0 && item.trangthaivanchuyen ==1}">
											<a href="#" class="btn btn-warning">Đang đóng gói <i
												class="fa-solid fa-box"></i></a>
										</c:if> <c:if
											test="${item.trangthaidonhang == 3 && item.trangthaivanchuyen ==1}">
											<a href="#" class="btn btn-warning">Đang đóng gói và đã
												thanh toán<i class="fa-solid fa-box"></i>
											</a>
										</c:if> <!--------------------------------------------> <c:if
											test="${item.trangthaidonhang == 0 && item.trangthaivanchuyen ==2}">
											<a href="#" class="btn btn-warning">Đang gửi hàng <i
												class="fa-solid fa-truck-fast"></i></a>
										</c:if> <c:if
											test="${item.trangthaidonhang == 3 && item.trangthaivanchuyen ==2}">
											<a href="#" class="btn btn-warning">Đang gửi hàng và đã
												thanh toán<i class="fa-solid fa-truck-fast"></i>
											</a>
										</c:if> <!--------------------------------------------> <c:if
											test="${item.trangthaidonhang == 0 && item.trangthaivanchuyen ==3}">
											<a href="#" class="btn btn-warning">Đang vận chuyển <i
												class="fa-solid fa-truck-fast"></i></a>
										</c:if> <c:if
											test="${item.trangthaidonhang == 3 && item.trangthaivanchuyen ==3}">
											<a href="#" class="btn btn-warning">Đang vận chuyển và đã
												thanh toán<i class="fa-solid fa-truck-fast"></i>
											</a>
										</c:if> <!--------------------------------------------> <c:if
											test="${item.trangthaidonhang == 0 && item.trangthaivanchuyen ==4}">
											<a href="#" class="btn btn-warning">Đang giao hàng <i
												class="fa-solid fa-truck-fast"></i></a>
										</c:if> <c:if
											test="${item.trangthaidonhang == 3 && item.trangthaivanchuyen ==4}">
											<a href="#" class="btn btn-warning">Đang giao hàng và đã
												thanh toán<i class="fa-solid fa-truck-fast"></i>
											</a>
										</c:if> <!--------------------------------------------> <c:if
											test="${item.trangthaidonhang == 0 && item.trangthaivanchuyen ==5}">
											<a href="#" class="btn btn-warning">Bạn đã nhận hàng?</a>
										</c:if> <c:if
											test="${item.trangthaidonhang == 3 && item.trangthaivanchuyen ==5}">
											<a href="#" class="btn btn-warning">Bạn đã nhận hàng?</a>
										</c:if> <!--------------------------------------------> <c:if
											test="${item.trangthaidonhang == 3 && item.trangthaivanchuyen ==6}">
											<a href="#" class="btn btn-success">Đã nhận hàng và đã
												thanh toán</a>
										</c:if> <!--------------------------------------------> <c:if
											test="${item.trangthaidonhang == 2}">
											<a href="#" class="btn btn-secondary">Đã hủy <i
												class="fa-solid fa-pen"></i></a>
										</c:if> <!-------------------------------------------->
									</td>
									<td><c:if
											test="${item.trangthaidonhang == 0 && item.trangthaivanchuyen==0}">
											<a href="/lichsuthanhtoan/huydon/${item.madonhang}"
												class="btn btn-danger">Hủy đơn <i
												class="fa-solid fa-xmark"></i></a>
										</c:if> <c:if test="${item.trangthaivanchuyen == 5}">
											<a href="/lichsuthanhtoan/xacnhandonhang/${item.madonhang}"
												class="btn btn-success">Đã nhận hàng <i
												class="fa-solid fa-check"></i></a>
										</c:if> <c:if
											test="${item.trangthaivanchuyen == 6 && item.trangthaidanhgia==false}">
											<a href="/lichsuthanhtoan/danhgia/${item.madonhang}"
												class="btn btn-primary">Đánh giá <i
												class="fa-solid fa-pen"></i></a>
										</c:if></td>
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

</body>



</html>