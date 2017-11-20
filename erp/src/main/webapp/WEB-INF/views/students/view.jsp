<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page pageEncoding="utf-8" session="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<style>
#jumbo {
	padding-top: 20px;
	padding-bottom: 20px;
}
</style>
<title>건의 게시판 보기</title>
</head>
<link href="<c:url value ="/resources//css/bootstrap.min.css"/>" rel="stylesheet">
<body>
	<div id="page-wrapper">
		<div class="row">
			<div class="col-lg-12">
				<div class="alert alert-info alert-dismissable">
					<i class="fa fa-comments"></i> <strong>건의 게시판 보기</strong>
				</div>
			</div>
		</div>
	<div class="container">			
			<table border="0" class="table table-inverse">					
			<tr>
				
				<th width="">작성자</th><th width="">${ studentboard.userID }</th>
			</tr>
			<tr>
				<th>작성일</th><th><fmt:formatDate value="${ studentboard.date }" pattern="yyyy-MM-dd hh:mm"/></th>
				
			</tr>
			<tr>
				<th width="">제목</th><th width="" colspan="3">${ studentboard.title }</th>
			</tr>
			<tr>
				<th colspan="4" height=""><pre>${ studentboard.content }</pre></th>
			</tr>								
			</table>				
			<hr>
			<hr>
			<table class="table table-stripeed">
				<thead>
					<tr>
						<th width="2%">작성자</th>
						<th width="19%">내용</th>
						<th width="6%">날짜</th>
						<th width="1%"></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="review" items="${review}">
						<tr>
							<td> ${review.userID}</td> 
						<td> ${review.content}</td> 
							<td><fmt:formatDate value="${ review.date }" 
									pattern="yyyy-MM-dd HH:mm" /></td> 
							<td> 
							<%-- <a href="<c:url value="/commentDelete/${board.id}/${comment.no}" />" class="btn btn-block btn-danger">삭제</a>
							 --%> </td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<form action="<c:url value="/students/review"/> " method="POST" name="reviewsForm">
				<input type="hidden" value="${ studentboard.uniqueID }" name="boardID">
				<textarea name="content" rows="2" class="form-control"></textarea>
				<button class="btn btn-block btn-primary" type="submit">댓글
					등록</button> 
			<span style="float: right;">  
		<%-- 	<a
		href="<c:url value="/notice/delete/${review.uniqueid}" />"
		class="btn btn-lg btn-primary"
		onclick="if(!confirm('삭제 하시겠습니까?')){return false;}">삭제</a>
	</span> --%>
			</form>
				<a href="<c:url value="/students"/>" class="btn btn-lg btn-primary" >목록</a>
	</div>
	</div>
</body>
</html>