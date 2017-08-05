package com.mycompany.vo;

import java.util.ArrayList;
import java.util.HashMap;

public class BreakDownDocument {
	private int no;
	private String distinguish;
	private String item;
	private String room_num;
	
	public String getDistinguish() {
		return distinguish;
	}

	public void setDistinguish(String distinguish) {
		this.distinguish = distinguish;
	}

	public String getItem() {
		return item;
	}

	public void setItem(String item) {
		this.item = item;
	}

	public String getRoom_num() {
		return room_num;
	}

	public void setRoom_num(String room_num) {
		this.room_num = room_num;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	@Override
	public String toString() {
		return "BreakDownDocument [no=" + no + ", distinguish=" + distinguish + ", item=" + item + ", room_num="
				+ room_num + "]";
	}

	public HashMap<Object, Object> getMap(){
		HashMap<Object, Object> map = new HashMap<Object,Object>();
		map.put("���屸��", getDistinguish());
		map.put("��ǰ", getItem());
		map.put("�ǽ��ǹ�ȣ", getRoom_num());
		return map;
	}
	
}
