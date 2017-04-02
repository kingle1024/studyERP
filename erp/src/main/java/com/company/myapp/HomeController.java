package com.company.myapp;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mycompany.mapper.BookMapper;
import com.mycompany.vo.Board;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	@Autowired		
	private BookMapper bookMapper;	
	
	@RequestMapping(value ="/", method = RequestMethod.GET)
	public String index1(Model model){
//		List<Board> boards = boardMapper.getBoardList();
		List<Board> boards = bookMapper.getBoardList();		
		model.addAttribute("boards", boards);		
		return "mains/index";
		
	}		
	
}
