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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.mycompany.mapper.BoardMapper;
import com.mycompany.mapper.FileMapper;
import com.mycompany.mapper.userMapper;
import com.mycompany.vo.Board;
import com.mycompany.vo.Comment;
import com.mycompany.vo.FileForm;
import com.mycompany.vo.Files;
import com.mycompany.vo.User;
import com.company.myapp.UserService;
import com.company.myapp.CommonCollectClass;
//http://daitso.kds.co.kr/44499/
// Java Annotation 을 이용한 Ibatis 개발

@Controller
//@SessionAttributes(value = { "sessionUser" })
public class BoardsController {
	CommonCollectClass collect = new CommonCollectClass(); // 파일 업로드 경로를 가져온다
	
	static int cnt = 0;

	@Autowired
	private BoardMapper boardMapper;
	
	@Autowired
	private FileMapper fileMapper;
	
	@Autowired
	private userMapper userMapper;
	
	@Autowired
	private UserService userService;
	/*
	 * Required 애트리뷰트를 false로 설정하면 스프링이 호환되는 빈을 찾지 못하여도, 예외처리 없이 프로퍼티를 설정하지 않은
	 * 채로 남겨둘 것이다.
	 */

	@RequestMapping(value = "/notices", method = RequestMethod.GET) // 게시판 리스트 가져오기
	public String index(Model model, @RequestParam(value = "page", defaultValue = "1") int page,
			@RequestParam(value = "word", required = false) String word) {

		List<Board> boards = boardMapper.getBoardList();
		model.addAttribute("boards", boards);

		List<Board> boardList = userService.getNoticeList(page, word);
//		System.out.println(boardList);
		model.addAttribute("boardList", boardList);
		model.addAttribute("page", page);
		model.addAttribute("lastPage", userService.getNoticeLastPage());
		return "notices/index";
	}
	
	@RequestMapping(value = "/notice/update", method = RequestMethod.POST) // 수정
	public String update(@ModelAttribute("inputForm") FileForm uploadForm, @ModelAttribute Board board, HttpServletRequest request, MultipartHttpServletRequest multipartRequest, @RequestParam(value = "page") int page) throws Exception{
		System.out.println("/notice/update 왔다간당");
		boardMapper.updateNotice(board);

		// 파일 업로드 시작하는 부분 
		int no = board.getId();
		Date dt = new Date();
		// success.jsp로 보낼 파일 이름 저장
		List<String> fileNames = new ArrayList<String>();
		
		List<MultipartFile> files = uploadForm.getFiles();
		if (null != files && files.size() > 0) { // 파일이 존재하면
			for (MultipartFile multipartFile : files) {
				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddhhmmss"); // 날짜 포맷 형식
				String sdfFiletoString = sdf.format(dt).toString(); // 날짜 형식을 저장할 공간
				String fileName = multipartFile.getOriginalFilename(); // 파일의 실제 이름을 가져옴.
				System.out.println("파일의 이름 : "+fileName);
				String pattern = "(.*)\\.(.*)"; // 정규식
				Pattern p = Pattern.compile(pattern); // 패턴을 컴파일
				Matcher m = p.matcher(fileName); // fileName에 정규식 적용
				String extension = "";
				String extensionCheck = "(txt|pdf|pptx|docx|hwp|xls|xlsx|png|PNG|jpg|JPG|war|zip|egg|sql)"; // 파일 형식 제어
//				String fileUploadPath = "/root/upload/";
				String fileUploadPath = collect.getCommonUploadPath();
				
				// 디렉토리가 없으면 생성해준다
				File fileuploadPath = new File(fileUploadPath);
				if(!fileuploadPath.exists()) fileuploadPath.mkdirs(); 
				//
				
				while (m.find()) {
					extension = m.group(2); // 확장자를 저장
				}
				if (Pattern.matches(extensionCheck, extension)) { // 확장자 검사를 만족하면 디비에 넣는다.
					if (cnt != 0) // for문 안에 cnt값이 있으면 계속 0 으로 초기화 되기 때문에
									// static으로 선언
					sdfFiletoString += cnt; // 다중 업로드 시 파일 이름을 다르게 해준다.
//					bookMapper.insertFiles(no, sdfFiletoString + "." + extension, fileName, uploadForm.getUpDir()); // 파일 디비 저장
					fileMapper.insertFiles(no, sdfFiletoString + "." + extension, fileName, fileUploadPath); // 파일 디비 저장

					cnt++; // 다중 업로드 인지 확인하는 부분.
//					String path = uploadForm.getUpDir() + sdfFiletoString + "." + extension; // 실제 파일 저장 하는 부분. 경로+이름+확장자
					String path = fileUploadPath + sdfFiletoString + "." + extension; // 실제 파일 저장 하는 부분. 경로+이름+확장자
					File f = new File(path);
					multipartFile.transferTo(f);
					fileNames.add(fileName);
				} else {
					// 뭔가 처리를 해줘야 하는데..
				}
			}
		}
		
//		System.out.println("page : "+page);
		return "redirect:/notice/view/"+no+"?page="+page;
//		<th><a href="<c:url value="/notice/view/${ board.id }?page=${page }" /> ">
//		return "redirect:/notices";
//		/notice/view/{id}
//		return "notices/index";
	}
	
