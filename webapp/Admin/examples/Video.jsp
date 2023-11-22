<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link rel="apple-touch-icon" sizes="76x76"
	href="/ASM-Java-4/Admin/assets/img/apple-icon.png">
<link rel="icon" type="image/png"
	href="/ASM-Java-4/Admin/assets/img/favicon.png">

<title>Paper Dashboard 2 by Creative Tim</title>

<!--     Fonts and icons     -->
<link
	href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200"
	rel="stylesheet" />
<link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css"
	rel="stylesheet">
<!-- CSS Files -->
<link href="/ASM-Java-4/Admin/assets/css/bootstrap.min.css"
	rel="stylesheet" />
<link href="/ASM-Java-4/Admin/assets/css/paper-dashboard.css?v=2.0.1"
	rel="stylesheet" />
<!-- CSS Just for demo purpose, don't include it in your project -->
<link href="ASM-Java-4/Admin/assets/demo/demo.css" rel="stylesheet" />
</head>

<base href="/ASM-Java-4/" />
<body class="">
	<div class="wrapper ">
		<div class="sidebar" data-color="white" data-active-color="danger">
			<div class="logo">
				<a href="https://www.creative-tim.com" class="simple-text logo-mini">
					<div class="logo-image-small">
						<img src="/ASM-Java-4/Admin/assets/img/logo-small.png">
					</div> <!-- <p>CT</p> -->
				</a> <a href="https://www.creative-tim.com"
					class="simple-text logo-normal"> Creative Tim <!-- <div class="logo-image-big">
            <img src="/ASM-Java-4/Admin/assets/img/logo-big.png">
          </div> -->
				</a>
			</div>
			<div class="sidebar-wrapper">
				<ul class="nav">
					<li class="active "><a href="/ASM-Java-4/VideoServlet"> <i
							class="nc-icon nc-bank"></i>
							<p>Video</p>
					</a></li>
					<li><a href="/ASM-Java-4/UserServlet"> <i
							class="nc-icon nc-diamond"></i>
							<p>User</p>
					</a></li>
					<li><a href="/ASM-Java-4/ReportsServlet"> <i
							class="nc-icon nc-pin-3"></i>
							<p>Reports</p>
					</a></li>
				</ul>
			</div>
		</div>
		<div class="main-panel"
			style="background-color: rgb(250, 235, 215, 0.9);">
			<!-- Navbar -->
			<nav
				class="navbar navbar-expand-lg navbar-absolute fixed-top navbar-transparent">
				<div class="container-fluid">
					<div class="navbar-wrapper">
						<div class="navbar-toggle">
							<button type="button" class="navbar-toggler">
								<span class="navbar-toggler-bar bar1"></span> <span
									class="navbar-toggler-bar bar2"></span> <span
									class="navbar-toggler-bar bar3"></span>
							</button>
						</div>
						<a class="navbar-brand" href="javascript:;"
							style="font-weight: 600">ViDeo</a>
					</div>
					<button class="navbar-toggler" type="button" data-toggle="collapse"
						data-target="#navigation" aria-controls="navigation-index"
						aria-expanded="false" aria-label="Toggle navigation">
						<span class="navbar-toggler-bar navbar-kebab"></span> <span
							class="navbar-toggler-bar navbar-kebab"></span> <span
							class="navbar-toggler-bar navbar-kebab"></span>
					</button>
					<div class="collapse navbar-collapse justify-content-end"
						id="navigation">
						<form>
							<div class="input-group no-border">
								<input type="text" value="" class="form-control"
									placeholder="Search...">
								<div class="input-group-append">
									<div class="input-group-text">
										<i class="nc-icon nc-zoom-split"></i>
									</div>
								</div>
							</div>
						</form>
						<ul class="navbar-nav">
							<li class="nav-item"><a class="nav-link btn-magnify"
								href="javascript:;"> <i class="nc-icon nc-layout-11"></i>
									<p>
										<span class="d-lg-none d-md-block">Stats</span>
									</p>
							</a></li>
							<li class="nav-item btn-rotate dropdown"><a
								class="nav-link dropdown-toggle" href="http://example.com"
								id="navbarDropdownMenuLink" data-toggle="dropdown"
								aria-haspopup="true" aria-expanded="false"> <i
									class="nc-icon nc-bell-55"></i>
									<p>
										<span class="d-lg-none d-md-block">Some Actions</span>
									</p>
							</a>
								<div class="dropdown-menu dropdown-menu-right"
									aria-labelledby="navbarDropdownMenuLink">
									<a class="dropdown-item" href="#">Action</a> <a
										class="dropdown-item" href="#">Another action</a> <a
										class="dropdown-item" href="#">Something else here</a>
								</div></li>
							<li class="nav-item"><a class="nav-link btn-rotate"
								href="javascript:;"> <i class="nc-icon nc-settings-gear-65"></i>
									<p>
										<span class="d-lg-none d-md-block">Account</span>
									</p>
							</a></li>
						</ul>
					</div>
				</div>
			</nav>
			<!-- End Navbar -->
			<div class="content">
				<div class="row">
					<div class="col">
						<c:if test="${not empty MESSAGE }">
							<div class="alert alert-success">
								<strong>${MESSAGE }</strong>
							</div>
						</c:if>
						<c:if test="${not empty ERROR }">
							<div class="alert alert-danger">
								<strong>${ERROR }</strong>
							</div>
						</c:if>
					</div>
				</div>
				<div class="row">
					<div class="col">
						<form method="post" enctype="multipart/form-data">
							<div class="form-group">
								<label for="exampleInputEmail1" style="font-weight: 600">ID</label>
								<input type="text" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" placeholder="Enter id video"
									name="videoId" value="${VIDEO.videoId }">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1" style="font-weight: 600">Title</label>
								<input type="text" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" placeholder="Enter title video"
									name="title" value="${VIDEO.title }">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1" style="font-weight: 600">Link</label>
								<input type="text" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" placeholder="Enter title video"
									name="namevideo" value="${VIDEO.namevideo }">
							</div>
							<div class="">
								<label for="" style="font-weight: 600">Poster</label> <input
									type="file" class="" id="" name="poster"
									value="${VIDEO.poster }">
							</div>

							<div class="form-group">
								<label for="exampleInputEmail1" style="font-weight: 600">Đạo
									diễn</label> <input type="text" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									placeholder="Enter daodien" name="daodien"
									value="${VIDEO.daodien }">
							</div>

							<div class="form-group">
								<label for="exampleInputEmail1" style="font-weight: 600">Diễn
									viên</label> <input type="text" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									placeholder="Enter dienvien" name="dienvien"
									value="${VIDEO.dienvien }">
							</div>

							<div class="form-group">
								<label for="exampleInputEmail1" style="font-weight: 600">Thời
									lượng</label> <input type="text" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									placeholder="Enter thoiluong" name="thoiluong"
									value="${VIDEO.thoiluong }">
							</div>

							<div class="form-group">
								<label for="exampleInputEmail1" style="font-weight: 600">Trạng
									thái</label> <input type="text" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									placeholder="Enter trangthai" name="trangthai"
									value="${VIDEO.trangthai }">
							</div>

							<div class="form-group">
								<label for="exampleInputEmail1" style="font-weight: 600">Nắm
									sản xuất</label> <input type="text" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									placeholder="Enter namsx" name="namsx" value="${VIDEO.namsx }">
							</div>

							<div class="form-group">
								<label for="exampleInputEmail1" style="font-weight: 600">Quốc
									gia</label> <input type="text" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									placeholder="Enter quocgia" name="quocgia"
									value="${VIDEO.quocgia }">
							</div>

							<div class="form-group">
								<label for="exampleInputEmail1" style="font-weight: 600">Thể
									loại</label> <input type="text" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									placeholder="Enter title video" name="theloai"
									value="${VIDEO.theloai }">
							</div>

							<div class="form-group">
								<label for="exampleInputEmail1" style="font-weight: 600">Ghi
									chú</label>
								<textarea rows="5" cols="150" name="description" value="">${VIDEO.description }</textarea>
							</div>
							<button type="submit" class="btn btn-primary"
								formaction="VideoServlet/insert" style="font-weight: 600">SAVE</button>
							<button type="submit" class="btn btn-success"
								formaction="VideoServlet/update">UPDATE</button>

						</form>
					</div>

				</div>
				<div class="row">
					<table class="table table-dark">
						<tr class="bg-danger">
							<td>ID</td>
							<td>Title</td>
							<td>NameVideo</td>
							<td>Poster</td>


							<td>&nbsp;</td>
						</tr>
						<c:forEach var="item" items="${VIDEOS }">
							<tr>
								<td>${item.videoId }</td>
								<td>${item.title }</td>
								<td>${item.namevideo }</td>
								<td><img src="/ASM-Java-4/NguoiDung/image/${item.poster }"
									height="150" width="150"></td>

								<td><a class="btn btn-warning"
									href="VideoServlet/edit?id=${item.videoId }">Edit</a> <a
									class="btn btn-danger"
									href="VideoServlet/delete?id=${item.videoId }">Delete</a></td>
							</tr>
						</c:forEach>

					</table>
				</div>
			</div>
			<footer class="footer footer-black  footer-white ">
				<div class="container-fluid">
					<div class="row">
						<nav class="footer-nav">
							<ul>
								<li><a href="https://www.creative-tim.com" target="_blank">Creative
										Tim</a></li>
								<li><a href="https://www.creative-tim.com/blog"
									target="_blank">Blog</a></li>
								<li><a href="https://www.creative-tim.com/license"
									target="_blank">Licenses</a></li>
							</ul>
						</nav>
						<div class="credits ml-auto">
							<span class="copyright"> © <script>
								document.write(new Date().getFullYear())
							</script>, made with <i class="fa fa-heart heart"></i> by Creative Tim
							</span>
						</div>
					</div>
				</div>
			</footer>
		</div>
	</div>
	<!--   Core JS Files   -->
	<script src="/ASM-Java-4/Admin/assets/js/core/jquery.min.js"></script>
	<script src="/ASM-Java-4/Admin/assets/js/core/popper.min.js"></script>
	<script src="/ASM-Java-4/Admin/assets/js/core/bootstrap.min.js"></script>
	<script
		src="/ASM-Java-4/Admin/assets/js/plugins/perfect-scrollbar.jquery.min.js"></script>
	<!--  Google Maps Plugin    -->
	<script src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY_HERE"></script>
	<!-- Chart JS -->
	<script src="/ASM-Java-4/Admin/assets/js/plugins/chartjs.min.js"></script>
	<!--  Notifications Plugin    -->
	<script src="/ASM-Java-4/Admin/assets/js/plugins/bootstrap-notify.js"></script>
	<!-- Control Center for Now Ui Dashboard: parallax effects, scripts for the example pages etc -->
	<script
		src="/ASM-Java-4/Admin/assets/js/paper-dashboard.min.js?v=2.0.1"
		type="text/javascript"></script>
	<!-- Paper Dashboard DEMO methods, don't include it in your project! -->
	<script src="/ASM-Java-4/Admin/assets/demo/demo.js"></script>
	<script>
		$(document).ready(function() {
			// Javascript method's body can be found in assets/assets-for-demo/js/demo.js
			demo.initChartsPages();
		});
	</script>
</body>

</html>