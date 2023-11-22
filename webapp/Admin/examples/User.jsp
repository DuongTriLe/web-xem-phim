<%@ page language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

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
<base href="/ASM-Java-4/UserServlet/" />
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
					<li><a href="/ASM-Java-4/UserServlet"> <i
							class="nc-icon nc-diamond"></i>
							<p>User</p>
					</a></li>
					<li class="active "><a href="/ASM-Java-4/ReportsServlet">
							<i class="nc-icon nc-pin-3"></i>
							<p>Favorites</p>
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
								style="color: black; font-weight: 600;">User</a></li>

							<li class="nav-item"><a class="nav-link " id="Favorites-tab"
								data-toggle="tab" href="#Favorites" role="tab"
								aria-controls="Favorites" aria-selected="false"
								style="color: black; font-weight: 600;">List user </a></li>

						</ul>
						<div class="tab-content" id="myTabContent">
							<div class="tab-pane fade " id="Favorites" role="tablist"
								aria-labelledby="Favorites-tab">

								<table class="table table-striped mt-3" border="1">
									<tr class="bg-primary">
										<th>Username</th>
										<th>Password</th>
										<th>Fullname</th>
										<th>Email</th>
										<th>Role</th>
										<th>Hinh</th>
										<th>Action</th>
									</tr>
									<c:forEach var="item" items="${LISTUSER }">
										<tr>
											<td>${item.username }</td>
											<td>${item.pass }</td>
											<td>${item.fullname }</td>
											<td>${item.email }</td>
											<td>${item.admin }</td>
											
											<td><img src="/ASM-Java-4/NguoiDung/image/${item.hinh }" height="150" width="150"></td>
											<td><a class="btn btn-warning"
												href="edit?id=${item.username }">Edit</a> <a
												class="btn btn-danger" href="delete?id=${item.username }">Delete</a></td>


										</tr>
									</c:forEach>

								</table>
							</div>
							<div class="tab-pane fade show active" id="Favorite-user"
								role="tab" aria-labelledby="Favorite-user-tab">
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

									<form action="" method="post" enctype="multipart/form-data">
										<div class="form-row mt-2">
											<div class="form-group col-md-6">
												<label for="Username"
													style="color: black; font-weight: 600;">Username</label> <input
													type="text" class="form-control" id="Username"
													placeholder="Username" name="username"
													value="${USER_EDIT.username }">
											</div>
											<div class="form-group col-md-6">
												<label for="Password"
													style="color: black; font-weight: 600;">Password</label> <input
													type="password" class="form-control" id="Password"
													placeholder="Password" name="pass"
													value="${USER_EDIT.pass }">
											</div>
										</div>
										<div class="form-row">
											<div class="form-group col-md-6">
												<label for="Fullname"
													style="color: black; font-weight: 600;">Fullname</label> <input
													type="text" class="form-control" id="Fullname"
													placeholder="Fullname" name="fullname"
													value="${USER_EDIT.fullname }">
											</div>
											<div class="form-group col-md-6">
												<label for="Email" style="color: black; font-weight: 600;">Email</label>
												<input type="email" class="form-control" id="Email"
													placeholder="Email" name="email"
													value="${USER_EDIT.email }">
											</div>

											<div class="">
												<label for="" style="font-weight: 600">Chon anh đại diện </label> <input
													type="file"
													style="padding-left: 15px; padding-bottom: 15px;" class=""
													id="" name="hinh" >
											</div>

											<div class="form-check-inline"
												style="color: black; font-weight: 500;">Role</div>
											<br>
											<div class="form-check-inline">
												<input class="form-check-input" type="radio" name="admin"
													id="exampleRadios1" value="true"
													${USER_EDIT.admin?'checked':'' }> <label
													class="form-check-label" for="exampleRadios1">
													Admin </label>
											</div>
											<div class="form-check-inline">
												<input class="form-check-input" type="radio" name="admin"
													id="exampleRadios2" value="false"
													${!USER_EDIT.admin?'checked':'' }> <label
													class="form-check-label" for="exampleRadios2">
													User </label>
											</div>
										</div>
										<div class="row">
											<div class="col">
												<c:choose>
													<c:when test="${empty USER_EDIT.username }">
														<button type="submit" class="btn btn-primary"
															style="width: 100%; border-radius: 20px; padding: 10px 0px;"
															formaction="insert">Đăng ký</button>
													</c:when>
													<c:otherwise>
														<button type="submit" class="btn btn-primary"
															formaction="update">Update</button>
														<button type="submit" class="btn btn-primary"
															formaction="reset">Rest</button>
													</c:otherwise>
												</c:choose>

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
		<script
			src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY_HERE"></script>
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