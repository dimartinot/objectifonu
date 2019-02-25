package com.objectif.onu.insarag_webapp.controller.mission;

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
import com.objectif.onu.insarag_webapp.dao.VilleHome;
import com.objectif.onu.insarag_webapp.model.Alerte;
import com.objectif.onu.insarag_webapp.model.Infomission;
import com.objectif.onu.insarag_webapp.model.Liensutiles;
import com.objectif.onu.insarag_webapp.model.Mission;

@Controller
@RequestMapping("/mission")
public class MissionController {

	private AlerteHome ah = new AlerteHome();
	private PaysHome ph = new PaysHome();
	private VilleHome vh = new VilleHome();
	private InfomissionHome imh = new InfomissionHome();
	private LiensutilesHome lh = new LiensutilesHome();
	private MissionHome mh = new MissionHome();
	
	@Autowired
	ActiveUserBean connectedUser;
	
	@RequestMapping("/")
	public String maMission(HttpServletRequest request) {
		Alerte a = ah.selectLastFromUser(connectedUser.getUser());
		if (request.getParameter("intitule") != null && request.getParameter("contenu") != null && request.getParameter("isLink") != null) {
			Liensutiles lu = new Liensutiles();
			Mission m = mh.findByAlerte(a);
			lu.setContenu(request.getParameter("contenu"));
			lu.setIntitule(request.getParameter("intitule"));
			java.sql.Date sqlDate = new java.sql.Date(Calendar.getInstance().getTimeInMillis());
			lu.setDate(sqlDate);
			lu.setMission(m);
			if (request.getParameter("isLink").equals("on")) {
				lu.setIsLink(new Byte((byte)1));
			} else {
				lu.setIsLink(new Byte((byte) 0));
			}
			lh.insert(lu);
		}
		List<Infomission> list = imh.findAllByAlerte(a);
		List<Liensutiles> listLiens = lh.findByMission(a);
		request.setAttribute("list_infomission", list);
		request.setAttribute("list_liens", listLiens);
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
	
	@RequestMapping("/translator")
	public String translator(HttpServletRequest request) {
		return "/mission/iframe_translator";
	}
	
	@RequestMapping("/delete_infomission")
	public ModelAndView deleteInfoMission(HttpServletRequest request) {
		if (request.getParameter("id") != null) {
			int id = Integer.parseInt(request.getParameter("id"));
			imh.delete(imh.findById(id));
		}
		return new ModelAndView("redirect:/mission/");
	}
	
	@RequestMapping("/delete_usefullink")
	public ModelAndView deleteUsefulLink(HttpServletRequest request) {
		if (request.getParameter("id") != null) {
			int id = Integer.parseInt(request.getParameter("id"));
			lh.delete(lh.findById(id));
		}
		return new ModelAndView("redirect:/mission/");
	}
}
