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
<title>공지사항</title>
</head>
<link href="<c:url value="/css/bootstrap.min.css" />" rel="stylesheet">
<body>

<div class="jumbotron" id="subNav">
	<font size="6">공지사항</font>-공지사항 기능을 수행할 수 있습니다.
</div>
	<div class="container">
<!-- 		<div class="jumbotron" id="jumbo"> -->			
			<table border="1" class="table table-striped">
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
						<th><a href="<c:url value="/notice/view/${ board.id }" /> "> ${ board.title } </a></th>	
						<th>${ board.author }</th>
					<th><fmt:formatDate value="${ board.register_date }" pattern="yyyy-MM-dd hh:mm"/></th>
					<th>${ board.hit } </th>
					</tr>
				</c:forEach>
			</tbody>
			</table>
				<a href="<c:url value="/notice/new" />" class="btn btn-lg btn-primary" style="width:100%;">
			글쓰기</a>	
	</div>
</body>
</html>