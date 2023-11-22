<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>

<div class="container-fluid" style="background-color: #081b27;">
	<div class="container">
		<div class="TieuDe row">
			<h1>Danh Sách Phim</h1>
			<div class="nutTieuDe " style="margin-left: 350px;">
				<button type="button" class="btn-tatca ">Tất cả phim</button>
				<button type="button" class=" btn-sapchieu">
					<a href="">Sắp chiếu</a>
				</button>
			</div>
		</div>

		<main class="row">
			<div class="col-9">
				<div class="row">
					<c:forEach var="listVideo" items="${listVideo }">
						<div class="col-3" style="padding-bottom: 20px">
							<div class="BoPhim">
								<div class="BoPhim-header">
									<a href="HomeServlet/xemPhim?idVideo=${listVideo.videoId }">
										<img src="/ASM-Java-4/NguoiDung/image/${listVideo.poster }" alt=""
										style="max-width: 100%; height: 270px;">
									</a>
								</div>
								<div class="BoPhim-body">
									<a href="HomeServlet/xemPhim?idVideo=${listVideo.videoId }" style="font-weight: 700">${listVideo.title }</a> <br>
									<a href="HomeServlet/xemPhim?idVideo=${listVideo.videoId }" style="font-size: 15px; color: #9abebf">Phim ${listVideo.theloai }</a>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
			<div class="col-3">
				<div class="TimKiem">
					<form action="" class="search">
						<input type="text" placeholder="Bạn muốn tìm gì?" name = "keyword">
						<button type="submit" formaction="HomeServlet/timkiem" >
							<i class="fa-solid fa-magnifying-glass"></i>
						</button>
					</form>
				</div>

				<div class="TieuDePhimHot">
					<h3>Phim Le Hot</h3>
				</div>
			<c:forEach var="itemVideoHot" items="${LISTVIDEOHOT }">
					<div class="row PhimHot">
						<div class="col-5">
							<img
								src="/ASM-Java-4/NguoiDung/image/${itemVideoHot.poster }"
								alt="" style="max-width: 70%;">
						</div>
						<div class="col-7">
							<a href="HomeServlet/xemPhim?idVideo=${itemVideoHot.videoId }" class="a">${itemVideoHot.title }</a>
						</div>
					</div>
				</c:forEach>



			</div>
		</main>
	</div>
</div>