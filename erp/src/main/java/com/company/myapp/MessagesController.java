package com.company.myapp;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mycompany.mapper.BookMapper;
import com.mycompany.vo.Book;
import com.mycompany.vo.Message;
import com.mycompany.vo.myBook;

@Controller
public class MessagesController {
	@Autowired
	private BookMapper bookMapper;

	@RequestMapping(value="/messages", method=RequestMethod.GET)
	public String indexTestR(ModelMap model, Principal principal){
		String name = principal.getName(); 
	    model.addAttribute("username", name);
	    List<Message> myMessages = bookMapper.getMyBookR(name);
	    model.addAttribute("myMessages", myMessages);
		return "messages/index";
	}
	
	@RequestMapping(value = "/messages/new", method = RequestMethod.GET)
	public String newBookR(ModelMap model,Principal principal) {
		String name = principal.getName(); 
	    model.addAttribute("username", name); // jsp파일에서는 ${username} 으로 해야함
		return "messages/new";
	}
	
	@RequestMapping(value = "/messages", method = RequestMethod.POST)
	public String createR(@ModelAttribute Message Message, HttpServletRequest request, ModelMap model, Principal principal) {
		String name = principal.getName(); 
	    model.addAttribute("username", name);
		bookMapper.createMessageR(Message);
		return "redirect:/messages";
	}
	
	@RequestMapping(value="/messages/view/{no}", method = RequestMethod.GET)
	public String messageView(@PathVariable int no, Model model){
		Message message = bookMapper.getMessage(no);
		model.addAttribute("message", message);
		return "popUp/messages/view";
	}
	
}
