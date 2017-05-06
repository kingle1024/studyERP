package com.mycompany.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.mycompany.vo.Board;
import com.mycompany.vo.Book;
import com.mycompany.vo.Message;
import com.mycompany.vo.Product;
import com.mycompany.vo.Sign;
import com.mycompany.vo.myBook;

public interface BookMapper {
	@Insert("insert into books(title, author, image) values (#{title}, #{author}, #{image})")
	public boolean create(Book book);
	
	@Insert("insert into mybooks (email, content) values (#{email}, #{content})")
	public boolean createMessage(myBook myBook);
	
	@Insert("insert into messages (recv_id, send_id, title, content, send_date) values (#{recv_id}, #{send_id}, #{title}, #{content}, now())")
	public boolean createMessageR(Message Message);
	
	@Insert("insert into boards (title, content, author, created) values (#{title}, #{content}, #{author}, now())")
	public void createBoard(Board board);
		
	@Select("select * from books")
	public List<Book> getList();
	
	@Select("select * from boards order by id desc")
	public List<Board> getBoardList();

	@Select("select * from products")
	public List<Product> getProductList();
	
	@Select("select * from signs")
	public List<Sign> getSignList();
	
	@Select("select * from books where id=#{id}")
	public Book getBook(int id);
	
	@Select("select * from boards where id=#{id}")
	public Board getBoard(int id);
	
	@Select("select * from messages where no=#{no}")
	public Message getMessage(int no);
	
	@Update("update books set title = #{title}, author = #{author}, image = #{image} where id = #{id}")
	public boolean update(Book book);
	
	@Update("update boards set title = #{title}, content= #{content}, author = #{author}, created = now() where id = #{id}")
	public boolean updateNotice(Board board);
	
	@Delete("delete from books where id = #{id}")
	public boolean delete(int id);
		
	@Select("select * from mybooks where email = #{email}")
	public List<myBook> getMyBook(String email);
	
	@Select("select * from messages where recv_id = #{recv_id} order by no desc")
	public List<Message> getMyBookR(String recv_id);
	
//	@Insert("insert into boards (title, username, content, books_id, created) values (#{title}, #{username}, #{content}, #{books_id},now() )")
//	public boolean create1(Board board);
}