	@RequestMapping(value = "/notice", method = RequestMethod.POST) // 글쓰기
	public String createBoard(@ModelAttribute("inputForm") FileForm uploadForm, Model map, @ModelAttribute Board board,
			HttpServletRequest request, Model model) throws Exception {
		boardMapper.createNotice(board); // 게시글 생성 후 번호를 받아와야 한다..................
		int no = boardMapper.getLastID(); // 생성 후 바로 게시글의 번호를 가져오는 과정.
		List<MultipartFile> files = uploadForm.getFiles(); // 
		System.out.println("files:"+files);
		Date dt = new Date();
		// success.jsp로 보낼 파일 이름 저장
		List<String> fileNames = new ArrayList<String>();
		
		if (null != files && files.size() > 0) { // 파일이 존재하면
			for (MultipartFile multipartFile : files) {
				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddhhmmss"); // 날짜 포맷 형식
				String sdfFiletoString = sdf.format(dt).toString(); // 날짜 형식을 저장할 공간
				String fileName = multipartFile.getOriginalFilename(); // 파일의 실제 이름을 가져옴.
				System.out.println("파일의 이름 : "+fileName);
				String pattern = "(.*)\\.(.*)"; // 정규식
				Pattern p = Pattern.compile(pattern); // 패턴을 컴파일
				Matcher m = p.matcher(fileName); // fileName에 정규식 적용
				String extension = "";
				String extensionCheck = "(txt|pdf|pptx|docx|hwp|xls|xlsx|png|PNG|jpg|JPG|war|zip|egg|sql|SQL)"; // 파일 형식 제어
//				String fileUploadPath = "/root/upload/";
				String fileUploadPath = collect.getCommonUploadPath();
				
				// 디렉토리가 없으면 생성해준다
				File fileuploadPath = new File(fileUploadPath);
				if(!fileuploadPath.exists()) fileuploadPath.mkdirs(); 
				//
				
				while (m.find()) {
					extension = m.group(2); // 확장자를 저장
				}
				if (Pattern.matches(extensionCheck, extension)) { // 확장자 검사를 만족하면 디비에 넣는다.
					if (cnt != 0) // for문 안에 cnt값이 있으면 계속 0 으로 초기화 되기 때문에
									// static으로 선언
					sdfFiletoString += cnt; // 다중 업로드 시 파일 이름을 다르게 해준다.
//					bookMapper.insertFiles(no, sdfFiletoString + "." + extension, fileName, uploadForm.getUpDir()); // 파일 디비 저장
					fileMapper.insertFiles(no, sdfFiletoString + "." + extension, fileName, fileUploadPath); // 파일 디비 저장

					cnt++; // 다중 업로드 인지 확인하는 부분.
//					String path = uploadForm.getUpDir() + sdfFiletoString + "." + extension; // 실제 파일 저장 하는 부분. 경로+이름+확장자
					String path = fileUploadPath + sdfFiletoString + "." + extension; // 실제 파일 저장 하는 부분. 경로+이름+확장자
					File f = new File(path);
					multipartFile.transferTo(f);
					fileNames.add(fileName);
				} else {
					// 뭔가 처리를 해줘야 하는데..
				}
			}
		}
		return "redirect:/notices";
//		return "redirect: " + request.getContextPath() + "/notices";
	}

	@ResponseBody
	@RequestMapping(value="/testUploadRemove", method = RequestMethod.GET) // 게시판 삭제시
//	public void  testUpload(@RequestParam(value="fileArray[]")List <String> arrayParams, @RequestParam(value="fileNo[]")List <String> arrayNos, @RequestParam(value="testArray[]")ArrayList <String> arrayTest){
	public void  testUpload(@RequestParam(value="testArray[]")ArrayList <String> arrayTest){ // testArray[]를 파라메터 값으로 받는다.
		System.out.println("/testUploadRemove 진입");	
		System.out.println("array:"+arrayTest);
		for(int j=0; j< arrayTest.size(); j++){ // 효율적인 방법은 아닌 것 같지만 일단 구현. 이 방식이 비효율적인 이유는 항상 인덱스가 0부터 size까지 돌기 때문이다
		
		List<Files> files;
		files = fileMapper.getFileEditUpLoadList(Integer.parseInt(arrayTest.get(j).trim())); // 해당하는 값을 List로 받아온다.
		
		//디비에서 번호로 삭제하는 파일의 이름을 가져와야 한다
		System.out.println("files:"+files);
		for (int i = 0; i < files.size(); i++) {
			File f = new File(files.get(i).getPath() + files.get(i).getSave_name()); // 저장한 이름을 가져온다.
			if (f.delete()) { // 삭제한다.
				System.out.println(files.get(i).getPath() + files.get(i).getSave_name());
				System.out.println("삭제 성공!" + files.get(i).getSave_name());
			}else {
				System.out.println(files.get(i).getPath() + files.get(i).getSave_name());
				System.out.println("삭제 실패!" + files.get(i).getSave_name());
			}
		}
		fileMapper.deleteFileInEdit(Integer.parseInt(arrayTest.get(j).trim())); // 디비에서 삭제
		}
	}
	
