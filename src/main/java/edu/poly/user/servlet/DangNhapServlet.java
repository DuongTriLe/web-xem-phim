package edu.poly.user.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import edu.poly.dao.UserDAO;
import edu.poly.model.User;

@WebServlet("/DangNhapServlet")
public class DangNhapServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doLogin(request, response);
		request.getRequestDispatcher("/NguoiDung/login/Login.jsp").forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doLogin(request, response);

	}

	protected void doLogin(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String method = request.getMethod();

		if (method.equalsIgnoreCase("POST")) {

			String id = request.getParameter("username");
			String pw = request.getParameter("password");

			try {
				UserDAO dao = new UserDAO();
				User user = dao.findByID(id);

				if (user != null && user.getPass().equals(pw)) {
					
					if(user.getAdmin()) {
						response.sendRedirect("/ASM-Java-4/VideoServlet");
					}

					HttpSession session = request.getSession();
					String currentURL = (String) session.getAttribute("CURRENT_URL");

					if (currentURL != null) {

						String idVideo = (String) session.getAttribute("VIDEO_ID");
						
						request.getSession().setAttribute("USER", user);
						
						response.sendRedirect("/ASM-Java-4/HomeServlet/xemPhim?idVideo=" + idVideo);

					} else {
						request.getSession().setAttribute("USER", user);

						response.sendRedirect("HomeServlet");
					}

				} else {
					request.setAttribute("MESSAGE", "Sai tk hoac mk");

					request.getRequestDispatcher("/NguoiDung/login/Login.jsp").forward(request, response);
					return;
				}
			} catch (Exception e) {
				request.setAttribute("ERROR", "Error: " + e.getMessage());
			}

		}

	}

}
