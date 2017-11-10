package com.mycompany.vo;
public class Book {
    private int tableNum;
    private String Date;
    private String time_start;
    private String time_end;
    private String work_time;
    private String Context;

	public int getTableNum() {
		return tableNum;
	}
	public void setTableNum(int tableNum) {
		this.tableNum = tableNum;
	}
	public String getDate() {
		return Date;
	}
	public void setDate(String date) {
		Date = date;
	}
	public String getTime_start() {
		return time_start;
	}
	public void setTime_start(String time_start) {
		this.time_start = time_start;
	}
	public String getTime_end() {
		return time_end;
	}
	public void setTime_end(String time_end) {
		this.time_end = time_end;
	}
	public String getWork_time() {
		return work_time;
	}
	public void setWork_time(String work_time) {
		this.work_time = work_time;
	}
	public String getContext() {
		return Context;
	}
	public void setContext(String context) {
		Context = context;
	}
	@Override
	public String toString() {
		return "Book [tableNum=" + tableNum + ", Date=" + Date + ", time_start=" + time_start + ", time_end=" + time_end
				+ ", work_time=" + work_time + ", Context=" + Context + "]";
	}
    
}