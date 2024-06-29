<%@page import="services.EmotionService"%>
<%@page import="services.UserService"%>
<%@page import="services.BaiVietService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Bai viet</title>
	<!-- Bootstrap -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
	<style type="text/css">
	  <%@include file="/assets/css/reset.css" %>
	</style>
	<style type="text/css">
	  <%@include file="/assets/css/style.css" %>
	</style>
	<style type="text/css">
	  <%@include file="/assets/css/trangbao.css" %>
	</style>
</head>
<body>
	<!-- Import header -->
	<%@include file="/views/header.jsp" %>

	<!-- Get breadcrumb, baiviet, bai viet lien quan, binh luan -->
	<%
		/* Service */
	    var userService = new UserService();
		var userInBaiViet = userService.getUserByEmail(email);
	
		var bvService = new BaiVietService();
		var emotionService = new EmotionService();
	
		var idBv = Integer.parseInt(request.getParameter("id"));
		var bvView = bvService.GetBaiVietById(idBv);
		var tlt = tlservice.getTheLoaiTinById(bvView.getIdTheLoaiTin());
		var tl = tlservice.getTheLoaiById(tlt.getIdTheLoai());
		var bvLienQuan = bvService.GetBaiVietsByTheLoaiTin(tlt.getId(), 5, "desc");
		var bvByTheloais = bvService.GetBaiVietsByTheLoai(tl.getId(), 10, "desc");
	%>
	
	<main class="mb-5 mt-3">
		<input type="text" class="user-id" hidden="hidden" value="<%= userInBaiViet.getId() %>" />
		
		<div class="dv_tong">
			<div class="dv_1">
				<ul>
					<!-- <li class="li_ic">
					<a href="" class="ic_a" title="Chia sẻ bài viết lên facebook">
						<svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="#898989" class="svg_ic_fb" viewBox="0 0 16 16">
	  						<path d="M16 8.049c0-4.446-3.582-8.05-8-8.05C3.58 0-.002 3.603-.002 8.05c0 4.017 2.926 7.347 6.75 7.951v-5.625h-2.03V8.05H6.75V6.275c0-2.017 1.195-3.131 3.022-3.131.876 0 1.791.157 1.791.157v1.98h-1.009c-.993 0-1.303.621-1.303 1.258v1.51h2.218l-.354 2.326H9.25V16c3.824-.604 6.75-3.934 6.75-7.951"/>
						</svg>
					</a>
					</li> -->
					
					<!-- <li class="li_ic">
					<a href="" class="ic_a" title="Chia sẻ bài viết lên twitter">
						<svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="#898989" class="svg_ic_tt" viewBox="0 0 16 16">
	  						<path d="M5.026 15c6.038 0 9.341-5.003 9.341-9.334q.002-.211-.006-.422A6.7 6.7 0 0 0 16 3.542a6.7 6.7 0 0 1-1.889.518 3.3 3.3 0 0 0 1.447-1.817 6.5 6.5 0 0 1-2.087.793A3.286 3.286 0 0 0 7.875 6.03a9.32 9.32 0 0 1-6.767-3.429 3.29 3.29 0 0 0 1.018 4.382A3.3 3.3 0 0 1 .64 6.575v.045a3.29 3.29 0 0 0 2.632 3.218 3.2 3.2 0 0 1-.865.115 3 3 0 0 1-.614-.057 3.28 3.28 0 0 0 3.067 2.277A6.6 6.6 0 0 1 .78 13.58a6 6 0 0 1-.78-.045A9.34 9.34 0 0 0 5.026 15"/>
						</svg>
					</a>
					</li>
					
					<li class="li_ic">
					<a href="" class="ic_a" title="Chia sẻ bài viết lên linkedin">
						<svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="#898989" class="svg_ic_ld" viewBox="0 0 16 16">
	  						<path d="M0 1.146C0 .513.526 0 1.175 0h13.65C15.474 0 16 .513 16 1.146v13.708c0 .633-.526 1.146-1.175 1.146H1.175C.526 16 0 15.487 0 14.854zm4.943 12.248V6.169H2.542v7.225zm-1.2-8.212c.837 0 1.358-.554 1.358-1.248-.015-.709-.52-1.248-1.342-1.248S2.4 3.226 2.4 3.934c0 .694.521 1.248 1.327 1.248zm4.908 8.212V9.359c0-.216.016-.432.08-.586.173-.431.568-.878 1.232-.878.869 0 1.216.662 1.216 1.634v3.865h2.401V9.25c0-2.22-1.184-3.252-2.764-3.252-1.274 0-1.845.7-2.165 1.193v.025h-.016l.016-.025V6.169h-2.4c.03.678 0 7.225 0 7.225z"/>
						</svg>
					</a>
					</li> -->
					
					<!-- <hr width="28px">
					
					<li class="li_ic">
					<a href="" class="ic_a" title="Lưu bài viết">
						<svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="#898989" class="svg_ic_sv" viewBox="0 0 16 16">
	  						<path d="M8.5 1.5A1.5 1.5 0 0 1 10 0h4a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V2a2 2 0 0 1 2-2h6c-.314.418-.5.937-.5 1.5v7.793L4.854 6.646a.5.5 0 1 0-.708.708l3.5 3.5a.5.5 0 0 0 .708 0l3.5-3.5a.5.5 0 0 0-.708-.708L8.5 9.293z"/>
						</svg>
					</a>
					</li> -->
					
					<!-- <li class="li_ic">
					<a href="" class="ic_a" title="Bình luận">
						<svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="#898989" class="svg_ic_cm" viewBox="0 0 16 16">
	  						<path d="M2 0a2 2 0 0 0-2 2v12.793a.5.5 0 0 0 .854.353l2.853-2.853A1 1 0 0 1 4.414 12H14a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2z"/>
						</svg>
					</a>
					</li> -->
					
					<!-- <li class="li_ic">
					<a href="" class="ic_a" title="In">
						<svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="#898989" class="svg_ic_pr" viewBox="0 0 16 16">
	  						<path d="M5 1a2 2 0 0 0-2 2v1h10V3a2 2 0 0 0-2-2zm6 8H5a1 1 0 0 0-1 1v3a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1v-3a1 1 0 0 0-1-1"/>
	  						<path d="M0 7a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v3a2 2 0 0 1-2 2h-1v-2a2 2 0 0 0-2-2H5a2 2 0 0 0-2 2v2H2a2 2 0 0 1-2-2zm2.5 1a.5.5 0 1 0 0-1 .5.5 0 0 0 0 1"/>
						</svg>
					</a>
					</li> -->
					
					<!-- <li class="li_ic">
					<a href="" class="ic_a" title="Trở lại thời sự">
						<svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="#898989" class="svg_ic_back" viewBox="0 0 16 16">
	  						<path fill-rule="evenodd" d="M15 8a.5.5 0 0 0-.5-.5H2.707l3.147-3.146a.5.5 0 1 0-.708-.708l-4 4a.5.5 0 0 0 0 .708l4 4a.5.5 0 0 0 .708-.708L2.707 8.5H14.5A.5.5 0 0 0 15 8"/>
						</svg>
					</a>
					</li> -->
				</ul>
			</div>

			<div class="dv_2">
				<div class="dv_2_1">
					<ul class="ul_dv2">
						<li>
							<a href="theloai.jsp?tl=<%= tl.getTextUrl() %>" title="Thời sự"><%= tl.getName() %></a>
						</li>
						<li class="mx-3">></li>
						<li>
							<a href="theloai.jsp?tl=<%= tl.getTextUrl() %>&tlt=<%= tlt.getTextUrl() %>" title="Chính trị" style="color: #757575"><%= tlt.getName() %></a>
						</li>
					</ul>
	
					<span class="sp_date"><%= bvView.getCreateDate() %></span>
				</div>
				<div class="content">
					<h1 class="h1_title">
						<%= bvView.getTitle() %>
					</h1>
					<%= bvView.getContent() %>
				</div>
				<p class="tacgia_p">
					<strong><%= bvView.getAuthor() %></strong>
				</p>
	
				<!-- 
				<p class="p_nd">
					Người lao động có thể nộp khoản bị doanh nghiệp chậm, trốn đóng bảo hiểm xã hội (BHXH) để đủ điều kiện xác nhận hưởng hưu trí, theo dự thảo Luật bảo hiểm xã hội.
				</p>
	
				<article class="at_1">
					<p class="p_normal">
						Trong dự thảo trình Quốc hội ngày 27/5, Ban soạn thảo và cơ quan thẩm tra đề xuất bổ sung cơ chế bảo vệ lao động trong trường hợp người sử dụng không còn khả năng đóng như phá sản, giải thể, bỏ trốn. Cơ quan BHXH sẽ tạm thời xác nhận thời gian đã đóng nếu lao động có yêu cầu để làm căn cứ hưởng các chế độ "đóng đến đâu tính đến đó". Khi chủ sử dụng đóng bù thì lao động sẽ được xác nhận, cộng thời gian này vào để tính lại.
					</p>
					
					<p class="p_normal">
						Trường hợp tính cả thời gian bị chậm, trốn đóng BHXH mới đủ điều kiện hưởng hưu trí và các chế độ khác thì lao động có thể chọn nộp khoản bị chậm, trốn này vào Quỹ Hưu trí tử tuất để được xác nhận hưởng.
					</p>
					
					<p class="p_normal">
						Đại biểu Nguyễn Hoàng Bảo Trân (Phó chủ tịch Liên đoàn Lao động tỉnh Bình Dương) băn khoăn việc lao động phải đóng bù tiền để hưởng quyền lợi mà họ đương nhiên được hưởng. Khi doanh nghiệp chậm, trốn đóng BHXH, người lao động đã mất trắng khoản lương hàng tháng trích đóng ban đầu. Nếu phải đóng bù lần nữa cho phần doanh nghiệp vi phạm thì lao động phải đóng nhiều lần với tỷ lệ lớn (gồm 8% tiền lương tháng lần đầu, 22% khoản đóng bù lần hai).
					</p>
					
					<p class="p_normal">
						"Quy định này sẽ gây bức xúc hơn cho người lao động lẫn dư luận xã hội. Họ sẽ đặt câu hỏi vì sao doanh nghiệp nợ BHXH mà cơ quan nhà nước không có biện pháp xử lý lại để cho người lao động phải bỏ tiền đóng thay?", nữ đại biểu nói, cảnh báo đây có thể là nguyên nhân họ rời bỏ lưới an sinh.
					</p>
	
					<figure>
						<img class="img_1" src="anh_btl/Dai_bieu_NHBT.jpg" alt="Đại biểu Nguyễn Hoàng Bảo Trân">
						<figcaption>
							<p>Đại biểu Nguyễn Hoàng Bảo Trân. Ảnh: 
								<em>Media Quốc hội</em>
							</p>
						</figcaption>
					</figure>
	
					<p class="p_normal">
						Bà Trân đề nghị đánh giá hiệu quả của hoạt động thanh kiểm tra của cơ quan BHXH, tránh tái diễn việc như thu tiền BHXH sai đối tượng, điển hình như hơn 4.000 chủ hộ kinh doanh cá thể đến nay vẫn chưa được giải quyết dứt điểm quyền lợi.
					</p>
					
					<p class="p_normal">
						"Vì sao đến nay tình trạng trốn đóng, nợ đóng BHXH không hề giảm mà còn tăng lên. Trách nhiệm của người đứng đầu cơ quan BHXH đến đâu", nữ đại biểu đặt câu hỏi, đồng thời đề nghị làm rõ trách nhiệm của các cơ quan liên quan, để khi luật thực thi sẽ hiệu quả để người dân yên tâm với hệ thống.
					</p>
					
					<p class="p_normal">
						Đại biểu Nguyễn Thành Nam (Phó đoàn Phú Thọ) đề nghị mở rộng nguồn lực để hỗ trợ lao động yếu thế trong khoảng thời gian bị công ty chậm, trốn đóng mà chưa xử lý được. Nhất là người bị suy giảm khả năng lao động do tai nạn, ốm đau, bệnh nền, khi họ đã trích đóng BHXH thông qua doanh nghiệp mà lại chịu thiệt thòi.
					</p>
					
					<figure>
						<img class="img_1" src="anh_btl/dan_rut_bh.jpg" alt="Người dân rút Bảo hiểm Xã hội tại Bảo hiểm xã hội TP Thủ Đức">
						<figcaption>
							<p>Người dân rút Bảo hiểm Xã hội tại Bảo hiểm xã hội TP Thủ Đức, tháng 12/2022. Ảnh: 
								<em>Đình Văn</em></p>
						</figcaption>
					</figure>
					
					<p class="p_normal">
						Trước đó, Tổng liên đoàn Lao động Việt Nam cũng kiến nghị Thủ tướng sớm chỉ đạo Bộ Lao động Thương binh và Xã hội rà soát, có chính sách giải quyết quyền lợi bị "treo" cho hơn 213.000 lao động trong doanh nghiệp phá sản, giải thể, chủ bỏ trốn. Theo thống kê hết năm 2022, tiền nợ tại các doanh nghiệp này tới hơn 4.000 tỷ đồng và gần như không thể thu hồi.
					</p>
					
					<p class="p_normal">
						Bộ trưởng Đào Ngọc Dung cho biết đã đề nghị Bảo hiểm xã hội Việt Nam báo cáo Chính phủ, trình Quốc hội chủ trương xóa khoản nợ xấu bằng tiền lãi từ kết dư Quỹ Bảo hiểm xã hội. Khi khoản này được xóa thì mới có thể giải quyết dứt điểm quyền lợi cho người lao động.
					</p>
					
					..co the table o day....................
					
					<p class="p_normal">
						Bảo hiểm xã hội Việt Nam cũng đang đề xuất ba phương án xử lý quyền lợi cho 4.000 chủ hộ kinh doanh cá thể bị thu sai luật từ năm 2003 đến nay. Theo các phương án này, chủ hộ có thể được tính thời gian đã đóng BHXH bắt buộc để hưởng chế độ; được hoàn lại tiền đóng, trả lại tiền đã hưởng chế độ. Các khoản thu hồi lẫn hoàn trả này sẽ không tính lãi.
					</p>
					
					<p class="p_normal">
						Dự án Luật Bảo hiểm xã hội sửa đổi đã được Quốc hội thảo luận tại kỳ họp tháng 10/2023, dự kiến thông qua ngày 25/6 và có hiệu lực từ 1/7/2025.
					</p> -->
					
					<!-- div 2_2 ..............-->
					
					<div class="dv_2_2">
						<%
							for (var bv : bvLienQuan) {
								if (bv.getId() != bvView.getId()) {
									out.print("<article class='muc_moi'>");
									out.print("<div class='dv_anh_1'>");
									out.print("<a href='baiviet.jsp?id=" + bv.getId() + "' title='" + bv.getTitle() + "'>");
									out.print("<img alt='" + bv.getTitle() + "' src='" + bv.getImage() + "'>");
									out.print("</a>");
									out.print("</div>");
									out.print("<h4 class='tieude_moi'>");
									out.print("<a href='baiviet.jsp?id=" + bv.getId() + "' title='" + bv.getTitle() + "'>");
									out.print(bv.getTitle());
									out.print("</a>");
									out.print("</h4>");
									out.print("<p class='nd_p'>");
									out.print("<a href='baiviet.jsp?id=" + bv.getId() + "' title='" + bv.getTitle() + "'>");
									out.print(bv.getDescription());
									out.print("</a>");
									out.print("<span>");
									out.print("<a href='baiviet.jsp?id=" + bv.getId() + "' class='ms-3'>");
									out.print("<svg xmlns='http://www.w3.org/2000/svg' width='12' height='12' fill='#898989' class='svg_ic_cm_1' viewBox='0 0 16 16'>");
									out.print("<path d='M2 0a2 2 0 0 0-2 2v12.793a.5.5 0 0 0 .854.353l2.853-2.853A1 1 0 0 1 4.414 12H14a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2z'/>");
									out.print("</svg>");
									out.print("<span class='ms-2'>" + bv.getBinhLuans().size() + "</span>");
									out.print("</a>");
									out.print("</span>");
									out.print("</p>");
									out.print("</article>");
								}
							}
						%>
						<!-- <article class="muc_moi">
							<div class="dv_anh_1">
								<a href="" title="Đề xuất trích lãi từ Quỹ BHXH giải quyết quyền lợi cho 213.000 lao động">
									<img alt="" src="anh_btl/dx_trich_lai_1.jpg">
								</a>
							</div>
							<h4 class="tieude_moi">
								<a href="" title="Đề xuất trích lãi từ Quỹ BHXH giải quyết quyền lợi cho 213.000 lao động">
									Đề xuất trích lãi từ Quỹ BHXH giải quyết quyền lợi cho 213.000 lao động
								</a>
							</h4>
							<p class="nd_p">
								<a href="" title="Đề xuất trích lãi từ Quỹ BHXH giải quyết quyền lợi cho 213.000 lao động">
									Bộ trưởng Đào Ngọc Dung đề xuất dùng tiền lãi kết dư từ Quỹ BHXH xóa nợ BHXH của doanh nghiệp phá sản, chủ bỏ trốn để giải quyết quyền lợi cho hơn 213.000 lao động.
								</a>
								<span>
									<a href="">
										<svg xmlns="http://www.w3.org/2000/svg" width="12" height="12" fill="#898989" class="svg_ic_cm_1" viewBox="0 0 16 16">
	  										<path d="M2 0a2 2 0 0 0-2 2v12.793a.5.5 0 0 0 .854.353l2.853-2.853A1 1 0 0 1 4.414 12H14a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2z"/>
										</svg>
										<span>40</span>
									</a>
								</span>
							</p>
						</article> -->
					</div>

				<div class="footer_ic">
					<a href="/btl_docbao/views/theloai.jsp?tl=<%= tl.getTextUrl() %>" class="back_a_1" title="Trở lại thời sự">
						<svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="#898989" class="svg_ic_back_1" viewBox="0 0 16 16">
	  						<path fill-rule="evenodd" d="M15 8a.5.5 0 0 0-.5-.5H2.707l3.147-3.146a.5.5 0 1 0-.708-.708l-4 4a.5.5 0 0 0 0 .708l4 4a.5.5 0 0 0 .708-.708L2.707 8.5H14.5A.5.5 0 0 0 15 8"/>
						</svg>
					</a>
					
					<div>
						<p class="save_a_1" title="Lưu bài viết" onclick="saveBaiViet(<%= bvView.getId() %>, <%= userInBaiViet.getId() %>)">
							<svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="#898989" class="svg_ic_sv" viewBox="0 0 16 16">
	  							<path d="M8.5 1.5A1.5 1.5 0 0 1 10 0h4a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V2a2 2 0 0 1 2-2h6c-.314.418-.5.937-.5 1.5v7.793L4.854 6.646a.5.5 0 1 0-.708.708l3.5 3.5a.5.5 0 0 0 .708 0l3.5-3.5a.5.5 0 0 0-.708-.708L8.5 9.293z"/>
							</svg> Lưu
						</p>
					</div>
					
					<div class="xa_hoi">
						<span class="text">Chia sẻ</span>
						
						<a href="" class="icon_a_1" title="Chia sẻ bài viết lên facebook">
							<svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="#898989" class="svg_ic_fb" viewBox="0 0 16 16">
	  							<path d="M16 8.049c0-4.446-3.582-8.05-8-8.05C3.58 0-.002 3.603-.002 8.05c0 4.017 2.926 7.347 6.75 7.951v-5.625h-2.03V8.05H6.75V6.275c0-2.017 1.195-3.131 3.022-3.131.876 0 1.791.157 1.791.157v1.98h-1.009c-.993 0-1.303.621-1.303 1.258v1.51h2.218l-.354 2.326H9.25V16c3.824-.604 6.75-3.934 6.75-7.951"/>
							</svg>
						</a>
						
						<a href="" class="icon_a_1" title="Chia sẻ bài viết lên twitter">
							<svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="#898989" class="svg_ic_tt" viewBox="0 0 16 16">
	  							<path d="M5.026 15c6.038 0 9.341-5.003 9.341-9.334q.002-.211-.006-.422A6.7 6.7 0 0 0 16 3.542a6.7 6.7 0 0 1-1.889.518 3.3 3.3 0 0 0 1.447-1.817 6.5 6.5 0 0 1-2.087.793A3.286 3.286 0 0 0 7.875 6.03a9.32 9.32 0 0 1-6.767-3.429 3.29 3.29 0 0 0 1.018 4.382A3.3 3.3 0 0 1 .64 6.575v.045a3.29 3.29 0 0 0 2.632 3.218 3.2 3.2 0 0 1-.865.115 3 3 0 0 1-.614-.057 3.28 3.28 0 0 0 3.067 2.277A6.6 6.6 0 0 1 .78 13.58a6 6 0 0 1-.78-.045A9.34 9.34 0 0 0 5.026 15"/>
							</svg>
						</a>
						
						<a href="" class="icon_a_1" title="Mail">
							<svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="#898989" class="svg_ic_mail" viewBox="0 0 16 16">
	  							<path d="M.05 3.555A2 2 0 0 1 2 2h12a2 2 0 0 1 1.95 1.555L8 8.414zM0 4.697v7.104l5.803-3.558zM6.761 8.83l-6.57 4.027A2 2 0 0 0 2 14h12a2 2 0 0 0 1.808-1.144l-6.57-4.027L8 9.586zm3.436-.586L16 11.801V4.697z"/>
							</svg>
						</a>
						
						<a href="" class="icon_a_1" title="Copy link">
							<svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="#898989" class="svg_ic_link" viewBox="0 0 16 16">
	  							<path d="M4.715 6.542 3.343 7.914a3 3 0 1 0 4.243 4.243l1.828-1.829A3 3 0 0 0 8.586 5.5L8 6.086a1 1 0 0 0-.154.199 2 2 0 0 1 .861 3.337L6.88 11.45a2 2 0 1 1-2.83-2.83l.793-.792a4 4 0 0 1-.128-1.287z"/>
	  							<path d="M6.586 4.672A3 3 0 0 0 7.414 9.5l.775-.776a2 2 0 0 1-.896-3.346L9.12 3.55a2 2 0 1 1 2.83 2.83l-.793.792c.112.42.155.855.128 1.287l1.372-1.372a3 3 0 1 0-4.243-4.243z"/>
							</svg>
						</a>
					</div>
				</div>
				
			</div>
	
			<div class="dv_3">
				<div class="test">
					<div class="dv_3_a">
						<div class="ads h-100">
							<a href="#">
								<img alt="" class="h-100" src="https://tpc.googlesyndication.com/simgad/14666485097656346377">
							</a>
						</div>
						<!-- <h4 class="dv_3_h4">
							<span title="Tin tài trợ">Tin tài trợ</span>
						</h4>
						
						<hr color="#A52A2A" size="3px" class="hr_d_h4">
						
						<div>
							<article class="muc_moi_1">
								<div class="dv_anh_2">
									<a href="" title="Lý do cha mẹ nên cho con học tranh biện tiếng Anh từ sớm">
										<img width="100px" height="60px" alt="" src="anh_btl/ly_do_cha_me.png">
									</a>
								</div>
								<h4 class="tieude_moi_1">
									<a href="" title="Lý do cha mẹ nên cho con học tranh biện tiếng Anh từ sớm">
										Lý do cha mẹ nên cho con học tranh biện tiếng Anh từ sớm
									</a>
								</h4>
								<p class="p_nha_tai_tro">
									  American Study
								</p>
							</article>
						</div> -->
					</div>
				</div>
			</div>
		</div>
		
		<div class="dv_phu">
			<div class="dv_comment">
				<div class="dv_y_kien">
					<div class="left">
						<h3 style="display: inline-block;font-weight: bold;">Ý kiến</h3>
						(<label class="tong_comment"><%= bvView.getCommentCount() %></label>)
					</div>
				</div>
				
				<div class="input_comment">
					<form id="form_comment" class="row" onsubmit="binhluanBaiViet(event, <%= bvView.getId() %>)">
						<div class="comment_area_input col-10">
							<textarea class="txt_comment" required="required" placeholder="Chia sẻ ý kiến của bạn" style="overflow:hidden;"></textarea>
						</div>
						<!-- <span class="error_txt_comment" style="display: block;">Bạn chưa nhập nội dung bình luận.</span>-->
						<div class="form-group col-2">
							<button type="submit" class="btn_comment">Gửi</button>
						</div>
					</form>
				</div>
				
				<div class="loc_nd">
					<!-- <a href="" class="active" rel="like">Quan tâm nhất</a> -->
					<a class="active" rel="time">Mới nhất</a>
				</div>
			</div>
			
			<div class="box_comment">
				<div class="main_show_comment">
					<div class="muc_comment">
						<%
							for (var bl : bvView.getBinhLuans()) {
								/* Get user binh luan */
								var userBl = userService.getUserById(bl.getId_User());
								
								out.print("<div class='comment-item'>");
								out.print("<div class='user_status'>");
								out.print("<a class='avata_nd' title='Xem trang ý kiến của " + userBl.getName() + "'>");
								out.print("<img alt='" + userBl.getName() + "' src='" + userBl.getImage() + "'>");
								out.print("</a>");
								out.print("</div>");
								out.print("<div class='nd_comment'>");
								out.print("<p class='full_nd'>");
								out.print("<span class='txt_name'>");
								out.print("<a class='nickname' href=''>" + userBl.getName() + "</a>");
								out.print("</span>");
								out.print(bl.getContent());
								out.print("</p>");
								
								out.print("<div class='dv_like_web w-100'>");
								out.print("<div class='reactions_wrap w-100'>");
								out.print("<div class='ic_thich mb-0'>");
								
								out.print("<p class='mb-0'>");
								out.print("<i class='bi bi-hand'></i>");
								out.print("<span class='total_like'>Thích</span>");
								out.print("</p>");
								
								out.print("<div class='reactions_container'>");
								out.print("<div class='reactions_list'>");
								
								/* Get list emotions */
								var emotions = emotionService.getAllEmotion();
								for (var emotion : emotions) {
                                    out.print("<div class='reaction_item' onclick='emotionAction(" + bl.getId() + ", " + emotion.getId() + ")'>");
                                    out.print(emotion.getIcon());
                                    out.print("<span class='label'>" + emotion.getName() + "</span>");
                                    out.print("</div>");
                                }
								out.print("</div>");
								out.print("</div>");
								
								out.print("</div>");
								
								/* Get emotions count */
								int countEmotions = 0;
								out.print("<div class='reactions_total'>");
								for (var emotionOfBl : bl.getBl_Emotions()) {
									out.print("<span class='item_bc_like'>");
									out.print(emotionOfBl.getEmotion().getIcon());
									out.print("</span>");
									countEmotions += emotionOfBl.getCount();
								}
								if (countEmotions > 0) {
									out.print("<span class='number_bc'>" + countEmotions + "</span>");
								}
								/* Display detail emotions */
								out.print("<div class='reactions_detail'>");
								for (var emotionOfBl : bl.getBl_Emotions()) {
                                    out.print("<div class='reaction_item_1'>");
                                    out.print("<span class='icons'>");
                                    out.print(emotionOfBl.getEmotion().getIcon());
                                    out.print("</span>");
                                    out.print("<strong>" + emotionOfBl.getCount() + "</strong>");
                                    out.print("</div>");
                                }
								out.print("</div>");
								out.print("</div>");
								
								out.print("<a class='ms-5 link_reply'>Trả lời</a>");
								out.print("<span class='time_comment' style='position: absolute; right: 0;'>" + bl.getTime() + "</span>");
								out.print("</div>");
								out.print("</div>");
								
								/* Sub comment */
								out.print("<div class='sub_comment mt-3'>");
								out.print("<div class='input_comment reply_input_comment'>");
								out.print("<form class='row' id='reply_form_comment' onsubmit='replyBinhLuan(event, " + bl.getId() + ", " + bvView.getId() + ")'>");
								out.print("<div class='comment_area_input col-10'>");
								out.print("<textarea class='txt_comment' required='required' placeholder='Chia sẻ ý kiến của bạn' style='overflow:hidden;'></textarea>");
								out.print("</div>");
								out.print("<div class='form-group col-2'>");
								out.print("<button type='submit' class='btn_comment'>Gửi</button>");
								out.print("</div>");
								out.print("</form>");
								out.print("</div>");
								
								/* Sub comment list */
								for (var subBl : bl.getBinhLuansReplies()) {
                                    /* Get user sub binh luan */
                                    var userSubBl = userService.getUserById(subBl.getId_User());
                                    
                                    out.print("<div class='muc_sub_comment'>");
                                    out.print("<div class='user_status'>");
                                    out.print("<a class='avata_nd' title='Xem trang ý kiến của " + userSubBl.getName() + "'>");
                                    out.print("<img alt='" + userSubBl.getName() + "' src='" + userSubBl.getImage() + "'>");
                                    out.print("</a>");
                                    out.print("</div>");
                                    
                                    out.print("<div class='nd_comment'>");
                                    out.print("<p class='full_nd'>");
                                    out.print("<span class='txt_name'>");
                                    out.print("<a class='nickname' href=''>" + userSubBl.getName() + "</a>");
                                    out.print("</span>");
                                    out.print(subBl.getContent());
                                    out.print("</p>");
                                    out.print("<div class='dv_like_web w-100'>");
                                    out.print("<div class='reactions_wrap w-100'>");
                                    
                                    out.print("<div class='ic_thich mb-0'>");
                                    out.print("<p class='mb-0'>");
                                    out.print("<i class='bi bi-hand'></i>");
                                    out.print("<span class='total_like'>Thích</span>");
                                    out.print("</p>");
                                    
                                    out.print("<div class='reactions_container'>");
                                    out.print("<div class='reactions_list'>");
                                    /* List emotions */
                                    for (var emotion : emotions) {
                                        out.print("<div class='reaction_item' onclick='emotionAction(" + subBl.getId() + ", " + emotion.getId() + ")'>");
                                        out.print(emotion.getIcon());
                                        out.print("<span class='label'>" + emotion.getName() + "</span>");
                                        out.print("</div>");
                                    }
                                    
                                    out.print("</div>");
                                    out.print("</div>");
                                    
                                    out.print("</div>");
                                    
                                    out.print("<div class='reactions_total'>");
                                    int countSubEmotions = 0;
                                    for (var emotionOfBl : subBl.getBl_Emotions()) {
                                        out.print("<span class='item_bc_like'>");
                                        out.print(emotionOfBl.getEmotion().getIcon());
                                        out.print("</span>");
                                        countSubEmotions += emotionOfBl.getCount();
                                    }
                                    if (countSubEmotions > 0) {
                                    	out.print("<span class='number_bc'>" + countSubEmotions + "</span>");
                                    }
                                    /* Display detail emotions */
                                    out.print("<div class='reactions_detail'>");
                                    
                                    for (var emotionOfBl : subBl.getBl_Emotions()) {
                                        out.print("<div class='reaction_item_1'>");
                                        out.print("<span class='icons'>");
                                        out.print(emotionOfBl.getEmotion().getIcon());
                                        out.print("</span>");
                                        out.print("<strong>" + emotionOfBl.getCount() + "</strong>");
                                        out.print("</div>");
                                    }
                                    
                                    out.print("</div>");
                                    out.print("</div>");
                                    
                                    out.print("<a class='ms-5 link_reply'>Trả lời</a>");
									out.print("<span class='time_comment' style='position: absolute; right: 0;'>" + subBl.getTime() + "</span>");
									out.print("</div>");
									out.print("</div>");
									
									/* Sub comment */
									out.print("<div class='sub_comment'>");
									out.print("<div class='input_comment reply_input_comment'>");
									out.print("<form class='row mt-3' id='reply_form_comment' onsubmit='replyBinhLuan(event, " + bl.getId() + ", " + bvView.getId() + ")'>");
									out.print("<div class='comment_area_input col-10'>");
									out.print("<textarea class='txt_comment' required='required' placeholder='Chia sẻ ý kiến của bạn' style='overflow:hidden;'></textarea>");
									out.print("</div>");
									out.print("<div class='form-group col-2'>");
									out.print("<button type='submit' class='btn_comment'>Gửi</button>");
									out.print("</div>");
									out.print("</form>");
									out.print("</div>");
									
									out.print("</div>");
									
									out.print("</div>");
									out.print("</div>");
									
								}
								out.print("</div>");
								
								if (bl.getBinhLuansReplies().size() > 0) {
									out.print("<p class='count_reply'>");
									out.print("<a class='view_all_reply' href='#'>");
									out.print("<i class='bi bi-arrow-return-right'></i>");
									out.print("<span class='num_reply_cmt'>" + bl.getBinhLuansReplies().size() + "</span>");
									out.print("Trả lời");
									out.print("</a>");
									out.print("</p>");
								}

								out.print("</div>");
								out.print("</div>");
							}
						%>
						<!-- <div class="comment-item">
							<div class="user_status">
								<a class="avata_nd" href="" title="Xem trang ý kiến của Dân đen">
									<img alt="" src="anh_btl/img_user.jpg">
								</a>
							</div>
							
							<div class="nd_comment">
								<p class="full_nd">
									<span class="txt_name">
										<a class="nickname" href="">Dân đen</a>
									</span>
									Người lao động đã khó khăn khổ sở lại yêu cầu họ phải nộp tiền đủ phần trốn nộp của các cty mới cho họ được hưởng chế độ, đúng là ko còn gì để nói.
								</p>
								
								<div class="dv_like_web">
									<div class="reactions_wrap">
										<a class="ic_thich" onmouseover="showReactions(this)" onmouseout="hideReactions(this)">
											<i class="bi bi-hand-thumbs-up"></i>
											<span class="total_like">Thích</span>
										</a>
										
										<div class="reactions_container">
											<div class="reactions_list">
												<div class="reaction_item">
													<i class="fa fa-thumbs-up reaction" style="font-size: 32px"></i>
													<span class="label">Thích</span>
												</div>
												
												<div class="reaction_item">
													<svg class="reaction" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512">!Font Awesome Free 6.5.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc.<path d="M256 512A256 256 0 1 0 256 0a256 256 0 1 0 0 512zM96.8 314.1c-3.8-13.7 7.4-26.1 21.6-26.1H393.6c14.2 0 25.5 12.4 21.6 26.1C396.2 382 332.1 432 256 432s-140.2-50-159.2-117.9zM217.6 212.8l0 0 0 0-.2-.2c-.2-.2-.4-.5-.7-.9c-.6-.8-1.6-2-2.8-3.4c-2.5-2.8-6-6.6-10.2-10.3c-8.8-7.8-18.8-14-27.7-14s-18.9 6.2-27.7 14c-4.2 3.7-7.7 7.5-10.2 10.3c-1.2 1.4-2.2 2.6-2.8 3.4c-.3 .4-.6 .7-.7 .9l-.2 .2 0 0 0 0 0 0c-2.1 2.8-5.7 3.9-8.9 2.8s-5.5-4.1-5.5-7.6c0-17.9 6.7-35.6 16.6-48.8c9.8-13 23.9-23.2 39.4-23.2s29.6 10.2 39.4 23.2c9.9 13.2 16.6 30.9 16.6 48.8c0 3.4-2.2 6.5-5.5 7.6s-6.9 0-8.9-2.8l0 0 0 0zm160 0l0 0-.2-.2c-.2-.2-.4-.5-.7-.9c-.6-.8-1.6-2-2.8-3.4c-2.5-2.8-6-6.6-10.2-10.3c-8.8-7.8-18.8-14-27.7-14s-18.9 6.2-27.7 14c-4.2 3.7-7.7 7.5-10.2 10.3c-1.2 1.4-2.2 2.6-2.8 3.4c-.3 .4-.6 .7-.7 .9l-.2 .2 0 0 0 0 0 0c-2.1 2.8-5.7 3.9-8.9 2.8s-5.5-4.1-5.5-7.6c0-17.9 6.7-35.6 16.6-48.8c9.8-13 23.9-23.2 39.4-23.2s29.6 10.2 39.4 23.2c9.9 13.2 16.6 30.9 16.6 48.8c0 3.4-2.2 6.5-5.5 7.6s-6.9 0-8.9-2.8l0 0 0 0 0 0z"/></svg>
													<span class="label">Vui</span>
												</div>
												
												<div class="reaction_item">
													<svg class="reaction" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512">!Font Awesome Free 6.5.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc.<path d="M256 512A256 256 0 1 0 256 0a256 256 0 1 0 0 512zM176.4 176a32 32 0 1 1 0 64 32 32 0 1 1 0-64zm128 32a32 32 0 1 1 64 0 32 32 0 1 1 -64 0zM256 288a64 64 0 1 1 0 128 64 64 0 1 1 0-128z"/></svg>
													<span class="label">Ngạc nhiên</span>
												</div>
												
												<div class="reaction_item">
													<svg class="reaction" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512">!Font Awesome Free 6.5.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc.<path d="M256 512A256 256 0 1 0 256 0a256 256 0 1 0 0 512zM159.3 388.7c-2.6 8.4-11.6 13.2-20 10.5s-13.2-11.6-10.5-20C145.2 326.1 196.3 288 256 288s110.8 38.1 127.3 91.3c2.6 8.4-2.1 17.4-10.5 20s-17.4-2.1-20-10.5C340.5 349.4 302.1 320 256 320s-84.5 29.4-96.7 68.7zM144.4 208a32 32 0 1 1 64 0 32 32 0 1 1 -64 0zm192-32a32 32 0 1 1 0 64 32 32 0 1 1 0-64z"/></svg>
													<span class="label">Buồn</span>
												</div>
											</div>
										</div>
										
										<div class="reactions_total">
											<span class="item_bc_like">
												<i class="fa fa-thumbs-up reaction_1" style="font-size: 14px"></i>
											</span>
											
											<span class="item_bc_fun">
												<svg class="reaction_1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512">!Font Awesome Free 6.5.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc.<path d="M256 512A256 256 0 1 0 256 0a256 256 0 1 0 0 512zM96.8 314.1c-3.8-13.7 7.4-26.1 21.6-26.1H393.6c14.2 0 25.5 12.4 21.6 26.1C396.2 382 332.1 432 256 432s-140.2-50-159.2-117.9zM217.6 212.8l0 0 0 0-.2-.2c-.2-.2-.4-.5-.7-.9c-.6-.8-1.6-2-2.8-3.4c-2.5-2.8-6-6.6-10.2-10.3c-8.8-7.8-18.8-14-27.7-14s-18.9 6.2-27.7 14c-4.2 3.7-7.7 7.5-10.2 10.3c-1.2 1.4-2.2 2.6-2.8 3.4c-.3 .4-.6 .7-.7 .9l-.2 .2 0 0 0 0 0 0c-2.1 2.8-5.7 3.9-8.9 2.8s-5.5-4.1-5.5-7.6c0-17.9 6.7-35.6 16.6-48.8c9.8-13 23.9-23.2 39.4-23.2s29.6 10.2 39.4 23.2c9.9 13.2 16.6 30.9 16.6 48.8c0 3.4-2.2 6.5-5.5 7.6s-6.9 0-8.9-2.8l0 0 0 0zm160 0l0 0-.2-.2c-.2-.2-.4-.5-.7-.9c-.6-.8-1.6-2-2.8-3.4c-2.5-2.8-6-6.6-10.2-10.3c-8.8-7.8-18.8-14-27.7-14s-18.9 6.2-27.7 14c-4.2 3.7-7.7 7.5-10.2 10.3c-1.2 1.4-2.2 2.6-2.8 3.4c-.3 .4-.6 .7-.7 .9l-.2 .2 0 0 0 0 0 0c-2.1 2.8-5.7 3.9-8.9 2.8s-5.5-4.1-5.5-7.6c0-17.9 6.7-35.6 16.6-48.8c9.8-13 23.9-23.2 39.4-23.2s29.6 10.2 39.4 23.2c9.9 13.2 16.6 30.9 16.6 48.8c0 3.4-2.2 6.5-5.5 7.6s-6.9 0-8.9-2.8l0 0 0 0 0 0z"/></svg>
											</span>
											
											<span class="item_bc_sad">
												<svg class="reaction_1	" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512">!Font Awesome Free 6.5.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc.<path d="M256 512A256 256 0 1 0 256 0a256 256 0 1 0 0 512zM159.3 388.7c-2.6 8.4-11.6 13.2-20 10.5s-13.2-11.6-10.5-20C145.2 326.1 196.3 288 256 288s110.8 38.1 127.3 91.3c2.6 8.4-2.1 17.4-10.5 20s-17.4-2.1-20-10.5C340.5 349.4 302.1 320 256 320s-84.5 29.4-96.7 68.7zM144.4 208a32 32 0 1 1 64 0 32 32 0 1 1 -64 0zm192-32a32 32 0 1 1 0 64 32 32 0 1 1 0-64z"/></svg>
											</span>
											
											<a class="number_bc" href="">2.773</a>
											
											<div class="reactions_detail">
												<div class="reaction_item_1">
													<span class="icons">
														<i class="fa fa-thumbs-up reaction_1" style="font-size: 14px"></i>
													</span>
													<strong>2.557</strong>
												</div>
												
												<div class="reaction_item_2">
													<span class="icons">
														<svg class="reaction_1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512">!Font Awesome Free 6.5.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc.<path d="M256 512A256 256 0 1 0 256 0a256 256 0 1 0 0 512zM96.8 314.1c-3.8-13.7 7.4-26.1 21.6-26.1H393.6c14.2 0 25.5 12.4 21.6 26.1C396.2 382 332.1 432 256 432s-140.2-50-159.2-117.9zM217.6 212.8l0 0 0 0-.2-.2c-.2-.2-.4-.5-.7-.9c-.6-.8-1.6-2-2.8-3.4c-2.5-2.8-6-6.6-10.2-10.3c-8.8-7.8-18.8-14-27.7-14s-18.9 6.2-27.7 14c-4.2 3.7-7.7 7.5-10.2 10.3c-1.2 1.4-2.2 2.6-2.8 3.4c-.3 .4-.6 .7-.7 .9l-.2 .2 0 0 0 0 0 0c-2.1 2.8-5.7 3.9-8.9 2.8s-5.5-4.1-5.5-7.6c0-17.9 6.7-35.6 16.6-48.8c9.8-13 23.9-23.2 39.4-23.2s29.6 10.2 39.4 23.2c9.9 13.2 16.6 30.9 16.6 48.8c0 3.4-2.2 6.5-5.5 7.6s-6.9 0-8.9-2.8l0 0 0 0zm160 0l0 0-.2-.2c-.2-.2-.4-.5-.7-.9c-.6-.8-1.6-2-2.8-3.4c-2.5-2.8-6-6.6-10.2-10.3c-8.8-7.8-18.8-14-27.7-14s-18.9 6.2-27.7 14c-4.2 3.7-7.7 7.5-10.2 10.3c-1.2 1.4-2.2 2.6-2.8 3.4c-.3 .4-.6 .7-.7 .9l-.2 .2 0 0 0 0 0 0c-2.1 2.8-5.7 3.9-8.9 2.8s-5.5-4.1-5.5-7.6c0-17.9 6.7-35.6 16.6-48.8c9.8-13 23.9-23.2 39.4-23.2s29.6 10.2 39.4 23.2c9.9 13.2 16.6 30.9 16.6 48.8c0 3.4-2.2 6.5-5.5 7.6s-6.9 0-8.9-2.8l0 0 0 0 0 0z"/></svg>
													</span>
													<strong>134</strong>
												</div>
												
												<div class="reaction_item_3">
													<span class="icons">
														<svg class="reaction_1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512">!Font Awesome Free 6.5.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc.<path d="M256 512A256 256 0 1 0 256 0a256 256 0 1 0 0 512zM176.4 176a32 32 0 1 1 0 64 32 32 0 1 1 0-64zm128 32a32 32 0 1 1 64 0 32 32 0 1 1 -64 0zM256 288a64 64 0 1 1 0 128 64 64 0 1 1 0-128z"/></svg>
													</span>
													<strong>7</strong>
												</div>
												
												<div class="reaction_item_4">
													<span class="icons">
														<svg class="reaction_1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512">!Font Awesome Free 6.5.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc.<path d="M256 512A256 256 0 1 0 256 0a256 256 0 1 0 0 512zM159.3 388.7c-2.6 8.4-11.6 13.2-20 10.5s-13.2-11.6-10.5-20C145.2 326.1 196.3 288 256 288s110.8 38.1 127.3 91.3c2.6 8.4-2.1 17.4-10.5 20s-17.4-2.1-20-10.5C340.5 349.4 302.1 320 256 320s-84.5 29.4-96.7 68.7zM144.4 208a32 32 0 1 1 64 0 32 32 0 1 1 -64 0zm192-32a32 32 0 1 1 0 64 32 32 0 1 1 0-64z"/></svg>
													</span>
													<strong>35</strong>
												</div>
											</div>
										</div>							
									</div>
									
									<a class="link_reply" href="#" onclick="toggle_reply_input_comment(event)">Trả lời</a>
									
									<a class="report_comment" href="" title="Báo cáo vi phạm">
										<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-flag" viewBox="0 0 16 16">
		  									<path d="M14.778.085A.5.5 0 0 1 15 .5V8a.5.5 0 0 1-.314.464L14.5 8l.186.464-.003.001-.006.003-.023.009a12 12 0 0 1-.397.15c-.264.095-.631.223-1.047.35-.816.252-1.879.523-2.71.523-.847 0-1.548-.28-2.158-.525l-.028-.01C7.68 8.71 7.14 8.5 6.5 8.5c-.7 0-1.638.23-2.437.477A20 20 0 0 0 3 9.342V15.5a.5.5 0 0 1-1 0V.5a.5.5 0 0 1 1 0v.282c.226-.079.496-.17.79-.26C4.606.272 5.67 0 6.5 0c.84 0 1.524.277 2.121.519l.043.018C9.286.788 9.828 1 10.5 1c.7 0 1.638-.23 2.437-.477a20 20 0 0 0 1.349-.476l.019-.007.004-.002h.001M14 1.221c-.22.078-.48.167-.766.255-.81.252-1.872.523-2.734.523-.886 0-1.592-.286-2.203-.534l-.008-.003C7.662 1.21 7.139 1 6.5 1c-.669 0-1.606.229-2.415.478A21 21 0 0 0 3 1.845v6.433c.22-.078.48-.167.766-.255C4.576 7.77 5.638 7.5 6.5 7.5c.847 0 1.548.28 2.158.525l.028.01C9.32 8.29 9.86 8.5 10.5 8.5c.668 0 1.606-.229 2.415-.478A21 21 0 0 0 14 7.655V1.222z"/>
										</svg>
										
										<span class="txt_rp">Báo cáo vi phạm</span>
									</a>
									
									<span class="time_comment">06:39 28/05</span>
								</div>
							</div>
							
							<div class="sub_comment">
								<div class="input_comment reply_input_comment">
									<form id="reply_form_comment" class="row">
										<div class="comment_area_input_1 col-10">
											<textarea class="txt_comment" required="required" placeholder="Chia sẻ ý kiến của bạn" style="overflow:hidden;"></textarea>
										</div>
										<span class="error_txt_comment" style="display: block;">Bạn chưa nhập nội dung bình luận.</span>
										<div class="form-group col-2">
											<button type="submit" class="btn_comment">Gửi</button>
										</div>
									</form>
								</div>
								
								<div class="muc_sub_comment">
									<div class="user_status">
										<a class="avata_nd" href="" title="Xem trang ý kiến của quanghitacom">
											<img alt="" src="anh_btl/img_user.jpg">
										</a>
									</div>
									
									<div class="nd_comment">
										<p class="full_nd">
											<span class="txt_name">
												<a class="nickname" href="">quanghitacom</a>
											</span>
											Trong một vài trường hợp doanh nghiệp bỏ trốn bảo hiểm bị treo, sức khỏe ngày một yếu thì được đóng bù rồi nhận hưu còn tốt hơn
										</p>
										
										<div class="dv_like_web">
											<div class="reactions_wrap">
												<a class="ic_thich" onmouseover="showReactions(this)" onmouseout="hideReactions(this)">
													<svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" fill="currentColor" class="thumb_up" viewBox="0 0 16 16">
				  										<path d="M8.864.046C7.908-.193 7.02.53 6.956 1.466c-.072 1.051-.23 2.016-.428 2.59-.125.36-.479 1.013-1.04 1.639-.557.623-1.282 1.178-2.131 1.41C2.685 7.288 2 7.87 2 8.72v4.001c0 .845.682 1.464 1.448 1.545 1.07.114 1.564.415 2.068.723l.048.03c.272.165.578.348.97.484.397.136.861.217 1.466.217h3.5c.937 0 1.599-.477 1.934-1.064a1.86 1.86 0 0 0 .254-.912c0-.152-.023-.312-.077-.464.201-.263.38-.578.488-.901.11-.33.172-.762.004-1.149.069-.13.12-.269.159-.403.077-.27.113-.568.113-.857 0-.288-.036-.585-.113-.856a2 2 0 0 0-.138-.362 1.9 1.9 0 0 0 .234-1.734c-.206-.592-.682-1.1-1.2-1.272-.847-.282-1.803-.276-2.516-.211a10 10 0 0 0-.443.05 9.4 9.4 0 0 0-.062-4.509A1.38 1.38 0 0 0 9.125.111zM11.5 14.721H8c-.51 0-.863-.069-1.14-.164-.281-.097-.506-.228-.776-.393l-.04-.024c-.555-.339-1.198-.731-2.49-.868-.333-.036-.554-.29-.554-.55V8.72c0-.254.226-.543.62-.65 1.095-.3 1.977-.996 2.614-1.708.635-.71 1.064-1.475 1.238-1.978.243-.7.407-1.768.482-2.85.025-.362.36-.594.667-.518l.262.066c.16.04.258.143.288.255a8.34 8.34 0 0 1-.145 4.725.5.5 0 0 0 .595.644l.003-.001.014-.003.058-.014a9 9 0 0 1 1.036-.157c.663-.06 1.457-.054 2.11.164.175.058.45.3.57.65.107.308.087.67-.266 1.022l-.353.353.353.354c.043.043.105.141.154.315.048.167.075.37.075.581 0 .212-.027.414-.075.582-.05.174-.111.272-.154.315l-.353.353.353.354c.047.047.109.177.005.488a2.2 2.2 0 0 1-.505.805l-.353.353.353.354c.006.005.041.05.041.17a.9.9 0 0 1-.121.416c-.165.288-.503.56-1.066.56z"/>
													</svg>
													<span class="total_like">Thích</span>
												</a>
												
												<div class="reactions_container">
													<div class="reactions_list">
														<div class="reaction_item">
															<i class="fa fa-thumbs-up reaction" style="font-size: 32px"></i>
															<span class="label">Thích</span>
														</div>
														
														<div class="reaction_item">
															<svg class="reaction" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512">!Font Awesome Free 6.5.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc.<path d="M256 512A256 256 0 1 0 256 0a256 256 0 1 0 0 512zM96.8 314.1c-3.8-13.7 7.4-26.1 21.6-26.1H393.6c14.2 0 25.5 12.4 21.6 26.1C396.2 382 332.1 432 256 432s-140.2-50-159.2-117.9zM217.6 212.8l0 0 0 0-.2-.2c-.2-.2-.4-.5-.7-.9c-.6-.8-1.6-2-2.8-3.4c-2.5-2.8-6-6.6-10.2-10.3c-8.8-7.8-18.8-14-27.7-14s-18.9 6.2-27.7 14c-4.2 3.7-7.7 7.5-10.2 10.3c-1.2 1.4-2.2 2.6-2.8 3.4c-.3 .4-.6 .7-.7 .9l-.2 .2 0 0 0 0 0 0c-2.1 2.8-5.7 3.9-8.9 2.8s-5.5-4.1-5.5-7.6c0-17.9 6.7-35.6 16.6-48.8c9.8-13 23.9-23.2 39.4-23.2s29.6 10.2 39.4 23.2c9.9 13.2 16.6 30.9 16.6 48.8c0 3.4-2.2 6.5-5.5 7.6s-6.9 0-8.9-2.8l0 0 0 0zm160 0l0 0-.2-.2c-.2-.2-.4-.5-.7-.9c-.6-.8-1.6-2-2.8-3.4c-2.5-2.8-6-6.6-10.2-10.3c-8.8-7.8-18.8-14-27.7-14s-18.9 6.2-27.7 14c-4.2 3.7-7.7 7.5-10.2 10.3c-1.2 1.4-2.2 2.6-2.8 3.4c-.3 .4-.6 .7-.7 .9l-.2 .2 0 0 0 0 0 0c-2.1 2.8-5.7 3.9-8.9 2.8s-5.5-4.1-5.5-7.6c0-17.9 6.7-35.6 16.6-48.8c9.8-13 23.9-23.2 39.4-23.2s29.6 10.2 39.4 23.2c9.9 13.2 16.6 30.9 16.6 48.8c0 3.4-2.2 6.5-5.5 7.6s-6.9 0-8.9-2.8l0 0 0 0 0 0z"/></svg>
															<span class="label">Vui</span>
														</div>
														
														<div class="reaction_item">
															<svg class="reaction" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512">!Font Awesome Free 6.5.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc.<path d="M256 512A256 256 0 1 0 256 0a256 256 0 1 0 0 512zM176.4 176a32 32 0 1 1 0 64 32 32 0 1 1 0-64zm128 32a32 32 0 1 1 64 0 32 32 0 1 1 -64 0zM256 288a64 64 0 1 1 0 128 64 64 0 1 1 0-128z"/></svg>
															<span class="label">Ngạc nhiên</span>
														</div>
														
														<div class="reaction_item">
															<svg class="reaction" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512">!Font Awesome Free 6.5.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc.<path d="M256 512A256 256 0 1 0 256 0a256 256 0 1 0 0 512zM159.3 388.7c-2.6 8.4-11.6 13.2-20 10.5s-13.2-11.6-10.5-20C145.2 326.1 196.3 288 256 288s110.8 38.1 127.3 91.3c2.6 8.4-2.1 17.4-10.5 20s-17.4-2.1-20-10.5C340.5 349.4 302.1 320 256 320s-84.5 29.4-96.7 68.7zM144.4 208a32 32 0 1 1 64 0 32 32 0 1 1 -64 0zm192-32a32 32 0 1 1 0 64 32 32 0 1 1 0-64z"/></svg>
															<span class="label">Buồn</span>
														</div>
													</div>
												</div>
												
												<div class="reactions_total">
													<span class="item_bc_like">
														<i class="fa fa-thumbs-up reaction_1" style="font-size: 14px"></i>
													</span>
													
													<span class="item_bc_fun">
														<svg class="reaction_1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512">!Font Awesome Free 6.5.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc.<path d="M256 512A256 256 0 1 0 256 0a256 256 0 1 0 0 512zM96.8 314.1c-3.8-13.7 7.4-26.1 21.6-26.1H393.6c14.2 0 25.5 12.4 21.6 26.1C396.2 382 332.1 432 256 432s-140.2-50-159.2-117.9zM217.6 212.8l0 0 0 0-.2-.2c-.2-.2-.4-.5-.7-.9c-.6-.8-1.6-2-2.8-3.4c-2.5-2.8-6-6.6-10.2-10.3c-8.8-7.8-18.8-14-27.7-14s-18.9 6.2-27.7 14c-4.2 3.7-7.7 7.5-10.2 10.3c-1.2 1.4-2.2 2.6-2.8 3.4c-.3 .4-.6 .7-.7 .9l-.2 .2 0 0 0 0 0 0c-2.1 2.8-5.7 3.9-8.9 2.8s-5.5-4.1-5.5-7.6c0-17.9 6.7-35.6 16.6-48.8c9.8-13 23.9-23.2 39.4-23.2s29.6 10.2 39.4 23.2c9.9 13.2 16.6 30.9 16.6 48.8c0 3.4-2.2 6.5-5.5 7.6s-6.9 0-8.9-2.8l0 0 0 0zm160 0l0 0-.2-.2c-.2-.2-.4-.5-.7-.9c-.6-.8-1.6-2-2.8-3.4c-2.5-2.8-6-6.6-10.2-10.3c-8.8-7.8-18.8-14-27.7-14s-18.9 6.2-27.7 14c-4.2 3.7-7.7 7.5-10.2 10.3c-1.2 1.4-2.2 2.6-2.8 3.4c-.3 .4-.6 .7-.7 .9l-.2 .2 0 0 0 0 0 0c-2.1 2.8-5.7 3.9-8.9 2.8s-5.5-4.1-5.5-7.6c0-17.9 6.7-35.6 16.6-48.8c9.8-13 23.9-23.2 39.4-23.2s29.6 10.2 39.4 23.2c9.9 13.2 16.6 30.9 16.6 48.8c0 3.4-2.2 6.5-5.5 7.6s-6.9 0-8.9-2.8l0 0 0 0 0 0z"/></svg>
													</span>
													
													<span class="item_bc_sad">
														<svg class="reaction_1	" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512">!Font Awesome Free 6.5.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc.<path d="M256 512A256 256 0 1 0 256 0a256 256 0 1 0 0 512zM159.3 388.7c-2.6 8.4-11.6 13.2-20 10.5s-13.2-11.6-10.5-20C145.2 326.1 196.3 288 256 288s110.8 38.1 127.3 91.3c2.6 8.4-2.1 17.4-10.5 20s-17.4-2.1-20-10.5C340.5 349.4 302.1 320 256 320s-84.5 29.4-96.7 68.7zM144.4 208a32 32 0 1 1 64 0 32 32 0 1 1 -64 0zm192-32a32 32 0 1 1 0 64 32 32 0 1 1 0-64z"/></svg>
													</span>
													
													<a class="number_bc" href="">64</a>
													
													<div class="reactions_detail">
														<div class="reaction_item_1">
															<span class="icons">
																<i class="fa fa-thumbs-up reaction_1" style="font-size: 14px"></i>
															</span>
															<strong>50</strong>
														</div>
														
														<div class="reaction_item_2">
															<span class="icons">
																<svg class="reaction_1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512">!Font Awesome Free 6.5.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc.<path d="M256 512A256 256 0 1 0 256 0a256 256 0 1 0 0 512zM96.8 314.1c-3.8-13.7 7.4-26.1 21.6-26.1H393.6c14.2 0 25.5 12.4 21.6 26.1C396.2 382 332.1 432 256 432s-140.2-50-159.2-117.9zM217.6 212.8l0 0 0 0-.2-.2c-.2-.2-.4-.5-.7-.9c-.6-.8-1.6-2-2.8-3.4c-2.5-2.8-6-6.6-10.2-10.3c-8.8-7.8-18.8-14-27.7-14s-18.9 6.2-27.7 14c-4.2 3.7-7.7 7.5-10.2 10.3c-1.2 1.4-2.2 2.6-2.8 3.4c-.3 .4-.6 .7-.7 .9l-.2 .2 0 0 0 0 0 0c-2.1 2.8-5.7 3.9-8.9 2.8s-5.5-4.1-5.5-7.6c0-17.9 6.7-35.6 16.6-48.8c9.8-13 23.9-23.2 39.4-23.2s29.6 10.2 39.4 23.2c9.9 13.2 16.6 30.9 16.6 48.8c0 3.4-2.2 6.5-5.5 7.6s-6.9 0-8.9-2.8l0 0 0 0zm160 0l0 0-.2-.2c-.2-.2-.4-.5-.7-.9c-.6-.8-1.6-2-2.8-3.4c-2.5-2.8-6-6.6-10.2-10.3c-8.8-7.8-18.8-14-27.7-14s-18.9 6.2-27.7 14c-4.2 3.7-7.7 7.5-10.2 10.3c-1.2 1.4-2.2 2.6-2.8 3.4c-.3 .4-.6 .7-.7 .9l-.2 .2 0 0 0 0 0 0c-2.1 2.8-5.7 3.9-8.9 2.8s-5.5-4.1-5.5-7.6c0-17.9 6.7-35.6 16.6-48.8c9.8-13 23.9-23.2 39.4-23.2s29.6 10.2 39.4 23.2c9.9 13.2 16.6 30.9 16.6 48.8c0 3.4-2.2 6.5-5.5 7.6s-6.9 0-8.9-2.8l0 0 0 0 0 0z"/></svg>
															</span>
															<strong>1</strong>
														</div>
														
														<div class="reaction_item_3">
															<span class="icons">
																<svg class="reaction_1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512">!Font Awesome Free 6.5.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc.<path d="M256 512A256 256 0 1 0 256 0a256 256 0 1 0 0 512zM176.4 176a32 32 0 1 1 0 64 32 32 0 1 1 0-64zm128 32a32 32 0 1 1 64 0 32 32 0 1 1 -64 0zM256 288a64 64 0 1 1 0 128 64 64 0 1 1 0-128z"/></svg>
															</span>
															<strong>2</strong>
														</div>
														
														<div class="reaction_item_4">
															<span class="icons">
																<svg class="reaction_1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512">!Font Awesome Free 6.5.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc.<path d="M256 512A256 256 0 1 0 256 0a256 256 0 1 0 0 512zM159.3 388.7c-2.6 8.4-11.6 13.2-20 10.5s-13.2-11.6-10.5-20C145.2 326.1 196.3 288 256 288s110.8 38.1 127.3 91.3c2.6 8.4-2.1 17.4-10.5 20s-17.4-2.1-20-10.5C340.5 349.4 302.1 320 256 320s-84.5 29.4-96.7 68.7zM144.4 208a32 32 0 1 1 64 0 32 32 0 1 1 -64 0zm192-32a32 32 0 1 1 0 64 32 32 0 1 1 0-64z"/></svg>
															</span>
															<strong>1</strong>
														</div>
													</div>
												</div>							
											</div>
											
											<a class="link_reply ms-3" href="#" onclick="toggle_reply_input_comment(event)">Trả lời</a>
											
											<a class="report_comment" href="" title="Báo cáo vi phạm">
												<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-flag" viewBox="0 0 16 16">
				  									<path d="M14.778.085A.5.5 0 0 1 15 .5V8a.5.5 0 0 1-.314.464L14.5 8l.186.464-.003.001-.006.003-.023.009a12 12 0 0 1-.397.15c-.264.095-.631.223-1.047.35-.816.252-1.879.523-2.71.523-.847 0-1.548-.28-2.158-.525l-.028-.01C7.68 8.71 7.14 8.5 6.5 8.5c-.7 0-1.638.23-2.437.477A20 20 0 0 0 3 9.342V15.5a.5.5 0 0 1-1 0V.5a.5.5 0 0 1 1 0v.282c.226-.079.496-.17.79-.26C4.606.272 5.67 0 6.5 0c.84 0 1.524.277 2.121.519l.043.018C9.286.788 9.828 1 10.5 1c.7 0 1.638-.23 2.437-.477a20 20 0 0 0 1.349-.476l.019-.007.004-.002h.001M14 1.221c-.22.078-.48.167-.766.255-.81.252-1.872.523-2.734.523-.886 0-1.592-.286-2.203-.534l-.008-.003C7.662 1.21 7.139 1 6.5 1c-.669 0-1.606.229-2.415.478A21 21 0 0 0 3 1.845v6.433c.22-.078.48-.167.766-.255C4.576 7.77 5.638 7.5 6.5 7.5c.847 0 1.548.28 2.158.525l.028.01C9.32 8.29 9.86 8.5 10.5 8.5c.668 0 1.606-.229 2.415-.478A21 21 0 0 0 14 7.655V1.222z"/>
												</svg>
												
												<span class="txt_rp">Báo cáo vi phạm</span>
											</a>
											
											<span class="time_comment">06:39 28/05</span>
										</div>
									</div>
								</div>
							</div>
							
							<p class="count_reply">
								<a class="view_all_reply" href="#">
									<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-return-right" viewBox="0 0 16 16">
		  								<path fill-rule="evenodd" d="M1.5 1.5A.5.5 0 0 0 1 2v4.8a2.5 2.5 0 0 0 2.5 2.5h9.793l-3.347 3.346a.5.5 0 0 0 .708.708l4.2-4.2a.5.5 0 0 0 0-.708l-4-4a.5.5 0 0 0-.708.708L13.293 8.3H3.5A1.5 1.5 0 0 1 2 6.8V2a.5.5 0 0 0-.5-.5"/>
									</svg>
									<span class="num_reply_cmt">39</span>
									Trả lời
								</a>
							</p>
						</div> -->
					</div>
				</div>
			</div>
			
			<div>
				<h3 class="theloai-h3">
					<a href="theloai.jsp?tl=<%= tl.getTextUrl() %>"><%= tl.getName() %></a>
				</h3>
				
				<div class="dv_phu_2 mt-4">
					<%
						for (var bv : bvByTheloais) {
							if (bv.getId() != bvView.getId()) {
								out.print("<article class='muc_moi_phu'>");
								out.print("<div class='dv_anh_1_phu'>");
								out.print("<a href='baiviet.jsp?id=" + bv.getId() + "' title='" + bv.getTitle() + "'>");
								out.print("<img alt='" + bv.getTitle() + "' src='" + bv.getImage() + "'>");
								out.print("</a>");
								out.print("</div>");
								out.print("<h4 class='tieude_moi_phu'>");
								out.print("<a href='baiviet.jsp?id=" + bv.getId() + "' title='" + bv.getTitle() + "'>");
								out.print(bv.getTitle());
								out.print("</a>");
								out.print("</h4>");
								out.print("<p class='nd_p_phu'>");
								out.print("<a href='baiviet.jsp?id=" + bv.getId() + "' title='" + bv.getTitle() + "'>");
								out.print(bv.getDescription());
								out.print("</a>");
								out.print("</p>");
								out.print("<p class='nd_p_phu_2'>");
								out.print("<a href='theloai.jsp?tl=" + tl.getTextUrl() + "' title='" + tl.getName() + "'>");
								out.print(tl.getName());
								out.print("</a>");
								out.print("</p>");
								out.print("</article>");
							}
						}
					%>
						<!-- <article class="muc_moi_phu">
							<div class="dv_anh_1_phu">
								<a href="" title="26 ủy viên, nguyên ủy viên trung ương bị kỷ luật 3 năm qua">
									<img alt="" src="anh_btl/26_uy_vien.jpg">
								</a>
							</div>
							<h4 class="tieude_moi_phu">
								<a href="" title="26 ủy viên, nguyên ủy viên trung ương bị kỷ luật 3 năm qua">
									26 ủy viên, nguyên ủy viên trung ương bị kỷ luật 3 năm qua
								</a>
							</h4>
							<p class="nd_p_phu">
								<a href="" title="26 ủy viên, nguyên ủy viên trung ương bị kỷ luật 3 năm qua">
									Từ đầu nhiệm kỳ Đại hội 13 (tháng 1/2021) đến nay, Ủy ban Kiểm tra Trung ương đã đề nghị cấp có thẩm quyền kỷ luật 26 ủy viên, nguyên ủy viên Trung ương.
								</a>
							</p>
							<p class="nd_p_phu_2">
								<a href="" title="Thời sự">
									Thời sự
								</a>
							</p>
						</article> -->
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