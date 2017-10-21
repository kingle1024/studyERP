package com.mycompany.vo;

import java.util.Date;

public class StudentBoard {
	private int id;
	private String title;
	private String content;
	private String author;
	private int hit;
	private Date register_date;
	private Date update_date;
	private boolean delete_yn;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public Date getRegister_date() {
		return register_date;
	}
	public void setRegister_date(Date register_date) {
		this.register_date = register_date;
	}
	public Date getUpdate_date() {
		return update_date;
	}
	public void setUpdate_date(Date update_date) {
		this.update_date = update_date;
	}
	public boolean isDelete_yn() {
		return delete_yn;
	}
	public void setDelete_yn(boolean delete_yn) {
		this.delete_yn = delete_yn;
	}
	@Override
	public String toString() {
		return "StudentBoard [id=" + id + ", title=" + title + ", content=" + content + ", author=" + author + ", hit=" + hit
				+ ", register_date=" + register_date + ", update_date=" + update_date + ", delete_yn=" + delete_yn
				+ "]";
	}
	
	
	
}
