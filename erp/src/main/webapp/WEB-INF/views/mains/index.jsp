<%@page import="com.mycompany.vo.Message"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page pageEncoding="utf-8" session="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
	<html>
<head>
<style>
	#jumbo{
		  padding-top: 20px;
  		  padding-bottom: 20px;
	}
</style>
<title>메인 페이지</title>
</head>
<body>

<div class="jumbotron" id="subNav">
	<font size="6">홈</font>-공지사항 및 쪽지 기능을 수행할 수 있습니다.(ver.2017/ )
</div>
	<div class="containerRegulate">
			<center><h1>공지사항</h1></center>			
				<a href="<c:url value="/notices" />" class="btn btn-default pull-right">
				공지사항 이동</a>
			<sec:authorize access="hasRole('ADMIN')">
				<a href="<c:url value="/notice/new" />" class="btn btn-default pull-right">
				공지사항 작성</a>
			</sec:authorize>
			
			<table class="table table-hover">
			<thread>
				<tr>
					<th width="70px">번호</th>
					<th>제목</th>
					<th width="70px">작성자</th>
					<th width="150px">날짜</th>
					<th width="70px">조회수</th>
				</tr>
			</thread>
			<tbody>
				<c:forEach var="board" items="${boards }" varStatus="status">				
					<tr>
						<th>${ board.id }</th>
						<th><a href="<c:url value="/notice/view/${ board.id }?page=1" /> "> ${ board.title } </a></th>	
						<th>${ board.author }</th>
						<th><fmt:formatDate value="${ board.register_date }" pattern="yyyy-MM-dd HH:mm"/></th>
						<th>${ board.hit } </th>
					</tr>
				</c:forEach>
			</tbody>
			</table>
			
			<center><h1>쪽지</h1></center>
		<a href="<c:url value="/messages" />" class="btn btn-default pull-right">
				쪽지함 이동</a>
		<a href="<c:url value="/messages/new" />" class="btn btn-default pull-right">
				메시지 보내기</a>
			<script>
				var popupX = (window.screen.width / 2) - (200 / 2);
				// 만들 팝업창 좌우 크기의 1/2 만큼 보정값으로 빼주었음

				var popupY= (window.screen.height /2) - (300 / 2);
				// 만들 팝업창 상하 크기의 1/2 만큼 보정값으로 빼주었음
			</script>
			<table class="table table-hover">
			<thead>
				<tr>
					<th width="250px">보낸이</th><th width="670px">제목</th><th width="100px">보낸날짜</th>
				</tr>
			</thead>
				<tbody>
				<c:forEach var="myMessage" items="${myMessages}" varStatus="status">
					<tr>
						<th>${ myMessage.send_id }</th>
						<th><a href="#" onclick="window.open('<c:url value="/messages/viewWindow/${ myMessage.no }" />', '_blank', 'status=no, height=400, width=700, left='+ popupX + ', top='+ popupY + ', screenX='+ popupX + ', screenY= '+ popupY)">${ myMessage.title }</a></th>
						<th><fmt:formatDate value="${ myMessage.send_date }" pattern="yyyy-MM-dd HH:mm"/></th>
					</tr>
				</c:forEach>
				</tbody>
			</table>
			<c:if test="${empty myMessages }">
    			<img src="<c:url value="/image/emptyContent.gif"/>">
    		</c:if>
			</div>
</body>
</html>