<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
		<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

			</html>
			<!doctype html>
			<html lang="en">

			<head>
				<title>Sản phẩm</title>
				<!-- Required meta tags -->
				<meta charset="utf-8" />
				<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />

				<!-- Bootstrap CSS v5.2.1 -->
				<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
					integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
					crossorigin="anonymous" />
				<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
				<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
				<link rel="stylesheet" href="/assets/css/index.css">
				<link rel="stylesheet" href="/assets/css/style.css">
				<link rel="stylesheet" class="js-color-style" href="/assets/css/colors/color-1.css">
				<script src="https://kit.fontawesome.com/c5fd529f32.js" crossorigin="anonymous"></script>
				<style type="text/css">
					.ten-sanpham {
						display: -webkit-box;
						-webkit-line-clamp: 1;
						-webkit-box-orient: vertical;
						overflow: hidden
					}

					.hover-input:hover {
						box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
						border-color: #ccc;
					}

					.hover-btn:hover {
						background-color: #007bff;
						color: #fff;
						border-color: #007bff;
						box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
					}

					.hover-link:hover {
						box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
						border-color: #ccc;
						display: block;
					}
				</style>
			</head>

			<body>
				<main>
					<jsp:include page="nav_userproduct.jsp" />
					<!-- --------------------------------------------------------- -->
					<div class="container col-12">
						<div class="row g-3 mt-3">
							<div class="col-md-2">
								<label for="tenDanhMuc" class="form-label fw-bold">Tên danh mục:</label>
								<input list="doDanhMuc" value="${tenDanhMuc}" type="text" id="tenDanhMuc"
									class="form-control hover-input">
								<datalist id="doDanhMuc">
									<c:forEach items="${listDanhMuc}" var="item">
										<option value="${item.tendanhmuc}">${item.tendanhmuc}</option>
									</c:forEach>
								</datalist>
							</div>
							<div class="col-md-2">
								<label for="tenHang" class="form-label fw-bold">Tên hãng:</label>
								<input list="doHang" value="${tenHang}" type="text" id="tenHang"
									class="form-control hover-input">
								<datalist id="doHang">
									<c:forEach items="${listHang}" var="item">
										<option value="${item.tenhang}">${item.tenhang}</option>
									</c:forEach>
								</datalist>
							</div>
							<div class="col-md-2">
								<label for="min" class="form-label fw-bold">Giá từ:</label>
								<input value="${min}" type="number" id="min" class="form-control hover-input">
							</div>
							<div class="col-md-2">
								<label for="max" class="form-label fw-bold">Đến:</label>
								<input value="${max}" type="number" id="max" class="form-control hover-input">
							</div>
							<div class="col-md-2">
								<label for="filter-select" class="form-label fw-bold">Sắp xếp theo giá:</label>
								<select id="sapXepGia" class="form-select hover-input">
									<option selected value="">Lọc dữ liệu</option>
									<option value="gia-asc">Giá từ thấp đến cao</option>
									<option value="gia-desc">Giá từ cao đến thấp</option>
								</select>
							</div>
							<div class="col-md-2 align-middle text-center">
								<button onclick="locSanPham()" class="btn btn-success fw-bold hover-btn " type="button">
									Tìm kiếm <i class="fa-solid fa-magnifying-glass"></i>
								</button>
							</div>
						</div>
						<hr>
						<div class="row">
							<div class="col-3">
								<div class="mt-4">
									<p class="mt-3 fw-bold ">DANH MỤC SẢN PHẨM</p>
									<div>
										<a href="/userproduct/flashSale"
											class="text-decoration-none text-black-50 hover-link">
											FLASH⚡SALE </a>
									</div>
									<hr>
									<c:forEach items="${listDanhMuc}" var="danhMuc">
										<div class="mt-1">
											<c:url value="/userproduct/danhmuc/${danhMuc.madanhmuc}" var="categoryUrl">
												<c:param name="page" value="${page}" />
											</c:url>
											<a href="${categoryUrl}"
												class="text-decoration-none text-black-50 hover-link p-1">
												${danhMuc.tendanhmuc} </a>
										</div>
									</c:forEach>
								</div>
								<div class="mt-4">
									<p class="mt-3 fw-bold">Hãng</p>
									<c:forEach items="${listHang}" var="item">
										<div class="mt-1">
											<c:url value="/userproduct/danhmuc/${item.mahang}" var="categoryUrl">
												<c:param name="page" value="${page}" />
											</c:url>
											<a href="${categoryUrl}"
												class="text-decoration-none text-black-50 hover-link p-1">
												${item.tenhang} </a>
										</div>
									</c:forEach>
								</div>
							</div>
							<div class="col-md-9 mt-3">
								<div class="row">
									<!-- Render sản phẩm -->
									<c:if test="${flashSale==true}">
										<h1 class="">FLASH⚡SALE</h1>
									</c:if>
									<c:forEach items="${dsSP.getContent()}" var="sp">
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
														<h6 class="card-title mb-2 ten-sanpham">${sp.tensanpham}</h6>
														<span class="price ct text-decoration-line-through">
															<fmt:formatNumber value="${sp.giagoc}" type="number"
																groupingUsed="true" pattern="###,###" />
														</span> <span class="price ms-1 fs-6 ctn">
															<fmt:formatNumber value="${sp.gia}" type="number"
																groupingUsed="true" pattern="###,###" /> VND
														</span>
													</div>
												</a>
											</div>
										</div>
									</c:forEach>
									<hr>
								</div>
								<div class="offset-4 mb-3">
									<nav aria-label="Page navigation example">
										<ul class="pagination">
											<!-- Hiển thị trang trước -->
											<li class="page-item">
												<button class="page-link"
													onclick="paging(${ dsSP.pageable.pageNumber-1>0?dsSP.pageable.pageNumber-1:0 })"
													aria-label="Previous">
													<span aria-hidden="true">&laquo;</span>
												</button>
											</li>
											<!--  Trường hợp không có dữ liệu-->
											<c:if test="${dsSP.totalPages==0}">
												<li class="page-item"><span class="page-link active">Không
														có sản phẩm tìm kiếm</span></li>
											</c:if>
											<c:if test="${dsSP.totalPages!=0}">
												<!--1-->
												<li class="page-item">
													<button class="page-link bg-success text-white"
														onclick="paging(${dsSP.number})">${dsSP.number+1}</button>
												</li>
												<!-- 2, nếu trang cuối > trang hiện tại-->
												<c:if test="${(dsSP.totalPages-1)>dsSP.number+1}">
													<li class="page-item">
														<button class="page-link"
															onclick="paging(${dsSP.number+1})">${dsSP.number+2}</button>
													</li>
												</c:if>
												<!--Trang cuối khác 0, trang cuối lớn hơn trang 2-->
												<c:if
													test="${(dsSP.totalPages-1)>=dsSP.number+1 && dsSP.number+2<=dsSP.totalPages+1}">
													<li class="page-item"><button class="page-link">...</button></li>
													<li class="page-item"><button class="page-link"
															onclick="paging(${ dsSP.totalPages-1})">${
															dsSP.totalPages}</button></li>
												</c:if>
											</c:if>
											<!-- Hiển thị trang tiếp theo -->
											<li class="page-item"><button class="page-link" onclick="paging(${(dsSP.number+1)>(dsSP.totalPages-1)
							  		?dsSP.totalPages-1	:dsSP.number+1})" aria-label="Next">
													<span aria-hidden="true">&raquo;</span>
												</button></li>
										</ul>
									</nav>
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
					function locSanPham() {
						let urlCu = new URL(window.location.href);
						window.history.pushState({}, '', '/');
						let url = new URL(window.location.href + "userproduct");
						let sapXepTheoGia = document.getElementById('sapXepGia').value;
						let min = document.getElementById("min").value;
						let max = document.getElementById("max").value;
						let tenDanhMuc = document.getElementById("tenDanhMuc").value;
						let tenHang = document.getElementById("tenHang").value;
						//1 gia-desc 2 a b
						if (min && max && parseInt(min) < parseInt(max)) {
							url.searchParams.set("min", min);
							url.searchParams.set("max", max);
						}
						if (tenDanhMuc != "") {
							url.searchParams.set("tenDanhMuc", tenDanhMuc);
						}
						if (tenHang != "") {
							url.searchParams.set("tenHang", tenHang);
						}
						if (sapXepTheoGia != "") {
							url.searchParams.set("sort", sapXepTheoGia);
						}

						window.location.href = url;
					}

					function paging(page) {
						console.log(page)
						let url = new URL(window.location.href);
						if (url.toString().includes("page")) {
							url.searchParams.set('page', page);
						} else {
							url.searchParams.append('page', page);
						}
						window.location.href = url;
					}
				</script>
			</body>

			</html>