package com.company.myapp;

import org.springframework.security.crypto.bcrypt.BCrypt;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.apache.ibatis.annotations.Param;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mycompany.vo.User;
import com.mycompany.mapper.BoardMapper;
import com.mycompany.mapper.userMapper;
@Controller
public class SessionsController {
	private static final Logger logger = LoggerFactory.getLogger(SessionsController.class);
	
	@Autowired
	private userMapper userMapper;
	
	@RequestMapping(value = "/signup", method= RequestMethod.POST) // 회원가입 클릭 시 
    public String create(@Valid @ModelAttribute User user, BindingResult result, RedirectAttributes flash){
		if (result.hasErrors()) {
			logger.info("에러 진입");
	        List<FieldError> fieldErrors = result.getFieldErrors();
	        flash.addFlashAttribute("fieldErrors", fieldErrors);
	        flash.addFlashAttribute("user", user);	        
	        return "popUp/statics/signup"; 
	    }
		user.setPassword(BCrypt.hashpw(user.getPassword(), BCrypt.gensalt(11)));
    	userMapper.insertUser(user);
    	userMapper.insertAuthority(user.getEmail(),  "ROLE_USER");
    	logger.info("회원가입 성공");
    	return "popUp/statics/login";
    }
	
	@RequestMapping(value="/termsConditions", method=RequestMethod.GET)
	public String termsConditions(){
		
		return "popUp/statics/termsAndConditions";
	}
	
    @RequestMapping(value = "/login", method = RequestMethod.GET) // 세션없이 접근했을때
    public String home() {
        return "popUp/statics/login";
    }
    
    @RequestMapping(value ="/signup", method = RequestMethod.GET) // 회원가입 페이지
    public String signup(Model model){
    	User user = new User();
    	model.addAttribute("user", user);
    	return "popUp/statics/signup";
    }
    
    //아이디 중복체크 하는 ajax 메소드
    @RequestMapping(value = "/duplicationCheck.do")
	public @ResponseBody Object duplicationCheck(@ModelAttribute("user") User user, @RequestParam("email") String email) throws Exception {
		String resultVO = userMapper.getUserEmail(email);
		return resultVO;
	}

}

