<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="assets/css/admin.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
</head>
<body>
	<div class="container light-style flex-grow-1 container-p-y">
		<h4 class="font-weight-bold py-3 mb-4">Quản lí thông tin cá nhân</h4>
		<div class="card overflow-hidden">
			<div class="row no-gutters row-bordered row-border-light">
				<div class="col-md-3 pt-0">
					<div class="list-group list-group-flush account-settings-links">
						<a class="list-group-item list-group-item-action active"
							data-toggle="list" href="#account-general">General</a> <a
							class="list-group-item list-group-item-action" data-toggle="list"
							href="#account-info">Information</a>
					</div>
				</div>
				<div class="col-md-9">
					<div class="tab-content">
						<div class="tab-pane fade active show" id="account-general">
							<div class="card-body media align-items-center">
								<img src="https://bootdey.com/img/Content/avatar/avatar1.png"
									alt class="d-block ui-w-80">
								<div class="media-body ml-4">
									<label class="btn btn-outline-primary"> Upload new
										photo <input type="file" class="account-settings-fileinput">
									</label> &nbsp;
									<div>
										Trạng thái: <span class="text-primary">Active</span>
									</div>
									<div class="text-light small mt-1">Allowed JPG, GIF or
										PNG. Max size of 800K</div>
								</div>
							</div>
							<hr class="border-light m-0">
							<div class="card-body">
								<div class="form-group">
									<label class="form-label">Username</label> <input type="text"
										class="form-control mb-1" placeholder="Username">
								</div>
								<div class="form-group">
									<label class="form-label">Name</label> <input type="text"
										class="form-control" placeholder="Tên người dùng">
								</div>
								<div class="form-group">
									<label class="form-label">Email</label> <input type="email"
										class="form-control mb-1" placeholder="Email">
								</div>
							</div>
						</div>
						<div class="tab-pane fade" id="account-info">
							<div class="card-body pb-2">
								<div class="form-group">
									<label class="form-label">Ngày Sinh</label> <input type="date"
										class="form-control" placeholder="Ngày Sinh">
								</div>
							</div>
							<hr class="border-light m-0">
							<div class="card-body pb-2">
								<h6 class="mb-4">Liên Hệ</h6>
								<div class="form-group">
									<label class="form-label">Số Điện Thoại</label> <input
										type="text" class="form-control" placeholder="Số điện thoại">
								</div>
								<div class="form-group">
									<label class="form-label">Vai Trò</label> <select id=""
										class="form-select form-control" disabled>
										<option selected>Khách Hàng</option>
										<option>Admin</option>
									</select>
								</div>
							</div>
						</div>
						<div class="text-right mt-3 mb-3">
							<button type="button" class="btn btn-primary">Save
								changes</button>
							&nbsp;
							<button type="button" class="btn btn-default">Cancel</button>
						</div>
					</div>
					<script data-cfasync="false"
						src="/cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script>
					<script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
					<script
						src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>