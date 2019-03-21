package com.objectif.onu.insarag_webapp.dao;
// Generated 13-Jan-2019 15:01:39 by Hibernate Tools 5.0.6.Final

import static org.hibernate.criterion.Example.create;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.Hibernate;
import org.hibernate.LockMode;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
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
 * Home object for domain model class Users.
 * @see dao.Users
 * @author Hibernate Tools
 */
public class UsersHome {
	
	   // JDBC driver name and database URL
	   static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
	   static final String DB_URL = "jdbc:mysql://localhost:3306/insarag";

	   //  Database credentials
	   static final String USER = "root";
	   static final String PASS = "root";

	private static final Log log = LogFactory.getLog(UsersHome.class);

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

	public void persist(Users transientInstance) {
		log.debug("persisting Users instance");
		try {
			sessionFactory.getCurrentSession().persist(transientInstance);
			log.debug("persist successful");
		} catch (RuntimeException re) {
			log.error("persist failed", re);
			throw re;
		}
	}

	public void attachDirty(Users instance) {
		log.debug("attaching dirty Users instance");
		try {
			sessionFactory.getCurrentSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Users instance) {
		log.debug("attaching clean Users instance");
		try {
			sessionFactory.getCurrentSession().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void deleteById(int id) {
		
		log.debug("deleting Users instance");
		try {
			Transaction tx;
			if (sessionFactory.getCurrentSession().getTransaction().isActive() == false) {
				tx = sessionFactory.getCurrentSession().beginTransaction();
			} else {
				tx = sessionFactory.getCurrentSession().getTransaction();
			}
			Users instance = (Users) sessionFactory.getCurrentSession().createQuery("from Users u where u.idusers = '"+id+"'").getSingleResult();
			sessionFactory.getCurrentSession().delete(instance);
			tx.commit();
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Users merge(Users detachedInstance) {
		log.debug("merging Users instance");
		try {
			Users result = (Users) sessionFactory.getCurrentSession().merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}
	
	public void update(Users persistentInstance) {
		log.debug("update Users instance");
		try {
			Transaction tx;
			if (sessionFactory.getCurrentSession().getTransaction().isActive() == false) {
				tx = sessionFactory.getCurrentSession().beginTransaction();
			} else {
				tx = sessionFactory.getCurrentSession().getTransaction();
			}
			sessionFactory.getCurrentSession().update(persistentInstance);
			tx.commit();
			log.debug("update successful");
		} catch (RuntimeException re) {
			log.error("update failed", re);
			throw re;
		}
	}
	
	public void addUsers(Users persistentInstance) {
		log.debug("update Users instance");
		try {
			Transaction tx;
			if (sessionFactory.getCurrentSession().getTransaction().isActive() == false) {
				tx = sessionFactory.getCurrentSession().beginTransaction();
			} else {
				tx = sessionFactory.getCurrentSession().getTransaction();
			}
			sessionFactory.getCurrentSession().save(persistentInstance);
			tx.commit();
			log.debug("update successful");
		} catch (RuntimeException re) {
			log.error("update failed", re);
			throw re;
		}
	}

	public List<Users> findAllUsers(){
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
			}return (List<Users>) sessionFactory.getCurrentSession().createQuery("from Users").list();
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
		
	}
	
	public Users findById(int id) {
		try {
			sessionFactory.openSession();
			log.info("session opened !");
		} catch (Exception e) {
			log.error(e.getMessage());
		}
		log.debug("getting Users instance with id: " + id);
		try {
			
			Transaction tx;
			if (sessionFactory.getCurrentSession().getTransaction().isActive() == false) {
				tx = sessionFactory.getCurrentSession().beginTransaction();
			} else {
				tx = sessionFactory.getCurrentSession().getTransaction();
			}
			
			Users instance = (Users) sessionFactory.getCurrentSession().createQuery("from Users u where u.idusers = '"+id+"'").getSingleResult();
			Hibernate.initialize(instance.getArepondus());
			Hibernate.initialize(instance.getEmail());
			Hibernate.initialize(instance.getEnMission());
			Hibernate.initialize(instance.getGrade());
			Hibernate.initialize(instance.getIdusers());
			Hibernate.initialize(instance.getNom());
			Hibernate.initialize(instance.getPassword());
			Hibernate.initialize(instance.getPostes());
			Hibernate.initialize(instance.getPrenom());
			Hibernate.initialize(instance.getRoleses());
			Hibernate.initialize(instance.getTelephone());
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
	
	public Users findByUsername(String username) {
		try {
			sessionFactory.openSession();
			log.info("session opened !");
		} catch (Exception e) {
			log.error(e.getMessage());
		}
		log.debug("getting Users instance with username: " + username);
		try {

			Transaction tx;
			if (sessionFactory.getCurrentSession().getTransaction().isActive() == false) {
				tx = sessionFactory.getCurrentSession().beginTransaction();
			} else {
				tx = sessionFactory.getCurrentSession().getTransaction();
			}
			Users instance = (Users) sessionFactory.getCurrentSession().createQuery("from Users u where u.email = '"+username+"'").getSingleResult();
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

	public List<Users> findByExample(Users instance) {
		log.debug("finding Users instance by example");
		try {
			List<Users> results = (List<Users>) sessionFactory.getCurrentSession().createCriteria("dao.Users").add(create(instance)).list();
			log.debug("find by example successful, result size: " + results.size());
			return results;
		} catch (RuntimeException re) {
			log.error("find by example failed", re);
			throw re;
		}
	}
	
	public List<Users> selectAll() {
		try {
			sessionFactory.openSession();
			log.info("session opened !");
		} catch (Exception e) {
			log.error(e.getMessage());
		}

		log.debug("finding Users instance by example");
		try {
			ArrayList<Users> list = new ArrayList<Users>();
		      try {
				Connection conn = DriverManager.getConnection(DB_URL,USER,PASS);
				Statement stmt = conn.createStatement();
				ResultSet rs = stmt.executeQuery("select * from Users");
			      while(rs.next()){
			    	  Users usr = new Users();
			         //Retrieve by column name
			    	  usr.setIdusers(rs.getInt("idusers"));
			    	  usr.setPassword(rs.getString("password"));
			    	  usr.setEmail(rs.getString("email"));
			    	  usr.setEnMission(rs.getByte("enMission"));
			    	  usr.setNom(rs.getString("nom"));
			    	  usr.setPrenom(rs.getString("prenom"));
			    	  usr.setTelephone(rs.getString("telephone"));
//			         int id  = rs.getInt("id");
//			         int age = rs.getInt("age");
//			         String first = rs.getString("first");
//			         String last = rs.getString("last");
//
//			         //Display values
//			         System.out.print("ID: " + id);
//			         System.out.print(", Age: " + age);
//			         System.out.print(", First: " + first);
//			         System.out.println(", Last: " + last);
			    	  list.add(usr);
			      }
			      rs.close();
			      stmt.close();
			      conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		      
//			Transaction tx = sessionFactory.getCurrentSession().beginTransaction();
//			Query<Users> query = sessionFactory.getCurrentSession().createQuery("from Users");
//			ArrayList<Users> list = (ArrayList<Users>)query.list();
//			System.out.println(list.get(0).getNom());
//			tx.commit();
//			ArrayList<Users> res = new ArrayList<Users>();
//			if (list != null) {
//				for (Users m : list) {
//					System.out.println(m);
//				}
//			}
//			log.debug("find all successfull, result size: " + list.size());
////			for (Users u : list) {
////				res.add(u);
////			}
//			return res;
		      return list;
		} catch (RuntimeException re) {
			log.error("find by example failed", re);
			throw re;
		}
	}
}
