package com.h066it.foodSelector.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.h066it.foodSelector.dto.ContentDto;
import com.h066it.foodSelector.dto.FileDto;
import com.h066it.foodSelector.service.ServiceModel;
import com.h066it.foodSelector.vo.PageVo;

@Controller
public class HomeController {

	@Autowired
	private ServiceModel service; 
	
	@RequestMapping("/index")
	public String index(Model model, Authentication auth, ArrayList<FileDto> list) {
		
		if(auth != null) {
			model.addAttribute("auth", auth.getName());
		}
		
		int count = service.foodCount();
		
		System.out.println("count = " + count);
		model.addAttribute("count", count);
		model.addAttribute("files", service.fileList());
		
		return "index";
	}
	
	@RequestMapping("/gallery")
	public String gallery(Model model, ArrayList<FileDto> list) {
		
		int count = service.foodCount();
		
		System.out.println("count = " + count);
		model.addAttribute("tags", service.food_tag());
		model.addAttribute("files", service.fileList());
		
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
	
	@RequestMapping("/search")
	public String search(ContentDto dto, HttpServletRequest request, Model model, PageVo page) {
		
		String searchType = request.getParameter("searchType");
		String keyword = request.getParameter("keyword");
		
		page.calPage(service.searchCount(searchType, keyword).size());
		model.addAttribute("pageVo", page);
		
		model.addAttribute("list", service.searchList(page.getFirNum(), page.getLstNum(), searchType, keyword));
		model.addAttribute("searchType", searchType);
		model.addAttribute("keyword", keyword);
		
		return "/crud/list";
	}
	
}
