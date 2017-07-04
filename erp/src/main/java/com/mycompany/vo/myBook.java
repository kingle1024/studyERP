package com.mycompany.vo;

public class myBook {
	int no;
	String email;
	String content;
	public int getId() {
		return no;
	}
	public void setId(int no) {
		this.no = no;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	@Override
	public String toString() {
		return "myBook [no=" + no + ", email=" + email + ", content=" + content + "]";
	}
	
}
