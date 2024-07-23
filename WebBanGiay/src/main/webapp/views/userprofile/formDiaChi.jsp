<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container mt-5">
		<div class="card-header">Thêm Địa Chỉ Giao Hàng</div>

		<div class="card-body">
			<form:form action="/diachi/diaChi"
				modelAttribute="diachigiaohang" class="form-group">
				<!-- Hidden input for id -->
				<form:hidden path="madiachigiaohang" />

				<!-- Input for tennguoinhan -->
				<form:input path="tennguoinhan" placeholder="Tên người nhận"
					class="form-control mb-3" />

				<!-- Input for sodienthoai -->
				<form:input path="sodienthoai" placeholder="Số điện thoại"
					class="form-control mb-3" />

				<!-- Input for diachigiaohang -->
				<form:input path="diachigiaohang" placeholder="Địa chỉ giao hàng"
					class="form-control mb-3" />

				<!-- Input for thongtinthem -->
				<form:input path="thongtinthem" placeholder="Thông tin thêm"
					class="form-control mb-3" />

				<!-- Checkbox for diachimacdinh -->
				<form:checkbox path="diachimacdinh" class="form-check-input" />
				<label for="diachimacdinh" class="form-check-label">Địa chỉ
					mặc định</label>
				<hr>
				<button formaction="/diachi/create" class="btn btn-success" onclick="return validateForm()">Create</button>
				<button  formaction="/diachi/update" class="btn btn-warning ms-3" onclick="return validateForm()">Update</button>
				<a href="/diachi/delete/${diachigiaohang.madiachigiaohang}"
					class="btn btn-danger ms-3">Delete</a>
				<a href="/diachi/reset" class="btn btn-secondary ms-3">Reset</a>
			</form:form>
		</div>
		<%-- <div class="card-body">
			<form:form action="/diachi/create" modelAttribute="diachiEntity"
				class="form-group">
				<!-- Input for tennguoinhan -->
				<form:input path="tennguoinhan" placeholder="Tên người nhận"
					class="form-control mb-3" />

				<!-- Input for sodienthoai -->
				<form:input path="sodienthoai" placeholder="Số điện thoại"
					class="form-control mb-3" />

				<!-- Input for diachigiaohang -->
				<form:input path="diachigiaohang" placeholder="Địa chỉ giao hàng"
					class="form-control mb-3" />

				<!-- Input for thongtinthem -->
				<form:input path="thongtinthem" placeholder="Thông tin thêm"
					class="form-control mb-3" />

				<!-- Checkbox for diachimacdinh -->
				<form:checkbox path="diachimacdinh" class="form-check-input" />
				<label for="diachimacdinh" class="form-check-label">Địa chỉ
					mặc định</label>

				<hr>
				<button class="btn btn-success">Create</button>
			</form:form>
		</div> --%>

	</div>
	<script>
    function validateForm() {
        // Lấy giá trị của các trường input
        var tennguoinhan = document.getElementById('tennguoinhan').value;
        var sodienthoai = document.getElementById('sodienthoai').value;
        var diachigiaohang = document.getElementById('diachigiaohang').value;

        // Kiểm tra không được để trống dữ liệu
        if (tennguoinhan.trim() === "" || sodienthoai.trim() === "" || diachigiaohang.trim() === "") {
            alert("Vui lòng điền đầy đủ thông tin.");
            return false;
        }

        // Kiểm tra số điện thoại chỉ được nhập số
        if (!/^\d+$/.test(sodienthoai)) {
            alert("Số điện thoại chỉ được nhập số.");
            return false;
        }

        // Nếu mọi thứ hợp lệ, gửi form đi
        return true;
    }
</script>

</html>