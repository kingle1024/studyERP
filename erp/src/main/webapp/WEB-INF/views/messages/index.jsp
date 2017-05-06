<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page pageEncoding="utf-8" session="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<link href="<c:url value="/css/bootstrap.min.css" />" rel="stylesheet">
<body>
<div class="jumbotron" id="subNav">
	<font size="6">받은 쪽지함</font> - 쪽지 기능을 수행할 수 있습니다.
</div>
	<div class="container">
	<a href="<c:url value="/messages/sendIndex " />" class="btn btn-lg btn-primary">보낸쪽지함</a><br>
		<a href="<c:url value="/messages/new" />" class="btn btn-default pull-right">
				쪽지 보내기</a><br><br>
				<table class="table table-striped">
				<thread>
				<tr>
					<th width="300px">보낸이</th>
					<th>제목</th>
					<th width="150px">날짜</th>
				</tr>
				</thread>		
				<tbody>		
				<c:forEach var="myMessage" items="${myMessages}" varStatus="status">
					<tr>
						<th>${ myMessage.send_id }</th>
						<th><a href="<c:url value="/messages/view/${ myMessage.no }" />">${ myMessage.title }</a></th>
						<th><fmt:formatDate value="${ myMessage.send_date }" pattern="yyyy-MM-dd hh:mm"/></th>
					</tr>
				</c:forEach>
				</tbody>				
<%-- 					<fmt:formatDate value="${ myMessage.send_date}" pattern="yyyy-MM-dd HH:mm:ss"/> --%>
				</table>
				<hr>
				<div class="text-center">
					<ul class="pagination">
						<li class="active"><a href="#">1</a></li>
						<li><a href="#">2</a></li>
						<li><a href="#">3</a></li>
						<li><a href="#">4</a></li>
						<li><a href="#">5</a></li>
					</ul>
				</div>
	</div>
</body>
</html>