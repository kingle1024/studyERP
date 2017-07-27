<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page pageEncoding="utf-8" session="false"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
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
			<c:set var="approvalName" value="${approval.recv_id}" />
			<sec:authentication var="principal" property="principal" />
			<!-- 받는사람인 경우만 승인/반려 버튼이 보인다 -->
			<c:if test="${approvalName eq principal }">
				<input type="button" value="승인" onclick="check(1,<%=Doc %>)" />
				<input type="button" value="반려" onclick="check(2,<%=Doc %>)" />
			</c:if>
			</form>
			<div style="float:right">
			<table>
				<tr>
					<td>근장장</td><td>관리자</td>
				</tr>
				<tr>
					<c:set var="approvalYN" value="${approval.state }" />
					<c:set var="approvalstepIng" value="${approval.stepIng }" />
					<c:set var="approvalstepFinal" value="${approval.stepFinal }" />
					
					<td>
					<c:if test=${approvalstepIng eq approvalstepFinal }></c:if>
					
					승인여부
					
					</td>
					
					
					<td>승인여부</td>
				</tr>
			</table>
			</div>
			<br><br><br>
			<table>
				<tr>
					<td>제목</td><td>${approval.title }</td>
				</tr>
				<tr>
					<td>보낸이 </td><td>${approval.send_id }</td>	
				</tr>
				<tr>
					<td>보낸날짜</td><td>${approval.register_date }</td>
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