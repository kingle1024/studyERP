package com.mycompany.vo;

import java.util.Date;

public class Review {

	private String uniqueID;
	private String boardID;
	private String userID;
	private String content;
	private Date date;
	
	public String getUniqueID() {
		return uniqueID;
	}
	public void setUniqueID(String uniqueID) {
		this.uniqueID = uniqueID;
	}
	public String getBoardID() {
		return boardID;
	}
	public void setBoardID(String boardID) {
		this.boardID = boardID;
	}
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
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
	@Override
	public String toString() {
		return "Review [uniqueID=" + uniqueID + ", boardID=" + boardID + ", userID=" + userID + ", content=" + content
				+ ", date=" + date + "]";
	}
}