package com.mycompany.schedule;

import java.text.SimpleDateFormat;
import java.util.Calendar;
 
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.scheduling.config.CronTask;
import org.springframework.stereotype.Service;

@Service 
public class Schedule {
	private static final Logger logger = LoggerFactory.getLogger(CronTask.class);
	
    @Scheduled(fixedDelay=5000)
    public void scheduleRun() {
        Calendar calendar = Calendar.getInstance();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        logger.info("스케줄 실행 : " + dateFormat.format(calendar.getTime()));
    }
}
