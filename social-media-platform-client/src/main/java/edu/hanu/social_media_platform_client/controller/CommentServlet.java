package edu.hanu.social_media_platform_client.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import edu.hanu.social_media_platform_client.model.Comment;
import edu.hanu.social_media_platform_client.model.Profile;
import edu.hanu.social_media_platform_client.service.CommentService;
import edu.hanu.social_media_platform_client.service.ProfileService;
import edu.hanu.social_media_platform_client.service.StatusService;

public class CommentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	ProfileService profileService = new ProfileService();
	CommentService commentService = new CommentService();
	StatusService statusService = new StatusService();

	public CommentServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Profile profile = new Profile();
		Comment cmt = new Comment();
		System.out.println("Check comment input");
		String comment = request.getParameter("comment");
		System.out.println(comment);
		String statusId = request.getParameter("statusId");
		System.out.println("StatusID " + statusId);
		String statusProfileName = request.getParameter("statusProfileName");
		System.out.println(statusProfileName);
		HttpSession session = request.getSession();
		String name = (String) session.getAttribute("name");
		System.out.println(name);
		if (comment.isEmpty()) {
			request.setAttribute("errorMessage1", "Write something");
			RequestDispatcher dispatcher = request.getRequestDispatcher("/home");
			dispatcher.forward(request, response);
			System.out.println("Failed");
		} else {
			cmt.setComment(comment);
			cmt.setProfile(profile);
			profile = profileService.getProfile(statusProfileName);
			cmt.setProfile(profile);
			cmt.setStatus(statusService.getStatus(Long.parseLong(statusId)));
			commentService.addComment(cmt);
			RequestDispatcher dispatcher = request.getRequestDispatcher("/home");
			dispatcher.forward(request, response);
		}
	}

	
}
