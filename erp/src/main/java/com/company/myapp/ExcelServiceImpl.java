package com.company.myapp;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.vo.Files;
import com.mycompany.vo.workExcel;

@Service
public class ExcelServiceImpl implements ExcelService {
	@Autowired
	private ExcelDao excelDao;
	
	@Override
	public int addExcel(workExcel workExcel) {
		return excelDao.insertExcel(workExcel);
	}
	
	@Override
	public List<workExcel> getExcel() {
		Map<String, Object> map = new HashMap<String, Object>();
		return excelDao.selectExcel(map);
	}

	@Override
	public List<workExcel> myworkList(String userEmail) {
		Map<String, Object> map = new HashMap<String, Object>();
		return excelDao.selectMywork(map, userEmail);
	}
	
	@Override
	public Files getFiles() {
		Map<String, Object> map = new HashMap<String, Object>();
		return excelDao.selectFiles(map);
	}

	@Override
	public int getMyworkTotalCount(String userEmail) {
		System.out.println("totalWork:"+excelDao.getMyworkTotalCount(userEmail));
		return excelDao.getMyworkTotalCount(userEmail);
	}

}
