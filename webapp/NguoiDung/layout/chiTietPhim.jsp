<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<div class="container-fluid" style="background-color: #081b27;">
	<div class="contaiern-fluid aa "
		style="background-image:linear-gradient(90deg,rgba(21, 19, 19, 0.7),rgba(21, 19, 19, 0.9)),url(/ASM-Java-4/NguoiDung/image/${IDVIDEO.poster });">
		<div class="container">
			<div class="row headerXemPhim">
				<div class="col-4">
					<img src="/ASM-Java-4/NguoiDung/image/${IDVIDEO.poster }" alt="">
				</div>
				<div class="col-7">
					<div class="TieuDePhim">
						<h1>${IDVIDEO.title }</h1>
					</div>
					<div class="ThongTinPhim">
						<div class="ThongTinPhimItem">
							<p>Đạo diễn: ${IDVIDEO.daodien }</p>
						</div>
						<div class="ThongTinPhimItem">
							<p>Diễn viên: ${IDVIDEO.dienvien }</p>
						</div>
						<div class="ThongTinPhimItem">
							<p>Năm sản xuất: ${IDVIDEO.namsx }</p>
						</div>
						<div class="ThongTinPhimItem">
							<p>Thời lượng: ${IDVIDEO.thoiluong }</p>
						</div>
						<div class="ThongTinPhimItem">
							<p>Thể loại: ${IDVIDEO.theloai }</p>
						</div>
						<div class="ThongTinPhimItem">
							<p>Quốc gia: ${IDVIDEO.quocgia }</p>
						</div>
						<div class="ThongTinPhimItem">
							<p>${IDVIDEO.description }</p>
						</div>
						<div class="ThongTinPhimItem">
							<button type="button" class="btn btn-primary">Trailer</button>
							<button type="button" class="btn btn-danger">Xem Phim</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="container" style="background-color: rgb(11, 29, 41);">
		<div class="row" style="padding-top: 70px;">
			<div class="col-9">

				<iframe width="100%" height="400"
					src="${IDVIDEO.namevideo }"
					title="YouTube video player" frameborder="0"
					allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
					allowfullscreen></iframe>

				<div style="padding: 30px 0px;">


					<c:choose>
						<c:when test="${not empty CHECK_LIKE  }">
							<a
								href="/ASM-Java-4/HomeServlet/HuyLikeVideo?vdID=${IDVIDEO.videoId }"
								class="btn btn-primary"> Đã Like </a>

							<a
								href="/ASM-Java-4/HomeServlet/ShareVideo?vdID=${IDVIDEO.videoId }"
								class="btn btn-success"> Share </a>
						</c:when>
						<c:otherwise>
							<a
								href="/ASM-Java-4/HomeServlet/LikeVideo?vdID=${IDVIDEO.videoId }"
								class="btn btn-primary"> Like </a>

							<a
								href="/ASM-Java-4/HomeServlet/ShareVideo?vdID=${IDVIDEO.videoId }"
								class="btn btn-success"> Share </a>
						</c:otherwise>
					</c:choose>


				</div>


				<div class="ChonTapPhim mt-4">
					<h3>Chọn tập phim</h3>
					<h4>Vietsub</h4>
					<div class="cacTapPhim">
						<button type="button" class="btn ">Tập 1</button>
						<button type="button" class="btn ">Tập 2</button>
						<button type="button" class="btn ">Tập 3</button>
						<button type="button" class="btn ">Tập 4</button>
						<button type="button" class="btn ">Tập 5</button>
					</div>
					<h4>Thuyết Minh</h4>
					<div class="cacTapPhim">
						<button type="button" class="btn ">Tập 1</button>
						<button type="button" class="btn ">Tập 2</button>
						<button type="button" class="btn ">Tập 3</button>
						<button type="button" class="btn ">Tập 4</button>
						<button type="button" class="btn ">Tập 5</button>
					</div>
				</div>
				<div class="col CanhBao">
					<p>CẢNH BÁO: Không bấm vào các đường link lạ ở khu vực bình
						luận. Việc truy cập vào các liên kết lạ ngoài SubNhanh.cc có thể
						khiến bạn bị hack tài khoản Facebook.</p>
				</div>
				<div class="fb-comments mt-4 mb-4"
					data-href="https://developers.facebook.com/docs/plugins/comments#configurator"
					data-width="" data-numposts="5"></div>
				<div class="row"
					style="color: rgb(198, 103, 31); padding-bottom: 20px;">
					<h3>Có thể bạn muốn xem</h3>
				</div>
				<div class="row">
					<c:forEach var="RANDOM" items="${RANDOM }">
						<div class="col-3">
							<div class="BoPhim">

								<div class="BoPhim-header">
									<a href="HomeServlet/xemPhim?idVideo=${RANDOM.videoId }"> <img
										src="/ASM-Java-4/NguoiDung/image/${RANDOM.poster }" alt=""
										style="max-width: 100%;">
									</a>
								</div>
								<div class="BoPhim-body">
									<a href="">${RANDOM.title }</a>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>

			<div class="col-3">
				<div class="TimKiem">
					<form action="" class="search">
						<input type="text" placeholder="Bạn muốn tìm gì?">
						<button>
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
							<a href="HomeServlet/xemPhim?idVideo=${itemVideoHot.videoId }">
								<img src="/ASM-Java-4/NguoiDung/image/${itemVideoHot.poster }"
								alt="" style="max-width: 70%;">
							</a>

						</div>
						<div class="col-7">
							<a href="" class="a">${itemVideoHot.title }</a>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
</div>

