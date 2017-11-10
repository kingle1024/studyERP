<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page pageEncoding="utf-8" session="false"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<!-- 라이브러리 로드 순서는 아래와 같다. cdnjs 저장소에서 라이브러리를 로드하였다. -->

 <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/3.0.0/css/bootstrap-datetimepicker.min.css" rel="stylesheet" />
  <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.8.2/moment-with-locales.min.js"></script>
   <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/3.0.0/js/bootstrap-datetimepicker.min.js"></script>

        <script>
        
        $('#date').datetimepicker({ language : 'ko', pickTime : false, defalutDate : new Date() });

      
         $(function() {
           
                $("#btn_reset").click(function(){
                   $("#reset_form").each(function(){
                      this.reset();
                   })
                })
             });

        </script>
        <!-- 달력 여기까지 -->
     <!--시간 입력 - timeepicker -->

<style>
[data-tooltip-text]:hover {
	position: relative;
}
[data-tooltip-text]:after {
	-webkit-transition: bottom .3s ease-in-out, opacity .3s ease-in-out;
	-moz-transition: bottom .3s ease-in-out, opacity .3s ease-in-out;
	transition: bottom .3s ease-in-out, opacity .3s ease-in-out;
	background-color: rgba(0, 0, 0, 0.8);
	-webkit-box-shadow: 0px 0px 3px 1px rgba(50, 50, 50, 0.4);
	-moz-box-shadow: 0px 0px 3px 1px rgba(50, 50, 50, 0.4);
	box-shadow: 0px 0px 3px 1px rgba(50, 50, 50, 0.4);
	-webkit-border-radius: 5px;
	-moz-border-radius: 5px;
	border-radius: 5px;
	color: #FFFFFF;
	font-size: 12px;
	margin-bottom: 10px;
	padding: 7px 12px;
	position: absolute;
	width: auto;
	min-width: 50px;
	max-width: 300px;
	word-wrap: break-word;
	z-index: 9999;
	opacity: 0;
	left: -9999px;
	top: 90%;
	content: attr(data-tooltip-text);
}
[data-tooltip-text]:hover:after {
	top: 130%;
	left: 0;
	opacity: 1;
}
</style>
<style>
	table { border-collapse:collapse; text-align:center; }  
	th, td { border:1px solid gray; }
</style>
<script>
	var popupX = (window.screen.width / 2) - (200 / 2);
	// 만들 팝업창 좌우 크기의 1/2 만큼 보정값으로 빼주었음

	var popupY= (window.screen.height /2) - (300 / 2);
	// 만들 팝업창 상하 크기의 1/2 만큼 보정값으로 빼주었음
</script>
</head>
<body>
<div id="page-wrapper">

	 <div class="row">
           <div class="col-lg-12">
               <div class="alert alert-info alert-dismissable">
                   <i class="fa fa-folder-open"></i>  <strong>내 작업대</strong> 
               </div>
           </div>
     </div>
	
		<!-- 		<input type="button" id="ReadingExcelDownload" value="엑셀 다운로드" /> -->
		<span data-tooltip-text="엑셀 다운로드"> 
			<a href="<c:url value="/workspaces/download"/>">
				<img src="<c:url value="/image/excelDownloadIcon.png" />">
			</a>
		</span> 
		<span data-tooltip-text="엑셀 업로드"> 
			<a href="#" onclick="window.open('<c:url value="/workspaces/form" />', '_blank', 'status=no, height=400, width=1500, left='+ popupX + ', top='+ popupY + ', screenX='+ popupX + ', screenY= '+ popupY)">
				<img src="<c:url value="/image/excelUploadIcon.png" />" onMouseOver="this.innerHTML='엑셀 업로드'">
			</a>
		</span>
		
<hr>
<table class="table table-striped">
	<tr>
		<td>번호</td>
		<td>날짜</td>
		<td>근무시작</td>
		<td>근무종료</td>
		<td>근무시간</td>
		<td>내용</td>
	</tr>
	<c:forEach var="mywork" items="${ mywork }" varStatus="status" >
		<tr>
			<td>${ status.count }</td>
			<td>${ mywork.workDate }</td>
			<td>${ mywork.startTime }</td>
			<td>${ mywork.endTime }</td>
			<td>${ mywork.endSubStart }</td>
			<td>${ mywork.content }</td>
		</tr>
	</c:forEach>
