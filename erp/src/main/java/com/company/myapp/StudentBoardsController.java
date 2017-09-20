package com.company.myapp;

import java.io.IOException;
import java.io.InputStream;
import java.security.Principal;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.mycompany.mapper.BookMapper;
import com.mycompany.mapper.userMapper;
import com.mycompany.vo.Practiceroom;
import com.mycompany.vo.StudentBoard;
import com.mycompany.vo.User;

@Controller
public class StudentBoardsController {
	@Autowired
	private BookMapper bookMapper;

	@Autowired
	private PracticeService practiceMapper;

	@Autowired
	private userMapper userMapper;

	@RequestMapping(value = "/students", method = RequestMethod.GET)
	public String index1(Model model, HttpServletRequest request, Practiceroom pr) {

		System.out.println("pr.getNo() ===>" + pr.getNo());
		List<StudentBoard> studentboards = bookMapper.getStudentBoardList();
		model.addAttribute("studentboards", studentboards);

		Practiceroom pv = practiceMapper.selectpractice(pr);
		model.addAttribute("pv", pv);

		model.addAttribute("pno", pr.getNo());
		return "students/index";
	}

	@RequestMapping(value = "/studentsUpdt", method = RequestMethod.GET)
	public String studentsUpdt(Model model, HttpServletRequest request, Practiceroom pr) {

		// int no = Integer.parseInt(request.getParameter("no"));
		List<StudentBoard> studentboards = bookMapper.getStudentBoardList();
		model.addAttribute("studentboards", studentboards);

		Practiceroom pv = practiceMapper.selectpractice(pr);
		model.addAttribute("pv", pv);

		model.addAttribute("pno", pr.getNo());
		return "students/index_updt";
	}

	@RequestMapping(value = "/studentsUpdt", method = RequestMethod.POST)
	public String studentsUpdtOk(Model model, HttpServletRequest request, HttpServletResponse response,
			MultipartHttpServletRequest multipartRequest) throws Exception {

		String filePath = "/spring/upload";

		Practiceroom pr = new Practiceroom();
		try {
			Map<String, List<String>> fileNames = new HandlerFile(multipartRequest, filePath).getUploadFileName();

			if (fileNames != null) {
				List<String> oldNames = fileNames.get("oldNames");
				List<String> saveNames = fileNames.get("saveNames");
				List<String> names = fileNames.get("names");

				if (oldNames != null) {

					for (int i = 0; i < oldNames.size(); i++) {

						if (names.get(i).equals("img1_org")) {
							pr.setImg1_fake(saveNames.get(i));
							pr.setImg1_org(oldNames.get(i));
						} else if (names.get(i).equals("img2_org")) {
							pr.setImg2_fake(saveNames.get(i));
							pr.setImg2_org(oldNames.get(i));
						} else if (names.get(i).equals("img3_org")) {
							pr.setImg3_fake(saveNames.get(i));
							pr.setImg3_org(oldNames.get(i));
						}
						else if (names.get(i).equals("img4_org")) {
							pr.setImg4_fake(saveNames.get(i));
							pr.setImg4_org(oldNames.get(i));
						}
					}
				}
			}

			pr.setProgram(request.getParameter("program"));
			pr.setInformation(request.getParameter("information"));
			pr.setNo(Integer.valueOf(request.getParameter("no")));

			// TODO 서버 반영시 제거
			System.out.println(pr);
			System.out.println(request.getParameter("program"));
			System.out.println(request.getParameter("information"));
			System.out.println(request.getParameter("no"));

			practiceMapper.updatepractice(pr);

	
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return "redirect:/students?no=" + pr.getNo();
	}

	@RequestMapping(value = "/studentsUpdt2")
	public String studentsUpdtOk2(HttpServletRequest request, Practiceroom pr, @ModelAttribute PracticeDao practice)
			throws Exception {

		try {
			practiceMapper.updatepractice(pr);
			return "redirect: " + request.getContextPath() + "/students";
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("error");
			e.printStackTrace();
		}
		return "students/index";
	}

	@RequestMapping(value = "student", method = RequestMethod.POST) // 글쓰기
	public String createStudentBoard(@ModelAttribute StudentBoard studentboard, HttpServletRequest request,
			Model model) {
		bookMapper.createStudent(studentboard);
		return "redirect: " + request.getContextPath() + "/students";
	}

	@RequestMapping(value = "/students/view/{id}", method = RequestMethod.GET)
	public String adminViewBoard(@PathVariable int id, Model model) {
		StudentBoard studentboard = bookMapper.getStudentBoard(id);
		model.addAttribute("studentboard", studentboard);
		bookMapper.updateStudentHit(id);
		return "students/view";
	}

	@RequestMapping(value = "/students/new")
	public String newStudentBoard(ModelMap model, Principal principal) {
		String email = principal.getName(); // 사용자의 아이디(email)를 가져옴
		User user = userMapper.getUserList(email);
		String name = user.getName();
		model.addAttribute("username", name); // 사용자 이름을 username으로 파싱해줌
		return "students/new";
	}

	@RequestMapping(value = "/student/update", method = RequestMethod.POST) // 수정
	public String update(@ModelAttribute StudentBoard studentboard, HttpServletRequest request) {
		bookMapper.updateStudent(studentboard);
		return "redirect: " + request.getContextPath() + "/students";
	}

	@RequestMapping(value = "/student/edit/{id}", method = RequestMethod.GET)
	public String edit(@PathVariable int id, Model model) {
		StudentBoard studentboard = bookMapper.getStudentBoard(id);
		// 뷰 페이지로 데이터를 전달(key/value 형식)
		model.addAttribute("studentboard", studentboard);
		return "students/edit";
	}

	@RequestMapping(value = "/student/delete/{id}", method = RequestMethod.GET)
	public String delete(@PathVariable int id) {
		bookMapper.deleteStudent(id);
		return "redirect:/students";
	}

}
