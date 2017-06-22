package com.company.myapp;

import java.security.Principal;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mycompany.mapper.BookMapper;
import com.mycompany.vo.Comment;

@Controller
public class CommentsController {
	@Autowired
	private BookMapper bookMapper;
	
	@RequestMapping(value ="/comments", method= RequestMethod.POST)
	public String index(@Valid @ModelAttribute Comment comment, BindingResult result, RedirectAttributes flash, ModelMap model, Principal principal){
		if (result.hasErrors()) { // 만약 에러면
			List<FieldError> fieldErrors = result.getFieldErrors();
			flash.addFlashAttribute("fieldErrors", fieldErrors);
			flash.addFlashAttribute("comment", comment);
			return "redirect:/notice/view/"+comment.getBoard_no();
		}
		
		bookMapper.createComment(comment); // 코맨트 등록 
		return "redirect:/notice/view/"+comment.getBoard_no();
	}
}
