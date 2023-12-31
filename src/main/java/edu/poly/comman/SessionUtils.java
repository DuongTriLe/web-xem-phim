package edu.poly.comman;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class SessionUtils {
	// luu 1 doi tuong trong session
	public static void add(HttpServletRequest request, String name, Object value) {
		HttpSession session = request.getSession();
		session.setAttribute(name, value);
	}
	
	public static Object get(HttpServletRequest request, String name) {
		HttpSession session = request.getSession();
		return session.getAttribute(name);
	}
	
	// huy bo session
	public static void invalidate(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.removeAttribute("username");
		session.invalidate();
	}
	
	// check da login hay chua
	public static boolean isLogin(HttpServletRequest request) {
		return get(request, "username") != null;
	}
	
	public static String getLoginUsername(HttpServletRequest request) {
		Object username = get(request, "username");
		return username == null? null:username.toString();
	}
	
}
