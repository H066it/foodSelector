package com.h066it.foodSelector.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {

	@RequestMapping("/index")
	public String index() {
		
		return "index";
	}
	
	@RequestMapping("/gallery")
	public String gallery() {
		
		return "gallery";
	}
	
	@RequestMapping("/generic")
	public String generic() {
		
		return "generic";
	}
	
}
