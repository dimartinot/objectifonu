package com.objectif.onu.insarag_webapp.controller.administration;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.objectif.onu.insarag_webapp.bean.ActiveUserBean;
import com.objectif.onu.insarag_webapp.dao.GradeHome;
import com.objectif.onu.insarag_webapp.dao.PostesHome;
import com.objectif.onu.insarag_webapp.dao.RolesHome;
import com.objectif.onu.insarag_webapp.dao.UsersHome;
import com.objectif.onu.insarag_webapp.model.Grade;
import com.objectif.onu.insarag_webapp.model.Postes;
import com.objectif.onu.insarag_webapp.model.Roles;
import com.objectif.onu.insarag_webapp.model.Users;

 
@Controller
public class AdministrationController {
	
	private UsersHome uh = new UsersHome();
	private RolesHome rh = new RolesHome();
	private GradeHome gh = new GradeHome();
	private PostesHome ph = new PostesHome();
	@Autowired 
	private HttpSession httpsession;

    @RequestMapping("/saveusers")
    public String saveusers(HttpServletRequest request) {
    	
    	Users persistantuser = uh.findById(Integer.parseInt(request.getParameter("input-id")));
    	persistantuser.setNom(request.getParameter("input-nom"));
    	persistantuser.setPrenom(request.getParameter("input-prenom"));
    	persistantuser.setEmail(request.getParameter("input-email"));
    	persistantuser.setTelephone(request.getParameter("input-tel"));
    	Grade gr = gh.findById(Integer.parseInt(request.getParameter("input-id")));	
    	persistantuser.setGrade(gr);
    	Postes pst = ph.findById(Integer.parseInt(request.getParameter("input-id")));	
    	persistantuser.setPostes(pst);
    	uh.update(persistantuser);
    	request.getSession().setAttribute("user",persistantuser);
        return "/administration/profils";
    }
    
	@RequestMapping("/saveprofil")
	public String saveprofil() throws Exception {
		
		return "/administration/profils";
	} 
	@RequestMapping("/profil")
	public String admin() throws Exception {
		return "/administration/administration";
	} 
	
	@RequestMapping("/consult")
	public String consult() throws Exception {
		return "/administration/consult";
	}
	
	@RequestMapping("/consulusers")
	public String consulusers(HttpServletRequest request) throws Exception {
		List<Users> listUsers = uh.findAllUsers();
		request.setAttribute("list_of_users",listUsers);
		return "/administration/users";
	}
	
	@RequestMapping("/formuser")
	public String formusers(HttpServletRequest request) throws Exception {
		List<Postes> listPostes = ph.findAllPostes();
		request.setAttribute("list_of_postes",listPostes);
		
		List<Grade> listGrade = gh.findAllGrades();
		request.setAttribute("list_of_grades",listGrade);
		return "/administration/creeruser";
	}
	
	@RequestMapping("/creeruser")
	public String creerusers(HttpServletRequest request) throws Exception {
		
		Users persistantuser = new Users();
	
    	persistantuser.setNom(request.getParameter("input-nom"));
    	
    	persistantuser.setPrenom(request.getParameter("input-prenom"));
    	
    	persistantuser.setEmail(request.getParameter("input-email"));
    	
    	persistantuser.setPassword(request.getParameter("input-mdp"));
    	
    	persistantuser.setTelephone(request.getParameter("input-tel"));
    	
    	Grade gr = gh.findById(Integer.parseInt(request.getParameter("input-grade")));
    	
    	persistantuser.setGrade(gr);
    	
    	Postes pst = ph.findById(Integer.parseInt(request.getParameter("input-poste")));	
    	persistantuser.setPostes(pst);
    	persistantuser.setEnMission((byte) 0);
    	
    	uh.addUsers(persistantuser);
    	
    	Roles persistantroles= new Roles();
    	Users persistantuser2 = uh.findByUsername(request.getParameter("input-email"));
    	
		persistantroles.setUsers(persistantuser2);
		
		persistantroles.setTitre(request.getParameter("input-role"));
	
		rh.addRoles(persistantroles);
		
		List<Users> listUsers = uh.findAllUsers();
		request.setAttribute("list_of_users",listUsers);
		return "/administration/users";
	}
	
	@RequestMapping("/lien")
	public String lien() throws Exception {
		return "/administration/lien";
	}
	@RequestMapping("/consulprofil")
	public String consulProfil(HttpServletRequest request) throws Exception {
		return "/administration/profils";
	}
	
	@RequestMapping("/modifprofil")
	public String modifierProfil(HttpServletRequest request) throws Exception {

		return "/administration/params";
	}
	
	@RequestMapping("/supprimer")
	public String supprimer(HttpServletRequest request) throws Exception {
		rh.deleteById(Integer.parseInt(request.getParameter("id-supp")));
		uh.deleteById(Integer.parseInt(request.getParameter("id-supp")));
		
		List<Users> listUsers = uh.findAllUsers();
		request.setAttribute("list_of_users",listUsers);
		return "/administration/users";
	}
	
	@RequestMapping("/promute")
	public String promute(HttpServletRequest request) throws Exception {
		Roles persistantroles= rh.findByUserId(Integer.parseInt(request.getParameter("id-prom")));
		if (persistantroles.getTitre().equals("ADMIN") ) {
		persistantroles.setTitre("SUPER-ADMIN");
		}
		if (persistantroles.getTitre().equals("USER") ) {
			persistantroles.setTitre("ADMIN");
		}
		rh.update(persistantroles);

		List<Users> listUsers = uh.findAllUsers();
		request.setAttribute("list_of_users",listUsers);
		return "/administration/users";
	}
	
	
	
}
