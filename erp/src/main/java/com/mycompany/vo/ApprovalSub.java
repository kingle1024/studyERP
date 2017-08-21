package com.mycompany.vo;

import java.util.Date;

public class ApprovalSub {
	private int no;
	private int doc;
	private int step;
	private int lastStep;
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
	public int getStep() {
		return step;
	}
	public void setStep(int step) {
		this.step = step;
	}
	public int getLastStep() {
		return lastStep;
	}
	public void setLastStep(int lastStep) {
		this.lastStep = lastStep;
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
		return "ApprovalSub [no=" + no + ", doc=" + doc + ", step=" + step + ", lastStep=" + lastStep + ", state="
				+ state + ", update_date=" + update_date + ", send_id=" + send_id + ", type_code=" + type_code + "]";
	}
}
