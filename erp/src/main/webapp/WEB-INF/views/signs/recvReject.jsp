<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page pageEncoding="utf-8" session="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
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
	<div id="page-wrapper">
 <div class="row">
           <div class="col-lg-12">
               <div class="alert alert-info alert-dismissable">
                   <i class="fa fa-paper-plane"></i>  <strong>받은 문서(반려)</strong> 
               </div>
           </div>
       </div>	</div>
		<ul class="nav nav-tabs">
			<li><a href="<c:url value="/signs/recv?type=recvWaiting" /> ">대기</a></li>
			<li><a href="<c:url value="/signs/recv?type=recvIng" /> ">진행</a></li>
			<li><a href="<c:url value="/signs/recv?type=recvApproval" /> ">승인</a></li>
			<li class="active"><a
				href="<c:url value="/signs/recv?type=recvReject" /> ">반려</a></li>
		</ul>
		<table class="table table-striped">
			<thead>
				<tr>
					<th width="10%" nowrap>번호</th>
					<th>제목</th>
					<th width="10%" nowrap>보낸이</th>
					<th width="10%" nowrap>날짜</th>
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
		<c:if test="${empty approval }">
    		<img src="<c:url value="/image/emptyContent.gif"/>" width="100%">
    	</c:if>
	</div>
</body>
</html>