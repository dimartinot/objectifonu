package com.objectif.onu.insarag_webapp.dao;
// Generated 20-Jan-2019 19:48:17 by Hibernate Tools 5.0.6.Final

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
import com.objectif.onu.insarag_webapp.model.AreponduId;
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
 * Home object for domain model class Alerte.
 * @see dao.Alerte
 * @author Hibernate Tools
 */
public class AlerteHome {

	private static final Log log = LogFactory.getLog(AlerteHome.class);

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

	public void persist(Alerte transientInstance) {
		log.debug("persisting Alerte instance");
		try {
			sessionFactory.getCurrentSession().persist(transientInstance);
			log.debug("persist successful");
		} catch (RuntimeException re) {
			log.error("persist failed", re);
			throw re;
		}
	}

	public void attachDirty(Alerte instance) {
		log.debug("attaching dirty Alerte instance");
		try {
			sessionFactory.getCurrentSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(Alerte instance) {
		log.debug("attaching clean Alerte instance");
		try {
			sessionFactory.getCurrentSession().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void delete(Alerte persistentInstance) {
		log.debug("deleting Alerte instance");
		try {
			sessionFactory.getCurrentSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public Alerte merge(Alerte detachedInstance) {
		log.debug("merging Alerte instance");
		try {
			Alerte result = (Alerte) sessionFactory.getCurrentSession().merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public Alerte findById(int id) {
		log.debug("getting Alerte instance with id: " + id);
		try {
			Alerte instance = (Alerte) sessionFactory.getCurrentSession().get("dao.Alerte", id);
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

	public List<Alerte> findByExample(Alerte instance) {
		log.debug("finding Alerte instance by example");
		try {
			List<Alerte> results = (List<Alerte>) sessionFactory.getCurrentSession().createCriteria("dao.Alerte")
					.add(create(instance)).list();
			log.debug("find by example successful, result size: " + results.size());
			return results;
		} catch (RuntimeException re) {
			log.error("find by example failed", re);
			throw re;
		}
	}
	
	public boolean insert(Alerte instance) {
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
	
	public Alerte selectLastFromUser(Users instance) {
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
			//On recupere l'alerte la plus récente de l'utilisateur instance
			Query q = sessionFactory.getCurrentSession().createQuery(
					"FROM Alerte alerte "
					+ "JOIN alerte.arepondus ar "
					+ "WHERE ar.id.idUser = "+instance.getIdusers()+" "
							+ "AND ar.id.idAlerte = alerte.idalerte");
			//("+ "SELECT idAlerte FROM arepondu WHERE idUser = "+instance.getIdusers()+")
			List<Object[]> results = (List<Object[]>) q.list();
			if (results.size() != 0 && results.get(0) != null) {
				if (results.get(0).length == 0) {
					return null;
				} else {
					return (Alerte)results.get(0)[0];
				}
			}
		} catch (RuntimeException re) {
			log.error("insert failed", re);
			throw re;
		}
		return null;
	}
	
	public List<Alerte> selectAllFromFuture(Users usr) {
		try {
			sessionFactory.openSession();
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
			//On recupere l'alerte la plus récente de l'utilisateur instance
			Query q = sessionFactory.getCurrentSession().createQuery(
					"FROM Alerte alert "
							+ "WHERE alert.dateFin > NOW()"
					);
			List<Alerte> list = (List<Alerte>)q.list();
			List<Alerte> listBis = (List<Alerte>)q.list();
			for (Alerte a : list) {
//				if (a.getUserses().contains(usr)) {
//					listBis.remove(usr);
//				}
				//On vérifie que l'utilisateur ne s'est pas déjà inscrit dans une de ces alertes
//				log.info(a.getEntete());
//				for (Users u : a.getUserses()) {
//					if (u.getIdusers() == usr.getIdusers()) {
//						listBis.remove(a);
//						break;
//					}
//				}
			}
			return listBis;
		} catch (RuntimeException re) {
			log.error("Runtime exception au selectAll d'Alerte !");
		}
		return null;
	}
	
	public boolean subscribeToAlert(Users usr, int idAlert) {
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
			//On recupere l'alerte la plus récente de l'utilisateur instance
			Query q = sessionFactory.getCurrentSession().createQuery("FROM Alerte alert WHERE alert.id = "+idAlert);
			Alerte a = (Alerte)q.getSingleResult();
			Arepondu ar = new Arepondu();
			ar.setId(new AreponduId(a.getIdalerte(),usr.getIdusers()));
			ar.setUsers(usr);
			ar.setAlerte(a);
			a.getArepondus().add(ar);
			//			usr.getAlertes().add(a);
			sessionFactory.getCurrentSession().saveOrUpdate(a);
//			sessionFactory.getCurrentSession().saveOrUpdate(usr);
			tx.commit();
			return true;
		} catch (RuntimeException re) {
			log.error("Runtime exception au selectAll d'Alerte !");
			throw re;
		}
	
	}
}
