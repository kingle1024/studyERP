package com.mycompany.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.mycompany.vo.Board;
import com.mycompany.vo.Book;
import com.mycompany.vo.Comment;
import com.mycompany.vo.Product;
import com.mycompany.vo.Sign;
import com.mycompany.vo.User;
import com.mycompany.vo.myBook;

public interface BookMapper {
	@Insert("insert into books(title, author, image) values (#{title}, #{author}, #{image})")
	public boolean create(Book book);
		
	@Insert("insert into mybooks (email, content) values (#{email}, #{content})")
	public boolean createMessage(myBook myBook);
	
	//jsp파일에서 가져온다
	@Insert("insert into boards (title, content, author, hit, register_date, update_date) values (#{title}, #{content}, #{author}, 1, now(), now())")
	public void createNotice(Board board);
		
	@Select("select * from books")
	public List<Book> getList();
	
	@Select("select * from boards where type_code = 1001 order by id desc")
	public List<Board> getBoardList();

	@Select("select * from products")
	public List<Product> getProductList();
	
	@Select("select * from signs")
	public List<Sign> getSignList();
	
	@Select("select * from users where email=#{email}")
	public User getUserList(String email);
	
	@Select("select * from books where id=#{id}")
	public Book getBook(int id);
	
	//컨트롤러에서 가져온다.
	@Select("select * from boards where id=#{id}")
	public Board getBoard(int id);	
		
	@Update("update books set title = #{title}, author = #{author}, image = #{image} where id = #{id}")
	public boolean update(Book book);
	
	@Update("update boards set title = #{title}, content= #{content}, author = #{author}, update_date = now() where id = #{id}")
	public boolean updateNotice(Board board);
	
	@Update("update boards set hit = hit+1 where id= #{id}")
	public boolean updateNoticeHit(int id);
	
	@Delete("delete from books where id = #{id}")
	public boolean delete(int id);
		
	@Delete("delete from boards where id = #{id}")
	public boolean deleteNotice(int id);
	
	@Select("select * from mybooks where email = #{email}")
	public List<myBook> getMyBook(String email);

	@Select("SELECT * "+ " FROM board_comment " + " WHERE board_no = #{board_no} and type_code = 1001 " )
	List<Comment> getComments(int board_no);
	
	@Insert("insert into board_comment (board_no, author, comment, register_date, type_code) values ( #{board_no}, #{author}, #{comment}, now(), 1001 )")
	void createComment(Comment comment);
	
	
	
}
