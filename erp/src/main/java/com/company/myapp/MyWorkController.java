package com.company.myapp;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.security.Principal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.poi.hssf.usermodel.HSSFDateUtil;
import org.apache.poi.hssf.util.CellRangeAddress;
import org.apache.poi.hssf.util.Region;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.FormulaEvaluator;
import org.apache.poi.ss.usermodel.IndexedColors;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.VerticalAlignment;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFCellStyle;
import org.apache.poi.xssf.usermodel.XSSFColor;
import org.apache.poi.xssf.usermodel.XSSFDataFormat;
import org.apache.poi.xssf.usermodel.XSSFFont;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.mycompany.mapper.BoardMapper;
import com.mycompany.mapper.CommonMapper;
import com.mycompany.mapper.FileMapper;
import com.mycompany.vo.FileForm;
import com.mycompany.vo.workExcel;

@Controller
@Service
public class MyWorkController {
	private static final Logger logger = LoggerFactory.getLogger(MyWorkController.class);
	
	CommonCollectClass collect = new CommonCollectClass(); // 파일 업로드 경로를 가져온다
	
	static int cnt = 0;
	
	@Autowired
	private BoardMapper boardMapper;
	
	@Autowired
	private CommonMapper commonMapper;
	
	@Autowired
	private FileMapper fileMapper;
	
	@Autowired
	private ExcelService excelService;
	
	@RequestMapping(value="/mywork", method=RequestMethod.GET)
	public String index(Model model, Principal principal){
		String userEmail = principal.getName();
		List<workExcel> workExcel = excelService.myworkList(userEmail);
		model.addAttribute("mywork", workExcel);
		return "workspaces/index";
	}
	
