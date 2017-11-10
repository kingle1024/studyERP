package com.mycompany.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import com.mycompany.vo.Board;
import com.mycompany.vo.Comment;

public interface BoardMapper {
	// jsp파일에서 가져온다
	@Insert("INSERT into boards (title, content, author, hit, register_date, update_date, type_code) values (#{title}, #{content}, #{author}, 1, now(), now(), 1001)")
	public void createNotice(Board board);
	
	@Insert("INSERT into board_comment (board_no, author, comment, register_date, type_code) values ( #{board_no}, #{author}, #{comment}, now(), 1001 )")
	void createComment(Comment comment);

	@Select("SELECT count(id) from boards")
	public int getCountBoard();

	@Select("SELECT * from boards where type_code = 1001 order by id desc")
	public List<Board> getBoardList();

	@Select("SELECT * from boards where type_code = 1001 order by id desc limit 5")
	public List<Board> mainBoardList();

	// 컨트롤러에서 가져온다.
	@Select("SELECT * from boards where id=#{id}")
	public Board getBoard(int id);
	
	@Select("SELECT max(id) from boards") // 최댓값을 가져온다. 
	public int getLastID();
	
	@Select("SELECT * FROM board_comment WHERE board_no = #{board_no} and type_code = 1001 " ) // 댓글 가져오기
	List<Comment> getComments(int board_no);
	
	@Select("SELECT * FROM board_comment WHERE no = #{no} and type_code = 1001")
	Comment getComment(int no);
	
	// register_date -> update_date로 바꾸고, view페이지에서 처리해주기
	@Update("UPDATE board_comment set comment = #{comment}, register_date = now() where no = #{no} ")
	public boolean updateComment(Comment comment);
	
	@Update("UPDATE boards set title = #{title}, content= #{content}, author = #{author}, update_date = now() where id = #{id}")
	public boolean updateNotice(Board board);
	
	@Update("UPDATE boards set hit = hit+1 where id= #{id}")
	public boolean updateNoticeHit(int id);

	@Delete("DELETE from board_comment where board_no = #{board_no} and no = #{no}")
	public boolean deleteComment(@Param("board_no") int board_no, @Param("no") int no);
	
	@Delete("DELETE from boards where id = #{id}")
	public boolean deleteNotice(int id);
	
}
