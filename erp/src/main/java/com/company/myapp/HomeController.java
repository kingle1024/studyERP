package com.company.myapp;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mycompany.mapper.BookMapper;
import com.mycompany.vo.Board;
import com.mycompany.vo.Message;
import com.mycompany.vo.myBook;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	@Autowired		
	private BookMapper bookMapper;	
	
	@RequestMapping(value ="/", method = RequestMethod.GET)
	public String index1(Model model){
		List<Board> boards = bookMapper.getBoardList();		
		model.addAttribute("boards", boards);		
		return "redirect:/index";
	}		
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String goToIndex(Model model, Principal principal) {
		String name = principal.getName(); 
	    model.addAttribute("username", name);
	   
		List<Message> myMessages = bookMapper.getMyMessage(name);
	    model.addAttribute("myMessages",myMessages);
	    
		List<Board> boards = bookMapper.getBoardList();		
		model.addAttribute("boards", boards);
		
		return "mains/index";
	}
}
