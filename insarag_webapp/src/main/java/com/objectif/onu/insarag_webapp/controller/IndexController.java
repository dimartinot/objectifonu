package com.objectif.onu.insarag_webapp.controller;

import java.util.HashSet;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.objectif.onu.insarag_webapp.bean.ActiveUserBean;
import com.objectif.onu.insarag_webapp.model.Roles;
import com.objectif.onu.insarag_webapp.model.Users;
import com.objectif.onu.insarag_webapp.service.RetrieveUserFromDB;

 


 
 
@Controller 
public class IndexController {
	
	@Autowired
	RetrieveUserFromDB rufdb;
	
	@Autowired
	ActiveUserBean connectedUser;

	@RequestMapping("/")
	public String index(HttpServletRequest request, Model model) throws Exception {
		HttpSession session = request.getSession();

		if (session.getAttribute("user") == null) {

		      Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		      Users usr = rufdb.getUserFromDatabase(auth.getName());
		      connectedUser.setUser(usr);
			session.setAttribute("user", connectedUser.getUser());
			HashSet<Roles> s = (HashSet<Roles>)usr.getRoleses();
        	boolean isAdmin = false;
        	for (Roles r : s) {
        		if (r.getTitre().toUpperCase().equals("ADMIN")) {
        			isAdmin = true;
        		}
        	}
        	session.setAttribute("isAdmin", isAdmin);
		}
		return "accueil";
	}   
	
	
}
