<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page pageEncoding="utf-8" session="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<div class="jumbotron" id="subNav">
	<font size="6">유저 리스트</font> - 쪽지 기능을 수행할 수 있습니다.
</div>
<div class="container">
<table>
				<tr>
					<td>번호</td>
					<td>아이디</td>
					<td>비밀번호</td>
				</tr>
					<tr>
						<td>1</td>
						<td>1</td>
						<td>1</td>
						<td>1</td>
					</tr>

				<c:forEach var="obj" items="${userList}">
					<tr>
						<td>${obj.userNo}</td>
						<td>${obj.userId}</td>
						<td>${obj.userPw}</td>
						<td>${obj.email}</td>
					</tr>
				</c:forEach>
			</table>
			<c:if test="${page>1}">
				<a href="/myapp/notice?page=${page-1}">[이전]</a>
			</c:if>
			[${page}]
			<c:if test="${page<lastPage}">
				<a href="/myapp/notice?page=${page+1}">[다음]</a>
			</c:if>

</div>
</body>
</html>