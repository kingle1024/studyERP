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
		<a href="<c:url value="/workspaces/download"/>"><img src="<c:url value="/image/excelDownloadIcon.png" />" ></a>
</span>
<span data-tooltip-text="엑셀 업로드">
		<a href="#" onclick="window.open('<c:url value="/workspaces/form" />', '_blank', 'status=no, height=400, width=1500, left='+ popupX + ', top='+ popupY + ', screenX='+ popupX + ', screenY= '+ popupY)"><img src="<c:url value="/image/excelUploadIcon.png" />" onMouseOver="this.innerHTML='엑셀 업로드'"></a>
</span>
	</div>
	
	<!-- 
	엑셀 아이콘 : http://www.iconninja.com/spreadsheet-excel-table-file-xls-xls-document-icon-768
	 -->
</body>
</html>