<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
</head>
<body>
	<header>
        <div class="top-header container d-flex justify-content-between">
            <div class="left-top-header d-flex">
                <div class="img-logo">
                    <a href="#">
                        <img src="./acssets/img/Logo.png" alt="">
                    </a>
                </div>
                <span>Thứ 6, 14/06/2024</span>
                <span>Hà Nội   <i class="bi bi-cloud-sun-fill"></i>  32 <sup>o</sup></span>
            </div>
            <div class="right-top-header d-flex">
                <a href="">Mới nhất</a>
                <a href="">Tin theo khu vực</a>
                <a href=""><img src="./acssets/img/MiniLogo.png" alt=""> International</a>
                <span><i class="bi bi-search"></i></span>
                <span><i class="bi bi-person"></i> Đăng nhập</span>
                <span><i class="bi bi-bell"></i></span>
            </div>
        </div>
        <div class="line" style="Border-bottom: 1px solid #ccc">
        </div>
        <div class="bottom-header d-flex justify-content-center">
            <ul class="d-flex justify-content-between">
                <li><a href=""><i class="bi bi-house-fill"></i></a></li>
                <li><a href="">Thời sự</a></li>
                <li><a href="">Góc nhìn</a></li>
                <li><a href="">Thế giới</a></li>
                <li><a href="">Video</a></li>
                <li><a href="">Podcasts</a></li>
                <li><a href="">Kinh Doanh</a></li>
                <li><a href="">Bất động sản</a></li>
                <li><a href="">Khoa học</a></li>
                <li><a href="">Giải trí</a></li>
                <li><a href="">Thể Thao</a></li>
                <li><a href="">Pháp luật</a></li>
                <li><a href="">Giáo dục</a></li>
                <li><a href="">Sức khỏe</a></li>
                <li><a href="">Đời sống</a></li>
                <li><a href="">Du lịch</a></li>
                <li><a href="">Số hóa</a></li>
                <li><a href="">Xe</a></li>
                <li><a href="">Ý kiến</a></li>
                <li><a href="">Tâm sự</a></li>
                <li><a href="">Thư giãn</a></li>
                <li><a href=""><i class="bi bi-list"></i></a></li>
            </ul>
        </div>
    </header>
    <footer class="container footer">
        <div class="top-footer">
            <ul class="d-flex">
                <li>
                    <ul class="hot-member">
                        <li><a href="">Trang Chủ</a></li>
                        <li><a href="">Video</a></li>
                        <li><a href="">Podcasts</a></li>
                        <li><a href="">Ảnh</a></li>
                        <li><a href="">Infographics</a></li>
                    </ul>
                </li>
                <li>
                    <ul>
                        <li><a href="">Thời sự</a></li>
                        <li><a href="">Góc nhìn</a></li>
                        <li><a href="">Thế giới</a></li>
                        <li><a href="">Kinh doanh</a></li>
                        <li><a href="">Bất động sản</a></li>
                        <li><a href="">Giải trí</a></li>
                    </ul>
                </li>
                <li>
                    <ul>
                        <li><a href="">Thể thao</a></li>
                        <li><a href="">Pháp luật</a></li>
                        <li><a href="">Giáo dục</a></li>
                        <li><a href="">Sưc khỏe</a></li>
                        <li><a href="">Đời sống</a></li>
                        <li><a href="">Du lịch</a></li>
                    </ul>
                </li>
                <li>
                    <ul>
                        <li><a href="">Khoa học</a></li>
                        <li><a href="">Số hóa</a></li>
                        <li><a href="">Xe</a></li>
                        <li><a href="">Ý kiến</a></li>
                        <li><a href="">Tâm sự</a></li>
                        <li><a href="">Thư giãn</a></li>
                    </ul>
                </li>
                <li style="border-left: 1px solid #ccc; border-right: 1px solid #ccc ;">
                    <ul>
                        <li><a href="">Rao vặt</a></li>
                        <li><a href="">Startup</a></li>
                        <li><a href="">Mua ảnh</a></li>
                    </ul>
                </li>
                <li class="hot-line">
                    <p>Đường dây nóng:</p>
                    <span>037.988.5603 || 038.756.8335</span>
                </li>
            </ul>
        </div>
        <div class="bottom-footer d-flex justify-content-between">
            <div class="left-footer d-flex align-items-center">
                <span>Báo điện tử</span><img src="./acssets/img/Logo.png" alt="">
            </div>
            <div class="right-footer d-flex align-items-center">
                <ul class="d-flex align-items-center">
                    <li><a href="">Điều khoản sử dụng</a></li>
                    <li><a href="">Chính sách bảo mật</a></li>
                    <li><a href="">Cookies</a></li>
                    <li><a href="">RSS</a></li>
                </ul>
                <span>Theo dõi VnExpress trên</span><a href=""><i class="bi bi-facebook"></i></a><a href=""><i class="bi bi-twitter"></i></a>
                <a href="" style="color: red"><i class="bi bi-youtube"></i></a>
            </div>
        </div>
    </footer>
</body>
</html>