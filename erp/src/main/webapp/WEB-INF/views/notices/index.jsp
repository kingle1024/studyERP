<%@page import="com.mycompany.vo.Message"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page pageEncoding="utf-8" session="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
#jumbo {
	padding-top: 20px;
	padding-bottom: 20px;
}
</style>
<title>공지사항</title>
</head>
<body>
 
	<div class="jumbotron" id="subNav">
		<font size="6">공지사항</font>-공지사항 기능을 수행할 수 있습니다.
	</div>
	<div class="container">
		<!-- 		<div class="jumbotron" id="jumbo"> -->
		<table class="table table-striped">
			<tr>
				<th width="70px">번호</th>
				<th>제목</th>
				<th width="70px">작성자</th>
				<th width="150px">날짜</th>
				<th width="70px">조회수</th>
			</tr>
			<tbody>
				<c:forEach var="board" items="${boardList }" varStatus="status">
					<tr>
						<th>${ board.id }</th>
						<th><a href="<c:url value="/notice/view/${ board.id }?page=${page }" /> ">
								${ board.title } </a></th>
						<th>${ board.author }</th>
						<th><fmt:formatDate value="${ board.register_date }"
								pattern="yyyy-MM-dd HH:mm" /></th>
						<th>${ board.hit }</th>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div class="text-center">
			<!-- http://coderbycode.tistory.com/111  -->
			<!-- 페이징 처리 -->
			<ul class="pagination">
				<c:if test="${page>1}"> <!-- 2페이지 이후일 때 부터 출력 -->
					<c:forEach var="previous" begin="1" end="${page-1}" step="1">
						<li><a href="<c:url value="/notices?page=${previous }" /> ">${previous}</a></li>					
					</c:forEach>
				</c:if>				
				<li class="active"><a href="#">${page}</a></li> <!-- 현재 페이지 -->
				<c:forEach var="next" begin="${page+1}" end="${lastPage}" step="1">
					<li><a href="<c:url value="/notices?page=${next }" /> ">${next }</a></li>
				</c:forEach>
			</ul>
		</div>
		<sec:authorize access="hasRole('ADMIN')">
			<a href="<c:url value="/notice/new" />"
				class="btn btn-lg btn-primary" style="width: 100%;"> 글쓰기</a>
		</sec:authorize>
	</div>
</body>
</html>