</table>
<br><br>
<!-- <table>
  <thead>
  	<tr>
	  	<th width = "50" align ="center">번호</th>
	    <th width = "100">날짜</th>
	    <th width = "120">근무 시작</th>
	    <th width = "120">근무 종료</th>
	    <th width = "120">근무 시간</th>
	    <th width = "120">누계 시간</th>
	    <th width = "500">내용</th>
	    <th></th>
	    <th></th>
    </tr>
  </thead> 
  <tbody id="my-tbody">
  </tbody>
 
</table> -->
<form action='<c:url value="/table" />' method="post" id="reset_form" >
날짜
<input name ="Date" type = "text" size="10" id="date" >
시작시간
<input name ="time_start"  type = "text" size = 12 id ="time_start" >
종료시간
<input name ="time_end"  type = "text" size = 12 id ="time_end">
근로시간
<input name ="work_time" type = "text" size = 12 id ="work_time">
내용
<input name ="Context" type = "text" size = 60 id ="input" >

<button type="submit" onclick="add_row()">저장</button>
</form>
<div id = "result"></div>
</p>
<!-- <button id="btn_reset" onclick="add_row()">추가</button>
<button onclick="delete_row()">삭제</button>  -->


<script>

$(function() {
    $.datepicker.setDefaults($.datepicker.regional['ko']); //datepicker 한국어로 사용하기 위한 언어설정
    $('#date').datepicker();
  });
  
  
  $(function() {               
     // $('#time_start').timepicker();
      var date1 = new Date($('#time_start').timepicker());
   //   return date1;
    });
  
  $(function() {               
     // $('#time_end').timepicker();
      var date2 = new Date($('#time_end').timepicker());
   //   return date2;
    });
             
  
  $(function(){
      $("#btn_reset").click(function(){
         $("#reset_form").each(function(){
            this.reset();
         })
      })
   });
  

  var count = 0;
  var data = new Array();
  function add_row() {
    var my_tbody = document.getElementById('my-tbody');
    var date = document.getElementById('date');
    var time_start = document.getElementById('time_start');
    var time_end = document.getElementById('time_end');
    var timeSum = document.getElementById('timeSum');
    var input = document.getElementById('input');
    var tableNum = count;
    
   

    if(my_tbody.rows.length < 30){
    // var row = my_tbody.insertRow(0); // 상단에 추가
    var row = my_tbody.insertRow( my_tbody.rows.length ); // 하단에 추가 my_tbody.rows.length
    var cell1 = row.insertCell(0);
    var cell2 = row.insertCell(1);
    var cell3 = row.insertCell(2);
    var cell4 = row.insertCell(3);
    var cell5 = row.insertCell(4);
    var cell6 = row.insertCell(5);
    var cell7 = row.insertCell(6);
    var cell8 = row.insertCell(7);
    var cell9 = row.insertCell(8); //나중에 for문으로 바꾸기
  
    
    cell1.innerHTML = my_tbody.rows.length;
    cell2.innerHTML = date.value;
    cell3.innerHTML = time_start.value;
    cell4.innerHTML = time_end.value;
    cell5.innerHTML = time_end.value - time_start.value;
    cell6.innerHTML = timeSum.value;
    cell7.innerHTML = input.value;
    cell8.innerHTML = '<button onclick="add_row()">+</button>';
    cell9.innerHTML = '<button onclick="delete_middle() id='+ count +'">-</button>';
    

   
    count ++;
  }
    else
    	{
    		alert("더이상 생성할 수 없습니다.");
    		return;
    	}

  }

  function delete_row() {
    var my_tbody = document.getElementById('my-tbody');
    if (my_tbody.rows.length < 1) {
    	alert("삭제할 행이 없습니다.");
    	return;
    }
    // my_tbody.deleteRow(0); // 상단부터 삭제
    my_tbody.deleteRow(my_tbody.rows.length-1); // 하단부터 삭제 my_tbody.rows.length-1
    count --;
  }
  function update_row(){
	  var my_tbody = document.getElementById('my-tbody');
	  
  }
  function delete_middle(){
	  var my_tbody = document.getElementById('my-tbody');
	 
	  my_tbody.deleteRow(document.getElementById('count'));
  }
  
  //document.write(my_tbody.);
</script>
	<!-- 	<button onclick="add_row()">저장</button> -->
	</div>
	<!-- 
	엑셀 아이콘 : http://www.iconninja.com/spreadsheet-excel-table-file-xls-xls-document-icon-768
	 -->
	 
</body>
</html>