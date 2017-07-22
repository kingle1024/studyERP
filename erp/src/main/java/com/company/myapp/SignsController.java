package com.company.myapp;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

// 결재 Controller임. 현재는 쓰이는곳 없음
@Controller
public class SignsController {
	
	@RequestMapping(value ="/signs", method = RequestMethod.GET)	
	public String indexSigns(Model model){
		return "signs/index";
	}
	
	@RequestMapping(value="/signs/atypicalDoc", method=RequestMethod.GET)
	public String stockDoc(){
		return "popUp/signs/atypicalDoc";
	}
	
	 @RequestMapping(value={"/signs/test"}, method={RequestMethod.GET})
	  public String test()
	  {
	    return "popUp/signs/test";
	  }
	  
	  @RequestMapping(value={"/signs/recv"}, method={RequestMethod.GET})
	  public String recv()
	  {
	    return "signs/recvIndex";
	  }
	  
	  @RequestMapping(value={"/signs/send"}, method={RequestMethod.GET})
	  public String send()
	  {
	    return "signs/sendIndex";
	  }
}
