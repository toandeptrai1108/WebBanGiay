<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<link rel="stylesheet" href="assets/css/index.css">
<script src="https://kit.fontawesome.com/c5fd529f32.js"
	crossorigin="anonymous"></script>
<style>
button:focus, input:focus {
	outline: none;
	box-shadow: none;
}

a, a:hover {
	text-decoration: none;
}

/*--------------------------*/
.qty-container {
	display: flex;
	align-items: center;
	justify-content: center;
}

.qty-container .input-qty {
	text-align: center;
	padding: 6px 10px;
	border: 1px solid #d4d4d4;
	max-width: 80px;
}

.qty-container .qty-btn-minus, .qty-container .qty-btn-plus {
	border: 1px solid #d4d4d4;
	padding: 10px 13px;
	font-size: 10px;
	height: 38px;
	width: 38px;
	transition: 0.3s;
}

/* .qty-container .qty-btn-plus {
	margin-left: -1px;
}

.qty-container .qty-btn-minus {
	margin-right: -1px;
} */

/*---------------------------*/
.btn-cornered, .input-cornered {
	border-radius: 4px;
}

.btn-rounded {
	border-radius: 50%;
}

.input-rounded {
	border-radius: 50px;
}
</style>
</head>

<body>
	<jsp:include page="nav_userproduct.jsp" />
	<main>
		<h2 class="text-center">Giỏ hàng</h2>
		<div class="container mt-5">
			<div class="table-responsive row">
				<table class="table table-bordered">
					<thead class="table-light text-center">
						<tr>
							<th>Sản phẩm</th>
							<th>Size</th>
							<th>Màu sắc</th>
							<th>Giá tiền</th>
							<th>Điều chỉnh Số lượng</th>
							<th>Tổng tiền</th>
							<th>Hành động</th>
						</tr>
					</thead>
					<tbody class="text-center">
						<c:if test="${dsGioHang==null}">
							<span>Giỏ hàng của bạn đã được làm mới hiện chưa có sản
								phẩn nào</span>
						</c:if>
						<c:if test="${dsGioHang!=null}">
							<c:forEach items="${dsGioHang}" var="item">
								<tr>
									<td>${ item.chiTietSanPham.sanpham.tensanpham }</td>
									<td>${ item.chiTietSanPham.size }</td>
									<td>${ item.chiTietSanPham.mausac }</td>
									<td>${ item.chiTietSanPham.giatien }</td>
									<td>

										<div class="qty-container">
											<a
												href="/cart-decrease/${ item.chiTietSanPham.machitietsanpham}"
												class="qty-btn-minus btn-light" type="button"> <i
												class="fa-solid fa-minus"></i>
											</a> <input type="text" name="qty" value="${item.soluong}"
												class="input-qty" /> <a
												href="/cart-increase/${ item.chiTietSanPham.machitietsanpham}"
												class="qty-btn-plus btn-light" type="button"> <i
												class="fa-solid fa-plus"></i>
											</a>
										</div>

									</td>
									<td>${ item.soluong * item.chiTietSanPham.giatien}</td>

									<td>
										<!-- Nút xóa --> <a
										href="/cart-remove/${item.chiTietSanPham.machitietsanpham}"
										class="btn btn-danger btn-sm">Xóa</a> <!-- Check chọn chi tiết để thanh toán -->
										<input class="w-25" type="checkbox"
										id="chk_${item.chiTietSanPham.machitietsanpham}"
										value="${item.chiTietSanPham.machitietsanpham}" />

									</td>
								</tr>
							</c:forEach>
						</c:if>

					</tbody>

				</table>
			</div>
			<div class="row">
				<div class="col-6">
					<button onclick="addToOrder()"
						class="btn btn-success mb-2 float-left" id="btn-dat-hang">
						<i class="fa-solid fa-plus"></i> Đặt hàng
					</button>
					<a href="/cart-clear" class="btn btn-danger mb-2">Xóa tất cả
						sản phẩm</a>
				</div>
			</div>

		</div>

	</main>
	<jsp:include page="footer_user.jsp" />
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
		integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
		crossorigin="anonymous"></script>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js"
		integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+"
		crossorigin="anonymous"></script>
	<script>
	
	function addToOrder() {
	    let urlCu = new URL(window.location.href);
	    window.history.pushState({}, '', '/');
	    let url = new URL(window.location.href + "orderInCart");
	    
	    const checkboxes = document.querySelectorAll('input[type="checkbox"]:checked');
	    const selectedValues = [];
	    checkboxes.forEach((checkbox) => {
	      selectedValues.push(checkbox.value);
	    });
	    console.log(selectedValues); 
	    url.searchParams.set("list", selectedValues.join(","));
	    window.location.href = url;
	}
	</script>
</body>

</html>