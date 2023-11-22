package edu.poly.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.TypedQuery;

import edu.poly.model.Favorite;

import edu.poly.model.User;
import edu.poly.model.Video;


public class UserDAO extends AbstractEntityDAO<User> {

	public UserDAO() {
		super(User.class);
		// TODO Auto-generated constructor stub
	}

	public void changePass(String username, String oldpassword, String newpassword) throws Exception {
		EntityManager em = JpaUtils.getEntityManager();
		EntityTransaction trans = em.getTransaction();

		String jpql = "select u from User u where u.username = :username and u.pass = :password";

		try {
			trans.begin();
			TypedQuery<User> query = em.createQuery(jpql, User.class);
			query.setParameter("username", username);
			query.setParameter("password", oldpassword);

			User user = query.getSingleResult(); // tra ve doi tuong

			if (user == null) {
				throw new Exception();
			}

			user.setPass(newpassword);
			em.merge(user);

			trans.commit();
		} catch (Exception e) {
			trans.rollback();

			throw e;
		} finally {
			em.close();
		}
	}

	public User findByUsernameAndEmail(String username, String email) {
		EntityManager em = JpaUtils.getEntityManager();
		try {

			String jpql = "select u from User u where u.username = :username and u.email = :email";
			TypedQuery<User> query = em.createQuery(jpql, User.class);
			query.setParameter("username", username);
			query.setParameter("email", email);

			return query.getSingleResult();
		
		} finally {
			em.close();
		}

	}
	
	public List<User> getAllUser() {
		EntityManager em = JpaUtils.getEntityManager();
		TypedQuery query = em.createNamedQuery("User.findAll", User.class);
		return query.getResultList();
	}

}
