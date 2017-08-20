package com.company.myapp;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


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

}
