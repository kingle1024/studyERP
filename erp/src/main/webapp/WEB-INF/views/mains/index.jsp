<%@page import="com.mycompany.vo.Message"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page pageEncoding="utf-8" session="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
	<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<style>
	#jumbo{
		  padding-top: 20px;
  padding-bottom: 20px;
	}
</style>
<title>메인 페이지</title>
</head>
<link href="<c:url value="/css/bootstrap.min.css" />" rel="stylesheet">
<body>

<div class="jumbotron" id="subNav">
	<font size="6">홈</font>-공지사항 및 쪽지 기능을 수행할 수 있습니다.
</div>
	<div class="container">
<!-- 		<div class="jumbotron" id="jumbo"> -->
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
					<tr>
						<th>${ board.id }</th>
						<th><a href="<c:url value="/admin/viewBoard/${ board.id }" /> "> ${ board.title } </a></th>	
						<th>${ board.author }</th>
					<th><fmt:formatDate value="${ board.created }" pattern="yyyy-MM-dd hh:mm"/></th>
					</tr>
				</c:forEach>
			</tbody>
			</table>
		</div>
		<div class="jumbotron">
		<a href="<c:url value="/messages/new" />" class="btn btn-lg btn-primary">
				메시지 보내기</a>
		<a href="<c:url value="/messages" />" class="btn btn-lg btn-primary">
				쪽지함 이동</a>
				
				<br><br>
			<div class="row">
						<div class="thumbnail">
							<div class="caption">
			<table>
			<script>
				var popupX = (window.screen.width / 2) - (200 / 2);
				// 만들 팝업창 좌우 크기의 1/2 만큼 보정값으로 빼주었음

				var popupY= (window.screen.height /2) - (300 / 2);
				// 만들 팝업창 상하 크기의 1/2 만큼 보정값으로 빼주었음
			</script>
				<tr>
					<th width="250px">보낸이</th><th width="500px">제목</th><th width="100px">보낸날짜</th>
				</tr>
				<tbody>
				<c:forEach var="myMessage" items="${myMessages}" varStatus="status">
							<tr>
								<th><h3>${ myMessage.send_id }</h3></th>
								<th><h3><a href="#" onclick="window.open('<c:url value="/messages/viewWindow/${ myMessage.no }" />', '_blank', 'status=no, height=300, width=700, left='+ popupX + ', top='+ popupY + ', screenX='+ popupX + ', screenY= '+ popupY)">${ myMessage.title }</a></h3></th>
								<th><fmt:formatDate value="${ myMessage.send_date }" pattern="yyyy-MM-dd hh:mm"/></th>
<%-- 								<th><h3>${ myMessage.send_date }</h3></th> --%>
<%-- <fmt:parseDate var="parsedDate" value="${myMessage.send_date}" pattern="dd-MM-yyyy HH:mm:ss"/> --%>
							</tr>
				</c:forEach>
				</tbody>
			</table>
							</div>
						</div>
			</div>
		</div>
	</div>
</body>
</html>