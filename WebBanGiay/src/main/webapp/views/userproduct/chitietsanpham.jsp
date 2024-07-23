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
				<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
				<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
				<link rel="stylesheet" href="assets/css/index.css">
				<script src="https://kit.fontawesome.com/c5fd529f32.js" crossorigin="anonymous"></script>
				<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
				<link rel="stylesheet" href="/assets/css/index.css">
				<link rel="stylesheet" href="/assets/css/style.css">
				<link rel="stylesheet" class="js-color-style" href="/assets/css/colors/color-1.css">
				<style>
					.ten-sanpham {
						display: -webkit-box;
						-webkit-line-clamp: 1;
						-webkit-box-orient: vertical;
						overflow: hidden
					}

					#thumbnailRow .thumbnail {
						width: 100px;
						/* Đặt kích thước chiều rộng mong muốn */
						height: 50px;
						/* Đặt kích thước chiều cao mong muốn */
						overflow: hidden;
						/* Đảm bảo ảnh không vượt quá kích thước được chỉ định */
						box-sizing: border-box;
					}

					#thumbnailRow .thumbnail img {
						width: 100%;
						/* Đảm bảo hình ảnh bên trong thumbnail sẽ đầy đủ kích thước */
						height: auto;
					}

					.img-user {
						width: 3rem;
						height: 3rem;
					}

					.img-chitiet-anhdanhgia {
						width: 30rem;
					}

					.img-thumbnail:hover {
						transform: scale(1.1);
						/* Tăng kích thước hình ảnh lên 10% khi hover */
						transition: all 0.3s ease;
						/* Hiệu ứng chuyển đổi khi hover */
						box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
						/* Hiệu ứng bóng khi hover */
					}

					/* Size */
					.list-tab-size {
						width: 100%;
					}

					/* Đây là css ban đầu của nó chỉ có màu trắng */
					.list-tab-size li {
						display: inline-block;
						border-radius: 16px;
						background-color: #d9d9d9;
						padding: 12px 20px;
						font-weight: 500;
						cursor: pointer;
					}

					/* Đây là css ủa nó khi được click - active */
					.list-tab-size li:hover {
						background-color: #000;
						color: #fff;
					}
					.list-tab-size li.active {
						background-color: #000;
						color: #fff;
					}

					.list-tab-size li:hover {
						background-color: #000;
						color: #fff;
					}

					/* Màu */
					.list-tab-mau {
						width: 100%;
					}

					/* Đây là css ban đầu của nó chỉ có màu trắng */
					.list-tab-mau li {
						display: inline-block;
						border-radius: 16px;
						background-color: #d9d9d9;
						padding: 12px 10px;
						font-weight: 500;
						cursor: pointer;
					}

					/* Đây là css ủa nó khi được click - active */
					.list-tab-mau li:hover {
						background-color: #000;
						color: #fff;
					}
					.list-tab-mau li.active {
						background-color: #000;
						color: #fff;
					}

					/* sao đánh giá */
					.ratings i {
						transition: color 0.3s;
						/* thêm hiệu ứng chuyển màu */
					}

					.ratings i.rating-color {
						color: #ffd700;
						/* màu vàng cho sao được chọn */
						animation: pulse 0.5s;
						/* thêm hiệu ứng nháy */
					}
				</style>
			</head>

			<body>
				<main>
					<jsp:include page="nav_userproduct.jsp" />
					<div class="container col-12 mt-4">
						<div class="row">
							<div class="col-md-5">
								<!-- Ảnh đại diện hiển thị-->
								<div>
									<img src="/assets/img/product/${sanpham.anhdaidien}" id="mainImage" alt="Image"
										style="max-width: 100%; height: 50vh;">
								</div>

								<!-- Render danh sách ảnh sản phẩm -->
								<div class="row mt-4" id="thumbnailRow">
									<c:forEach var="anh" items="${anhSanPham}">
										<div class="col-md-2">
											<img src="/assets/img/product/${anh.nguonanh}"
												class="img-thumbnail thumbnail mt-3" alt="${anh.nguonanh}">
										</div>
									</c:forEach>
								</div>
							</div>
							<div class="col-md-6 ms-5">
								<div class="row m-auto">
									<h1 class="fw-bold">${sanpham.tensanpham}</h1>
									<div class="fs-6 mt-1">
										<div style="display: flex;">
											<c:if test="${giaThapNhat>0 && giaCaoNhat>0}">
												<span class="price fw-bold fs-5 ctn me-3">Giá: </span>
												<span class="price fw-bold fs-5 ctn text-danger">
													<fmt:formatNumber value="${giaCaoNhat}" type="number"
														groupingUsed="true" pattern="###,###" /> VND
												</span>
												<span class="ms-1 me-1  fw-bold fs-6"> đến </span>
												<span class="price fw-bold fs-5 ctn text-danger">
													<fmt:formatNumber value="${giaThapNhat}" type="number"
														groupingUsed="true" pattern="###,###" /> VND
												</span>
											</c:if>
											<c:if test="${giaThapNhat<=0 || giaCaoNhat <=0}">
												<span class="price fw-bold fs-5 me-3 mt-1">Giá: </span>
												<span class="price fw-bold fs-4 text-danger">
													<fmt:formatNumber value="${giaChiTietSanPham}" type="number"
														groupingUsed="true" pattern="###,###" /> VND
												</span>
											</c:if>
										</div>
										<div class=" row mb-2 mt-2">
											<div class="col-12 mb-3 ">
												<span class="fs-5 fw-bold">Chọn màu: </span>
												<ul class="list-tab-mau p-0">
													<c:forEach var="mau" items="${mausac}">
														<c:if test="${mauHienTaiDuocChon == mau}">
															<li onclick="chonMau('${mau}')" class="text-center active">
																${mau}</li>
														</c:if>
														<c:if test="${mauHienTaiDuocChon != mau}">
															<li onclick="chonMau('${mau}')" class="text-center">${mau}
															</li>
														</c:if>

													</c:forEach>
												</ul>
											</div>
											<div class="col-12">
												<span class="fs-5 fw-bold">Chọn size: </span>
												<ul class="list-tab-size float-end p-0">
													<c:forEach var="siz" items="${size}">
														<c:if test="${sizeHienTaiDuocChon == siz}">
															<li onclick="chonSize('${siz}')" class="text-center active">
																${siz}</li>
														</c:if>
														<c:if test="${sizeHienTaiDuocChon != siz}">
															<li onclick="chonSize('${siz}')" class="text-center">${siz}
															</li>
														</c:if>
													</c:forEach>
												</ul>
											</div>

										</div>
										<!-- trangThaiCon hàng thì cho mua và thêm vào giỏ hàng -->
										<c:if test="${trangThaiHang==true}">
											<div style="display: flex;" class="mb-2">
												<span class="price fw-bold fs-5 ">Trạng thái:</span> <span
													class="price ms-2 mg text-success mt-1">Còn hàng</span>
											</div>
											<c:if test="${trangThaiHangMuaHang==true}">
												<div style="display: flex;" class="mb-2">
													<span class="price fw-bold fs-5 ">Số Lượng:</span> <span
														class="price ms-2 mg mt-1">${soLuongSanPhamCon}</span>
												</div>
												<button type="button" onclick="addToCart(${maChiTietSanPham})"
													class="btn btn-outline-success w-50 mt-3 ms-1">
													Thêm vào giỏ hàng<i class="fa-solid fa-cart-shopping ms-1"></i>
												</button>
												<button type="button" onclick="addToOrder(${maChiTietSanPham})"
													class="btn btn-success w-25  mt-3 ms-1">Mua Ngay</button>
											</c:if>
										</c:if>
										<!-- Trạng thái hêt hàng thì hiển thị hết hàng -->
										<c:if test="${trangThaiHang==false}">
											<div style="display: flex;" class="mb-2">
												<span class="price fw-bold fs-5 ">Trạng thái:</span> <span
													class="price ms-2 mg text-danger mt-1">Hết hàng hoặc đã
													hết size bạn chọn</span>
											</div>
										</c:if>
									</div>
									<div class="row mt-3">
										<a type="button" class="text-decoration-none text-success"
											data-bs-toggle="modal" data-bs-target="#exampleModal"> Bảng
											tính size </a>

										<!-- Modal -->
										<div class="modal fade" id="exampleModal" tabindex="-1"
											aria-labelledby="exampleModalLabel" aria-hidden="true">
											<div class="modal-dialog">
												<div class="modal-content">
													<div class="modal-header">
														<h5 class="modal-title" id="exampleModalLabel">Bảng Size
															Giày</h5>
														<button type="button" class="btn-close" data-bs-dismiss="modal"
															aria-label="Close"></button>
													</div>
													<div class="modal-body p-0">
														<div class="d-flex align-items-center justify-content-center">
															<img src="https://giaycaosmartmen.com/wp-content/uploads/2020/09/bang-size-giay-chuan.png"
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
									<p class="fs-5 fw-bold mt-3">Mô tả:</p>
									<p>${sanpham.mota}
										<br> ${sanpham.noidungsanpham}
									</p>
								</div>
							</div>
							<hr class="mt-3">
							<!-- Đánh giá -->
							<div class="col-md-12 mt-3">
								<div class="container">
									<div class="row">
										<div class="col-md-12 border border-1 bg-light">
											<h5 class="m-3">ĐÁNH GIÁ</h5>
											<div class="row">
												<div class="col-3">
													<c:if test="${Math.round(soSaoTrungBinh)==0}"><span
															class="ms-3 text-warning">Sản phẩm chưa có đánh giá</span>
													</c:if>
													<c:if test="${Math.round(soSaoTrungBinh)!=0}">
														<p class="card-text text-warning ms-3">
															${Math.round(soSaoTrungBinh)}
															trên 5</p>
													</c:if>
													<div class="ratings">
														<c:if test="${Math.round(soSaoTrungBinh)>4}">
															<i class="fa-solid fa-star text-warning" id="star1"
																data-value="1"></i>
															<i class="fa-solid fa-star text-warning" id="star2"
																data-value="2"></i>
															<i class="fa-solid fa-star text-warning" id="star3"
																data-value="3"></i>
															<i class="fa-solid fa-star text-warning" id="star4"
																data-value="4"></i>
															<i class="fa-solid fa-star text-warning" id="star5"
																data-value="5"></i>
														</c:if>
														<c:if
															test="${Math.round(soSaoTrungBinh)>3 && Math.round(soSaoTrungBinh)<=4}">
															<i class="fa-solid fa-star text-warning" id="star1"
																data-value="1"></i>
															<i class="fa-solid fa-star text-warning" id="star2"
																data-value="2"></i>
															<i class="fa-solid fa-star text-warning" id="star3"
																data-value="3"></i>
															<i class="fa-solid fa-star text-warning" id="star4"
																data-value="4"></i>
															<i class="fa-solid fa-star" id="star5" data-value="5"></i>
														</c:if>
														<c:if
															test="${Math.round(soSaoTrungBinh)>2 && Math.round(soSaoTrungBinh)<=3}">
															<i class="fa-solid fa-star text-warning" id="star1"
																data-value="1"></i>
															<i class="fa-solid fa-star text-warning" id="star2"
																data-value="2"></i>
															<i class="fa-solid fa-star text-warning" id="star3"
																data-value="3"></i>
															<i class="fa-solid fa-star " id="star4" data-value="4"></i>
															<i class="fa-solid fa-star" id="star5" data-value="5"></i>
														</c:if>
														<c:if
															test="${Math.round(soSaoTrungBinh)>1 && Math.round(soSaoTrungBinh)<=2}">
															<i class="fa-solid fa-star text-warning" id="star1"
																data-value="1"></i>
															<i class="fa-solid fa-star text-warning" id="star2"
																data-value="2"></i>
															<i class="fa-solid fa-star " id="star3" data-value="3"></i>
															<i class="fa-solid fa-star " id="star4" data-value="4"></i>
															<i class="fa-solid fa-star" id="star5" data-value="5"></i>
														</c:if>
														<c:if
															test="${Math.round(soSaoTrungBinh)>0 && Math.round(soSaoTrungBinh)<=1}">
															<i class="fa-solid fa-star text-warning" id="star1"
																data-value="1"></i>
															<i class="fa-solid fa-star " id="star2" data-value="2"></i>
															<i class="fa-solid fa-star " id="star3" data-value="3"></i>
															<i class="fa-solid fa-star " id="star4" data-value="4"></i>
															<i class="fa-solid fa-star" id="star5" data-value="5"></i>
														</c:if>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="container mt-3">
								<c:forEach items="${listDanhGia}" var="item">
									<div class="row">
										<div class="col-md-1">
											<c:if test="${item.user.anhdaidien != null}">
												<img src="/assets/img/user/${item.user.anhdaidien}"
													class="img-user mt-3">
											</c:if>
											<c:if test="${item.user.anhdaidien == null}">
												<img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT2WQTIyI3gDR7pusOaPAIGJKzMZ9aUxcfsJQ&s"
													class="img-user mt-3">
											</c:if>
										</div>
										<div class="col-md-11">
											<h5 class="card-title mb-3">${item.user.ten}</h5>
											<c:if test="${Math.round(item.sosao)>4}">
												<i class="fa-solid fa-star text-warning" id="star1" data-value="1"></i>
												<i class="fa-solid fa-star text-warning" id="star2" data-value="2"></i>
												<i class="fa-solid fa-star text-warning" id="star3" data-value="3"></i>
												<i class="fa-solid fa-star text-warning" id="star4" data-value="4"></i>
												<i class="fa-solid fa-star text-warning" id="star5" data-value="5"></i>
											</c:if>
											<c:if test="${Math.round(item.sosao)>3 && Math.round(item.sosao)<=4}">
												<i class="fa-solid fa-star text-warning" id="star1" data-value="1"></i>
												<i class="fa-solid fa-star text-warning" id="star2" data-value="2"></i>
												<i class="fa-solid fa-star text-warning" id="star3" data-value="3"></i>
												<i class="fa-solid fa-star text-warning" id="star4" data-value="4"></i>
												<i class="fa-solid fa-star" id="star5" data-value="5"></i>
											</c:if>
											<c:if test="${Math.round(item.sosao)>2 && Math.round(item.sosao)<=3}">
												<i class="fa-solid fa-star text-warning" id="star1" data-value="1"></i>
												<i class="fa-solid fa-star text-warning" id="star2" data-value="2"></i>
												<i class="fa-solid fa-star text-warning" id="star3" data-value="3"></i>
												<i class="fa-solid fa-star " id="star4" data-value="4"></i>
												<i class="fa-solid fa-star" id="star5" data-value="5"></i>
											</c:if>
											<c:if test="${Math.round(item.sosao)>1 && Math.round(item.sosao)<=2}">
												<i class="fa-solid fa-star text-warning" id="star1" data-value="1"></i>
												<i class="fa-solid fa-star text-warning" id="star2" data-value="2"></i>
												<i class="fa-solid fa-star " id="star3" data-value="3"></i>
												<i class="fa-solid fa-star " id="star4" data-value="4"></i>
												<i class="fa-solid fa-star" id="star5" data-value="5"></i>
											</c:if>
											<c:if test="${Math.round(item.sosao)>0 && Math.round(item.sosao)<=1}">
												<i class="fa-solid fa-star text-warning" id="star1" data-value="1"></i>
												<i class="fa-solid fa-star " id="star2" data-value="2"></i>
												<i class="fa-solid fa-star " id="star3" data-value="3"></i>
												<i class="fa-solid fa-star " id="star4" data-value="4"></i>
												<i class="fa-solid fa-star" id="star5" data-value="5"></i>
											</c:if>
											<p class="card-text">
												<c:if test="${item.ngaydanhgia != null}">Ngày đánh giá:
													${item.ngaydanhgia}</c:if>
												<c:if test="${item.ngaydanhgia == null}">Ngày đánh giá: Không thể hiển
													thị</c:if>
											</p>
											<p class="card-text">${item.noidung}</p>
											<div>
												<c:forEach items="${item.anhdanhgia}" var="anhDanhGia" varStatus="loop">
													<a type="button" class="text-decoration-none btn-outline-ligh me-2"
														data-bs-toggle="modal"
														data-bs-target="#exampleModal${anhDanhGia.maanhdanhgia}">
														<img src="/assets/img/danhgia/${anhDanhGia.nguonanh}"
															class="img-user">
													</a>

													<!-- Modal -->
													<div class="modal fade" id="exampleModal${anhDanhGia.maanhdanhgia}"
														tabindex="-1" aria-labelledby="exampleModalLabel"
														aria-hidden="true">
														<div class="modal-dialog">
															<div class="modal-content">
																<div class="modal-header">
																	<h5 class="modal-title" id="exampleModalLabel">Chi
																		Tiết Hình Vừa Chọn</h5>
																	<button type="button" class="btn-close"
																		data-bs-dismiss="modal"
																		aria-label="Close"></button>
																</div>
																<div class="modal-body p-0">
																	<div
																		class="d-flex align-items-center justify-content-center">
																		<img src="/assets/img/danhgia/${anhDanhGia.nguonanh}"
																			class="img-chitiet-anhdanhgia">
																	</div>
																</div>
																<div class="modal-footer">
																	<button type="button" class="btn btn-secondary"
																		data-bs-dismiss="modal">Đóng</button>
																</div>
															</div>
														</div>
													</div>
												</c:forEach>
											</div>
										</div>
									</div>
									<hr>
								</c:forEach>
							</div>
						</div>
						<!--End Đánh giá -->
						<!-- 8 sản phẩm tương tự -->
						<div class="col-md-12 mt-3">
							<h2 class="text-center col-12">Sản phẩm tương tự
								(${listSanPhamTuongTu.size()})</h2>
							<div class="col-12">
								<div class="row">
									<c:forEach items="${listSanPhamTuongTu}" var="sp">
										<div class="col-3 mb-3">
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
														<h6 class="card-title mb-2 ten-sanpham">${sp.tensanpham}</h6>
														<span class="price ct text-decoration-line-through">
															<fmt:formatNumber value="${sp.giagoc}" type="number"
																groupingUsed="true" pattern="###,###" /> VND
														</span> <span class="price fs-6 ctn">
															<fmt:formatNumber value="${sp.gia}" type="number"
																groupingUsed="true" pattern="###,###" /> VND
														</span>
													</div>
												</a>
											</div>
										</div>
									</c:forEach>
								</div>
							</div>
						</div>
					</div>
					</div>
				</main>
				<jsp:include page="footer_user.jsp" />
				<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
					integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
					crossorigin="anonymous"></script>

				<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js"
					integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+"
					crossorigin="anonymous"></script>
				<script>
					/* Xử lý JS cho chọn ảnh */
					$(document).ready(function () {
						$('.thumbnail').on('click', function () {
							console.log('Thumbnail clicked');
							var src = $(this).attr('src');
							$('#mainImage').attr('src', src);
						});
					});
					/* Sử lý màu cho li màu*/
					const listTabMau = document.querySelectorAll(".list-tab-mau li");
					listTabMau.forEach((li) => {
						li.addEventListener("click", function () {
							//Xóa mấy cái cũ trước
							listTabMau.forEach(li2 => {
								li2.classList.remove("active");
							})
							// thêm một cái active vào khi nó được click
							li.classList.add("active");
						})
					})
					/* Sử lý active cho size */
					const listTabSize = document.querySelectorAll(".list-tab-size li");
					listTabSize.forEach((li) => {
						li.addEventListener("click", function () {
							//Xóa mấy cái cũ trước
							listTabSize.forEach(li2 => {
								li2.classList.remove("active");
							})
							// thêm một cái active vào khi nó được click
							li.classList.add("active");
						})
					})
					function chonMau(mau) {
						let url = new URL(window.location.href);
						url.searchParams.set("mausac", mau);
						window.location.href = url;
					}

					function chonSize(size) {
						let url = new URL(window.location.href);
						url.searchParams.set("size", size);
						window.location.href = url;
					}
					function addToCart(id) {
						Swal.fire({
							position: "center",
							icon: "success",
							title: "Sản phẩm đã được thêm vào giỏ hàng",
							showConfirmButton: false,
							timer: 1500
						}).then(() => {
							console.log(id);
							window.location.href = "/add-cart/" + id;
						});
					}
					function addToOrder(id) {
						window.location.href = "/add-donhang/" + id;
					}
				</script>
			</body>

			</html>