package com.company.myapp;

import java.util.List;
import java.util.Map;

import com.mycompany.vo.Board;
import com.mycompany.vo.Message;
import com.mycompany.vo.User;

public interface UserDao {
	public User selectUserByIdAndPw(User user);

	public int selectTotalCount();

	public int selectTotalNoticeCount(Map<String, Object> map);
	
	public int selectTotalRecvMessageCount(String recv_id);
	
	public int selectTotalSendMessageCount(String send_id);

	public List<User> selectUserList(Map<String, Object> map);

	public List<Board> selectNoticeList(Map<String, Object> map);
	
	public List<Board> selectExploreNoticeList(Map<String, Object> map);
	
	public List<Message> selectRecvMessageList(Map<String, Object> map);
	
	public List<Message> selectSendMessageList(Map<String, Object> map);
}