package edu.poly.admin.servlet;

import java.io.File;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.apache.commons.beanutils.BeanUtils;

import edu.poly.dao.UserDAO;
import edu.poly.dao.VideoDAO;
import edu.poly.model.User;
import edu.poly.model.Video;

@MultipartConfig
@WebServlet({ "/UserServlet", "/UserServlet/edit", "/UserServlet/update", "/UserServlet/insert", "/UserServlet/reset",
		"/UserServlet/delete" })
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = request.getRequestURI().toString();
		if (url.contains("edit")) {
			edit(request, response);
		}
		if (url.contains("delete")) {
			delete(request, response);
			request.setAttribute("VIDEO", new Video());
		}
		findAll(request, response);

		request.getRequestDispatcher("/Admin/examples/User.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");

		String url = request.getRequestURI().toString();

		if (url.contains("insert")) {
			doInsert(request, response);
		} else if (url.contains("update")) {
			update(request, response);
		} else if (url.contains("reset")) {

		}
		findAll(request, response);

		request.getRequestDispatcher("/Admin/examples/User.jsp").forward(request, response);
	}

	protected void doInsert(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {
			request.setCharacterEncoding("UTF-8");
			response.setContentType("text/html;charset=UTF-8");

			File dir = new File(request.getServletContext().getRealPath("/NguoiDung/image"));
			User user = new User();
			if (!dir.exists()) { // tạo nếu chưa tồn tại
				dir.mkdirs();
			}

			Part hinhDaiDien = request.getPart("hinh");
			File posterFile = new File(dir, hinhDaiDien.getSubmittedFileName());
			hinhDaiDien.write(posterFile.getAbsolutePath());

			user.setHinh(posterFile.getName());

			BeanUtils.populate(user, request.getParameterMap());


			UserDAO userDAO = new UserDAO();
			userDAO.insert(user);
			request.setAttribute("MESSAGE", "Đăng ký thành công!");

			request.setAttribute("USER_DK", user);

		} catch (IllegalAccessException | InvocationTargetException e) {

			e.printStackTrace();
			request.setAttribute("ERROR", "Error: " + e.getMessage());
		}

	}

	protected void findAll(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {

			UserDAO userdao = new UserDAO();
			List<User> listUser = userdao.getAllUser();
			request.setAttribute("LISTUSER", listUser);
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("ERROR", "Error: " + e.getMessage());
		}

	}

	protected void edit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {

			String username = request.getParameter("id");
			UserDAO dao = new UserDAO();

			User u = dao.findByID(username);
			request.setAttribute("USER_EDIT", u);
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("ERROR", "Error: " + e.getMessage());
		}

	}

	protected void delete(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {

			String username = request.getParameter("id");

			UserDAO dao = new UserDAO();

			dao.delete(username);
			request.setAttribute("MESSAGE", "Xoa thanh cong");
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("ERROR", "Error: " + e.getMessage());
		}

	}

	protected void update(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {
			response.setContentType("text/html;charset=UTF-8");
			request.setCharacterEncoding("utf-8");

			User user = new User();

			File dir = new File(request.getServletContext().getRealPath("/NguoiDung/image"));
			

			if (!dir.exists()) { // tạo nếu chưa tồn tại
				dir.mkdirs();
			}

			Part hinhDaiDien = request.getPart("hinh");
			File posterFile = new File(dir, hinhDaiDien.getSubmittedFileName());
			hinhDaiDien.write(posterFile.getAbsolutePath());

			user.setHinh(posterFile.getName());


			BeanUtils.populate(user, request.getParameterMap());
			UserDAO userDAO = new UserDAO();
			userDAO.update(user);
			request.setAttribute("MESSAGE", "Update thành công!");

			request.setAttribute("USER_DK", user);
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("ERROR", "Error: " + e.getMessage());
		}

	}

}
