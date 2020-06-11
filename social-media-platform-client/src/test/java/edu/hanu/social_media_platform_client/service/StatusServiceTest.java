package edu.hanu.social_media_platform_client.service;

import static org.junit.jupiter.api.Assertions.*;

import java.util.ArrayList;
import java.util.List;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

import edu.hanu.social_media_platform_client.dao.StatusDAO;
import edu.hanu.social_media_platform_client.model.Status;

class StatusServiceTest {

	StatusService statusService;
	ProfileService profileService;
	StatusDAO statusDAO;

	@BeforeEach
	void init() {
		statusService = new StatusService();
		profileService = new ProfileService();
		statusDAO = new StatusDAO();
	}

	@Test
	@DisplayName("test get each status")
	public void testGet() {
		Status status = new Status();
		status.setId(1);
		status.setCreated("2020-06-01");
		status.setStatus("It's beautiful day");
		status.setProfile(profileService.getProfile("Chien4"));

		assertEquals(status.toString(), statusService.getStatus(1).toString());
	}

	@Test 
	@DisplayName("test get all status")
	public void testGetAll() {
		List<Status> statuses = new ArrayList<>();
			  Status status1 = new Status();
			  status1.setId(2);
			  status1.setCreated("2020-06-01");
			  status1.setStatus("It's awful day");
			  status1.setProfile(profileService.getProfile("Chien3"));
			  statuses.add(status1);
			  
			  Status status2 = new Status();
			  status2.setId(3);
			  status2.setCreated("2020-06-01");
			  status2.setStatus("It's awesome day");
			  status2.setProfile(profileService.getProfile("Chien2"));
			  statuses.add(status2);
			  
			  assertEquals(statuses, statusDAO.getAll());
			 }
	
	@Test
	@DisplayName("test add status")
	public void testAddStatus() {
		Status status = new Status();
		status.setId(24);
		status.setStatus("She is so gorgeous");
		status.setProfile(profileService.getProfile("Linh"));
		statusDAO.save(status);
		
		assertEquals(status, statusDAO.get(24));
	}
	
	@Test
	@DisplayName("delete status")
	public void testDeleteStaus() {
		Status status = new Status();
		statusDAO.delete(4);
		assertEquals(status, statusDAO.get(4));
	}
}