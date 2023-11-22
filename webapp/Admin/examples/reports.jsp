<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<head>
<meta charset="utf-8" />
<link rel="apple-touch-icon" sizes="76x76"
	href="/ASM-Java-4/Admin/assets/img/apple-icon.png">
<link rel="icon" type="image/png"
	href="/ASM-Java-4/Admin/assets/img/favicon.png">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>Paper Dashboard 2 by Creative Tim</title>
<meta
	content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no'
	name='viewport' />
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
<link href="/ASM-Java-4/Admin/assets/demo/demo.css" rel="stylesheet" />
</head>

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
            <img src="../assets/img/logo-big.png">
          </div> -->
				</a>
			</div>
			<div class="sidebar-wrapper">
				<ul class="nav">
					<li><a href="/ASM-Java-4/VideoServlet"> <i
							class="nc-icon nc-bank"></i>
							<p>Video</p>
					</a></li>
					<li><a href="/ASM-Java-4/UserServlet"> <i class="nc-icon nc-diamond"></i>
							<p>User</p>
					</a></li>
					<li class="active "><a href="/ASM-Java-4/ReportsServlet">
							<i class="nc-icon nc-pin-3"></i>
							<p>Favorites</p>
					</a></li>
				</ul>
			</div>
		</div>
		<div class="main-panel" style="background-color: rgb(250, 235, 215,0.9);">
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
						<a class="navbar-brand" href="javascript:;">ViDeo</a>
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
					<div class="col mt-4">
						<ul class="nav nav-tabs" id="myTab" role="tablist">
						
						<li class="nav-item"><a class="nav-link active"
								id="Favorite-user-tab" data-toggle="tab" href="#Favorite-user"
								role="tab" aria-controls="Favorite-user" aria-selected="true"
								style="color: black; font-weight: 600;">Favorite user</a></li>
								
							<li class="nav-item"><a class="nav-link "
								id="Favorites-tab" data-toggle="tab" href="#Favorites"
								role="tab" aria-controls="Favorites" aria-selected="false"
								style="color: black; font-weight: 600;">Favorites</a></li>
							
						</ul>
						<div class="tab-content" id="myTabContent">
							<div class="tab-pane fade " id="Favorites"
								role="tablist" aria-labelledby="Favorites-tab">
								
								<table class="table table-striped mt-3" border="1">
									<tr class="bg-primary">
										<th>Video title</th>
										<th>Favorites count</th>
										<th>Lasted day</th>
										<th>Oldest day</th>
									</tr>
									<c:forEach var="item" items="${FAVORITES }">
										<tr>
											<td>${item.group }</td>
											<td>${item.likes }</td>
											
											<td><fmt:formatDate value="${item.newest }" pattern="dd/MM/yyyy"/></td>
											<td><fmt:formatDate value="${item.oldest}" pattern="dd/MM/yyyy"/></td>

										</tr>
									</c:forEach>

								</table>
							</div>
							<div class="tab-pane fade show active" id="Favorite-user" role="tab"
								aria-labelledby="Favorite-user-tab">
								
								<form action="">
									<div class="row mt-3">
										<div class="col">
											<div class="form-inline">
												<div class="form-group">
													<label>Video title 
													<select name="VideoID" id="" class="form-control ml-3">
													
															<c:forEach var="item" items="${LVIDEO }">
																<option value ="${item.videoId } " ${item.videoId == VideoID?'selected':''}>${item.title }</option>
															</c:forEach>

													</select>
													</label>
													<button class="btn btn-info ml-2" type="submit">Report</button>
												</div>
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col mt-3">
											<table class="table table-striped" border="1">
												<tr class="bg-danger">
													<td>Username</td>
													<td>Fullname</td>
													<td>Email</td>
													<td>Favorite date</td>
												</tr>
												<c:forEach var="item" items="${FAVORITESUSER }">
												<tr>
													<td>${item.username }</td>
													<td>${item.fullname }</td>
													<td>${item.email }</td>													
													<td><fmt:formatDate value="${item.likeDate }" pattern="dd/MM/yyyy"/></td>
												</tr>
												</c:forEach>
												
											</table>
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>

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