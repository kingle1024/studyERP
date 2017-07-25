package com.mycompany.vo;

import java.sql.Date;

public class Approval {
	private int no;
	private String title;
	private String content;
	private String etc;
	private String state;
	private int stepIng;
	private int stepFinal;
	private String send_id;
	private String recv_id;
	private String type_code;
	private Date register_date;
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getEtc() {
		return etc;
	}
	public void setEtc(String etc) {
		this.etc = etc;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public int getStepIng() {
		return stepIng;
	}
	public void setStepIng(int stepIng) {
		this.stepIng = stepIng;
	}
	public int getStepFinal() {
		return stepFinal;
	}
	public void setStepFinal(int stepFinal) {
		this.stepFinal = stepFinal;
	}
	public String getSend_id() {
		return send_id;
	}
	public void setSend_id(String send_id) {
		this.send_id = send_id;
	}
	public String getRecv_id() {
		return recv_id;
	}
	public void setRecv_id(String recv_id) {
		this.recv_id = recv_id;
	}
	public String getType_code() {
		return type_code;
	}
	public void setType_code(String type_code) {
		this.type_code = type_code;
	}
	public Date getRegister_date() {
		return register_date;
	}
	public void setRegister_date(Date register_date) {
		this.register_date = register_date;
	}
	@Override
	public String toString() {
		return "Approval [no=" + no + ", title=" + title + ", content=" + content + ", etc=" + etc + ", state=" + state
				+ ", stepIng=" + stepIng + ", stepFinal=" + stepFinal + ", send_id=" + send_id + ", recv_id=" + recv_id
				+ ", type_code=" + type_code + ", register_date=" + register_date + "]";
	}
	
	

	
	
}
