<%@ page pageEncoding="utf-8" session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>엑셀 업로드</title>
<script>
$(document).ready(function(){
	$("#ReadingInfoSelectBtn").click(function(){
		var formData = $("#formname1").serialize();
		$.ajax({
			type : "POST",
			url : "${pageContext.request.contextPath}/workspaces/uploadTest",
			cache : false,
			data : formData,
			success : function(json, status){
				alert('성공 했습니다');
			},
			error : function(request,status,error){
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
		});
	});
});
</script>
</head>
<body>
<form name="formname1" method="post">
	<table border="1" id="table" >
		<c:forEach var="headerList" items="${testList }">
		<tr>
			<c:forEach var="listL" items="${headerList }">
				<td>${listL }</td>
			</c:forEach>
		</tr>
		</c:forEach>
		<tr>
			<c:forEach var="obj" items="${listA}">
				<td> ${ obj } </td>
			</c:forEach>
		</tr>
	</table>
	<input type="hidden" value="test" name="test">
	<input type="button"  id="ReadingInfoSelectBtn" value="제출">
</form>
</body>
</html>