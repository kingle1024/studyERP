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
import com.mycompany.vo.Message;

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
	public String newMessage(ModelMap model,Principal principal) {
		String name = principal.getName(); 
	    model.addAttribute("username", name); // jsp파일에서는 ${username} 으로 해야함
		return "messages/new";
	}
	//보낸이의 아이디를 가져와야 한다....
	@RequestMapping(value = "/messages/answer/{recv_id}", method = RequestMethod.GET) // PathVariable로 {recv_id}를 받는다.
	public String answerMessage(@ModelAttribute Message Message, ModelMap model,Principal principal,@PathVariable String recv_id) {		
		String name = principal.getName(); // 사용자의 아이디를 가져옴
	    model.addAttribute("username", name); // jsp파일에서는 ${username} 으로 해야함
	    
		String recv = recv_id;
		model.addAttribute("recv", recv); 
		
		return "messages/answer";
	}
	
	@RequestMapping(value = "/messages", method = RequestMethod.POST)
	public String createMessage(@ModelAttribute Message Message, HttpServletRequest request, ModelMap model, Principal principal) {
		String name = principal.getName(); 
	    model.addAttribute("username", name);
		bookMapper.createMessageR(Message);
		return "redirect:/messages";
	}
	
	@RequestMapping(value="/messages/viewWindow/{no}", method = RequestMethod.GET)
	public String messageViewWindow(@PathVariable int no, Model model){
		Message message = bookMapper.getMessage(no);
		model.addAttribute("message", message);
		
		return "popUp/messages/viewWindow";
	}
	
	@RequestMapping(value="/messages/view/{no}", method = RequestMethod.GET)
	public String messageView(@PathVariable int no, Model model){
		Message message = bookMapper.getMessage(no);
		model.addAttribute("message", message);
		if(message.getRecv_date() == null){
			bookMapper.updateMessageRecvDate(no);
		}
		return "messages/view";
	}
	
}
