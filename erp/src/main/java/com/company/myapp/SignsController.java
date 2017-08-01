package com.company.myapp;


import java.io.IOException;
import java.io.PrintWriter;
import java.security.Principal;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mycompany.mapper.SignMapper;
import com.mycompany.vo.Approval;
import com.mycompany.vo.ApprovalSub;
import com.mycompany.vo.ApprovalSystem;

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
	
	@RequestMapping(value="/signs/atypicalDoc", method=RequestMethod.POST) // 비정형 문서의 1단계와 2단계 가능
	public ModelAndView stockDocData(HttpServletRequest request, HttpServletResponse response, @ModelAttribute Approval approval, Principal principal){
		System.out.println("/signs/atypicalDoc");
		ModelAndView mv = new ModelAndView("redirect:/signs");
		//문서를 하나 insert한다
		approval.setSend_id(principal.getName());
		String type_code = request.getParameter("type_code"); // 문서마다 있는 hidden 값인 type_code를 가져온다
		String recv_id = signmapper.ListgetApprovalSystem(type_code); // 문서의 형식이 무엇인지 판단
		approval.setRecv_id(recv_id);
		System.out.println(signmapper.insertApproval(approval));
		
		return mv;
	}
	
	@RequestMapping(value="/signs/testDoc", method=RequestMethod.POST)
	public ModelAndView testData(Principal principal, @ModelAttribute Approval approval){
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
	  public void approval(HttpServletRequest request, Principal principal){
		  System.out.println("승인");
		  String email = principal.getName();
		  String Doc = request.getParameter("Doc"); // 파라메터에서 문서 번호를 가져온다
		  Approval approval = signmapper.getApproval(Doc);
		  String type_code = approval.getType_code(); // 현재 문서에 대한 타입코드를 가져와야 한다 ->
		  ApprovalSystem approvalSystem = signmapper.getApprovalSystem(type_code, email);
		  int ing = approvalSystem.getIng(); 
		  int last = approvalSystem.getLast();
		  //System의 ing와 last가 같은데 recv_id가 자신이면 -> approvals에서 최신상태를 1로 바꾸고
		  signmapper.approvals_sub(Doc, ing, last, 1, email, type_code); // 자신이 결재한 내용을 sub에 저장한다
		  if(ing == last){ // 자신이 마지막 단계이면
			  signmapper.approvalEnd(Doc);
		  }else{ // 다음 단계자가 있으면
			   String nextApprovalUser = signmapper.getNextApprovalUser(type_code, ing);
			   signmapper.changeApprovalRecvId(nextApprovalUser, Doc); // 현재 상태를 다음 받을 사람의 아이디로 바꿔준다
		  }
	  }
	  
	  @ResponseBody
	  @RequestMapping(value="/signs/reject", method=RequestMethod.POST)
	  public void reject(HttpServletRequest request,Principal principal){
		  System.out.println("반려 진입");
		  String Doc = request.getParameter("Doc");
		  String recv_id = principal.getName();
		  Approval approval = signmapper.getApproval(Doc); // 현재 문서에 대한 정보를 가져온다
		  String type_code = approval.getType_code(); 
		  ApprovalSystem approvalSystem = signmapper.getApprovalSystem(type_code, recv_id);
		  int ing = approvalSystem.getIng();
		  int last = approvalSystem.getLast();
		  
		  signmapper.reject(Doc);
		  signmapper.approvals_sub(Doc, ing, last, 2, recv_id, type_code);
		  System.out.println("반려 완료");
	  }
	  
	  @RequestMapping(value="/signs/docAtypicalView", method=RequestMethod.GET)
	  public ModelAndView showDoc(@RequestParam("Doc")String Doc,Principal principal){
		  ModelAndView mv = new ModelAndView("popUp/signs/DocAtypicalView");
		  
		  //문서의 정보를 가져온다
		  System.out.println(Doc);
		  
		  //만약 상태가 0이면서 recv_id가 자신이면 보이게 한다
		  mv.addObject("approval", signmapper.getApproval(Doc));
		  mv.addObject("principal",principal.getName());
		  
		  
		  
		  return mv;
	  }
}
