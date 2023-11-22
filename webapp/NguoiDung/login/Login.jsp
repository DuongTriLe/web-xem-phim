<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<title>Login V16</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->
<link rel="icon" type="image/png"
	href="/ASM-Java-4/NguoiDung/login/images/icons/favicon.ico" />
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="/ASM-Java-4/NguoiDung/login/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="/ASM-Java-4/NguoiDung/login/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="/ASM-Java-4/NguoiDung/login/fonts/Linearicons-Free-v1.0.0/icon-font.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="/ASM-Java-4/NguoiDung/login/vendor/animate/animate.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="/ASM-Java-4/NguoiDung/login/vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="/ASM-Java-4/NguoiDung/login/vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="/ASM-Java-4/NguoiDung/login/vendor/select2/select2.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="/ASM-Java-4/NguoiDung/login/vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="/ASM-Java-4/NguoiDung/login/css/util.css">
<link rel="stylesheet" type="text/css"
	href="/ASM-Java-4/NguoiDung/login/css/main.css">
<!--===============================================================================================-->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<link rel="stylesheet" href="fontawesome-free-6.2.1-web/css/all.min.css">
</head>
<body>

	<div class="limiter">
		<div class="container-login100"
			style="background-image: url('/ASM-Java-4/NguoiDung/login/images/hinhnen.jpg');">
			<div class="wrap-login100 p-t-30 p-b-50">

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

				<span class="login100-form-title p-b-41"> Account Login </span>
				<form class="login100-form validate-form p-b-33 p-t-5" method="POST"
					action="">

					<div class="wrap-input100 validate-input"
						data-validate="Enter username">
						<input class="input100" type="text" name="username"
							 placeholder="User name"> <span
							class="focus-input100" data-placeholder="&#xe82a;"></span>
					</div>

					<div class="wrap-input100 validate-input"
						data-validate="Enter password">
						<input class="input100" type="password" name="password"
							 placeholder="Password"> <span
							class="focus-input100" data-placeholder="&#xe80f;"></span>
					</div>

					

					<div class="container-login100-form-btn m-t-32">
						<button class="login100-form-btn">Login</button>
					</div>

				</form>
			</div>
		</div>
	</div>


	<div id="dropDownSelect1"></div>

	<!--===============================================================================================-->
	<script src="vendor/jquery/jquery-3.2.1.min.js"></script>
	<!--===============================================================================================-->
	<script src="vendor/animsition/js/animsition.min.js"></script>
	<!--===============================================================================================-->
	<script src="vendor/bootstrap/js/popper.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
	<!--===============================================================================================-->
	<script src="vendor/select2/select2.min.js"></script>
	<!--===============================================================================================-->
	<script src="vendor/daterangepicker/moment.min.js"></script>
	<script src="vendor/daterangepicker/daterangepicker.js"></script>
	<!--===============================================================================================-->
	<script src="vendor/countdowntime/countdowntime.js"></script>
	<!--===============================================================================================-->
	<script src="js/main.js"></script>

</body>
</html>