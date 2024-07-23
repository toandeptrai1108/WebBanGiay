<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!doctype html>
<html lang="en">
<head>
<title>Quên Mật Khẩu</title>
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
<!-- CSS -->
<link rel="stylesheet" href="/assets/css/dangnhap.css">
<link rel="stylesheet" href="/assets/css/style.css">
<link rel="stylesheet" class="js-color-style"
	href="/assets/css/colors/color-1.css">
<!-- Thêm không biết -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>

</head>

<body>
		<!-- BẮT ĐẦU ĐĂNG NHẬP -->
<div class="container">
    <div class="row justify-content-center align-items-center" style="height: 90vh;">
        <div class="col-md-6">
        <form action="quenmatkhau" method = "post">
            <div class="card text-center">
                <div class="card-header h5 text-white bg-success">Quên Mật Khẩu</div>
                <div class="card-body px-5">	
                    <p class="card-text py-2 fw-bold fs-4">Hãy Nhập Email</p>
                    <div data-mdb-input-init class="form-outline">
                        <input type="email" id="typeEmail" name = "email" class="form-control my-3" placeholder="Email" />     
                        <span class = "text-danger">${loiEmail}</span>       
                        <span class = "text-danger">${email}</span>            
                    </div>
                    <button type = "submit" data-mdb-ripple-init class="btn btn-outline-success w-50">Reset password</button>
                    <div class="d-flex justify-content-center mt-2">
                        <a class="" href="#">Login/</a>
                        <a class="" href="#">Register</a>
                    </div>
                </div>
            </div>
            </form>
        </div>
    </div>
</div>


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