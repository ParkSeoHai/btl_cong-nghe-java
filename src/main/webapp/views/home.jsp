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
						<div class="item-news">
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
									<a href="" class="count-cmt">
										<i class="bi bi-chat-fill icon"></i>
										<span>117</span>
									</a>
								</p>
							</div>
						</div>
						<!-- Item 1 -->
						<div class="item-news">
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
						</div>
					</div>
					<div class="col-right">
						<!-- Item 1 -->
						<div class="box-category">
							<div class="tabs">
								<ul class="list-tabs">
									<li class="nav-item">
										<a href="" class="nav-link active">Kinh doanh</a>
									</li>
									<li class="nav-item">
										<a href="" class="nav-link">Quốc tế</a>
									</li>
									<li class="nav-item">
										<a href="" class="nav-link">Doanh nghiệp</a>
									</li>
									<li class="nav-item">
										<a href="" class="nav-link">Chứng khoán</a>
									</li>
									<li class="nav-item">
										<a href="" class="nav-link">Hậu trường kinh doanh</a>
									</li>
								</ul>
							</div>
							<div class="block-content">
								<div class="list-news row">
									<div class="item-new col-8">
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
	
									<div class="item-new col-4">
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
								<div class="sub-news">
									<div class="item-sub">
										<h3 class="title line-clamp-3">
											<a href="">Giá vàng bình ổn sẽ không quá 80 triệu đồng một lượng</a>
											<a href="" class="count-cmt">
												<i class="bi bi-chat-fill icon"></i>
												<span>117</span>
											</a>
										</h3>
									</div>
									<div class="item-sub">
										<h3 class="title line-clamp-3">
											<a href="">Các nhà vàng đồng loạt hạ giá về dưới 80 triệu đồng</a>
										</h3>
									</div>
									<div class="item-sub">
										<h3 class="title line-clamp-3">
											<a href="">Gặp khó ở Mỹ, Shein muốn IPO tại Anh</a>
										</h3>
									</div>
								</div>
							</div>
						</div>
						
						<!-- Item 2 -->
						<div class="box-category">
							<div class="tabs">
								<ul class="list-tabs">
									<li class="nav-item">
										<a href="" class="nav-link active">Bất động sản</a>
									</li>
									<li class="nav-item">
										<a href="" class="nav-link">Quốc tế</a>
									</li>
									<li class="nav-item">
										<a href="" class="nav-link">Doanh nghiệp</a>
									</li>
									<li class="nav-item">
										<a href="" class="nav-link">Chứng khoán</a>
									</li>
									<li class="nav-item">
										<a href="" class="nav-link">Hậu trường kinh doanh</a>
									</li>
								</ul>
							</div>
							<div class="block-content">
								<div class="list-news row">
									<div class="item-new col-8">
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
	
									<div class="item-new col-4">
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
								<div class="sub-news">
									<div class="item-sub">
										<h3 class="title line-clamp-3">
											<a href="">Giá vàng bình ổn sẽ không quá 80 triệu đồng một lượng</a>
											<a href="" class="count-cmt">
												<i class="bi bi-chat-fill icon"></i>
												<span>117</span>
											</a>
										</h3>
									</div>
									<div class="item-sub">
										<h3 class="title line-clamp-3">
											<a href="">Các nhà vàng đồng loạt hạ giá về dưới 80 triệu đồng</a>
										</h3>
									</div>
									<div class="item-sub">
										<h3 class="title line-clamp-3">
											<a href="">Gặp khó ở Mỹ, Shein muốn IPO tại Anh</a>
										</h3>
									</div>
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
	
	<!-- Import footer -->
	<div style="height: 100px"></div>
</body>
</html>