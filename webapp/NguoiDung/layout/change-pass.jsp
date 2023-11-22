
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="container-fluid"
	style="background-image: linear-gradient(90deg, rgba(21, 19, 19, 0.4), rgba(21, 19, 19, 0.5)), url(/ASM-Java-4/NguoiDung/image/hinhnendangki.jpg);; min-height: 500px;">
	<div class="container">

		<section
			style="background-color: rgba(21, 19, 19, 0.6); padding: 20px 0px;">
			<div class="container py-5">
				<div class="row">
					<div class="col-lg-4">
						<div class="card mb-4">
							<div class="card-body text-center">
								<a href="/ASM-Java-4/ThongTinServlet"><img
									src="/ASM-Java-4/NguoiDung/image/${USER.hinh }"
									alt="avatar" class="rounded-circle img-fluid"
									style="width: 150px;"></a>

								<h5 class="my-3">${USER.fullname }</h5>
								<p class="text-muted mb-1">Full Stack Developer</p>
								<p class="text-muted mb-4">Bay Area, San Francisco, CA</p>
								<div class="d-flex justify-content-center mb-2">
									<a class="btn btn-outline-primary "
										href="/ASM-Java-4/change-pass">Đổi mật khẩu</a> <a
										class="btn btn-outline-primary "
										href="/ASM-Java-4/edit-profile">Cập nhật thông</a>
								</div>
							</div>
						</div>
					</div>
					<div class="col-lg-8">
						<div class="card mb-4">
							<div class="card-body">
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
								<form style="background-color: white; border: none;" method="post">
									<div class="form-group">
										<label for="exampleInputEmail1">Username</label> <input
											type="text" class="form-control" id="exampleInputEmail1"
											aria-describedby="emailHelp" placeholder="Enter Username"
											name="username" value="${USER.username }">
									</div>
									<div class="form-group">
										<label for="exampleInputPassword1">Current Password</label> <input
											type="password" class="form-control"
											id="exampleInputPassword1"
											placeholder="Enter Current Password" name="currentPassword">
									</div>
									<div class="form-group">
										<label for="exampleInputPassword1">New Password</label> <input
											type="password" class="form-control"
											id="exampleInputPassword1" placeholder="Enter New Password"
											name="password">
									</div>
									<div class="form-group">
										<label for="exampleInputPassword1">Confirm Password</label> <input
											type="password" class="form-control"
											id="exampleInputPassword1"
											placeholder="Enter Confirm Password" name="confirmPassword">
									</div>
									<button type="submit" class="btn btn-success">Đổi</button>
								</form>
							</div>
						</div>
					</div>
		
				</div>
			</div>
		</section>
	</div>
</div>