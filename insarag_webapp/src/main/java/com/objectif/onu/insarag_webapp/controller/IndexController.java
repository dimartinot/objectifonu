package com.objectif.onu.insarag_webapp.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.objectif.onu.insarag_webapp.bean.ActiveUserBean;
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
		      connectedUser.setUser(rufdb.getUserFromDatabase(auth.getName()));
			session.setAttribute("user", connectedUser.getUser());
		}
		return "accueil";
	}   
	
	
}
