package com.objectif.onu.insarag_webapp.model;
// Generated 19-Feb-2019 14:21:18 by Hibernate Tools 5.3.0.Beta2

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * Alerte generated by hbm2java
 */
public class Alerte implements java.io.Serializable {

	private Integer idalerte;
	private String entete;
	private Date dateDebut;
	private Date dateFin;
	private String infosSupp;
	private String pays;
	private String ville;
	private Set missions = new HashSet(0);
	private Set arepondus = new HashSet(0);

	public Alerte() {
	}

	public Alerte(String entete, Date dateDebut, Date dateFin, String infosSupp, String pays, String ville,
			Set missions, Set arepondus) {
		this.entete = entete;
		this.dateDebut = dateDebut;
		this.dateFin = dateFin;
		this.infosSupp = infosSupp;
		this.pays = pays;
		this.ville = ville;
		this.missions = missions;
		this.arepondus = arepondus;
	}

	public Integer getIdalerte() {
		return this.idalerte;
	}

	public void setIdalerte(Integer idalerte) {
		this.idalerte = idalerte;
	}

	public String getEntete() {
		return this.entete;
	}

	public void setEntete(String entete) {
		this.entete = entete;
	}

	public Date getDateDebut() {
		return this.dateDebut;
	}

	public void setDateDebut(Date dateDebut) {
		this.dateDebut = dateDebut;
	}

	public Date getDateFin() {
		return this.dateFin;
	}

	public void setDateFin(Date dateFin) {
		this.dateFin = dateFin;
	}

	public String getInfosSupp() {
		return this.infosSupp;
	}

	public void setInfosSupp(String infosSupp) {
		this.infosSupp = infosSupp;
	}

	public String getPays() {
		return this.pays;
	}

	public void setPays(String pays) {
		this.pays = pays;
	}

	public String getVille() {
		return this.ville;
	}

	public void setVille(String ville) {
		this.ville = ville;
	}

	public Set getMissions() {
		return this.missions;
	}

	public void setMissions(Set missions) {
		this.missions = missions;
	}

	public Set getArepondus() {
		return this.arepondus;
	}

	public void setArepondus(Set arepondus) {
		this.arepondus = arepondus;
	}

}
