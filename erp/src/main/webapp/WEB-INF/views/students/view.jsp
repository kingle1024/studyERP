<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page pageEncoding="utf-8" session="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 <script src="http://code.jquery.com/jquery-latest.min.js"></script>
 <style>
 	pre {border: 0; background-color: #ffffff;}
 </style>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>view Board</title>
</head>
<link href="<c:url value="/css/bootstrap.min.css" />" rel="stylesheet">
<body>
<div class="jumbotron" id="subNav">
	<font size="6">건의게시판 보기</font> - 건의게시판을 확인할 수 있습니다.
</div>
	<div class="container">			
			<table border="0" class="table table-inverse">					
			<tr>
				<th width="100px">번호</th><th width="400px">${ studentboard.id }</th> 
				<th width="">작성자</th><th width="">${ studentboard.author }</th>
			</tr>
			<tr>
				<th>작성일</th><th><fmt:formatDate value="${ studentboard.register_date }" pattern="yyyy-MM-dd hh:mm"/></th>
				<th>수정일</th><th><fmt:formatDate value="${ studentboard.update_date }" pattern="yyyy-MM-dd hh:mm"/></th>
			</tr>
			<tr>
				<th width="">제목</th><th width="" colspan="3">${ studentboard.title }</th>
			</tr>
			<tr>
				<th colspan="4" height=""><pre>${ studentboard.content }</pre></th>
			</tr>								
			</table>				
			<sec:authorize access="hasRole('ADMIN')">
				<a href="<c:url value="/student/edit/${ studentboard.id }" />" class="btn btn-lg btn-primary" >수정</a>
				<a href="<c:url value="/student/delete/${ studentboard.id }" />" class="btn btn-lg btn-primary" onclick="if(!confirm('삭제 하시겠습니까?')){return false;}" >삭제</a>
			</sec:authorize>
				<a href="<c:url value="/students"/>" class="btn btn-lg btn-primary" >목록</a>
	</div>
</body>
</html>