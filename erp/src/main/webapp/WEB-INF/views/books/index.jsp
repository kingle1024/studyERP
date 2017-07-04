<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page pageEncoding="utf-8" session="false"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="s"%>

<html>
<head>
<meta charset="utf-8">
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link href="<c:url value="/css/bootstrap.min.css" />" rel="stylesheet">
<script type="text/javascript" src="<c:url value="/js/jquery-3.2.0.min.js" />"> </script>

<title>Books</title>
</head>
<body>


	<div class="container">
		<div class="jumbotron">
			<h1>Books INDEX</h1>
			<p>views/books/index.jsp</p>
		</div>

		<div class="row">
			<c:forEach var="book" items="${books}" varStatus="status">
				<div class="col-md-4">
					<div class="thumbnail"> 
					<c:url var="show" value="/books/${ book.id }"/>
						<a href="${ show }">
							<img src="${ book.image }" />
						</a>
						<div class="caption">
							<h3>${ book.title }
								<small>${ book.author }</small>
							</h3> 
							<s:authorize access="hasRole('ADMIN')">
								<a href="<c:url value='/books/edit/${ book.id }' />" class="btn btn-lg btn-default">수정</a>
								<a href="<c:url value='/books/delete/${ book.id }' />" class="btn btn-lg btn-danger">삭제</a>
							</s:authorize>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
		<s:authorize access="hasRole('ADMIN')">
			<a href="<c:url value="/books/new" />" class="btn btn-lg btn-primary">도서
				등록</a>
		</s:authorize>
	</div>
</body>
</html>