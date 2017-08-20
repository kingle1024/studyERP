package com.company.myapp;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

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

import com.mycompany.mapper.CommonMapper;
import com.mycompany.mapper.SignMapper;
import com.mycompany.vo.Approval;
import com.mycompany.vo.ApprovalSub;
import com.mycompany.vo.ApprovalSystem;
import com.mycompany.vo.BreakDownDocument;

// 참고할 만한 사이트
// http://jp1020.tistory.com/entry/%EB%B7%B0-%EC%9D%B4%EB%A6%84-%EB%AA%85%EC%8B%9C%EC%A0%81-%EC%A7%80%EC%A0%95-ModelAndView%EC%99%80-String-%EB%A6%AC%ED%84%B4-%ED%83%80%EC%9E%85

@Controller
public class SignsController {
	@Autowired
	private CommonMapper commonMapper;
	
	@Autowired
	private SignMapper signMapper;

	@RequestMapping(value = "/signs", method = RequestMethod.GET)
	public ModelAndView indexSigns(Model model) {
		System.out.println("signs 진입");
		ModelAndView mv = new ModelAndView("signs/index");
		return mv;
	}

	@RequestMapping(value = "/signs/atypicalDoc", method = RequestMethod.GET)
	public ModelAndView stockDoc() {
		ModelAndView mv = new ModelAndView("popUp/signs/atypicalDoc");
		String type_code = "1000";
		List<ApprovalSystem> approvalSystem = signMapper.getApprovalSystemList(type_code);
		mv.addObject("approvalSystem", approvalSystem);
		return mv;
	}

	@ResponseBody
	@RequestMapping(value = "/signs/atypicalDoc", method = RequestMethod.POST) // 비정형
	public void stockDocData(HttpServletRequest request, HttpServletResponse response,
			@ModelAttribute Approval approval, BreakDownDocument breakDownDocument, Principal principal) {
		System.out.println("/signs/atypicalDoc");
		ModelAndView mv = new ModelAndView("redirect:/signs"); 
		// 문서를 하나 insert한다
		approval.setSend_id(principal.getName());
		String type_code = request.getParameter("type_code"); // 문서마다 있는 hidden
		String recv_id = signMapper.ListgetApprovalSystem(type_code); // 문서의 형식이
		approval.setRecv_id(recv_id);
		System.out.println("저장여부:"+signMapper.insertApproval(approval)); // 디비 저장

		if(type_code.equals("1100")){ 
			// 최신 번호를 하나 가져와야 한다
			System.out.println(signMapper.recentLimitOne());
			int no = signMapper.recentLimitOne();
			breakDownDocument.setNo(no);
			System.out.println(signMapper.insertBreakDownDocument(breakDownDocument));
		}else{
			System.out.println("else다");
		}
	}

	@RequestMapping(value = "/signs/breakdownDoc", method = RequestMethod.GET )
	public ModelAndView breakdown() {
		ModelAndView mv = new ModelAndView("popUp/signs/breakdownDoc");
		String type_code = "1100";
		List<ApprovalSystem> approvalSystem = signMapper.getApprovalSystemList(type_code);
		mv.addObject("approvalSystem", approvalSystem);
		return mv;
	}
	
	@RequestMapping(value = "/signs/breakdownDoc", method = RequestMethod.POST)
	public ModelAndView breakdownData(Principal principal, @ModelAttribute Approval approval) {
		ModelAndView mv = new ModelAndView("redirect:/signs");
		return mv;
	}


	@ResponseBody
	@RequestMapping(value = "/signs/approval", method = RequestMethod.POST)
	public void approval(HttpServletRequest request, Principal principal) {
		System.out.println("승인");
		String email = principal.getName();
		String Doc = request.getParameter("Doc"); // 파라메터에서 문서 번호를 가져온다
		Approval approval = signMapper.getApproval(Doc);
		String type_code = approval.getType_code(); // 현재 문서에 대한 타입코드를 가져와야 한다
													// ->
		ApprovalSystem approvalSystem = signMapper.getApprovalSystem(type_code, email);
		int ing = approvalSystem.getIng();
		int last = approvalSystem.getLast();
		// System의 ing와 last가 같은데 recv_id가 자신이면 -> approvals에서 최신상태를 1로 바꾸고
		signMapper.approvals_sub(Doc, ing, last, 1, email, type_code); // 자신이
																		// 저장한다
		if (ing == last) { // 자신이 마지막 단계이면
			signMapper.approvalEnd(Doc);
		} else { // 다음 단계자가 있으면
			String nextApprovalUser = signMapper.getNextApprovalUser(type_code, ing);
			signMapper.changeApprovalRecvId(nextApprovalUser, Doc); // 현재 상태를 다음 받을 사람의 아이디로 바꿔준다
		}
	}

