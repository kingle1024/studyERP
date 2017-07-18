package com.company.myapp;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MyWorkController {
	@RequestMapping(value="/mywork", method=RequestMethod.GET)
	public String index(){
		
		return "workspaces/index";
	}
}
