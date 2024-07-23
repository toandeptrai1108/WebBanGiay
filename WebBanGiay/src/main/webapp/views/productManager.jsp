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
		<form:form action="/productmanager" class="row g-3"
			modelAttribute="sp" method="post">
			<div class="col-md-6">
				<label for="" class="form-label">Tên Sản Phẩm</label>
				<form:input path="tensanpham" type="text" class="form-control" />
			</div>
			<div class="col-md-6">
				<label for="" class="form-label">Hãng</label>
				<form:select path="hang" class="form-control" id="">
					<form:option value="" label="-- Chọn danh mục sản phẩm --" />
					<c:forEach items="${listHang}" var="items">
						<form:option value="${items.mahang}" label="${items.tenhang}" />
					</c:forEach>
				</form:select>
			</div>
			<div class="col-md-12">
				<form:checkbox path="trangthai" class="form-check-input" />
				<label for="" class="form-check-label">Còn hàng</label>
			</div>
			<div class="col-md-6">
				<label for="" class="form-label">Nội dung sản phẩm</label>
				<form:input path="noidungsanpham" type="text" class="form-control"
					id="" />
			</div>
			<div class="col-md-6">
				<label for="" class="form-label">Giá gốc</label>
				<form:input path="giagoc" type="number" class="form-control" id="" />
			</div>
			<div class="col-md-12">
				<label for="" class="form-label">Giảm Giá</label>
				<form:input path="giamgia" type="number" class="form-control" id="" />
			</div>
			<div class="col-md-12">
				<label for="" class="form-label">Giá</label>
				<form:input path="gia" type="number" class="form-control" id="" />
			</div>
			<div class="col-md-12">
				 <form:select path="danhmuc" class="form-control"
					id="madonvivanchuyen">
					<form:option value="" label="-- Chọn danh mục sản phẩm --" />
					<c:forEach items="${listDanhMuc}" var="items">
						<form:option value="${items.madanhmuc}"
							label="${items.tendanhmuc}" />
					</c:forEach>
				</form:select>
			</div>
			<div class="col-12">
				<input class="form-control " type="file" placeholder="Thêm hình ảnh">
			</div>
			<div class="col-12">
				<button formaction="/createproduct" type="submit"
					class="btn btn-primary">Thêm Sản Phẩm</button>
			</div>

		</form:form>
		<table class="table table-bordered ">
			<tr>
				<th>STT</th>
				<th>Tên Sản Phẩm</th>
				<th>Trạng Thai</th>
				<th>Chi tiết</th>
			</tr>
			<c:forEach items="${listSP}" var="item" varStatus="loop">
				<tr>
					<td>${loop.index + 1}</td>
					<td>${item.tensanpham}</td>
					<td>${item.trangthai? "Còn Hàng" : "Hết Hàng"}</td>
					<td><a href="/productmanager/chitietsanpham/${item.masanpham}">Xem
							chi tiết</a></td>
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