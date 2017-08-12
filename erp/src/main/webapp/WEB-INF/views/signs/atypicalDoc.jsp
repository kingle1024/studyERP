<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="utf-8" session="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>결재 하기</title>
<style>
.setPadding{
	padding:10px;
}
</style>
</head>
<body>
<script>
$(function() {
	$('#btn').click(function() {
		var dbTxt = $('#src').html();
		dbTxt = dbTxt.replace(/<br>/g, '\n');
		$('#trg textarea').text(dbTxt);
	});
});
</script>
<script src="<c:url value="/js/approvalModule.js" />"></script>
	<div class="jumbotron" >
	<div style="float:right;">
	<table cellpadding="20px" border="1">
		<tr>
			<c:forEach var="approvalsystem" items="${ approvalSystem }" varStatus="status">
				<td class="setPadding"> ${ approvalsystem.manager } </td> <!-- 표시 -->	
			</c:forEach>
		</tr>
		<tr>
			<c:forEach var="approvalsystem" items="${ approvalSystem }" varStatus="status">
				<td class="setPadding">&nbsp;</td>
			</c:forEach>
		</tr>
	</table>
	</div>
	<h1>비정형 문서</h1>
<%-- 		<form id="formname1" method="post" action="<c:url value="/signs/atypicalDoc" /> "> --%>
	<form id="formname1" method="post" >
		<table>				
			<tr>
				<td width="100px">제목</td><td width="90%"><input type="text" class="form-control" name="title"></td>
			</tr>
		</table>
		<br><br>				
		<table>
			<tr>
				<td width="100px">내용</td>
				<td width="100px"><textarea cols="110" rows="10" name="content"></textarea></td>
			</tr>
			<tr>
			</tr>
			<tr>
				<td width="100px">기타</td>
				<td width="100px"><input type="text" class="form-control" name="etc"></td>
			</tr>
		</table>	
		<input type="hidden" name="${ _csrf.parameterName }" value="${ _csrf.token }"/>
		<input type="hidden" name="type_code" value="1000">
		<input type="button" id="ReadingInfoSelectBtn" name="ReadingInfoSelectBtn" class="btn btn-lg btn-primary" style="width:100%" value="제출">
	</form>
	</div>
</body>
</html>