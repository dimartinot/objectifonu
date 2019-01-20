package com.objectif.onu.insarag_webapp.model;
// Generated 20-Jan-2019 19:43:36 by Hibernate Tools 5.0.6.Final

import java.util.HashSet;
import java.util.Set;

/**
 * Users generated by hbm2java
 */
public class Users implements java.io.Serializable {

	private Integer idusers;
	private Grade grade;
	private Postes postes;
	private String email;
	private String password;
	private String telephone;
	private Byte enMission;
	private String nom;
	private String prenom;
	private Set<Alerte> alertes = new HashSet<Alerte>(0);
	private Set<Roles> roleses = new HashSet<Roles>(0);

	public Users() {
	}

	public Users(Grade grade, Postes postes, String email, String password, String nom, String prenom) {
		this.grade = grade;
		this.postes = postes;
		this.email = email;
		this.password = password;
		this.nom = nom;
		this.prenom = prenom;
	}

	public Users(Grade grade, Postes postes, String email, String password, String telephone, Byte enMission,
			String nom, String prenom, Set<Alerte> alertes, Set<Roles> roleses) {
		this.grade = grade;
		this.postes = postes;
		this.email = email;
		this.password = password;
		this.telephone = telephone;
		this.enMission = enMission;
		this.nom = nom;
		this.prenom = prenom;
		this.alertes = alertes;
		this.roleses = roleses;
	}

	public Integer getIdusers() {
		return this.idusers;
	}

	public void setIdusers(Integer idusers) {
		this.idusers = idusers;
	}

	public Grade getGrade() {
		return this.grade;
	}

	public void setGrade(Grade grade) {
		this.grade = grade;
	}

	public Postes getPostes() {
		return this.postes;
	}

	public void setPostes(Postes postes) {
		this.postes = postes;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getTelephone() {
		return this.telephone;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}

	public Byte getEnMission() {
		return this.enMission;
	}

	public void setEnMission(Byte enMission) {
		this.enMission = enMission;
	}

	public String getNom() {
		return this.nom;
	}

	public void setNom(String nom) {
		this.nom = nom;
	}

	public String getPrenom() {
		return this.prenom;
	}

	public void setPrenom(String prenom) {
		this.prenom = prenom;
	}

	public Set<Alerte> getAlertes() {
		return this.alertes;
	}

	public void setAlertes(Set<Alerte> alertes) {
		this.alertes = alertes;
	}

	public Set<Roles> getRoleses() {
		return this.roleses;
	}

	public void setRoleses(Set<Roles> roleses) {
		this.roleses = roleses;
	}

}
