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
import com.mycompany.vo.User;
import com.mycompany.vo.myBook;

public interface BookMapper {
	@Insert("insert into books(title, author, image) values (#{title}, #{author}, #{image})")
	public boolean create(Book book);
	
	@Insert("insert into mybooks (email, content) values (#{email}, #{content})")
	public boolean createMessage(myBook myBook);
	
	@Insert("insert into messages (recv_id, send_id, title, content, send_date) values (#{recv_id}, #{send_id}, #{title}, #{content}, now())")
	public boolean createMessageR(Message Message);
	
	@Insert("insert into messages (recv_id, send_id, title, content, send_date) values (#{recv_id}, #{send_id}, #{title}, #{content}, now())")
	public boolean answerMessage(Message message);
	
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
	
	@Select("select * from messages where no=#{no}")
	public Message getMessage(int no);
	
	@Select("select * from messages where send_id = #{send_id} order by no desc")
	public List<Message> getSendMessage(String send_id);
	
	@Update("update books set title = #{title}, author = #{author}, image = #{image} where id = #{id}")
	public boolean update(Book book);
	
	@Update("update boards set title = #{title}, content= #{content}, author = #{author}, update_date = now() where id = #{id}")
	public boolean updateNotice(Board board);
	
	@Update("update messages set recv_date = now() where no = #{ no }")
	public boolean updateMessageRecvDate(int no);
	
	@Update("update boards set hit = hit+1 where id= #{id}")
	public boolean updateNoticeHit(int id);
	
	@Delete("delete from books where id = #{id}")
	public boolean delete(int id);
		
	@Delete("delete from boards where id = #{id}")
	public boolean deleteNotice(int id);
	
	@Select("select * from mybooks where email = #{email}")
	public List<myBook> getMyBook(String email);
	
	@Select("select * from messages where recv_id = #{recv_id} order by no desc")
	public List<Message> getMyMessage(String recv_id);


	
}
