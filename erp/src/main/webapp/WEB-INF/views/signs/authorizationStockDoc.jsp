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
		<h1>재고신청</h1>
		<form>
			<table>
				<tr>
					<td width="100px">기안자</td>
					<td width=""><input type="text" class="form-control"></td>					
				</tr>
				<tr>
					<td width="100px">기안일</td>
					<td width=""><input type="text" class="form-control"></td>					
				</tr>				
			</table>		
			<br><br>	
			<table>										
				<tr>
					<td width="100px">제목</td><td width=""><input type="text" class="form-control"></td>
					<td width="100px"></td>
					<td width="">수신자</td><td width=""><input type="text" class="form-control"></td>					
				</tr>				
			</table>
			<br><br>				
			<table>
				<tr>
					<td width="100px">신청제품</td>
					<td width=""><input type="text" class="form-control"></td>					
				</tr>
				<tr>
					<td width="100px">신청수량</td>
					<td width=""><input type="text" class="form-control"></td>
				</tr>
				<tr>
					<td width="100px">비고</td>
					<td width=""><input type="text" class="form-control"></td>
				</tr>
			</table>	
			<button type="submit" class="btn btn-lg btn-primary ">전송</button>		
		</form>
		</div>
	</div>
</body>
</html>