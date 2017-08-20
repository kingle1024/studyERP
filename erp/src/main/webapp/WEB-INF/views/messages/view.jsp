<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page pageEncoding="utf-8" session="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>받은 쪽지 보기</title>
</head>
<body>
<div class="jumbotron" id="subNav">
	<font size="6">받은 쪽지 보기</font>-받은 쪽지를 볼 수 있습니다.
</div>
	<div class="container">
		<table class="table"> 
			<tbody>
				<tr>
					<th width=" " height="">보낸사람</th><td>${sendName}(${ message.send_id })</td>
				</tr>
				<tr>
					<th width="" height="">받은시간</th><td><fmt:formatDate value="${ message.send_date }" pattern="yyyy-MM-dd HH:mm"/></td>							
				</tr>	
				<tr>
					<th width="" height="">제목</th><td>${ message.title }</td>
				</tr>
				<tr>
					<td colspan="2"><textarea class="form-control" rows="20" readonly>${message.content }</textarea></td>
				</tr>
			
			</tbody>
		</table>
			
		<form>
			<a href="<c:url value="/messages/answer/${ message.send_id }" />" class="btn btn-lg btn-primary">답장하기</a>
		</form>
	
	</div>
</body>
</html>