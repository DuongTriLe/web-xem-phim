package edu.poly.user.servlet;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import edu.poly.dao.UserDAO;
import edu.poly.domain.ChangePassword;
import edu.poly.model.User;

@WebServlet({ "/ThongTinServlet", "/change-pass", "/edit-profile" })
public class ThongTinServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	

		String url = request.getRequestURI();
		if (url.contains("ThongTinServlet")) {
			request.setAttribute("VIEWS", "/NguoiDung/layout/thong-tin.jsp");
			request.getRequestDispatcher("/NguoiDung/index.jsp").forward(request, response);

		} else if (url.contains("change-pass")) {

			doChangePass(request, response);

		} else if (url.contains("edit-profile")) {

			try {
				doEditProfile(request, response);
			} catch (IllegalAccessException | InvocationTargetException | ServletException | IOException e) {

				e.printStackTrace();
			}

		}

	}

	private void doEditProfile(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, IllegalAccessException, InvocationTargetException {
		User user = new User();
		String method = request.getMethod();
		try {
			if (method.equalsIgnoreCase("POST")) {
				BeanUtils.populate(user, request.getParameterMap());
				UserDAO dao = new UserDAO();
				dao.update(user);
				request.getSession().setAttribute("USER", user);
				request.setAttribute("MESSAGE", "Cập nhật tài khoản thành công!");
				request.setAttribute("VIEWS", "/NguoiDung/layout/edit-profile.jsp");
				request.getRequestDispatcher("/NguoiDung/index.jsp").forward(request, response);
				return;
			}
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("ERROR", e.getMessage());
		}
		request.setAttribute("VIEWS", "/NguoiDung/layout/edit-profile.jsp");
		request.getRequestDispatcher("/NguoiDung/index.jsp").forward(request, response);
	}

	protected void doChangePass(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String method = request.getMethod();
		try {
			if (method.equalsIgnoreCase("POST")) {
				ChangePassword form = new ChangePassword();
				BeanUtils.populate(form, request.getParameterMap());

				if (!form.getConfirmPassword().equals(form.getPassword())) {
					request.setAttribute("ERROR", "Mat khau moi va xac nhan mat khong k dung");

				} else {
					UserDAO dao = new UserDAO();
					dao.changePass(form.getUsername(), form.getCurrentPassword(), form.getPassword());
					request.setAttribute("MESSAGE", "Password has been change");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("ERROR", e.getMessage());
		}
		request.setAttribute("VIEWS", "/NguoiDung/layout/change-pass.jsp");
		request.getRequestDispatcher("/NguoiDung/index.jsp").forward(request, response);
	}

}
