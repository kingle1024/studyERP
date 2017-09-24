package com.company.myapp;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.Principal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mycompany.mapper.userMapper;
import com.mycompany.mapper.CommonMapper;
import com.mycompany.mapper.MessageMapper;
import com.mycompany.vo.Message;
import com.mycompany.vo.Tag;
import com.mycompany.vo.User;
import com.mycompany.vo.UserPreview;

@Controller
public class MessagesController {
	@Autowired
	private CommonMapper commonMapper;
	
	@Autowired
	private MessageMapper messageMapper;
	
	@Autowired
	private userMapper userMapper;
	
	@Autowired
	private UserService userService;
	
	@RequestMapping(value="/messages", method=RequestMethod.GET)
	public String indexTestR(ModelMap model, Principal principal, @RequestParam(value="page", defaultValue="1")int page, 
								@RequestParam(value="word", required=false) String word){
		String recv_id = principal.getName();
		System.out.println("recv_id:"+recv_id);
	    List<Message> messageList = userService.getRecvMessageList(page, word, recv_id);
	    for(int i=0; i<messageList.size(); i++){
			String email = messageList.get(i).getSend_id();
			messageList.get(i).setSend_id(commonMapper.getEmailFromUsers(email));
		}
	    model.addAttribute("messageList", messageList);
	    model.addAttribute("page", page);
	    model.addAttribute("lastPage", userService.getRecvMessageLastPage(recv_id));
	    
		return "messages/index";
	}

	@RequestMapping(value="messages/sendIndex", method = RequestMethod.GET)
	public String sendView(ModelMap model, Principal principal, @RequestParam(value="page", defaultValue="1") int page, 
							@RequestParam(value="word", required=false)String word){
		String name = principal.getName();
		String send_id = name;
		 List<Message> messageList = userService.getSendMessageList(page, word, send_id);
		 for(int i=0; i<messageList.size(); i++){
			 messageList.get(i).setRecv_id(commonMapper.getEmailFromUsers(messageList.get(i).getRecv_id())); // 받은사람의 email을 가지고 users 테이블에 가서 이름을 가져온다
		 }
		 model.addAttribute("messageList", messageList);
		 model.addAttribute("page", page);
		 model.addAttribute("lastPage", userService.getSendMessageLastPage(send_id));
		
		return "messages/sendIndex";
	}
	
	@RequestMapping(value = "/messages/new", method = RequestMethod.GET)
	public String newMessage(ModelMap model,Principal principal) {
		String name = principal.getName(); 
	    model.addAttribute("username", name); // jsp파일에서는 ${username} 으로 해야함 
		return "messages/new";
	}
	
	//보낸이의 아이디를 가져와야 한다....
	@RequestMapping(value = "/messages/answer/{recv_id}/{state}", method = RequestMethod.GET) // PathVariable로 {recv_id}를 받는다.
	public String answerMessage(@ModelAttribute Message Message, ModelMap model,Principal principal, @PathVariable String recv_id, @PathVariable int state) {		
		
		String recvEmail = recv_id; // 보내는 이의 아이디
		model.addAttribute("recv", recvEmail);
		model.addAttribute("recvName",userMapper.getUserList(recvEmail).getName());
		if(state == 1){
		return "messages/answer";
		}else{
			return "popUp/messages/answer";
		}
	}
	
	//메세지를 보내는 과정 hidden 값으로 자신의 아이디를 가지고 있는다.
	@RequestMapping(value = "/messages", method = RequestMethod.POST)
	public String createMessage(@ModelAttribute Message Message, Principal principal) {
	    Message.setSend_id(principal.getName());
	    messageMapper.answerMessage(Message);
		return "redirect:/messages";
	}
	
	@RequestMapping(value="/messages/view/{no}/{state}", method = RequestMethod.GET)
	public String messageView(@PathVariable int no, @PathVariable int state, Model model){
		Message message = messageMapper.getMessage(no); // 메세지에 대한 정보를 불러온다
		model.addAttribute("sendName",commonMapper.getEmailFromUsers(message.getSend_id()));
		
		model.addAttribute("message", message);
		if(message.getRecv_date() == null){ // 해당 쪽지가 미수신이였으면  수신으로 바꾼다.
			messageMapper.updateMessageRecvDate(no);
		}
		if(state == 1){
			return "messages/view";
		}else{
			return "popUp/messages/viewWindow";	
		}
	}
	
	@RequestMapping(value="/messages/sendView/{no}", method = RequestMethod.GET)
	public String messageSendView(@PathVariable int no, Model model){
		Message message = messageMapper.getMessage(no);
		
		model.addAttribute("recvName",commonMapper.getEmailFromUsers(message.getRecv_id()));
		model.addAttribute("message", message);
		
		return "messages/sendView";
	}
	
	@ResponseBody
	@RequestMapping(value="/messages/preview", method=RequestMethod.POST)
	public ModelAndView messagePreview(HttpServletRequest request, HttpServletResponse response, Model model) throws IOException{
		String value = request.getParameter("value");
		JSONArray list = new JSONArray();
		JSONObject object = null;
		List<User> users = userMapper.selectUserAll();
		
		for(int i=0; i<users.size(); i++){
			if( users.get(i).getEmail().indexOf(value) > -1){
				object = new JSONObject();
				object.put("data", users.get(i).getEmail());
				list.add(object);
			}
		}
		ModelAndView mav = new ModelAndView();
        mav.setViewName("test");
        mav.addObject("hello", "Hello World!");
        
		return mav;
	}
	
	@RequestMapping(value = "/getTags", method = RequestMethod.GET)
	public @ResponseBody List<UserPreview> getTags(@RequestParam String tagName) {
		return simulateSearchResult(tagName);
	}
	
	private List<UserPreview> simulateSearchResult(String tagName) { 
		List<User> getEmailFromUser = userMapper.selectUserAll(); // User의 모든 email을 가져온다
		List<UserPreview> data = new ArrayList<UserPreview>();
		for(int i=0; i<getEmailFromUser.size(); i++){
			data.add(new UserPreview(i+1, getEmailFromUser.get(i).getEmail()));
		}
		List<UserPreview> result = new ArrayList<UserPreview>();
		try{
			for(UserPreview userPreview : data){
				if(userPreview.getEmail().contains(tagName)){
					result.add(userPreview);
				}
			}
		}catch(Exception e){
			System.err.println(e.getMessage());
		}
		return result;
	}
}
