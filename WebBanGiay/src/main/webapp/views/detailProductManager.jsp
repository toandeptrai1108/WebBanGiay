<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
		<form:form action="" modelAttribute="entity" class="row g-3">
			<div class="col-md-6">
				<form:input class="form-control" path="sanpham" value="${idSP}" id="masanpham"/>
			</div>
			<div class="col-12">
				<label for="" class="form-label">Giá</label>
				<form:input path="giatien" type="number" class="form-control" />
			</div>

			<div class="col-md-6">
				<label for="" class="form-label">Màu Sắc</label>
				<form:input path="mausac" type="text" class="form-control" />
			</div>
			<div class="col-md-6">
				<label for="" class="form-label">Size</label>
				<form:input path="size" type="text" class="form-control" id="" />
			</div>
			
			<div class="col-12">
				<label for="" class="form-label">Số Lượng</label>
				<form:input path="soluong" type="number" class="form-control" id="" />
			</div>
			
			<div class="col-12">
				<button formaction="/createdetailproduct" type="submit" class="btn btn-primary">Thêm
					Chi Tiết Sản Phẩm</button>
			</div>


		</form:form>
		<table class="table table-bordered ">
			<tr>
				<th>STT</th>
				<th>Màu Sắc</th>
				<th>Size</th>
				<th>Số Lượng</th>
				<th>Giá Tiền</th>
			</tr>
			<c:forEach items="${ctsp}" var="item" varStatus="loop">
				<tr>
					<td>${loop.index + 1}</td>
					<td>${item.mausac}</td>
					<td>${item.size}</td>
					<td>${item.soluong}</td>
					<td><fmt:formatNumber value="${item.giatien}"></fmt:formatNumber> VND</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
		integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
		crossorigin="anonymous"></script>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js"
		integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+"
		crossorigin="anonymous"></script>
		
	<script>
	var inputElement = document.getElementById("masanpham");
	
	inputElement.style.display = "none";
	</script>
</body>
</html>