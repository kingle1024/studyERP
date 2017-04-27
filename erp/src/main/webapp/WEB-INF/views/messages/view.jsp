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
					</tbody>
					</table>
				
					<h3>${ message.title }</h3>
					<h3>${ message.content }</h3>
			</div>
		</div>
</body>
</html>