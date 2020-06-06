package edu.hanu.social_media_platform_client.service;

import java.util.List;

import edu.hanu.social_media_platform_client.dao.LikeDAO;
import edu.hanu.social_media_platform_client.model.Like;

public class LikeService {
	LikeDAO likeDAO = new LikeDAO();

	public void addLike(Like like) {
		likeDAO.save(like);
	}

	public List<Like> getAllLikes() {
		return likeDAO.getAll();
	}
}
