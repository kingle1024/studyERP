package com.company.myapp;
import java.util.List;
import java.util.Map;
 
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mycompany.vo.Board;
import com.mycompany.vo.Message;
import com.mycompany.vo.User;

@Repository
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
	public int selectTotalNoticeCount() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(
				NS+".selectTotalNoticeCount");
	}

	@Override
	public int selectTotalMessageCount() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(
				NS+".selectTotalMessageCount");
	}
	
    public List<User> selectUserList(Map<String, Object> map) {
        return sqlSession.selectList(
                NS+".selectUserList", map);
    }

	@Override
	public List<Board> selectNoticeList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(
				NS+".selectNoticeList", map);
	}

	@Override
	public List<Message> selectRecvMessageList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(
				NS+".selectRecvMessageList",map);
	}

	@Override
	public List<Message> selectSendMessageList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(
				NS+".selectSendMessageList",map);
	}



}