package com.mycompany.vo;

public class Files {
	int no;
	int board_no;
	String save_name;
	String real_name;
	String path;
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getBoard_no() {
		return board_no;
	}
	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}

	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	public String getSave_name() {
		return save_name;
	}
	public void setSave_name(String save_name) {
		this.save_name = save_name;
	}
	public String getReal_name() {
		return real_name;
	}
	public void setReal_name(String real_name) {
		this.real_name = real_name;
	}
	@Override
	public String toString() {
		return "Files [no=" + no + ", board_no=" + board_no + ", save_name=" + save_name + ", real_name=" + real_name
				+ ", path=" + path + "]";
	}
	
}
