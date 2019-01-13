package com.objectif.onu.insarag_webapp.dao;
// Generated 13-Jan-2019 15:01:39 by Hibernate Tools 5.0.6.Final

import static org.hibernate.criterion.Example.create;

import java.util.List;

import javax.naming.InitialContext;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.hibernate.SessionFactory;

import com.objectif.onu.insarag_webapp.model.Postes;

/**
 * Home object for domain model class Postes.
 * @see dao.Postes
 * @author Hibernate Tools
 */
public class PostesHome {

	private static final Log log = LogFactory.getLog(PostesHome.class);

	private final SessionFactory sessionFactory = getSessionFactory();

	protected SessionFactory getSessionFactory() {
		try {
			return (SessionFactory) new InitialContext().lookup("SessionFactory");
		} catch (Exception e) {
			log.error("Could not locate SessionFactory in JNDI", e);
			throw new IllegalStateException("Could not locate SessionFactory in JNDI");
		}
	}

	public void persist(Postes transientInstance) {
		log.debug("persisting Postes instance");
		try {
			sessionFactory.getCurrentSession().persist(transientInstance);
			log.debug("persist successful");
		} catch (RuntimeException re) {
			log.error("persist failed", re);
			throw re;
		}
	}

	public void attachDirty(Postes instance) {
		log.debug("attaching dirty Postes instance");
		try {
			sessionFactory.getCurrentSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Postes instance) {
		log.debug("attaching clean Postes instance");
		try {
			sessionFactory.getCurrentSession().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void delete(Postes persistentInstance) {
		log.debug("deleting Postes instance");
		try {
			sessionFactory.getCurrentSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Postes merge(Postes detachedInstance) {
		log.debug("merging Postes instance");
		try {
			Postes result = (Postes) sessionFactory.getCurrentSession().merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public Postes findById(int id) {
		log.debug("getting Postes instance with id: " + id);
		try {
			Postes instance = (Postes) sessionFactory.getCurrentSession().get("dao.Postes", id);
			if (instance == null) {
				log.debug("get successful, no instance found");
			} else {
				log.debug("get successful, instance found");
			}
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List<Postes> findByExample(Postes instance) {
		log.debug("finding Postes instance by example");
		try {
			List<Postes> results = (List<Postes>) sessionFactory.getCurrentSession().createCriteria("dao.Postes")
					.add(create(instance)).list();
			log.debug("find by example successful, result size: " + results.size());
			return results;
		} catch (RuntimeException re) {
			log.error("find by example failed", re);
			throw re;
		}
	}
}
