<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page pageEncoding="utf-8" session="false"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script
src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js">
</script>
<script>
	$(function() {
		$('#btn').click(function() {
			var dbTxt = $('#src').html();
			dbTxt = dbTxt.replace(/<br>/g, '\n');
			$('#trg textarea').text(dbTxt);
		});
	});
</script>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>게시글 생성</title>
<link href="<c:url value="/css/bootstrap.min.css" />" rel="stylesheet">
</head>
<body>
<div class="jumbotron" id="subNav">
	<font size="6">공지사항 작성</font>-공지사항 작성을 수행할 수 있습니다.
</div>
	<div class="container">
<%-- 			<form action="<c:url value="/admin" />" method="post"> --%>
			<form action="<c:url value="/notice" />" method="post" name="inputForm">
			 <input type="hidden" name="${ _csrf.parameterName }" value="${ _csrf.token }" />
				<div class="form-group form-group-lg">
					<label class="control-label">제목</label>					
					<input name="title" type="text" class="form-control">				
				</div>
				<div class="form-gorup form-group-lg">
					<label class="control-label">내용</label>
<!-- 					<input name="content" type="text" class="form-control">				 -->
					<textarea rows="15" cols="30" id="text" class="form-control" name="content" >${ board.content }</textarea>
				</div>
				
				<input name="author" type="text" value="${ username }" />
				
				<button type="submit" class="btn btn-lg btn-primary ">전송</button>
			</form>
	</div>
</body>
</html>