	@ResponseBody
	@RequestMapping(value = "/signs/reject", method = RequestMethod.POST)
	public void reject(HttpServletRequest request, Principal principal) {
		System.out.println("반려 진입");
		String Doc = request.getParameter("Doc");
		String recv_id = principal.getName();
		Approval approval = signMapper.getApproval(Doc); // 현재 문서에 대한 정보를 가져온다
		String type_code = approval.getType_code();
		ApprovalSystem approvalSystem = signMapper.getApprovalSystem(type_code, recv_id);
		int ing = approvalSystem.getIng();
		int last = approvalSystem.getLast();

		signMapper.reject(Doc);
		signMapper.approvals_sub(Doc, ing, last, 2, recv_id, type_code);
		System.out.println("반려 완료");
	}

	@RequestMapping(value = "/signs/docAtypicalView", method = RequestMethod.GET)
	public ModelAndView showDoc(@RequestParam("Doc") String Doc, Principal principal) {
		System.out.println(Doc);
		ModelAndView mv = new ModelAndView("popUp/signs/DocAtypicalView");
		// 문서의 정보를 가져온다
		mv.addObject("approval", signMapper.getApproval(Doc));
		// 만약 상태가 0이면서 recv_id가 자신이면 보이게 하기 위해 jsp에 자신의 아이디의 정보를 보낸다
		String email = principal.getName();
		mv.addObject("principal", email);
		
		mv.addObject("sendName",commonMapper.getEmailFromUsers(email));

		// manager의 정보를 가져온다
		Approval approval = signMapper.getApproval(Doc);
		String type_code = approval.getType_code();
		List<ApprovalSystem> approvalSystem = signMapper.getApprovalSystemList(type_code);
		mv.addObject("approvalSystem", approvalSystem);
		System.out.println("정보:" + approvalSystem);

		// 해당 문서 번호에 대한 결재 된 정보를 모두 가져온다
		List<ApprovalSub> approvalSub = signMapper.getApprovalSubList(Doc); // 이미 없을듯? -> 이게 왜써있지 ㅋㅋ
		mv.addObject("approvalSub", approvalSub);
		System.out.println("approvalSub"+approvalSub);

		/*
		 * 다음 결재자가 몇밍인지 체크하기 위한 로직
		 */
		ApprovalSystem currentApprovalSystem = signMapper.getCurrent(type_code, email);
		// 현재 나의 번호를 가져온다 
		if(currentApprovalSystem != null){ // 내가 결재자에 포함되어 있지 않을 수도 있기 때문에 if를 걸어준다
			mv.addObject("currentIng", currentApprovalSystem.getIng());
		}
		mv.addObject("cntDoc", signMapper.cntApprovalSub(Doc));
		
		//이거를 어떻게 뿌려줄까................................ 
		/*
		 * json으로 해줘야 할까?
		 * 아니면  type==1000이면 무엇을 보내줄까?
		 * 항목 값 밸류 형식으로??
		 * 
		 */
		if(type_code.equals("1100")){ // 고장신청 문서이면
			BreakDownDocument breakDownDocument = signMapper.showBreakDownDocument(Doc);
			mv.addObject("map",breakDownDocument.getMap());
		}else{
			mv.addObject("map","aaaa");
		}
		return mv;
	}

	@RequestMapping(value = "/signs/recv", method = { RequestMethod.GET })
	public ModelAndView recv(@RequestParam(value = "type", defaultValue = "recvWaiting") String type,
			Principal principal, HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView("signs/" + type); // 진행, 대기, 승인, 반려
																// 페이지로 이동
		String email = principal.getName(); // 로그인한 사람의 계정
		List<Approval> approval = null;
		switch (type) {
			case "recvWaiting": {
				approval = signMapper.showRecvWaitingList(email);
				break;
			}
			case "recvIng": {
				approval = signMapper.showRecvIngList(email);
				break;
			}
			case "recvApproval": {
				approval = signMapper.showRecvApprovalList(email);
				break;
			}
			case "recvReject": {
				approval = signMapper.showRecvRejectList(email);
				break;
			}
			default: {
				System.out.println("Recvdefault");
			}
		}
		if(approval != null){ // approval에 데이터가 있다면 send_id를 getEmailFromUsers를 통해서 사용자의 이름을 가져온다.
			for(int i=0; i<approval.size(); i++){
				approval.get(i).setSend_id(commonMapper.getEmailFromUsers(approval.get(i).getSend_id()));
			}
			mv.addObject("approval",approval);
		}
		return mv;
	}

	@RequestMapping(value = { "/signs/send" }, method = { RequestMethod.GET })
	public ModelAndView send(@RequestParam(value = "type", defaultValue = "sendIng") String type, Principal principal) {
		ModelAndView mv = new ModelAndView("signs/" + type); // 진행, 대기, 승인, 반려
		String email = principal.getName();
		switch (type) {
			case "sendIng": {
				mv.addObject("approval", signMapper.showSendIng(email));
				break;
			}
			case "sendApproval": {
				mv.addObject("approval", signMapper.showSendApprovalList(email));
				break;
			}
			case "sendReject": {
				mv.addObject("approval", signMapper.showSendReject(email));
				break;
			}
			default: {
				System.out.println("Senddefault");
			}
		}
		return mv;
	}

}
