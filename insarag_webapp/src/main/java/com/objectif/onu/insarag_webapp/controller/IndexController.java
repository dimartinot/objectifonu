package com.objectif.onu.insarag_webapp.controller;

import java.util.Map;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

 


 
 
@Controller 
public class IndexController {

	@RequestMapping("/")
	public String index() throws Exception {
		return "index";
	}   
	
	
}