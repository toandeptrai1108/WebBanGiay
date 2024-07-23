<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!doctype html>
<html lang="en">
<head>
<title>Đánh giá sản phẩm đã đặt</title>
<!-- Required meta tags -->
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<!-- Bootstrap CSS v5.2.1 -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous" />
<!-- Font awesome -->
<script src="https://kit.fontawesome.com/c5fd529f32.js"
	crossorigin="anonymous"></script>
<style type="text/css">
body {
	background-color: #eef3f4;
}

.product-image {
	width: 100px;
	height: 100px;
	object-fit: cover;
}

.height-100 {
	height: 100vh;
}

.card {
	width: 380px;
	border: none;
	height: 280px;
}

.ratings {
	margin-right: 10px;
}

.ratings i {
	color: #cecece;
	font-size: 32px;
}

.rating-color {
	color: #fbc634 !important;
}

.review-count {
	font-weight: 400;
	margin-bottom: 2px;
	font-size: 24px !important;
}

.small-ratings i {
	color: #cecece;
}

.review-stat {
	font-weight: 300;
	font-size: 18px;
	margin-bottom: 2px;
}

.ratings i {
	transition: color 0.3s; /* thêm hiệu ứng chuyển màu */
}

.ratings i.rating-color {
	color: #ffd700; /* màu vàng cho sao được chọn */
	animation: pulse 0.5s; /* thêm hiệu ứng nháy */
}

@
keyframes pulse { 0% {
	transform: scale(1);
}
50






%
{
transform






:






scale




(






1




.2






)




;
}
100






%
{
transform






:






scale




(






1






)




;
}
}
</style>
</head>

<body class="dark">
	<div class="container">
		<h2 class="my-4">
			<img src="/assets/img/product/${sanPham.anhdaidien}"
				alt="${sanPham.masanpham}" class="product-image"> Bạn cảm thấy
			dịch vụ và sản phẩm của chúng tôi như thể nào?
		</h2>
		<form:form modelAttribute="danhgia" enctype="multipart/form-data"
			class="fade-in">

			<div class="d-flex justify-content-between align-items-center row">
				<label for="soSao" class="form-label col-12 fs-6"><span class="text-danger">*</span>Số sao
					đánh giá:</label>
				<div class="ratings col-12">
					<i class="fa-solid fa-star" id="star1" data-value="1"></i> <i
						class="fa-solid fa-star" id="star2" data-value="2"></i> <i
						class="fa-solid fa-star" id="star3" data-value="3"></i> <i
						class="fa-solid fa-star" id="star4" data-value="4"></i> <i
						class="fa-solid fa-star" id="star5" data-value="5"></i>
				</div>
				<form:hidden path="sosao" id="sosao" />
			</div>


			<form:hidden path="sosao" id="sosao" />
			<form:errors path="sosao" cssClass="error" />
			<div class="form-group">
				<label for="noidung" class="form-label"><span class="text-danger">*</span>Nội dung:</label>
				<form:textarea path="noidung" id="noidung" class="form-control"
					required="required"></form:textarea>
				<form:errors path="noidung" cssClass="error" />
			</div>
			<div class="form-group">
				<!-- <label for="anhDanhGia" class="form-label"><span class="text-danger">*</span>Thêm ảnh:</label> <input
					type="file" name="anhDanhGia" multiple="multiple"
					accept="image/*,video/*" class="form-control" /> -->
					
					<label for="anhDanhGia" class="form-label"><span class="text-danger">*</span>Thêm ảnh:</label> <input
					type="file" name="anhDanhGia" multiple="multiple"
					accept="*" class="form-control" />
			</div>
			<hr>
			<button type="submit" class="btn btn-primary mt-3">Đánh giá</button>
		</form:form>
	</div>

	<!-- Add Bootstrap JS -->
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"
		integrity="sha384-oBqDVmMz4fnFO9gybBud7TlRbs/ic4AwGcFZOxg5DpPt8EgeUIgIwzjWfXQKWA3"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js"
		integrity="sha384-cn7l7gDp0eyniUwwAZgrzD06kc/tftFf19TOAs2zVinnD/C7E91j9yyk5//jjpt/"
		crossorigin="anonymous"></script>
	<script>
    const stars = document.querySelectorAll('.ratings i');
    stars.forEach(star => {
        star.addEventListener('click', selectStar);
    });

    function selectStar(e) {
        const value = e.target.dataset.value;
        stars.forEach(star => {
            if (star.dataset.value <= value) {
                star.classList.add('rating-color');
            } else {
                star.classList.remove('rating-color');
            }
        });
        document.getElementById('sosao').value = value;
        console.log('Đánh giá:', value);
    }
</script>
</body>
</html>