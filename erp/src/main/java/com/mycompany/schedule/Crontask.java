package com.mycompany.schedule;
import java.text.SimpleDateFormat;
import java.util.Calendar;
 
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.scheduling.config.CronTask;

public class Crontask {
    private static final Logger logger = LoggerFactory.getLogger(CronTask.class);
    
//    @Scheduled(fixedDelay=1000)
    @Scheduled(cron="0 0 02 * * ?") // 매일 새벽 2시에 실행
    public void scheduleRun() {
        Calendar calendar = Calendar.getInstance();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        
        logger.info("스케줄 실행 : " + dateFormat.format(calendar.getTime()));
    }
}
