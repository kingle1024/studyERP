package com.company.myapp;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mycompany.mapper.BoardMapper;
import com.mycompany.mapper.CommonMapper;
import com.mycompany.mapper.MessageMapper;
import com.mycompany.vo.Board;
import com.mycompany.vo.Message;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	@Autowired
	private CommonMapper commonMapper;
	
	@Autowired		
	private BoardMapper boardMapper;	
	
	@Autowired
	private MessageMapper messageMapper;
	
	@RequestMapping(value ="/", method = RequestMethod.GET)
	public String index1(Model model){
		List<Board> boards = boardMapper.getBoardList();		
		model.addAttribute("boards", boards);		
		return "redirect:/index";
	}		
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String goToIndex(Model model, Principal principal, HttpSession session) {
		String name = principal.getName(); 
	    model.addAttribute("username", name);
	   
		List<Board> boards = boardMapper.mainBoardList();		
		model.addAttribute("boards", boards);
		
		List<Message> myMessages = messageMapper.getMyMessage(name);
		for(int i=0; i<myMessages.size(); i++){
			String email = myMessages.get(i).getSend_id();
			myMessages.get(i).setSend_id(commonMapper.getEmailFromUsers(email));
		}
		model.addAttribute("myMessages",myMessages);
		
		String email = name;
		session.setAttribute("sessionUserName", commonMapper.getEmailFromUsers(email));
		
		return "mains/index";
	}
}
