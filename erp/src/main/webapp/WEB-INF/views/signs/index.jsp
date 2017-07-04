<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page pageEncoding="utf-8" session="false"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link href="<c:url value="/css/bootstrap.min.css" />" rel="stylesheet">
</head>
<body>
	<div class="container">
		<div class="jumbotron">
			<h1>결재메뉴</h1>
			<p>views/signs/index.jsp</p>			
		</div>		
	</div>	
	<div class="container">
		<a href="#" class="btn btn-lg btn-primary" style="width: 33%;"
			onclick="window.open('<c:url value="signs/stockDoc"/>', '_blank', 'width=1300 height=750')">
			재고신청</a>
		<a href="<c:url value="#" />" class="btn btn-lg btn-primary" style="width:33%;">
			민원신청</a>
		<a href="<c:url value="#" />" class="btn btn-lg btn-primary" style="width:33%;">
			ㅁㅁ신청</a>
		<a href="<c:url value="#" />" class="btn btn-lg btn-primary" style="width:33%;">
			ㅁㅁ신청</a>
		<a href="<c:url value="#" />" class="btn btn-lg btn-primary" style="width:33%;">
			ㅁㅁ신청</a>		
		<a href="<c:url value="#" />" class="btn btn-lg btn-primary" style="width:33%;">
			ㅁㅁ신청</a>
		<a href="<c:url value="#" />" class="btn btn-lg btn-primary" style="width:33%;">
			ㅁㅁ신청</a>
		<a href="<c:url value="#" />" class="btn btn-lg btn-primary" style="width:33%;">
			ㅁㅁ신청</a>	
		<a href="<c:url value="#" />" class="btn btn-lg btn-primary" style="width:33%;">
			ㅁㅁ신청</a>
		<a href="<c:url value="#" />" class="btn btn-lg btn-primary" style="width:33%;">
			ㅁㅁ신청</a>			
	</div>
</body>
</html>