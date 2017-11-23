package com.h066it.foodSelector.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.h066it.foodSelector.dto.ContentDto;
import com.h066it.foodSelector.service.ServiceModel;
import com.h066it.foodSelector.vo.PageVo;

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
	public String list(ContentDto dto, Model model, PageVo page) {
		
		page.calPage(service.count().size());
		model.addAttribute("pageVo", page);
						
		model.addAttribute("list", service.list(page.getFirNum(), page.getLstNum()));
		
		return "/crud/list";
	}

	@RequestMapping("/generic")
	public String generic() {
		
		return "generic";
	}
	
}
