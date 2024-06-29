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
	%>
	<header class="header-admin d-flex justify-content-around align-items-center">
		<h1>Quản lý bài viết</h1>
		<div class="input-group">
			<input class="input" type="text" placeholder="Tìm kiếm..." >
			<input type="submit" class="button--submit" value="Tìm kiếm">
		</div>
		<span>Hello, </span>
	</header>
	<main class="main-admin-content">
		<div class="d-flex justify-content-between align-items-center">
			<h1 class="">Danh sách bài viết</h1>
			<input class="btn-add-bv" type="button" value="Thêm bài viết"/>
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
							ArrayList<BaiViet> baiViets = baiVietService.GetBaiVietsWithLimit(10, "desc");
							for (BaiViet baiViet : baiViets) {
								out.print("<tr>");
								out.print(" <td class='d-table-cell align-middle' scope='row'>"+baiViet.getId()+"</td>");
								out.print(" <td class='d-table-cell align-middle'>"+baiViet.getTitle()+"</td>");
								out.print(" <td class='d-table-cell align-middle'><img style='width: 50px; height: 50px; object-fit:cover;' src='"+baiViet.getImage()+"' alt='"+baiViet.getTitle()+"'></td>");
								out.print(" <td class='d-table-cell align-middle'>"+baiViet.getDescription()+"</td>");
								out.print(" <td class='d-table-cell align-middle'>"+baiViet.getAuthor()+"</td>");
								out.print(" <td class='d-table-cell align-middle'>"+baiViet.getCreateDate()+"</td>");
								out.print(" <td class='d-table-cell align-middle'>"+baiViet.getIdTheLoaiTin()+"</td>");
								out.print("<td class='d-table-cell align-middle'><a class='btn-edit' href=''><i class='bi bi-pencil-fill'></i></a> <a class='btn-del' href=''><i class='bi bi-trash'></i></a></td>");
								out.print("</tr>");
							}
				%>
		  </tbody>
		</table>
		</div>
		<div class="number-page">
			<nav aria-label="...">
			  <ul class="pagination">
			    <li class="page-item disabled">
			      <a class="page-link">Previous</a>
			    </li>
			    <li class="page-item"><a class="page-link" href="#">1</a></li>
			    <li class="page-item active" aria-current="page">
			      <a class="page-link" href="#">2</a>
			    </li>
			    <li class="page-item"><a class="page-link" href="#">3</a></li>
			    <li class="page-item">
			      <a class="page-link" href="#">Next</a>
			    </li>
			  </ul>
			</nav>
		</div>
	</main>
</body>
</html>