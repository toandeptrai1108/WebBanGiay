<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous" />
</head>
<body>
	<div class="container">
		<form:form action="/hang" modelAttribute="han" class="row g-3">
			<div class="col-md-6">
				<label class="form-label">Tên Hãng</label>
				<form:input class="form-control" path="tenhang" type="text" />
				<span class="text-danger">${error}</span>
			</div>
			
			<div class="col-md-6">
				<label class="form-label">Hot</label>
				<form:select path="hot" class="form-control" id="">
					<form:option value="false" label="Không Hot" />
					<form:option value="true" label="Hot" />
				</form:select>
			</div>
			<div class="col-md-12">
				<label class="form-label">Trạng Thái</label>
				<form:select path="trangthai" class="form-control" id="">
					<form:option value="false" label="Không Hiển Thị" />
					<form:option value="true" label="Hiển Thị" />
				</form:select>
			</div>
			<div class="col-md-12">
				<label class="form-label">Ảnh</label>
				<form:input class="form-control" path="anhdaidien" type="file" />
			</div>
			<button formaction="/createhang" class="btn btn-primary">Thêm
				danh mục</button>
		</form:form>
		<table class="table table-bordered ">
			<tr class="text-center">
				<th>STT</th>
				<th>Tên Hãng</th>
				<th>Hot</th>
				<th>Trạng Thái</th>
				<th>Ảnh</th>
				<th></th>
			</tr>
			<c:forEach items="${listHang}" var="item" varStatus="loop">
				<tr class="text-center">
					<td>${loop.index + 1}</td>
					<td>${item.tenhang}</td>
					<td>${item.hot ? "Đang Hot" : "Không Hot"}</td>
					<td>${item.hot ? "Hiển Thị" : "Không Hiển Thị"}</td>
					<td>
						<div class="d-flex justify-content-center">
							<img class="w-25" alt=""
								src="/assets/img/product/${item.anhdaidien}">
						</div>
					</td>
					<td><a href="/hang/edithang/${item.mahang}">Edit</a></td>
				</tr>
			</c:forEach>

		</table>

	</div>

	<!-- Bootstrap JavaScript Libraries -->
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