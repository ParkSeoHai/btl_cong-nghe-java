<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
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
</head>
<body>
	<%@include file="/views/header.jsp" %>
	<main>
		<div class="container">
			<div class="block-login">
				<div class="tabs-header d-flex align-items-center">
					<p class="tab-item" tab="login" onclick="changeTab('login')">Đăng nhập</p>
					<p class="tab-item" tab="register" onclick="changeTab('register')">Tạo tài khoản</p>
				</div>
				<!-- Login -->
				<div class="tab-content" tab-content="login">
					<div class="tab-content__block">
						<!-- Left -->
						<div class="tab-content__left">
							<form action="/btl_docbao/LoginAction" method="post" class="form" id="form_login">
								<p class="title">Đăng nhập với email</p>
								<%
									String errorLogin = (String) request.getAttribute("errorLogin");
                                    if (errorLogin != null) {
                                    	out.print("<span class='error-server'>" + errorLogin + "</span>");
                                    }
								%>
								<div class="form-group">
									<input type="email" class="form-control" id="email" name="email_login" placeholder="Email">
									<span class="mess-error mess-error__email"></span>
								</div>
								<div class="form-group">
									<div class="form-password">
										<input type="password" class="form-control" id="password_login" name="password_login" placeholder="Mật khẩu">
										<span><i class="bi bi-eye-fill icon hide-password__icon--login" onclick="showPasswordLogin()"></i></span>
										<span><i class="bi bi-eye-slash-fill icon show-password__icon--login d-none" onclick="showPasswordLogin()"></i></span>
									</div>
									<span class="mess-error mess-error__password"></span>
								</div>
								<div class="form-group">
									<button
										type="submit"
										class="btn btn-primary btn-submit"
										onclick="submitFormLogin(event)"
									>Đăng nhập</button>
								</div>
								<div>
									<a href="#" class="text-forgot__pass">Lấy lại mật khẩu</a>
								</div>
							</form>
						</div>
						<!-- Right -->
						<div class="tab-content__right">
							<p class="title">Đăng nhập với</p>
							<div class="social">
								<button class="btn btn-primary btn-social"> <i
									class="bi bi-facebook icon"></i> Facebook
								</button>
								<button class="btn btn-primary btn-social"> <i
									class="bi bi-google icon"></i> Google
								</button>
							</div>
						</div>
					</div>
					<!-- Bottom -->
					<div class="tab-content__bottom">
						<p class="">Bạn đăng nhập là đồng ý với điều khoản sử dụng và chính sách bảo mật
							& được bảo vệ bởi reCAPTCHA
						</p>
					</div>
				</div>
				<!-- Register -->
				<div class="tab-content d-none" tab-content="register">
					<div class="tab-content__block">
						<!-- Left -->
						<div class="tab-content__left">
							<form action="/btl_docbao/RegisterAction" method="post" class="form" id="form_register">
								<p class="title">Tạo tài khoản
									Để sử dụng đầy đủ tính năng đọc báo và tham gia
									cộng đồng hơn 8 triệu thành viên</p>
								<%
									String errorRegister = (String) request.getAttribute("errorRegister");
                                    if (errorRegister != null) {
                                    	out.print("<span class='error-server'>" + errorRegister + "</span>");
                                    }
								%>
								<div class="form-group">
									<input type="email" class="form-control" id="email_register" name="email_register" placeholder="Email">
									<span class="mess-error mess-error__email"></span>
								</div>
								<div class="form-group">
									<div class="form-password">
										<input type="password" class="form-control" id="password_register" name="password_register" placeholder="Mật khẩu">
										<span><i class="bi bi-eye-fill icon hide-password__icon--register" onclick="showPasswordRegister()"></i></span>
										<span><i class="bi bi-eye-slash-fill icon show-password__icon--register d-none" onclick="showPasswordRegister()"></i></span>
									</div>
									<span class="mess-error mess-error__password"></span>
								</div>
								<div class="form-group">
									<input type="password" class="form-control" id="confirm_password" placeholder="Xác nhận mật khẩu">
									<span class="mess-error mess-error__confirm-password"></span>
								</div>
								<div class="form-group">
									<button type="submit" class="btn btn-primary btn-submit" onclick="submitFormRegister(event)">Tạo tài khoản</button>
								</div>
							</form>
						</div>
						<!-- Right -->
						<div class="tab-content__right">
							<p class="title">Tạo tài khoản với</p>
							<div class="social">
								<button class="btn btn-primary btn-social"> <i
									class="bi bi-facebook icon"></i> Facebook
								</button>
								<button class="btn btn-primary btn-social"> <i
									class="bi bi-google icon"></i> Google
								</button>
							</div>
						</div>
					</div>
					<!-- Bottom -->
					<div class="tab-content__bottom">
						<p class="">Bạn tạo tài khoản là đồng ý với điều khoản sử dụng và chính sách bảo mật
							& được bảo vệ bởi reCAPTCHA
						</p>
					</div>
				</div>
			</div>
		</div>
	</main>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/assets/js/login_register.js">
	</script>
	<!-- If register error then active tab register -->
	<%
		if (errorRegister != null) {
			out.print("<script>changeTab('register')</script>");
	    }
	%>
</body>
</html>