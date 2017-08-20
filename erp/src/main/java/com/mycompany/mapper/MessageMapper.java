package com.mycompany.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.mycompany.vo.Message;

public interface MessageMapper {
	
	@Update("update messages set recv_date = now() where no = #{ no }")
	public boolean updateMessageRecvDate(int no);
	
	@Select("select * from messages where recv_id = #{recv_id} order by no desc")
	public List<Message> getMyMessage(String recv_id);
	
	@Select("select * from messages where send_id = #{send_id} order by no desc")
	public List<Message> getSendMessage(String send_id);
	
	@Insert("insert into messages (recv_id, send_id, title, content, send_date) values (#{recv_id}, #{send_id}, #{title}, #{content}, now())")
	public boolean createMessageR(Message Message);
	
	@Insert("insert into messages (recv_id, send_id, title, content, send_date) values (#{recv_id}, #{send_id}, #{title}, #{content}, now())")
	public boolean answerMessage(Message message);
	
	@Select("select * from messages where no=#{no}")
	public Message getMessage(int no);
	
}
