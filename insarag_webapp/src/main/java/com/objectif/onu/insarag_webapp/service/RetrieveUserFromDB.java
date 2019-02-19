package com.objectif.onu.insarag_webapp.service;

import java.util.HashSet;
import java.util.Set;

import org.springframework.stereotype.Service;

import com.objectif.onu.insarag_webapp.dao.GradeHome;
import com.objectif.onu.insarag_webapp.dao.PostesHome;
import com.objectif.onu.insarag_webapp.dao.RolesHome;
import com.objectif.onu.insarag_webapp.dao.UsersHome;
import com.objectif.onu.insarag_webapp.model.Grade;
import com.objectif.onu.insarag_webapp.model.Postes;
import com.objectif.onu.insarag_webapp.model.Roles;
import com.objectif.onu.insarag_webapp.model.Users;

@Service
public class RetrieveUserFromDB {

	public Users getUserFromDatabase(String username) {
		RolesHome rh = new RolesHome();
		UsersHome uh = new UsersHome();
		GradeHome gh = new GradeHome();
		PostesHome ph = new PostesHome();
		Users usr = uh.findByUsername(username);
		Roles r = rh.findByUserId(usr.getIdusers());
		Grade g = gh.findById(usr.getGrade().getIdGrade());
		Postes p = ph.findById(usr.getPostes().getIdPoste());
		Set<Roles> s = new HashSet<Roles>();
		s.add(r);
		usr.setGrade(g);
		usr.setPostes(p);
		usr.setRoleses(s);
		return usr;
	}
}
