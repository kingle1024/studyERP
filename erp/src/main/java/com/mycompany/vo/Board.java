package com.mycompany.vo;

import java.util.Date;

public class Board {
	int id;
	String title;
	String author;
	String content;
	Date created;
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
	public Date getCreated() {
		return created;
	}
	public void setCreated(Date created) {
		this.created = created;
	}
	@Override
	public String toString() {
		return "Board [id=" + id + ", title=" + title + ", author=" + author + ", content=" + content + ", created="
				+ created + "]";
	}
	
	
}
