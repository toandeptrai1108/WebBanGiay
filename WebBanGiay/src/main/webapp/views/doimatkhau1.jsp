<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quên Mật Khẩu</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- CSS tùy chỉnh -->
    <style>
        body {
            background-color: #f8f9fa; /* Màu nền */
        }
       .card {
            border: none; /* Loại bỏ viền card */
            border-radius: 15px; /* Bo góc card */
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1); /* Hiệu ứng bóng đổ */
        }
       .card-header {
            border-radius: 15px 15px 0 0; /* Bo góc phần header */
        }
       .btn-outline-success {
            border-color: #28a745; /* Màu viền nút */
            color: #28a745; /* Màu chữ nút */
        }
       .btn-outline-success:hover {
            background-color: #28a745; /* Màu nền khi hover */
            color: #fff; /* Màu chữ khi hover */
        }
        .hover:hover {
            color: red; /* Màu chữ khi hover */
        }
    </style>
</head>
<body>
    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <form id="resetPasswordForm" action="/account/doimatkhau1" method="post" onsubmit="return validateForm()">
                    <div class="card">
                        <div class="card-header h5 text-white bg-success text-center">Quên Mật Khẩu</div>
                        <div class="card-body px-5">
                            <p class="card-text py-2 fw-bold fs-4 offset-2">Hãy Nhập Mật Khẩu Mới</p>
                            <div class="mb-3">
                                <label for="password" class="form-label">Mật khẩu mới:</label>
                                <input type="password" id="password" name="password" class="form-control" placeholder="Nhập mật khẩu mới" required>
                                <div id="error-messageNew" class="text-danger"></div>
                            </div>
                            
                            <div class="mb-3">
                                <label for="confirmPassword" class="form-label">Nhập lại mật khẩu mới:</label>
                                <input type="password" id="confirmPassword" name="confirmPassword" class="form-control" placeholder="Nhập lại mật khẩu mới" required>
                            <div id="error-message" class="text-danger"></div>
                            </div>
                           
                            <button type="submit" class="btn btn-outline-success w-50 offset-3">Đổi mật khẩu</button>
                            <div class="d-flex justify-content-center mt-2">
                                <a class="me-2 text-decoration-none hover" href="/views/dangnhap.jsp">Đăng nhập</a>
                                <span class="me-2">/</span>
                                <a href="/views/dangky.jsp" class="text-decoration-none hover">Đăng ký</a>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS (đặt ở cuối trang để tăng tốc tải trang) -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    <!-- JavaScript để kiểm tra mật khẩu nhập lại -->
    <script>
        function validateForm() {
            const password = document.getElementById('password').value;
            const confirmPassword = document.getElementById('confirmPassword').value;
            const errorMessage = document.getElementById('error-message');
            const errorMessageNew = document.getElementById('error-messageNew');
            
            if (password.length < 8) {
                errorMessageNew.textContent = 'Mật khẩu phải có ít nhất 8 kí tự.';
                return false;
            } 
            if (password!== confirmPassword) {
                errorMessage.textContent = 'Mật khẩu nhập lại không khớp.';
                return false;
            }
            alert("Đổi mật khẩu thành công!");
            window.location.href("index");
            return true;
        }
    </script>
</body>
</html>

