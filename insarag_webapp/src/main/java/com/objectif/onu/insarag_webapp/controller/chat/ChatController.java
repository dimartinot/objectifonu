package com.objectif.onu.insarag_webapp.controller.chat;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/chat")
public class ChatController {


		@RequestMapping("/chat")
		public String index() throws Exception {
			return "/chat/chat";
		}   
	
}
