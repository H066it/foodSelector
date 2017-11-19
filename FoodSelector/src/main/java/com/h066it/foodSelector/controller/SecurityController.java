package com.h066it.foodSelector.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.h066it.foodSelector.dto.MemberDto;
import com.h066it.foodSelector.service.SecurityServiceModel;

@Controller
public class SecurityController {

	@Autowired
	private SecurityServiceModel serviceModel;
	
/*	private Facebook facebook;
    private ConnectionRepository connectionRepository;
    
    public SecurityController(Facebook facebook, ConnectionRepository connectionRepository) {
        this.facebook = facebook;
        this.connectionRepository = connectionRepository;
    }
    
    @RequestMapping("/login")
    public String helloFacebook(Model model) {
        if (connectionRepository.findPrimaryConnection(Facebook.class) == null) {
        	System.out.println("1");
            return "redirect:/connect/facebook";
        }
        
        System.out.println("2");
        model.addAttribute("facebookProfile", facebook.userOperations().getUserProfile());
        
        
        System.out.println("3");
        PagedList<Post> feed = facebook.feedOperations().getFeed();
        
        return "index";
    } */
	
	/*@RequestMapping("/login")
	public String test( ) {
		
		return "/connect/login";
	}*/
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public ModelAndView login(@RequestParam(value = "error", required = false) String error,
						@RequestParam(value = "logout", required = false) String logout) {

		ModelAndView model = new ModelAndView();

		if (error != null) {
			model.addObject("error", "Invalid username and password!");
		}

		if (logout != null) {
			model.addObject("msg", "You've been logged out successfully.");
		}
		model.setViewName("/connect/login");

		return model;
	}
	
	@RequestMapping(value = "/signUp", method = RequestMethod.GET)
	public String signUp_form() {
		
		System.out.println("signUp_form");
		
		return "/connect/signUp";
	}
	
	@RequestMapping(value = "/signUp", method = RequestMethod.POST)
	public String signUp(MemberDto dto) {
		
		serviceModel.signUp(dto.getId(), dto.getUsername(), dto.getPassword());
		
		return "redirect:index";
	}
	
}
