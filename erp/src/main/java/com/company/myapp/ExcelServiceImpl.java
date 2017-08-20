package com.company.myapp;

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
}
