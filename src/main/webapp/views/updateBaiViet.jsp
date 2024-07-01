<%@page import="services.BaiVietService"%>
<%@page import="services.TheLoaiService"%>
<%@page import="models.TheLoai"%>
<%@page import="services.UserService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>Cập nhật bài viết</title>
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
	<style type="text/css">
	  <%@include file="/assets/css/admin.css" %>
	</style>
	<style type="text/css">
	  <%@include file="/richtexteditor/rte_theme_default.css" %>
	</style>
</head>
<body>
	<%
		UserService userService = new UserService();
		TheLoaiService theLoaiService = new TheLoaiService();
		BaiVietService baiVietService = new BaiVietService();
		
		var email = (String) session.getAttribute("email");
		var user = userService.getUser(email);
		var theLoais = theLoaiService.getTheloais();
		
		var idBv = request.getParameter("id");
		var baiViet = baiVietService.GetBaiVietById(Integer.parseInt(idBv));
	%>
	<header class="header-admin d-flex justify-content-around align-items-center">
		<h1>Quản lý bài viết</h1>
		<div class="input-group">
			<input class="input" type="text" placeholder="Tìm kiếm..." >
			<input type="submit" class="button--submit" value="Tìm kiếm">
		</div>
		<span style="width: 200px; text-align: right;">Hello, <%= user.getName() %></span>
	</header>
	
	<main class="main-admin-content">
		<div class="container">
			<h1 class="px-0">Cập nhật bài viết - <strong>ID: <%= baiViet.getId() %></strong></h1>
			<div class="form">
				<form onsubmit="submitUpdateBaiViet(event)">
					<input type="hidden" id="id" name="id" value="<%= baiViet.getId() %>">
					<div class="mb-3">
					    <label for="title" class="form-label">Tiêu đề</label>
					    <input type="text" class="form-control" value="<%= baiViet.getTitle() %>" id="title" name="title" placeholder="Nhập tiêu đề">
					</div>
					<div class="mb-3">
					    <label for="description" class="form-label">Mô tả</label>
					    <textarea class="form-control" id="description" name="description" placeholder="Nhập mô tả"><%= baiViet.getDescription() %></textarea>
					</div>
				  <div class="d-flex justify-content-between gap-5 mt-3">
				  	<div class="mb-3 w-50">
					    <label for="author" class="form-label">Tác giả</label>
					    <input type="text" class="form-control" id="author" value="<%= baiViet.getAuthor() %>" name="author" placeholder="Nhập tên tác giả">
					  </div>
					  <div class="mb-3 w-50">
					    <label for="category" class="form-label">Thể loại</label>
						<select class="form-select" id="category" name="category">
							<%
								for(TheLoai theLoai : theLoais) {
									for(TheLoai theLoaiTin : theLoai.getTheLoaiTins()) {
										if (baiViet.getIdTheLoaiTin() == theLoaiTin.getId()) {
											out.println("<option value='" + theLoaiTin.getId() + "' selected>" + theLoai.getName() + " / " + theLoaiTin.getName() + "</option>");
											continue;
										}
										out.println("<option value='" + theLoaiTin.getId() + "'>" + theLoai.getName() + " / " + theLoaiTin.getName() + "</option>");
									}
								}
							%>
						</select>
					  </div>
					  <div class="mb-3 w-25">
					    <label for="image" class="form-label">Hình ảnh</label>
					    <input type="file" class="form-control" id="image" name="file">
					  </div>
				  </div>
				  <div class="content mt-5">
				  	<label for="content" class="form-label mb-3">Nội dung bài viết</label>
				  	<div id="description-editor" class="w-100"></div>
				  </div>
				  <div class="actions container px-0">
				  	<a href="/btl_docbao/views/admin.jsp" class="fs-4">Quay lại</a>
				  	<button type="submit" class="btn btn-primary btn-submit fs-4" style="min-width: 100px;">Lưu</button>
				  </div>
				</form>
			</div>
		</div>
	</main>

	<script type="text/javascript"
		src="${pageContext.request.contextPath}/richtexteditor/rte.js">
	</script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/richtexteditor/plugins/all_plugins.js">
	</script>
	
	<script type="text/javascript">
        // Init the rich text editor
        let descriptionEditor = new RichTextEditor("#description-editor");
        descriptionEditor.setHTMLCode(`<%= baiViet.getContent() %>`);
    </script>
	
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/assets/js/admin.js">
	</script>
</body>
</html>