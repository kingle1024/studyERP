<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page pageEncoding="utf-8" session="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">

<title>메인 페이지</title>
</head>
<link href="<c:url value="/css/bootstrap.min.css" />" rel="stylesheet">
<body>
쓰이는곳없을듯
<!-- <div class="jumbotron" id="jumbo"> -->
<!-- 	<font size="6">홈</font>-공지사항 및 쪽지 기능을 수행할 수 있습니다. -->
<!-- </div> -->
<!-- 	<div class="container"> -->
<!-- 		<div class="jumbotron"> -->
<%-- 			<center><h1>공지사항</h1></center> --%>
<!-- 			<table border="1" class="table table-striped"> -->
<!-- 			<thread> -->
<!-- 				<tr> -->
<!-- 					<th>제목</th> -->
<!-- 					<th>작성자</th> -->
<!-- 					<th>시간</th> -->
<!-- 				</tr> -->
<!-- 			</thread> -->
<!-- 			<tbody> -->
<%-- 				<c:forEach var="board" items="${boards }" varStatus="status">				 --%>
<!-- 					<tr> -->
<%-- 						<th><a href="http://localhost:8181/myapp/admin/viewBoard/${board.id}">${ board.title }</th></a>	 --%>
<%-- 						<th>${ board.author }</th> --%>
<%-- 						<th><fmt:formatDate value="${ board.created }" pattern="yyyy-MM-dd"/></th> --%>
<!-- 					</tr> -->
<%-- 				</c:forEach> --%>
<!-- 			</tbody> -->
<!-- 			</table> -->
<!-- 		</div> -->
<!-- 	</div> -->
<!-- 	<div class="container"> -->
<!-- 		<div class="jumbotron"> -->
<%-- 		<a href="<c:url value="/messages/new" />" class="btn btn-lg btn-primary"> --%>
<!-- 				메시지 보내기</a><br><br> -->
<!-- 			<div class="row"> -->
<%-- 				<c:forEach var="mybook" items="${mybooks}" varStatus="status"> --%>
<!-- 					<div class="col-md-4"> -->
<!-- 						<div class="thumbnail"> -->
<!-- 							<div class="caption"> -->
<%-- 															<h3>${ mybook.no }</h3> --%>
<%-- 								<h3>${ mybook.content }</h3> --%>
<%-- 								<h3>${ mybook.email }</h3> --%>
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 					</div> -->
<%-- 				</c:forEach> --%>
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 	</div> -->
</body>
</html>