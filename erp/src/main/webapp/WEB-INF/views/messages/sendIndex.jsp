<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page pageEncoding="utf-8" session="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>보낸 쪽지함</title>
</head>
<body>
	<div id="page-wrapper">
 <div class="row">
           <div class="col-lg-12">
               <div class="alert alert-info alert-dismissable">
                   <i class="fa fa-comments"></i>  <strong>보낸 쪽지함</strong> 
               </div>
           </div>
       </div>
	<a href="<c:url value="/messages " />" class="btn btn-lg btn-primary">받은쪽지함</a><br>
		<a href="<c:url value="/messages/new" />" class="btn btn-default pull-right">
				쪽지 보내기</a><br><br>
				<table class="table table-striped">
				<tr>
					<th width="9%" nowrap>받은이</th>
					<th>제목</th>
					<th width="10%" nowrap>전송일</th>
					<th width="10%" nowrap>수신일</th>
				</tr>
				<tbody>		
				<c:forEach var="myMessage" items="${messageList}" varStatus="status">
					<tr>
						<th>${ myMessage.recv_id }</th>
						<th><a href="<c:url value="/messages/sendView/${ myMessage.no }" />">${ myMessage.title }</a></th>
						<th><fmt:formatDate value="${ myMessage.send_date }" pattern="MM-dd HH:mm"/></th>
						<th><c:if test="${myMessage.recv_date == null }">미수신</c:if><fmt:formatDate value="${ myMessage.recv_date }" pattern="MM-dd hh:mm"/></th>
<%-- 						  <c:if test="${param.guess=='5'}">You guessed my number! --%>
					</tr>
				</c:forEach>
				</tbody>				
<%-- 					<fmt:formatDate value="${ myMessage.send_date}" pattern="yyyy-MM-dd HH:mm:ss"/> --%>
				</table>
				<c:if test="${empty messageList }">
    				<img src="<c:url value="/image/emptyContent.gif"/>" width="100%">
    			</c:if>
				<hr>
				<div class="text-center">
					<ul class="pagination">
						<c:if test="${page>1 }">
							<c:forEach var="previous" begin="1" end="${page-1 }" step="1">
								<li><a href="/myapp/messages/sendIndex?page=${previous }">${previous }</a></li>
							</c:forEach>
						</c:if>						
						<li class="active"><a href="#">${page }</a></li>
						<c:forEach var="next" begin="${page+1 }" end="${lastPage }" step="1">
							<li><a href="/myapp/messages/sendIndex?page=${next }">${next }</a></li>
						</c:forEach>
					</ul>
				</div>
				
	</div>
</body>
</html>