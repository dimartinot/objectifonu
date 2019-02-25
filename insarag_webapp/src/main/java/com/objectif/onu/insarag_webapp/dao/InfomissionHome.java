package com.objectif.onu.insarag_webapp.dao;
// Generated 10-Feb-2019 17:07:34 by Hibernate Tools 5.3.0.Beta2

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
import org.apache.commons.text.StringEscapeUtils;
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
 * Home object for domain model class Infomission.
 * @see com.objectif.onu.insarag_webapp.dao.Infomission
 * @author Hibernate Tools
 */
public class InfomissionHome {
	


	private static final Log log = LogFactory.getLog(InfomissionHome.class);

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

	public void persist(Infomission transientInstance) {
		log.debug("persisting Infomission instance");
		try {
			sessionFactory.getCurrentSession().persist(transientInstance);
			log.debug("persist successful");
		} catch (RuntimeException re) {
			log.error("persist failed", re);
			throw re;
		}
	}

	public void attachDirty(Infomission instance) {
		log.debug("attaching dirty Infomission instance");
		try {
			sessionFactory.getCurrentSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Infomission instance) {
		log.debug("attaching clean Infomission instance");
		try {
			sessionFactory.getCurrentSession().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void delete(Infomission persistentInstance) {
		try {
			sessionFactory.openSession();
			log.info("session opened !");
		} catch (Exception e) {
			log.error(e.getMessage());
		}
		log.debug("deleting Infomission instance");
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

	public Infomission merge(Infomission detachedInstance) {
		log.debug("merging Infomission instance");
		try {
			Infomission result = (Infomission) sessionFactory.getCurrentSession().merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public Infomission findById(int id) {
		try {
			sessionFactory.openSession();
			log.info("session opened !");
		} catch (Exception e) {
			log.error(e.getMessage());
		}
		log.debug("getting Infomission instance with id: " + id);
		Transaction tx;
		if (sessionFactory.getCurrentSession().getTransaction().isActive() == false) {
			tx = sessionFactory.getCurrentSession().beginTransaction();
		} else {
			tx = sessionFactory.getCurrentSession().getTransaction();
		}
		try {
			Infomission instance = (Infomission) sessionFactory.getCurrentSession()
					.get("com.objectif.onu.insarag_webapp.model.Infomission", id);
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

	public List findByExample(Infomission instance) {
		log.debug("finding Infomission instance by example");
		try {
			List results = sessionFactory.getCurrentSession()
					.createCriteria("com.objectif.onu.insarag_webapp.model.Infomission").add(Example.create(instance))
					.list();
			log.debug("find by example successful, result size: " + results.size());
			return results;
		} catch (RuntimeException re) {
			log.error("find by example failed", re);
			throw re;
		}
	}
	
	public List<Infomission> findAllByAlerte(Alerte instance) {
		try {
			sessionFactory.openSession();
			log.info("session opened !");
		} catch (Exception e) {
			log.error(e.getMessage());
		}

		log.debug("finding Users instance by example");
		try {
			ArrayList<Infomission> list = new ArrayList<Infomission>();
		      try {
				Connection conn = DriverManager.getConnection(DB_URL,USER,PASS);
				Statement stmt = conn.createStatement();
				ResultSet rs = stmt.executeQuery("select i.idinfoMission, i.idMission, i.detailMission from Infomission i, Mission m where m.idalerte = "+instance.getIdalerte());
			      while(rs.next()){
			    	  Infomission info = new Infomission();
			         //Retrieve by column name
			    	  info.setIdinfoMission(rs.getInt("i.idinfoMission"));
			    	  info.setDetailMission(rs.getString("i.detailMission"));
			    	  info.setIdMission(rs.getInt("i.idMission"));
			    	  list.add(info);
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
	
	public void insertInfoMission(String contenu, Alerte toInsertInto) {
		try {
			sessionFactory.openSession();
			log.info("session opened !");
		} catch (Exception e) {
			log.error(e.getMessage());
		}

		try {
			ArrayList<Infomission> list = new ArrayList<Infomission>();
		      try {
				Connection conn = DriverManager.getConnection(DB_URL,USER,PASS);
				String query = "insert into Infomission(idMission, detailMission) VALUES ("
						+ "(SELECT idMission FROM Mission WHERE idalerte = "+toInsertInto.getIdalerte()+"),"
						+ "?)";
				PreparedStatement stmt = conn.prepareStatement(query);
				stmt.setString(1, contenu);
				stmt.execute();
			      stmt.close();
			      conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} catch (RuntimeException re) {
			log.error("find by example failed", re);
			throw re;
		}
	}
}
