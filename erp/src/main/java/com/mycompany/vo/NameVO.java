package com.mycompany.vo;
import java.util.List;

public class NameVO {
	private String name;
	private List<NameVO> nameVOList;

	public List<NameVO> getNameVOList() {
		return nameVOList;
	}
	public void setNameVOList(List<NameVO> nameVOList) {
		this.nameVOList = nameVOList;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
}
