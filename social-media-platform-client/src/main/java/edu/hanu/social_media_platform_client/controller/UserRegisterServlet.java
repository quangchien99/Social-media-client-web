package edu.hanu.social_media_platform_client.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import edu.hanu.social_media_platform_client.dao.ProfileDAO;
import edu.hanu.social_media_platform_client.model.Profile;
import edu.hanu.social_media_platform_client.service.ProfileService;
import edu.hanu.social_media_platform_client.utils.Validator;

public class UserRegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UserRegisterServlet() {
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
		RequestDispatcher rd = request.getRequestDispatcher("/view/user/register.jsp");
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
		register(request, response);
		System.out.println(path);
	}

	public void register(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String firstName = request.getParameter("firstName");
		System.out.println(firstName + "hehe");
		String lastName = request.getParameter("lastName");
		String profileName = request.getParameter("profileName");
		String address = request.getParameter("address");
		String email = request.getParameter("email");
		String phoneNumber = request.getParameter("phoneNumber");
		String password = request.getParameter("password");
		System.out.println(password + "hehe");
		String confirmPassword = request.getParameter("confirmPassword");
		String question = request.getParameter("question");
		String answer = request.getParameter("answer");
		boolean isValidProfileName = true;
		Profile profile = new Profile();
		ProfileDAO profileDAO = new ProfileDAO();
		List<Profile> profiles = profileDAO.getAll();
		for (Profile p : profiles) {
			if (p.getProfileName().equals(profileName)) {
				isValidProfileName = false;
			}
		}
		if (!isValidProfileName) {
			HttpSession session = request.getSession();
			session.invalidate();
			request.setAttribute("errorMessage", "User name already exists!");
			RequestDispatcher dispatcher = request.getRequestDispatcher("/view/user/register.jsp");
			dispatcher.forward(request, response);
		} else if (!Validator.isValidEmail(email)) {
			HttpSession session = request.getSession();
			session.invalidate();
			request.setAttribute("errorMessage1", "Invalid email !");
			RequestDispatcher dispatcher = request.getRequestDispatcher("/view/user/register.jsp");
			dispatcher.forward(request, response);
		} else if (!Validator.isStringNumeric(phoneNumber)) {
			HttpSession session = request.getSession();
			session.invalidate();
			request.setAttribute("errorMessage2", "Invalid phone number !");
			RequestDispatcher dispatcher = request.getRequestDispatcher("/view/user/register.jsp");
			dispatcher.forward(request, response);
		} else if (!Validator.isValidatePassword(password)) {
			HttpSession session = request.getSession();
			session.invalidate();
			request.setAttribute("errorMessage3",
					"Password must be above 8 characters, contain at least one uppercase, one number, and one special character !");
			RequestDispatcher dispatcher = request.getRequestDispatcher("/view/user/register.jsp");
			dispatcher.forward(request, response);
		} else if (!password.equals(confirmPassword)) {
			HttpSession session = request.getSession();
			session.invalidate();
			request.setAttribute("errorMessage4", "Passwords do not match !");
			RequestDispatcher dispatcher = request.getRequestDispatcher("/view/user/register.jsp");
			dispatcher.forward(request, response);

		} else if (answer.isEmpty() || answer == null) {
			HttpSession session = request.getSession();
			session.invalidate();
			request.setAttribute("errorMessage5", "Please answer the question");
			RequestDispatcher dispatcher = request.getRequestDispatcher("/view/user/register.jsp");
			dispatcher.forward(request, response);
		} else if (question == null) {
			HttpSession session = request.getSession();
			session.invalidate();
			request.setAttribute("errorMessage6", "Please select the question");
			RequestDispatcher dispatcher = request.getRequestDispatcher("/view/user/register.jsp");
			dispatcher.forward(request, response);
		} else {
			HttpSession session = request.getSession();
			session.setAttribute("profileName", profileName);
			profile.setFirstName(firstName);
			profile.setLastName(lastName);
			profile.setProfileName(profileName);
			profile.setAddress(address);
			profile.setEmail(email);
			profile.setPhoneNumber(phoneNumber);
			profile.setPassword(password);
			profile.setAnswer(answer);
			profile.setQuestion(question);
			ProfileService profileService = new ProfileService();
			profileService.addProfile(profile);
//			RequestDispatcher dispatcher = request.getRequestDispatcher("/login");
//			dispatcher.forward(request, response);
			response.sendRedirect("view/user/login.jsp");
		}
	}
}
