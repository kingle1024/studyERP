<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page pageEncoding="utf-8" session="false"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link href="<c:url value="/css/bootstrap.min.css" />" rel="stylesheet">
<title>Books New</title>
</head>
<body>
	<div class="container">
		<div class="jumbotron">
			<h1>Books NEW</h1>
			<p>views/books/new.jsp</p>
		</div>
		
<%-- 		<form action="<c:url value="/books" />" method="post" enctype="multipart/form-data"> --%>
		<form action="<c:url value="/books" />" method="post">
			<div class="form-group form-group-lg">
				<label class="control-label">도서 제목</label>
				<input name="title" type="text" class="form-control">
			</div>
			
			<div class="form-group form-group-lg">
				<label class="control-label">저자</label>
				<input name="author" type="text" class="form-control">
			</div>
			
			<div class="form-group form-group-lg">
				<label class="control-label">이미지</label>
				<input name="image" type="text" class="form-control">
<!-- 				<input name="file" type="file"> -->
			</div>
			
		<input type="hidden" name="${ _csrf.parameterName }" value="${ _csrf.token }"/>
			<button type="submit" class="btn btn-lg btn-primary">전송</button>
		</form>
	</div>
</body>
</html>