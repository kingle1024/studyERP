package com.company.myapp;

import java.io.FileInputStream;
import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalTime;
import java.time.Period;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.poi.hssf.usermodel.HSSFDateUtil;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mycompany.vo.workExcel;

@Controller
public class MyWorkController {
	
	@Autowired
	private ExcelService excelService;
	
	@RequestMapping(value="/mywork", method=RequestMethod.GET)
	public String index(ModelAndView model){
		model.addObject("message", "success");
		return "workspaces/index";
	}
	
	@RequestMapping(value="/workspaces/uploadTest", method=RequestMethod.POST)
	public @ResponseBody void uploadTest(@ModelAttribute("dataForm") workExcel workExcel, @RequestParam HashMap<String, String> params, HttpServletRequest req, HttpServletResponse resp, HttpSession session) throws Exception{
//		System.out.println(NameVo.getNameVOList().get(0).getName());
		System.out.println(workExcel.getExcelList().get(0).getContent());
		System.out.println("하이염!");
		ArrayList<String> list = (ArrayList<String>)session.getAttribute("productlist");
		
		List<workExcel> workExcelList = workExcel.getExcelList();
		/*
		 * 공백제거 하는 for문
		 */
		for(int i=0; i<list.size(); i++){
			if(list.get(i).equals("")) list.remove(i);
		}
		
		// list값을 비교해서 무슨 엑셀 파일인지 구분한다. 그 뒤에 엑셀 업로드를 한다
		if(list.toString().equals("[workDate, week, startTime, endTime, endSubStart, accumulate, content]")){
			System.out.println("들어왔어연");
			System.out.println(workExcel.getExcelList());
			if(null != workExcel.getExcelList() && workExcel.getExcelList().size() > 0 ){
				System.out.println("세개 나오기:"+workExcel.getExcelList().size());
				for(workExcel work : workExcelList){
//					work.setEndSubStart(work.getEndTime()-work.getStartTime());
			        SimpleDateFormat transFormat = new SimpleDateFormat("HH:mm");
			        Date end = transFormat.parse(work.getEndTime());
			        Date start = transFormat.parse(work.getStartTime());
			        long diff = (end.getTime() - start.getTime()) / 60000 ;
			        long hourGet = diff/60;
			        long minutGet = diff%60;
			        String minute = Long.toString(minutGet);
			        if(minutGet < 10){
			        	minute = "0"+Long.toString(minutGet);
			        }
			        work.setEndSubStart(Long.toString(hourGet)+":"+minute);	
			        excelService.addExcel(work);
				}
			}
		}
	}
	
