package edu.hanu.social_media_platform_client.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import edu.hanu.social_media_platform_client.dao.ProfileDAO;
import edu.hanu.social_media_platform_client.model.Profile;

public class ProfileServlet extends HttpServlet {
	ProfileDAO profileDAO = new ProfileDAO();
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ProfileServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("It's getttt. Nooooo");
		HttpSession session = request.getSession();
		String profileName = (String) session.getAttribute("name");
		Profile profile = new Profile();
		profile = profileDAO.get(profileName);
		request.setAttribute("profile", profile);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/view/user/profile.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		String profileName = (String) session.getAttribute("name");
		Profile profile = new Profile();
		profile = profileDAO.get(profileName);
		request.setAttribute("profile", profile);
	}

}
