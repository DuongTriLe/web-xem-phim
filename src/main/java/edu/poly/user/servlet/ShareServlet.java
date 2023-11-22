package edu.poly.user.servlet;

import java.io.IOException;
import java.util.Date;

import javax.mail.internet.MimeBodyPart;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import edu.poly.comman.EmailUtils;
import edu.poly.dao.ShareDAO;
import edu.poly.dao.UserDAO;
import edu.poly.domain.Email;
import edu.poly.model.Share;
import edu.poly.model.User;
import edu.poly.model.Video;


@WebServlet({ "/HomeServlet/ShareVideo" })
public class ShareServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		User usera = (User) session.getAttribute("USER");
		
		if (usera == null) {				
			response.sendRedirect("/ASM-Java-4/DangNhapServlet");
			return;
		}
		request.setAttribute("VIEWS", "/NguoiDung/layout/share-video.jsp");
		request.getRequestDispatcher("/NguoiDung/index.jsp").forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = request.getRequestURI();
		if(url.contains("ShareVideo")) {
			try {
				String emailAddress = request.getParameter("email");
				String id = request.getParameter("vdID");
				
				UserDAO dao = new UserDAO();
				
				HttpSession session = request.getSession();
				User usera = (User) session.getAttribute("USER");
				
				
				if(id == null) {
					request.setAttribute("ERROR", "video id is null");
				}else {
					Email email = new Email();
					email.setFrom("trildpd06653@fpt.edu.vn");
					email.setFromPassword("31012003A");
					email.setTo(emailAddress);
					email.setSubject("Share video");
					
					
					StringBuilder sb = new StringBuilder();
					sb.append("Dear Ms/Mr").append("<br>");
				    sb.append("Video hay toi sẻ chia sẻ cho you <br>");
				    sb.append("Vui lòng click link ").append(String.format("<a href = '#'>Video Video</a>", id));
				    sb.append("<br>ADmin");
				   
					
					email.setContent(sb.toString());
					EmailUtils.send(email);
					
					ShareDAO sharedao = new ShareDAO();
					
					Share share = new Share();
					share.setEmails(emailAddress);
					share.setSharedDate(new Date());
					
					User user = new User();
					user.setUsername(usera.getUsername());
					
					share.setUser(user);
					
					Video video = new Video();
					video.setVideoId(id);
					
					share.setVideo(video);
					
					sharedao.insert(share);
					
					request.setAttribute("MESSAGE", "Gửi mail thành công");
				
					
				}
			} catch (Exception e) {
				e.printStackTrace();
				request.setAttribute("ERROR", e.getMessage());
			}
			
			request.setAttribute("VIEWS", "/NguoiDung/layout/share-video.jsp");
			request.getRequestDispatcher("/NguoiDung/index.jsp").forward(request, response);

		}
	}

}
