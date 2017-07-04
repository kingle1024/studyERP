package com.company.myapp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mycompany.vo.User;
import com.mycompany.mapper.userMapper;
@Controller
public class Temp {
	
	@Autowired
    private userMapper userMapper;
	
	   @RequestMapping(value = "/admin", method = RequestMethod.GET)
	    public String index(Model model) {
		   	List<User> users = userMapper.selectUsers();
	        model.addAttribute("users", users);
	        return "admin/index";
	    }
	    @RequestMapping(value = "/admin/role/{userId}/{role}")
	    public String changeRole(@PathVariable int userId, @PathVariable String role) {
	        toggleRole(userId, role);
	        return "redirect:/admin";
	    }
	    private void toggleRole(int userId, String role) {
	        User user = userMapper.selectUserById(userId);
	        if (! user.hasRole(role))
	            userMapper.insertAuthority(user.getEmail(), "ROLE_" + role.toUpperCase());
	        else
	            userMapper.deleteAuthority(user.getEmail(), "ROLE_" + role.toUpperCase());
	    }
	
}
