package com.mycompany.vo;

public class approvlas_system {
	private int no;
	private int doc;
	private int ing;
	private int end;
	private String recv_id;
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
	public int getEnd() {
		return end;
	}
	public void setEnd(int end) {
		this.end = end;
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
	@Override
	public String toString() {
		return "approvlas_system [no=" + no + ", doc=" + doc + ", ing=" + ing + ", end=" + end + ", recv_id=" + recv_id
				+ ", type_code=" + type_code + "]";
	}
}
