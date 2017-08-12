<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page pageEncoding="utf-8" session="false"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>고장 신청 문서</title>
<style>
.setPadding{
	padding:10px;
}
</style>
<link href="<c:url value="/css/bootstrap.min.css" />" rel="stylesheet">
</head>
<script src="<c:url value="/js/approvalModule.js" />"></script>
<body>
	<div class="container">
		<div class="jumbotron">
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
		<h1>실습실 고장 신청 문서</h1>
		<form id="formname1" method="post">
			<table>										
				<tr>
					<td width="100px">제목</td><td width="90%"><input type="text" class="form-control" name="title"></td>
				</tr>
			</table>
			<br><br>				
			<table>
			
				<tr>
					<td width="100px">구분</td>
					<td>
						<select name="distinguish">
							<option>선택</option>
							<option>기자재</option>
							<option>소프트웨어</option>
							<option>하드웨어</option>
						</select>
					</td>
				</tr>
				<tr>
					<td width="100px">물품</td>
					<td>
						<select name="item">
							<option>선택</option>
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
					<td width="100px">실습실 번호</td>
					<td>
					<select name="room_num">
						<option>선택</option>
						<option>18312</option>
						<option>18419</option>
						<option>18521</option>
					</select>
					</td>
				</tr>
				<tr>
					<td width="100px">내용</td>
					<td width="100px"><textarea cols="110" rows="10" name="content"></textarea></td>
				</tr>
				<tr>
					<td width="100px">기타</td>
					<td width="100px"><input type="text" class="form-control" name="etc"></td>
				</tr>
			</table>	
			<input type="hidden" name="${ _csrf.parameterName }" value="${ _csrf.token }"/>
			<input type="hidden" name="type_code" value="1100">
			<input type="button" id="ReadingInfoSelectBtn" name="ReadingInfoSelectBtn" class="btn btn-lg btn-primary" style="width:100%" value="제출">		
		</form>
		</div>
	</div>
</body>
</html>