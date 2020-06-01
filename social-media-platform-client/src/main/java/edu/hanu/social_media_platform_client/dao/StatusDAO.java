package edu.hanu.social_media_platform_client.dao;

import java.util.List;

import javax.ws.rs.client.Client;
import javax.ws.rs.client.ClientBuilder;
import javax.ws.rs.client.Entity;
import javax.ws.rs.client.WebTarget;
import javax.ws.rs.core.GenericType;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import edu.hanu.social_media_platform_client.model.Status;

public class StatusDAO implements DAO<Status>{
	private Client client = ClientBuilder.newClient();
	private final WebTarget baseTarget = client.target("http://localhost:8080/social-media-platform-server/webapi");
	private WebTarget resourceTarget = baseTarget.path("/{resourceName}");
	private WebTarget resourceTargetId;

	public StatusDAO() {
		resourceTargetId = resourceTarget.path("/{resourceId}");
	}

	public Status get(long id) {
		Status status = resourceTargetId.resolveTemplate("resourceName", "statuses")
				.resolveTemplate("resourceId", id).request(MediaType.APPLICATION_JSON).get(Status.class);
		return status;
	}

	public void save(Status status) {
		Response response = resourceTarget.resolveTemplate("resourceName", "statuses").request()
				.post(Entity.json(status));
		if (response.getStatus() != 201) {
			System.err.println("error");
		}
	}
	
	public List<Status> getAll() {
		List<Status> response = resourceTargetId.resolveTemplate("resourceName", "statuses")
												.request(MediaType.APPLICATION_JSON)
												.get(new GenericType<List<Status>>() {});
		return response;
	}
	
	public void update(Status status) {
		Response response = resourceTargetId.resolveTemplate("resourceName", "statuses")
				.resolveTemplate("resourceId", status.getStatus())
				.request()
				.put(Entity.json(status));
		if (response.getStatus() != 204) {
			System.err.println("StatusDAO.update()");
		}
	}
	
	public void delete(long id) {
		Response response = resourceTargetId.resolveTemplate("resourceName", "status")
				.resolveTemplate("resourceId", id)
				.request()
				.delete();
		if (response.getStatus() != 204) {
			System.err.println("StatusDAO.delete()");
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
		StatusDAO dao = new StatusDAO();
//		dao.save(p);
		
		System.out.println(dao.get(1).toString());
	}
}

