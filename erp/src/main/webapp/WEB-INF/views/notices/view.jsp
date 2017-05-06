<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page pageEncoding="utf-8" session="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>view Board</title>
</head>
<link href="<c:url value="/css/bootstrap.min.css" />" rel="stylesheet">
<body>
	<div class="jumbotron" id="subNav">
	<font size="6">공지 사항 보기</font> - 공지사항을 확인할 수 있습니다.
</div>
	<div class="container">			
			<table border="1" class="table table-inverse">					
			<tr>
				<th width="2%">아이디</th><th width="2%">${ board.id }</th> 
				<th width="2%">작성자</th><th width="2%">${ board.author }</th>
			</tr>
			<tr>
				<th>작성일</th><th><fmt:formatDate value="${ board.register_date }" pattern="yyyy-MM-dd hh:mm"/></th>
				<th>수정일</th><th><fmt:formatDate value="${ board.update_date }" pattern="yyyy-MM-dd hh:mm"/></th>
			</tr>
			<tr>
				<th width="5%">제목</th><th width="5%" colspan="3">${ board.title }</th>
			</tr>
			<tr>
				<th colspan="4" height="300px">${ board.content }</th>
			</tr>								
			</table>				
		<a href="<c:url value="/notice/edit/${ board.id }" />" class="btn btn-lg btn-primary" >수정</a>
		<a href="<c:url value="/notices"/>" class="btn btn-lg btn-primary" >목록</a>
	</div>
</body>
</html>