package com.company.myapp;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.mycompany.vo.FileForm;

@Service
public class CommonCollectClass {
	static int cnt = 0;
	
	private String commonUploadPath = "C:\\Spring\\upload\\";
	private String commonUploadTempPath = "C:\\Spring\\temp\\";
	private String commonUserProfileImagePath ="C:\\Spring\\userProfile\\";
	
//	private String commonUploadPath = "/upload/";
//	private String commonUploadTempPath = "/upload/temp/";
//	private String commonUserProfileImagePath ="/upload/userProfile/";
	
	public String getCommonUserProfileImagePath() {
		return commonUserProfileImagePath;
	}

	public void setCommonUserProfileImagePath(String commonUserProfileImagePath) {
		this.commonUserProfileImagePath = commonUserProfileImagePath;
	}

	private String myWorkExcelMatchingToString ="[날짜, 요일, 근무시작, 근무종료, 근무시간, 누계, 근로상세내역]";

	public String getMyWorkExcelMatchingToString() {
		return myWorkExcelMatchingToString;
	}

	public void setMyWorkExcelMatchingToString(String myWorkExcelMatchingToString) {
		this.myWorkExcelMatchingToString = myWorkExcelMatchingToString;
	}

	public String getCommonUploadPath() {
		return commonUploadPath;
	}

	public String getCommonUploadTempPath() {
		return commonUploadTempPath;
	}

	public void setCommonUploadTempPath(String commonUploadTempPath) {
		this.commonUploadTempPath = commonUploadTempPath;
	}

	public void setCommonUploadPath(String commonUploadPath) {
		this.commonUploadPath = commonUploadPath;
	}
	
	public static String excelUploadCategoryGetModule(String name, int index, String column, String value){
		switch(column){
			case "workDate":{
				column = "<input type='text' class='datePicker' name='"+name+"["+index+"]."+column+"' value='"+value+"' onkeypress='onlyNumber();'>";
				break;
			}
			case "week":{
				column = "<input type='text' name='"+name+"["+index+"]."+column+"' value='"+value+"'>";
				break;
			}
			case "startTime":{
				column = "<input type='text' class='timePicker' name='"+name+"["+index+"]."+column+"' value='"+value+"'>";
				break;
			}
			case "endTime":{
				column = "<input type='text' class='timePicker' name='"+name+"["+index+"]."+column+"' value='"+value+"'>";
				break;
			}
			case "endSubStart":{
				column = "<input type='text' class='timePicker' name='"+name+"["+index+"]."+column+"' value='"+value+"'>";
				break;
			}
			case "accumluate":{
				column = "<input type='text' name='"+name+"["+index+"]."+column+"' value='"+value+"'>";
				break;
			}
			case "content":{
				column = "<input type='text' name='"+name+"["+index+"]."+column+"' value='"+value+"'>";
				break;
			}
			default:{
				column="<center>-</center>";
				break;
			}
				
		}
		
		return column;
	}
	
	public HashMap<String,String> insertFileModule(int no, FileForm uploadForm) throws IOException{
		HashMap<String,String> rq = new HashMap<String,String>();
		List<String> fileNames = new ArrayList<String>();
		List<MultipartFile> files = uploadForm.getFiles(); //
		if (null != files && files.size() > 0) { // 파일이 존재하면
			Date dt = new Date();
			String sdfFiletoString  = null;
			String fileName = null;
			String pattern; // 정규식
			pattern = "(.*)\\.(.*)";
			String extension = null;
			String extensionCheck = "(txt|pdf|pptx|docx|hwp|xls|xlsx|png|PNG|jpg|JPG|war|zip|egg|sql|SQL)"; // 파일 형식 제어
			String fileUploadPath = null;
			Pattern p = null;
			Matcher m = null;
			File fileuploadPath = null;
			String path = null;
			File f = null;
			for (MultipartFile multipartFile : files) {
				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddhhmmss"); // 날짜 포맷 형식
				sdfFiletoString = sdf.format(dt).toString(); // 날짜 형식을 저장할 공간
				fileName = multipartFile.getOriginalFilename(); // 파일의 실제 이름을 가져옴.
				
				p = Pattern.compile(pattern); // 패턴을 컴파일
				m = p.matcher(fileName); // fileName에 정규식 적용
				extension = "";
				if(no==0){// 임시 파일
					fileUploadPath = getCommonUploadTempPath();
				}else if(no == -1){ // 프로필 파일
					fileUploadPath = getCommonUserProfileImagePath();
				}
				else {
					fileUploadPath = getCommonUploadPath();
				}
				// 디렉토리가 없으면 생성해준다
				fileuploadPath = new File(fileUploadPath);
				if(!fileuploadPath.exists()) fileuploadPath.mkdirs(); 
				//
				while (m.find()) {
					extension = m.group(2); // 확장자를 저장
				}
				if (Pattern.matches(extensionCheck, extension)) { // 확장자 검사를 만족하면 디비에 넣는다.
					if (cnt != 0) // for문 안에 cnt값이 있으면 계속 0 으로 초기화 되기 때문에 static으로 선언
					sdfFiletoString += cnt; // 다중 업로드 시 파일 이름을 다르게 해준다.
					rq.put("save_name", sdfFiletoString + "." + extension);
					rq.put("real_name", fileName);
					rq.put("path", fileUploadPath);
					cnt++; // 다중 업로드 인지 확인하는 부분.
//					String path = uploadForm.getUpDir() + sdfFiletoString + "." + extension; // 실제 파일 저장 하는 부분. 경로+이름+확장자
					path = fileUploadPath + sdfFiletoString + "." + extension; // 실제 파일 저장 하는 부분. 경로+이름+확장자
					f = new File(path);
					multipartFile.transferTo(f);
					fileNames.add(fileName);
				} else {
					// 뭔가 처리를 해줘야 하는데..
				}
			}
		}
		return rq; 
	}
}
