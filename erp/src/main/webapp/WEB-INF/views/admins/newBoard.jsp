<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page pageEncoding="utf-8" session="false"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>게시글 생성</title>
<link href="<c:url value="/css/bootstrap.min.css" />" rel="stylesheet">
</head>
<body>
	<div class="container">
		<div class="jumbotron">		
			<h1>게시판 글쓰기</h1>
			<p>views/admins/viewBoard.jsp</p>						
		</div>		
	</div>
	<div class="container">
		<div class="jumbotron">			
			<form action="<c:url value="/admin" />" method="post">
			 <input type="hidden" name="${ _csrf.parameterName }" value="${ _csrf.token }" />
				<div class="form-group form-group-lg">
					<label class="control-label">제목</label>					
					<input name="title" type="text" class="form-control">				
				</div>
				<div class="form-gorup form-group-lg">
					<label class="control-label">내용</label>
					<input name="content" type="text" class="form-control">				
				</div>
				<div class="form-group form-group-lg">
					<label class="control-label">작성자</label>							
					<input name="author" type="text" class="form-control">		
				</div>
								
				<button type="submit" class="btn btn-lg btn-primary ">전송</button>
			</form>
		</div>
	</div>
</body>
</html>