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
<script>
window.onbeforeunload = function(e) {
	  var dialogText = 'Dialog text here';
	  e.returnValue = dialogText;
	  return dialogText;
	};
</script>
	<div class="container">
		<div class="jumbotron">
		<h1>문서 변환 테스트 </h1>
		<form>
			<table>										
				<tr>
					<td width="100px">제목</td><td width="90%"><input type="text" class="form-control" name="title"></td>
				</tr>
			</table>
			<br><br>				
			<table>
				<tr>
					<td width="100px">내용</td>
					<td width="100px"><textarea cols="110" rows="10" name="content"></textarea></td>
				</tr>
				<tr>
				</tr>
				<tr>
					<td width="100px">기타</td>
					<td width="100px"><input type="text" class="form-control" name="etc"></td>
				</tr>
			</table>	
			<button type="submit" class="btn btn-lg btn-primary" style="width:100%">전송</button>		
		</form>
		</div>
	</div>
</body>
</html>