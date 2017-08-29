package com.company.myapp;

import java.util.List;
import java.util.Map;

import com.mycompany.vo.workExcel;

public interface ExcelDao {
	public int insertExcel(workExcel workExcel);
	
	public List<workExcel> selectExcel(Map<String, Object> map);
	
}
