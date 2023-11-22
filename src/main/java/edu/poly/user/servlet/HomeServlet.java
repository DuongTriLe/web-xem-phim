package edu.poly.user.servlet;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import edu.poly.dao.FavoriteDAO;
import edu.poly.dao.UserDAO;
import edu.poly.dao.VideoDAO;
import edu.poly.model.Favorite;
import edu.poly.model.User;
import edu.poly.model.Video;

@WebServlet({ "/HomeServlet", "/HomeServlet/xemPhim" ,"/HomeServlet/timkiem"})
public class HomeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setAttribute("VIEWS", "/NguoiDung/layout/listVideo.jsp");
		
		listVideo(request, response);
		doTimKiem(request, response);
		request.getRequestDispatcher("/NguoiDung/index.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		listVideo(request, response);
		
	}

	protected void listVideo(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = request.getRequestURI();
		try {
			Video video = new Video();
			VideoDAO dao = new VideoDAO();
			FavoriteDAO fdao = new FavoriteDAO();
			
			List<Video> listVideo = dao.findAll();
			request.setAttribute("listVideo", listVideo);

			List<Video> listVideoHot = dao.top4VideoHot();
			request.setAttribute("LISTVIDEOHOT", listVideoHot);
			
			List<Video> list = dao.randomVideo();
			request.setAttribute("RANDOM", list);
					
			if (url.contains("xemPhim")) {
				
				
				String id = request.getParameter("idVideo");

				Video v = dao.findByID(id);
				request.setAttribute("IDVIDEO", v);
				request.setAttribute("VIEWS", "/NguoiDung/layout/chiTietPhim.jsp");
				
				//  lấy URL hiện tại được yêu cầu bởi client.
				String currentURL = request.getRequestURI().toString();
				HttpSession session = request.getSession();
				
				session.setAttribute("CURRENT_URL", currentURL);
				session.setAttribute("VIDEO_ID", id);
				
				
				
				int view = v.getViews();
				User user = (User)session.getAttribute("USER");
				if(user != null) {
					view++;
					v.setViews(view);
					dao.update(v);
				}
				

				List<Favorite> a = fdao.findUserLikeVideo(user.getUsername(),id);
				request.setAttribute("CHECK_LIKE", a);
				
			}

			
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("ERROR", e.getMessage());
		}

	}
	protected void doTimKiem(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		
		String url = request.getRequestURI();
		if (url.contains("timkiem")) {
			
			String username = request.getParameter("keyword");
			
			UserDAO dao = new UserDAO();
			VideoDAO videodao = new VideoDAO();
			
			
			List<Video> listKeyword = videodao.findVideoFavoriteByVideoTitle(username);
			request.setAttribute("LIST_KEYWORD", listKeyword);
			request.setAttribute("KEYWORD", username);
			request.setAttribute("VIEWS", "/NguoiDung/layout/video-tim-kiem.jsp");
			request.getRequestDispatcher("/NguoiDung/index.jsp").forward(request, response);
		}
		
		
		

	}


}
