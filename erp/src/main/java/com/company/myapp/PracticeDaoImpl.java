package com.company.myapp;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mycompany.vo.Practiceroom;
import com.mycompany.vo.User;
@Repository
public class PracticeDaoImpl implements PracticeDao {

	private final String NS = "com.company.myapp";
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public Practiceroom selectpractice(Practiceroom pr) {

		return sqlSession.selectOne(NS + ".selectPractice", pr);
	}

	@Override
	public int updatepractice(Practiceroom pr) {

		return sqlSession.update(NS + ".updatePractice", pr);
	}

}
