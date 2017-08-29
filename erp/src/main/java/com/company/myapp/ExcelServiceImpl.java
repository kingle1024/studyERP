package com.company.myapp;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.vo.workExcel;

@Service
public class ExcelServiceImpl implements ExcelService {
	@Autowired
	private ExcelDao excelDao;
	
	@Override
	public int addExcel(workExcel workExcel) {
		// TODO Auto-generated method stub
		return excelDao.insertExcel(workExcel);
	}

	@Override
	public List<workExcel> getExcel() {
		Map<String, Object> map = new HashMap<String, Object>();
		return excelDao.selectExcel(map);
		// TODO Auto-generated method stub
	}
	
}
