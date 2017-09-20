package com.company.myapp;

import com.mycompany.vo.Practiceroom;

public interface PracticeDao {
	
	public Practiceroom selectpractice(Practiceroom pr);
	
	public int updatepractice(Practiceroom pr);
	
	

}