	@RequestMapping(value="/workspaces/upload")
	public String excelUpload(Model model,HttpSession session) throws IOException{
		FileInputStream fis=new FileInputStream("C:\\Spring\\workBook.xlsx");
//		FileInputStream fis=new FileInputStream("/upload/excel");
		XSSFWorkbook workbook=new XSSFWorkbook(fis);
		int rowindex=0;
		int columnindex=0;
		List<String> listA = new ArrayList<String>();
		ArrayList<String> headerList = new ArrayList<String>();
		ArrayList<String> array = new ArrayList<String>();
		
		ArrayList<ArrayList<String>> mGroupList = null;
	    ArrayList<String> mChildList = null;
	    
	    HashMap map = new HashMap();
	    
	    mGroupList = new ArrayList<ArrayList<String>>();
        mChildList = new ArrayList<String>();

		//시트 수 (첫번째에만 존재하므로 0을 준다)
		//만약 각 시트를 읽기위해서는 FOR문을 한번더 돌려준다
		XSSFSheet sheet=workbook.getSheetAt(0);
		//행의 수
		int rows=sheet.getPhysicalNumberOfRows();
		int startRowindex = 9;
		XSSFRow row;
		
		/*
		 * get header
		 * 
		 */
		for(rowindex=8; rowindex<9; rowindex++){ 
			row=sheet.getRow(rowindex);
		    if(row !=null){ 
		        //셀의 수
		        int cells=row.getPhysicalNumberOfCells();
		        mChildList = new ArrayList<String>();
		        for(columnindex=0; columnindex<cells; columnindex++){
		            //셀값을 읽는다
		            XSSFCell cell=row.getCell(columnindex);
		            String value="";
		            //셀이 빈값일경우를 위한 널체크
		            
		            if(cell==null){
		                continue;
		            }else{
		                //타입별로 내용 읽기
		                switch (cell.getCellType()){
			                case XSSFCell.CELL_TYPE_FORMULA:{
			                	SimpleDateFormat fommatter = new SimpleDateFormat("HH:mm");
			                	value = fommatter.format(cell.getDateCellValue())+"";
			                    break;
			                }
			                case XSSFCell.CELL_TYPE_NUMERIC:{
			                	if( HSSFDateUtil.isCellDateFormatted(cell)){ // 시간 형식
		                			SimpleDateFormat fommatter = new SimpleDateFormat("HH:mm");
			                		value = fommatter.format(cell.getDateCellValue())+"";
			                	} else {
			                		double ddata = cell.getNumericCellValue();
			                		if ( HSSFDateUtil.isValidExcelDate(ddata) ){ // 날짜 형식
			                		SimpleDateFormat fommatter = new SimpleDateFormat("yyyy-MM-dd");
			                		value = fommatter.format(cell.getDateCellValue())+""; 
				                	} else {
				                		value = String.valueOf(ddata);
				                	}
			                	}
			                    break;
			                }
			                case XSSFCell.CELL_TYPE_STRING:
			                    value=cell.getStringCellValue()+"";
			                    break;
			                case XSSFCell.CELL_TYPE_BLANK:
	//		                    value=cell.getBooleanCellValue()+"";
			                    value=cell.toString()+"null";
			                    break;
			                case XSSFCell.CELL_TYPE_ERROR:
			                    value=cell.getErrorCellValue()+"#5번#";
			                    break;
		                }
		            }
		            headerList.add(value);
		            mChildList.add(value);
		        }
		        mGroupList.add(mChildList);
		        headerList.add("</td><tr>");
		    }
		}

		/*
		 * 컬럼명 가져오기
		 * 
		 */
		for(rowindex=7; rowindex<8; rowindex++){
			row = sheet.getRow(rowindex);
			if(row != null){
				int cells = row.getPhysicalNumberOfCells();
				for(columnindex=0; columnindex<cells; columnindex++){
					XSSFCell cell = row.getCell(columnindex);
					String value="";
					if(cell==null){
						continue;
					}else{
						value=cell.getStringCellValue()+"";
						array.add(value);
					}
				}
			}
		}
		System.out.print("array값:");
		for(int i=0; i<array.size(); i++){
			System.out.print(" "+array.get(i));
		}
		System.out.println("");
		
		/*
		 * 본문 내용 가져오기
		 * 
		 */
		rows=sheet.getPhysicalNumberOfRows();
		for(rowindex=startRowindex; rowindex<rows;rowindex++){ 
		    //행을읽는다
			row=sheet.getRow(rowindex);
//		    row.getRowStyle().setHidden(false); // 숨긴 셀을 가져올지 말지 설정하는 것 같음
		    if(row !=null){ 
		        //셀의 수
		        int cells=row.getPhysicalNumberOfCells();
		        System.out.println(rows);
		        for(columnindex=0; columnindex<cells-1; columnindex++){
		            //셀값을 읽는다
		            XSSFCell cell=row.getCell(columnindex);
		            String value="";
		            if(cell==null){ // 셀이 끝나면 continue;
		                continue;
		            }else{
		                //타입별로 내용 읽기
		                switch (cell.getCellType()){
			                case XSSFCell.CELL_TYPE_FORMULA:{
			                	SimpleDateFormat fommatter = new SimpleDateFormat("HH:mm");
			                	value = fommatter.format(cell.getDateCellValue())+"";
			                    break;
			                }
			                case XSSFCell.CELL_TYPE_NUMERIC:{
			                	if( HSSFDateUtil.isCellDateFormatted(cell)){ // 시간 형식
		                			SimpleDateFormat fommatter = new SimpleDateFormat("HH:mm");
			                		value = fommatter.format(cell.getDateCellValue())+"";
			                	} else {
			                		double ddata = cell.getNumericCellValue();
			                		if ( HSSFDateUtil.isValidExcelDate(ddata) ){ // 날짜 형식
			                		SimpleDateFormat fommatter = new SimpleDateFormat("yyyy-MM-dd");
			                		value = fommatter.format(cell.getDateCellValue())+""; 
				                	} else {
				                		value = String.valueOf(ddata);
				                	}
			                	}
			                    break;
			                }
			                case XSSFCell.CELL_TYPE_STRING:
			                    value=cell.getStringCellValue()+"";
			                    break;
			                case XSSFCell.CELL_TYPE_BLANK:
//			                    value=cell.getBooleanCellValue()+"";
			                    value=cell.toString()+"오류";
			                    break;
			                case XSSFCell.CELL_TYPE_ERROR:
			                    value=cell.getErrorCellValue()+"#5번#";
			                    break;
		                }
		            }
		            if(value.equals("finish")) break; 
		            if(value.equals("오류")){
		            	listA.add("<font color='red'>오류</font><button>수정</button>");
		            }else{
		            	CommonCollectClass common = new CommonCollectClass();
		            	listA.add(common.excelUploadCategoryGetModule("excelList",rowindex-startRowindex,array.get(columnindex),value));
//		            	listA.add("<input type='text' name='excelList["+(rowindex-startRowindex)+"]."+array.get(columnindex)+"' value='"+value+"' >");
		            	
		            	System.out.println(array.get(columnindex));
		            }
		        }
		        listA.add("</td><tr>");	
		    }
		}
		System.out.println(listA);
		model.addAttribute("listA",listA);
		model.addAttribute("headerList", headerList);
	    System.out.println("출력해보자");
	    /*
	     *  먼저 아래가 null인데 위에가 null이 아니면 rowspan
	     */
		for(int i=1; i<mGroupList.size(); i++){
			for(int j=0; j<mChildList.size(); j++){
                if(mGroupList.get(i).get(j).equals("null")){
                	mGroupList.get(i).set(j, mGroupList.get(i-1).get(j));
                }
            }
        }
		/*
		 * 그 다음 옆에 있는 값이 null이면 colspan
		 */
		for(int i=0; i<mGroupList.size(); i++){
			for(int j=1; j<mChildList.size(); j++){
				if(mGroupList.get(i).get(j).equals("null")){
					mGroupList.get(i).set(j, mGroupList.get(i).get(j-1));
				}
			}
		}
		model.addAttribute("testList",mGroupList);
		
		System.out.println(mGroupList);

		session.setAttribute("productlist", array);
		
		
		return "popUp/workspaces/excelUpload";
		
	}
}
