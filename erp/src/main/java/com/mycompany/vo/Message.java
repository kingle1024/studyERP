package com.mycompany.vo;

import java.sql.Date;

public class Message {
	
	int no;
	String recv_id;
	String send_id;
	String title;
	String content;
	Date recv_date;
	Date send_date;
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getRecv_id() {
		return recv_id;
	}
	public void setRecv_id(String recv_id) {
		this.recv_id = recv_id;
	}
	public String getSend_id() {
		return send_id;
	}
	public void setSend_id(String send_id) {
		this.send_id = send_id;
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
	public Date getRecv_date() {
		return recv_date;
	}
	public void setRecv_date(Date recv_date) {
		this.recv_date = recv_date;
	}
	public Date getSend_date() {
		return send_date;
	}
	public void setSend_date(Date send_date) {
		this.send_date = send_date;
	}
	
	@Override
	public String toString() {
		return "Message [no=" + no + ", recv_id=" + recv_id + ", send_id=" + send_id + ", title=" + title + ", content="
				+ content + ", recv_date=" + recv_date + ", send_date=" + send_date + "]";
	}
	
	
	
}
