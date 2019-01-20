package com.objectif.onu.insarag_webapp.service;

import java.util.HashSet;
import java.util.Set;

import org.springframework.stereotype.Service;

import com.objectif.onu.insarag_webapp.dao.GradeHome;
import com.objectif.onu.insarag_webapp.dao.RolesHome;
import com.objectif.onu.insarag_webapp.dao.UsersHome;
import com.objectif.onu.insarag_webapp.model.Roles;
import com.objectif.onu.insarag_webapp.model.Users;

@Service
public class RetrieveUserFromDB {

	public Users getUserFromDatabase(String username) {
		RolesHome rh = new RolesHome();
		UsersHome uh = new UsersHome();
		GradeHome gh = new GradeHome();
		Users usr = uh.findByUsername(username);
		Roles r = rh.findByUserId(usr.getIdusers());
		Set<Roles> s = new HashSet<Roles>();
		s.add(r);
		usr.setRoleses(s);
		return usr;
	}
}
