package com.objectif.onu.insarag_webapp.controller.mission;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.objectif.onu.insarag_webapp.bean.ActiveUserBean;
import com.objectif.onu.insarag_webapp.dao.AlerteHome;
import com.objectif.onu.insarag_webapp.dao.PaysHome;
import com.objectif.onu.insarag_webapp.dao.VilleHome;
import com.objectif.onu.insarag_webapp.model.Alerte;

@Controller
@RequestMapping("/mission")
public class MissionController {

	private AlerteHome ah = new AlerteHome();
	private PaysHome ph = new PaysHome();
	private VilleHome vh = new VilleHome();

	@Autowired
	ActiveUserBean connectedUser;
	
	@RequestMapping("/")
	public String maMission(HttpServletRequest request) {
		Alerte a = ah.selectLastFromUser(connectedUser.getUser());
		request.setAttribute("alerte",a);
		return "/mission/maMission";
	}
	
}
