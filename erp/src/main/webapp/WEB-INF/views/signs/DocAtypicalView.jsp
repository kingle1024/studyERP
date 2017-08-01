<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page pageEncoding="utf-8" session="false"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>문서 보기</title>
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
				<c:set var="approvalState" value="${ approval.state }" />
				<c:set var="approvalName" value="${ approval.recv_id}" />
				<c:set var="principal" value="${ principal  }" />
				
				<tr>
				<c:forEach var="approvalsystem" items="${ approvalSystem }" varStatus="status">
					<td class="setPadding"> ${ approvalsystem.manager }</td> <!-- 표시 -->					
				</c:forEach>
				</tr>
				<tr>
					<c:set var="check" value="${approvalSub }" />
					
					<c:if test="${empty check  }" >
						<c:if test="${ principal ne approvalName }">
						<c:forEach var="approvalsystem" items="${ approvalSystem }" varStatus="status">
							<td class="setPadding">대기1</td>
						</c:forEach>	
						</c:if>
					</c:if>
					<!-- 앞에 있는 결재 내용 만큼 뿌려준다 -->
					<c:forEach var="approvalsub" items="${ approvalSub }" varStatus="status">
					<td class="setPadding">						
						<fmt:formatDate value="${approvalsub.update_date }" pattern="yy-MM-dd HH:mm"/><br />
						${approvalsub.send_id }
					</td>
					</c:forEach>
					
					<c:if test="${ approvalState eq 0 }" >
						<c:if test="${ principal eq approvalName }">
					<td class="setPadding">	
						<input type="button" value="승인" onclick="check(1,<%=Doc %>)" />
						<br/>
						<input type="button" value="반려" onclick="check(2,<%=Doc %>)" />
					</td>
						</c:if>
					</c:if>
					
					<c:if test="${ principal eq approvalName }">					
					<!-- 다음 결재자가 몇명인지 체크해야 한다.. -->
					<c:forEach var="i" begin="${currentIng }" end="${currentLast }" step="1">
						<td>
							<center>대기2</center>
						</td>
					</c:forEach>
					</c:if>
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