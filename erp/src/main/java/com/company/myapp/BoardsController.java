package com.company.myapp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mycompany.mapper.BookMapper;
//import com.mycompany.mapper.BoardMapper;
import com.mycompany.vo.Board;

@Controller
public class BoardsController {
//	private BoardMapper boardMapper;
	@Autowired		
	private BookMapper bookMapper;
	
	@RequestMapping(value ="/notices", method = RequestMethod.GET)
	public String index1(Model model){
		List<Board> boards = bookMapper.getBoardList();		
		model.addAttribute("boards", boards);		
		return "notices/index";
	}
	
	
	
}
