package com.company.myapp;

import java.security.Principal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mycompany.mapper.BoardMapper;
import com.mycompany.mapper.CommonMapper;
import com.mycompany.mapper.MessageMapper;
import com.mycompany.mapper.SignMapper;
import com.mycompany.mapper.userMapper;
import com.mycompany.vo.Approval;
import com.mycompany.vo.Board;
import com.mycompany.vo.Message;
import com.mycompany.vo.workExcel;

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
	
	@Autowired
	private SignMapper signMapper;
	
	@Autowired
	private userMapper userMapper;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private ExcelService excelService;
	
	@RequestMapping(value ="/", method = RequestMethod.GET)
	public String index(Model model){
		return "redirect:/index";
	}		
	
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String goToIndex(HttpServletRequest request, HttpServletResponse response, Model model, Principal principal, HttpSession session) throws ParseException {
		int i;
		String name = principal.getName(); 
	    model.addAttribute("username", name);
	   
		List<Board> boards = boardMapper.mainBoardList();
		ArrayList<String> noticeTime = new ArrayList<String>();
		for(i=0; i<boards.size(); i++){
			noticeTime.add(formatTimeString(boards.get(i).getRegister_date()));
		}
		model.addAttribute("noticeTotal", boardMapper.getCountBoard());
		model.addAttribute("boards", boards);
		model.addAttribute("noticeTime",noticeTime);
		String recv_id = name;
		List<Message> myMessages = messageMapper.getMyMessageLimit(recv_id);
		ArrayList<String> messageTime = new ArrayList<String>();
		ArrayList<String> profileImagePath = new ArrayList<String>();
		
		for(i=0; i<myMessages.size(); i++){
			messageTime.add(formatTimeString(myMessages.get(i).getSend_date()));
			profileImagePath.add(userMapper.selectProfileImageByEmail(myMessages.get(i).getSend_id()));
			myMessages.get(i).setSend_id(commonMapper.getEmailFromUsers(myMessages.get(i).getSend_id()));
		}
		String email = name;
		model.addAttribute("myMessages",myMessages);
		model.addAttribute("messageTime",messageTime);
		model.addAttribute("messageTotal",userService.getNoticeTotal(recv_id));
		
		session.setAttribute("sessionUserName", commonMapper.getEmailFromUsers(email)); // 유저 이름 저장
		session.setAttribute("sessionMyMessages", myMessages); // 세션에 저장
		session.setAttribute("sessionSendUserProfileImagePath",profileImagePath); // 보낸이의 프로필 사진 경로 저장
		List<Approval> approval = signMapper.showRecvWaitingList(email);
		ArrayList<String> approvalTime = new ArrayList<String>();
		for(i=0; i<approval.size(); i++){
			approvalTime.add(formatTimeString(approval.get(i).getRegister_date()));
		}
		model.addAttribute("approval",approval);
		model.addAttribute("approvalTime",approvalTime);
		model.addAttribute("approvalTotal", signMapper.getApprovalTotalCount(email));
		
		List<workExcel> workExcel = excelService.myworkList(email);
		ArrayList<String> workExcelTime = new ArrayList<String>();
		SimpleDateFormat transFormatYMD = new SimpleDateFormat("yyyy-MM-dd");

		String startTime[]; // 시작시간 
		String endTime[]; // 종료시간
		String endSubStart[]; // 종료시간-시작시간
		for(i=0; i<workExcel.size(); i++){
			startTime = workExcel.get(i).getStartTime().split(":"); // :로 나눠서 배열에 저장
			endTime = workExcel.get(i).getEndTime().split(":"); // :로 나눠서 배열에 저장
			endSubStart = workExcel.get(i).getEndSubStart().split(":"); // :로 나눠서 배열에 저장
			workExcelTime.add(formatTimeString(transFormatYMD.parse(workExcel.get(i).getWorkDate())));
			workExcel.get(i).setStartTime(startTime[0]+":"+startTime[1]);
			workExcel.get(i).setEndTime(endTime[0]+":"+endTime[1]);
			workExcel.get(i).setEndSubStart(endSubStart[0]+":"+endSubStart[1]);
		}
		model.addAttribute("mywork", workExcel);
		model.addAttribute("myworkTime", workExcelTime);
		model.addAttribute("myworkTotalCount",excelService.getMyworkTotalCount(email));
		
		
		Cookie[] getCookie = request.getCookies();
		int cnt=0;
		if(getCookie != null){
			for(i=0; i< getCookie.length; i++){
				Cookie c = getCookie[i];
				if((c.getName().equals("visit"))){ // 만약 쿠키 이름 중 'visit'이 있으면 cnt하고 break;
					cnt++;
					break;
				}
			}
			if(cnt == 0){ // 'visit' 쿠키가 없으면 생성해줌
				Cookie setCookie = new Cookie("visit",principal.getName());
				setCookie.setMaxAge(60*60*24); // 기간을 하루로 지정
				response.addCookie(setCookie);
				commonMapper.insertToday(); // DB에 오늘 날짜 추가
			}
		}
		JSONObject jsonObject = new JSONObject();
		JSONArray array = new JSONArray();
		JSONObject info;
		
		for(i=0; i<5; i++){
			Calendar c1 = new GregorianCalendar();
			c1.add(Calendar.DATE, -i);
			String d = transFormatYMD.format(c1.getTime());
			info = new JSONObject();
			info.put("visitCount", commonMapper.getTodayCount(d));
			info.put("date", d);
			array.add(info);
		}
		jsonObject.put("graph", array); // 다끝나고 이거
		
		//http://huskdoll.tistory.com/38
		model.addAttribute("morrisData", jsonObject);
		
		
		return "mains/index";
	}
	
	@RequestMapping(value= "/books/test", method = RequestMethod.GET)
	public String tt(HttpServletRequest request, HttpServletResponse response){
		// 특정 쿠키만 삭제하기
	    Cookie kc = new Cookie("visit", null) ;
	    kc.setMaxAge(0) ;
	    response.addCookie(kc) ;
	    System.out.println("쿠키제거");

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



