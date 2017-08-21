package com.mycompany.vo;

public class ApprovalSystem {
	private int no;
	private int step;
	private int lastStep;
	private String recv_id;
	private String type_code;
	private String manager;
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
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
	public String getManager() {
		return manager;
	}
	public void setManager(String manager) {
		this.manager = manager;
	}
	public int getStep() {
		return step;
	}
	public void setStep(int step) {
		this.step = step;
	}
	public int getLastStep() {
		return lastStep;
	}
	public void setLastStep(int lastStep) {
		this.lastStep = lastStep;
	}
	@Override
	public String toString() {
		return "ApprovalSystem [no=" + no + ", step=" + step + ", lastStep=" + lastStep + ", recv_id=" + recv_id
				+ ", type_code=" + type_code + ", manager=" + manager + "]";
	}
}
