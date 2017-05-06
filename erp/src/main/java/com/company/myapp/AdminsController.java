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
	
	@RequestMapping(value ="/notices", method = RequestMethod.GET)
	public String index1(Model model){
		List<Board> boards = bookMapper.getBoardList();		
		model.addAttribute("boards", boards);		
		return "notices/index";
	}
	
	@RequestMapping(value = "notice", method = RequestMethod.POST) // 글쓰기
	public String createBoard(@ModelAttribute Board board,HttpServletRequest request){
		bookMapper.createBoard(board);
		return "redirect: " + request.getContextPath() + "/notices";
	}

	@RequestMapping(value ="/notice/view/{id}", method = RequestMethod.GET)
	public String adminViewBoard(@PathVariable int id, Model model){
		Board board = bookMapper.getBoard(id);
		model.addAttribute("board", board);
		return "notices/view";
	}
	
	@RequestMapping(value ="/notice/new")
	public String newBoard(){
		return "notices/new";
	}

	@RequestMapping(value = "/notice/update", method = RequestMethod.POST) // 수정
	public String update(@ModelAttribute Board board, HttpServletRequest request) {
		System.out.println(board.toString());
	    bookMapper.updateNotice(board);
	    return "redirect: " + request.getContextPath() + "/notices";
//	    return "";
	}
	
	@RequestMapping(value = "/notice/edit/{id}", method = RequestMethod.GET)
	public String edit(@PathVariable int id, Model model) {
	    Board board = bookMapper.getBoard(id);
	    // 뷰 페이지로 데이터를 전달(key/value 형식)
	    model.addAttribute("board", board);
	    return "notices/edit";
	}
	
	
}
