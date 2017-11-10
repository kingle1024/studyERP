package com.company.myapp;

import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.mycompany.mapper.BookMapper;
import com.mycompany.mapper.userMapper;
import com.mycompany.vo.Practiceroom;
import com.mycompany.vo.Review;
import com.mycompany.vo.StudentBoard;
import com.mycompany.vo.User;

@Controller
public class StudentBoardsController {
	CommonCollectClass collect = new CommonCollectClass(); // 파일 업로드 경로를 가져온다
   @Autowired
   private BookMapper bookMapper;

   @Autowired
   private PracticeService practiceMapper;

   @Autowired
   private userMapper userMapper;

   @RequestMapping(value = "/students", method = RequestMethod.GET)
   public String index1(Model model, HttpServletRequest request, Practiceroom pr) {
      List<StudentBoard> studentboards = bookMapper.getStudentBoardList();
      for (int i = 0; i < studentboards.size(); i++) {
         studentboards.get(i).setUserID(bookMapper.getName(studentboards.get(i).getUserID()));
      }
      model.addAttribute("studentboards", studentboards);

      Practiceroom pv = practiceMapper.selectpractice(pr);
      model.addAttribute("pv", pv);
      model.addAttribute("pno", pr.getNo());
      return "students/index";
   }

   @RequestMapping(value = "/studentsUpdt", method = RequestMethod.GET)
   public String studentsUpdt(Model model, HttpServletRequest request, Practiceroom pr) {
      System.out.println("studentsUpdt"+pr.getNo());
      // int no = Integer.parseInt(request.getParameter("no"));
      List<StudentBoard> studentboards = bookMapper.getStudentBoardList();
      model.addAttribute("studentboards", studentboards);

      Practiceroom pv = practiceMapper.selectpractice(pr);
      model.addAttribute("pv", pv);

      model.addAttribute("pno", pr.getNo());
      return "students/index_updt";
   }

   @RequestMapping(value = "/studentsUpdt", method = RequestMethod.POST)
   public String studentsUpdtOk(@RequestParam(value="no") int no, Model model, HttpServletRequest request, HttpServletResponse response,
         MultipartHttpServletRequest multipartRequest) throws Exception {
      
      /*
       * String rootPath =
       * request.getSession().getServletContext().getRealPath("/"); String
       * fileUploadPath = rootPath+"\\resources"+"\\image\\profileImage\\";
       */
//      String filePath = "C:\\Spring\\upload\\";
      String filePath = collect.getCommonUserProfileImagePath();
//      String rootPath = request.getSession().getServletContext().getRealPath("/");
//      String filePath = rootPath+"/resources"+"/image/profileImage/";
      
      // String rootPath =
      // request.getSession().getServletContext().getRealPath("/");
//      String filePath = rootPath+"\\resources"+"\\image\\profileImage\\";
      System.out.println(filePath);
      Practiceroom pr = new Practiceroom();
      System.out.println("updt의 no:"+no);
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
                  } else if (names.get(i).equals("img4_org")) {
                     pr.setImg4_fake(saveNames.get(i));
                     pr.setImg4_org(oldNames.get(i));
                  }
               }
            }
         }

         pr.setProgram(request.getParameter("program"));
         pr.setInformation(request.getParameter("information"));
         pr.setNo(Integer.valueOf(request.getParameter("no")));

         System.out.println(pr);
         System.out.println(request.getParameter("program"));
         System.out.println(request.getParameter("information"));
         System.out.println(request.getParameter("no"));
         
         if(practiceMapper.updatepractice(pr) == 0){ // update할 것이 없으면 insert해주기
            practiceMapper.insertPractice(pr);
         }

         // System.out.println("pr.getImg1_org() ==>" + pr.getImg1_org());
         // System.out.println("asdfasdfasdf"+multipartRequest.getAttribute("img1_org").toString());
         // System.out.println("in");
         // int no = Integer.parseInt(request.getParameter("no"));
         // List<StudentBoard> studentboards =
         // bookMapper.getStudentBoardList();
         // model.addAttribute("studentboards", studentboards);
         /*
          * Practiceroom pv= practiceMapper.selectpractice(pr);
          * model.addAttribute("pv", pv);
          * 
          * model.addAttribute("pno",pr.getNo());
          */
      } catch (Exception e) {
         e.printStackTrace();
         System.out.println("예외처리됨");
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

   @RequestMapping(value = "/students/view/{uniqueID}", method = RequestMethod.GET)
   public String adminViewBoard(@PathVariable String uniqueID, Model model) {
      StudentBoard studentboard = bookMapper.getStudentBoard(uniqueID);
      studentboard.setUserID(bookMapper.getName(studentboard.getUserID()));
      model.addAttribute("studentboard", studentboard);
      /*
       * List<Review> reviews =
       * bookMapper.getBoardReview(studentboard.getUniqueID()); // 보드 아이디에 관련된
       * 리뷰를 가져온다 System.out.println("ㅎㅇ5"); model.addAttribute("reviews",
       * reviews);
       */
      List<Review> review = bookMapper.getBoardReview(uniqueID);
      for (int i = 0; i < review.size(); i++) {
         review.get(i).setUserID(bookMapper.getName(review.get(i).getUserID()));
      }

      // review.setBoardID(uniqueID);
      model.addAttribute("review", review);

      System.out.println("reviews:" + review);

      /*
       * Review review = new Review(); review.setBoardID(uniqueID);
       * model.addAttribute("review", review);
       * System.out.println("reviews:"+review);
       */
      return "students/view";
   }

   @RequestMapping(value = "/students/review", method = RequestMethod.POST)
   public String reviewAdd(@ModelAttribute("reviewsForm") Review review, Principal principal) {
      SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddhhmmss"); // 날짜 포맷
                                                      // 형식
      String sdfFiletoString = null;
      Date dt = new Date();
      sdfFiletoString = sdf.format(dt).toString();
      review.setUniqueID(sdfFiletoString); // 현재 시간을 유니크 값으로 준다
      User user = userMapper.getUserList(principal.getName());
      review.setUserID(user.getName());

      SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd hh:mm"); // 날짜
                                                         // 포맷
                                                         // 형식
      Date dt1 = new Date();
      String sdfFiletoString1 = null;
      sdfFiletoString1 = sdf1.format(dt1).toString();
      review.setDate(dt1);

      System.out.println(review);
      bookMapper.createReview(review);
      System.out.println("댓글 쓰기");

      return "redirect:/students/view/" + review.getBoardID();
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

   /*
    * @RequestMapping(value = "/student/edit/{id}", method = RequestMethod.GET)
    * public String edit(@PathVariable int id, Model model) { StudentBoard
    * studentboard = bookMapper.getStudentBoard(id); // 뷰 페이지로 데이터를
    * 전달(key/value 형식) model.addAttribute("studentboard", studentboard); return
    * "students/edit"; }
    */

   @RequestMapping(value = "/student/delete/{id}", method = RequestMethod.GET)
   public String delete(@PathVariable int id) {
      bookMapper.deleteStudent(id);
      return "redirect:/students";
   }

}