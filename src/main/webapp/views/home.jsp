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
	
	<main>
		<section class="section section_topstory">
			<div class="container">
				<div class="row">
					<div class="col-9">
						<!-- Item top full -->
						<div class="item-news full-thumb row">
							<div class="img col-8">
								<img alt="" src="https://i1-vnexpress.vnecdn.net/2024/05/24/3-2-2021-1716527907-1716537922.jpg?w=680&h=408&q=100&dpr=1&fit=crop&s=pUReWcA3Hzp9E24t0E0Nfw">
							</div>
							<div class="content col-4">
								<h2 class="title">
									<a href="">Ngôi nhà ở Trung Kính trước khi xảy ra hỏa hoạn</a>
								</h2>
								<p class="desc">
									<a href="">HÀ NỘI - Sân của ngôi nhà được tận dụng làm nơi sửa chữa xe điện, khắp nơi bày bình ắc-quy, có thời điểm xếp chật kín các loại xe máy.</a>
								</p>
								<p class="meta-news">
									<a href="" class="link-text">Thời sự</a>
									<a href="" class="count-cmt">
										<i class="bi bi-chat-fill icon"></i>
										<span>117</span>
									</a>
								</p>
							</div>
						</div>
						<!-- Sub news -->
						<div class="sub-news-top">
							<div class="row">
								<!-- Item 1 -->
								<div class="col-4">
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
								</div>
								<!-- Item 2 -->
								<div class="col-4">
									<div class="item-news">
										<h3 class="title title-height line-clamp-3">
											<a href="">Chủ tịch nước: Siết quy định sử dụng dao để xây dựng xã hội an toàn</a>
											<a href="" class="count-cmt">
												<i class="bi bi-chat-fill icon"></i>
												<span>117</span>
											</a>
										</h3>
										<a href="">
											<img alt="" src="https://i1-vnexpress.vnecdn.net/2024/05/24/49dbdaaa-964e-44f7-b593-d83bb6-6299-7858-1716542920.jpg?w=300&h=180&q=100&dpr=1&fit=crop&s=ED-R4bTPTNiSk0wiEsHsPQ">
										</a>
									</div>
								</div>
								<!-- Góc nhìn  -->
								<div class="col-4">
									<div class="item-gocnhin">
										<a href="" class="title-link-gn">Góc nhìn</a>
										<h3 class="title line-clamp-3">
											<a href="">Thừa nhà, thiếu chỗ ở</a>
										</h3>
										<p class="desc">
											<a href="">Nhà tái định cư bỏ hoang còn người nghèo không có nhà ở xã hội mà mua.</a>
										</p>
										<div class="info-author">
											<div>
												<a href="" class="author">Phạm Thanh Tuấn</a>
												<a href="" class="count-cmt">
													<i class="bi bi-chat-fill icon"></i>
													<span>117</span>
												</a>
											</div>
											<div class="avatar">
												<img alt="" src="https://i1-vnexpress.vnecdn.net/2024/01/27/Tuanapng-1706348765.png?w=100&h=100&q=100&dpr=1&fit=crop&s=nlhB2eiNR3BuuUAkk5sI8A">
											</div>
										</div>
									</div>
								</div>
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
						<%
							ArrayList<BaiViet> baiViets = baiVietService.GetBaiVietsWithLimit(15, "desc");
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
						<!-- Item 1 -->
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
						<div class="box-category">
							<!-- Item 1: kinh-doanh -->
							<%
								/* tlservice from header */
								var tlKinhDoanh = tlservice.getTheLoaiByTextUrl("kinh-doanh");
								/* Get 5 baiviet new of kinh-doanh */
								var bvKinhDoanhs = baiVietService.GetBaiVietsByTheLoai(tlKinhDoanh.getId(), 5, "desc");
								var bvKinhDoanhNewLeft = bvKinhDoanhs.get(0);
								var bvKinhDoanhNewRight = bvKinhDoanhs.get(1);
								var bvKinhDoanhSubs = bvKinhDoanhs.subList(2, 5);
							%>
							<div class="tabs">
								<ul class="list-tabs">
									<li class="nav-item">
										<a href="theloai.jsp?tl=<%= tlKinhDoanh.getTextUrl() %>" class="nav-link active">
											<%= tlKinhDoanh.getName() %>
										</a>
									</li>
									<%
										for (var theLoaiTin : tlKinhDoanh.getTheLoaiTins()) {
											out.print("<li class='nav-item'>");
											out.print("<a href='theloai.jsp?tl=" + tlKinhDoanh.getTextUrl() + "&tlt=" + theLoaiTin.getTextUrl() + "' class='nav-link'>");
											out.print(theLoaiTin.getName());
											out.print("</a>");
											out.print("</li>");
										};
									%>
									<!-- <li class="nav-item">
										<a href="" class="nav-link">Quốc tế</a>
									</li> -->
								</ul>
							</div>
							<div class="block-content">
								<%
									/* LocalDateTime dateTime = LocalDateTime.parse("2018-05-05T11:50:55");
									out.print(dateTime.getHour() + ":" + dateTime.getMinute() + " " + dateTime.getDayOfMonth() + "/" + dateTime.getMonthValue() + "/" + dateTime.getYear()); */
								%>
								<div class="list-news row">
									<!-- Left -->
									<%
										out.print("<div class='item-new col-8'>");
										out.print("<div class='thumb-art'>");
										out.print("<a href=''>");
										out.print("<img alt='" + bvKinhDoanhNewLeft.getTitle() + "' src='" + bvKinhDoanhNewLeft.getImage() + "'>");
										out.print("</a>");
										out.print("</div>");
										out.print("<div class='text-content'>");
										out.print("<h3 class='title line-clamp-3'>");
										out.print("<a href=''>" + bvKinhDoanhNewLeft.getTitle() + "</a>");
										out.print("</h3>");
										out.print("<p class='desc'>" + bvKinhDoanhNewLeft.getDescription());
										if (bvKinhDoanhNewLeft.getBinhLuans().size() > 0) {
                                        	out.print("<a href='' class='count-cmt'>");
    										out.print("<i class='bi bi-chat-fill icon'></i>");
    										out.print("<span class='ms-2'>" + bvKinhDoanhNewLeft.getBinhLuans().size() + "</span>");
    										out.print("</a>");
                                        }
										out.print("</p>");
										out.print("</div>");
										out.print("</div>");
									%>
									<!-- <div class="item-new col-8">
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
									</div> -->
									<!-- Right -->
									<%
                                        out.print("<div class='item-new col-4'>");
                                        out.print("<div class='text-content'>");
                                        out.print("<h3 class='title line-clamp-3'>");
                                        out.print("<a href=''>" + bvKinhDoanhNewRight.getTitle() + "</a>");
                                        out.print("</h3>");
                                        out.print("<p class='desc'>" + bvKinhDoanhNewRight.getDescription());
                                        if (bvKinhDoanhNewRight.getBinhLuans().size() > 0) {
                                        	out.print("<a href='' class='count-cmt'>");
    										out.print("<i class='bi bi-chat-fill icon'></i>");
    										out.print("<span class='ms-2'>" + bvKinhDoanhNewRight.getBinhLuans().size() + "</span>");
    										out.print("</a>");
                                        }
                                        out.print("</p>");
                                        out.print("</div>");
                                        out.print("</div>");
                                    %>
                                    
									<!-- <div class="item-new col-4">
										<div class="text-content">
											<h3 class="title line-clamp-3">
												<a href="">Đêm kinh hoàng trong trại tị nạn Rafah trúng đòn không kích Israel</a>
											</h3>
											<p class="desc">
												Hiện cả nước còn 20 doanh nghiệp bán hàng đa cấp, giảm từ 67 đơn vị vào năm 2016, theo Bộ Công Thương. 
											</p>
										</div>
									</div> -->
								</div>
								<div class="sub-news">
									<%
										for (var baiviet : bvKinhDoanhSubs) {
											out.print("<div class='item-sub'>");
                                            out.print("<h3 class='title line-clamp-3'>");
                                            out.print("<a href=''>" + baiviet.getTitle() + "</a>");
                                            if (baiviet.getBinhLuans().size() > 0) {
                                            	out.print("<a href='' class='count-cmt'>");
        										out.print("<i class='bi bi-chat-fill icon'></i>");
        										out.print("<span class='ms-2'>" + baiviet.getBinhLuans().size() + "</span>");
        										out.print("</a>");
                                            }
                                            out.print("</h3>");
                                            out.print("</div>");
										}
									%>
									<!-- <div class="item-sub">
										<h3 class="title line-clamp-3">
											<a href="">Giá vàng bình ổn sẽ không quá 80 triệu đồng một lượng</a>
											<a href="" class="count-cmt">
												<i class="bi bi-chat-fill icon"></i>
												<span>117</span>
											</a>
										</h3>
									</div> -->
								</div>
							</div>
						</div>
						
						<!-- Item 2: bat-dong-san -->
						<div class="box-category">
							<%
								/* tlservice from header */
								var tlBds = tlservice.getTheLoaiByTextUrl("bat-dong-san");
								/* Get 5 baiviet new of kinh-doanh */
								var bvBds = baiVietService.GetBaiVietsByTheLoai(tlBds.getId(), 5, "desc");
								var bvBdsLeft = bvBds.get(0);
								var bvBdsRight = bvBds.get(1);
								var bvBdsSubs = bvBds.subList(2, 5);
							%>
							<div class="tabs">
								<ul class="list-tabs">
									<li class="nav-item">
										<a href="theloai.jsp?tl=<%= tlBds.getTextUrl() %>" class="nav-link active">
											<%= tlBds.getName() %>
										</a>
									</li>
									<%
										for (var theLoaiTin : tlBds.getTheLoaiTins()) {
											out.print("<li class='nav-item'>");
											out.print("<a href='theloai.jsp?tl=" + tlBds.getTextUrl() + "&tlt=" + theLoaiTin.getTextUrl() + "' class='nav-link'>");
											out.print(theLoaiTin.getName());
											out.print("</a>");
											out.print("</li>");
										};
									%>
								</ul>
							</div>
							<div class="block-content">
								<div class="list-news row">
									<!-- Left -->
									<%
										out.print("<div class='item-new col-8'>");
										out.print("<div class='thumb-art'>");
										out.print("<a href=''>");
										out.print("<img alt='" + bvBdsLeft.getTitle() + "' src='" + bvBdsLeft.getImage() + "'>");
										out.print("</a>");
										out.print("</div>");
										out.print("<div class='text-content'>");
										out.print("<h3 class='title line-clamp-3'>");
										out.print("<a href=''>" + bvBdsLeft.getTitle() + "</a>");
										out.print("</h3>");
										out.print("<p class='desc'>" + bvBdsLeft.getDescription());
										if (bvBdsLeft.getBinhLuans().size() > 0) {
                                        	out.print("<a href='' class='count-cmt'>");
    										out.print("<i class='bi bi-chat-fill icon'></i>");
    										out.print("<span class='ms-2'>" + bvBdsLeft.getBinhLuans().size() + "</span>");
    										out.print("</a>");
                                        }
										out.print("</p>");
										out.print("</div>");
										out.print("</div>");
									%>
									
									<!-- Right -->
									<%
                                        out.print("<div class='item-new col-4'>");
                                        out.print("<div class='text-content'>");
                                        out.print("<h3 class='title line-clamp-3'>");
                                        out.print("<a href=''>" + bvBdsRight.getTitle() + "</a>");
                                        out.print("</h3>");
                                        out.print("<p class='desc'>" + bvBdsRight.getDescription());
                                        if (bvBdsRight.getBinhLuans().size() > 0) {
                                        	out.print("<a href='' class='count-cmt'>");
    										out.print("<i class='bi bi-chat-fill icon'></i>");
    										out.print("<span class='ms-2'>" + bvBdsRight.getBinhLuans().size() + "</span>");
    										out.print("</a>");
                                        }
                                        out.print("</p>");
                                        out.print("</div>");
                                        out.print("</div>");
                                    %>
								</div>
								<div class="sub-news">
									<%
										for (var baiviet : bvBdsSubs) {
											out.print("<div class='item-sub'>");
                                            out.print("<h3 class='title line-clamp-3'>");
                                            out.print("<a href=''>" + baiviet.getTitle() + "</a>");
                                            if (baiviet.getBinhLuans().size() > 0) {
                                            	out.print("<a href='' class='count-cmt'>");
        										out.print("<i class='bi bi-chat-fill icon'></i>");
        										out.print("<span class='ms-2'>" + baiviet.getBinhLuans().size() + "</span>");
        										out.print("</a>");
                                            }
                                            out.print("</h3>");
                                            out.print("</div>");
										}
									%>
									<!-- <div class="item-sub">
										<h3 class="title line-clamp-3">
											<a href="">Giá vàng bình ổn sẽ không quá 80 triệu đồng một lượng</a>
											<a href="" class="count-cmt">
												<i class="bi bi-chat-fill icon"></i>
												<span>117</span>
											</a>
										</h3>
									</div> -->
								</div>
							</div>
						</div>
						
						<!-- Item 3: the-thao -->
						<div class="box-category">
							<%
								/* tlservice from header */
								var tlthethao = tlservice.getTheLoaiByTextUrl("the-thao");
								/* Get 5 baiviet new of kinh-doanh */
								var bvThethaos = baiVietService.GetBaiVietsByTheLoai(tlthethao.getId(), 5, "desc");
								var bvThethaoLeft = bvThethaos.get(0);
								var bvThethaoRight = bvThethaos.get(1);
								var bvThethaoSubs = bvThethaos.subList(2, 5);
							%>
							<div class="tabs">
								<ul class="list-tabs">
									<li class="nav-item">
										<a href="theloai.jsp?tl=<%= tlthethao.getTextUrl() %>" class="nav-link active">
											<%= tlthethao.getName() %>
										</a>
									</li>
									<%
										for (var theLoaiTin : tlthethao.getTheLoaiTins()) {
											out.print("<li class='nav-item'>");
											out.print("<a href='theloai.jsp?tl=" + tlthethao.getTextUrl() + "&tlt=" + theLoaiTin.getTextUrl() + "' class='nav-link'>");
											out.print(theLoaiTin.getName());
											out.print("</a>");
											out.print("</li>");
										};
									%>
								</ul>
							</div>
							<div class="block-content">
								<div class="list-news row">
									<!-- Left -->
									<%
										out.print("<div class='item-new col-8'>");
										out.print("<div class='thumb-art'>");
										out.print("<a href=''>");
										out.print("<img alt='" + bvThethaoLeft.getTitle() + "' src='" + bvThethaoLeft.getImage() + "'>");
										out.print("</a>");
										out.print("</div>");
										out.print("<div class='text-content'>");
										out.print("<h3 class='title line-clamp-3'>");
										out.print("<a href=''>" + bvThethaoLeft.getTitle() + "</a>");
										out.print("</h3>");
										out.print("<p class='desc'>" + bvThethaoLeft.getDescription());
										if (bvThethaoLeft.getBinhLuans().size() > 0) {
                                        	out.print("<a href='' class='count-cmt'>");
    										out.print("<i class='bi bi-chat-fill icon'></i>");
    										out.print("<span class='ms-2'>" + bvThethaoLeft.getBinhLuans().size() + "</span>");
    										out.print("</a>");
                                        }
										out.print("</p>");
										out.print("</div>");
										out.print("</div>");
									%>
									
									<!-- Right -->
									<%
                                        out.print("<div class='item-new col-4'>");
                                        out.print("<div class='text-content'>");
                                        out.print("<h3 class='title line-clamp-3'>");
                                        out.print("<a href=''>" + bvThethaoRight.getTitle() + "</a>");
                                        out.print("</h3>");
                                        out.print("<p class='desc'>" + bvThethaoRight.getDescription());
                                        if (bvThethaoRight.getBinhLuans().size() > 0) {
                                        	out.print("<a href='' class='count-cmt'>");
    										out.print("<i class='bi bi-chat-fill icon'></i>");
    										out.print("<span class='ms-2'>" + bvThethaoRight.getBinhLuans().size() + "</span>");
    										out.print("</a>");
                                        }
                                        out.print("</p>");
                                        out.print("</div>");
                                        out.print("</div>");
                                    %>
								</div>
								<div class="sub-news">
									<%
										for (var baiviet : bvThethaoSubs) {
											out.print("<div class='item-sub'>");
                                            out.print("<h3 class='title line-clamp-3'>");
                                            out.print("<a href=''>" + baiviet.getTitle() + "</a>");
                                            if (baiviet.getBinhLuans().size() > 0) {
                                            	out.print("<a href='' class='count-cmt'>");
        										out.print("<i class='bi bi-chat-fill icon'></i>");
        										out.print("<span class='ms-2'>" + baiviet.getBinhLuans().size() + "</span>");
        										out.print("</a>");
                                            }
                                            out.print("</h3>");
                                            out.print("</div>");
										}
									%>
								</div>
							</div>
						</div>
						
						<!-- Item 4: giai-tri -->
						<div class="box-category">
							<%
								/* tlservice from header */
								var tlgiaitri = tlservice.getTheLoaiByTextUrl("giai-tri");
								/* Get 5 baiviet new of kinh-doanh */
								var bvgiaitris = baiVietService.GetBaiVietsByTheLoai(tlgiaitri.getId(), 5, "desc");
								var bvgiaitriLeft = bvgiaitris.get(0);
								var bvgiaitriRight = bvgiaitris.get(1);
								var bvgiaitriSubs = bvgiaitris.subList(2, 5);
							%>
							<div class="tabs">
								<ul class="list-tabs">
									<li class="nav-item">
										<a href="theloai.jsp?tl=<%= tlgiaitri.getTextUrl() %>" class="nav-link active">
											<%= tlgiaitri.getName() %>
										</a>
									</li>
									<%
										for (var theLoaiTin : tlgiaitri.getTheLoaiTins()) {
											out.print("<li class='nav-item'>");
											out.print("<a href='theloai.jsp?tl=" + tlgiaitri.getTextUrl() + "&tlt=" + theLoaiTin.getTextUrl() + "' class='nav-link'>");
											out.print(theLoaiTin.getName());
											out.print("</a>");
											out.print("</li>");
										};
									%>
								</ul>
							</div>
							<div class="block-content">
								<div class="list-news row">
									<!-- Left -->
									<%
										out.print("<div class='item-new col-8'>");
										out.print("<div class='thumb-art'>");
										out.print("<a href=''>");
										out.print("<img alt='" + bvgiaitriLeft.getTitle() + "' src='" + bvgiaitriLeft.getImage() + "'>");
										out.print("</a>");
										out.print("</div>");
										out.print("<div class='text-content'>");
										out.print("<h3 class='title line-clamp-3'>");
										out.print("<a href=''>" + bvgiaitriLeft.getTitle() + "</a>");
										out.print("</h3>");
										out.print("<p class='desc'>" + bvgiaitriLeft.getDescription());
										if (bvgiaitriLeft.getBinhLuans().size() > 0) {
                                        	out.print("<a href='' class='count-cmt'>");
    										out.print("<i class='bi bi-chat-fill icon'></i>");
    										out.print("<span class='ms-2'>" + bvgiaitriLeft.getBinhLuans().size() + "</span>");
    										out.print("</a>");
                                        }
										out.print("</p>");
										out.print("</div>");
										out.print("</div>");
									%>
									
									<!-- Right -->
									<%
                                        out.print("<div class='item-new col-4'>");
                                        out.print("<div class='text-content'>");
                                        out.print("<h3 class='title line-clamp-3'>");
                                        out.print("<a href=''>" + bvgiaitriRight.getTitle() + "</a>");
                                        out.print("</h3>");
                                        out.print("<p class='desc'>" + bvgiaitriRight.getDescription());
                                        if (bvgiaitriRight.getBinhLuans().size() > 0) {
                                        	out.print("<a href='' class='count-cmt'>");
    										out.print("<i class='bi bi-chat-fill icon'></i>");
    										out.print("<span class='ms-2'>" + bvgiaitriRight.getBinhLuans().size() + "</span>");
    										out.print("</a>");
                                        }
                                        out.print("</p>");
                                        out.print("</div>");
                                        out.print("</div>");
                                    %>
								</div>
								<div class="sub-news">
									<%
										for (var baiviet : bvgiaitriSubs) {
											out.print("<div class='item-sub'>");
                                            out.print("<h3 class='title line-clamp-3'>");
                                            out.print("<a href=''>" + baiviet.getTitle() + "</a>");
                                            if (baiviet.getBinhLuans().size() > 0) {
                                            	out.print("<a href='' class='count-cmt'>");
        										out.print("<i class='bi bi-chat-fill icon'></i>");
        										out.print("<span class='ms-2'>" + baiviet.getBinhLuans().size() + "</span>");
        										out.print("</a>");
                                            }
                                            out.print("</h3>");
                                            out.print("</div>");
										}
									%>
								</div>
							</div>
						</div>
						
						<!-- Item 5: suc-khoe -->
						<div class="box-category">
							<%
								/* tlservice from header */
								var tlsuckhoe = tlservice.getTheLoaiByTextUrl("suc-khoe");
								/* Get 5 baiviet new of kinh-doanh */
								var bvsuckhoes = baiVietService.GetBaiVietsByTheLoai(tlsuckhoe.getId(), 5, "desc");
								var bvsuckhoeLeft = bvsuckhoes.get(0);
								var bvsuckhoeRight = bvsuckhoes.get(1);
								var bvsuckhoeSubs = bvsuckhoes.subList(2, 5);
							%>
							<div class="tabs">
								<ul class="list-tabs">
									<li class="nav-item">
										<a href="theloai.jsp?tl=<%= tlsuckhoe.getTextUrl() %>" class="nav-link active">
											<%= tlsuckhoe.getName() %>
										</a>
									</li>
									<%
										for (var theLoaiTin : tlsuckhoe.getTheLoaiTins()) {
											out.print("<li class='nav-item'>");
											out.print("<a href='theloai.jsp?tl=" + tlsuckhoe.getTextUrl() + "&tlt=" + theLoaiTin.getTextUrl() + "' class='nav-link'>");
											out.print(theLoaiTin.getName());
											out.print("</a>");
											out.print("</li>");
										};
									%>
								</ul>
							</div>
							<div class="block-content">
								<div class="list-news row">
									<!-- Left -->
									<%
										out.print("<div class='item-new col-8'>");
										out.print("<div class='thumb-art'>");
										out.print("<a href=''>");
										out.print("<img alt='" + bvsuckhoeLeft.getTitle() + "' src='" + bvsuckhoeLeft.getImage() + "'>");
										out.print("</a>");
										out.print("</div>");
										out.print("<div class='text-content'>");
										out.print("<h3 class='title line-clamp-3'>");
										out.print("<a href=''>" + bvsuckhoeLeft.getTitle() + "</a>");
										out.print("</h3>");
										out.print("<p class='desc'>" + bvsuckhoeLeft.getDescription());
										if (bvsuckhoeLeft.getBinhLuans().size() > 0) {
                                        	out.print("<a href='' class='count-cmt'>");
    										out.print("<i class='bi bi-chat-fill icon'></i>");
    										out.print("<span class='ms-2'>" + bvsuckhoeLeft.getBinhLuans().size() + "</span>");
    										out.print("</a>");
                                        }
										out.print("</p>");
										out.print("</div>");
										out.print("</div>");
									%>
									
									<!-- Right -->
									<%
                                        out.print("<div class='item-new col-4'>");
                                        out.print("<div class='text-content'>");
                                        out.print("<h3 class='title line-clamp-3'>");
                                        out.print("<a href=''>" + bvsuckhoeRight.getTitle() + "</a>");
                                        out.print("</h3>");
                                        out.print("<p class='desc'>" + bvsuckhoeRight.getDescription());
                                        if (bvsuckhoeRight.getBinhLuans().size() > 0) {
                                        	out.print("<a href='' class='count-cmt'>");
    										out.print("<i class='bi bi-chat-fill icon'></i>");
    										out.print("<span class='ms-2'>" + bvsuckhoeRight.getBinhLuans().size() + "</span>");
    										out.print("</a>");
                                        }
                                        out.print("</p>");
                                        out.print("</div>");
                                        out.print("</div>");
                                    %>
								</div>
								<div class="sub-news">
									<%
										for (var baiviet : bvsuckhoeSubs) {
											out.print("<div class='item-sub'>");
                                            out.print("<h3 class='title line-clamp-3'>");
                                            out.print("<a href=''>" + baiviet.getTitle() + "</a>");
                                            if (baiviet.getBinhLuans().size() > 0) {
                                            	out.print("<a href='' class='count-cmt'>");
        										out.print("<i class='bi bi-chat-fill icon'></i>");
        										out.print("<span class='ms-2'>" + baiviet.getBinhLuans().size() + "</span>");
        										out.print("</a>");
                                            }
                                            out.print("</h3>");
                                            out.print("</div>");
										}
									%>
								</div>
							</div>
						</div>
					
						<!-- Item 6: doi-song -->
						<div class="box-category">
							<%
								/* tlservice from header */
								var tldoisong = tlservice.getTheLoaiByTextUrl("doi-song");
								/* Get 5 baiviet new of kinh-doanh */
								var bvdoisongs = baiVietService.GetBaiVietsByTheLoai(tldoisong.getId(), 5, "desc");
								var bvdoisongLeft = bvdoisongs.get(0);
								var bvdoisongRight = bvdoisongs.get(1);
								var bvdoisongSubs = bvdoisongs.subList(2, 5);
							%>
							<div class="tabs">
								<ul class="list-tabs">
									<li class="nav-item">
										<a href="theloai.jsp?tl=<%= tldoisong.getTextUrl() %>" class="nav-link active">
											<%= tldoisong.getName() %>
										</a>
									</li>
									<%
										for (var theLoaiTin : tldoisong.getTheLoaiTins()) {
											out.print("<li class='nav-item'>");
											out.print("<a href='theloai.jsp?tl=" + tlsuckhoe.getTextUrl() + "&tlt=" + theLoaiTin.getTextUrl() + "' class='nav-link'>");
											out.print(theLoaiTin.getName());
											out.print("</a>");
											out.print("</li>");
										};
									%>
								</ul>
							</div>
							<div class="block-content">
								<div class="list-news row">
									<!-- Left -->
									<%
										out.print("<div class='item-new col-8'>");
										out.print("<div class='thumb-art'>");
										out.print("<a href=''>");
										out.print("<img alt='" + bvdoisongLeft.getTitle() + "' src='" + bvdoisongLeft.getImage() + "'>");
										out.print("</a>");
										out.print("</div>");
										out.print("<div class='text-content'>");
										out.print("<h3 class='title line-clamp-3'>");
										out.print("<a href=''>" + bvdoisongLeft.getTitle() + "</a>");
										out.print("</h3>");
										out.print("<p class='desc'>" + bvdoisongLeft.getDescription());
										if (bvdoisongLeft.getBinhLuans().size() > 0) {
                                        	out.print("<a href='' class='count-cmt'>");
    										out.print("<i class='bi bi-chat-fill icon'></i>");
    										out.print("<span class='ms-2'>" + bvdoisongLeft.getBinhLuans().size() + "</span>");
    										out.print("</a>");
                                        }
										out.print("</p>");
										out.print("</div>");
										out.print("</div>");
									%>
									
									<!-- Right -->
									<%
                                        out.print("<div class='item-new col-4'>");
                                        out.print("<div class='text-content'>");
                                        out.print("<h3 class='title line-clamp-3'>");
                                        out.print("<a href=''>" + bvdoisongRight.getTitle() + "</a>");
                                        out.print("</h3>");
                                        out.print("<p class='desc'>" + bvsuckhoeRight.getDescription());
                                        if (bvdoisongRight.getBinhLuans().size() > 0) {
                                        	out.print("<a href='' class='count-cmt'>");
    										out.print("<i class='bi bi-chat-fill icon'></i>");
    										out.print("<span class='ms-2'>" + bvdoisongRight.getBinhLuans().size() + "</span>");
    										out.print("</a>");
                                        }
                                        out.print("</p>");
                                        out.print("</div>");
                                        out.print("</div>");
                                    %>
								</div>
								<div class="sub-news">
									<%
										for (var baiviet : bvdoisongSubs) {
											out.print("<div class='item-sub'>");
                                            out.print("<h3 class='title line-clamp-3'>");
                                            out.print("<a href=''>" + baiviet.getTitle() + "</a>");
                                            if (baiviet.getBinhLuans().size() > 0) {
                                            	out.print("<a href='' class='count-cmt'>");
        										out.print("<i class='bi bi-chat-fill icon'></i>");
        										out.print("<span class='ms-2'>" + baiviet.getBinhLuans().size() + "</span>");
        										out.print("</a>");
                                            }
                                            out.print("</h3>");
                                            out.print("</div>");
										}
									%>
								</div>
							</div>
						</div>
						
						<!-- Item 7: giao-duc -->
						<div class="box-category">
							<%
								/* tlservice from header */
								var tlgiaoduc = tlservice.getTheLoaiByTextUrl("giao-duc");
								/* Get 5 baiviet new of kinh-doanh */
								var bvgiaoducs = baiVietService.GetBaiVietsByTheLoai(tlgiaoduc.getId(), 5, "desc");
								var bvgiaoducLeft = bvgiaoducs.get(0);
								var bvgiaoducRight = bvgiaoducs.get(1);
								var bvgiaoducSubs = bvgiaoducs.subList(2, 5);
							%>
							<div class="tabs">
								<ul class="list-tabs">
									<li class="nav-item">
										<a href="theloai.jsp?tl=<%= tlgiaoduc.getTextUrl() %>" class="nav-link active">
											<%= tlgiaoduc.getName() %>
										</a>
									</li>
									<%
										for (var theLoaiTin : tlgiaoduc.getTheLoaiTins()) {
											out.print("<li class='nav-item'>");
											out.print("<a href='theloai.jsp?tl=" + tlgiaoduc.getTextUrl() + "&tlt=" + theLoaiTin.getTextUrl() + "' class='nav-link'>");
											out.print(theLoaiTin.getName());
											out.print("</a>");
											out.print("</li>");
										};
									%>
								</ul>
							</div>
							<div class="block-content">
								<div class="list-news row">
									<!-- Left -->
									<%
										out.print("<div class='item-new col-8'>");
										out.print("<div class='thumb-art'>");
										out.print("<a href=''>");
										out.print("<img alt='" + bvgiaoducLeft.getTitle() + "' src='" + bvgiaoducLeft.getImage() + "'>");
										out.print("</a>");
										out.print("</div>");
										out.print("<div class='text-content'>");
										out.print("<h3 class='title line-clamp-3'>");
										out.print("<a href=''>" + bvgiaoducLeft.getTitle() + "</a>");
										out.print("</h3>");
										out.print("<p class='desc'>" + bvgiaoducLeft.getDescription());
										if (bvgiaoducLeft.getBinhLuans().size() > 0) {
                                        	out.print("<a href='' class='count-cmt'>");
    										out.print("<i class='bi bi-chat-fill icon'></i>");
    										out.print("<span class='ms-2'>" + bvgiaoducLeft.getBinhLuans().size() + "</span>");
    										out.print("</a>");
                                        }
										out.print("</p>");
										out.print("</div>");
										out.print("</div>");
									%>
									
									<!-- Right -->
									<%
                                        out.print("<div class='item-new col-4'>");
                                        out.print("<div class='text-content'>");
                                        out.print("<h3 class='title line-clamp-3'>");
                                        out.print("<a href=''>" + bvgiaoducRight.getTitle() + "</a>");
                                        out.print("</h3>");
                                        out.print("<p class='desc'>" + bvgiaoducRight.getDescription());
                                        if (bvgiaoducRight.getBinhLuans().size() > 0) {
                                        	out.print("<a href='' class='count-cmt'>");
    										out.print("<i class='bi bi-chat-fill icon'></i>");
    										out.print("<span class='ms-2'>" + bvgiaoducRight.getBinhLuans().size() + "</span>");
    										out.print("</a>");
                                        }
                                        out.print("</p>");
                                        out.print("</div>");
                                        out.print("</div>");
                                    %>
								</div>
								<div class="sub-news">
									<%
										for (var baiviet : bvgiaoducSubs) {
											out.print("<div class='item-sub'>");
                                            out.print("<h3 class='title line-clamp-3'>");
                                            out.print("<a href=''>" + baiviet.getTitle() + "</a>");
                                            if (baiviet.getBinhLuans().size() > 0) {
                                            	out.print("<a href='' class='count-cmt'>");
        										out.print("<i class='bi bi-chat-fill icon'></i>");
        										out.print("<span class='ms-2'>" + baiviet.getBinhLuans().size() + "</span>");
        										out.print("</a>");
                                            }
                                            out.print("</h3>");
                                            out.print("</div>");
										}
									%>
								</div>
							</div>
						</div>
					
						<!-- Item 8: so-hoa -->
						<div class="box-category">
							<%
								/* tlservice from header */
								var tlsohoa = tlservice.getTheLoaiByTextUrl("so-hoa");
								/* Get 5 baiviet new of kinh-doanh */
								var bvsohoas = baiVietService.GetBaiVietsByTheLoai(tlsohoa.getId(), 5, "desc");
								var bvsohoaLeft = bvsohoas.get(0);
								var bvsohoaRight = bvsohoas.get(1);
								var bvsohoaSubs = bvsohoas.subList(2, 5);
							%>
							<div class="tabs">
								<ul class="list-tabs">
									<li class="nav-item">
										<a href="theloai.jsp?tl=<%= tlsohoa.getTextUrl() %>" class="nav-link active">
											<%= tlsohoa.getName() %>
										</a>
									</li>
									<%
										for (var theLoaiTin : tlsohoa.getTheLoaiTins()) {
											out.print("<li class='nav-item'>");
											out.print("<a href='theloai.jsp?tl=" + tlsohoa.getTextUrl() + "&tlt=" + theLoaiTin.getTextUrl() + "' class='nav-link'>");
											out.print(theLoaiTin.getName());
											out.print("</a>");
											out.print("</li>");
										};
									%>
								</ul>
							</div>
							<div class="block-content">
								<div class="list-news row">
									<!-- Left -->
									<%
										out.print("<div class='item-new col-8'>");
										out.print("<div class='thumb-art'>");
										out.print("<a href=''>");
										out.print("<img alt='" + bvsohoaLeft.getTitle() + "' src='" + bvsohoaLeft.getImage() + "'>");
										out.print("</a>");
										out.print("</div>");
										out.print("<div class='text-content'>");
										out.print("<h3 class='title line-clamp-3'>");
										out.print("<a href=''>" + bvsohoaLeft.getTitle() + "</a>");
										out.print("</h3>");
										out.print("<p class='desc'>" + bvsohoaLeft.getDescription());
										if (bvsohoaLeft.getBinhLuans().size() > 0) {
                                        	out.print("<a href='' class='count-cmt'>");
    										out.print("<i class='bi bi-chat-fill icon'></i>");
    										out.print("<span class='ms-2'>" + bvsohoaLeft.getBinhLuans().size() + "</span>");
    										out.print("</a>");
                                        }
										out.print("</p>");
										out.print("</div>");
										out.print("</div>");
									%>
									
									<!-- Right -->
									<%
                                        out.print("<div class='item-new col-4'>");
                                        out.print("<div class='text-content'>");
                                        out.print("<h3 class='title line-clamp-3'>");
                                        out.print("<a href=''>" + bvsohoaRight.getTitle() + "</a>");
                                        out.print("</h3>");
                                        out.print("<p class='desc'>" + bvsohoaRight.getDescription());
                                        if (bvsohoaRight.getBinhLuans().size() > 0) {
                                        	out.print("<a href='' class='count-cmt'>");
    										out.print("<i class='bi bi-chat-fill icon'></i>");
    										out.print("<span class='ms-2'>" + bvsohoaRight.getBinhLuans().size() + "</span>");
    										out.print("</a>");
                                        }
                                        out.print("</p>");
                                        out.print("</div>");
                                        out.print("</div>");
                                    %>
								</div>
								<div class="sub-news">
									<%
										for (var baiviet : bvsohoaSubs) {
											out.print("<div class='item-sub'>");
                                            out.print("<h3 class='title line-clamp-3'>");
                                            out.print("<a href=''>" + baiviet.getTitle() + "</a>");
                                            if (baiviet.getBinhLuans().size() > 0) {
                                            	out.print("<a href='' class='count-cmt'>");
        										out.print("<i class='bi bi-chat-fill icon'></i>");
        										out.print("<span class='ms-2'>" + baiviet.getBinhLuans().size() + "</span>");
        										out.print("</a>");
                                            }
                                            out.print("</h3>");
                                            out.print("</div>");
										}
									%>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
		
		<section class="section section_khcn">
			<div class="container">
				<div class="head-title">
					<h2 class="title">Khoa học - Công nghệ</h2>
				</div>
				<div class="box-new">
					<ul class="title-box-category d-flex align-items-center">
						<li class="item">
							<a href="" class="item-link">Khoa học</a>
						</li>
						<li class="item">
							<a href="" class="item-link">Việt Nam</a>
						</li>
						<li class="item">
							<a href="" class="item-link">Phát minh</a>
						</li>
						<li class="item">
							<a href="" class="item-link">Ứng dụng</a>
						</li>
					</ul>
					<div class="section_box_cate row">
						<div class="box-left col-6">
							<div class="item-news full-thumb">
								<div class="img">
									<img alt="" src="https://i1-vnexpress.vnecdn.net/2024/06/08/anh-3-1717821185-1717831242.jpg?w=500&h=300&q=100&dpr=1&fit=crop&s=cHXq5zBjuJFq-1OPA7yqew">
								</div>
								<div class="content">
									<h3 class="title">
										<a href="">Những sản phẩm ứng dụng khoa học công nghệ tại Techfest Quảng Nam</a>
									</h3>
									<p class="desc d-inline">
										<a href="">
											10 năm qua, các nhà khoa học tại Trạm đa dạng sinh học Mê Linh (Vĩnh Phúc) luôn tìm kiếm vượn đen má trắng cái ghép đôi với hai con đực đang có nhằm nhân giống, giữ nguồn gene. 
										</a>
									</p>
									<a href=""
										class="count-cmt"> <i class="bi bi-chat-fill icon"></i> <span>117</span>
									</a>
								</div>
							</div>
						</div>
						<div class="box-right col-6 row">
							<div class="block-left col-5">
								<div class="items-new">
									<div class="item">
										<div class="thumb-art">
											<a href=""> <img alt=""
												src="https://i1-vnexpress.vnecdn.net/2024/06/08/Nhannuoivuondenmatrang-1717845-7260-6834-1717845680.jpg?w=500&h=300&q=100&dpr=1&fit=crop&s=nET266NwHv-UkSHRvl4WUg">
											</a>
										</div>
										<div class="text-content">
											<h3 class="title line-clamp-3">
												<a href="">Những sản phẩm ứng dụng khoa học công nghệ tại Techfest Quảng Nam</a>
												<a href="" class="count-cmt"> <i
													class="bi bi-chat-fill icon"></i> <span>117</span>
												</a>
											</h3>
										</div>
									</div>
									
									<div class="item">
										<div class="thumb-art">
											<a href=""> <img alt=""
												src="https://i1-vnexpress.vnecdn.net/2024/06/08/Nhannuoivuondenmatrang-1717845-7260-6834-1717845680.jpg?w=500&h=300&q=100&dpr=1&fit=crop&s=nET266NwHv-UkSHRvl4WUg">
											</a>
										</div>
										<div class="text-content">
											<h3 class="title line-clamp-3">
												<a href="">Những sản phẩm ứng dụng khoa học công nghệ tại Techfest Quảng Nam</a>
												<a href="" class="count-cmt"> <i
													class="bi bi-chat-fill icon"></i> <span>117</span>
												</a>
											</h3>
										</div>
									</div>
								</div>
							</div>
							<div class="block-right col-7">
								<div class="items-new">
									<div class="item">
										<div class="text-content">
											<h3 class="title line-clamp-3">
												<a href="">Những sản phẩm ứng dụng khoa học công nghệ tại Techfest Quảng Nam</a>
												<a href=""
													class="count-cmt"> <i class="bi bi-chat-fill icon"></i> <span>117</span>
												</a>
											</h3>
										</div>
										<div class="img">
											<img alt="" src="https://i1-vnexpress.vnecdn.net/2024/06/08/anh-3-1717821185-1717831242.jpg?w=500&h=300&q=100&dpr=1&fit=crop&s=cHXq5zBjuJFq-1OPA7yqew">
										</div>
									</div>
									
									<div class="item">
										<div class="text-content">
											<h3 class="title line-clamp-3">
												<a href="">Những sản phẩm ứng dụng khoa học công nghệ tại Techfest Quảng Nam</a>
												<a href=""
													class="count-cmt"> <i class="bi bi-chat-fill icon"></i> <span>117</span>
												</a>
											</h3>
										</div>
										<div class="img">
											<img alt="" src="https://i1-vnexpress.vnecdn.net/2024/06/08/anh-3-1717821185-1717831242.jpg?w=500&h=300&q=100&dpr=1&fit=crop&s=cHXq5zBjuJFq-1OPA7yqew">
										</div>
									</div>
									
									<div class="item">
										<div class="text-content">
											<h3 class="title line-clamp-3">
												<a href="">Những sản phẩm ứng dụng Techfest Quảng Nam</a>
												<a href=""
													class="count-cmt"> <i class="bi bi-chat-fill icon"></i> <span>117</span>
												</a>
											</h3>
										</div>
										<div class="img">
											<img alt="" src="https://i1-vnexpress.vnecdn.net/2024/06/08/anh-3-1717821185-1717831242.jpg?w=500&h=300&q=100&dpr=1&fit=crop&s=cHXq5zBjuJFq-1OPA7yqew">
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				
				<div class="box-new">
					<ul class="title-box-category d-flex align-items-center">
						<li class="item">
							<a href="" class="item-link">Khoa học</a>
						</li>
						<li class="item">
							<a href="" class="item-link">Việt Nam</a>
						</li>
						<li class="item">
							<a href="" class="item-link">Phát minh</a>
						</li>
						<li class="item">
							<a href="" class="item-link">Ứng dụng</a>
						</li>
					</ul>
					<div class="section_box_cate row">
						<div class="box-left col-6">
							<div class="item-news full-thumb">
								<div class="img">
									<img alt="" src="https://i1-vnexpress.vnecdn.net/2024/06/08/anh-3-1717821185-1717831242.jpg?w=500&h=300&q=100&dpr=1&fit=crop&s=cHXq5zBjuJFq-1OPA7yqew">
								</div>
								<div class="content">
									<h3 class="title">
										<a href="">Những sản phẩm ứng dụng khoa học công nghệ tại Techfest Quảng Nam</a>
									</h3>
									<p class="desc d-inline">
										<a href="">
											10 năm qua, các nhà khoa học tại Trạm đa dạng sinh học Mê Linh (Vĩnh Phúc) luôn tìm kiếm vượn đen má trắng cái ghép đôi với hai con đực đang có nhằm nhân giống, giữ nguồn gene. 
										</a>
									</p>
									<a href=""
										class="count-cmt"> <i class="bi bi-chat-fill icon"></i> <span>117</span>
									</a>
								</div>
							</div>
						</div>
						<div class="box-right col-6 row">
							<div class="block-left col-5">
								<div class="items-new">
									<div class="item">
										<div class="thumb-art">
											<a href=""> <img alt=""
												src="https://i1-vnexpress.vnecdn.net/2024/06/08/Nhannuoivuondenmatrang-1717845-7260-6834-1717845680.jpg?w=500&h=300&q=100&dpr=1&fit=crop&s=nET266NwHv-UkSHRvl4WUg">
											</a>
										</div>
										<div class="text-content">
											<h3 class="title line-clamp-3">
												<a href="">Những sản phẩm ứng dụng khoa học công nghệ tại Techfest Quảng Nam</a>
												<a href="" class="count-cmt"> <i
													class="bi bi-chat-fill icon"></i> <span>117</span>
												</a>
											</h3>
										</div>
									</div>
									
									<div class="item">
										<div class="thumb-art">
											<a href=""> <img alt=""
												src="https://i1-vnexpress.vnecdn.net/2024/06/08/Nhannuoivuondenmatrang-1717845-7260-6834-1717845680.jpg?w=500&h=300&q=100&dpr=1&fit=crop&s=nET266NwHv-UkSHRvl4WUg">
											</a>
										</div>
										<div class="text-content">
											<h3 class="title line-clamp-3">
												<a href="">Những sản phẩm ứng dụng khoa học công nghệ tại Techfest Quảng Nam</a>
												<a href="" class="count-cmt"> <i
													class="bi bi-chat-fill icon"></i> <span>117</span>
												</a>
											</h3>
										</div>
									</div>
								</div>
							</div>
							<div class="block-right col-7">
								<div class="items-new">
									<div class="item">
										<div class="text-content">
											<h3 class="title line-clamp-3">
												<a href="">Những sản phẩm ứng dụng khoa học công nghệ tại Techfest Quảng Nam</a>
												<a href=""
													class="count-cmt"> <i class="bi bi-chat-fill icon"></i> <span>117</span>
												</a>
											</h3>
										</div>
										<div class="img">
											<img alt="" src="https://i1-vnexpress.vnecdn.net/2024/06/08/anh-3-1717821185-1717831242.jpg?w=500&h=300&q=100&dpr=1&fit=crop&s=cHXq5zBjuJFq-1OPA7yqew">
										</div>
									</div>
									
									<div class="item">
										<div class="text-content">
											<h3 class="title line-clamp-3">
												<a href="">Những sản phẩm ứng dụng khoa học công nghệ tại Techfest Quảng Nam</a>
												<a href=""
													class="count-cmt"> <i class="bi bi-chat-fill icon"></i> <span>117</span>
												</a>
											</h3>
										</div>
										<div class="img">
											<img alt="" src="https://i1-vnexpress.vnecdn.net/2024/06/08/anh-3-1717821185-1717831242.jpg?w=500&h=300&q=100&dpr=1&fit=crop&s=cHXq5zBjuJFq-1OPA7yqew">
										</div>
									</div>
									
									<div class="item">
										<div class="text-content">
											<h3 class="title line-clamp-3">
												<a href="">Những sản phẩm ứng dụng Techfest Quảng Nam</a>
												<a href=""
													class="count-cmt"> <i class="bi bi-chat-fill icon"></i> <span>117</span>
												</a>
											</h3>
										</div>
										<div class="img">
											<img alt="" src="https://i1-vnexpress.vnecdn.net/2024/06/08/anh-3-1717821185-1717831242.jpg?w=500&h=300&q=100&dpr=1&fit=crop&s=cHXq5zBjuJFq-1OPA7yqew">
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
	</main>
	
	<div style="height: 100px"></div>
	<!-- Import footer -->
	<%@include file="/views/footer.jsp" %>
</body>
</html>