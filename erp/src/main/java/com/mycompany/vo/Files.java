package com.mycompany.vo;

public class Files {
	private int no;
	private int board_no;
	private String save_name;
	private String real_name;
	private String path;
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
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	@Override
	public String toString() {
		return "Files [no=" + no + ", board_no=" + board_no + ", save_name=" + save_name + ", real_name=" + real_name
				+ ", path=" + path + "]";
	}
}
