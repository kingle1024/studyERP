<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page pageEncoding="utf-8" session="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<link href="<c:url value="/css/bootstrap.min.css" />" rel="stylesheet">
<body>
		<div class="col-md-4">
			<div class="thumbnail">
					<table>
					<tbody>
						<tr>
							<th>보낸사람</th><td>${ message.send_id }</td>
						</tr>
						<tr>
							<th>받은시간</th><td>${ message.send_date }</td>
						</tr>
						
					<tr>
					<th>제목</th><td>${ message.title }</td>
					</tr>
					<tr> 
						<th>내용</th>
					</tr>
					<tr>
						<td colspan="2">${ message.content }</td>
					</tr>
				
					</tbody>
					</table>
					
			</div>
		</div>
		<form>
			<a href="#" class="btn btn-lg btn-primary"> 답장하기</a>
		</form>
</body>
</html>