	@ResponseBody
	@RequestMapping(value="/workspaces/download", method=RequestMethod.GET)
	public ModelAndView download(ModelAndView model, Principal principal) throws IOException, ParseException{
		ArrayList<String> header = new ArrayList<String>();
		header.add("날짜"); header.add("요일"); header.add("근무시작"); header.add("근무종료"); header.add("근무시간"); header.add("누계"); header.add("근로상세내역");
		
		//1차로 workbook을 생성
		XSSFWorkbook workbook=new XSSFWorkbook();
		
		XSSFFont fontColorRed = workbook.createFont();
		fontColorRed.setFontName("맑은 고딕"); // 위에 있지 않으면 적용 안됨
		fontColorRed.setColor(IndexedColors.RED.getIndex());
	    
	    // font 설정
	    XSSFFont font = workbook.createFont();
	    font.setFontName("맑은 고딕"); // 위에 있지 않으면 적용 안됨
	    font.setBoldweight((short)font.BOLDWEIGHT_BOLD);
	    
		// cell style 만듬
		XSSFCellStyle cs = workbook.createCellStyle();
		cs.setAlignment(HorizontalAlignment.CENTER);
		cs.setVerticalAlignment(VerticalAlignment.CENTER);
	    cs.setBorderRight(CellStyle.BORDER_THIN);
	    cs.setBorderLeft(CellStyle.BORDER_THIN);
	    cs.setBorderTop(CellStyle.BORDER_THIN);
	    cs.setBorderBottom(CellStyle.BORDER_THIN);
	    cs.setFont(font);
	    
	    XSSFCellStyle csTime = workbook.createCellStyle();
	    csTime.setAlignment(HorizontalAlignment.CENTER);
	    csTime.setVerticalAlignment(VerticalAlignment.CENTER);
	    byte[] rgb = new byte[3];
	    rgb[0] = (byte) 197; // red	
	    rgb[1] = (byte) 217; // green
	    rgb[2] = (byte) 241; // blue
	    XSSFColor myColor = new XSSFColor(rgb); // #f2dcdb
	    csTime.setFillForegroundColor(myColor);
	    csTime.setFillPattern(CellStyle.SOLID_FOREGROUND);
	    
	    XSSFCellStyle csTimeForamt = workbook.createCellStyle();
	    csTimeForamt.setAlignment(HorizontalAlignment.CENTER);
	    csTimeForamt.setVerticalAlignment(VerticalAlignment.CENTER);
	    
	    XSSFDataFormat format = workbook.createDataFormat();
	    
	    XSSFCellStyle csTimeFormatRed = workbook.createCellStyle();
	    csTimeFormatRed.setDataFormat(format.getFormat("hh:mm"));
	    csTimeFormatRed.setFont(fontColorRed);
	    
	    XSSFCellStyle csTimeFormat = workbook.createCellStyle();
	    csTimeFormat.setDataFormat(format.getFormat("hh:mm"));
	    
	    XSSFCellStyle csMonthFormat = workbook.createCellStyle();
	    csMonthFormat.setAlignment(HorizontalAlignment.CENTER);
	    csMonthFormat.setVerticalAlignment(VerticalAlignment.CENTER);
	    XSSFDataFormat monthFormat = workbook.createDataFormat();
	    csMonthFormat.setDataFormat(format.getFormat("mm월 dd일"));
	    
		//2차는 sheet생성
		XSSFSheet sheet = workbook.createSheet("근무일지");
		//엑셀의 행
		XSSFRow row=null;
		//엑셀의 셀
		XSSFCell cell=null;
  
		collectExcelMergePosition(sheet); // merge 데이터를 밑에 따로 뺴놓았음
		
		row = sheet.createRow((short)2);
		row.setHeight((short)630);
		
		sheet.setColumnWidth(0,4850);
		sheet.setColumnWidth(1,1450);
		sheet.setColumnWidth(2,2050);
		sheet.setColumnWidth(3,2050);
		sheet.setColumnWidth(4,2050);
		sheet.setColumnWidth(5,2050);
		sheet.setColumnWidth(6,5970);
		sheet.setColumnWidth(7,2800);
		row = sheet.createRow((short)3);
		row.setHeight((short)465);
	    cell = row.createCell(0);
	    cell.setCellStyle(cs);
	    cell.setCellValue("학년도");
	    
	    cell = row.createCell(1); cell.setCellStyle(cs);  cell = row.createCell(2); cell.setCellStyle(cs);
	    
	    cell = row.createCell(3);
	    cell.setCellStyle(cs);
	    cell.setCellValue("학 기");
	    
	    
	    cell = row.createCell(4); cell.setCellStyle(cs); cell = row.createCell(5); cell.setCellStyle(cs);
	    
	    cell = row.createCell(7);
	    cell.setCellStyle(cs);
	    cell.setCellValue("담당자");
	    
	    row = sheet.createRow((short)4);
	    row.setHeight((short)465);
	    cell = row.createCell(0);
	    cell.setCellStyle(cs);
	    cell.setCellValue("학 과");
	    cell = row.createCell(1); cell.setCellStyle(cs); cell = row.createCell(2); cell.setCellStyle(cs);
	    cell = row.createCell(3);
	    cell.setCellStyle(cs);
	    cell.setCellValue("학 번");
	    cell = row.createCell(4); cell.setCellStyle(cs); cell = row.createCell(5); cell.setCellStyle(cs);
	    cell = row.createCell(7);
	    cell.setCellStyle(cs);
	    
	    
	    row = sheet.createRow((short)5);
	    row.setHeight((short)460);
	    cell = row.createCell(0);
	    cell.setCellStyle(cs);
	    cell.setCellValue("이 름");
	    cell = row.createCell(1);
	    cell.setCellStyle(cs);
	    cell = row.createCell(2);
	    cell.setCellStyle(cs);
	    cell = row.createCell(3);
	    cell.setCellStyle(cs);
	    cell.setCellValue("근무부서");
	    cell = row.createCell(4);
	    cell.setCellStyle(cs);
	    cell = row.createCell(5);
	    cell.setCellStyle(cs);
	    cell = row.createCell(7);
	    cell.setCellStyle(cs);
	    
	    row = sheet.createRow((short)6);
	    cell = row.createCell(0);
	    cell.setCellValue("* 하루 중 근로 시간이 분산되어 근무하는 경우, 각각 작성");
	    
	    row = sheet.createRow((short)7);		    
	    row.setHeight((short)540);
	    for(int i=0; i<header.size(); i++){
	    	cell = row.createCell(i);
	    	cell.setCellValue(header.get(i));
	    	cell.setCellStyle(csTime);
	    }
		    
		List<workExcel> workExcel = excelService.getExcel();
		int cnt=0;
		int startIndex=0;
		for(int i=0; i<workExcel.size(); i++){
			try{
				if(workExcel.get(i).getUserEmail().equals(principal.getName())){
					startIndex = 8+cnt+1;
					row = sheet.createRow((short)startIndex-1);
					ArrayList<Object> getColumn = new ArrayList<Object>();
					SimpleDateFormat transFormatYMD = new SimpleDateFormat("yyyy-MM-dd");
					Date toYMD = transFormatYMD.parse(workExcel.get(i).getWorkDate());
					
					getColumn.add(toYMD);
					getColumn.add(workExcel.get(i).getWeek());
					getColumn.add(moduleDayToString(workExcel.get(i).getStartTime(),1));
					getColumn.add(moduleDayToString(workExcel.get(i).getEndTime(),1));
					getColumn.add("D"+(startIndex)+"-C"+(startIndex)+"");
					
					if(cnt == 0){
						getColumn.add("+E"+(startIndex));
					}else{
						getColumn.add("F"+(startIndex-1)+"+E"+(startIndex));
					}
					getColumn.add(workExcel.get(i).getContent());
				
					for(int j=0; j<getColumn.size(); j++){
						cell = row.createCell(j);
						if(j==0){
							cell.setCellType(Cell.CELL_TYPE_NUMERIC);
							cell.setCellStyle(csMonthFormat);
							cell.setCellValue((Date)getColumn.get(j));
						}else if(j==4){ // 근무시간
							cell.setCellType(Cell.CELL_TYPE_FORMULA);
							cell.setCellStyle(csTimeFormatRed); // hh:mm format
							cell.setCellFormula((String)(getColumn.get(j)));
						}else if(j==5){
							cell.setCellType(Cell.CELL_TYPE_FORMULA);
							cell.setCellStyle(csTimeFormat); // hh:mm format
							cell.setCellFormula((String)(getColumn.get(j)));
						}
						else if(j==6){ // 근로상세내역
							sheet.addMergedRegion(new CellRangeAddress( // 셀 병합
									startIndex-1, // 시작 행 번호
									startIndex-1, // 마지막 행 번호
									j, // 시작 열 번호
									j+1  // 마지막 열 번호
									));
							cell.setCellValue((String)getColumn.get(j));
						}else{
							cell.setCellStyle(csTimeFormat);
							cell.setCellValue((String)getColumn.get(j));
						}
					}
					cnt++;
				}
			}catch(Exception e){
				
			}
		}
		row = sheet.createRow(startIndex);
		cell = row.createCell(6);
		cell.setCellValue("근로장학생 : ");
		cell = row.createCell(7);
		cell.setCellValue("(자필서명)");
		
		row = sheet.createRow(startIndex+1);
		cell = row.createCell(0);
		cell.setCellValue("** 상기와 같이 근무하였음을 확인하며, 사실과 다를 경우 근로장학금을 환불할 것을 서약합니다.");
		/* 파일명을 현재시간으로 생성 */
		Calendar calendar = Calendar.getInstance();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMddHHmmss");
		String nowTime = (String)dateFormat.format(calendar.getTime());
		File fileuploadPath = new File(collect.getCommonUploadTempPath()); 
		if(!fileuploadPath.exists()) fileuploadPath.mkdirs(); // 디겔토리가 존재하지 않으면 생성
		FileOutputStream fileoutputstream=new FileOutputStream(collect.getCommonUploadTempPath()+nowTime+".xlsx"); //디렉토리에 저장
		
		//파일을 만든다
		workbook.write(fileoutputstream);
		//필수로 닫아주어야함
		fileoutputstream.close();
        
		ModelAndView mav = new ModelAndView();
		File file = new File(collect.getCommonUploadTempPath()+nowTime+".xlsx"); // 바로 위에서 저장한 파일을 불러와서 f에 저장 
		String real_name = "근로장학생 근무일지.xlsx"; // 저장할 이름 제공 
		mav.addObject("real_name", real_name);
		mav.addObject("download", file);
		mav.setViewName("download"); // 여기서 DownloadView.java로 이동
		
		return mav;
	}
	
