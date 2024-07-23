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


<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quên mật khẩu</title>
    <script>
        function showMessage(message) {
            if (message) {
                alert(message);
            }
        }
    </script>
</head>
<body>
    <h1>Quên mật khẩu</h1>
    
    <!-- Form quên mật khẩu -->
    <form id="quenMatKhauForm" action="/quenmatkhau" method="post">
        <label for="email">Email:</label>
        <input type="email" id="email" name="email" required>
        
        <label for="password">Mật khẩu:</label>
        <input type="password" id="password" name="password" required>
        
        <button type="submit">Quên mật khẩu</button>
    </form>
    
    <script>
        // Lấy thông báo từ server nếu có
        const message = /*[[${message}]]*/ '';
        
        // Hiển thị thông báo nếu có
        showMessage(message);

        // Thêm sự kiện để hiển thị thông báo khi nhấn nút submit
        document.getElementById('quenMatKhauForm').addEventListener('submit', function(event) {
            event.preventDefault();
            showMessage("Đang xử lý yêu cầu của bạn...");
            this.submit();
        });
    </script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
		integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
		crossorigin="anonymous"></script>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js"
		integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+"
		crossorigin="anonymous"></script>
<!-- 	<script type="text/javascript">
	const inputs = document.querySelectorAll(".otp-field > input");
	const button = document.querySelector(".btn");

	window.addEventListener("load", () => inputs[0].focus());
	button.setAttribute("disabled", "disabled");

	inputs[0].addEventListener("paste", function (event) {
	  event.preventDefault();

	  const pastedValue = (event.clipboardData || window.clipboardData).getData(
	    "text"
	  );
	  const otpLength = inputs.length;

	  for (let i = 0; i < otpLength; i++) {
	    if (i < pastedValue.length) {
	      inputs[i].value = pastedValue[i];
	      inputs[i].removeAttribute("disabled");
	      inputs[i].focus;
	    } else {
	      inputs[i].value = ""; // Clear any remaining inputs
	      inputs[i].focus;
	    }
	  }
	});

	inputs.forEach((input, index1) => {
	  input.addEventListener("keyup", (e) => {
	    const currentInput = input;
	    const nextInput = input.nextElementSibling;
	    const prevInput = input.previousElementSibling;

	    if (currentInput.value.length > 1) {
	      currentInput.value = "";
	      return;
	    }

	    if (
	      nextInput &&
	      nextInput.hasAttribute("disabled") &&
	      currentInput.value !== ""
	    ) {
	      nextInput.removeAttribute("disabled");
	      nextInput.focus();
	    }

	    if (e.key === "Backspace") {
	      inputs.forEach((input, index2) => {
	        if (index1 <= index2 && prevInput) {
	          input.setAttribute("disabled", true);
	          input.value = "";
	          prevInput.focus();
	        }
	      });
	    }

	    button.classList.remove("active");
	    button.setAttribute("disabled", "disabled");

	    const inputsNo = inputs.length;
	    if (!inputs[inputsNo - 1].disabled && inputs[inputsNo - 1].value !== "") {
	      button.classList.add("active");
	      button.removeAttribute("disabled");

	      return;
	    }
	  });
	});
	function logInputValues() {
		let xacnhanotp = "";
	    const inputValues = [];
	    inputs.forEach((input) => {
	      inputValues.push(input.value);
	    });
	    xacnhanotp= inputValues.join("");
	    console.log(xacnhanotp); // log the input numbers as a single string
	    
	    //Gửi cho Post
	    fetch('/account/quenmatkhau/kiemtraotp', {
	        method: 'POST',
	        headers: {
	          'Content-Type': 'application/json'
	        },
	        body: JSON.stringify({ otp: xacnhanotp })
	     })
	     .then(response => response.text())
	     .then(data => console.log(data));
	 }
	</script> -->
</body>

</html>