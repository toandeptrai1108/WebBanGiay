<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>Chỉnh sửa thông tin sinh viên</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous" />
<script src="https://kit.fontawesome.com/446a91b231.js"
	crossorigin="anonymous"></script>
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col col-sm-8 offset-sm-2 py-5">
            <div class="card">
                <div class="card-header bg-primary text-light text-center">PHẢN HỒI ĐÁNH GIÁ</div>
                <div class="card-body">
                    <form:form method="post" action="/quanlidanhgia/updatePhanHoi" modelAttribute="danhGia">
                        <form:hidden path="madanhgia" />
                        
                        <div class="mb-3">
                            <label for="phanhoi" class="form-label">Phản hồi</label>
                            <form:textarea path="phanhoi" class="form-control" id="phanhoi" />
                            <form:errors path="phanhoi" cssClass="text-danger" />
                        </div>
                        <div class="d-grid">
                            <button type="submit" class="btn btn-primary">Gửi phản hồi</button>
                        </div>
                    </form:form>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