	@RequestMapping(value="/workspaces/form", method=RequestMethod.GET)
	public String form(){
		return "popUp/workspaces/uploadForm";
	}
	
	@RequestMapping(value="/workspaces/uploadForm", method=RequestMethod.POST)
	public String excelUploadForm(@ModelAttribute("inputForm") FileForm uploadForm, HttpSession session) throws Exception{
		int no = 0;
		HashMap<String, String> rs = collect.insertFileModule(no, uploadForm);
		String excelFileName = rs.get("path")+rs.get("save_name");
		
		session.setAttribute("excelFileName", excelFileName );
		
		return "redirect:/workspaces/uploadView";
	}
	
	@RequestMapping(value="/workspaces/upload", method=RequestMethod.POST)
	public @ResponseBody void upload(@ModelAttribute("dataForm") workExcel workExcel, @RequestParam HashMap<String, String> params, HttpServletRequest req, HttpServletResponse resp, HttpSession session, Principal principal) throws Exception{
		ArrayList<String> list = (ArrayList<String>)session.getAttribute("productlist"); //
		session.removeAttribute("productlist"); // 세션에 있는 자원 해제
		List<workExcel> workExcelList = workExcel.getExcelList();
		
		SimpleDateFormat transFormat; // 원하는 형식으로 바꾼다.
		Date end; // 종료시간을 가져온다.
		Date start; // 시작시간을 가져온다.
		long diff; // 전체 분
		long hourGet; // 시간
		long minutGet; // 시간을 제외한 분
		String minute; // 분을 String으로 변환
		// list값을 비교해서 무슨 엑셀 파일인지 구분한다. 그 뒤에 엑셀 업로드를 한다
		if(list.toString().equals(collect.getMyWorkExcelMatchingToString())){ // 무슨 엑셀 파일인지 확인 한다 
			if(null != workExcel.getExcelList() && workExcel.getExcelList().size() > 0 ){ 
				for(workExcel work : workExcelList){ // 업로드 내용을 가져온다.
					work.setUserEmail(principal.getName()); // 사용자를 판별하기 위해 현재 로그인한 사용자의 계정을 입력한다. 
			        transFormat = new SimpleDateFormat("HH:mm"); // 원하는 형식으로 바꾼다.
			        end = transFormat.parse(work.getEndTime()); // 종료시간을 가져온다.
			        start = transFormat.parse(work.getStartTime()); // 시작시간을 가져온다.
			        diff = (end.getTime() - start.getTime()) / 60000 ; 
			        hourGet = diff/60;
			        minutGet = diff%60;
			        minute = Long.toString(minutGet); 
			        if(minutGet < 10){
			        	minute = "0"+Long.toString(minutGet); // 한 자리 숫자인 경우 앞에 0을 추가한다.
			        }
			        work.setEndSubStart(Long.toString(hourGet)+":"+minute); 	
			        excelService.addExcel(work); // DB에 엑셀 업로드 내용을 저장한다.
				}
			}
		}
	}
	
