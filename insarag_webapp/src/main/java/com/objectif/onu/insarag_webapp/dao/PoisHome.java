package com.objectif.onu.insarag_webapp.dao;
// Generated 19-Mar-2019 16:06:19 by Hibernate Tools 5.3.0.Beta2

import static com.objectif.onu.insarag_webapp.service.DBData.DB_URL;
import static com.objectif.onu.insarag_webapp.service.DBData.PASS;
import static com.objectif.onu.insarag_webapp.service.DBData.USER;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import javax.naming.InitialContext;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.hibernate.SessionFactory;
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
import com.objectif.onu.insarag_webapp.model.Pois;
import com.objectif.onu.insarag_webapp.model.Postes;
import com.objectif.onu.insarag_webapp.model.Roles;
import com.objectif.onu.insarag_webapp.model.Users;
import com.objectif.onu.insarag_webapp.model.Ville;

/**
 * Home object for domain model class Pois.
 * @see com.objectif.onu.insarag_webapp.dao.Pois
 * @author Hibernate Tools
 */
public class PoisHome {

	private static final Log log = LogFactory.getLog(PoisHome.class);

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

	public void persist(Pois transientInstance) {
		log.debug("persisting Pois instance");
		try {
			sessionFactory.getCurrentSession().persist(transientInstance);
			log.debug("persist successful");
		} catch (RuntimeException re) {
			log.error("persist failed", re);
			throw re;
		}
	}

	public void attachDirty(Pois instance) {
		log.debug("attaching dirty Pois instance");
		try {
			sessionFactory.getCurrentSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Pois instance) {
		log.debug("attaching clean Pois instance");
		try {
			sessionFactory.getCurrentSession().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void delete(Pois persistentInstance) {
		log.debug("deleting Pois instance");
		try {
			sessionFactory.getCurrentSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Pois merge(Pois detachedInstance) {
		log.debug("merging Pois instance");
		try {
			Pois result = (Pois) sessionFactory.getCurrentSession().merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public Pois findById(java.lang.Integer id) {
		log.debug("getting Pois instance with id: " + id);
		try {
			Pois instance = (Pois) sessionFactory.getCurrentSession().get("com.objectif.onu.insarag_webapp.dao.Pois",
					id);
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
	
	public List<Pois> findAllByAlerte(Alerte instance) {
		try {
			sessionFactory.openSession();
			log.info("session opened !");
		} catch (Exception e) {
			log.error(e.getMessage());
		}

		try {
			ArrayList<Pois> list = new ArrayList<Pois>();
		      try {
				Connection conn = DriverManager.getConnection(DB_URL,USER,PASS);
				Statement stmt = conn.createStatement();
				ResultSet rs = stmt.executeQuery("select p.idpois, p.lat, p.longi, p.info, p.idMission from Pois p, Mission m where m.idalerte = "+instance.getIdalerte()+" and p.idMission = m.idmission");
			      while(rs.next()){
			    	 Pois pois = new Pois();
			         //Retrieve by column name
			    	 	pois.setIdMission(rs.getInt("p.idMission"));
			    	 	pois.setIdpois(rs.getInt("p.idpois"));
			    	 	pois.setInfo(rs.getString("p.info"));
			    	 	pois.setLat(rs.getDouble("p.lat"));
			    	 	pois.setLongi(rs.getDouble("p.longi"));
			    	  list.add(pois);
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
	
	public void insertPois(Pois toBeInserted, Alerte toInsertInto) {
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
				String query = "insert into pois(idMission, lat, longi, info) VALUES ("
						+ "(SELECT idMission FROM Mission WHERE idalerte = "+toInsertInto.getIdalerte()+"),"
						+ "?,?,?)";
				PreparedStatement stmt = conn.prepareStatement(query);
				stmt.setDouble(1, toBeInserted.getLat());
				stmt.setDouble(2, toBeInserted.getLongi());
				stmt.setString(3, toBeInserted.getInfo());
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

	public List findByExample(Pois instance) {
		log.debug("finding Pois instance by example");
		try {
			List results = sessionFactory.getCurrentSession().createCriteria("com.objectif.onu.insarag_webapp.dao.Pois")
					.add(Example.create(instance)).list();
			log.debug("find by example successful, result size: " + results.size());
			return results;
		} catch (RuntimeException re) {
			log.error("find by example failed", re);
			throw re;
		}
	}
}
