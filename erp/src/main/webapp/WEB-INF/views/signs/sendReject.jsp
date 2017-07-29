<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page pageEncoding="utf-8" session="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
	<html>
<head>
<title>반려 문서</title>
<script>
function viewDoc(num){
	window.open("${pageContext.request.contextPath}/signs/docAtypicalView?Doc="+num, "네이버새창", "width=800, height=700, toolbar=no, menubar=no, scrollbars=yes, resizable=yes" );  
}  
</script>
</head>
<body>
	<div class="jumbotron" id="subNav">
		<font size="6">보낸 문서(반려)</font>- 반려 문서함 입니다.
	</div>
	<div class="container">
		<ul class="nav nav-tabs">
		  	<li><a href="<c:url value="/signs/send?type=sendIng" /> ">진행</a></li>
			<li><a href="<c:url value="/signs/send?type=sendApproval" /> ">승인</a></li>
		  	<li class="active"><a href="<c:url value="/signs/send?type=sendReject" /> ">반려</a></li>
		</ul>
		<table class="table table-striped">
    <thead>
      <tr>
        <th width="10%">번호</th>
        <th>제목</th>
        <th width="10%">보낸이</th>
        <th width="10%">날짜</th>
      </tr>
    </thead>
    <tbody>
    	<c:forEach var="approval" items="${approval }" varStatus="status">
    		<tr>
    			<td>${approval.no }</td>
    			<td><a href="#" onclick="viewDoc(${approval.no })">${approval.title }</a></td>
    			<td>${approval.send_id }</td>
    			<td>${approval.register_date }</td>
    		</tr>
    	</c:forEach>
    </tbody>
  </table>
	</div>
	
</body>
</html>