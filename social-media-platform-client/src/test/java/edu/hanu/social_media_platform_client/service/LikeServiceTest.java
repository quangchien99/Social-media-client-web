package edu.hanu.social_media_platform_client.service;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

import edu.hanu.social_media_platform_client.dao.LikeDAO;
import edu.hanu.social_media_platform_client.dao.ProfileDAO;
import edu.hanu.social_media_platform_client.dao.StatusDAO;
import edu.hanu.social_media_platform_client.model.Like;
import edu.hanu.social_media_platform_client.model.Profile;
import edu.hanu.social_media_platform_client.model.Status;

class LikeServiceTest {

	StatusService statusService;
	StatusDAO statusDAO;
	ProfileService profileService;
	ProfileDAO profileDAO;
	LikeService likeService;
	LikeDAO likeDAO;
	
	@BeforeEach
	void init() {
		likeService = new LikeService();
		statusService = new StatusService();
		likeDAO = new LikeDAO();
	}
	
	@Test
	@DisplayName("test add like")
	public void testAddLike() {
		Profile p = new Profile();
		p.setProfileName("Chien1");
		
		Status s = new Status();	
		s.setProfile(p);
		s.setId(2);
		
		Like like = new Like();
		like.setId(8);
		like.setCreated("2020-06-01");
		like.setProfile(p);
		like.setStatus(s);
		
		assertEquals(like, likeDAO.get(8));
	}
	
}
