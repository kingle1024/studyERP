<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page pageEncoding="utf-8" session="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>내 작업대</title>
<script>
	var popupX = (window.screen.width / 2) - (200 / 2);
	// 만들 팝업창 좌우 크기의 1/2 만큼 보정값으로 빼주었음

	var popupY= (window.screen.height /2) - (300 / 2);
	// 만들 팝업창 상하 크기의 1/2 만큼 보정값으로 빼주었음
</script>
<script>
$(document).ready(function(){
	$('#ReadingExcelDownload').click(function(){
		$.ajax({
			type : "GET",
			url : "${pageContext.request.contextPath}/workspaces/downloadTest",
			success: function(json, status){
				alert('성공 했습니다');
			},
			error : function(request, status, error){
				alert('code+request.status'+'\n'+'message:'+request.responseText+'\n'+'error:'+error);
			}
		});
	});
});
</script>
</head>
<body>
	<div class="jumbotron" id="subNav">
		<font size="6">내 작업대</font>- 내 작업대를 작성합니다
	</div>
	<div class="container">
		<input type="button" id="ReadingExcelDownload" value="엑셀 다운로드" />
<%-- 		<a href="<c:url value="/upload" /> ">엑셀 업로드</a> --%>
		<a href="#" onclick="window.open('<c:url value="/workspaces/upload" />', '_blank', 'status=no, height=400, width=1000, left='+ popupX + ', top='+ popupY + ', screenX='+ popupX + ', screenY= '+ popupY)">엑셀 업로드</a>
	</div>
</body>
</html>