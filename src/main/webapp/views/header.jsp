<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
	<header>
        <div class="top-header container d-flex justify-content-between">
            <div class="left-top-header d-flex">
                <div class="img-logo">
                    <a href="/btl_docbao/views/home.jsp">
                        <img src="/btl_docbao/assets/images/Logo.png" alt="">
                    </a>
                </div>
                <span class="date-now"></span>
                <span>Hà Nội   <i class="bi bi-cloud-sun-fill"></i>  32 <sup>o</sup></span>
            </div>
            <div class="right-top-header d-flex">
                <a href="">Mới nhất</a>
                <a href="">Tin theo khu vực</a>
                <a href="" class="d-flex align-items-center"><img src="/btl_docbao/assets/images/MiniLogo.png" alt="" class="me-2"> International</a>
                <span><i class="bi bi-search"></i></span>
                <%
                	 String email = (String) session.getAttribute("email");
                	 if (email != null) {
                		 out.print("<a href=''>" + email + "</a>");
                	 } else {
                		 out.print("<a href=''/btl_docbao/views/login.jsp'><i class='bi bi-person'></i> Đăng nhập</a>");
                	 }
                %>
                <!-- <a href="/btl_docbao/views/login.jsp"><i class="bi bi-person"></i> Đăng nhập</a> -->
                <span><i class="bi bi-bell"></i></span>
            </div>
        </div>
        <div class="line" style="Border-bottom: 1px solid #ccc">
        </div>
        <div class="bottom-header d-flex justify-content-center">
            <ul class="d-flex justify-content-between">
                <li><a href="/btl_docbao/views/home.jsp"><i class="bi bi-house-fill"></i></a></li>
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
                <li><a href=""><i class="bi bi-list"></i></a></li>
            </ul>
        </div>
        <script>
        	/* Get date now */
        	const date = new Date();
        	const dateNow = "Thứ " + (date.getDay() + 1) + ", " + date.getDate() + "/" + (date.getMonth() + 1) + "/" + date.getFullYear()
        	document.querySelector(".date-now").innerHTML = dateNow;
        </script>
    </header>