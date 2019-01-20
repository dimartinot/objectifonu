package com.objectif.onu.insarag_webapp.model;
// Generated 20-Jan-2019 19:43:36 by Hibernate Tools 5.0.6.Final

/**
 * Roles generated by hbm2java
 */
public class Roles implements java.io.Serializable {

	private Integer id;
	private Users users;
	private String titre;

	public Roles() {
	}

	public Roles(Users users) {
		this.users = users;
	}

	public Roles(Users users, String titre) {
		this.users = users;
		this.titre = titre;
	}

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Users getUsers() {
		return this.users;
	}

	public void setUsers(Users users) {
		this.users = users;
	}

	public String getTitre() {
		return this.titre;
	}

	public void setTitre(String titre) {
		this.titre = titre;
	}

}
