package com.company.myapp;

import java.util.List;
import java.util.Map;

import com.mycompany.vo.Files;
import com.mycompany.vo.workExcel;

public interface ExcelDao {
	public int insertExcel(workExcel workExcel);
	public List<workExcel> selectExcel(Map<String, Object> map);
	public Files selectFiles(Map<String, Object> map);
	public List<workExcel> selectMywork(Map<String, Object> map, String userEmail);
}
