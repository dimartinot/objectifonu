package com.objectif.onu.insarag_webapp.controller.alert;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.objectif.onu.insarag_webapp.bean.ActiveUserBean;
import com.objectif.onu.insarag_webapp.dao.AlerteHome;
import com.objectif.onu.insarag_webapp.dao.PaysHome;
import com.objectif.onu.insarag_webapp.dao.UsersHome;
import com.objectif.onu.insarag_webapp.dao.VilleHome;
import com.objectif.onu.insarag_webapp.model.Alerte;
import com.objectif.onu.insarag_webapp.model.Pays;
import com.objectif.onu.insarag_webapp.model.Users;
import com.objectif.onu.insarag_webapp.model.Ville;

@Controller
@RequestMapping("/alert")
public class AlertController {
	

	private AlerteHome ah = new AlerteHome();
	private PaysHome ph = new PaysHome();
	private VilleHome vh = new VilleHome();
	private UsersHome uh = new UsersHome();
	
	@Autowired
	ActiveUserBean connectedUser;
	
	@RequestMapping("/last_alert")
	public String alert_popup(HttpServletRequest request) throws Exception {
		Alerte a = ah.selectLastFromUser(connectedUser.getUser());
		if (a != null) {
			request.setAttribute("no_alert", false);
			request.setAttribute("alerte", a);
			List<Users> u = uh.selectAllFromAlerte(a.getIdalerte());
			request.setAttribute("users", u);
		} else {
			request.setAttribute("no_alert", true);
		}
		
		return "/alert/last_alert";
	} 
	
	@RequestMapping("/alert_editor")
	public String alert_editor() throws Exception {
		return "/alert/alert_editor";
	} 
	
	@RequestMapping("/create_alert")
	public String create_alert(HttpServletRequest request, Model model) throws Exception {
		String entete = request.getParameter("entete");
		String strDateDebut = request.getParameter("dateDebut");
		String strDateFin = request.getParameter("dateFin");
		String detail = request.getParameter("txtMsg");
		String nomPays = request.getParameter("pays");
		String nomVille = request.getParameter("ville");

		Date dateDebut = new SimpleDateFormat("yyyy-MM-dd").parse(strDateDebut);
		Date dateFin = new SimpleDateFormat("yyyy-MM-dd").parse(strDateFin);
				
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
	
	@RequestMapping("/to_respond")
	public String to_respond(HttpServletRequest request) throws Exception {
		List<Alerte> list = ah.selectAllFromFuture(connectedUser.getUser());
		request.setAttribute("list_of_alerts", list);
		return "/alert/to_respond";
	}
	
	@RequestMapping("/subscribe_to_alert")
	public String alert_reponse(HttpServletRequest request) throws Exception {
		int id = Integer.valueOf(request.getParameter("id"));
		ah.subscribeToAlert(connectedUser.getUser(),id);
		return "/alert/alert";
	}
	
	@RequestMapping("/")
	public String alert_index() throws Exception {
		return "/alert/alert";
	}
	
	
}
