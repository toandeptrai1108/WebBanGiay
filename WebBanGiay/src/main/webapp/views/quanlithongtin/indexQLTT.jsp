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
    <link
        href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/css/bootstrap.min.css"
        rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .container {
            margin-top: 20px;
        }
        .list-group-item {
            cursor: pointer;
        }
        .card-header {
            background-color: #007bff;
            color: white;
        }
        .card {
            border: 1px solid #dee2e6;
            box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
        }
        .card-body {
            padding: 2rem;
        }
    </style>
</head>
<body>
    <div class="container light-style flex-grow-1 container-p-y">
        <h4 class="font-weight-bold py-3 mb-4 text-center">Quản lí thông tin người dùng</h4>
        <div class="card overflow-hidden">
            <div class="row no-gutters row-bordered row-border-light">
                <div class="col-md-3 pt-2 bg-light">
                    <div class="list-group list-group-flush account-settings-links ms-2 mt-5">
                        <a class="list-group-item list-group-item-action active"
                            data-toggle="list" href="/quanlithongtin/indexQLTT">Information</a>
                    </div>
                </div>
                <div class="col-md-9">
                    <div class="container mb-2">
                        <h1 class="mb-4">Chỉnh Sửa Thông Tin Người Dùng</h1>
                        <div class="card mb-2">
                            <div class="card-header">Thông Tin Chung</div>
                            <div class="card-body">
                                <jsp:include page="formThongTin.jsp" />
                            </div>
                        </div>
                        <div class="card mb-2">
                            <div class="card-header">Thông Tin Thanh Toán</div>
                            <div class="card-body">
                                <jsp:include page="/views/quanlithanhtoan.jsp"/>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script data-cfasync="false"
        src="/cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script>
    <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
    <script
        src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
