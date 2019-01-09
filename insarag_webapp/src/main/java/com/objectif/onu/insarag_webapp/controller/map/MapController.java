package com.objectif.onu.insarag_webapp.controller.map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MapController {

	@RequestMapping("/map")
	public String index() throws Exception {
		return "/map/map";
	}
}