	//파일 다운로드
	@RequestMapping("/download.action")
	public ModelAndView download(@RequestParam("name") String name) {
		System.out.println(name);
		ModelAndView mav = new ModelAndView();
		// 파라미터를 이용하여 file객체 생성
//		File f = new File("c:/Spring/upload/" + name); // 경로에 있는 파일을 가져온다
//		File f = new File("/root/upload/" + name); // 경로에 있는 파일을 가져온다
		File f = new File(collect.getCommonUploadPath() + name); // 경로에 있는 파일을 가져온다
		
		// file 객체를 저장
		String real_name = fileMapper.getRealName(name); // 디비에서 실제 이름을 가져온다.
		mav.addObject("real_name", real_name);
		mav.addObject("download", f);
		// 출력할 뷰이름 설정
		mav.setViewName("download"); // 여기서 DownloadView.java로 이동
		// mav.setViewName("");
		return mav;
	}

	@RequestMapping(value = "/notice/view/{id}", method = RequestMethod.GET) // 게시판 보기
	public String adminViewBoard(@PathVariable int id, Model model, Principal principal,
			@RequestParam(value = "page") int page) {
		String name = principal.getName(); // 아이디를 가져온다
		Board board = boardMapper.getBoard(id);
		model.addAttribute("board", board);
		model.addAttribute("username", name);
		boardMapper.updateNoticeHit(id); // 조회수 1 증가

		model.addAttribute("page", page); // 게시판 페이지 번호

		// 댓글 가져오기 왜 2개지? 정리 필요 할듯;
		List<Comment> comments = boardMapper.getComments(id); // 코멘트 가져오기
		model.addAttribute("comments", comments);

		Comment comment = new Comment();
		comment.setBoard_no(id);
		model.addAttribute("comment", comment);

		// 업로드 파일 가져오기
		List<Files> files = fileMapper.getFileList(id);
		model.addAttribute("files", files);
		
		model.addAttribute("page",page);

		return "notices/view";
	}

	@RequestMapping(value = "/notice/new", method = RequestMethod.GET)
	public String newBoard(ModelMap model, Principal principal) {
		String email = principal.getName(); // 사용자의 아이디(email)를 가져옴
		User user = userMapper.getUserList(email);
		String name = user.getName();
		model.addAttribute("username", name); // 사용자 이름을 username으로 파싱해줌
		return "notices/new";
	}

//	@RequestMapping(value = "/notice/update", method = RequestMethod.POST) // 수정
//	public String update(@ModelAttribute Board board, HttpServletRequest request) {
//		bookMapper.updateNotice(board);
//		List<String> fileNames = new ArrayList<String>();
//		
//		
//		return "redirect: " + request.getContextPath() + "/notices";
//	}

	@RequestMapping(value = "/notice/edit/{id}", method = RequestMethod.GET) // 수정 모드 
	public String edit(@ModelAttribute("inputForm") FileForm uploadForm, @PathVariable int id, Model model, @RequestParam(value = "page") int page) {
		// @PathVariable int id는 value에 속해있어야함. 
		// @RequestParam(value = "page") int page는 실제 url에서 page라는 값이 있는지 판단
		Board board = boardMapper.getBoard(id);
		// 뷰 페이지로 데이터를 전달(key/value 형식)
		model.addAttribute("board", board);
		
		// 업로드 파일 가져오기
		List<Files> files = fileMapper.getFileList(id);
		System.out.println(files);
		model.addAttribute("files", files);
		model.addAttribute("no",id); // 글 no가 몇인지 ?
		model.addAttribute("page",page); // 몇페이지인지?
		
		return "notices/edit";
	}

	@RequestMapping(value = "/notice/delete/{id}", method = RequestMethod.GET)
	public String delete(@PathVariable int id) {
		boardMapper.deleteNotice(id);
		List<Files> files = fileMapper.getFileList(id); // 해당하는 값을 List로 받아온다.
		for (int i = 0; i < files.size(); i++) {
			File f = new File(files.get(i).getPath() + files.get(i).getSave_name()); // 저장한 이름을 가져온다.
			if (f.delete()) { // 삭제한다.
				System.out.println("삭제 성공!" + files.get(i).getSave_name());
			} else {
				System.out.println("삭제 실패!" + files.get(i).getSave_name());
			}
		}
		return "redirect:/notices";
	}
}