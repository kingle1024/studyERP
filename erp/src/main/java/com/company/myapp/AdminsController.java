package com.company.myapp;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mycompany.mapper.BookMapper;
import com.mycompany.vo.Board;
import com.mycompany.vo.User;


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
	public String createBoard(@ModelAttribute Board board,HttpServletRequest request, Model model){
		bookMapper.createNotice(board);
		return "redirect: " + request.getContextPath() + "/notices";
	}

	@RequestMapping(value ="/notice/view/{id}", method = RequestMethod.GET)
	public String adminViewBoard(@PathVariable int id, Model model){
		Board board = bookMapper.getBoard(id);
		model.addAttribute("board", board);
		bookMapper.updateNoticeHit(id);
		return "notices/view";
	}
	
	@RequestMapping(value ="/notice/new")
	public String newBoard(ModelMap model, Principal principal){
		String email = principal.getName(); // 사용자의 아이디(email)를 가져옴
		User user = bookMapper.getUserList(email);
		String name = user.getName();
		model.addAttribute("username", name); // 사용자 이름을 username으로 파싱해줌
		return "notices/new";
	}

	@RequestMapping(value = "/notice/update", method = RequestMethod.POST) // 수정
	public String update(@ModelAttribute Board board, HttpServletRequest request) {
	    bookMapper.updateNotice(board);
	    return "redirect: " + request.getContextPath() + "/notices";
	}
	
	@RequestMapping(value = "/notice/edit/{id}", method = RequestMethod.GET)
	public String edit(@PathVariable int id, Model model) {
	    Board board = bookMapper.getBoard(id);
	    // 뷰 페이지로 데이터를 전달(key/value 형식)
	    model.addAttribute("board", board);
	    return "notices/edit";
	}
	
	@RequestMapping(value = "/notice/delete/{id}", method = RequestMethod.GET)
	public String delete(@PathVariable int id){
		bookMapper.deleteNotice(id);
		return "redirect:/notices";
	}
}
