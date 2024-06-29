<%@page import="models.BaiViet"%>
<%@page import="java.util.ArrayList"%>
<%@page import="services.BaiVietService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title></title>
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
	<!-- Import header -->
	<%@include file="/views/header.jsp"%>
	
	<!-- Get data -->
	<%
		String theLoaiParam = request.getParameter("tl");
	    String theLoaiTinParam = request.getParameter("tlt");
	    
	    var theloai = tlservice.getTheLoaiByTextUrl(theLoaiParam);
	    var bvService = new BaiVietService();
	    
	    ArrayList<BaiViet> baiViets = new ArrayList<>();
	    /* Get list bai viet */
	    if (theLoaiTinParam != null) {
	    	var theLoaiTin = tlservice.getTheLoaiTinByTextUrl(theLoaiTinParam);
        	baiViets = bvService.GetBaiVietsByTheLoaiTin(theLoaiTin.getId(), 0, "desc");
        } else {
        	baiViets = bvService.GetBaiVietsByTheLoai(theloai.getId(), 0, "desc");
        }
	    
	    var bvTop = baiViets.get(0);
	    var bvTopSubs = baiViets.subList(1, 4);
	    var bvBottoms = baiViets.subList(4, baiViets.size());
	%>
	
	<!-- Content -->
	<main class="mb-5" id="theloai">
		<!-- Top story -->
		<section class="section section_topstory">
			<div class="container">
				<div class="box-category">
					<div class="tabs">
						<ul class="list-tabs">
							<li class="nav-item">
								<a href="theloai.jsp?tl=<%= theLoaiParam %>" class="nav-link active">
									<%= theloai.getName() %>
								</a>
							</li>
							<%
								for (var tlt : theloai.getTheLoaiTins()) {
									if (tlt.getTextUrl().equals(theLoaiTinParam)) {
										out.print("<li class='nav-item active'>");
									} else {
										out.print("<li class='nav-item'>");
									}
									out.print("<a href='theloai.jsp?tl=" + theLoaiParam + "&tlt=" + tlt.getTextUrl() + "' class='nav-link'>" + tlt.getName() + "</a>");
									out.print("</li>");
								}
							%>
							<!-- <li class="nav-item">
								<a href="" class="nav-link">Quốc tế</a>
							</li> -->
						</ul>
					</div>
				</div>
				<div class="row">
					<div class="col-9">
						<!-- Item top full -->
						<div class="item-news full-thumb row">
							<div class="img col-8">
								<img alt="<%= bvTop.getTitle() %>" src="<%= bvTop.getImage() %>">
							</div>
							<div class="content col-4">
								<h2 class="title">
									<a href="baiviet.jsp?id=<%= bvTop.getId() %>"><%= bvTop.getTitle() %></a>
								</h2>
								<p class="desc">
									<a href="baiviet.jsp?id=<%= bvTop.getId() %>"><%= bvTop.getDescription() %></a>
								</p>
								<p class="meta-news">
									<a href="theloai.jsp?tl=<%= theloai.getTextUrl() %>" class="link-text"><%= theloai.getName() %></a>
									<a href="baiviet.jsp?id=<%= bvTop.getId() %>" class="count-cmt">
										<i class="bi bi-chat-fill icon"></i>
										<span><%= bvTop.getBinhLuans().size() %></span>
									</a>
								</p>
							</div>
						</div>
						<!-- Sub news -->
						<div class="sub-news-top">
							<div class="row">
								<!-- Item 1 -->
								<%
									for (var bv : bvTopSubs) {
										out.print("<div class='col-4'>");
										out.print("<div class='item-news'>");
										out.print("<div style='height: 160px;'>");
										out.print("<a href='baiviet.jsp?id=" + bv.getId() + "'>");
										out.print("<img alt='" + bv.getTitle() + "' src='" + bv.getImage() + "' style='height: 100%;'>");
										out.print("</a>");
										out.print("</div>");
										out.print("<h3 class='title title-height line-clamp-3 mt-3'>");
										out.print("<a href='baiviet.jsp?id=" + bv.getId() + "'>" + bv.getTitle() + "</a>");
										if (bv.getBinhLuans().size() > 0) {
											out.print("<a href='alt='baiviet.jsp?id=" + bv.getId() + "' class='count-cmt'>");
											out.print("<i class='bi bi-chat-fill icon'></i>");
											out.print("<span>" + bv.getBinhLuans().size() + "</span>");
											out.print("</a>");
										}
										out.print("</h3>");
										out.print("</div>");
										out.print("</div>");
									}
								%>
								<!-- <div class="col-4">
									<div class="item-news">
										<h3 class="title title-height line-clamp-3">
											<a href="">60 phút tìm đường sống trong ngôi nhà cháy</a>
											<a href="" class="count-cmt">
												<i class="bi bi-chat-fill icon"></i>
												<span>117</span>
											</a>
										</h3>
										<a href="">
											<img alt="" src="https://i1-vnexpress.vnecdn.net/2024/05/24/nan-nhan2-1716532605-8861-1716532610.jpg?w=300&h=180&q=100&dpr=1&fit=crop&s=ssIBStElK9JZisDDrVzbQA">
										</a>
									</div>
								</div> -->
								
							</div>
						</div>
					</div>
					<!-- Ads -->
					<div class="col-3">
						<div class="ads h-100">
							<a href="#">
								<img alt="" class="h-100" src="https://tpc.googlesyndication.com/simgad/14666485097656346377">
							</a>
						</div>
					</div>
				</div>
			</div>
		</section>
	
		<section class="section section_stream_home">
			<div class="container">
				<div class="block d-flex">
					<div class="col-left">
						<!-- Item 1 -->
						<%-- <%
							for (var bv : bvStreamLeft) {
								out.print("<div class='item-news'>");
								out.print("<h3 class='title line-clamp-3'>");
								out.print("<a href='baiviet.jsp?id=" + bv.getId() + "'>" + bv.getTitle() + "</a>");
								out.print("</h3>");
								out.print("<div class='d-flex'>");
								out.print("<div class='thumb-art'>");
								out.print("<a href='baiviet.jsp?id=" + bv.getId() + "'>");
								out.print("<img alt='" + bv.getTitle() + "' src='" + bv.getImage() + "'>");
								out.print("</a>");
								out.print("</div>");
								out.print("<p class='desc'>");
								out.print("<a href='baiviet.jsp?id=" + bv.getId() + "'>" + bv.getDescription() + "</a>");
								if (bv.getBinhLuans().size() > 0) {
									out.print("<a href='alt='baiviet.jsp?id=" + bv.getId() + "' class='count-cmt'>");
									out.print("<i class='bi bi-chat-fill icon'></i>");
									out.print("<span>" + bv.getBinhLuans().size() + "</span>");
									out.print("</a>");
								}
								out.print("</p>");
							}
						%> --%>
						<!-- <div class="item-news">
							<h3 class="title line-clamp-3">
								<a href="">Đêm kinh hoàng trong trại tị nạn Rafah trúng đòn không kích Israel</a>
							</h3>
							<div class="d-flex">
								<div class="thumb-art">
									<a href="">
										<img alt=""
											src="https://i1-vnexpress.vnecdn.net/2024/05/24/nan-nhan2-1716532605-8861-1716532610.jpg?w=300&h=180&q=100&dpr=1&fit=crop&s=ssIBStElK9JZisDDrVzbQA">
									</a>
								</div>
								<p class="desc">
									<a href="">Sắp về đến lán trại, Haila bỗng thấy chớp sáng và loạt tiếng nổ liên hồi, rồi cả khu lều trại cho người tị nạn chìm trong biển lửa.</a>
								</p>
							</div>
						</div> -->
					</div>
					<div class="col-right">
						<!-- Item 1: kinh-doanh -->
						<!-- <div class="box-category">
							<div class="tabs">
								<ul class="list-tabs">
									<li class="nav-item">
										<a href="" class="nav-link active">Quốc tế</a>
									</li>
								</ul>
							</div>
							<div class="block-content">
								<div class="row">
									Left
									<div class="item-new item-left col-5">
										<div class="thumb-art">
											<a href="">
												<img alt="" src="https://i1-kinhdoanh.vnecdn.net/2024/05/30/2012-05-30t120000z-375023298-g-1954-9404-1717061535.jpg?w=380&h=228&q=100&dpr=1&fit=crop&s=Xg1pp82hBsEUG2qFoCLGxQ">
											</a>
										</div>
										<div class="text-content">
											<h3 class="title line-clamp-3">
												<a href="">Đêm kinh hoàng trong trại tị nạn Rafah trúng đòn không kích Israel</a>
											</h3>
											<p class="desc">
												Dòng người đông đúc đến các chi nhánh của 4 ngân hàng quốc doanh tại Hà Nội và TP HCM để mua vàng miếng bình ổn, chiều 3/6.
												<a href="" class="count-cmt">
													<i class="bi bi-chat-fill icon"></i>
													<span>117</span>
												</a>
											</p>
										</div>
									</div>
									Right
									<div class="col-7 sub-news-right">
										<div class="item-new">
											<div class="text-content">
												<h3 class="title line-clamp-3">
													<a href="">Đêm kinh hoàng trong trại tị nạn Rafah trúng đòn không kích Israel</a>
												</h3>
												<p class="desc">
													Hiện cả nước còn 20 doanh nghiệp bán hàng đa cấp, giảm từ 67 đơn vị vào năm 2016, theo Bộ Công Thương. 
												</p>
											</div>
										</div>
										
										<div class="item-new">
											<div class="text-content">
												<h3 class="title line-clamp-3">
													<a href="">Đêm kinh hoàng trong trại tị nạn Rafah trúng đòn không kích Israel</a>
												</h3>
												<p class="desc">
													Hiện cả nước còn 20 doanh nghiệp bán hàng đa cấp, giảm từ 67 đơn vị vào năm 2016, theo Bộ Công Thương. 
												</p>
											</div>
										</div>
										
										<div class="item-new">
											<div class="text-content">
												<h3 class="title line-clamp-3">
													<a href="">Đêm kinh hoàng trong trại tị nạn Rafah trúng đòn không kích Israel</a>
												</h3>
												<p class="desc">
													Hiện cả nước còn 20 doanh nghiệp bán hàng đa cấp, giảm từ 67 đơn vị vào năm 2016, theo Bộ Công Thương. 
												</p>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div> -->
					</div>
				</div>
			</div>
		</section>
	
		<section class="section section_bottom">
			<div class="container py-4" style="border-bottom: 1px solid #e5e5e5;">
				<div class="row">
					<div class="block-left col-9">
						<div class="list-news pe-4">
							<%
								for (var bv : bvBottoms) {
									out.print("<div class='new-item row'>");
                                    out.print("<div class='thumb-img col-4'>");
                                    out.print("<img src='" + bv.getImage() + "' >");
                                    out.print("</div>");
                                    out.print("<div class='content col-8'>");
                                    out.print("<h3 class='title fs-3'>");
                                    out.print("<a href='baiviet.jsp?id=" + bv.getId() + "'>" + bv.getTitle() + "</a>");
                                    out.print("</h3>");
                                    out.print("<p class='desc'>");
                                    out.print(bv.getDescription());
                                    if (bv.getBinhLuans().size() > 0) {
                                        out.print("<a href='alt='baiviet.jsp?id=" + bv.getId() + "' class='count-cmt'>");
                                        out.print("<i class='bi bi-chat-fill icon'></i>");
                                        out.print("<span>" + bv.getBinhLuans().size() + "</span>");
                                        out.print("</a>");
                                    }
                                    out.print("</p>");
                                    out.print("</div>");
                                    out.print("</div>");
								}
							%>
							<!-- <div class="new-item row">
								<div class="thumb-img col-4">
									<img src="https://i1-vnexpress.vnecdn.net/2024/06/24/120202783-3208376682609080-871-4096-9025-1719225407.jpg?w=240&h=144&q=100&dpr=1&fit=crop&s=4Qc_niQhb51cd7lSY8r3vg" >
								</div>
								<div class="content col-8">
									<h3 class="title fs-3">Thủy điện Hòa Bình mở cửa xả đáy</h3>
									<p class="desc">
										HÒA BÌNH - Thủy điện Hòa Bình sẽ xả đáy vào 22h tối 24/6, theo quyết định của Ban Chỉ đạo quốc gia về phòng chống thiên tai.
										<a href="" class="count-cmt">
											<i class="bi bi-chat-fill icon"></i>
											<span>117</span>
										</a>
									</p>
								</div>
							</div> -->
						</div>
					</div>
					
					<div class="block-right col-3">
						<%
							for (var tlt : theloai.getTheLoaiTins()) {
								out.print("<div class='box-category mb-5'>");
								out.print("<div class='tabs'>");
								out.print("<ul class='list-tabs'>");
								out.print("<li class='nav-item'>");
								out.print("<a href='theloai.jsp?tl=" + theLoaiParam + "&tlt=" + tlt.getTextUrl() + "' class='nav-link active'>" + tlt.getName() + "</a>");
								out.print("</li>");
								out.print("</ul>");
								out.print("</div>");
								out.print("<div class='block-news'>");
								
								/* Get data baiviet */
								var baivietsByTlt = bvService.GetBaiVietsByTheLoaiTin(tlt.getId(), 3, "desc");
								var bvTopByTlt = baivietsByTlt.get(0);
								var bvSubsByTlt = baivietsByTlt.subList(1, baivietsByTlt.size());
								
								out.print("<div class='item-new'>");
								out.print("<div class='thumb-img'>");
								out.print("<img src='" + bvTopByTlt.getImage() + "' >");
								out.print("</div>");
								out.print("<div class='content mt-2'>");
								out.print("<h3 class='title fs-4'>");
								out.print("<a href='baiviet.jsp?id=" + bvTopByTlt.getId() + "'>" + bvTopByTlt.getTitle() + "</a>");
								if (bvTopByTlt.getBinhLuans().size() > 0) {
									out.print("<a href='baiviet.jsp?id=" + bvTopByTlt.getId() + "' class='count-cmt'>");
									out.print("<i class='bi bi-chat'></i>");
									out.print("<span>" + bvTopByTlt.getBinhLuans().size() + "</span>");
									out.print("</a>");
								}
								out.print("</h3>");
								out.print("</div>");
								out.print("</div>");
								
								for (var bv : bvSubsByTlt) {
									out.print("<div class='item-new'>");
									out.print("<div class='content mt-2'>");
									out.print("<h3 class='title fs-4'>");
									out.print("<a href='baiviet.jsp?id=" + bv.getId() + "'>" + bv.getTitle() + "</a>");
									if (bv.getBinhLuans().size() > 0) {
										out.print("<a href='baiviet.jsp?id=" + bv.getId() + "' class='count-cmt'>");
										out.print("<i class='bi bi-chat'></i>");
										out.print("<span>" + bv.getBinhLuans().size() + "</span>");
										out.print("</a>");
									}
									out.print("</h3>");
									out.print("</div>");
									out.print("</div>");
								}
								out.print("</div>");
								out.print("</div>");
							}
						%>
						<!-- <div class="box-category">
							<div class="tabs">
								<ul class="list-tabs">
									<li class="nav-item">
										<a href="" class="nav-link active">Quốc tế</a>
									</li>
								</ul>
							</div>
							
							<div class="block-news">
								<div class="item-new">
									<div class="thumb-img">
										<img src="https://i1-vnexpress.vnecdn.net/2024/06/24/120202783-3208376682609080-871-4096-9025-1719225407.jpg?w=240&h=144&q=100&dpr=1&fit=crop&s=4Qc_niQhb51cd7lSY8r3vg" >
									</div>
									<div class="content mt-2">
										<h3 class="title fs-4">
											Thủy điện Hòa Bình mở cửa xả đáy
											<a href="" class="count-cmt">
												<i class="bi bi-chat-fill icon"></i>
												<span>117</span>
											</a>
										</h3>
									</div>
								</div>
								
								<div class="item-new">
									<div class="content mt-2">
										<p class="desc">
											Thủy điện Hòa Bình mở cửa xả đáy
											<a href="" class="count-cmt">
												<i class="bi bi-chat-fill icon"></i>
												<span>117</span>
											</a>
										</p>
									</div>
								</div>
								
								<div class="item-new">
									<div class="content mt-2">
										<p class="desc">
											Thủy điện Hòa Bình mở cửa xả đáy
											<a href="" class="count-cmt">
												<i class="bi bi-chat-fill icon"></i>
												<span>117</span>
											</a>
										</p>
									</div>
								</div>
							
							</div>
						</div> -->
					</div>
				</div>
			</div>
		</section>
	</main>
	
	<!-- Import footer -->
	<%@include file="/views/footer.jsp"%>
</body>
</html>