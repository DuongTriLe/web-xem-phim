package edu.poly.comman;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.collections.map.HashedMap;

public class PageInfo {
	public static Map<PageType, PageInfo> pageRoute = new HashedMap();

	static {
		pageRoute.put(PageType.USER_MANAGEMENT_PAGE, new PageInfo("User Management", "/admin/users/users.jsp", null));
		pageRoute.put(PageType.REPORT_MANAGEMENT_PAGE, new PageInfo("User Management", "/admin/reports/reports.jsp", null));
		pageRoute.put(PageType.VIDEOS_MANAGEMENT_PAGE, new PageInfo("User Management", "/admin/videos/videos.jsp", null));
		
		pageRoute.put(PageType.SITE_HOME_PAGE, new PageInfo("User Management", "/sites/home/home.jsp", null));
		pageRoute.put(PageType.SITE_LOGIN_PAGE, new PageInfo("User Management", "/sites/users/login.jsp", null));
		pageRoute.put(PageType.SITE_REGISTER_PAGE, new PageInfo("User Management", "/sites/users/register.jsp", null));
		pageRoute.put(PageType.SITE_CHANGE_PASSWORD_PAGE, new PageInfo("User Management", "/sites/users/changePass.jsp", null));
		pageRoute.put(PageType.SITE_FORGOTPASS_PAGE, new PageInfo("User Management", "/sites/users/forgot-pass.jsp", null));
		
		
		
		pageRoute.put(PageType.SITE_EDIT_PROFILE_PAGE, new PageInfo("User Management", "/sites/users/edit-profile.jsp", null));
		
		pageRoute.put(PageType.SITE_DETAIL_PAGE, new PageInfo("User Management", "/sites/videos/share.jsp", null));
		pageRoute.put(PageType.SITE_FAVORITE_PAGE, new PageInfo("User Management", "/sites/videos/favorite.jsp", null));
		pageRoute.put(PageType.SITE_SHARE_PAGE, new PageInfo("User Management", "/sites/videos/detail.jsp", null));
	}

	public static void prepareAndForward(HttpServletRequest request, HttpServletResponse respone, PageType pagetype)
			throws ServletException, IOException {
		PageInfo page = pageRoute.get(pagetype);

		request.setAttribute("PAGE", page);

		request.getRequestDispatcher("/admin/layout.jsp").forward(request, respone);
	}
	
	public static void prepareAndForwardSite(HttpServletRequest request, HttpServletResponse respone, PageType pagetype)
			throws ServletException, IOException {
		PageInfo page = pageRoute.get(pagetype);

		request.setAttribute("PAGE", page);

		request.getRequestDispatcher("/sites/layout.jsp").forward(request, respone);
	}

	private String title;
	private String contentUrl;
	private String scriptUrl;

	public PageInfo(String title, String contentUrl, String scriptUrl) {

		this.title = title;
		this.contentUrl = contentUrl;
		this.scriptUrl = scriptUrl;
	}

	public static Map<PageType, PageInfo> getPageRoute() {
		return pageRoute;
	}

	public static void setPageRoute(Map<PageType, PageInfo> pageRoute) {
		PageInfo.pageRoute = pageRoute;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContentUrl() {
		return contentUrl;
	}

	public void setContentUrl(String contentUrl) {
		this.contentUrl = contentUrl;
	}

	public String getScriptUrl() {
		return scriptUrl;
	}

	public void setScriptUrl(String scriptUrl) {
		this.scriptUrl = scriptUrl;
	}

}
