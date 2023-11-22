<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="container-fluid"
	style="background-image: linear-gradient(90deg, rgba(21, 19, 19, 0.4), rgba(21, 19, 19, 0.5)), url(/ASM-Java-4/NguoiDung/image/hinhnendangki.jpg);; min-height: 500px;">
	<div class="container">
		<div class="form-dang-ky" style="padding: 100px 0px">
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
			<form style="background-color: rgba(21, 19, 19, 0.3);" action="ForgotPassServlet" method="post">
			<h3 style = "color: white;">Quên mật khẩu</h3>
				<div class="form-row">
					<div class="form-group col-md-6">
						<label for="Username" style="color: white;">Username</label> <input
							type="text" class="form-control" id="Username"
							placeholder="Username" name="username" value="">
					</div>
					<div class="form-group col-md-6">
						<label for="" style="color: white;">Email</label> <input
							type="email" class="form-control" id="Password"
							placeholder="email" name="email" value="">
					</div>
				</div>
				<div class="row">
					<div class="col">
						<button type="submit" class="btn btn-primary"
							style="width: 100%; border-radius: 20px; padding: 10px 0px;">Gửi</button>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>