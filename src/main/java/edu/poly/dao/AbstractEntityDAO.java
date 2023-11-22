package edu.poly.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.Query;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;

import org.hibernate.sql.Select;

public abstract class AbstractEntityDAO<T> {
	private Class<T> entityClass;

	public AbstractEntityDAO(Class<T> entityClass) {

		this.entityClass = entityClass;
	}

	public void insert(T entity) {
		// tạo EntityManager để bắt đầu làm việc csdl
		EntityManager em = JpaUtils.getEntityManager();

		EntityTransaction trans = em.getTransaction();
		// em.getTransaction(); đùng trong các hoạt động thêm xóa sữa

		try {
			// bắt đầu thao tác
			trans.begin();

			em.persist(entity);
			// chấp nhận kết quả thao tác
			trans.commit();
		} catch (Exception e) {
			e.printStackTrace();

			trans.rollback();
			throw e;
		} finally {
			em.close();
		}
	}

	public void update(T entity) {
		EntityManager em = JpaUtils.getEntityManager();
		EntityTransaction trans = em.getTransaction();
		try {
			trans.begin();

			em.merge(entity);

			trans.commit();
		} catch (Exception e) {
			e.printStackTrace();

			trans.rollback();
			throw e;
		} finally {
			em.close();
		}
	}

	public void delete(Object id) {
		EntityManager em = JpaUtils.getEntityManager();
		EntityTransaction trans = em.getTransaction();
		try {
			trans.begin();

			T entity = em.find(entityClass, id);
			if (entity != null) {
				em.remove(entity);
			} else {
				throw new Exception();
			}
			trans.commit();
		} catch (Exception e) {
			e.printStackTrace();

			trans.rollback(); // huy bo
		} finally {
			em.close();
		}
	}

	public T findByID(Object id) {
		EntityManager em = JpaUtils.getEntityManager();

		T entity = em.find(entityClass, id);

		return entity;

	}

	public List<T> findAll() {
		EntityManager em = JpaUtils.getEntityManager();

		// CriteriaQuery xay dung truy van
		try {
			CriteriaQuery cq = em.getCriteriaBuilder().createQuery();

			cq.select(cq.from(entityClass));

			return em.createQuery(cq).getResultList();
		} finally {
			// TODO Auto-generated catch block
			em.close();
		}

	}
	
	public List<T> findAll(boolean all, int firstResult, int maxResult) {
		EntityManager em = JpaUtils.getEntityManager();

		try {
			// CriteriaQuery xay dung truy van
			CriteriaQuery cq = em.getCriteriaBuilder().createQuery();

			cq.select(cq.from(entityClass));
			Query q = em.createQuery(cq);
			if(!all) {
				q.setFirstResult(firstResult);
				q.setMaxResults(maxResult);
			}
			return em.createQuery(cq).getResultList();
		} finally {
			em.close();
		}

	}


	public Long count() {
		EntityManager em = JpaUtils.getEntityManager();

		try {
			// CriteriaQuery xay dung truy van
			CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
			Root<T> rt = cq.from(entityClass);
			cq.select(em.getCriteriaBuilder().count(rt));
			Query q = em.createQuery(cq);

			return (Long) q.getSingleResult();
		} finally {
			em.close();
		}

	}

}
