package com.company.myapp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mycompany.mapper.BookMapper;
import com.mycompany.vo.Product;

@Controller
public class ProductsController {
	@Autowired
	private BookMapper bookMapper;
	
	@RequestMapping(value ="/products", method = RequestMethod.GET)
	public String getProductList(Model model){
		List<Product> products = bookMapper.getProductList();		
		model.addAttribute("products", products);		
		return "products/index";		
	}
}
