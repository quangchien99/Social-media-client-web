package edu.hanu.social_media_platform_client.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import edu.hanu.social_media_platform_client.model.FriendList;
import edu.hanu.social_media_platform_client.model.Profile;
import edu.hanu.social_media_platform_client.service.FriendListService;
import edu.hanu.social_media_platform_client.service.ProfileService;

public class AddFriendServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	FriendListService friendListService = new FriendListService();
	FriendList friendList = new FriendList();
	ProfileService profileService = new ProfileService();

	public AddFriendServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		String profileName = (String) session.getAttribute("name");
		String friendName = request.getParameter("friendName");
		System.out.println(friendName);
		List<Profile> friends = new ArrayList<Profile>();
		friends = friendListService.getFriendList(profileName);
		Profile friend = profileService.getProfile(friendName);
		Profile profile = profileService.getProfile(profileName);
		friends.add(friend);
		friendList.setProfile(profile);
		friendList.setFriend(friends);
		friendListService.addFriend(friendList);
		RequestDispatcher dispatcher = request.getRequestDispatcher("profile");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
