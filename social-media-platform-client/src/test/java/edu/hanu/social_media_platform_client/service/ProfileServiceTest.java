package edu.hanu.social_media_platform_client.service;

import static org.junit.jupiter.api.Assertions.*;

import java.util.ArrayList;
import java.util.List;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

import edu.hanu.social_media_platform_client.dao.ProfileDAO;
import edu.hanu.social_media_platform_client.exception.DataNotFoundException;
import edu.hanu.social_media_platform_client.model.Profile;


class ProfileServiceTest {
	
	ProfileService profileService;
	ProfileDAO profileDAO;
	
	@BeforeEach
	void init() {
		profileService = new ProfileService();
		profileDAO = new ProfileDAO();
	}
	
	@Test
	@DisplayName("test get each profile")
	public void testGet() {
		Profile profile = new Profile();
		profile.setFirstName("Chien");
		profile.setLastName("Pham");
		profile.setCreated("2020-06-01");
		profile.setProfileName("Chien2");
		profile.setEmail("quangchiennnn@gmail.com");
		profile.setAddress("Ha Noi");
		profile.setPhoneNumber("0366271270");
		profile.setQuestion("What is your nickname?");
		profile.setAnswer("Oat");		
		
		assertEquals(profile.toString(), profileDAO.get(2));
	}
	
	@Test 
	@DisplayName("test get all profile")
	public void testGetAll() throws DataNotFoundException{
		List<Profile> profiles = new ArrayList<>();
				Profile profile1 = new Profile();
				profile1.setFirstName("Chiennnnnn");
				profile1.setLastName("Trammmm");
				profile1.setCreated("2020-06-01");
				profile1.setProfileName("Chien4");
				profile1.setEmail("quangchiennnn@gmail.com");
				profile1.setAddress("Ha Noi");
				profile1.setPhoneNumber("0366271270");
				profile1.setQuestion("What is your nickname?");
				profile1.setAnswer("Oat");
				
				Profile profile2 = new Profile();
				profile2.setFirstName("Chienn");
				profile2.setLastName("Phamm");
				profile2.setCreated("2020-06-05");
				profile2.setProfileName("Quangchien19");
				profile2.setEmail(null);
				profile2.setAddress(null);
				profile2.setPhoneNumber(null);
				profile2.setQuestion(null);
				profile2.setAnswer(null);
				
				profiles.add(profile1);
				profiles.add(profile2);		
				
				assertEquals(profiles, profileDAO.getAll());
	}
	
	@Test
	@DisplayName("test get profile for year")
	public void testGetProfilesForYear() {
		List<Profile> profilesYear = new ArrayList<>();
		Profile profile1 = new Profile();
		profile1.setFirstName("Chiennnnnn");
		profile1.setLastName("Trammmm");
		profile1.setProfileName("Chien4");
		
		Profile profile2 = new Profile();
		profile2.setFirstName("Chiennnnnn");
		profile2.setLastName("Trammmm");
		profile2.setProfileName("Chien4");
		
		profilesYear.add(profile1);
		profilesYear.add(profile2);
		
		assertEquals(profilesYear, profileDAO.getAll());
		
	}
	
	@Test
	@DisplayName("test add profile")
	public void testAddProfile() {
		Profile profile = new Profile();
		profile.setFirstName("Linh");
		profile.setLastName("Khanh");
		profile.setProfileName("Linhh");
		profileDAO.save(profile);
		
		assertEquals(profile, profileDAO.get("Linhh"));
	}
	
	@Test
	@DisplayName("test update profile")
	public void testUpdateProfile() {
		Profile profile = new Profile();
		profile.setFirstName("Chien");
		profile.setLastName("Pham");
		profile.setProfileName("Chien5");
		profile.setQuestion("What is your nickname?");
		profile.setAnswer("Xinh");
		profileDAO.update(profile);
		
		assertEquals(profile, profileDAO.get("Linhh"));
	}
	
	@Test
	@DisplayName("test edit profile")
	public void testEditProfile() {
		Profile profile = new Profile();
		profile.setFirstName("Ha");
		profile.setLastName("Nguyen");
		profile.setProfileName("ThuHa219");
		profileDAO.edit(profile);
		
		assertEquals(profile, profileDAO.get("ThuHa219"));
	}
	
	@Test
	@DisplayName("test remove profile")
	public void testRemoveProfile() {
		Profile profile = new Profile();
		profileDAO.delete(3);
		assertEquals(profile,profileDAO.get(3));
	}
	
}
