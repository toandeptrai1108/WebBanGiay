<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="container mt-5">
	<h1>Danh sách địa chỉ</h1>
	<table class="table table-striped table-bordered">
		<thead>
			<tr>
				<th scope="col">Tên người nhận</th>
				<th scope="col">Số điện thoại</th>
				<th scope="col">Địa chỉ</th>
				<th scope="col">Thông tin</th>
				<th scope="col"></th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="item" items="${diachigiaohangList}">
				<tr>
					<td>${item.tennguoinhan}</td>
					<td>${item.sodienthoai}</td>
					<td>${item.diachigiaohang}</td>
					<td>${item.thongtinthem}</td>
					<td><a href="/diachi/edit/ ${item.madiachigiaohang}"
						class="btn btn-primary btn-sm" >Edit</a></td>

				</tr>
			</c:forEach>
		</tbody>
	</table>

</div>
