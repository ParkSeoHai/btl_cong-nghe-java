<%@page import="services.UserService"%>
<%@page import="models.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ThongTin</title>
<!-- Bootstrap -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
	<style type="text/css">
	  <%@include file="/assets/css/reset.css" %>
	</style>
	<style type="text/css">
	  <%@include file="/assets/css/style.css" %>
	</style>
	<style type="text/css">
	  <%@include file="/assets/css/login.css" %>
	</style>
	<style type="text/css">
		<%@include file="/assets/css/Infomation-user.css" %>
	</style>
</head>
<body>
	<% UserService userService = new UserService(); %>
	<%@include file="/views/header.jsp" %>
	<main class="d-flex justify-content-center">
		<div class="main-content row">
			<div class="left-content col-3">
				<div class="menu-user">
					<div class="info-user d-flex align-items-center">
						<div class="avt-user">
							<%
							User user = userService.getUser(email);
							if(user.getImage() != null){
								out.print("<img alt='" + user.getName() + "' src='" + user.getImage() + "'</a>");
							}
							%>
						</div>
						<div class="name-user">
							<span>
								<%
									if(user.getName() != null){
										out.print(user.getName());
									}
								%>
							</span>
							<p>
								<%
								
								if(user.getCreateDate() != null){
								out.print("Tham gia từ " +user.getCreateDate());
								}
								%>
							</p>
						</div>
					</div>
					<div class="navbar-info">
							<ul>
								<li><a href="/btl_docbao/views/Infomation-user.jsp" style="color: black;" href="">Thông tin chung</a></li>
								<li><a href="/btl_docbao/views/baiviet-saved.jsp">Mục đã lưu</a></li>
								<li><a href="/btl_docbao/logout">Thoát <i class="bi bi-box-arrow-right"></i></a></li>
							</ul>
					</div>
				</div>
				<div class="contact">
				 	<span>Cần hỗ trợ, vui lòng liên hệ:</span></br>
				 	<a style="color: #074D94;" href="">vanhai@gmail.com</a>
				</div>
			</div>
			<div class="right-content col-9">
				<h1>Thông tin tài khoản</h1>
				
				<!-- anh dai dien -->
				
				<div class="info-user-content avt-user-edit">
					<div class="head-edit d-flex justify-content-between">
						<span>Ảnh đại diện</span>
						<p class="btn-editImg">Thay ảnh đại diện</p>
					</div>
					<div class="avt-content">
						<%
							if(user.getImage() != null){
								out.print("<img alt='" + user.getName() + "' src='" + user.getImage() + "'</a>");
							}else{
								out.print("Chưa có dữ liệu");
							}
						%>
					</div>
					<form action="/btl_docbao/ChangeAvatarAction" class="form-edit Edit-Avatar d-none" method="get">
						<h2>Nhập url ảnh</h2>
						<input type="text" name="Avatar" placeholder="Nhập url..."></br>
						<button type="submit">Đổi ảnh</button>
					</form>
				</div>
				
				<!-- email -->
				
				<div class="info-user-content avt-user-edit">
				<p style="font-size: 1.4rem;" class="text-danger">${emailExistsMessage}</p>
					<div class="head-edit d-flex justify-content-between">
						<span>Email</span>
						<p class="btn-editEmail">Thay đổi email</p>
					</div>
					<span class="emailContent">
						<%
							if(email != null){
								out.print(email);
							}else{
								out.print("Chưa có dữ liệu");
							}

						%>
					</span>
					<form action="/btl_docbao/ChangeEmailAction" class="form-edit Edit-Email d-none" method="get">
						<h2>Nhập email</h2>
						<input type="text" name="Email" placeholder="Nhập email..."></br>
						<button type="submit">Đổi Email</button>
					</form>
				</div>
				
				<!-- Password -->
				
				<div style="border: none;" class="info-user-content avt-user-edit">
					<p style="font-size: 1.4rem;" class="text-danger">${PassInvalid}</p>
					<p style="font-size: 1.4rem;" class="text-danger">${PassInvalid2}</p>
					<div class="head-edit d-flex justify-content-between">
						<span>Mật khẩu</span>
						<p class="btn-editPassword">Thay đổi mật khẩu</p>
					</div>
				</div>
				<form action="/btl_docbao/ChangePasswordAction" class="form-edit Edit-Password d-none" method="get">
						<h2>Nhập Mật khẩu</h2>
						<input type="text" name="Password" placeholder="Nhập mật khẩu..."></br></br>
						<h2>Xác nhận mật khẩu</h2>
						<input type="text" name="ConfirmPass" placeholder="Xác nhận mật khẩu..."></br>
						<button type="submit">Đổi mật khẩu</button>
					</form>
				
				<h1>Thông tin tài khoản</h1>
				
				<!-- Ho ten -->
				<div class="info-user-content avt-user-edit">
					<div class="head-edit d-flex justify-content-between">
						<span>Họ tên</span>
						<p class="btn-editName">Thay đổi họ tên</p>
					</div>
					<span class="name-content">
						<%
							if(user.getName() != null){
								out.print(user.getName());
							}else{
								out.print("Chưa có dữ liệu");
							}
						%>
					</span>
					<form action="/btl_docbao/ChangeNameAction" class="form-edit Edit-Name d-none" method="get">
						<h2>Nhập họ tên</h2>
						<input type="text" name="Name" placeholder="Nhập họ và tên"></br>
						<button type="submit">Đổi tên</button>
					</form>
				</div>
				
				<!-- Ngay sinh -->
				
				<div class="info-user-content avt-user-edit">
					<div class="head-edit d-flex justify-content-between">
						<span>Ngày sinh</span>
						<p class="btn-editBirthday">Thay đổi ngày sinh</p>
					</div>
					<span class="birthdayContent">
						<%
							if(user.getBirthday() != null){
								out.print(user.getBirthday());
							}else{
								out.print("Chưa có dữ liệu");
							}
						%>
					</span>
					 <form action="/btl_docbao/ChangeBirthdayAction" method="get" class="form-edit Edit-Birthday d-none">
				        <label for="day">Ngày</label>
				        <input type="text" id="day" name="day" placeholder="Day" required><br><br>
				        
				        <label for="month">Tháng:</label>
				        <input type="text" id="month" name="month" placeholder="Month" required><br><br>
				        
				        <label for="year">Năm:</label>
				        <input type="text" id="year" name="year" placeholder="Year" required><br><br>
				        
				        <button type="submit">Đổi ngày sinh</button>
				    </form>
				</div>
				
				<!-- Gioi tinh -->
				
				<div class="info-user-content avt-user-edit">
					<div class="head-edit d-flex justify-content-between">
						<span>Giới tính</span>
						<p class="btn-editGender">Thay đổi giới tính</p>
					</div>
					<span class="genderContent">
						<%	
							int gioitinh = user.getGender();
							if(gioitinh == 0){
								out.print("Nam");
							}else if(gioitinh == 1){
								out.print("Nữ");
							}
							else{
								out.print("Chưa có dữ liệu");
							}
						%>
					</span>
					<form action="/btl_docbao/ChangeGenderAction" class="form-edit Edit-Gender d-none" method="get">
						<h2>Chọn giới tính</h2>
						<input type="radio" id="male" name="gender" value="0">
				        <label for="male">Nam</label><br>
				        <input type="radio" id="female" name="gender" value="1">
				        <label for="female">Nữ</label><br>
						<button type="submit">Đổi giới tính</button>
					</form>
				</div>
				
				<!-- Sdt -->
				
				<div class="info-user-content avt-user-edit">
					<div class="head-edit d-flex justify-content-between">
						<span>Số điện thoại</span>
						<p class="btn-editNumberphone">Thay đổi số điện thoại</p>
					</div>
					<span class="numberphoneContent">
						<%
							if(user.getPhoneNumber() != null){
								out.print(user.getPhoneNumber());
							}else{
								out.print("Chưa có dữ liệu");
							}
						%>
					</span>
					<form action="/btl_docbao/ChangeNumberphoneAction" class="form-edit Edit-Numberphone d-none" method="get">
						<h2>Nhập số điện thoại</h2>
						<input type="text" name="numberPhone" placeholder="Nhập số điện thoại..."></br>
						<button type="submit">Đổi số điện thoại</button>
					</form>
				</div>
				
				<!-- DiaChi -->
				
				<div style="border: none;" class="info-user-content avt-user-edit">
					<div class="head-edit d-flex justify-content-between">
						<span>Địa chỉ</span>
						<p class="btn-editAddress">Thay đổi địa chỉ</p>
					</div>
					<span class="addressContent">
						<%
							if(user.getAddress() != null){
								out.print(user.getAddress());
							}else{
								out.print("Chưa có dữ liệu");
							}
						%>
					</span>
					<form action="/btl_docbao/ChangeAddressAction" class="form-edit Edit-Address d-none" method="get">
						<h2>Nhập địa chỉ</h2>
						<input type="text" name="Address" placeholder="Nhập địa chỉ..."></br>
						<button type="submit">Đổi địa chỉ</button>
					</form>
				</div>
			</div>
		</div>
	</main>
	<script type="text/javascript">
	document.querySelector(".btn-editName").onclick = function(){
		const btnEdit = document.querySelector(".Edit-Name");
		btnEdit.classList.toggle('d-none');
		const nameContent = document.querySelector(".name-content");
		nameContent.classList.toggle('d-none');
		};
	document.querySelector(".btn-editGender").onclick = function(){
		document.querySelector(".Edit-Gender").classList.toggle('d-none');
		document.querySelector(".genderContent").classList.toggle('d-none');
		}
	document.querySelector(".btn-editBirthday").onclick = function(){
		document.querySelector(".Edit-Birthday").classList.toggle('d-none');
		document.querySelector(".birthdayContent").classList.toggle('d-none');
		}
	document.querySelector(".btn-editNumberphone").onclick = function(){
		document.querySelector(".Edit-Numberphone").classList.toggle('d-none');
		document.querySelector(".numberphoneContent").classList.toggle('d-none');
		}
	document.querySelector(".btn-editAddress").onclick = function(){
		document.querySelector(".Edit-Address").classList.toggle('d-none');
		document.querySelector(".addressContent").classList.toggle('d-none');
		}
	document.querySelector(".btn-editImg").onclick = function(){
		document.querySelector(".Edit-Avatar").classList.toggle('d-none');
		document.querySelector(".avt-content").classList.toggle('d-none');
		}
	document.querySelector(".btn-editEmail").onclick = function(){
		document.querySelector(".Edit-Email").classList.toggle('d-none');
		document.querySelector(".emailContent").classList.toggle('d-none');
		}
	document.querySelector(".btn-editPassword").onclick = function(){
		document.querySelector(".Edit-Password").classList.toggle('d-none');
		}
	</script>
	<%@include file="/views/footer.jsp" %>
</body>
</html>