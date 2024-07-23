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
				<style>
					.diachi {
						display: block;
					}

					.diachi:hover {
						box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
						border-color: #ccc;
					}
				</style>
			</head>

			<body>
				<div class="container">
					<div class="row">
						<div class="col-12">
							<h1>Địa chỉ giao hàng của bạn</h1>
						</div>
					</div>

					<div class="row">
						<div class="col-12">
							<a href="/diachi/diaChi" class="text-decoration-none fw-bold text-dark">
								<i class="fa-solid fa-plus"></i>Thêm địa chỉ<i
									class="fa-solid fa-chevron-right float-end"></i>
							</a>
							<hr>
							<!-- Render -->
							<c:forEach var="item" items="${list}">
								<a href="/donhang/chondiachigiaohang/${item.madiachigiaohang}"
									class="text-decoration-none text-dark diachi ps-3 pe-3">
									<div>
										<div>
											<strong>Địa chỉ giao hàng</strong>
											<p class="float-end text-decoration-none text-danger fw-medium">Chọn</p>
										</div>
										<div>
											<p>
												<i class="fa-solid fa-location-dot"></i>${item.tennguoinhan} -
												${item.sodienthoai}
											</p>

											<p>${item.xa}, ${item.huyen}, ${item.tinh}</p>

											<p>${item.thongtinthem}</p>
										</div>
										<div>
											<c:if test="${item.diachimacdinh==true}">
												<p class="badge bg-light text-dark">Mặc định</p>
											</c:if>
											<div>
											</div>
										</div>
								</a>
								<hr>
							</c:forEach>
						</div>
					</div>

				</div>
				<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
					integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
					crossorigin="anonymous"></script>

				<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js"
					integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+"
					crossorigin="anonymous"></script>

				<script>
					//Xử lí thêm số, giảm số lượng
					const decrementButton = document.getElementById('button-addon1');
					const incrementButton = document.getElementById('button-addon2');
					const quantityInput = document.querySelector('.form-control');

					decrementButton.addEventListener('click', () => {
						const currentValue = parseInt(quantityInput.value);
						if (currentValue > 1) {
							quantityInput.value = currentValue - 1;
						}
					});

					incrementButton.addEventListener('click', () => {
						const currentValue = parseInt(quantityInput.value);
						quantityInput.value = currentValue + 1;
					});
				</script>
			</body>

			</html>