package com.objectif.onu.insarag_webapp.dao;
// Generated 19-Feb-2019 14:45:55 by Hibernate Tools 5.3.0.Beta2

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import org.hibernate.criterion.Example;
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
import static com.objectif.onu.insarag_webapp.service.DBData.*;

/**
 * Home object for domain model class Liensutiles.
 * @see com.objectif.onu.insarag_webapp.dao.Liensutiles
 * @author Hibernate Tools
 */
public class LiensutilesHome {

	private static final Log log = LogFactory.getLog(LiensutilesHome.class);

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

	public void persist(Liensutiles transientInstance) {
		log.debug("persisting Liensutiles instance");
		try {
			sessionFactory.getCurrentSession().persist(transientInstance);
			log.debug("persist successful");
		} catch (RuntimeException re) {
			log.error("persist failed", re);
			throw re;
		}
	}

	public void attachDirty(Liensutiles instance) {
		log.debug("attaching dirty Liensutiles instance");
		try {
			sessionFactory.getCurrentSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Liensutiles instance) {
		log.debug("attaching clean Liensutiles instance");
		try {
			sessionFactory.getCurrentSession().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void delete(Liensutiles persistentInstance) {
		try {
			sessionFactory.openSession();
			log.info("session opened !");
		} catch (Exception e) {
			log.error(e.getMessage());
		}
		Transaction tx;
		if (sessionFactory.getCurrentSession().getTransaction().isActive() == false) {
			tx = sessionFactory.getCurrentSession().beginTransaction();
		} else {
			tx = sessionFactory.getCurrentSession().getTransaction();
		}
		try {
			sessionFactory.getCurrentSession().delete(persistentInstance);
			log.debug("delete successful");
			tx.commit();
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Liensutiles merge(Liensutiles detachedInstance) {
		log.debug("merging Liensutiles instance");
		try {
			Liensutiles result = (Liensutiles) sessionFactory.getCurrentSession().merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public Liensutiles findById(int id) {
		try {
			sessionFactory.openSession();
			log.info("session opened !");
		} catch (Exception e) {
			log.error(e.getMessage());
		}
		Transaction tx;
		if (sessionFactory.getCurrentSession().getTransaction().isActive() == false) {
			tx = sessionFactory.getCurrentSession().beginTransaction();
		} else {
			tx = sessionFactory.getCurrentSession().getTransaction();
		}
		try {
			Liensutiles instance = (Liensutiles) sessionFactory.getCurrentSession()
					.get("com.objectif.onu.insarag_webapp.model.Liensutiles", id);
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

	public List findByExample(Liensutiles instance) {
		log.debug("finding Liensutiles instance by example");
		try {
			List results = sessionFactory.getCurrentSession()
					.createCriteria("com.objectif.onu.insarag_webapp.dao.Liensutiles").add(Example.create(instance))
					.list();
			log.debug("find by example successful, result size: " + results.size());
			return results;
		} catch (RuntimeException re) {
			log.error("find by example failed", re);
			throw re;
		}
	}
	
	public List<Liensutiles> findByMission(Alerte a) {
		try {
			ArrayList<Liensutiles> list = new ArrayList<Liensutiles>();
			try {
				Connection conn = DriverManager.getConnection(DB_URL,USER,PASS);
				Statement stmt = conn.createStatement();
				ResultSet rs = stmt.executeQuery("select l.idliensutiles, l.intitule, l.contenu, l.date, l.isLink from Liensutiles l, Mission m where m.idalerte = "+a.getIdalerte());
			      while(rs.next()){
			    	  Liensutiles lien = new Liensutiles();
			         //Retrieve by column name
			    	  lien.setIdliensutiles(rs.getInt("l.idliensutiles"));
			    	  lien.setIntitule(rs.getString("l.intitule"));
			    	  lien.setContenu(rs.getString("l.contenu"));
			    	  lien.setDate(rs.getDate("l.date"));
			    	  lien.setIsLink(rs.getByte("l.isLink"));
			    	  list.add(lien);
			      }
			      rs.close();
			      stmt.close();
			      conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		      return list;
		} catch (RuntimeException re) {
			log.error("find by example failed", re);
			throw re;
		}
	}
	
	public boolean insert(Liensutiles instance) {
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
			sessionFactory.getCurrentSession().persist(instance);
			tx.commit();
		} catch (RuntimeException re) {
			log.error("insert failed", re);
			throw re;
		}
		return false;
	}
}
