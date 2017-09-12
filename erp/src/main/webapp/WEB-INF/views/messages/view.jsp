<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page pageEncoding="utf-8" session="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>받은 쪽지 보기</title>
</head>
<body>
	<div id="page-wrapper">
 <div class="row">
           <div class="col-lg-12">
               <div class="alert alert-info alert-dismissable">
                   <i class="fa fa-info-circle"></i>  <strong>받은 쪽지 보기</strong> 
               </div>
           </div>
       </div>
		<table class="table"> 
			<tbody>
				<tr>
					<th bgcolor="#EEEAF8" width="10%" nowrap><center>보낸사람</center></th><td>${sendName}(${ message.send_id })</td>
				</tr>
				<tr>
					<th bgcolor="#EEEAF8" width="10%" nowrap><center>받은시간</center></th><td><fmt:formatDate value="${ message.send_date }" pattern="yyyy-MM-dd HH:mm"/></td>							
				</tr>	
				<tr>
					<th bgcolor="#EEEAF8" width="10%" nowrap><center>제목</center></th><td>${ message.title }</td>
				</tr>
				<tr>
					<td colspan="2"><textarea class="form-control" rows="20" readonly>${message.content }</textarea></td>
				</tr>
			
			</tbody>
		</table>
		<form>
			<a href="<c:url value="/messages/answer/${ message.send_id }" />" class="btn btn-lg btn-primary">답장하기</a>
		</form>
	
	</div>
</body>
</html>