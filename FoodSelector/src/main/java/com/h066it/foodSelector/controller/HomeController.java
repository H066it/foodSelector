package com.h066it.foodSelector.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.h066it.foodSelector.dto.ContentDto;
import com.h066it.foodSelector.service.ServiceModel;

@Controller
public class HomeController {

	@Autowired
	private ServiceModel service; 
	
	@RequestMapping("/index")
	public String index(Model model, Authentication auth) {
		
		if(auth != null) {
			model.addAttribute("auth", auth.getName());
		}
		
		return "index";
	}
	
	@RequestMapping("/gallery")
	public String gallery() {
		
		return "gallery";
	}
	
	@RequestMapping("/list")
	public String list(ContentDto dto, Model model) {
		
		model.addAttribute("list", service.list());
		
		return "/crud/list";
	}

	@RequestMapping("/generic")
	public String generic() {
		
		return "generic";
	}
	
}
