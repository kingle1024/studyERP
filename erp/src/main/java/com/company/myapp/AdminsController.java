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
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import com.mycompany.mapper.BookMapper;
import com.mycompany.vo.Board;
import com.mycompany.vo.Comment;
import com.mycompany.vo.FileForm;
import com.mycompany.vo.Files;
import com.mycompany.vo.User;
import com.company.myapp.UserService;
//http://daitso.kds.co.kr/44499/
// Java Annotation 을 이용한 Ibatis 개발
@Controller
@SessionAttributes(value={"sessionUser"})
public class AdminsController {
	static int cnt = 0; 
	
	@Autowired		
	private BookMapper bookMapper;
	
	 @Autowired
	    private UserService userService;
	/*
	 * Required 애트리뷰트를 false로 설정하면 스프링이 호환되는 빈을 찾지 못하여도, 예외처리 없이 프로퍼티를 설정하지 않은 채로 남겨둘 것이다.
	 */
	
	@RequestMapping(value ="/notices", method = RequestMethod.GET) // 게시판 리스트 가져오기
	public String index(Model model ,@RequestParam(value="page", defaultValue="1") int page,
            @RequestParam(value="word", required=false) String word){
		
		List<Board> boards = bookMapper.getBoardList();		
		model.addAttribute("boards", boards);
		
		List<Board> boardList = userService.getNoticeList(page, word);
		model.addAttribute("boardList", boardList);
		model.addAttribute("page", page);
		model.addAttribute("lastPage", userService.getNoticeLastPage());
		return "notices/index";
	}
	
	@RequestMapping(value = "notice", method = RequestMethod.POST) // 글쓰기
	public String createBoard(@ModelAttribute("inputForm") FileForm uploadForm,
			Model map, @ModelAttribute Board board, HttpServletRequest request, Model model) throws Exception{
		bookMapper.createNotice(board); // 게시글 생성 후 번호를 받아와야 한다..................
		int no = bookMapper.getLastID(); // 생성 후 바로 게시글의 번호를 가져오는 과정.
		List<MultipartFile> files = uploadForm.getFiles(); 
		Date dt = new Date();
		//success.jsp로 보낼 파일 이름 저장
		List<String> fileNames = new ArrayList<String>();
		
		if(null != files && files.size() > 0 ){ // 파일이 존재하면
			for(MultipartFile multipartFile : files){
				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddhhmmss"); // 날짜 포맷 형식
				String sdfFiletoString = sdf.format(dt).toString(); // 날짜 형식을 저장할 공간
				String fileName = multipartFile.getOriginalFilename(); // 파일의 실제 이름을 가져옴.
				System.out.println(fileName);
				String pattern = "(.*)\\.(.*)"; // 정규식
				Pattern p = Pattern.compile(pattern); // 패턴을 컴파일 
				Matcher m = p.matcher(fileName); // fileName에 정규식 적용
				String extension="";
				String extensionCheck ="(txt|pdf|hwp|xls|png|PNG|jpg|JPG)"; // 파일 형식 제어
				
				while(m.find()){			
					extension = m.group(2); // 확장자를 저장
				}
				if(Pattern.matches(extensionCheck, extension)){ // 확장자 검사를 만족하면 디비에 넣는다.
					if(cnt !=0) // for문 안에 cnt값이 있으면 계속 0 으로 초기화 되기 때문에 static으로 선언
						sdfFiletoString+=cnt; // 다중 업로드 시 파일 이름을 다르게 해준다.
					bookMapper.insertFiles(no, sdfFiletoString+"."+extension, fileName, uploadForm.getUpDir()); // 파일 디비 저장
					
					cnt++; // 다중 업로드 인지 확인하는 부분. 
					String path = uploadForm.getUpDir() + sdfFiletoString+"."+extension; // 실제 파일 저장. 경로+이름+확장자
					File f = new File(path);
					
					multipartFile.transferTo(f);
					
					fileNames.add(fileName);
				}else{
					// 뭔가 처리를 해줘야 하는데..
				}
			}
		}
		return "redirect: " + request.getContextPath() + "/notices";
	}
 
	@RequestMapping(value ="/notice/view/{id}", method = RequestMethod.GET) // 게시판 보기
	public String adminViewBoard(@PathVariable int id, Model model, Principal principal){
		String name = principal.getName(); // 아이디를 가져온다
		Board board = bookMapper.getBoard(id); 
		model.addAttribute("board", board);
		model.addAttribute("username", name); 
		bookMapper.updateNoticeHit(id); // 조회수 1 증가
		
		// 댓글 가져오기 왜 2개지? 정리 필요 할듯;
		List<Comment> comments = bookMapper.getComments(id); // 코멘트 가져오기
		model.addAttribute("comments", comments);
		
		Comment comment = new Comment();
		comment.setBoard_no(id);
		model.addAttribute("comment",comment);
		
		// 업로드 파일 가져오기
		List<Files> files = bookMapper.getFileList(id);
		model.addAttribute("files", files);
		
		return "notices/view";
	}
	
	@RequestMapping(value ="/notice/new", method = RequestMethod.GET)
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
		List<Files> files = bookMapper.getFileList(id); // 해당하는 값을 List로 받아온다.
		for(int i=0; i<files.size(); i++){			
			File f = new File(files.get(i).getPath()+files.get(i).getSave_name()); // 저장한 이름을 가져온다. 
			if(f.delete()){ // 삭제한다.
				System.out.println("삭제 성공!"+files.get(i).getSave_name());
			}else{
				System.out.println("삭제 실패!"+files.get(i).getSave_name());
			}
		}
		return "redirect:/notices";
	}	
}