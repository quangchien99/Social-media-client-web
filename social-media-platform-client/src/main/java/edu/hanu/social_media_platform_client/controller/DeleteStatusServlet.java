package edu.hanu.social_media_platform_client.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import edu.hanu.social_media_platform_client.service.StatusService;

public class DeleteStatusServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	StatusService statusService = new StatusService();

	public DeleteStatusServlet() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		@SuppressWarnings("unused")
		String profileName = (String) session.getAttribute("name");
		String statusId = request.getParameter("id");
		System.out.println(statusId);
		statusService.deleteStatus(statusId);
		RequestDispatcher dispatcher = request.getRequestDispatcher("profile");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
