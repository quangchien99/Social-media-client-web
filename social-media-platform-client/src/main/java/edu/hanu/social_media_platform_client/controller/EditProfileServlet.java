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

public class EditProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public EditProfileServlet() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		String profileName = (String) session.getAttribute("name");
		System.out.println(profileName + "check eidt");

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("check posst");
		doGet(request, response);
		editProfile(request, response);
	}

	public void editProfile(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		String profileName = (String) session.getAttribute("name");
		System.out.println(profileName);
		String firstName = request.getParameter("firstName");
		System.out.println(firstName);
		String lastName = request.getParameter("lastName");
		System.out.println(lastName);
		String phoneNumber = request.getParameter("phoneNumber");
		System.out.println(phoneNumber);
		String userName = request.getParameter("profileName");
		System.out.println(userName);
		String email = request.getParameter("email");
		System.out.println(email);
		String address = request.getParameter("address");
		System.out.println(address);
		String password = request.getParameter("password");
		System.out.println(password);
		String password2 = request.getParameter("password2");
		System.out.println(password2);
		Profile profile = new Profile();
		ProfileDAO profileDAO = new ProfileDAO();
		List<Profile> profiles = profileDAO.getAll();

		if (userName.isEmpty() || !userName.equals(profileName)) {
			request.setAttribute("errorMessage", "INVALID PROFILE NAME!");
			System.out.println("1111111111");
			RequestDispatcher dispatcher = request.getRequestDispatcher("/profile");
			dispatcher.forward(request, response);
		} else if (email.isEmpty() || !Validator.isValidEmail(email)) {

			request.setAttribute("errorMessage1", "Invalid email !");
			System.out.println("1111111112");
			RequestDispatcher dispatcher = request.getRequestDispatcher("/profile");
			dispatcher.forward(request, response);
		} else if (phoneNumber.isEmpty() || !Validator.isStringNumeric(phoneNumber)) {

			request.setAttribute("errorMessage2", "Invalid phone number !");
			System.out.println("1111111113");
			RequestDispatcher dispatcher = request.getRequestDispatcher("/profile");
			dispatcher.forward(request, response);
		} else if (password.isEmpty() || !Validator.isValidatePassword(password)) {

			request.setAttribute("errorMessage3",
					"Password must be above 8 characters, contain at least one uppercase, one number, and one special character !");
			RequestDispatcher dispatcher = request.getRequestDispatcher("/profile");
			System.out.println("1111111114");
			dispatcher.forward(request, response);
		} else if (password2.isEmpty() || !password.equals(password2)) {

			request.setAttribute("errorMessage4", "Passwords do not match !");
			System.out.println("1111111115");
			RequestDispatcher dispatcher = request.getRequestDispatcher("/profile");
			dispatcher.forward(request, response);

		} else {
			System.out.println("1111111116");
			session.setAttribute("profileName", userName);
			profile.setFirstName(firstName);
			profile.setLastName(lastName);
			profile.setProfileName(userName);
			profile.setAddress(address);
			profile.setEmail(email);
			profile.setPhoneNumber(phoneNumber);
			profile.setPassword(password);
			ProfileService profileService = new ProfileService();
			profileService.editProfile(profile);
			session.setAttribute("firstName", firstName);
			session.setAttribute("lastName", lastName);
			RequestDispatcher dispatcher = request.getRequestDispatcher("/profile");
			dispatcher.forward(request, response);
		}
	}
}
