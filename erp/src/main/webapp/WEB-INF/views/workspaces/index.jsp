<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page pageEncoding="utf-8" session="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>내 작업대</title>
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
	<div class="jumbotron" id="subNav">
		<font size="6">내 작업대</font>- 내 작업대를 작성합니다
	</div>
	<div class="containerRegulate">
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
<table>
  <thead>
    <th width = "50px" align ="center">번호</th>
    <th width = "100px">날짜</th>
    <th width = "120px">근무 시간</th>
    <th width = "120px">누계 시간</th>
    <th width = "500px">내용</th>
    <th colspan="2"></th>
  </thead>
  <tbody id="my-tbody">
  </tbody>
</table>
<p>
<input type = "text" size = 10 id ="date">
<input type = "text" size = 12 id ="time">
<input type = "text" size = 12 id ="timeSum">
<input type = "text" size = 60 id ="input">

<button onclick="add_row()">추가</button>
<button onclick="delete_row()">삭제</button>
</p>
<script>
  function add_row() {
    var my_tbody = document.getElementById('my-tbody');
    var date = document.getElementById('date');
    var time = document.getElementById('time');
    var timeSum = document.getElementById('timeSum');
    var input = document.getElementById('input');
    var count = 1;

    if(my_tbody.rows.length < 30){
    // var row = my_tbody.insertRow(0); // 상단에 추가
    var row = my_tbody.insertRow( my_tbody.rows.length ); // 하단에 추가 my_tbody.rows.length
    var cell1 = row.insertCell(0);
    var cell2 = row.insertCell(1);
    var cell3 = row.insertCell(2);
    var cell4 = row.insertCell(3);
    var cell5 = row.insertCell(4);
    var cell6 = row.insertCell(5);
    var cell7 = row.insertCell(6); //나중에 for문으로 바꾸기
    
    cell1.innerHTML = count;
    cell2.innerHTML = date.value;
    cell3.innerHTML = time.value;
    cell4.innerHTML = timeSum.value;
    cell5.innerHTML = input.value;
    cell6.innerHTML = '<button onclick="add_row()">+</button>';
    cell7.innerHTML = '<button onclick="delete_row()">-</button>';
    
    count++;
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
    my_tbody.deleteRow(  my_tbody.rows.length-1); // 하단부터 삭제 my_tbody.rows.length-1
  }
  
  function delete_middle(){
     var my_tbody = document.getElementById('my-tbody');
     my_tbody.deleteRow(1);
  }
</script>
		
	</div>
	<!-- 
	엑셀 아이콘 : http://www.iconninja.com/spreadsheet-excel-table-file-xls-xls-document-icon-768
	 -->
</body>
</html>