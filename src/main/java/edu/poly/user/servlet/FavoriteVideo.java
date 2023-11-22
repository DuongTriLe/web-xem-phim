package edu.poly.user.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import edu.poly.dao.VideoDAO;
import edu.poly.model.User;
import edu.poly.model.Video;


@WebServlet("/FavoriteVideo")
public class FavoriteVideo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
  

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();

		// Lấy thông tin user từ session
		User user = (User) session.getAttribute("USER");
		
		VideoDAO videodao = new VideoDAO();
		List<Video> list = videodao.findVideoFavoriteByID(user.getUsername());
		request.setAttribute("LIST", list);
		
		request.setAttribute("VIEWS", "/NguoiDung/layout/video-favorite.jsp");
		request.getRequestDispatcher("/NguoiDung/index.jsp").forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
