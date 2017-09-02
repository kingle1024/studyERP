<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page pageEncoding="utf-8" session="false"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>문서 보기</title>
<%
	Object Doc = request.getParameter("Doc");
%>
<style>
.setPadding {
	padding: 10px;
}
table{
	border: 1px solid #B3B3B3;
}
</style>
</head>
<body>
	<div class="">
		<div style="float: right">
			<table cellpadding="20px" border="1">
				<c:set var="approvalState" value="${ approval.state }" />
				<c:set var="approvalName" value="${ approval.recv_id}" />
				<c:set var="principal" value="${ principal  }" />
				<tr>
					<td rowspan="2" bgcolor="#EEEAF8">결<br>재
					</td>
					<c:forEach var="approvalsystem" items="${ approvalSystem }"
						varStatus="status">
						<td class="setPadding">${ approvalsystem.manager }</td>
						<!-- 표시 -->
					</c:forEach>
				</tr>
				<tr>
					<c:forEach var="i" begin="1" end="${ approvalSystem[0].lastStep }"
						step="1">
						<td class="setPadding">
							<!-- 해당 계정이 몇번째 ing인지 가져온다. 그리고 step이랑 ing랑 같으면 표시한다 --> <c:choose>
								<c:when
									test="${ approvalState eq 0 and principal eq approvalName and currentIng eq i}">
									<input type="button" value="승인" onclick="check(1,<%=Doc%>)" />
									<br />
									<input type="button" value="반려" onclick="check(2,<%=Doc%>)" />
								</c:when>
								<c:otherwise>
									<fmt:formatDate value="${approvalSub[i-1].update_date }"
										pattern="yy-MM-dd HH:mm" />
									<br />
									<c:choose>
										<c:when test="${approvalSub[i-1].state eq '1' }">
											승인
										</c:when>
										<c:when test="${approvalSub[i-1].state eq '2' }">
											반려
										</c:when>
									</c:choose>
								</c:otherwise>
							</c:choose> &nbsp;
						</td>
					</c:forEach>
				</tr>
			</table>
		</div>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<table border="1">
			<tr>
				<td width="100px" align="center" bgcolor="#EEEAF8">제 목</td>
				<td colspan="3">${approval.title }</td>
			</tr>
			<tr>
				<td width="100px" align="center" bgcolor="#EEEAF8">작 성 자</td>
				<td>${sendName }(${approval.send_id })</td>
				<td width="100px" align="center" bgcolor="#EEEAF8" nowrap>문서 번호</td>
				<td>기안 - ${approval.no }</td>
			</tr>
			<tr>
				<td width="100px" align="center" bgcolor="#EEEAF8">기 안 일</td>
				<td>${approval.register_date }</td>
				<td width="100px" align="center" bgcolor="#EEEAF8" nowrap>문서 양식</td>
				<td></td>
			</tr>
			<tr><td style="border:hidden;">&nbsp;</td></tr><tr><td style="border:hidden;">&nbsp;</td></tr>
			<c:set var="data" value="${ map }" />
			<c:if test="${data ne 'aaaa' }">
				<c:forEach var="entry" items="${map}" varStatus="status">
					<tr>
						<td align="center" bgcolor="#EEEAF8" nowrap>${entry.key }</td>
						<td>${entry.value }</td>
					</tr>
				</c:forEach>
			</c:if>
			<tr>
				<td width="100px" align="center" bgcolor="#EEEAF8">내용</td>
				<td><textarea cols="78" rows="6" readonly>${approval.content }</textarea></td>
			</tr>
			<tr>
				<td width="100px" align="center" bgcolor="#EEEAF8">기타</td>
				<td><textarea cols="78" rows="3" readonly>${approval.etc }</textarea></td>
			</tr>
		</table>
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