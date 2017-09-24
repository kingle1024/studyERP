package com.company.myapp.myinfo;

import java.io.IOException;
import java.security.Principal;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import com.company.myapp.CommonCollectClass;
import com.mycompany.mapper.userMapper;
import com.mycompany.vo.FileForm;
import com.mycompany.vo.User;

@Controller
public class MyInfoController {
	private static final Logger logger = LoggerFactory.getLogger(MyInfoController.class);
	CommonCollectClass collect = new CommonCollectClass();
	
	@Autowired
	private userMapper userMapper;
	
	@RequestMapping(value="/myInfo", method=RequestMethod.GET)
	public ModelAndView myinfo(Principal principal, HttpServletRequest request){
		User user = userMapper.getUserList(principal.getName());
		ModelAndView mv = new ModelAndView("myPage/info");
		mv.addObject("user",user);

		return mv;
	}
	@RequestMapping(value="/myInfoEdit", method=RequestMethod.GET)
	public ModelAndView editMyInfo(Principal principal){
		User user = userMapper.getUserList(principal.getName());
		ModelAndView mv = new ModelAndView("myPage/edit");
		mv.addObject("user",user);
		return mv;
	}
	
	@RequestMapping(value="/myInfoEdit", method=RequestMethod.POST)
	public ModelAndView editMyInfoPost(HttpServletRequest request, @ModelAttribute("uploadForm") FileForm uploadForm, @ModelAttribute User user, MultipartHttpServletRequest multipartRequest, Principal principal) throws IOException{
		ModelAndView mv = new ModelAndView("redirect:/myInfo"); // 메인 페이지로 redirect 해준다
		String rootPath = request.getSession().getServletContext().getRealPath("/");
		String fileUploadPath = rootPath+"\\resources"+"\\image\\profileImage\\";
		System.out.println("fileUploadPath:"+fileUploadPath);
		HashMap<String, String> rs = collect.insertFileModule(-1, uploadForm, fileUploadPath);
		String email = principal.getName();
		if(rs.size() > 0){
			userMapper.updateUserProfilePath(rs.get("save_name"), email); // img 경로를 update 해준다.
		}
		user.setEmail(email); // email set
		userMapper.updateUserProfile(user); // edit
		return mv;
	}
}