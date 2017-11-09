package com.company.myapp;


import com.mycompany.vo.Practiceroom;

public interface PracticeService {
	public Practiceroom selectpractice(Practiceroom pr);

	public int updatepractice(Practiceroom pr);

	public int insertPractice(Practiceroom pr);
}
