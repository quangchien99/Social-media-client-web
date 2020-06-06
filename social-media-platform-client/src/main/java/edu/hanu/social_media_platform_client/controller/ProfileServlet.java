package edu.hanu.social_media_platform_client.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import edu.hanu.social_media_platform_client.dao.ProfileDAO;
import edu.hanu.social_media_platform_client.model.Comment;
import edu.hanu.social_media_platform_client.model.Profile;
import edu.hanu.social_media_platform_client.model.Status;
import edu.hanu.social_media_platform_client.service.CommentService;
import edu.hanu.social_media_platform_client.service.FriendListService;
import edu.hanu.social_media_platform_client.service.ProfileService;
import edu.hanu.social_media_platform_client.service.StatusService;

public class ProfileServlet extends HttpServlet {
	ProfileDAO profileDAO = new ProfileDAO();
	StatusService statusService = new StatusService();
	CommentService commentService = new CommentService();
	FriendListService friendListService = new FriendListService();
	List<Profile> friends;
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
		System.out.println("It's getttt.");
		HttpSession session = request.getSession();
		String profileName = (String) session.getAttribute("name");
		System.out.println(profileName);
		Profile profile = new Profile();
		profile = profileDAO.get(profileName);
		request.setAttribute("profile", profile);
		List<Status> statuses = listStatuses(profileName);
		List<Comment> comments = commentService.getAllComments();
		List<Profile> friends = listFriend(profileName);
		request.setAttribute("friends", friends);
		request.setAttribute("comments", comments);
		request.setAttribute("statuses", statuses);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/view/user/profile.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

	public List<Profile> listFriend(String profileName) {
		return friends = friendListService.getFriendList(profileName);
	}

	public List<Status> listStatuses(String profileName) {
		List<Status> statuses = statusService.getAllStatus();
		List<Status> filteredStatuses = new ArrayList<Status>();
		for (Status s : statuses) {
			if (s.getProfile().getProfileName().equals(profileName)) {
				filteredStatuses.add(s);
			}
		}
		Collections.reverse(filteredStatuses);
		return filteredStatuses;
	}
}
