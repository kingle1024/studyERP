<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="utf-8" session="false"%>

<!DOCTYPE html>
<html>
<head>
<title>고장 신청 문서</title>
<style>
.setPadding{
	padding:10px;
}
th,td{
	padding:2px;
}
html, body, input, textarea, select, button, table, pre, xmp, plaintext, listing{
	font-family : '맑은 고딕';
	font-size : 12px;
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
<div class="panel panel-default">
	<div class="panel-heading">
		<h3 class="panel-title">
			<i class="fa fa-paper-plane fa-fw"></i> 고장 신청 문서
		</h3>
	</div>
	<div class="panel-body">
		<div style="float:right;">
		<table cellpadding="20px" border="1">
			<tr>
				<td rowspan="2" bgcolor="#EEEAF8">결<br>재</td>
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
		<br/><br/><br/><br/><br/><br/>
		<form id="formname1" method="post" >
			<table class="table table-hover">										
				<tr>
					<td width="10%" align="center" bgcolor="#EEEAF8">제목</td><td width="90%" style="border:hidden;"><input type="text" class="form-control" name="title" id="title"></td>
				</tr>
			</table>
			<br>				
			<table class="table table-hover">
				<tr>
					<td width="10%" align="center" bgcolor="#EEEAF8">구분</td>
					<td style="border:hidden;">
						<select name="distinguish">
							<option>기자재</option>
							<option>소프트웨어</option>
							<option>하드웨어</option>
						</select>
					</td>
				</tr>
				<tr>
					<td align="center" bgcolor="#EEEAF8">물품</td>
					<td style="border:hidden;">
						<select name="item">
							<option>상하 리프트</option>
							<option>모니터</option>
							<option>키보드</option>
							<option>비쥬얼 스튜디오</option>
							<option>이클립스</option>
							<option>윈도우</option>
							<option>ram</option>
							<option>cpu</option>
							<option>기타</option>
						</select>
					</td>
				</tr>
				<tr>
					<td align="center" bgcolor="#EEEAF8">실습실 번호</td>
					<td >
					<select name="room_num">
						<option>18312</option>
						<option>18419</option>
						<option>18521</option>
					</select>
					</td>
				</tr>
				<tr>
					<td align="center" bgcolor="#EEEAF8">내용</td>
					<td><textarea cols="110" rows="10" name="content" id="content"></textarea></td>
				</tr>
				<tr>
					<td align="center" bgcolor="#EEEAF8">기타</td>
					<td><input type="text" class="form-control" name="etc"></td>
				</tr>
			</table>	
			<br><br><br>
			<input type="hidden" name="${ _csrf.parameterName }" value="${ _csrf.token }"/>
			<input type="hidden" name="type_code" value="1100">
			<input type="button" id="ReadingInfoSelectBtn" name="ReadingInfoSelectBtn" class="btn btn-lg btn-info" style="width:100%" value="결재 요청">		
		</form>
		</div>
	</div>
</body>
</html>