package com.objectif.onu.insarag_webapp.controller.administration;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LoginController {
	
	@RequestMapping("/login")
	public String login() throws Exception {
		return "/administration/login";
	}
}
