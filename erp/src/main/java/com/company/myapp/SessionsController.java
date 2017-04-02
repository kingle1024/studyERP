package com.company.myapp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.mycompany.vo.User;
import com.mycompany.mapper.userMapper;
@Controller
public class SessionsController {
	
	@Autowired
	private userMapper userMapper;
    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String home() {
        return "popUp/statics/login";
    }
    
    @RequestMapping(value ="/signup", method = RequestMethod.GET)
    public String signup(Model model){
    	User user = new User();
    	model.addAttribute("user", user);
    	return "statics/signup";
    }
    
    @RequestMapping(value = "/signup", method= RequestMethod.POST)
    public String create(@ModelAttribute User user){
    	userMapper.insertUser(user);
    	userMapper.insertAuthority(user.getEmail(),  "ROLE_USER");
//    	return "redirect:/statics/login";
    	return "statics/login";
    }
}