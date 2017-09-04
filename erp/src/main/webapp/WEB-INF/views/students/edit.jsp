<%@page import="com.mycompany.vo.Message"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page pageEncoding="utf-8" session="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<style>
#jumbo {
	padding-top: 20px;
	padding-bottom: 20px;
}
</style>
<title>수정 페이지</title>
</head>
<link href="<c:url value="/css/bootstrap.min.css" />" rel="stylesheet">
<body>
	<div class="jumbotron" id="subNav">
		<font size="6">건의게시판 수정</font>-건의게시판 수정을 수행할 수 있습니다.
	</div>
	<div class="container">
		<form action="<c:url value='/student/update' />" method="post"
			name="inputForm">
			<div class="form-group form-group-lg">
				<label class="control-label">게시판 제목</label> <input name="title"
					type="text" class="form-control" value="${ studentboard.title }">
			</div>
			<div class="form-group form-group-lg">
				<label class="control-label">글쓴이</label> <input name="author"
					type="text" class="form-control" value="${ studentboard.author }">
			</div>
			<div class="form-group form-group-lg">
				</script>
				<label class="control-label">내용</label>x
				<textarea rows="15" cols="30" id="text" class="form-control"
					name="content">${ studentboard.content }</textarea>
				<%--         <input name="content" type="text" class="form-control" value="${ studentboard.content }"> --%>
			</div>

			<input name="id" type="hidden" value="${ studentboard.id }">

			<button type="submit" class="btn btn-lg btn-primary">전송</button>
		</form>
	</div>

</body>
</html>