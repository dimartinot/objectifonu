package com.objectif.onu.insarag_webapp.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

 


 
 
@Controller 
public class IndexController {
	

	@RequestMapping("/")
	public String index(HttpServletRequest request, Model model) throws Exception {
		HttpSession session = request.getSession();
		model.addAttribute("username", session.getAttribute("name"));
		return "accueil";
	}   
	
	
}
