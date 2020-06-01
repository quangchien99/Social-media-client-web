package edu.hanu.social_media_platform_client.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import edu.hanu.social_media_platform_client.service.ProfileService;

/**
 * Servlet implementation class UserLoginServlet
 */

public class UserLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UserLoginServlet() {
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
		RequestDispatcher rd = request.getRequestDispatcher("/view/user/login.jsp");
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
		login(request, response);
		System.out.println(path);
	}

	public void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("username");
		String pass = request.getParameter("password");
		ProfileService autheticationService = new ProfileService();
		try {
			if (autheticationService.checkAuthetication(name, pass)) {
				HttpSession session = request.getSession();
				session.setAttribute("name", name);
				session.setAttribute("pass", pass);
//				request.getSession().setAttribute("user", user);
				RequestDispatcher dispatcher = request.getRequestDispatcher("/view/user/comment.jsp");
				dispatcher.forward(request, response);
			} else {
				HttpSession session = request.getSession();
				session.invalidate();
				request.setAttribute("errorMessage", "Invalid username or password");
				RequestDispatcher dispatcher = request.getRequestDispatcher("/view/user/login.jsp");
				dispatcher.forward(request, response);
				System.out.println("Failed");
			}
		} catch (ServletException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
