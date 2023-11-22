<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="container-fluid"
        style="background-image:linear-gradient(90deg,rgba(21, 19, 19, 0.4),rgba(21, 19, 19, 0.5)),url(/ASM-Java-4/NguoiDung/image/hinhnendangki.jpg);; min-height: 500px;">
        <div class="container">
              <c:url var = "home" value = "/home"/>
            <section style="background-color: rgba(21, 19, 19, 0.6); padding: 20px 0px;">
                <div class="container py-5">
                    <div class="row">
                        <div class="col-lg-4">
                            <div class="card mb-4">
                                <div class="card-body text-center">
                                    <a href="/ASM-Java-4/ThongTinServle"><img src="/ASM-Java-4/NguoiDung/image/${USER.hinh }"
                                        alt="avatar" class="rounded-circle img-fluid" style="width: 150px;"></a>
                                        
                                   
                                    <h5 class="my-3">${USER.fullname }</h5>
                                    <p class="text-muted mb-1">Full Stack Developer</p>
                                    <p class="text-muted mb-4">Bay Area, San Francisco, CA</p>
                                    <div class="d-flex justify-content-center mb-2">
                                       <a class="btn btn-outline-primary " href="/ASM-Java-4/change-pass">Đổi mật khẩu</a>
                                       <a class="btn btn-outline-primary " href="/ASM-Java-4/edit-profile">Cập nhật thông</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                         <div class="col-lg-8">
                            <div class="card mb-4">
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col-sm-3">
                                            <p class="mb-0">User name</p>
                                        </div>
                                        <div class="col-sm-9">
                                            <p class="text-muted mb-0">${USER.username }</p>
                                        </div>
                                    </div>
                                    <hr>
                                    <div class="row">
                                        <div class="col-sm-3">
                                            <p class="mb-0">Email</p>
                                        </div>
                                        <div class="col-sm-9">
                                            <p class="text-muted mb-0">${USER.email }</p>
                                        </div>
                                    </div>
                                    <hr>
                                    <div class="row">
                                        <div class="col-sm-3">
                                            <p class="mb-0">Fullname</p>
                                        </div>
                                        <div class="col-sm-9">
                                            <p class="text-muted mb-0">${USER.fullname }</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </div>
    </div>