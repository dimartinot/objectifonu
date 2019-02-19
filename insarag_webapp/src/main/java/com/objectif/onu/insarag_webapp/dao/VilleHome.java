package com.objectif.onu.insarag_webapp.dao;
// Generated 20-Jan-2019 19:48:17 by Hibernate Tools 5.0.6.Final

import static org.hibernate.criterion.Example.create;

import java.util.List;

import javax.naming.InitialContext;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import org.hibernate.exception.ConstraintViolationException;
import org.hibernate.query.Query;
import org.hibernate.service.ServiceRegistry;

import com.objectif.onu.insarag_webapp.model.Alerte;
import com.objectif.onu.insarag_webapp.model.Arepondu;
import com.objectif.onu.insarag_webapp.model.Grade;
import com.objectif.onu.insarag_webapp.model.Infomission;
import com.objectif.onu.insarag_webapp.model.Liensutiles;
import com.objectif.onu.insarag_webapp.model.Mission;
import com.objectif.onu.insarag_webapp.model.Pays;
import com.objectif.onu.insarag_webapp.model.Postes;
import com.objectif.onu.insarag_webapp.model.Roles;
import com.objectif.onu.insarag_webapp.model.Users;
import com.objectif.onu.insarag_webapp.model.Ville;

/**
 * Home object for domain model class Ville.
 * @see dao.Ville
 * @author Hibernate Tools
 */
public class VilleHome {

	private static final Log log = LogFactory.getLog(VilleHome.class);

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
					.buildSessionFactory(registry);
			return s;
//			return (SessionFactory) new InitialContext().lookup("SessionFactory");
		} catch (Exception e) {
			log.error("Could not locate SessionFactory in JNDI", e);
			throw new IllegalStateException("Could not locate SessionFactory in JNDI");
		}
	}

	public void persist(Ville transientInstance) {
		log.debug("persisting Ville instance");
		try {
			sessionFactory.getCurrentSession().persist(transientInstance);
			log.debug("persist successful");
		} catch (RuntimeException re) {
			log.error("persist failed", re);
			throw re;
		}
	}

	public void attachDirty(Ville instance) {
		log.debug("attaching dirty Ville instance");
		try {
			sessionFactory.getCurrentSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Ville instance) {
		log.debug("attaching clean Ville instance");
		try {
			sessionFactory.getCurrentSession().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void delete(Ville persistentInstance) {
		log.debug("deleting Ville instance");
		try {
			sessionFactory.getCurrentSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Ville merge(Ville detachedInstance) {
		log.debug("merging Ville instance");
		try {
			Ville result = (Ville) sessionFactory.getCurrentSession().merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public Ville findById(int id) {
		log.debug("getting Ville instance with id: " + id);
		try {
			Ville instance = (Ville) sessionFactory.getCurrentSession().get("dao.Ville", id);
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

	public List<Ville> findByExample(Ville instance) {
		log.debug("finding Ville instance by example");
		try {
			List<Ville> results = (List<Ville>) sessionFactory.getCurrentSession().createCriteria("dao.Ville")
					.add(create(instance)).list();
			log.debug("find by example successful, result size: " + results.size());
			return results;
		} catch (RuntimeException re) {
			log.error("find by example failed", re);
			throw re;
		}
	}
	
	public boolean insertIfNotExists(Ville instance) {
		try {
			sessionFactory.openSession();
			log.info("session opened !");
		} catch (Exception e) {
			log.error(e.getMessage());
		}

		try {

			Transaction tx;
			if (sessionFactory.getCurrentSession().getTransaction().isActive() == false) {
				tx = sessionFactory.getCurrentSession().beginTransaction();
			} else {
				tx = sessionFactory.getCurrentSession().getTransaction();
			}
			Query query = sessionFactory.getCurrentSession().createQuery("FROM Ville v where v.nomville = UPPER(:nom_ville)");
			query = query.setParameter("nom_ville", "'"+instance.getNomville()+"'");
			List results = query.list();
			if (results.size() == 0) 
			{
				sessionFactory.getCurrentSession().persist(instance);
				try {
					tx.commit();
				} catch (ConstraintViolationException cve) {
					log.info("ville existe déjà", cve);
				}
			}
		} catch (RuntimeException re) {
			log.error("insert failed", re);
			throw re;
		}
		return false;
	}
}
