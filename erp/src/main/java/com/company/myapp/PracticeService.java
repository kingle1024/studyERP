package com.company.myapp;

import java.util.List;

import com.mycompany.vo.Board;
import com.mycompany.vo.Message;
import com.mycompany.vo.Practiceroom;
import com.mycompany.vo.User;

public interface PracticeService {

	public Practiceroom selectpractice(Practiceroom pr);

	public int updatepractice(Practiceroom pr);

}
