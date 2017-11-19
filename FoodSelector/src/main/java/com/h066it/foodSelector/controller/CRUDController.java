package com.h066it.foodSelector.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.h066it.foodSelector.dto.ContentDto;
import com.h066it.foodSelector.service.ServiceModel;

@Controller
public class CRUDController {

	@Autowired
	private ServiceModel service;
	
	@RequestMapping(value="/write", method=RequestMethod.GET)
	public String write_form(ContentDto dto, Model model, Authentication auth) {
				
		System.out.println("write_form");
		
		model.addAttribute("auth", auth.getName());
		
		return "/crud/form";
	}
	
	@RequestMapping(value="/write", method=RequestMethod.POST)
	public String write(ContentDto dto) {
		
		System.out.println("write");

		service.write(dto.getBTitle(), dto.getBWriter(), dto.getBPassword(), dto.getBContent());
		
		return "redirect:/list";
	}
	
	@RequestMapping("/{bId}")
	public String view(@PathVariable int bId, Model model) {
		
		System.out.println("view = " + bId);
		
		model.addAttribute("dto", service.view(bId));
		
		return "/crud/view";
	}
	
	@RequestMapping(value = "/{bId}/update", method = RequestMethod.GET)
	public String update_form(@PathVariable int bId, Model model) {
		
		System.out.println("update_form");
		
		model.addAttribute("dto", service.view(bId));
		
		return "/crud/form";
	}
	
	@RequestMapping(value = "/{bId}/update", method = RequestMethod.POST)
	public String update(@PathVariable int bId, ContentDto dto, Model model) {
		
		System.out.println("update");
		
		service.update(dto.getBTitle(), dto.getBContent(), dto.getBId());
		
		return "redirect:/list";
	}
	
	@RequestMapping("/delete")
	public String delete(ContentDto dto, Model model) {
		
		System.out.println("delete");
		
		boolean pwChkRst = service.delete(dto.getBId(), dto.getBPassword());
		
		System.out.println("pwChkRst : " + pwChkRst);
		
		if(pwChkRst == false) {
			model.addAttribute("rst", "비밀번호가 틀립니다.");
			model.addAttribute("returnUrl", "/" + dto.getBId());
		} else {
			model.addAttribute("rst", "글이 삭제되었습니다.");
			model.addAttribute("returnUrl", "/list");
		}
		
		return "/crud/alertAndRedirect";
	}
	
	@RequestMapping("/udtPwdChk")
	public String udtPwdChk(ContentDto dto, Model model) {
		
		System.out.println("udtPwdChk");
		
		ContentDto pwChkRst = service.udtPwdChk(dto.getBId(), dto.getBPassword());
		
		if(pwChkRst == null) {
			model.addAttribute("rst", "비밀번호가 틀립니다.");
			model.addAttribute("returnUrl", "/" + dto.getBId());

			return "/crud/alertAndRedirect";
		}		

		return "redirect:/" + dto.getBId() + "/update";
	}
}
