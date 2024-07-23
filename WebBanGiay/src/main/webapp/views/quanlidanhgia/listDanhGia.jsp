<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>Danh sách Slide</title>
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
        <div class="col col-sm-10 offset-sm-1 py-5">
            <div class="card">
                <div class="card-header bg-primary text-light">
                    <h1 class="text-center">
                        <i class="fa-solid fa-list"></i> Danh sách Đánh giá
                    </h1>
                </div>
                <div class="card-body p-0">
                    <table class="table table-bordered">
                        <thead>
                            <tr class="text-center">
                                <th scope="col" class="bg-info p-2 text-white">Nội dung</th>
                                <th scope="col" class="bg-info p-2 text-white">Số sao</th>
                                <th scope="col" class="bg-info p-2 text-white">Ngày đánh giá</th>
                                <th scope="col" class="bg-info p-2 text-white">Sản phẩm</th>
                                <th scope="col" class="bg-info p-2 text-white">Người dùng</th>
                                <th scope="col" class="bg-info p-2 text-white">Phản hồi</th>
                                <th colspan="3" class="bg-info p-2 text-white">Hành động</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${DSDanhGia}" var="danhGia">
                                <tr class="text-center">
                                    <td>${danhGia.noidung}</td>
                                    <td>${danhGia.sosao}</td>
                                    <td>${danhGia.ngaydanhgia}</td>
                                    <td><c:choose>
                                            <c:when test="${not empty danhGia.sanpham}">
                                                ${danhGia.sanpham.tensanpham}
                                            </c:when>
                                            <c:otherwise>
                                                <span class="text-danger">Không có sản phẩm</span>
                                            </c:otherwise>
                                        </c:choose></td>
                                    <td><c:choose>
                                            <c:when test="${not empty danhGia.user}">
                                                ${danhGia.user.ten}
                                            </c:when>
                                            <c:otherwise>
                                                <span class="text-danger">Không có người dùng</span>
                                            </c:otherwise>
                                        </c:choose></td>
                                    <td><c:choose>
                                            <c:when test="${not empty danhGia.phanhoi}">
                                                ${danhGia.phanhoi}
                                            </c:when>
                                            <c:otherwise>
                                                <span class="text-warning">Chưa có phản hồi</span>
                                            </c:otherwise>
                                        </c:choose></td>
                                    <td><a href="#"
                                        onclick="confirmDelete('${danhGia.madanhgia}')"
                                        class="btn btn-outline-danger"> <i class="fa-solid fa-x"></i>
                                            Xóa
                                    </a></td>
                                    
                                    <td><a
                                        href="${pageContext.request.contextPath}/quanlidanhgia/phanhoi/${danhGia.madanhgia}"
                                        class="btn btn-outline-success"> <i
                                            class="fa-solid fa-reply"></i> Phản hồi
                                    </a></td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
                
            </div>
        </div>
    </div>
</div>
<script>
    function confirmDelete(madanhgia) {
        if (confirm("Bạn có chắc chắn muốn xóa đánh giá này?")) {
            window.location.href = "${pageContext.request.contextPath}/danhgia/delete/"
                    + madanhgia;
        }
    }
</script>
</body>
</html>