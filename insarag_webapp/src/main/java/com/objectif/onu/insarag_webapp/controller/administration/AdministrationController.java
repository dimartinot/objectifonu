package com.objectif.onu.insarag_webapp.controller.administration;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

 


 
 
@Controller 
public class AdministrationController {

	@RequestMapping("/admin")
	public String admin() throws Exception {
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