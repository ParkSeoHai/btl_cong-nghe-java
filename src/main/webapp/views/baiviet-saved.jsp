<%@page import="services.BaiVietService"%>
<%@page import="models.User"%>
<%@page import="services.UserService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>Bài viết đã lưu</title>
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
	<%@include file="/views/header.jsp" %>
	
	<%
		UserService userService = new UserService();
	    BaiVietService baiVietService = new BaiVietService();
	    
	    
	    var user = userService.getUser(email);
	    var bvSaved = baiVietService.GetBaiVietSaved(user.getId());
	%>
	<main class="d-flex justify-content-center">
		<div class="main-content row">
			<div class="left-content col-3">
				<div class="menu-user">
					<div class="info-user d-flex align-items-center">
						<div class="avt-user">
							<%
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
								<li><a href="/btl_docbao/views/Infomation-user.jsp">Thông tin chung</a></li>
								<li><a href="">Ý kiến của bạn</a></li>
								<li><a href="">Mục đã xem</a></li>
								<li><a href="" style="color: black;">Mục đã lưu</a></li>
								<li><a href="">Thoát <i class="bi bi-box-arrow-right"></i></a></li>
							</ul>
					</div>
				</div>
				<div class="contact">
				 	<span>Cần hỗ trợ, vui lòng liên hệ:</span></br>
				 	<a style="color: #074D94;" href="">vanhai@gmail.com</a>
				</div>
			</div>
			<div class="right-content col-9">
				<h1>Tin đã lưu</h1>
				<div>
					<%
						for (var bv : bvSaved) {
							out.print("<div class='item row mb-4'>");
							out.print("<div class='col-4'>");
							out.print("<img src='" + bv.getImage() + "' alt='" + bv.getTitle() + "'>");
							out.print("</div>");
							out.print("<div class='col-8'>");
							out.print("<h2 style='line-height: 25px;'>");
							out.print("<a href='/btl_docbao/views/baiviet.jsp?id=" + bv.getId() + "'>" + bv.getTitle() + "</a>");
							out.print("</h2>");
							out.print("<div class='bottom d-flex justify-content-between align-items-center mt-4'>");
							out.print("<div class='time'>");
							out.print("<span class='fs-5' style='color: #9f9f9f;'>" + bv.getCreateDate() + "</span>");
							out.print("</div>");
							out.print("<div class='action d-flex'>");
							out.print("<a href='/btl_docbao/views/baiviet.jsp?id=" + bv.getId() + "' class='count-cmt me-3'>");
							out.print("<i class='bi bi-chat icon'></i>");
							out.print("<span class='ms-2'>" + bv.getCommentCount() + "</span>");
							out.print("</a>");
							out.print("<div onclick='removeSaveBaiViet(" + user.getId() + ", " + bv.getId() + ")'>");
							out.print("<i class='bi bi-bookmark-fill' style='color: #9F224E; cursor: pointer;'></i>");
							out.print("</div>");
							out.print("</div>");
							out.print("</div>");
							out.print("</div>");
							out.print("</div>");
							
						}
					%>
					<!-- <div class="item row">
						<div class="col-4">
							<img
								src="https://i1-vnexpress.vnecdn.net/2024/06/29/db0166afb9fb1ba542ea-171962576-4911-6861-1719625828.jpg?w=180&h=108&q=100&dpr=1&fit=crop&s=jtWDibEWiUeE713ENQgvvg"
								alt="Ảnh bài viết">
						</div>
						<div class="col-8">
							<h2>
								<a href="">Bài viết 1</a>
							</h2>
							<div class="bottom d-flex justify-content-between align-items-center mt-4">
								<div class="time">
									<span class="fs-5" style="color: #9f9f9f;">2 giờ trước</span>
								</div>
								<div class="action d-flex">
									<a href="" class="count-cmt me-3">
										<i class="bi bi-chat icon"></i>
										<span>117</span>
									</a>
									<div onclick="removeSaveBaiViet()">
										<i class="bi bi-bookmark-fill" style="color: #9F224E; cursor: pointer;"></i>
									</div>
								</div>
							</div>
						</div>
					</div> -->
				</div>
			</div>
		</div>
	</main>
	<!-- Import footer -->
	<%@include file="/views/footer.jsp" %>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/assets/js/baiviet.js">
	</script>
</body>
</html>