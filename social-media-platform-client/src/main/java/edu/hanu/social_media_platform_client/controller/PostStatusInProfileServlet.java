package edu.hanu.social_media_platform_client.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import edu.hanu.social_media_platform_client.model.Profile;
import edu.hanu.social_media_platform_client.model.Status;
import edu.hanu.social_media_platform_client.service.ProfileService;
import edu.hanu.social_media_platform_client.service.StatusService;

public class PostStatusInProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public PostStatusInProfileServlet() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String stt = request.getParameter("status");
		System.out.println(stt);
		Status status = new Status();
		HttpSession session = request.getSession();
		String name = (String) session.getAttribute("name");
		System.out.println(name);
		ProfileService profileService = new ProfileService();
		Profile profile = profileService.getProfile(name);
		StatusService statusService = new StatusService();
		if (stt.isEmpty()) {
			request.setAttribute("errorMessage", "Write something");
			RequestDispatcher dispatcher = request.getRequestDispatcher("/profile");
			dispatcher.forward(request, response);
			System.out.println("Failed");
		} else {
			status.setStatus(stt);
			status.setProfile(profile);
			System.out.println(profile.toString());
			statusService.addStatus(status);
			RequestDispatcher dispatcher = request.getRequestDispatcher("/profile");
			dispatcher.forward(request, response);
		}
	}

}
