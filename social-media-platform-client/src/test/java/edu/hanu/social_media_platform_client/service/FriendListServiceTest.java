package edu.hanu.social_media_platform_client.service;

import static org.junit.jupiter.api.Assertions.*;

import java.util.ArrayList;
import java.util.List;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

import edu.hanu.social_media_platform_client.dao.FriendListDAO;
import edu.hanu.social_media_platform_client.dao.ProfileDAO;
import edu.hanu.social_media_platform_client.model.FriendList;
import edu.hanu.social_media_platform_client.model.Profile;

class FriendListServiceTest {

	ProfileService profileService;
	ProfileDAO profileDAO;
	FriendListService friendListService;
	FriendListDAO friendListDAO;
	
	@BeforeEach
	void init() {
		profileService = new ProfileService();
		profileDAO = new ProfileDAO();
		friendListService = new FriendListService();
	}
	
	@Test
	@DisplayName("test get all friend")
	public void testGet() {
		List<Profile> friendlist = new ArrayList<>();
		FriendList friend = new FriendList();	
		Profile p = new Profile();
		p.setProfileName("Chien4");
		friend.setProfile(p);
		friend.setFriend(friendlist);		
	}
	
	@Test 
	@DisplayName("test delete friend")
	public void testDeleteFriend() {
		FriendList friend = new FriendList();
		friendListDAO.delete("Chien4", "Chien1");
		
		assertEquals(friend, friendListDAO.get("Chien4"));
	}
	
	@Test
	@DisplayName("test add friend")
	public void testAddFriend() {
		FriendList friend = new FriendList();
		Profile p = new Profile();
		p.setProfileName("Linh18");
		friend.setProfile(p);
		friendListDAO.save(friend);
		
		assertEquals(friend, friendListDAO.get("Linh18"));
	}
	
}
