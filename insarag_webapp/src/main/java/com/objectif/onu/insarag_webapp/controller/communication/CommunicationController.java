package com.objectif.onu.insarag_webapp.controller.communication;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CommunicationController {

	
		@RequestMapping("/communication")
		public String communication_menu() throws Exception {
			return "/communication/communication_menu";
		}
}





