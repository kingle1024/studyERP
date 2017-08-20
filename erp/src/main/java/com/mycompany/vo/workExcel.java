package com.mycompany.vo;

import java.sql.Time;
import java.sql.Timestamp;
import java.util.List;

public class workExcel {
	private int no;
	private String workDate;
	private String week;
	private String startTime;
	private String endTime;
	private String endSubStart;
	private String content;
	private List <workExcel> excelList;
	
	public List<workExcel> getExcelList() {
		return excelList;
	}
	public void setExcelList(List<workExcel> excelList) {
		this.excelList = excelList;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getWorkDate() {
		return workDate;
	}
	public void setWorkDate(String workDate) {
		this.workDate = workDate;
	}
	public String getWeek() {
		return week;
	}
	public void setWeek(String week) {
		this.week = week;
	}
	public String getStartTime() {
		return startTime;
	}
	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}
	public String getEndTime() {
		return endTime;
	}
	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}
	public String getEndSubStart() {
		return endSubStart;
	}
	public void setEndSubStart(String endSubStart) {
		this.endSubStart = endSubStart;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
}
