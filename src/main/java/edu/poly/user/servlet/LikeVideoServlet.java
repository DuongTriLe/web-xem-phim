package edu.poly.user.servlet;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import edu.poly.comman.EmailUtils;
import edu.poly.dao.FavoriteDAO;
import edu.poly.dao.ShareDAO;
import edu.poly.dao.UserDAO;
import edu.poly.dao.VideoDAO;
import edu.poly.domain.Email;
import edu.poly.model.Favorite;
import edu.poly.model.Share;
import edu.poly.model.User;
import edu.poly.model.Video;

@WebServlet({ "/HomeServlet/LikeVideo", "/HomeServlet/HuyLikeVideo" })
public class LikeVideoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = request.getRequestURI();
		HttpSession session = request.getSession();
		User usera = (User) session.getAttribute("USER");

		if (usera == null) {
			response.sendRedirect("/ASM-Java-4/DangNhapServlet");
			return;
		}

		if (url.contains("HuyLikeVideo")) {
			doHuyLike(request, response);
			return;

		}
		if (url.contains("LikeVideo")) {
			doLike(request, response);
			
			return;
		}

	}

	protected void doLike(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = request.getRequestURI();
		HttpSession session = request.getSession();
		User usera = (User) session.getAttribute("USER");

		String id = request.getParameter("vdID");

		VideoDAO dao = new VideoDAO();
		FavoriteDAO daoFavorite = new FavoriteDAO();
		Video v = new Video();
		Favorite favorite = new Favorite();
		UserDAO udao = new UserDAO();

		v.setVideoId(id);
		Video vi = dao.findByID(id);

		favorite.setVideo(v);

		// Lấy thông tin user từ session

		User user = new User();
		user.setUsername(usera.getUsername());

		favorite.setUser(user);

		favorite.setLikedDate(new Date());

		daoFavorite.insert(favorite);

//		User u = udao.findByID(user);
//		request.setAttribute("USER_LIKE", u);

		String idVideo = (String) session.getAttribute("VIDEO_ID");
		response.sendRedirect("/ASM-Java-4/HomeServlet/xemPhim?idVideo=" + idVideo);

	}

	protected void doHuyLike(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = request.getRequestURI();
		HttpSession session = request.getSession();

		User usera = (User) session.getAttribute("USER");

		String idUser = usera.getUsername();
		String id = request.getParameter("vdID");

		FavoriteDAO daoFavorite = new FavoriteDAO();

		daoFavorite.deleteFavorite(idUser, id);

//		UserDAO udao = new UserDAO();
//		User user = new User();
//		User u = udao.findByID(usera.getUsername());
//		
//		request.setAttribute("USER_LIKE", u);

		String idVideo = (String) session.getAttribute("VIDEO_ID");
		response.sendRedirect("/ASM-Java-4/HomeServlet/xemPhim?idVideo=" + idVideo);

	}

}
