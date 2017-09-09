package com.company.myapp;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.servlet.view.AbstractView;

public class DownloadView extends AbstractView {
	private static final Logger logger = LoggerFactory.getLogger(DownloadView.class);
	 public void Download(){ // download.action?name=
	        setContentType("application/download; utf-8");
	    }
	 private String getBrowser(HttpServletRequest request) {
         String header =request.getHeader("User-Agent");
         if (header.contains("MSIE")) {
                return "MSIE";
         } else if(header.contains("Chrome")) {
                return "Chrome";
         } else if(header.contains("Opera")) {
                return "Opera";
         }
         return "Firefox";
   }
	@Override
	protected void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		// TODO Auto-generated method stub
		File file = (File)model.get("download");
		String real_name = (String) model.get("real_name");
        logger.info("DownloadView --> file.getPath() : " + file.getPath());
        logger.info("DownloadView --> file.getName() : " + file.getName());
        response.setContentType(getContentType());
        response.setContentLength((int)file.length());
        
        String header = getBrowser(request);
        String docName;
        if (header.contains("MSIE")) { // 모두 UTF-8로 변환해주는 과정
           docName = URLEncoder.encode(real_name,"UTF-8").replaceAll("\\+", "%20");
           response.setHeader("Content-Disposition", "attachment;filename=" + docName + ";");
        } else if (header.contains("Firefox")) {
           docName = new String(real_name.getBytes("UTF-8"), "ISO-8859-1");
           response.setHeader("Content-Disposition", "attachment; filename=\"" + docName + "\"");
        } else if (header.contains("Opera")) {
           docName = new String(real_name.getBytes("UTF-8"), "ISO-8859-1");
           response.setHeader("Content-Disposition", "attachment; filename=\"" + docName + "\"");
        } else if (header.contains("Chrome")) {
           docName = new String(real_name.getBytes("UTF-8"), "ISO-8859-1");
           response.setHeader("Content-Disposition", "attachment; filename=\"" + docName + "\"");
        }
        response.setHeader("Content-Type", "application/octet-stream");
        response.setHeader("Content-Transfer-Encoding", "binary;");
        response.setHeader("Pragma", "no-cache;");
        response.setHeader("Expires", "-1;");
        OutputStream out = response.getOutputStream();
        FileInputStream fis = null;
        try {
            fis = new FileInputStream(file);
            FileCopyUtils.copy(fis, out);
        } catch(Exception e){
            e.printStackTrace();
        }finally{
            if(fis != null){
                try{
                    fis.close();
                }catch(Exception e){}
            }
        }// try end;
        out.flush();
	}
}
