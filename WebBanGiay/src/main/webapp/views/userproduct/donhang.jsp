<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
		<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

			</html>
			<!doctype html>
			<html lang="en">

			<head>

				<!-- Bootstrap CSS v5.2.1 -->
				<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
					integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
					crossorigin="anonymous" />
				<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
				<!-- <link rel="stylesheet" href="assets/css/index.css"> -->
				<script src="https://kit.fontawesome.com/c5fd529f32.js" crossorigin="anonymous"></script>
				<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
				<style>
					.product-image {
						width: 100px;
						height: 100px;
						object-fit: cover;
					}

					.product-info {
						display: flex;
						align-items: center;
						justify-content: space-between;
					}

					.product-price {
						font-size: 20px;
						font-weight: bold;
						color: red;
					}

					.product-details {
						margin-top: 10px;
					}

					.product-details ul {
						list-style-type: none;
						padding: 0;
					}

					.product-details li {
						margin-bottom: 5px;
					}

					.product-details strong {
						font-weight: bold;
					}

					.product-actions {
						display: flex;
						align-items: center;
						justify-content: space-between;
						margin-top: 10px;
					}

					.product-actions .btn {
						margin-right: 10px;
					}

					.shipping-info {
						margin-top: 20px;
					}

					.shipping-info .form-group {
						margin-bottom: 10px;
					}

					.shipping-info .form-select {
						width: 100%;
					}

					.shipping-info .form-control {
						width: 100%;
					}

					.checkout-info {
						margin-top: 20px;
					}

					.checkout-info .total-price {
						font-size: 20px;
						font-weight: bold;
					}

					.checkout-info .points {
						font-size: 16px;
					}

					.checkout-info .agree-checkbox {
						margin-top: 10px;
					}

					.checkout-info .btn-order {
						display: block;
						width: 100%;
						padding: 10px 20px;
						background-color: orange;
						color: white;
						border: none;
						border-radius: 5px;
						margin-top: 20px;
						cursor: pointer;
					}
				</style>
			</head>

			<body>
				<c:if test="${soLuongGiay==0}">
					<div class="d-flex align-items-center justify-content-center vh-100">
						<div class="text-center">
							<h1 class="display-1 fw-bold text-danger">Opps!</h1>
							<p class="fs-3">
								<span>Hiện tại chưa có sản phẩm trong đơn hàng.
							</p>
							<p class="lead">Nhấn nút mua sắm để thêm sản phẩm vào đơn hàng.
							</p>
							<a href="/userproduct" class="btn btn-primary">Mua Sắm</a>
						</div>
					</div>
				</c:if>
				<c:if test="${soLuongGiay!=0}">
					<div class="container">
						<div class="row">
							<div class="col-md-12">
								<div class="card p-4">
									<div class="card-body">
										<!-- Danh sách sản phẩm được chọn -->
										<c:forEach items="${dsDonHang}" var="item">
											<div class="product-info">
												<img src="/assets/img/product/${ item.chiTietSanPham.sanpham.anhdaidien}"
													alt="Ảnh ${item.chiTietSanPham.sanpham.tensanpham}"
													class="product-image">
												<div>
													<h3>${ item.chiTietSanPham.sanpham.tensanpham}</h3>
													<p>Size: ${ item.chiTietSanPham.size}</p>
													<p>Màu: ${ item.chiTietSanPham.mausac}</p>
													<span class="text-danger">
														<fmt:formatNumber
															value="${item.soluong*item.chiTietSanPham.giatien}"
															type="number" groupingUsed="true" pattern="###,###" /> đ
													</span>
												</div>
												<div class="qty-container d-flex align-items-center">

													<a href="/donhang-decrease/${item.chiTietSanPham.machitietsanpham}"
														class="btn btn-light qty-btn-minus bg-danger text-light">
														<i class="fa-solid fa-minus "></i>
													</a> <input type="text" name="qty" value="${item.soluong}"
														class="form-control input-qty text-center" /> <a
														href="/donhang-increase/${item.chiTietSanPham.machitietsanpham}"
														class="btn btn-light qty-btn-plus bg-success text-light">
														<i class="fa-solid fa-plus"></i>
													</a>
												</div>
											</div>
										</c:forEach>
									</div>
									<hr>
									<div class="product-details">
										<a href="/donhang/hienthidiachigiaohang" class="text-decoration-none text-dark">
											<div>
												<strong><span class="text-danger">*</span>Địa chỉ giao
													hàng</strong> <span class="float-end">Chọn địa chỉ khác của bạn<i
														class="fa-solid fa-chevron-right"></i>
												</span>
												<div class="d-none">
													<input type="text" id="tinhThanhPho" value="${diachimacdinh.tinh}">
													<input type="text" id="quanHuyen" value="${diachimacdinh.huyen}">
													<input type="text" id="xaPhuong" value="${diachimacdinh.xa}">
													<input type="number" id="soLuongGiay" value="${soLuongGiay}">
													<br /> <label>Gửi đến: </label> <br /> <label>Tỉnh/Thành
														phố <select id="tinh" onchange="chonTinhTP(this.value)">
															<option value="" disabled selected>-Chưa chọn-</option>
														</select>
													</label> <br /> <label>Quận/huyện <select id="huyen"
															onchange="chonQuanHuyen(this.value)">
															<option value="" disabled selected>-Chưa chọn-</option>
														</select>
													</label> <br /> <label>Phường/xã <select id="xa"
															onchange="tinhPhi(this.value)">
															<option value="" disabled selected>-Chưa chọn-</option>
														</select>
													</label>
												</div>
											</div>
											<div class="mt-3">
												<input class="d-none" id="diachigiaohang"
													value="${diachimacdinh.madiachigiaohang}">
												<p>
													<i
														class="fa-solid fa-location-dot"></i>${diachimacdinh.tennguoinhan}
													- ${diachimacdinh.sodienthoai}
												</p>
												<p>${diachimacdinh.tinh},${diachimacdinh.huyen},
													${diachimacdinh.xa}</p>
												<p>${diachimacdinh.thongtinthem}</p>
											</div>
										</a>
									</div>
									<div class="product-details">
										<div>
											<strong class="mt-3 mb-3"><span class="text-danger">*</span>Phương
												thức thanh toán </strong>
											<h2
												class="h5 px-4 py-3 accordion-header d-flex justify-content-between align-items-center">
												<div class="form-check w-100 collapsed" data-bs-toggle="collapse"
													data-bs-target="#collapseMM" aria-expanded="false">
													<input class="form-check-input" type="radio" name="payment"
														id="thanhtoankhinhanhang" value="thanhtoankhinhanhang">
													<label class="form-check-label pt-1" for="paymentMM">
														Thanh toán khi nhận hàng </label>
												</div>
												<span class="bg-success text-light ps-2 pe-2 pt-1 pb-1">
													COD </span>
											</h2>
											<h2
												class="h5 px-4 py-3 accordion-header d-flex justify-content-between align-items-center">
												<div class="form-check w-100 collapsed" data-bs-toggle="collapse"
													data-bs-target="#collapseMM" aria-expanded="false">
													<input class="form-check-input" type="radio" name="payment"
														id="thanhtoanvnpay" value="thanhtoanvnpay"> <label
														class="form-check-label pt-1" for="paymentMM"> Thanh
														toán qua ví VNPay </label>
												</div>
												<span class="ps-2 pe-2 pt-1 pb-1"> <img width="35" height="25"
														src="data:image/png;base64,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"
														alt="Logo VNPay">
												</span>
											</h2>
										</div>
									</div>
									<hr>
									<div class="product-details mt-3 mb-3">
										<div>
											<strong>Khuyến mãi</strong>
											<div class="mb-3 row">
												<div class="col-8">
													<input type="text" value="${maKhuyenMai}" class="form-control"
														id="khuyenmai" placeholder="Nhập mã khuyến mãi tại đây">
												</div>
												<div class="col-4">
													<button onclick="apDungKhuyenMai()" class="btn btn-primary row"
														id="submit-btn">Áp dụng</button>
												</div>
											</div>
											<div class="row">
												<span class="text-danger fw-lighter ms-3">${loiMaKhuyenMai}</span>
												<c:if test="${khuyenMai!=null}">
													<p class="text-success">Phần trăm khuyến mãi:
														${khuyenMai.phantramkhuyenmai}%</p>
													<p class="text-success">
														Tối đa:
														<fmt:formatNumber value="${khuyenMai.sotientoida}" type="number"
															groupingUsed="true" pattern="###,###" />
														VND
													</p>
												</c:if>
											</div>

										</div>
									</div>
									<hr>
									<div class="checkout-info">
										<h4>Thông tin thanh toán</h4>
										<p class="points">
											Giá sản phẩm: <span>
												<fmt:formatNumber value="${tienChuaApGiamGia}" type="number"
													groupingUsed="true" pattern="###,###" />₫
											</span> <input type="number" id="giaGiayValue" value="${tienChuaApGiamGia}"
												class="d-none">
										</p>
										<p class="points">
											Chi phí vận chuyển: <span id="chiPhiVanChuyen"></span>
										</p>
										<p class="points">
											Giảm giá: <span>
												<fmt:formatNumber value="${tienGiam}" type="number" groupingUsed="true"
													pattern="###,###" />₫
											</span> <input type="number" id="tienGiamValue" value="${tienGiam}"
												class="d-none">
										</p>
										<p class="fw-bolder fs-5">
											Tổng tiền: <span id="tongTienPhaiTra" class="text-danger"></span>
										</p>
										<button onclick="thanhToan()" class="btn-order">ĐẶT HÀNG</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</c:if>
				<script>
					const token = "505da969-e815-11ed-bc91-ba0234fcde32";
					const Client_ID = "2505868";
					const ShopID = "124100";
					const urlTinhThanh = "https://dev-online-gateway.ghn.vn/shiip/public-api/master-data/province";
					const urlQuanHuyen = "https://dev-online-gateway.ghn.vn/shiip/public-api/master-data/district";
					const urlPhuongXa = "https://dev-online-gateway.ghn.vn/shiip/public-api/master-data/ward?district_id";
					const urlPhiVanChuyen = "https://dev-online-gateway.ghn.vn/shiip/public-api/v2/shipping-order/fee";
					const canNangMoiDoiGiay = 800; // Mỗi đôi giày mặc định nặng 800gram
					const dai = 38;// Kích cỡ mặc định của hộp giày:
					const rong = 25;
					const cao = 16;
					let tinhValueString = $("#tinhThanhPho").val();
					console.log(tinhValueString);
					let tinhID;
					let huyenID;
					let xaID;
					$(document).ready(() => {
						// Tỉnh
						$.ajax({
							url: urlTinhThanh,
							type: "post",
							headers: {
								token: token,
							},
							dataType: "json",
							success: function (data) {
								data.data.forEach((tinh) => {
									$("#tinh").append(
										`<option value="${tinh.ProvinceID}">${tinh.ProvinceName}</option>`
									);
									if (tinh.ProvinceName === $("#tinhThanhPho").val()) {
										$("#tinh").val(tinh.ProvinceID);
										tinhID = tinh.ProvinceID;
										console.log(tinhID);
										chonTinhTP(tinhID);
									}
								});
							},
							error: function () {
								alert("Không thể tải dữ liệu tỉnh thành");
							},
						});
						$("#tinh").on("change", function () {
							chonTinhTP($("#tinh").val());
						});

					});

					function chonTinhTP(maTinh) {
						$.ajax({
							url: urlQuanHuyen,
							type: "post",
							headers: {
								"Content-Type": "application/json",
								token: token,
							},
							data: JSON.stringify({ province_id: maTinh }),
							success: function (data) {
								data.data.forEach((huyen) => {
									$("#huyen").append(
										`<option value="${huyen.DistrictID}">${huyen.DistrictName}</option>`
									);
									if (huyen.DistrictName === $("#quanHuyen").val()) {
										$("#huyen").val(huyen.DistrictID);
										huyenID = huyen.DistrictID;
										console.log(huyenID);
										chonQuanHuyen(huyenID);
									}
								});
							},
							error: function () {
								alert("Không thể tải dữ liệu quận huyện");
							},
						});
					}

					function chonQuanHuyen(maHuyen) {
						$.ajax({
							url: urlPhuongXa,
							type: "post",
							headers: {
								"Content-Type": "application/json",
								token: token,
							},
							data: JSON.stringify({ district_id: maHuyen }),
							success: function (data) {
								data.data.forEach((xa) => {
									$("#xa").append(
										`<option value="${xa.WardCode}">${xa.WardName}</option>`
									);
									if (xa.WardName === $("#xaPhuong").val()) {
										$("#xa").val(xa.WardCode);
										xaID = xa.WardCode;
										tinhPhi();
									}
								});
							},
							error: function () {
								alert("Không thể tải dữ liệu phường xã");
							},
						});
					}

					function tinhPhi() {
						let soLuong = $("#soLuongGiay").val();//input
						let giaGiayValue = $("#giaGiayValue").val();//input
						let tienGiamValue = $("#tienGiamValue").val();//input
						$.ajax({
							url: urlPhiVanChuyen,
							type: "post",
							headers: {
								"Content-Type": "application/json",
								token: token,
								shop_id: ShopID,
							},
							data: JSON.stringify({
								service_type_id: 2,
								from_district_id: 1572,
								to_district_id: huyenID,
								to_ward_code: xaID,
								height: cao,
								length: dai,
								weight: canNangMoiDoiGiay * soLuong,
								width: rong
							}),
							success: function (data) {
								chiPhiVanChuyen = parseFloat(data.data.total); console.log(chiPhiVanChuyen);
								let formattedChiPhiVanChuyen = chiPhiVanChuyen.toLocaleString('vi-VN', {
									style: 'currency',
									currency: 'VND',
									minimumFractionDigits: 0
								});
								$("#chiPhiVanChuyen").html(formattedChiPhiVanChuyen);
								let tongTienPhaiTra = parseFloat(data.data.total) + parseFloat(giaGiayValue) - parseFloat(tienGiamValue);
								let formattedTongTienPhaiTra = tongTienPhaiTra.toLocaleString('vi-VN', {
									style: 'currency',
									currency: 'VND',
									minimumFractionDigits: 0
								});
								$("#tongTienPhaiTra").html(formattedTongTienPhaiTra);
							},
							error: function () {
								tinhPhi();
							},
						});
					}

					let phuongthucthanhtoanstring = null;
					let madiachigiaohang = null;
					madiachigiaohang = diachigiaohang.value;

					let chiPhiVanChuyen = 0;

					const paymentRadios = document.getElementsByName('payment');
					paymentRadios.forEach(radio => {
						radio.addEventListener('change', () => {
							phuongthucthanhtoanstring = radio.value;
						});
					});

					function thanhToan() {
						let urlCu = new URL(window.location.href);
						window.history.pushState({}, '', '/');
						let url = new URL(window.location.href + "thanhtoan");
						url.searchParams.set("madiachigiaohang", madiachigiaohang);
						url.searchParams.set("chiPhiVanChuyen", chiPhiVanChuyen);
						url.searchParams.set("phuongthucthanhtoanstring", phuongthucthanhtoanstring);
						window.location.href = url;
					}
					function apDungKhuyenMai() {
						const chonTheKhuyenMai = document.getElementById('khuyenmai');
						const khuyenmai = chonTheKhuyenMai.value;
						let urlCu = new URL(window.location.href);
						window.history.pushState({}, '', '/');
						let url = new URL(window.location.href + "apgiamgia");
						url.searchParams.set("khuyenmai", khuyenmai);
						window.location.href = url;
					}
				</script>
				<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
					integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
					crossorigin="anonymous"></script>

				<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js"
					integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+"
					crossorigin="anonymous"></script>
			</body>

			</html>