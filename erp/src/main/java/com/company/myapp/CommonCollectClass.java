package com.company.myapp;

public class CommonCollectClass {
//	private String windowUploadPath = "C:\\Spring\\upload\\";
	private String commonUploadPath = "/upload/";
//	private String serverUploadPath = "/root/upload/";

	public String getCommonUploadPath() {
		return commonUploadPath;
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
				column = "<input type='text' name='"+name+"["+index+"]."+column+"' value='"+value+"'>";
				break;
			}
			case "endSubStart":{
				column = "<input type='text' name='"+name+"["+index+"]."+column+"' value='"+value+"'>";
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
				column="";
				break;
			}
				
		}
		
		return column;
	}
	
}
