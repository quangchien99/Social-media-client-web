package edu.hanu.social_media_platform_client.dao;

import java.util.List;

import javax.ws.rs.client.Client;
import javax.ws.rs.client.ClientBuilder;
import javax.ws.rs.client.Entity;
import javax.ws.rs.client.WebTarget;
import javax.ws.rs.core.GenericType;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import edu.hanu.social_media_platform_client.model.Profile;

public class ProfileDAO {
	private Client client = ClientBuilder.newClient();
	private final WebTarget baseTarget = client.target("http://localhost:8080/social-media-platform-server/webapi");
	private WebTarget resourceTarget = baseTarget.path("/{resourceName}");
	private WebTarget resourceTargetId;

	public ProfileDAO() {
		resourceTargetId = resourceTarget.path("/{resourceId}");
	}

	public Profile get(String profilename) {
		Profile profile = resourceTargetId.resolveTemplate("resourceName", "profiles")
				.resolveTemplate("resourceId", profilename).request(MediaType.APPLICATION_JSON).get(Profile.class);
		return profile;
	}

	public void save(Profile profile) {
		Response response = resourceTarget.resolveTemplate("resourceName", "profiles").request()
				.post(Entity.json(profile));
		if (response.getStatus() != 201) {
			System.err.println("error");
		}
	}
	
	public List<Profile> getAll() {
		List<Profile> response = resourceTargetId.resolveTemplate("resourceName", "profiles")
												.request(MediaType.APPLICATION_JSON)
												.get(new GenericType<List<Profile>>() {});
		return response;
	}
	
	public void update(Profile profile, String profilename) {
		Response response = resourceTargetId.resolveTemplate("resourceName", "profiles")
				.resolveTemplate("resourceId", profilename)
				.request()
				.put(Entity.json(profile));
		if (response.getStatus() != 200) {
			System.err.println("error");
		}
	}
	
	public void delete(String profilename) {
		Response response = resourceTargetId.resolveTemplate("resourceName", "profiles")
				.resolveTemplate("resourceId", profilename)
				.request()
				.delete();
		if (response.getStatus() != 200) {
			System.err.println("error");
		}
	}
	public static void main(String[] args) {
//		Profile p = new Profile();
//		p.setFirstName("Ha");
//		p.setLastName("Nguyen");
//		p.setProfileName("ThuHa219");
//		p.setPassword("123456");
//		p.setQuestion("what is favorite book ?");
//		p.setAnswer("harry potter");
		ProfileDAO dao = new ProfileDAO();
//		dao.save(p);
		
		System.out.println(dao.get("ThuHa219").toString());
	}
}
