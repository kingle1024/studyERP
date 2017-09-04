package com.company.myapp;

import java.security.Principal;
import java.util.ArrayList;
import java.util.Date;
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
	private static class TIME_MAXIMUM {
		public static final int SEC = 60;
		public static final int MIN = 60;
		public static final int HOUR = 24;
		public static final int DAY = 30;
		public static final int MONTH = 12;
	}
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
		ArrayList<String> noticeTime = new ArrayList<String>();
		for(int i=0; i<boards.size(); i++){
			noticeTime.add(formatTimeString(boards.get(i).getRegister_date()));
		}
		model.addAttribute("boards", boards);
		model.addAttribute("noticeTime",noticeTime);
		
		List<Message> myMessages = messageMapper.getMyMessage(name);
		ArrayList<String> messageTime = new ArrayList<String>();
//		String emailToName = null;
		for(int i=0; i<myMessages.size(); i++){
			String emailToName = myMessages.get(i).getSend_id();
			myMessages.get(i).setSend_id(commonMapper.getEmailFromUsers(emailToName));
			if(myMessages.get(i).getRecv_date() != null){ // 널값이 있을 수도 있기 때문에 널값 체크
				messageTime.add(formatTimeString(myMessages.get(i).getRecv_date()));
			}
		}
		model.addAttribute("myMessages",myMessages);
		model.addAttribute("messageTime",messageTime);
		
		String email = name;
		session.setAttribute("sessionUserName", commonMapper.getEmailFromUsers(email));
		return "mains/index";
	}
	
	@RequestMapping(value= "/books/test", method = RequestMethod.GET)
	public String tt(){
		return "books/testIndex";
	}
	
	public static String formatTimeString(Date tempDate) {
		long curTime = System.currentTimeMillis();
		long regTime = tempDate.getTime();
		long diffTime = (curTime - regTime) / 1000;

		String msg = null;
		if (diffTime < TIME_MAXIMUM.SEC) {
			// sec
			msg = "방금 전";
		} else if ((diffTime /= TIME_MAXIMUM.SEC) < TIME_MAXIMUM.MIN) {
			// min
			msg = diffTime + "분 전";
		} else if ((diffTime /= TIME_MAXIMUM.MIN) < TIME_MAXIMUM.HOUR) {
			// hour
			msg = (diffTime) + "시간 전";
		} else if ((diffTime /= TIME_MAXIMUM.HOUR) < TIME_MAXIMUM.DAY) {
			// day
			msg = (diffTime) + "일 전";
		} else if ((diffTime /= TIME_MAXIMUM.DAY) < TIME_MAXIMUM.MONTH) {
			// day
			msg = (diffTime) + "달 전";
		} else {
			msg = (diffTime) + "년 전";
		}
		return msg;
	}
}



