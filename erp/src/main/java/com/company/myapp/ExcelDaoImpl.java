package com.company.myapp;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mycompany.vo.Files;
import com.mycompany.vo.workExcel;
@Repository
public class ExcelDaoImpl implements ExcelDao{

	private final String NS = "com.company.myapp";
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int insertExcel(workExcel workExcel) {
		// TODO Auto-generated method stub
		return sqlSession.insert(NS+".insertExcel", workExcel);
	}

	@Override
	public List<workExcel> selectExcel(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(NS+".selectExcel");
	}

	@Override
	public Files selectFiles(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(NS+".selectFiles");
	}

}
