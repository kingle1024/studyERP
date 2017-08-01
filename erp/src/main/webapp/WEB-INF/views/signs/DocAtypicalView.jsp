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
<style>
	.setPadding{
		padding:10px;
	}
</style>
</head>
<body>
	<div class="container">
		<div class="jumbotron">
			<form id="form1" name="form1" method="POST">
			
			<!-- 받는사람인 경우만 승인/반려 버튼이 보인다 -->
			
			</form>
			<div style="float:right">
			<table cellpadding="20px" border="1">
				<tr>
					<td class="setPadding">근장장</td><td class="setPadding">관리자</td>
				</tr>
				<tr>
					<c:set var="approvalState" value="${ approval.state }" />
					<c:set var="approvalName" value="${ approval.recv_id}" />
					<c:set var="principal" value="${ principal  }" />
					<td class="setPadding">
						<c:if test="${ approvalState eq 0 }" >
							<c:if test="${ principal eq approvalName }">
								<input type="button" value="승인" onclick="check(1,<%=Doc %>)" /><br>
								<input type="button" value="반려" onclick="check(2,<%=Doc %>)" />
							</c:if>
						</c:if>
					</td>
					<td class="setPadding">
						<c:if test="${ approvalState eq 0 }" >
							<c:if test="${ principal eq approvalName }">
								<input type="button" value="승인" onclick="check(1,<%=Doc %>)" /><br>
								<input type="button" value="반려" onclick="check(2,<%=Doc %>)" />
							</c:if>
						</c:if>
					</td>
				</tr>
			</table>
			</div>
			<br><br><br>
			<table>
				<tr>
					<th width="12%">제목</th><td>${approval.title }</td>
				</tr>
				<tr>
					<th>보낸이 </th><td>${approval.send_id }</td>	
				</tr>
				<tr>
					<th>보낸날짜</th><td>${approval.register_date }</td>
				</tr>
				<tr>
					<th>내용</th><td><textarea cols="63" rows="6" readonly>${approval.content }</textarea></td>
				</tr>
				<tr>
					<th>기타</th><td><textarea cols="63" rows="2" readonly>${approval.etc }</textarea></td>
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