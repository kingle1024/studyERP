package com.mycompany.vo;

import java.util.Date;

public class ApprovalSub {
	private int no;
	private int doc;
	private int ing;
	private int last;
	private int state;
	private Date update_date;
	private String send_id;
	private String type_code;
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getDoc() {
		return doc;
	}
	public void setDoc(int doc) {
		this.doc = doc;
	}
	public int getIng() {
		return ing;
	}
	public void setIng(int ing) {
		this.ing = ing;
	}
	public int getLast() {
		return last;
	}
	public void setLast(int last) {
		this.last = last;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	public Date getUpdate_date() {
		return update_date;
	}
	public void setUpdate_date(Date update_date) {
		this.update_date = update_date;
	}
	public String getSend_id() {
		return send_id;
	}
	public void setSend_id(String send_id) {
		this.send_id = send_id;
	}
	public String getType_code() {
		return type_code;
	}
	public void setType_code(String type_code) {
		this.type_code = type_code;
	}
	@Override
	public String toString() {
		return "ApprovalSub [no=" + no + ", doc=" + doc + ", ing=" + ing + ", last=" + last + ", state=" + state
				+ ", update_date=" + update_date + ", send_id=" + send_id + ", type_code=" + type_code + "]";
	}
}
