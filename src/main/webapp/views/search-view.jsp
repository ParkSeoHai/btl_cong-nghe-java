<%@page import="java.time.LocalDateTime"%>
<%@page import="models.BaiViet"%>
<%@page import="java.util.ArrayList"%>
<%@page import="services.BaiVietService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Trang chủ</title>
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
	  <%@include file="/assets/css/home.css" %>
	</style>
</head>
<body>
	<%
		BaiVietService baiVietService = new BaiVietService();
	%>
	<!-- Import header -->
	<%@include file="/views/header.jsp" %>
	
	<main class="container">
		<h1 style="font-size: 2.4rem; color: black;">Tìm kiếm</h1></br>
		
		<%
				ArrayList<BaiViet> baiViets = (ArrayList<BaiViet>) request.getAttribute("BaiViets");
					for (BaiViet baiViet : baiViets) {
						out.print("<div class='item-news'>");
						out.print("<h3 class='title line-clamp-3'>");
						out.print("<a href=''>" + baiViet.getTitle() + "</a>");
						out.print("</h3>");
						out.print("<div class='d-flex'>");
						out.print("<div class='thumb-art'>");
						out.print("<a href=''>");
						out.print("<img alt='" + baiViet.getTitle() + "' src='" + baiViet.getImage() + "'</a>");
						out.print("</div>");
						out.print("<p class='desc'");
						out.print("<a href=''>" + baiViet.getDescription() + "</a>");
						if (baiViet.getBinhLuans().size() > 0) {
                            out.print("<a href='' class='count-cmt'>");
							out.print("<i class='bi bi-chat-fill icon'></i>");
							out.print("<span class='ms-2'>" + baiViet.getBinhLuans().size() + "</span>");
							out.print("</a>");
                            }
							out.print("</p>");
							out.print("</div>");
							out.print("</div>");
							}
		%>
	</main>
	
	<div style="height: 100px"></div>
	<!-- Import footer -->
	<%@include file="/views/footer.jsp" %>
</body>
</html>