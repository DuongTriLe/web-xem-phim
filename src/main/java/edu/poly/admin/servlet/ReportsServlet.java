package edu.poly.admin.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edu.poly.dao.FavoriteDAO;
import edu.poly.dao.VideoDAO;
import edu.poly.domain.FavoriteReports;
import edu.poly.domain.FavoriteUserReports;
import edu.poly.model.Video;

/**
 * Servlet implementation class ReportsServlet
 */
@WebServlet("/ReportsServlet")
public class ReportsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		FavoriteDAO dao = new FavoriteDAO();
		
		List<FavoriteReports> list = dao.reportFavoriteByVideo();
		request.setAttribute("FAVORITES", list);
		
		reportFavoritesUserByVideo(request, response);
		request.getRequestDispatcher("/Admin/examples/reports.jsp").forward(request, response);
	}

	
	protected void reportFavoritesUserByVideo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String videoID = request.getParameter("VideoID");
			
			VideoDAO vdao = new VideoDAO();
			List<Video> lVideo = vdao.findAll();
			
			if(videoID == null && lVideo.size()>0) {
				videoID = lVideo.get(0).getVideoId();
			}
			
			FavoriteDAO dao = new FavoriteDAO();
			List<FavoriteUserReports> list = dao.reportFavoriteUserByVideo(videoID);
			
			request.setAttribute("VIDEOID", videoID);
			request.setAttribute("LVIDEO", lVideo);
			request.setAttribute("FAVORITESUSER", list);
			
			
		} catch (Exception e) {
			
		}
	}
	
	
	

}
