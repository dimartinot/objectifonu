package com.objectif.onu.insarag_webapp.controller.alert;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AlertController {

	
	@RequestMapping("/popup_demo")
	public String alert_popup() throws Exception {
		return "/alert/alert_popup";
	} 
	
	@RequestMapping("/editor_demo")
	public String alert_editor() throws Exception {
		return "/alert/alert_editor";
	} 
}
