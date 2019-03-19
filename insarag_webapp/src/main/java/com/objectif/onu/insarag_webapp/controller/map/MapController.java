package com.objectif.onu.insarag_webapp.controller.map;

import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.objectif.onu.insarag_webapp.bean.ActiveUserBean;
import com.objectif.onu.insarag_webapp.dao.AlerteHome;
import com.objectif.onu.insarag_webapp.dao.InfomissionHome;
import com.objectif.onu.insarag_webapp.dao.LiensutilesHome;
import com.objectif.onu.insarag_webapp.dao.MissionHome;
import com.objectif.onu.insarag_webapp.dao.PaysHome;
import com.objectif.onu.insarag_webapp.dao.PoisHome;
import com.objectif.onu.insarag_webapp.dao.VilleHome;
import com.objectif.onu.insarag_webapp.model.Alerte;
import com.objectif.onu.insarag_webapp.model.Infomission;
import com.objectif.onu.insarag_webapp.model.Liensutiles;
import com.objectif.onu.insarag_webapp.model.Mission;
import com.objectif.onu.insarag_webapp.model.Pois;


@Controller
@RequestMapping("/map")
public class MapController {
	
	private AlerteHome ah = new AlerteHome();
	private VilleHome vh = new VilleHome();
	private InfomissionHome imh = new InfomissionHome();
	private LiensutilesHome lh = new LiensutilesHome();
	private MissionHome mh = new MissionHome();	
	private PoisHome ph = new PoisHome();
	
	@Autowired
	ActiveUserBean connectedUser;

	
	@RequestMapping("/")
	public String mapHome(HttpServletRequest request) {
		Alerte a = ah.selectLastFromUser(connectedUser.getUser());
		
		List<Pois> list = ph.findAllByAlerte(a);
		request.setAttribute("list_pois", list);
		
		return "/carte/carte";
	}
	
	@RequestMapping("/save")
	public ModelAndView mapSave(HttpServletRequest request) {
		Alerte a = ah.selectLastFromUser(connectedUser.getUser());
		Double lat = new Double(request.getParameter("lat"));
		Double lon = new Double(request.getParameter("lon"));
		String infos = request.getParameter("info");
		Pois p = new Pois();
		p.setLat(lat);
		p.setLongi(lon);
		p.setInfo(infos);
		ph.insertPois(p,a);
		return new ModelAndView("redirect:/map/");
	}
}
