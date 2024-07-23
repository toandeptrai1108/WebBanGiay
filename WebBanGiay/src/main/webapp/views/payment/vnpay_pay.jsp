<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="">
<meta name="author" content="">
<title>Tạo mới đơn hàng</title>
<!-- Bootstrap core CSS -->
<link href="assets/bootstrap.min.css" rel="stylesheet" />
<!-- Custom styles for this template -->
<link href="assets/jumbotron-narrow.css" rel="stylesheet">
<script src="assets/jquery-1.11.3.min.js"></script>
</head>

<body>

	<div class="container">
		<div class="header clearfix">
			<h3 class="text-muted">
				VNPAY <img width="35" height="25"
					src="data:image/png;base64,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"
					alt="Logo VNPay">
			</h3>

		</div>
		<h3>Tạo mới đơn hàng</h3>
		<div class="table-responsive">

			<!-- Thay chỗ này  /Tên project/vnpayajax-->
			<form action="/ajaxvnpay" id="frmCreateOrder" method="Post">
				<div class="form-group">
					<label for="amount">Số tiền cần thanh toán: <fmt:formatNumber
							value="${tongTienCanThanhToan}" type="number" groupingUsed="true"
							pattern="###,###" /> VND
					</label>
					<!-- Thông tin cần được post và lưu vào session -->
					<input type="hidden" name="tongTienCanThanhToan"
						value="${tongTienCanThanhToan}}">
				</div>
				<h4>Chọn phương thức thanh toán</h4>
				<div class="form-group">
					<h5>Cách 1: Chuyển hướng sang Cổng VNPAY chọn phương thức
						thanh toán</h5>
					<input type="radio" Checked="True" id="bankCode" name="bankCode"
						value=""> <label for="bankCode">Cổng thanh toán
						VNPAYQR</label><br>

					<h5>Cách 2: Tách phương thức tại site của đơn vị kết nối</h5>
					<input type="radio" id="bankCode" name="bankCode" value="VNPAYQR">
					<label for="bankCode">Thanh toán bằng ứng dụng hỗ trợ
						VNPAYQR</label><br> <input type="radio" id="bankCode" name="bankCode"
						value="VNBANK"> <label for="bankCode">Thanh toán
						qua thẻ ATM/Tài khoản nội địa</label><br> <input type="radio"
						id="bankCode" name="bankCode" value="INTCARD"> <label
						for="bankCode">Thanh toán qua thẻ quốc tế</label><br>

				</div>
				<div class="form-group">
					<h5>Chọn ngôn ngữ giao diện thanh toán:</h5>
					<input type="radio" id="language" Checked="True" name="language"
						value="vn"> <label for="language">Tiếng việt</label><br>
					<input type="radio" id="language" name="language" value="en">
					<label for="language">Tiếng anh</label><br>

				</div>
				<button type="submit" class="btn btn-default">Thanh toán</button>
			</form>
		</div>
		<p>&nbsp;</p>
		<footer class="footer">
			<p>&copy; VNPAY 2020</p>
		</footer>
	</div>

	<link href="https://pay.vnpay.vn/lib/vnpay/vnpay.css" rel="stylesheet" />
	<script src="https://pay.vnpay.vn/lib/vnpay/vnpay.min.js"></script>
	<script type="text/javascript">
		$("#frmCreateOrder").submit(function() {
			var postData = $("#frmCreateOrder").serialize();
			var submitUrl = $("#frmCreateOrder").attr("action");
			$.ajax({
				type : "POST",
				url : submitUrl,
				data : postData,
				dataType : 'JSON',
				success : function(x) {
					if (x.code === '00') {
						if (window.vnpay) {
							vnpay.open({
								width : 768,
								height : 600,
								url : x.data
							});
						} else {
							location.href = x.data;
						}
						return false;
					} else {
						alert(x.Message);
					}
				}
			});
			return false;
		});
	</script>
</body>
</html>