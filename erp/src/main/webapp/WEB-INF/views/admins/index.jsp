<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page pageEncoding="utf-8" session="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>admin Index</title>
</head>
<link href="<c:url value="/css/bootstrap.min.css" />" rel="stylesheet">
<body>
	<div class="container">
		<div class="jumbotron">			
			<h1>Admin</h1>
			<p>views/admins/index.jsp</p>			
		</div>		
	</div>
	<div class="container">
		<div class="jumbotron">
			<center><h1>공지사항</h1></center>
			<table border="1" class="table table-striped">
			<thread>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>시간</th>
				</tr>
			</thread>
			<tbody>
				<c:forEach var="board" items="${boards }" varStatus="status">
					<input type="hidden" value="${ board.id }">
					<tr>		
						<th>${ board.id } </th>														
						<th><a href="<c:url value="/admin/viewBoard/${ board.id }  "/> "> ${ board.title } </a></th>							
						<th>${ board.author }</th>
						<th><fmt:formatDate value="${ board.created }" pattern="yyyy-MM-dd"/></th>						
					</tr>
				</c:forEach>
			</tbody>				
			</table>
			<br><br>
		<a href="<c:url value="/admin/newBoard" />" class="btn btn-lg btn-primary" style="width:100%;">
			글쓰기</a>		
		</div>
	</div>
	<div class="container">
		<div class="jumbotron">
			<center><h1>메세지함</h1></center>
				
		</div>
	</div>
</body>
</html>