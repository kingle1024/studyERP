package com.company.myapp;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.vo.Board;
import com.mycompany.vo.Practiceroom;
import com.mycompany.vo.User;

@Service
public class PracticeServiceImpl implements PracticeService {
    @Autowired
    private PracticeDao PracticeDao;
    
	public Practiceroom selectpractice(Practiceroom pr) {
		// TODO Auto-generated method stub
		return PracticeDao.selectpractice(pr);
	}

	public int updatepractice(Practiceroom pr) {
		// TODO Auto-generated method stub
		return PracticeDao.updatepractice(pr);
	}
	

}
