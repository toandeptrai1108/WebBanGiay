<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
      crossorigin="anonymous"
    />
    <script src="https://kit.fontawesome.com/c5fd529f32.js" crossorigin="anonymous"></script>
<body>
    <div class="container">
    <table class="table table-bordered text-center">
        <tr>
          <th>STT</th>
          <th>Tên Người Dùng</th>
          <th>Username</th>
          <th>Email</th>  
          <th>Số Điện Thoại</th>
          <th>Ngày Sinh</th>
          <th>Giới Tính</th>
          <th>Trạng Thái</th>
          <th>Vai Trò</th>
          <th>Sửa</th>
          <th>Xóa</th>
        </tr>
        <c:forEach items="${listuser}" var="item" varStatus="loop">
        <tr>
          <td>${loop.index + 1}</td>
          <td>${item.ten}</td>
          <td>${item.username}</td>
          <td>${item.email}</td>
          <td>${item.sodienthoai}</td>
          <td>${item.ngaysinh}</td>
          <td>${item.gioitinh ? "Nam" : "Nữ"}</td>
          <td>${item.trangthai? "Còn Hoạt Động" : "Không Còn Hoạt Động"}</td>
          <td>${item.role ? "Admin" : "Khách Hàng"}</td>
          <td><a href = "/usermanager/edit/${item.manguoidung}" class="btn btn-primary"><i class="fa-solid fa-pen"></i> Edit</a></td>
          <td><a href="/deleteuser/${item.manguoidung}" class="btn btn-danger"><i class="fa-solid fa-trash"></i> Xóa</a></td>
        </tr>
        </c:forEach>
      </table>
      
      </div>



    <script
      src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
      integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
      crossorigin="anonymous"
    ></script>

    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js"
      integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+"
      crossorigin="anonymous"
    ></script>
  </body>
</html>