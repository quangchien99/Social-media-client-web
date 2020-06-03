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

import edu.hanu.social_media_platform_client.model.Comment;
import edu.hanu.social_media_platform_client.model.FriendList;
import edu.hanu.social_media_platform_client.model.Profile;
import edu.hanu.social_media_platform_client.model.Status;
import edu.hanu.social_media_platform_client.service.CommentService;
import edu.hanu.social_media_platform_client.service.FriendListService;
import edu.hanu.social_media_platform_client.service.StatusService;

public class HomePageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	FriendListService friendListService = new FriendListService();
	StatusService statusService = new StatusService();
	CommentService commentService = new CommentService();
	List<Profile> friends;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public HomePageServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		String profileName = (String) session.getAttribute("name");
		String statusId = request.getParameter("statusId");
		// System.out.println("StatusID " + statusId);
		System.out.println("Hehe " + profileName);
		List<Status> statuses = showFriendStatus(profileName);
		// statuses.get(1).getProfile().getProfileName()
		System.out.println(statuses.size());
		for (Status status : statuses) {
			System.out.println(status);
		}
		List<Comment> comments = getCommentInPost();
		System.out.println(comments.size() + " check size cmtt");
		for (Comment comment : comments) {
			System.out.println(comment.toString());
		}
		// comments = getCommentInPost(Integer.parseInt(statusId));
		// comments.get(0).getStatus().getId()
		request.setAttribute("comments", comments);
		request.setAttribute("statuses", statuses);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/view/user/homePage.jsp");
		dispatcher.forward(request, response);
	}

	public List<Status> showFriendStatus(String profileName) {
		friends = friendListService.getFriendList(profileName);
		List<Status> statuses = statusService.getAllStatus();
		for (Status status : statuses) {
			System.out.println(status);
		}
		List<Status> filteredStatuses = new ArrayList<Status>();
		for (int i = 0; i < friends.size(); i++) {
			System.out.println(friends.get(i).toString() + "check cuuu");
			for (Status status : statuses) {
				if (status.getProfile().getProfileName().equals(friends.get(i).getProfileName())) {
					filteredStatuses.add(status);
				}
			}
		}
		Collections.reverse(filteredStatuses);
		return filteredStatuses;
	}

	public List<Comment> getCommentInPost() {
		List<Comment> comments = commentService.getAllComments();
//		List<Comment> filteredComments = new ArrayList<Comment>();
//		for (Comment c : comments) {
//			if (c.getStatus().getId() == statusId) {
//				filteredComments.add(c);
//			}
//		}
//		for (Comment c : filteredComments) {
//			System.out.println(c.toString());
//		}
//		return filteredComments;
		return comments;
	}
}
