package com.company.myapp;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mycompany.mapper.BookMapper;
import com.mycompany.vo.Board;


@Controller
public class AdminsController {
	@Autowired		
	private BookMapper bookMapper;
	
	@RequestMapping(value = "/admin", method = RequestMethod.GET)
	public String admin(Model model){
		List<Board> boards = bookMapper.getBoardList();
		model.addAttribute("boards", boards);
		return "admins/index";
	}
	
	@RequestMapping(value = "admin", method = RequestMethod.POST)
	public String createBoard(@ModelAttribute Board board,HttpServletRequest request){
		bookMapper.createBoard(board);
		return "redirect: " + request.getContextPath() + "/admin";
//		System.out.println(board.toString());
//		return "";
	}

	@RequestMapping(value ="/admin/viewBoard/{id}", method = RequestMethod.GET)
	public String adminViewBoard(@PathVariable int id, Model model){
		Board board = bookMapper.getBoard(id);
		model.addAttribute("board", board);
		return "admins/viewBoard";
	}
	
	@RequestMapping(value ="/admin/newBoard")
	public String newBoard(){
		return "admins/newBoard";
	}

}
