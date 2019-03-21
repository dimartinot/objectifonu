package com.objectif.onu.insarag_webapp.dao;
// Generated 13-Jan-2019 15:01:39 by Hibernate Tools 5.0.6.Final

import static org.hibernate.criterion.Example.create;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import org.hibernate.query.Query;
import org.hibernate.service.ServiceRegistry;

import com.objectif.onu.insarag_webapp.model.Alerte;
import com.objectif.onu.insarag_webapp.model.Arepondu;
import com.objectif.onu.insarag_webapp.model.Grade;
import com.objectif.onu.insarag_webapp.model.Infomission;
import com.objectif.onu.insarag_webapp.model.Liensutiles;
import com.objectif.onu.insarag_webapp.model.Mission;
import com.objectif.onu.insarag_webapp.model.Pays;
import com.objectif.onu.insarag_webapp.model.Pois;
import com.objectif.onu.insarag_webapp.model.Postes;
import com.objectif.onu.insarag_webapp.model.Roles;
import com.objectif.onu.insarag_webapp.model.Users;
import com.objectif.onu.insarag_webapp.model.Ville;

/**
 * Home object for domain model class Grade.
 * @see dao.Grade
 * @author Hibernate Tools
 */
public class GradeHome {

	private static final Log log = LogFactory.getLog(GradeHome.class);

	private final SessionFactory sessionFactory = getSessionFactory();

	protected SessionFactory getSessionFactory() {
		try {
			Configuration configuration = new Configuration().configure();
			ServiceRegistry registry = new StandardServiceRegistryBuilder()
	                .applySettings(configuration.getProperties())
	                .build();
			SessionFactory s = configuration
					.addClass(Users.class)
					.addClass(Roles.class)
					.addClass(Grade.class)
					.addClass(Postes.class)
					.addClass(Ville.class)
					.addClass(Pays.class)
					.addClass(Alerte.class)
					.addClass(Arepondu.class)
					.addClass(Infomission.class)
					.addClass(Mission.class)
					.addClass(Liensutiles.class)
					.addClass(Pois.class)
					.buildSessionFactory(registry);
			return s;
//			return (SessionFactory) new InitialContext().lookup("SessionFactory");
		} catch (Exception e) {
			log.error("Could not locate SessionFactory in JNDI", e);
			throw new IllegalStateException("Could not locate SessionFactory in JNDI");
		}
	}

	public void persist(Grade transientInstance) {
		log.debug("persisting Grade instance");
		try {
			sessionFactory.getCurrentSession().persist(transientInstance);
			log.debug("persist successful");
		} catch (RuntimeException re) {
			log.error("persist failed", re);
			throw re;
		}
	}

	public void attachDirty(Grade instance) {
		log.debug("attaching dirty Grade instance");
		try {
			sessionFactory.getCurrentSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Grade instance) {
		log.debug("attaching clean Grade instance");
		try {
			sessionFactory.getCurrentSession().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void deleteById(Grade persistentInstance) {
		log.debug("deleting Grade instance");
		try {
			sessionFactory.getCurrentSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Grade merge(Grade detachedInstance) {
		log.debug("merging Grade instance");
		try {
			Grade result = (Grade) sessionFactory.getCurrentSession().merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public Grade findById(int id) {
		log.debug("getting Grade instance with id: " + id);
		try {
			Transaction tx;
			if (sessionFactory.getCurrentSession().getTransaction().isActive() == false) {
				tx = sessionFactory.getCurrentSession().beginTransaction();
			} else {
				tx = sessionFactory.getCurrentSession().getTransaction();
			}
			Grade instance = (Grade) sessionFactory.getCurrentSession().createQuery("from Grade g where g.idGrade = '"+id+"'").getSingleResult();
			tx.commit();
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

	public List<Grade> findByExample(Grade instance) {
		log.debug("finding Grade instance by example");
		try {
			List<Grade> results = (List<Grade>) sessionFactory.getCurrentSession().createCriteria("dao.Grade")
					.add(create(instance)).list();
			log.debug("find by example successful, result size: " + results.size());
			return results;
		} catch (RuntimeException re) {
			log.error("find by example failed", re);
			throw re;
		}
	}
	
	public Grade findByUserId(int id) {

		try {
			sessionFactory.openSession();
			log.info("session opened !");
		} catch (Exception e) {
			log.error(e.getMessage());
		}
		log.debug("getting Grade instance with id: " + id);

		try {
			Transaction tx;
			if (sessionFactory.getCurrentSession().getTransaction().isActive() == false) {
				tx = sessionFactory.getCurrentSession().beginTransaction();
			} else {
				tx = sessionFactory.getCurrentSession().getTransaction();
			}
			Query query = sessionFactory.getCurrentSession().createQuery("from Grade as grade where grade.users = "+id);
			Grade res = (Grade) query.getSingleResult();
			tx.commit();
			if (res == null) {
				log.debug("get successful, no instance found");
			} else {
				log.debug("get successful, instance found");
			}
			return res;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}
	
	public List<Grade> findAllGrades(){
		try {
			sessionFactory.openSession();
			log.info("session opened !");
		} catch (Exception e) {
			log.error(e.getMessage());
		}
		log.debug("getting all users from the database");
		try {

			Transaction tx;
			if (sessionFactory.getCurrentSession().getTransaction().isActive() == false) {
				tx = sessionFactory.getCurrentSession().beginTransaction();
			} else {
				tx = sessionFactory.getCurrentSession().getTransaction();
			}return (List<Grade>) sessionFactory.getCurrentSession().createQuery("from Grade").list();
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
		
	}
}
