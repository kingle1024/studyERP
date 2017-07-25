<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page pageEncoding="utf-8" session="false"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>비정형 문서 보기</title>
<%
	Object Doc = request.getParameter("Doc");
%>
</head>
<body>
	<div class="container">
		<div class="jumbotron">
			<form id="form1" name="form1" method="POST">
				<input type="button" value="승인" onclick="check(1,<%=Doc %>)" />
				<input type="button" value="반려" onclick="check(2,<%=Doc %>)" />
			</form>
			<table>
				<tr>
					<td>보낸이 </td><td></td>	
				</tr>
			</table>
		</div>
	</div>
<script>
function check(no, Doc){
	if(no == 1){
		$.ajax({  
			  type: 'POST',  
			  url: '${pageContext.request.contextPath}/signs/approval',  
			  data: {"Doc":Doc},  
			  success:function(data){			  
				  alert("성공");
				  window.close();
			  },
			  error:function(jqXHR, testStatus, errorThrown){
				  alert("에러 발생~~");
			  }
		});  
	}else if(no == 2){
		$.ajax({  
			  type: 'POST',  
			  url: '${pageContext.request.contextPath}/signs/reject',  
			  data: {"Doc":Doc},  
			  success:function(data){			  
				  alert("성공");
				  window.close();
			  },
			  error:function(jqXHR, testStatus, errorThrown){
				  alert("에러 발생~~");
			  }
		});   
	}
}
</script>	
</body>
</html>