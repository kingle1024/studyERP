package com.company.myapp;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.vo.Practiceroom;

@Service
public class PracticeServiceImpl implements PracticeService {
    @Autowired
    private PracticeDao PracticeDao;
    
	public Practiceroom selectpractice(Practiceroom pr) {
		return PracticeDao.selectpractice(pr);
	}

	public int updatepractice(Practiceroom pr) {
		return PracticeDao.updatepractice(pr);
	}

	@Override
	public int insertPractice(Practiceroom pr) {
		return PracticeDao.insertPractice(pr);
	}
	

}
