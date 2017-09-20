package com.mycompany.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.mycompany.vo.Board;
import com.mycompany.vo.Comment;
import com.mycompany.vo.Files;
import com.mycompany.vo.Practiceroom;
import com.mycompany.vo.Product;
import com.mycompany.vo.StudentBoard;
import com.mycompany.vo.User;

public interface BookMapper {
	@Insert("insert into studentboards (title, content, author, hit, register_date, update_date, type_code) values (#{title}, #{content}, #{author}, 1, now(), now(), 1002)")
	public void createStudent(StudentBoard studentboard);
	
	
	@Select("select * from studentboards where type_code = 1002 order by id desc")
		public List<StudentBoard> getStudentBoardList();
	
	@Select("select * from studentboards where id=#{id}")
		public StudentBoard getStudentBoard(int id);

	@Update("update studentboards set title = #{title}, content= #{content}, author = #{author}, update_date = now() where id = #{id}")
	public boolean updateStudent(StudentBoard studentboard);

	@Update("update studentboards set hit = hit+1 where id= #{id}")
	public boolean updateStudentHit(int id);


	@Delete("delete from studentboards where id = #{id}")
	public boolean deleteStudent(int id);
	
	@Update("update practice_room set information = #{information}, program= #{program} where no = #{no}")
	public boolean updatePractice(Practiceroom practiceroom);
	
	
}
