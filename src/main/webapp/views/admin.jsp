<%@page import="services.TheLoaiService"%>
<%@page import="services.UserService"%>
<%@page import="models.BaiViet"%>
<%@page import="java.util.ArrayList"%>
<%@page import="services.BaiVietService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>Quản lý bài viết</title>
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
<body class="body-admin-manage">
	<%
		BaiVietService baiVietService = new BaiVietService();
		UserService userService = new UserService();
		TheLoaiService theLoaiService = new TheLoaiService();
		
		var email = (String) session.getAttribute("email");
		var user = userService.getUser(email);
		
		/* Search */
		var search = request.getParameter("search");
		ArrayList<BaiViet> baiViets = null;
		if (search != null) {
            baiViets = baiVietService.GetBaiVietsWithName(15, "'%"+search+"%'");
        } else {
            baiViets = baiVietService.GetBaiViets();
        }
	%>
	<header class="header-admin d-flex justify-content-around align-items-center">
		<h1>Quản lý bài viết</h1>
		<div class="input-group">
			<input class="input search-input" type="text" placeholder="Tìm kiếm..." >
			<button type="button" class="button--submit" onclick="SearchBaiviet()">Tìm kiếm</button>
		</div>
		<span style="width: 200px; text-align: right;">Hello, <%= user.getName() %></span>
	</header>
	<main class="main-admin-content">
		<div class="d-flex justify-content-between align-items-center">
			<h1 class="">Danh sách bài viết</h1>
			<a href="/btl_docbao/views/addBaiviet.jsp" class="btn-add-bv button">
			    Thêm bài viết
			</a>
		</div>
		<div class="table-bv">
			<table class="table table-hover">
		  <thead>
		    <tr class="">
		      <th scope="col">ID</th>
		      <th scope="col">Đề Mục</th>
		      <th scope="col">Ảnh</th>
		      <th scope="col">Mô tả</th>
		      <th scope="col">Tác giả</th>
		      <th scope="col">Ngày tạo</th>
		      <th scope="col">Thể loại</th>
		      <th scope="col">Thao tác</th>
		    </tr>
		  </thead>
		  <tbody>
		      <%
					for (BaiViet baiViet : baiViets) {
						out.print("<tr>");
						out.print(" <td class='d-table-cell align-middle' scope='row'>"+baiViet.getId()+"</td>");
						out.print(" <td class='d-table-cell align-middle'>"+baiViet.getTitle()+"</td>");
						out.print(" <td class='d-table-cell align-middle' style='width: 100px;'><img style='width: 50px; height: 50px; object-fit:cover;' src='"+baiViet.getImage()+"' alt='"+baiViet.getTitle()+"'></td>");
						out.print(" <td class='d-table-cell align-middle'>"+baiViet.getDescription()+"</td>");
						out.print(" <td class='d-table-cell align-middle' style='min-width: 100px;'>"+baiViet.getAuthor()+"</td>");
						out.print(" <td class='d-table-cell align-middle' style='min-width: 150px;'>"+baiViet.getCreateDate()+"</td>");
						
						// Get the loai tin / the loai
						var theLoaiTin = theLoaiService.getTheLoaiTinById(baiViet.getIdTheLoaiTin());
						var theLoai = theLoaiService.getTheLoaiById(theLoaiTin.getIdTheLoai());
						out.print(" <td class='d-table-cell align-middle' style='min-width: 100px;'>"+ theLoai.getName() + " / " + theLoaiTin.getName() +"</td>");
						
						out.print("<td class='d-table-cell align-middle text-center' style='min-width: 150px;'>");
						out.print("<a class='btn-edit' href='/btl_docbao/views/updateBaiViet.jsp?id=" + baiViet.getId() + "'><i class='bi bi-pencil-fill'></i></a>");
						out.print("<a class='btn-del' onclick='deleteBaiViet(" + baiViet.getId() + ")'><i class='bi bi-trash'></i></a>");
						out.print("</td>");
						out.print("</tr>");
					}
				%>
		  </tbody>
		</table>
		</div>
	</main>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/assets/js/admin.js">
	</script>
</body>
</html>