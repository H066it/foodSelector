package com.h066it.foodSelector.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.h066it.foodSelector.config.FileUtil;
import com.h066it.foodSelector.dto.FileDto;
import com.h066it.foodSelector.dto.FoodDto;
import com.h066it.foodSelector.service.ServiceModel;

@Controller
public class AdminController {

	@Autowired
	private ServiceModel service;
	
	@RequestMapping(value="/food_write", method=RequestMethod.GET)
	public String food_write_form() {
		
		System.out.println("admin_write_form");
		
		return "admin/food_write";
	}
	
	@RequestMapping(value="/food_write", method=RequestMethod.POST)
	public String food_write(FoodDto dto, List<MultipartFile> files) {
		
		System.out.println("admin_write");

		int maxFId = service.food_fIdChk() + 1;
		FileUtil fu = new FileUtil();
		List<FileDto> savedfiles = fu.saveFiles(files, maxFId);	// 실제 저장은 여기서.
		
		service.food_writeWithFiles(dto, savedfiles);	// DB 등록은 여기서.
		
		return "redirect:/list";
	}
	
	@RequestMapping(value="/food_info", method=RequestMethod.POST)
	@ResponseBody
	public FoodDto food_info(@RequestBody Map< String, String> jsonParam) {
		
		int fId = Integer.parseInt(jsonParam.get("fId"));
		System.out.println("fId = " + fId);
		FoodDto dto = service.foodInfo(fId);
		
		return dto;
	}
}
