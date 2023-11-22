package edu.poly.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.Query;
import javax.persistence.TypedQuery;

import edu.poly.domain.FavoriteReports;
import edu.poly.domain.FavoriteUserReports;
import edu.poly.model.Favorite;
import edu.poly.model.Video;

public class FavoriteDAO extends AbstractEntityDAO<Favorite> {

	public FavoriteDAO() {
		super(Favorite.class);

	}

	public List<FavoriteReports> reportFavoriteByVideo() {
		EntityManager em = JpaUtils.getEntityManager();
		String jpql = "SELECT new FavoriteReports(o.video.title,count(o),max(o.likedDate),min(o.likedDate))"
				+ "from Favorite o group by o.video.title";
		TypedQuery<FavoriteReports> query = em.createQuery(jpql, FavoriteReports.class);

		return query.getResultList();
	}

	public List<FavoriteUserReports> reportFavoriteUserByVideo(String videoId) {
		EntityManager em = JpaUtils.getEntityManager();
		String jpql = "SELECT new edu.poly.domain.FavoriteUserReports(f.user.username, f.user.fullname, "
				+ "f.user.email, f.likedDate)" + "from Favorite f where f.video.videoId = :id";
		TypedQuery<FavoriteUserReports> query = em.createQuery(jpql, FavoriteUserReports.class);
		query.setParameter("id", videoId);
		return query.getResultList();
	}

	public List<Favorite> findUserLikeVideo(String uID,String videoId) {
		EntityManager em = JpaUtils.getEntityManager();
		String jpql = "select f from Favorite f where f.user.id  =: username and f.video.videoId =: videoId";
		TypedQuery<Favorite> query = em.createQuery(jpql, Favorite.class);
		query.setParameter("username",    uID  );
		query.setParameter("videoId",   videoId );
		return query.getResultList();
	}

	public Favorite findFavourite(String userID, String idVideo) {
		EntityManager em = JpaUtils.getEntityManager();

		String jqpl = "select f from Favorite f where f.user.id  =: idUser and f.video.videoId =: idVideo";

		TypedQuery<Favorite> query = em.createQuery(jqpl, Favorite.class);
		query.setParameter("idUser", userID);
		query.setParameter("idVideo", idVideo);

		return query.getResultList().stream().findFirst().orElse(null);
	}
	
	public static void deleteFavorite(String username, String videoId) {
		EntityManager em = JpaUtils.getEntityManager();
		EntityTransaction trans = em.getTransaction();
		try {
			trans.begin();
			String hql = "delete from Favorite f where  f.user.username =: username and f.video.videoId = :videoId";
			Query query = em.createQuery(hql);
			query.setParameter("username", username);
			query.setParameter("videoId", videoId);

			query.executeUpdate();
			trans.commit();

		} catch (Exception ex) {
			trans.rollback(); // huy bo
			System.out.println("Lỗi: " + ex);
		} finally {
			em.close();
		}
	}
	
	
}
