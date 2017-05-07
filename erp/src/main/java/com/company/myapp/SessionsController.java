package com.company.myapp;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
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
	
	@Autowired
    private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	@RequestMapping(value = "/signup", method= RequestMethod.POST) // 회원가입 클릭 시 
    public String create(@ModelAttribute User user){
    	user.setPassword(this.bcryptPasswordEncoder.encode(user.getPassword()));
    	userMapper.insertUser(user);
    	userMapper.insertAuthority(user.getEmail(),  "ROLE_USER");
    	return "popUp/statics/login";
    }
	
    @RequestMapping(value = "/login", method = RequestMethod.GET) // 세션없이 접근했을때
    public String home() {
        return "popUp/statics/login";
    }
    
    @RequestMapping(value ="/signup", method = RequestMethod.GET) // 회원가입 페이지
    public String signup(Model model){
    	User user = new User();
    	model.addAttribute("user", user);
    	return "popUp/statics/signup";
    }
    
    
    
}

