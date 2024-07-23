<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Quản lí thông tin người dùng</title>
<link rel="stylesheet" href="assets/css/admin.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
    /* Custom CSS styles */
    .container {
        padding-top: 10px;
    }
    .card {
        margin-bottom: 20px;
    }
    .account-settings-links {
        padding-top: 10px;
    }
</style>
</head>
<body>
    <div class="container">
        <h1 class="mb-4 offset-4">Quản lý Địa Chỉ Giao Hàng</h1>
        <div class="card">
            <div class="row no-gutters">
                <div class="col-md-3">
                    <div class="list-group account-settings-links">
                        <a class="list-group-item list-group-item-action active"
                            data-toggle="list" href="#account-general">General</a>
                    </div>
                </div>
                <div class="col-md-9">
                    <div class="container mb-4">
                        <div class="card mb-4">
                            <jsp:include page="formDiaChi.jsp" />
                        </div>
                        <div class="card mb-4">
                            <jsp:include page="tableDiaChi.jsp" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
	