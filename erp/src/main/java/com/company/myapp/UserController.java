package com.company.myapp;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.mycompany.vo.User;

@Controller
@SessionAttributes(value={"sessionUser"})
public class UserController {
	 @Autowired
	    private UserService userService;
	 
	 @RequestMapping(value="/userList", method=RequestMethod.GET)
	    public String userList(Model model,
	                @RequestParam(value="page", defaultValue="1") int page,
	                @RequestParam(value="word", required=false) String word) {
		 //왜 안오냐 
	        List<User> userList = userService.getUserList(page, word);
	        model.addAttribute("userList", userList);
	        model.addAttribute("page", page);
	        model.addAttribute("lastPage", userService.getLastPage());
	        return "userList";
	    }
}
