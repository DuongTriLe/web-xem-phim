package edu.poly.user.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import edu.poly.dao.UserDAO;
import edu.poly.model.User;


@WebServlet("/DangKiServlet")
public class DangKiServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doDangKi(request, response);
		request.setAttribute("VIEWS", "/NguoiDung/layout/register.jsp");
		request.getRequestDispatcher("/NguoiDung/index.jsp").forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doDangKi(request, response);
		request.setAttribute("VIEWS", "/NguoiDung/layout/register.jsp");
		request.getRequestDispatcher("/NguoiDung/index.jsp").forward(request, response);
	}
	
	protected void doDangKi(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		User user = new User();
		String method = request.getMethod();
		try {
			if (method.equalsIgnoreCase("POST")) {
				BeanUtils.populate(user, request.getParameterMap());
				UserDAO userDAO = new UserDAO();
				userDAO.insert(user);
				request.setAttribute("MESSAGE", "Đăng ký thành công!");
				request.setAttribute("VIEWS", "/NguoiDung/layout/register.jsp");
				return;
			}
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("ERROR", e.getMessage());
		}
		
		request.setAttribute("VIEWS", "/NguoiDung/layout/register.jsp");
	}

}
