package com.company.myapp;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.vo.Board;
import com.mycompany.vo.Message;
import com.mycompany.vo.User;

@Service
public class UserServiceImpl implements UserService{
	private final int LINE_PER_PAGE = 10;
    @Autowired
    private UserDao userDao;
  
    @Override
    public User getUserByIdAndPw(User user) {
        return userDao.selectUserByIdAndPw(user);
    }
  
    @Override
    public int getLastPage() {
        return (int)(Math.ceil((double)userDao.selectTotalCount()/LINE_PER_PAGE));
    }
    
    @Override
	public int getNoticeLastPage(String word) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("word", word);
		double cal = userDao.selectTotalNoticeCount(map)/LINE_PER_PAGE;
		int calToInt = (int)Math.ceil(cal);
		return calToInt;
	}
  
    @Override
	public int getRecvMessageLastPage(String recv_id) {
    	double cal = userDao.selectTotalRecvMessageCount(recv_id)/LINE_PER_PAGE;
    	int calToInt = (int)Math.ceil(cal);
		return calToInt;
	}
    
    @Override
	public int getSendMessageLastPage(String send_id) {
    	double cal = userDao.selectTotalSendMessageCount(send_id)/LINE_PER_PAGE;
    	int calToInt = (int)Math.ceil(cal);
		return calToInt;
	}
    
    @Override
    public List<User> getUserList(int page, String word) {
        PageHelper pageHelper = new PageHelper(page, LINE_PER_PAGE);
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("pageHelper", pageHelper);
        map.put("word", word);
        return userDao.selectUserList(map);
    }

	@Override
	public List<Board> getNoticeList(int page, String word) { // 공지사항
		PageHelper pageHelper = new PageHelper(page, LINE_PER_PAGE);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pageHelper", pageHelper);
		map.put("word", word);
		return userDao.selectNoticeList(map);
	}

	@Override
	public List<Message> getRecvMessageList(int page, String word, String recv_id) {
		PageHelper pageHelper = new PageHelper(page, LINE_PER_PAGE);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pageHelper", pageHelper);
		map.put("word", word);
		map.put("recv_id", recv_id); 
		return userDao.selectRecvMessageList(map);
	}

	@Override
	public List<Message> getSendMessageList(int page, String word, String send_id) {
		PageHelper pageHelper = new PageHelper(page, LINE_PER_PAGE);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pageHelper", pageHelper);
		map.put("word", word);
		map.put("send_id", send_id); 
		return userDao.selectSendMessageList(map);
	}

	@Override
	public List<Board> getNoticeExploreList(int page, String word) {
		PageHelper pageHelper = new PageHelper(page, LINE_PER_PAGE);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pageHelpder", pageHelper);
		map.put("word", word);
		return userDao.selectExploreNoticeList(map);
	}

	@Override
	public int getNoticeTotal(String recv_id) {
		return userDao.selectTotalRecvMessageCount(recv_id);
	}

	@Override
	public int getCommentTotal(int board_no) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("board_no", board_no);
		return userDao.selectTotalCommentCount(map);
	}
}