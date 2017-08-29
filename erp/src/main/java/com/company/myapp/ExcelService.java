package com.company.myapp;

import java.util.List;
import java.util.Map;

import com.mycompany.vo.workExcel;

public interface ExcelService {
	public int addExcel(workExcel workExcel);
	public List<workExcel> getExcel();
}
