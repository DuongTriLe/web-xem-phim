package edu.poly.user.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edu.poly.comman.EmailUtils;
import edu.poly.dao.UserDAO;
import edu.poly.domain.Email;
import edu.poly.model.User;


@WebServlet("/ForgotPassServlet")
public class ForgotPassServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("VIEWS", "/NguoiDung/layout/forgotPass.jsp");
		request.getRequestDispatcher("/NguoiDung/index.jsp").forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String emailAddress = request.getParameter("email");
			String username = request.getParameter("username");
			
			UserDAO dao = new UserDAO();
			
			User user = dao.findByUsernameAndEmail(username, emailAddress);
			
			if(user == null) {
				request.setAttribute("ERROR", "Sai thông tin");
			}else {
				Email email = new Email();
				email.setFrom("trildpd06653@fpt.edu.vn");
				email.setFromPassword("31012003A");
				email.setTo(emailAddress);
				email.setSubject("Lấy lại mật khẩu");
				
				StringBuilder sb = new StringBuilder();
				sb.append("Dear ").append(username);
				
				sb.append(" Your password is  ").append(user.getPass());
				
				
				
				email.setContent(sb.toString());
				EmailUtils.send(email);
				
				request.setAttribute("MESSAGE", "Gửi mail thành công");
				
			}
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("ERROR", e.getMessage());
		}
		request.setAttribute("VIEWS", "/NguoiDung/layout/forgotPass.jsp");
		request.getRequestDispatcher("/NguoiDung/index.jsp").forward(request, response);
		
		
	}

}
