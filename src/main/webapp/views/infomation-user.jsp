<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ThongTinNguoiDung</title>
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
		<%@include file="/assets/css/infomation-user.css" %>
	</style>
</head>
<body>
	<%@include file="/views/header.jsp" %>
	
	<main class="container">
		<div class="main-content row d-flex">
			<div class="menu-info col-3">
				<div class="avatar-user row d-flex align-items-center">
					<div class="img-avartar">
						<img class="" alt="" src="/btl_docbao/assets/images/Logo.png">
					</div>
					<div class="name-user">
						<span class=""><%
							out.print("<span>" + email + "</span>");	
						%></span>
					</div>
				</div>
			</div>
			<div class="infomation-content col-9">
				2
			</div>
		</div>
	</main>

	<div style="height: 100px"></div>
	<!-- Import footer -->
	<%@include file="/views/footer.jsp" %>
</body>
</html>