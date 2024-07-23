<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Contact Us</title>
<style type="text/css">
.contact-info {
	padding-top: 20px; /* Thêm 20px padding-top */
	margin-left: 10px;
}

.contact-info h2 {
	font-size: 18px;
	font-weight: bold;
}

.contact-info p {
	margin-bottom: 10px;
}

.contact-info a {
	color: blue;
	text-decoration: none;
}

.row {
	display: flex; /* Cho phép các cột nằm ngang */
	margin-top: 10px; /* Thêm khoảng cách dưới cùng */
}
</style>
</head>
<body>
	<jsp:include page="nav_userproduct.jsp" />
	<div class="row">
		<div class="row">
			<div class="col-6">
				<iframe width="1300" height="450"
					src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d62870.72791396474!2d105.6861296216797!3d9.982081500000001!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31a08906415c355f%3A0x416815a99ebd841e!2zVHLGsOG7nW5nIENhbyDEkeG6s25nIEZQVCBQb2x5dGVjaG5pYw!5e0!3m2!1svi!2s!4v1718683787352!5m2!1svi!2s"
					style="border: 0;" allowfullscreen="" loading="lazy"
					referrerpolicy="no-referrer-when-downgrade"></iframe>
			</div>
			<div class="contact-info">
				<h2>Thông Tin Liên Hệ</h2>
				<p>Trường Cao đẳng FPT Polytechnic</p>
				<p>Địa chỉ: Toà nhà FPT Polytechnic, Đ. Số 22, Thường Thạnh, Cái
					Răng, Cần Thơ</p>
				<p>
					Email: <a href="mailto:khoatdpc07807@fpt.edu.vn">khoatdpc07807@fpt.edu.vn</a>
				</p>
				<p>Số điện thoại: +84 944 676 800</p>
			</div>
		</div>
		<jsp:include page="footer_user.jsp" />
</body>
</html>




