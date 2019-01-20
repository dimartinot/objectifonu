package com.objectif.onu.insarag_webapp.controller.administration;

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
	
}
