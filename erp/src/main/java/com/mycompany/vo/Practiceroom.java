package com.mycompany.vo;

public class Practiceroom {
	private int no;
	private String information;
	private String program;
	private String img1_org;
	private String img1_fake;
	private String img2_org;
	private String img2_fake;
	private String img3_org;
	private String img3_fake;
	private String img4_org;
	private String img4_fake;
	private String path;
	
	public String getImg1_org() {
		return img1_org;
	}
	public void setImg1_org(String img1_org) {
		this.img1_org = img1_org;
	}
	public String getImg1_fake() {
		return img1_fake;
	}
	public void setImg1_fake(String img1_fake) {
		this.img1_fake = img1_fake;
	}
	public String getImg2_org() {
		return img2_org;
	}
	public void setImg2_org(String img2_org) {
		this.img2_org = img2_org;
	}
	public String getImg2_fake() {
		return img2_fake;
	}
	public void setImg2_fake(String img2_fake) {
		this.img2_fake = img2_fake;
	}
	public String getImg3_org() {
		return img3_org;
	}
	public void setImg3_org(String img3_org) {
		this.img3_org = img3_org;
	}
	public String getImg3_fake() {
		return img3_fake;
	}
	public void setImg3_fake(String img3_fake) {
		this.img3_fake = img3_fake;
	}
	public String getImg4_org() {
		return img4_org;
	}
	public void setImg4_org(String img4_org) {
		this.img4_org = img4_org;
	}
	public String getImg4_fake() {
		return img4_fake;
	}
	public void setImg4_fake(String img4_fake) {
		this.img4_fake = img4_fake;
	}
//	public String getPath() {
//		return path;
//	}
//	public void setPath(String path) {
//		this.path = path;
//	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getInformation() {
		return information;
	}
	public void setInformation(String information) {
		this.information = information;
	}
	public String getProgram() {
		return program;
	}
	public void setProgram(String program) {
		this.program = program;
	}
	@Override
	public String toString() {
		return "Practiceroom [no=" + no + ", information=" + information + ", program=" + program + ", img1_org="
				+ img1_org + ", img1_fake=" + img1_fake + ", img2_org=" + img2_org + ", img2_fake=" + img2_fake
				+ ", img3_org=" + img3_org + ", img3_fake=" + img3_fake + ", img4_org=" + img4_org + ", img4_fake="
				+ img4_fake + ", path=" + path + "]";
	}
	
	
	
	
	
	

}
