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
public class AdminsController {
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
	    @RequestMapping(value="/admin/delete/{userId}") // get 방식의 선언한 방식으로 받는다.
	    public String deleteUser(@PathVariable int userId){ // 다시 userId를 get 방식으로 던져준다(아마도)
	    	userMapper.deleteUser(userId);
	    	return "redirect:/admin";
	    }
	    private void toggleRole(int userId, String role) {
	    	User user = userMapper.selectUserById(userId);
	    	if (! user.hasRole(role)) // 다시 클릭했을 때 
	    		userMapper.insertAuthority(user.getEmail(), "ROLE_" + role.toUpperCase());
	    	else
	    		userMapper.deleteAuthority(user.getEmail(), "ROLE_" + role.toUpperCase());
	    }
}