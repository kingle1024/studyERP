package com.mycompany.schedule;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.scheduling.config.CronTask;
import org.springframework.stereotype.Service;

import com.company.myapp.CommonCollectClass;

@Service 
public class Schedule {
	CommonCollectClass collect = new CommonCollectClass();
	private static final Logger logger = LoggerFactory.getLogger(Schedule.class);
	
	@Scheduled(cron = "0 0 02 * * ?") // 매일 새벽 2시에 실행
    public void scheduleRun() {
    	run(collect.getCommonUploadTempPath());
    }
    public void run(String path){
    	path = collect.getCommonUploadTempPath();
		Calendar calendar = Calendar.getInstance();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

		// 해당하는 Path에 대한 파일들을 배열로 받기 위하여 객체 생성
		File[] listFile = new File(path).listFiles();
		try {
			// 파일이 갯수가 0보다 크면
			if (listFile.length > 0) {
				// 파일 갯수 만큼 반복
				for (int i = 0; i < listFile.length; i++) {
					logger.info("## 파일 존재 유무 : " + listFile[i].isFile());
					// 파일이 존재하면 해당 파일을 삭제하고 없으면 디렉토리를 삭제
					if (listFile[i].isFile()) {
						logger.info("## 파일 목록 : " + listFile[i]);
						listFile[i].delete();
					} else {
						/*
						 * 재귀적 함수를 호출하여 서브 디렉토리에 있는 파일들을 삭제 처리하고 최종적으로 디렉토리를
						 * 삭제처리
						 */
						run(listFile[i].getPath());
						logger.info(listFile[i].getPath());
					}
					listFile[i].delete();
				}
			}
			System.out.println("스케줄 실행 : " + dateFormat.format(calendar.getTime()));
		} catch (Exception e) {
			System.err.println(System.err);
			System.exit(-1);
		}
    }
    
    
}
