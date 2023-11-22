<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>

<div class="container-fluid" style="background-color: #081b27;">
	<div class="container">
	<div class="TieuDe row">
			<h1>Tìm kiếm: ${KEYWORD }</h1>
			
		</div>
	<main class="row">
			<div class="col-9" style = "padding: 20px 0px;">
				<div class="row">
					<c:forEach var="listVideo" items="${LIST_KEYWORD }">
						<div class="col-3">
							<div class="BoPhim">
								<div class="BoPhim-header">
									<a href="HomeServlet/xemPhim?idVideo=${listVideo.videoId }">
										<img src="/ASM-Java-4/NguoiDung/image/${listVideo.poster }" alt=""
										style="max-width: 100%; height: 270px;">
									</a>
								</div>
								<div class="BoPhim-body">
									<a href="">${listVideo.title }</a>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</main>
	</div>
</div>