	@RequestMapping(value="/workspaces/uploadView", method=RequestMethod.GET)
	public String excelUpload(Model model,HttpSession session) throws IOException{
		String filePath = (String)session.getAttribute("excelFileName");
		session.removeAttribute("excelFileName");
		FileInputStream fis= null;
		try{
			fis = new FileInputStream(filePath);
		}catch(FileNotFoundException e){
			throw new RuntimeException(e.getMessage(), e);
		}
		XSSFWorkbook workbook=new XSSFWorkbook(fis);
		int rowindex=0;
		int columnindex=0;
		List<String> excelData = new ArrayList<String>();
		ArrayList<String> headerList = new ArrayList<String>();
		ArrayList<String> array = new ArrayList<String>();
		
		ArrayList<ArrayList<String>> mGroupList = null;
	    ArrayList<String> mChildList = null;
	    
	    mGroupList = new ArrayList<ArrayList<String>>();
        mChildList = new ArrayList<String>();

		//시트 수 (첫번째에만 존재하므로 0을 준다)
		//만약 각 시트를 읽기위해서는 FOR문을 한번더 돌려준다
		XSSFSheet sheet=workbook.getSheetAt(0);
		//행의 수
		int rows=sheet.getPhysicalNumberOfRows();
		int startRowindex = 9;
		XSSFRow row;
		String value;
		XSSFCell cell;
		int cells;
		SimpleDateFormat fommatter;
		double ddata;
		ArrayList<String> columnName = new ArrayList<String>();
		/*
		 * form에 헤더 그리기
		 */
		for(rowindex=7; rowindex<8; rowindex++){ // 엑셀에서 헤더가 있는 열 
			row=sheet.getRow(rowindex);
		    if(row !=null){ 
		        //셀의 수
		        cells=row.getPhysicalNumberOfCells();
		        mChildList = new ArrayList<String>();
		        for(columnindex=0; columnindex<cells; columnindex++){
		            //셀값을 읽는다
		            cell=row.getCell(columnindex);
		            value="";
		            //셀이 빈값일경우를 위한 널체크
		            
		            if(cell==null){
		                continue;
		            }else{
		                //타입별로 내용 읽기
		                switch (cell.getCellType()){
			                case XSSFCell.CELL_TYPE_STRING:
			                    value=cell.getStringCellValue()+"";
								if(!(value.equals(""))){
									array.add(value); // 컬럼명을 하나하나 수집
								}
			                    break;
			                case XSSFCell.CELL_TYPE_BLANK:
			                    value=cell.toString()+"오류";
			                    break;
			                case XSSFCell.CELL_TYPE_ERROR:
			                    value=cell.getErrorCellValue()+"#5번#";
			                    break;
			                default:
			                  	value=cell.toString()+"오류";
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
		 * 본문 내용 가져오기
		 */
		rows=sheet.getPhysicalNumberOfRows();
		for(rowindex=startRowindex; rowindex<rows;rowindex++){ 
		    //행을읽는다
			row=sheet.getRow(rowindex);
		    if(row !=null){  
		        cells=row.getPhysicalNumberOfCells(); //셀의 수
		        for(columnindex=0; columnindex<cells; columnindex++){
		            cell=row.getCell(columnindex); //셀값을 읽는다
		            value=""; // value를 초기화
		            if(cell==null){ // 셀이 끝나면 continue;
		                continue;
		            }else{
		                //타입별로 내용 읽기
		                switch (cell.getCellType()){
			                case XSSFCell.CELL_TYPE_FORMULA:{ // 수식이 적용되어 있으면
			                	FormulaEvaluator evaluator = workbook.getCreationHelper().createFormulaEvaluator();
			                	evaluator.evaluateAll();
			                	System.out.println("계산"+evaluator.evaluateFormulaCell(cell));
			                	System.out.println("1:"+evaluator.evaluate(cell));
//			                	System.out.println("2:"+evaluator.evaluateInCell(cell));
			                	fommatter = new SimpleDateFormat("HH:mm");
//			                	
			                	System.out.println("Formula is " + cell.getCellFormula());
			                	
			                	switch(cell.getCachedFormulaResultType()) {
				                    case Cell.CELL_TYPE_NUMERIC:
				                        System.out.println("Last evaluated as: " + cell.getNumericCellValue());
				                        value = fommatter.format(cell.getNumericCellValue())+"수식1";
				                        
				                        break;
				                    case Cell.CELL_TYPE_STRING:	
				                        System.out.println("Last evaluated as \"" + cell.getRichStringCellValue() + "\"");
				                        value = fommatter.format(cell.getRichStringCellValue())+"수식2";
				                        break;
			                        default:
			                    	   value="슈발";
//			                    	   System.out.println(cell.getStringCellValue());	   
			                           break;
			                }

			                    break;
			                }
			                case XSSFCell.CELL_TYPE_NUMERIC:{ // 숫자 형식이면
			                	ddata = cell.getNumericCellValue();
			                	if( HSSFDateUtil.isCellDateFormatted(cell)){ // 시간 형식
		                			fommatter = new SimpleDateFormat("HH:mm");
			                		value = fommatter.format(cell.getDateCellValue())+"";
			                	} else if ( HSSFDateUtil.isValidExcelDate(ddata) ){ // 날짜 형식
			                		fommatter = new SimpleDateFormat("yyyy-MM-dd");
			                		value = fommatter.format(cell.getDateCellValue())+""; 
				                }
			                    break;
			                }
			                case XSSFCell.CELL_TYPE_STRING:{ // 문자 형식이면
			                    value=cell.getStringCellValue()+"";
			                    break;
			                }
			                case XSSFCell.CELL_TYPE_BLANK:{ // 공백이면
//			                    value=cell.getBooleanCellValue()+"";
			                    value=cell.toString()+"오류";
//			                    value=cell.toString()+"";
			                    break;
			                }
			                case XSSFCell.CELL_TYPE_ERROR:{ // 에러면
			                    value=cell.getErrorCellValue()+"에러";
			                    break;
			                }
		                }
		            }
		            if(value.equals("오류")){
//		            	listA.add("<font color='red'>오류</font><button>수정</button>");
		            	excelData.add(" ");
		            }else{
		            	if(array.toString().equals(collect.getMyWorkExcelMatchingToString())){ // 내작업대 문서이면
			            	columnName.add("workDate"); columnName.add("week"); columnName.add("startTime"); columnName.add("endTime"); columnName.add("endSubStart"); columnName.add("accumulate"); columnName.add("content");
			            	excelData.add(CommonCollectClass.excelUploadCategoryGetModule("excelList",rowindex-startRowindex, columnName.get(columnindex),value));
		            	}
		            }
		        }
		        excelData.add("</td><tr>");	
		    }
		}
		model.addAttribute("excelData", excelData);
		model.addAttribute("headerList", headerList);
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
		model.addAttribute("uploadHeader",mGroupList);
		session.setAttribute("productlist", array);
		
		return "popUp/workspaces/excelUpload";
		
	}
	public String moduleDayToString(String st,int num) throws ParseException{
		Date to;
		SimpleDateFormat fommat;
		if(num==1){
			SimpleDateFormat fommatter = new SimpleDateFormat("HH:mm");
			to = fommatter.parse(st);
			fommat = new SimpleDateFormat("HH:mm");
		}else{
			SimpleDateFormat fommatter = new SimpleDateFormat("yyyy-MM-dd");
			to = fommatter.parse(st);
			fommat = new SimpleDateFormat("yyyy-MM-dd");
		}
		
		return fommat.format(to);
	}
	public void collectExcelMergePosition(XSSFSheet sheet){
		sheet.addMergedRegion(new CellRangeAddress(
				3, // 시작 행 번호
				3, // 마지막 행 번호
				1, // 시작 열 번호
				2  // 마지막 열 번호
		));
		sheet.addMergedRegion(new CellRangeAddress(
				3,
				3,
				4,
				5
		));
		sheet.addMergedRegion(new CellRangeAddress(
				4,
				4,
				1,
				2
		));
		sheet.addMergedRegion(new CellRangeAddress(
				4,
				4,
				4,
				5
		));
		sheet.addMergedRegion(new CellRangeAddress(
				5,
				5,
				1,
				2
				));
		sheet.addMergedRegion(new CellRangeAddress(
				5,
				5,
				4,
				5
		));
		sheet.addMergedRegion(new CellRangeAddress(
				6,
				6,
				0,
				7
		));
		sheet.addMergedRegion(new CellRangeAddress(
				4,
				5,
				7,
				7
		));
		
		sheet.addMergedRegion(new CellRangeAddress(
				8,
				8,
				6,
				7
		));
	}
}
