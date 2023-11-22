package edu.poly.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.TypedQuery;


import edu.poly.model.Video;


public class VideoDAO extends AbstractEntityDAO<Video>{

	public VideoDAO() {
		super(Video.class);
		
	}
	
	public List<Video> findAll() {
		EntityManager em = JpaUtils.getEntityManager();

		// TypedQuery được sử dụng để thực hiện truy vấn
		TypedQuery<Video> query = em.createNamedQuery("Video.findAll", Video.class);

		return query.getResultList();

	}
	
	public List<Video> top4VideoHot( ) {
		EntityManager em = JpaUtils.getEntityManager();
		String jpql = "select  o from Video o order by o.views desc";
		
        TypedQuery<Video> query = em.createQuery(jpql, Video.class);
        query.setMaxResults(4);
		return query.getResultList();
	}
	
	public List<Video> findVideoFavoriteByID(String uID) {
		EntityManager em = JpaUtils.getEntityManager();
		
		String jpql = "select DISTINCT  f.video from Favorite f where f.user.id =: username";
		
        TypedQuery<Video> query = em.createQuery(jpql, Video.class);
		query.setParameter("username", uID);
		return query.getResultList();
	}
	
	public List<Video> randomVideo() {
		EntityManager em = JpaUtils.getEntityManager();
		TypedQuery query = em.createNamedQuery("Report.random10", Video.class);
		return query.getResultList();
	}
	
	// truy vấn các video đc like có tiêu đề chứa "?"
		public List<Video> findVideoFavoriteByVideoTitle(String title) {
			EntityManager em = JpaUtils.getEntityManager();
			String jpql = "select distinct f.video from Favorite f where f.video.title like: tieuDe";
			TypedQuery<Video> query = em.createQuery(jpql, Video.class);
			query.setParameter("tieuDe", "%" + title + "%");
			return query.getResultList();
		}
}
