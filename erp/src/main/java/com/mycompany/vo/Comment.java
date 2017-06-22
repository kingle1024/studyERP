package com.mycompany.vo;



import java.util.Date;

import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.stereotype.Controller;

@Controller
public class Comment {	
	Date register_date;
	Date update_date;
	Integer type_code;
	Integer no;
	
	@NotNull
	Integer board_no;
	
	@NotEmpty
	String comment;
	String author;
	
	
	
	public Integer getNo() {
		return no;
	}
	public void setNo(Integer no) {
		this.no = no;
	}
	public Integer getBoard_no() {
		return board_no;
	}
	public void setBoard_no(Integer board_no) {
		this.board_no = board_no;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
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
	public Integer getType_code() {
		return type_code;
	}
	public void setType_code(Integer type_code) {
		this.type_code = type_code;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	
	@Override
	public String toString() {
		return "Comment [register_date=" + register_date + ", update_date=" + update_date + ", type_code=" + type_code
				+ ", no=" + no + ", board_no=" + board_no + ", comment=" + comment + ", author=" + author + "]";
	}
	
	
	
}
