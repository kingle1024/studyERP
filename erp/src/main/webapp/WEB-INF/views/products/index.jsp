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
			<h1>재고관리</h1>
			<p>views/products/index.jsp</p>				
		</div>		
	</div>	
	<div class="container">
		<div class="jumbotron">			
			<table border="1" class="table table-striped">
			<thread>			
				<tr>
					<th>물품명</th>
					<th>위치</th>
					<th>갯수</th>
				</tr>
			</thread>
			<tbody>
				<c:forEach var="product" items="${ products }" varStatus="status">
					<tr>
						<th>${product.name }</th>
						<th>${product.location }</th>
						<th>${product.count }</th>
					</tr>
				</c:forEach>
			</tbody>
			</table>
		</div>
	</div>
</body>
</html>