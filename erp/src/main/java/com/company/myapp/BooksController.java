package com.company.myapp;

import java.io.File;
import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.mycompany.mapper.BookMapper;
import com.mycompany.mapper.ReviewMapper;
import com.mycompany.vo.Review;
import com.mycompany.vo.Book;
import com.mycompany.vo.FileForm;

@Controller
public class BooksController {

	@Autowired
	private BookMapper bookMapper;
	@Autowired
	private ReviewMapper reviewMapper;

	
	@RequestMapping(value = "/books/{id}", method = RequestMethod.GET)
	public String show(@PathVariable int id, Model model) {
		Book book = bookMapper.getBook(id);
		model.addAttribute("book", book);
		List<Review> reviews = reviewMapper.getReviews(id); 
		model.addAttribute("reviews", reviews);
		
		if (! model.containsAttribute("review")) {
			Review review = new Review();
			review.setBookId(id);
			model.addAttribute("review", review);
		}
		
		return "books/show";
	}

	@RequestMapping(value = "/books", method = RequestMethod.GET)
	public String index(Model model) {
		List<Book> books = bookMapper.getList();
		model.addAttribute("books", books);
		return "books/index";
	}

	@RequestMapping(value = "/books/new", method = RequestMethod.GET)
	public String newBook() {
		return "books/new";
	}

	@RequestMapping(value = "/books", method = RequestMethod.POST)
//	public String create(@ModelAttribute Book book, @RequestParam MultipartFile file, HttpServletRequest request) {
	public String create(@ModelAttribute Book book, HttpServletRequest request) {
//		String fileUrl = FileHelper.upload("/uploads", file, request);
//		book.setImage(fileUrl);
		bookMapper.create(book);
		return "redirect:/books";
//		return "redirect: " + URLHelper.baseUrl("/books", request);
	}

	@RequestMapping(value = "/books/edit/{id}", method = RequestMethod.GET)
	public String edit(@PathVariable int id, Model model) {
		Book book = bookMapper.getBook(id);
		model.addAttribute("book", book);
		return "books/edit";
	}

	@RequestMapping(value = "/books/update", method = RequestMethod.POST)
	public String update(@ModelAttribute Book book) {
		bookMapper.update(book);
		return "redirect:/books";
	}

	@RequestMapping(value = "/books/delete/{id}", method = RequestMethod.GET)
	public String delete(@PathVariable int id) {
		bookMapper.delete(id);
		return "redirect:/books";
	}
	
	//파일 목록을 가져오는 메소드
	@RequestMapping(value="/books/test", method=RequestMethod.GET)
	public String indexTest(ModelMap model, Principal principal){
		List<String> list = new ArrayList<String>();
        File f = new File("c:\\Spring\\upload");
        //f에 모든 하위 디렉토리 및 파일이름 가져오기
        String[] names = f.list();
        //이름 들 중에서 . 이있는 이름만 list에 추가하기
        for(String sub : names){
            if(sub.indexOf('.') != -1){
                list.add(sub);
            }
        }
//        ModelAndView mav = new ModelAndView();        
//        mav.addObject("list",list);
//        mav.setViewName("list");
        model.addAttribute("list",list);
        System.out.println(list);
		return "books/testIndex";
	}
	// http://ojc.asia/bbs/board.php?bo_table=LecSpring&wr_id=295
	@RequestMapping(value="/books/test", method=RequestMethod.POST)
	public String indexTestPost(@ModelAttribute("uploadForm") FileForm uploadForm,
			Model map) throws Exception {
		List<MultipartFile> files = uploadForm.getFiles(); 
		Date dt = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddhhmmss"); // 날짜 포맷 형식 	
		//success.jsp로 보낼 파일 이름 저장
		List<String> fileNames = new ArrayList<String>();
		
		if(null != files && files.size() > 0 ){
			for(MultipartFile multipartFile : files){
				String fileName = multipartFile.getOriginalFilename(); // 파일이름. 추후에 디비에 저장해야함
				String pattern = "(.*)\\.(.*)"; // 정규식
				Pattern p = Pattern.compile(pattern); // 패턴을 컴파일 
				Matcher m = p.matcher(fileName); // fileName에 정규식 적용
				String extension="";
				String extensionCheck ="(txt|pdf|hwp|xls|png|jpg)$";
				while(m.find()){			
					extension = m.group(2); // 확장자를 저장
				}
				if(Pattern.matches(extensionCheck, extension)){
				
				String path = uploadForm.getUpDir() + sdf.format(dt).toString()+"."+extension; // 실제 파일 저장. 경로+이름+확장자
				
				File f = new File(path);
				
				multipartFile.transferTo(f);
				
				fileNames.add(fileName);
				}else{
					// 뭔가 처리를 해줘야 하는데..
				}
			}
		}
		return "books/testIndex";
	}
	// http://blog.naver.com/PostView.nhn?blogId=tkddlf4209&logNo=220579326002
//	@RequestMapping(value="/download/{name}", method=RequestMethod.GET)
//    public ModelAndView download(@PathVariable String name){
	
//	  @RequestMapping("/download.action")
//	    public ModelAndView download(@RequestParam("name") String name){
//		System.out.println("hi~");
//		System.out.println(name);
//        ModelAndView mav = new ModelAndView(); 
//        //파라미터를 이용하여 file객체 생성
//        File f = new File("c:\\Spring\\upload\\"+name); // 경로에 있는 파일을 가져온다
//        //file 객체를 저장
//        String real_name = bookMapper.getRealName(name); // 디비에서 실제 이름을 가져온다.
//        mav.addObject("real_name",real_name);
//        mav.addObject("download",f);
//        //출력할 뷰이름 설정
//        mav.setViewName("download"); // 여기서 DownloadView.java로 이동
////        mav.setViewName("");
//        return mav;
//    }
}
