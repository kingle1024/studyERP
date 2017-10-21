package com.mycompany.vo;

public class UserPreview {
	private int id;
	private String email;
	public UserPreview(int id, String email) {
		super();
		this.id = id;
		this.email = email;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	@Override
	public String toString() {
		return "UserPreview [id=" + id + ", email=" + email + "]";
	}
}
