<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<!doctype html>
<html lang="en">

<head>
<title>Title</title>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link rel="stylesheet" href="/ASM-Java-4/NguoiDung/CSS/layout.css">
<link rel="stylesheet" href="/ASM-Java-4/NguoiDung/CSS/xemphim.css">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<link rel="stylesheet" href="fontawesome-free-6.2.1-web/css/all.min.css">


<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" />

<base href="/ASM-Java-4/" />

<fmt:setBundle basename="edu.poly.resources.app" />

</head>

<body>
	<div class="container-fluid p-0 " style="background-color: #0c2738;">
		<div class="container">
			<nav class="navbar navbar-expand-lg">
				<a class="navbar-brand " href="HomeServlet"> <img
					src="/ASM-Java-4/NguoiDung/image/logo1.png" alt="" width="200"
					height="50" class="img-fluid">
				</a>
				<button class="navbar-toggler" type="button" data-toggle="collapse"
					data-target="#navbarSupportedContent"
					aria-controls="navbarSupportedContent" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>

				<c:url var="home" value="/home" />

				<div class="collapse navbar-collapse" id="navbarSupportedContent">
					<c:if test="${not empty USER }">

						<ul class="navbar-nav ml-auto">
							<li class="nav-item active"><a
								class="nav-link nav-link-active" href="HomeServlet">Trang chủ<span
									class="sr-only">(current)</span> </a></li>
							<li class="nav-item"><a class="nav-link"
								href="FavoriteVideo">Trang yêu thích</a></li>
							<li class="nav-item dropdown"><a
								class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
								role="button" data-toggle="dropdown" aria-haspopup="true"
								aria-expanded="false"> Tài khoản
							</a>
								<div class="dropdown-menu" aria-labelledby="navbarDropdown">
									<a class="dropdown-item" href="ThongTinServlet">Thông tin tài khoản</a>
									<a class="dropdown-item" href="DangXuatServlet">Đăng xuất</a>

								</div></li>
						</ul>
					</c:if>
					<c:if test="${ empty USER }">
						<ul class="navbar-nav ml-auto">
							<li class="nav-item active"><a
								class="nav-link nav-link-active" href="HomeServlet">Trang chủ
									<span class="sr-only">(current)</span> </a></li>

							<li class="nav-item dropdown"><a
								class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
								role="button" data-toggle="dropdown" aria-haspopup="true"
								aria-expanded="false">Tài khoản
							</a>
								<div class="dropdown-menu" aria-labelledby="navbarDropdown">
									<a class="dropdown-item" href="DangNhapServlet">Đăng nhập</a>
									<a class="dropdown-item" href="DangKiServlet">Đăng kí</a>
									<a class="dropdown-item" href="ForgotPassServlet">Quên mật khẩu</a>
								</div></li>
						</ul>
					</c:if>

				</div>
			</nav>
		</div>
	</div>
	<jsp:include page="${VIEWS }"></jsp:include>
	<div class="container-fluid footer">
		<div class="container  ">
			<div class="row">
				<div class="col-7">
					<div class="row">
						<div class="col-4 ">
							<div class="footer-item">
								<a href="">Bản quyền 2</a>
							</div>
							<div class="footer-item">
								<a href="">Về chúng tôi</a>
							</div>
							<div class="footer-item">
								<a href="">Truyện 3D</a>
							</div>
						</div>
						<div class="col-4">
							<div class="footer-item">
								<a href="">Bản quyền 2</a>
							</div>
							<div class="footer-item">
								<a href="">Về chúng tôi</a>
							</div>
							<div class="footer-item">
								<a href="">Truyện 3D</a>
							</div>
						</div>
						<div class="col-4">
							<div class="footer-item">
								<a href="">Bản quyền 2</a>
							</div>
							<div class="footer-item">
								<a href="">Về chúng tôi</a>
							</div>
							<div class="footer-item">
								<a href="">Truyện 3D</a>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="row text-center">
				<div class="col footer-b"
					style="border-top: 1px solid rgb(176, 174, 170, 0.4); padding-top: 30px;">
					<p>Copyright © LDT Dev</p>
				</div>
			</div>
		</div>
	</div>

	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
		integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
		integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
		crossorigin="anonymous"></script>




</body>

</html>