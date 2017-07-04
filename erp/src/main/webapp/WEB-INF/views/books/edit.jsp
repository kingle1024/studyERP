<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page pageEncoding="utf-8" session="false" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link href="<c:url value="/css/bootstrap.min.css" />" rel="stylesheet">
<title>Books EDIT</title>
</head>
<body>
	<div class="container">
		<div class="jumbotron">
			<h1>Books EDIT</h1>
			<p>views/books/edit.jsp</p>
		</div>
		
		<!-- action 값을 잘 설정해 주세요 -->
		<form action="<c:url value='/books/update' />" method="post">
			<div class="form-group form-group-lg">
				<label class="control-label">도서 제목</label>
				<input name="title" type="text" class="form-control" value="${ book.title}">
			</div>
		
			<div class="form-group form-group-lg">
				<label class="control-label">저자</label>
				<input name="author" type="text" class="form-control" value="${ book.author }">
			</div>
			
			<div class="form-group form-group-lg">
				<label class="control-label">이미지</label>
				<input name="image" type="text" class="form-control" value="${book.image }">
			</div>
			<input name="id" type="hidden" value="${book.id }">
			<button type="submit" class="btn btn-lg btn-primary">전송</button>
		</form>
	</div>
</body>
</html>