<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page pageEncoding="utf-8" session="false"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="s"%><!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link href="<c:url value="/css/bootstrap.min.css" />" rel="stylesheet">
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
<script type="text/javascript" src="<c:url value="/js/jquery-3.2.0.min.js" />"> </script>

<title>Insert title here</title>
</head>
<body>
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
</body>
</html>