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
import edu.hanu.social_media_platform_client.utils.PasswordAuthentication;
import edu.hanu.social_media_platform_client.utils.Validator;
import javassist.runtime.Cflow;

public class UserChangePasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UserChangePasswordServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	@SuppressWarnings("deprecation")
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		String name = (String) session.getAttribute("name");
		System.out.println(name);
		PasswordAuthentication authentication = new PasswordAuthentication();
		Profile profile = new Profile();
		ProfileDAO profileDAO = new ProfileDAO();
		profile = profileDAO.get(name);
		System.out.println(profile.toString());
		System.out.println("check2");

		String newPassword = request.getParameter("newpassword");
		String cfnewPassword = request.getParameter("confirmpassword");
		System.out.println(newPassword + " " + cfnewPassword);
		if (!Validator.isValidatePassword(newPassword)) {
			request.setAttribute("errorMessage3",
					"Password must be above 8 characters, contain at least one uppercase, one number, and one special character !");
			RequestDispatcher dispatcher = request.getRequestDispatcher("/view/user/changePassword.jsp");
			dispatcher.forward(request, response);
			// response.sendRedirect("/view/user/changePassword.jsp");
		} else {
			if (authentication.checkPassword(newPassword, profile.getPassword())) {
				request.setAttribute("errorMessage1", "Password can not be the same with old password");
				RequestDispatcher dispatcher = request.getRequestDispatcher("/view/user/changePassword.jsp");
				dispatcher.forward(request, response);
				System.out.println("Failed");
			} else if (newPassword.equals(cfnewPassword)) {

				profile.setPassword(newPassword);
				profileDAO.update(profile);
				RequestDispatcher dispatcher = request.getRequestDispatcher("/view/user/login.jsp");
				dispatcher.forward(request, response);
			} else {
				request.setAttribute("errorMessage", "Password does not match");
				RequestDispatcher dispatcher = request.getRequestDispatcher("/view/user/changePassword.jsp");
				dispatcher.forward(request, response);
				System.out.println("Failed");
			}
		}
	}

}
