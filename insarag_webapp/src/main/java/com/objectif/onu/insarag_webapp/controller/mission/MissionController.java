package com.objectif.onu.insarag_webapp.controller.mission;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.objectif.onu.insarag_webapp.bean.ActiveUserBean;
import com.objectif.onu.insarag_webapp.dao.AlerteHome;
import com.objectif.onu.insarag_webapp.dao.InfomissionHome;
import com.objectif.onu.insarag_webapp.dao.PaysHome;
import com.objectif.onu.insarag_webapp.dao.VilleHome;
import com.objectif.onu.insarag_webapp.model.Alerte;
import com.objectif.onu.insarag_webapp.model.Infomission;

@Controller
@RequestMapping("/mission")
public class MissionController {

	private AlerteHome ah = new AlerteHome();
	private PaysHome ph = new PaysHome();
	private VilleHome vh = new VilleHome();
	private InfomissionHome imh = new InfomissionHome();

	@Autowired
	ActiveUserBean connectedUser;
	
	@RequestMapping("/")
	public String maMission(HttpServletRequest request) {
		Alerte a = ah.selectLastFromUser(connectedUser.getUser());
		List<Infomission> list = imh.findAllByAlerte(a);
		request.setAttribute("list_infomission", list);
		request.setAttribute("alerte",a);
		return "/mission/maMission";
	}
	
	@RequestMapping("/ajout_info")
	public ModelAndView ajoutInfo(HttpServletRequest request) {
		Alerte a = ah.selectLastFromUser(connectedUser.getUser());
		String contenu = request.getParameter("info-textarea");
		imh.insertInfoMission(contenu,a);
		return new ModelAndView("redirect:/mission/");
	}
	
	
}
