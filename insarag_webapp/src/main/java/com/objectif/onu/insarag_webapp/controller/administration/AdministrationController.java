package com.objectif.onu.insarag_webapp.controller.administration;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.objectif.onu.insarag_webapp.bean.ActiveUserBean;
import com.objectif.onu.insarag_webapp.model.Alerte;
import com.objectif.onu.insarag_webapp.model.Pays;
import com.objectif.onu.insarag_webapp.model.Ville; 
 
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
	
	
	
	@RequestMapping("/promute")
	public String promute(HttpServletRequest request, Model model) throws Exception {
		String id = request.getParameter("id");
		
		//On tente d'insérer le pays et on voit s'il existe
		Pays p = new Pays();
		p.setNompays(nomPays);
		ph.insertIfNotExists(p);
		
		//On tente d'insérer la ville à l'aide du pays
		Pays pFromDb = (Pays)ph.findByName(p.getNompays());
		Ville v = new Ville();
		v.setNomville(nomVille);
		v.setPays(pFromDb);
		vh.insertIfNotExists(v);
		
		Alerte a = new Alerte();
		a.setDateDebut(dateDebut);
		a.setDateFin(dateFin);
		a.setEntete(entete);
		a.setInfosSupp(detail);
		a.setPays(pFromDb.getNompays());
		a.setVille(v.getNomville());
		
		ah.insert(a);
		
		return "alert/alert";
	}
	
	
}
