package com.objectif.onu.insarag_webapp.model;
// Generated 19-Feb-2019 14:21:18 by Hibernate Tools 5.3.0.Beta2

import java.util.HashSet;
import java.util.Set;

/**
 * Mission generated by hbm2java
 */
public class Mission implements java.io.Serializable {

	private Integer idmission;
	private Alerte alerte;
	private Set liensutileses = new HashSet(0);

	public Mission() {
	}

	public Mission(Alerte alerte) {
		this.alerte = alerte;
	}

	public Mission(Alerte alerte, Set liensutileses) {
		this.alerte = alerte;
		this.liensutileses = liensutileses;
	}

	public Integer getIdmission() {
		return this.idmission;
	}

	public void setIdmission(Integer idmission) {
		this.idmission = idmission;
	}

	public Alerte getAlerte() {
		return this.alerte;
	}

	public void setAlerte(Alerte alerte) {
		this.alerte = alerte;
	}

	public Set getLiensutileses() {
		return this.liensutileses;
	}

	public void setLiensutileses(Set liensutileses) {
		this.liensutileses = liensutileses;
	}

}
