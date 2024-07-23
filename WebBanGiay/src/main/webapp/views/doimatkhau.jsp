<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- password-change-form.html -->
<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<head>
<title>Change Password</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<style>
    .fixed-top-left {
        position: fixed;
        top: 10px;
        left: 10px;
    }
</style>
</head>
<body>
    <div class="fixed-top-left">
        <a class="btn btn-primary" href="/index">Trang Chủ</a>
    </div>
	<div class="container">
		<div class="row justify-content-center mt-5">
			<div class="col-md-6">
				<h2 class="text-center fw-bold">Change Password: ${username}</h2>
				<form th:action="@{/change-password}" method="post"
					onsubmit="return validateForm()">
					<div class="mb-3">
						<label for="oldPassword" class="form-label">Old Password:</label>
						<input type="password" id="oldPassword" name="oldPassword"
							class="form-control" required placeholder="Mật khẩu cũ">
						<span id="oldPasswordError" class="error text-danger">${error}</span>
					</div>
					<div class="mb-3">
						<label for="newPassword" class="form-label">New Password:</label>
						<input type="password" id="newPassword" name="newPassword"
							class="form-control" required placeholder="Nhập mật khẩu mới">
							<span id="newPasswordError" class="error text-danger">${errorNew}</span>
					</div>

					<div class="mb-3">
						<label for="confirmNewPassword" class="form-label">Confirm
							New Password:</label> <input type="password" id="confirmNewPassword"
							name="confirmNewPassword" class="form-control" required
							placeholder="Nhập lại mật khẩu mới">
							<span id="confirmNewPasswordError" class="error text-danger"></span>
					</div>
					<span class="message text-success">${message}</span>
					<button type="submit" class="btn btn-primary float-left">Change
						Password</button>
					<br>
				</form>
			</div>
		</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
	<script type="text/javascript">
        function validateForm() {
            // Get form elements and error spans
            const oldPassword = document.getElementById('oldPassword');
            const newPassword = document.getElementById('newPassword');
            const confirmNewPassword = document.getElementById('confirmNewPassword');
            const oldPasswordError = document.getElementById('oldPasswordError');
            const newPasswordError = document.getElementById('newPasswordError');
            const confirmNewPasswordError = document.getElementById('confirmNewPasswordError');

            // Clear existing error messages
            oldPasswordError.textContent = "";
            newPasswordError.textContent = "";
            confirmNewPasswordError.textContent = "";

            // Validate and update error spans
            let errorMessage = "";

            if (oldPassword.value === "") {
                errorMessage += "Mật khẩu không được bỏ trống.\n";
                oldPasswordError.textContent = "Mật khẩu không được bỏ trống.";
            }

            if (newPassword.value === "") {
                errorMessage += "Mật khẩu mới không được bỏ trống.\n";
                newPasswordError.textContent = "Mật khẩu mới không được bỏ trống.";
            } else if (newPassword.value.length < 8) {
                errorMessage += "Mật khẩu mới phải đủ 8 kí tự.\n";
                newPasswordError.textContent = "Mật khẩu mới phải đủ 8 kí tự.";
            }

            if (confirmNewPassword.value !== newPassword.value) {
                errorMessage += "Mật khẩu mới và xác nhận không trùng nhau.\n";
                confirmNewPasswordError.textContent = "Mật khẩu mới và xác nhận không trùng nhau.";
            }

            // Display error message if any
            if (errorMessage !== "") {
                return false; // Prevent form submission if errors exist
            }

            // Form is valid, submit it
            return true;
        }
	</script>

</body>
</html>
