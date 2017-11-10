package com.mycompany.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.mycompany.vo.Board;
import com.mycompany.vo.Book;
import com.mycompany.vo.Comment;
import com.mycompany.vo.Files;
import com.mycompany.vo.Practiceroom;
import com.mycompany.vo.Product;
import com.mycompany.vo.Review;
import com.mycompany.vo.StudentBoard;
import com.mycompany.vo.User;

public interface BookMapper {
	@Select("select name from muser where uniqueID = #{uniqueID}")
	public String getName(@Param("uniqueID") String uniqueID);
	
	@Insert("insert into studentboards (title, content, author, hit, register_date, update_date, type_code) values (#{title}, #{content}, #{author}, 1, now(), now(), 1002)")
	public void createStudent(StudentBoard studentboard);
	
	
	@Select("select name from muser where uniqueID = #{userID}")
	public String getName1(@Param("uniqueID") String uniqueID);
	
	@Insert("insert into review (uniqueID, boardID, userID, content, date) values (#{uniqueID}, #{boardID}, 1505755506107, #{content}, #{date})")
	public boolean createReview(Review review);
	
	@Select("select * from review where boardID = #{boardID}")
	public List<Review> getBoardReview(@Param("boardID") String boardID);
	
	@Select("select * from review where uniqueID=#{uniqueID}")
	public Review getReview(@Param("uniqueID") String uniqueID);
	
	@Select("select * from studentboard order by date desc")
	public List<StudentBoard> getStudentBoardList();
	
	@Select("select * from studentboard where uniqueID=#{uniqueID}")
	public StudentBoard getStudentBoard(@Param("uniqueID") String uniqueID);

	@Update("update studentboards set title = #{title}, content= #{content}, author = #{author}, update_date = now() where id = #{id}")
	public boolean updateStudent(StudentBoard studentboard);

	@Update("update studentboards set hit = hit+1 where id= #{id}")
	public boolean updateStudentHit(int id);


	@Delete("delete from studentboards where id = #{id}")
	public boolean deleteStudent(int id);
	@Update("update practice_room set information = #{information}, program= #{program} where no = #{no}")
	public boolean updatePractice(Practiceroom practiceroom);
	
	   @Insert("insert into workexcel (workDate,startTime,endTime,endSubStart,content)"
		         + " values (#{Date}, #{time_start}, #{time_end},#{work_time},#{Context})")
		   public void create(Book books);
	
	
	
	
}
