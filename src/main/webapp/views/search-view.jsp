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
		<h1 style="color:#222;font-family:Merriweather;font-size:24px;font-weight:700;line-height:38.4px;margin:30px 0px 15px;">Tìm kiếm</h1></br>
		<%
			String title = (String) request.getAttribute("name");
			ArrayList<BaiViet> baiViets = (ArrayList<BaiViet>) baiVietService.GetBaiVietsWithName(15, "'%"+title+"%'");
			if(baiViets.size() == 0){
				out.print("<h2>Không tìm thấy thông tin khả dụng!</h2>");
			}else{
				for (BaiViet baiViet : baiViets) {
					out.print("<div class='row baiviet-content'>");
					out.print("<div class='col-9 info-baiviet'>");
					out.print("<h3><a href='/btl_docbao/views/baiviet.jsp?id=" + baiViet.getId() + "'>" + baiViet.getTitle() + "</a></h3>");
					out.print("<h5>" + baiViet.getDescription() + "</h5>");
					if (baiViet.getBinhLuans().size() > 0){
						out.print("<i class='bi bi-chat-fill icon'></i>");
						out.print("<span>" + baiViet.getBinhLuans().size() + "</span>");
					}
					out.print("</div>");
					out.print("<div class='col-3 img-baiviet'>");
					out.print("<img alt='" + baiViet.getTitle() + "' src='" + baiViet.getImage() + "'</a>");
					out.print("</div>");
					out.print("</div>");
				}
			}
			%>
	</main>
	
	<div style="height: 100px"></div>
	<!-- Import footer -->
	<%@include file="/views/footer.jsp" %>
</body>
</html>