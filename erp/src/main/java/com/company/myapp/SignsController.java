package com.company.myapp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mycompany.mapper.BookMapper;
import com.mycompany.vo.Sign;

@Controller
public class SignsController {
	@Autowired
	private BookMapper bookMapper;
	
	@RequestMapping(value ="/signs", method = RequestMethod.GET)	
	public String indexSigns(Model model){
		List<Sign> signs = bookMapper.getSignList();
		return "signs/index";
	}
	
	@RequestMapping(value="/signs/stockDoc", method=RequestMethod.GET)
	public String stockDoc(){
		return "popUp/signs/authorizationStockDoc";
	}
}
