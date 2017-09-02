<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page pageEncoding="utf-8" session="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>보낸 쪽지 보기</title>
</head>
<body>
<div class="jumbotron" id="subNav">
	<font size="6">보낸 쪽지 보기</font> - 보낸 쪽지를 볼 수 있습니다.
</div>
	<div class="containerRegulate">
		<div class="thumbnail">
			<table class="table"> 
			<tbody>
				<tr>
					<th width=" " height="">받은사람</th><td>${recvName}(${ message.recv_id })</td>
				</tr>
				<tr>
					<th width="" height="">받은시간</th><td><c:if test="${myMessage.recv_date == null }">미수신</c:if><fmt:formatDate value="${ myMessage.recv_date }" pattern="yyyy-MM-dd hh:mm"/></td>							
				</tr>	
			<tr>
			<th width="" height="">제목</th><td>${ message.title }</td>
			</tr>
			<tr>
				<td colspan="2"><textarea class="form-control" rows="20" readonly>${message.content }</textarea></td>
			</tr>
			</tbody>
			</table>
		</div>
	</div>
</body>
</html>