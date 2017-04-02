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
	<div class="container">
		<div class="jumbotron">
			<center>
				<h1>메세지함</h1>
			</center>
			<div class="row">
				<c:forEach var="mybook" items="${mybooks}" varStatus="status">
					<div class="col-md-4">
						<div class="thumbnail">
							<div class="caption">
								<%-- 							<h3>${ mybook.no }</h3> --%>
								<h3>${ mybook.content }</h3>
								<h3>${ mybook.email }</h3>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
</body>
</html>