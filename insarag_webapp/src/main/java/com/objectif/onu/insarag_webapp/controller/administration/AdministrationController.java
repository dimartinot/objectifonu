package com.objectif.onu.insarag_webapp.controller.administration;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.objectif.onu.insarag_webapp.bean.ActiveUserBean;

 
@Controller
public class AdministrationController {
	
	@Autowired
	ActiveUserBean connectedUser;

	@RequestMapping("/profil")
	public String admin(Model model) throws Exception {
		model.addAttribute("connectedUser", connectedUser);
		return "/administration/administration";
	} 
	
	@RequestMapping("/consult")
	public String consult() throws Exception {
		return "/administration/consult";
	}
	
	@RequestMapping("/consulusers")
	public String consulusers() throws Exception {
		return "/administration/users";
	}
	
	@RequestMapping("/lien")
	public String lien() throws Exception {
		return "/administration/lien";
	}
	@RequestMapping("/consulprofil")
	public String consulProfil() throws Exception {
		return "/administration/profils";
	}
	
	@RequestMapping("/modifprofil")
	public String modifierProfil() throws Exception {
		return "/administration/params";
	}
	
	
	
	@RequestMapping("/promute")
	public String promute(HttpServletRequest request, Model model) throws Exception {
		String id = request.getParameter("id");		
		return "alert/alert";
	}
	
	
}
