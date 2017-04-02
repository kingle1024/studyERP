//package com.company.myapp;
//
//import org.springframework.security.core.Authentication;
//import org.springframework.security.core.context.SecurityContextHolder;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.ModelMap;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestMethod;
//
//@Controller
//public class LoginController {
//	@RequestMapping(value="/logina", method = RequestMethod.GET)
//	public String printUser(ModelMap model){
//		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
//		String name = auth.getName();
//		
//		model.addAttribute("username", name);
//		return "popUp/statics/login";
//	}
//}
