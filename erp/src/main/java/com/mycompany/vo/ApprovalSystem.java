package com.mycompany.vo;

public class ApprovalSystem {
	private int no;
	private int ing;
	private int last;
	private String recv_id;
	private String type_code;
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getIng() {
		return ing;
	}
	public void setIng(int ing) {
		this.ing = ing;
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
	public int getLast() {
		return last;
	}
	public void setLast(int last) {
		this.last = last;
	}
	@Override
	public String toString() {
		return "ApprovalSystem [no=" + no + ", ing=" + ing + ", last=" + last + ", recv_id=" + recv_id + ", type_code="
				+ type_code + "]";
	}
}
