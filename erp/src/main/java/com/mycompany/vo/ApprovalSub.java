package com.mycompany.vo;

import java.util.Date;

public class ApprovalSub {
	private int no;
	private int doc_no;
	private String recv_id;
	private String state;
	private Date update_date;
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getDoc_no() {
		return doc_no;
	}
	public void setDoc_no(int doc_no) {
		this.doc_no = doc_no;
	}
	public String getRecv_id() {
		return recv_id;
	}
	public void setRecv_id(String recv_id) {
		this.recv_id = recv_id;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public Date getUpdate_date() {
		return update_date;
	}
	public void setUpdate_date(Date update_date) {
		this.update_date = update_date;
	}
	@Override
	public String toString() {
		return "ApprovalSub [no=" + no + ", doc_no=" + doc_no + ", recv_id=" + recv_id + ", state=" + state
				+ ", update_date=" + update_date + "]";
	}
}
