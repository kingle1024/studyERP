package com.company.myapp;
import java.util.List;
import java.util.Map;

import org.apache.maven.model.Model;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.mycompany.vo.Board;
import com.mycompany.vo.Message;
import com.mycompany.vo.User;

@Service
public class UserDaoImpl implements UserDao {
	
	private final String NS = "com.company.myapp";
	@Autowired 
	private SqlSessionTemplate sqlSession;
	
    @Override
    public User selectUserByIdAndPw(User user) {
        return sqlSession.selectOne(NS+".selectUserByIdAndPw",user);
    }
  
    @Override
    public int selectTotalCount() {
        return sqlSession.selectOne(
                NS+".selectTotalCount");
    }
    
	@Override
	public int selectTotalNoticeCount(Map<String, Object> map) {
		return sqlSession.selectOne(
				NS+".selectTotalNoticeCount", map);
	}

	@Override
	public int selectTotalRecvMessageCount(String recv_id) {
		return sqlSession.selectOne(
				NS+".selectTotalRecvMessageCount",recv_id);
	}
	
	@Override
	public int selectTotalSendMessageCount(String send_id) {
		return sqlSession.selectOne(
				NS+".selectTotalSendMessageCount",send_id);
	}
	
    public List<User> selectUserList(Map<String, Object> map) {
        return sqlSession.selectList(
                NS+".selectUserList", map);
    }

	@Override
	public List<Board> selectNoticeList(Map<String, Object> map) {
		return sqlSession.selectList(
				NS+".selectNoticeList", map);
	}

	@Override
	public List<Message> selectRecvMessageList(Map<String, Object> map) {
		return sqlSession.selectList(
				NS+".selectRecvMessageList",map);
	}

	@Override
	public List<Message> selectSendMessageList(Map<String, Object> map) {
		return sqlSession.selectList(
				NS+".selectSendMessageList",map);
	}

	@Override
	public List<Board> selectExploreNoticeList(Map<String, Object> map) {
		return sqlSession.selectList(NS+".selectExploreNoticeList", map);
	}

}