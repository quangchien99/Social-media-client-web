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
import edu.hanu.social_media_platform_client.model.Like;
import edu.hanu.social_media_platform_client.model.Profile;
import edu.hanu.social_media_platform_client.model.Status;
import edu.hanu.social_media_platform_client.service.CommentService;
import edu.hanu.social_media_platform_client.service.FriendListService;
import edu.hanu.social_media_platform_client.service.LikeService;
import edu.hanu.social_media_platform_client.service.ProfileService;
import edu.hanu.social_media_platform_client.service.StatusService;

public class HomePageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	FriendListService friendListService = new FriendListService();
	StatusService statusService = new StatusService();
	CommentService commentService = new CommentService();
	ProfileService profileService = new ProfileService();
	LikeService likeService = new LikeService();
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
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		String profileName = (String) session.getAttribute("name");
		@SuppressWarnings("unused")
		String statusId = request.getParameter("statusId");
		// System.out.println("StatusID " + statusId);
		System.out.println("Hehe " + profileName);
		List<Status> statuses = showFriendStatus(profileName);
		// statuses.get(1).getProfile().getProfileName()
		System.out.println(statuses.size());
		for (Status status : statuses) {
			System.out.println(status);
		}

		Profile profile = profileService.getProfile(profileName);

		List<Comment> comments = getCommentInPost();
		System.out.println(comments.size() + " check size cmtt");
		for (Comment comment : comments) {
			System.out.println(comment.toString());
		}
		// comments = getCommentInPost(Integer.parseInt(statusId));
		// comments.get(0).getCreated()
		
		List<Like> allLikes = getAllLikes();
		request.setAttribute("allLikes", allLikes);
		request.setAttribute("profile", profile);
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
		return comments;
	}

	public List<Like> getAllLikes() {
		@SuppressWarnings("unused")
		List<Like> likes = new ArrayList<Like>();
		return likes = likeService.getAllLikes();
	}
	public int countLike(String statusId) {
		List<Like> likes = new ArrayList<Like>();
		int count = 0;
		for(Like like : likes) {
			if(like.getStatus().getId() == Integer.parseInt(statusId)) {
				count++;
			}
		}
		return count;
	}
}
