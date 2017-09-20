package com.company.myapp;

import java.util.List;

import com.mycompany.vo.Board;
import com.mycompany.vo.Message;
import com.mycompany.vo.User;

public interface UserService {
	
	public User getUserByIdAndPw(User user);

	public int getLastPage();
	
	public int getNoticeLastPage(String word);

	public int getRecvMessageLastPage(String recv_id);
	
	public int getSendMessageLastPage(String send_id);
	
	public List<User> getUserList(int page, String word);

	public List<Board> getNoticeList(int page, String word);
	
	public List<Board> getNoticeExploreList(int page, String word);
	
	public List<Message> getRecvMessageList(int page, String word, String recv_id);
	
	public List<Message> getSendMessageList(int page, String word, String send_id);

}