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

import edu.poly.dao.VideoDAO;

import edu.poly.model.Video;

@MultipartConfig
@WebServlet({ "/VideoServlet", "/VideoServlet/insert", "/VideoServlet/update", "/NguoiDungServlet/delete",
		"/NguoiDungServlet/reset", "/VideoServlet/edit", "/VideoServlet/delete" })
public class VideoServlet extends HttpServlet {
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
		request.getRequestDispatcher("/Admin/examples/Video.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = request.getRequestURI().toString();

		if (url.contains("insert")) {
			doInsert(request, response);
		} else if (url.contains("update")) {
			update(request, response);
		} else if (url.contains("reset")) {

		}
		findAll(request, response);
		request.getRequestDispatcher("/Admin/examples/Video.jsp").forward(request, response);
	}

	protected void doInsert(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			request.setCharacterEncoding("UTF-8");
			response.setContentType("text/html;charset=UTF-8");
			
			Video video = new Video();
			File dir = new File(request.getServletContext().getRealPath("/NguoiDung/image"));

			if (!dir.exists()) { // tạo nếu chưa tồn tại
				dir.mkdirs();
			}

			Part poster = request.getPart("poster");
			File posterFile = new File(dir, poster.getSubmittedFileName());
			poster.write(posterFile.getAbsolutePath());

			video.setPoster(posterFile.getName());

			BeanUtils.populate(video, request.getParameterMap());

			VideoDAO dao = new VideoDAO();
			dao.insert(video);
			request.setAttribute("MESSAGE", "Them thanh cong");
		} catch (IllegalAccessException | InvocationTargetException e) {

			e.printStackTrace();
			request.setAttribute("ERROR", "Error: " + e.getMessage());
		}

	}

	protected void findAll(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {

			VideoDAO dao = new VideoDAO();
			List<Video> list = dao.findAll();

			request.setAttribute("VIDEOS", list);
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("ERROR", "Error: " + e.getMessage());
		}

	}

	protected void edit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {

			String username = request.getParameter("id");
			VideoDAO dao = new VideoDAO();

			Video video = dao.findByID(username);
			request.setAttribute("VIDEO", video);
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("ERROR", "Error: " + e.getMessage());
		}

	}

	protected void delete(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {

			String username = request.getParameter("id");

			VideoDAO dao = new VideoDAO();

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
			
			Video video = new Video();
			File dir = new File(request.getServletContext().getRealPath("/NguoiDung/image"));

			if (!dir.exists()) { // tạo nếu chưa tồn tại
				dir.mkdirs();
			}

			Part poster = request.getPart("poster");
			File posterFile = new File(dir, poster.getSubmittedFileName());
			poster.write(posterFile.getAbsolutePath());

			video.setPoster(posterFile.getName());

			BeanUtils.populate(video, request.getParameterMap());

			VideoDAO dao = new VideoDAO();

			dao.update(video);
			request.setAttribute("USER", video);
			request.setAttribute("MESSAGE", "User da dc update");

		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("ERROR", "Error: " + e.getMessage());
		}

	}

}
