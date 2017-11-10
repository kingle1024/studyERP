package com.company.myapp;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mycompany.mapper.BookMapper;
import com.mycompany.vo.Book;
@Controller
public class BookController {
   
   @Autowired
    private BookMapper bookMapper;
   
    @RequestMapping(value = "/table", method = RequestMethod.GET)
    public String index() {       
       
        return "table/index";        
    }
    
    @RequestMapping(value = "/table", method = RequestMethod.POST)
    public String create(@ModelAttribute Book book) {
       bookMapper.create(book);
        return "redirect:/mywork";
    }
    
  
}