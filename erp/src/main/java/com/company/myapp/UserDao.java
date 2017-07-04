package com.company.myapp;

import java.util.List;
import java.util.Map;

import com.mycompany.vo.Board;
import com.mycompany.vo.Message;
import com.mycompany.vo.User;

public interface UserDao {
	public User selectUserByIdAndPw(User user);

	public int selectTotalCount();

	public int selectTotalNoticeCount();
	
	public int selectTotalMessageCount();

	public List<User> selectUserList(Map<String, Object> map);

	public List<Board> selectNoticeList(Map<String, Object> map);
	
	public List<Message> selectMessageList(Map<String, Object> map);
	
}