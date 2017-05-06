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
<div class="jumbotron" id="subNav">
	<font size="6">쪽지함</font> - 쪽지 기능을 수행할 수 있습니다.
</div>

	<div class="container">
		<a href="<c:url value="/messages/new" />" class="btn btn-lg btn-primary">
				<div style="text-align:right;">쪽지 보내기</div></a><br><br>
			<div class="row">
				<c:forEach var="myMessage" items="${myMessages}" varStatus="status">
					<div class="col-md-4">
						<div class="thumbnail">
							<div class="caption">
								<h3>보낸이:${ myMessage.send_id }</h3>								
								<h3>제목:<a href="<c:url value="/messages/view/${ myMessage.no }" />">${ myMessage.title }</a></h3>
<%-- 								<h3>${ myMessage.content }</h3> --%>
								<h3>날짜:${ myMessage.send_date }</h3>
<%-- 								<h3>${ myMessage.s }</h3> --%>
<%-- 								<h3>${ myMessage.send_date }</h3> --%>
<%-- 								<fmt:formatDate value="${ myMessage.send_date}" pattern="yyyy-MM-dd HH:mm:ss"/> --%>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
	</div>
</body>
</html>