package com.objectif.onu.insarag_webapp.controller.alert;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.objectif.onu.insarag_webapp.bean.ActiveUserBean;
import com.objectif.onu.insarag_webapp.dao.AlerteHome;

@RestController
public class RestAlertController {

	@Autowired
	ActiveUserBean connectedUser;
	
	private AlerteHome ah = new AlerteHome();

	
	@RequestMapping("/getAlert")
    public Integer greeting() {
		
        return ah.selectAllFromFuture(connectedUser.getUser()).size();
    }
}
