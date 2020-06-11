package edu.hanu.social_media_platform_client.service;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

import edu.hanu.social_media_platform_client.dao.CommentDAO;
import edu.hanu.social_media_platform_client.dao.ProfileDAO;
import edu.hanu.social_media_platform_client.dao.StatusDAO;
import edu.hanu.social_media_platform_client.model.Comment;
import edu.hanu.social_media_platform_client.model.Profile;
import edu.hanu.social_media_platform_client.model.Status;

class CommentServiceTest {
	
	CommentService commentService;
	CommentDAO commentDAO;
	StatusService statusService;
	StatusDAO statusDAO;
	ProfileService profileService;
	ProfileDAO profileDAO;
	
	@BeforeEach
	void init() {
		commentService = new CommentService();
		statusService = new StatusService();
		commentDAO = new CommentDAO();
	}
	
	@Test
	@DisplayName("test add comment")
	public void testAddComment() {
		
		Profile p = new Profile();
		p.setProfileName("Chien4");
		
		Status s = new Status();	
		s.setProfile(p);
		s.setId(1);
		
		Comment c = new Comment();
		c.setId(17);
		c.setComment("Hello");
		c.setCreated("2020-06-06");
		c.setProfile(p);
		c.setStatus(s);
		commentDAO.save(c);
		
		assertEquals(c, commentDAO.get(17));
	}
}
