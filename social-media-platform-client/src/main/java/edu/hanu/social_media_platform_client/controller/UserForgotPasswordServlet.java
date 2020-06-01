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

/**
 * Servlet implementation class UserForgotPasswordServlet
 */

public class UserForgotPasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UserForgotPasswordServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String path = request.getServletPath();
		RequestDispatcher rd = request.getRequestDispatcher("/view/user/forgotPassword.jsp");
		request.setAttribute("path", path);
		rd.forward(request, response);
		System.out.println(path);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String path = request.getServletPath();
		forgotPassword(request, response);
		System.out.println(path);
	}

	public void forgotPassword(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String username = request.getParameter("username");
		String question = request.getParameter("question");
		String answer = request.getParameter("answer");
		System.out.println(answer + " " + question);
		Profile profile = new Profile();
		ProfileDAO profileDAO = new ProfileDAO();
		try {
			profile = profileDAO.get(username);

			if (profile.getQuestion().equals(question) && profile.getAnswer().equals(answer)) {
				HttpSession session = request.getSession();
				System.out.println("Check1");
				session.setAttribute("name", username);
				RequestDispatcher dispatcher = request.getRequestDispatcher("/view/user/changePassword.jsp");
				dispatcher.forward(request, response);
			} else {
				HttpSession session = request.getSession();
				session.invalidate();
				request.setAttribute("errorMessage", "Wrong question or answer");
				RequestDispatcher dispatcher = request.getRequestDispatcher("/view/user/forgotPassword.jsp");
				dispatcher.forward(request, response);
				System.out.println("Failed");
			}
		} catch (NullPointerException e) {
			HttpSession session = request.getSession();
			session.invalidate();
			request.setAttribute("errorMessage0", "Invalid username");
			RequestDispatcher dispatcher = request.getRequestDispatcher("/view/user/forgotPassword.jsp");
			dispatcher.forward(request, response);
			System.out.println("Failed");
		}
	}

}
