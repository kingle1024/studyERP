<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page pageEncoding="utf-8" session="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>받은 쪽지 보기</title>
<style>
pre {
	border: 0;
	background-color: #ffffff;
}
</style>
</head>
<link href="<c:url value="/theme/css/bootstrap.min.css" />"
	rel="stylesheet">
<body>
	<div class="col-md-4">
		<div class="thumbnail">
		<div class="row">
			<div class="col-lg-12">
				<div class="alert alert-info alert-dismissable">
					<i class="fa fa-comments"></i> <strong>받은 쪽지 보기</strong>
				</div>
			</div>
		</div>
			<table class="table">
				<tbody>
					<tr>
						<th width="15%" bgcolor="#EEEAF8"><center>보낸사람</center></th>
						<td>${sendName }(${ message.send_id })</td>
						<td>
							<button type="button"
								onclick="location.href='javascript:window.close()' "
								class="btn btn-warning" style="width: 100%;">창닫기</button>
						</td>
					</tr>
					<tr>
						<th width="15%" bgcolor="#EEEAF8"><center>보낸시간</center></th>
						<td colspan="2"><fmt:formatDate
								value="${ message.send_date }" pattern="yyyy-MM-dd HH:mm" /></td>
					</tr>

					<tr>
						<th width="15%" bgcolor="#EEEAF8"><center>제목</center></th>
						<td colspan="2">${ message.title }</td>
					</tr>
					<tr>
						<td colspan="3" height="73px"><textarea class="form-control"
								rows="4" readonly>${ message.content }</textarea></td>
					</tr>
				</tbody>
			</table>
		</div>
		<form>
			<table>
				<tr>
					<td><a
						href="<c:url value="/messages/answer/${ message.send_id }/2" />"
						class="btn btn-lg btn-primary">답장하기</a></td>
			</table>
		</form>
	</div>
</body>
</html>