package com.mycompany.vo;

import java.util.Date;

public class StudentBoard {
	String uniqueID;
	String userID;
	String title;
	String content;
	Date date;
	String lectureRoom;
	public String getUniqueID() {
		return uniqueID;
	}
	public void setUniqueID(String uniqueID) {
		this.uniqueID = uniqueID;
	}
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
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
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public String getLectureRoom() {
		return lectureRoom;
	}
	public void setLectureRoom(String lectureRoom) {
		this.lectureRoom = lectureRoom;
	}
	@Override
	public String toString() {
		return "StudentBoard [uniqueID=" + uniqueID + ", userID=" + userID + ", title=" + title + ", content=" + content
				+ ", date=" + date + ", lectureRoom=" + lectureRoom + "]";
	}
}
