package com.company.myapp;

import java.util.List;

import com.mycompany.vo.Files;
import com.mycompany.vo.workExcel;

public interface ExcelService {
	public int addExcel(workExcel workExcel);
	public int getMyworkTotalCount(String userEmail);
	public List<workExcel> getExcel();
	public List<workExcel> myworkList(String userEmail);
	public Files getFiles();
	
}
