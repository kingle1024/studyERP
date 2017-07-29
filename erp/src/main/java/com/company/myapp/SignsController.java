package com.company.myapp;


import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mycompany.mapper.SignMapper;
import com.mycompany.vo.Approval;

// 참고할 만한 사이트
// http://jp1020.tistory.com/entry/%EB%B7%B0-%EC%9D%B4%EB%A6%84-%EB%AA%85%EC%8B%9C%EC%A0%81-%EC%A7%80%EC%A0%95-ModelAndView%EC%99%80-String-%EB%A6%AC%ED%84%B4-%ED%83%80%EC%9E%85

@Controller
public class SignsController {
	
	@Autowired
	private SignMapper signmapper;
	
	@RequestMapping(value ="/signs", method = RequestMethod.GET)	
	public ModelAndView indexSigns(Model model){
		
		ModelAndView mv = new ModelAndView("signs/index"); 
		return mv;
	}
	
	@RequestMapping(value="/signs/atypicalDoc", method=RequestMethod.GET)
	public ModelAndView stockDoc(){
		
		
		ModelAndView mv = new ModelAndView("popUp/signs/atypicalDoc"); 
		return mv;
	}
	
	@RequestMapping(value="/signs/atypicalDoc", method=RequestMethod.POST)
	public ModelAndView stockDocData(Principal principal, @ModelAttribute Approval approval){
		System.out.println("/signs/atypicalDoc");
		String send_id = principal.getName(); // 접속중인 계정
		System.out.println(send_id);
//		String recv_id = "admin@naver.com";
		String recv_id = "teran1024@naver.com";
		approval.setRecv_id(recv_id);
		System.out.println(approval.toString());
		
//		signmapper.atypicalDoc(approval);
		
		ModelAndView mv = new ModelAndView("redirect:/signs"); 
		return mv;
	}
	
	@RequestMapping(value="/signs/testDoc", method=RequestMethod.POST)
	public ModelAndView testData(Principal principal, @ModelAttribute Approval approval){
		System.out.println("/signs/testDoc");
		String send_id = principal.getName();
		System.out.println(send_id);
		String recv_id = "teran1024@naver.com";
		approval.setRecv_id(recv_id);
		System.out.println(approval.toString());
		
//		signmapper.testDoc(approval);
		
		
		ModelAndView mv = new ModelAndView("redirect:/signs"); 
		return mv;
	}
	
	 @RequestMapping(value="/signs/test", method={RequestMethod.GET})
	  public ModelAndView test()
	  {
		 ModelAndView mv = new ModelAndView("popUp/signs/test"); 
		 return mv;
	  }
	  
	  @RequestMapping(value="/signs/recv", method={RequestMethod.GET})
	  public ModelAndView recv(@RequestParam(value="type", defaultValue="recvWaiting") String type, Principal principal, HttpServletRequest request, HttpServletResponse response)
	  {
		  ModelAndView mv = new ModelAndView("signs/"+type); // 진행, 대기, 승인, 반려 페이지로 이동
		  String email = principal.getName(); // 로그인한 사람의 계정
		  switch(type){
		  	case "recvWaiting":{
	  			mv.addObject("approval", signmapper.showRecvWaitingList(email)); // 대기인것을 가져온다
		  		break;
		  	}
		  	case "recvIng":{
		  		mv.addObject("approval", signmapper.showRecvIngList(email)); // 진행인 모든 것을 가져온다
		  		break;
		  	}
		  	case "recvApproval":{
		  		mv.addObject("approval", signmapper.showRecvApprovalList(email)); // 승인인 경우  
		  		break;
		  	}
		  	case "recvReject":{
		  		mv.addObject("approval", signmapper.showRecvRejectList(email)); // 반려인 경우 모두 
		  		break;
		  	}
		  	default:{
		  		System.out.println("Recvdefault");
		  	}
		  }
		  return mv;
	  }
	  
	  @RequestMapping(value={"/signs/send"}, method={RequestMethod.GET})
	  public ModelAndView send(@RequestParam(value="type", defaultValue="sendIng") String type, Principal principal)
	  {
		  ModelAndView mv = new ModelAndView("signs/"+type); // 진행, 대기, 승인, 반려 페이지로 이동
		  String email = principal.getName();
		  switch(type){
		  	case "sendIng":{
		  		mv.addObject("approval", signmapper.showSendIng(email));
		  		break;
		  	}
		  	case "sendApproval":{
		  		mv.addObject("approval", signmapper.showSendApprovalList(email));
		  		break;
		  	}
	  		case "sendReject":{
	  			mv.addObject("approval", signmapper.showSendReject(email));
	  			break;
	  		}
	  		default:{
	  			System.out.println("Senddefault");
	  		}
		  }
		  
		  return mv;
	  }
	  
	  @ResponseBody
	  @RequestMapping(value="/signs/approval", method=RequestMethod.POST)
	  public void approval(HttpServletRequest request){
		  System.out.println("승인");
		  String Doc = request.getParameter("Doc");
		  String recv_id = "admin";
		  
		  
	  }
	  
	  @ResponseBody
	  @RequestMapping(value="/signs/reject", method=RequestMethod.POST)
	  public void reject(HttpServletRequest request,Principal principal){
		  System.out.println("반려");
		  String Doc = request.getParameter("Doc");
		  
	  }
	  
	  @RequestMapping(value="/signs/docAtypicalView", method=RequestMethod.GET)
	  public ModelAndView showDoc(@RequestParam("Doc")String Doc,Principal principal){
		  ModelAndView mv = new ModelAndView("popUp/signs/DocAtypicalView");
		  
		  //문서의 정보를 가져온다
		  System.out.println(Doc);
		  
//		  mv.addObject("approval", signmapper.getApprovalAll(Doc));
		  mv.addObject("principal",principal);
		  return mv;
	  }
}
