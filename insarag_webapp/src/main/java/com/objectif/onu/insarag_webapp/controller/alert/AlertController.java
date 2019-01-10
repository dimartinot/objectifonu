package com.objectif.onu.insarag_webapp.controller.alert;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/alert")
public class AlertController {

	
	@RequestMapping("/last_alert")
	public String alert_popup() throws Exception {
		return "/alert/last_alert";
	} 
	
	@RequestMapping("/alert_editor")
	public String alert_editor() throws Exception {
		return "/alert/alert_editor";
	} 
	
	@RequestMapping("/")
	public String alert_index() throws Exception {
		return "/alert/alert";
	}
}
