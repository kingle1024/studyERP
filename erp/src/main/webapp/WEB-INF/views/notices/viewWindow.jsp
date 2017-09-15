<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page pageEncoding="utf-8" session="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>공지사항 보기</title>
<link href="<c:url value="/theme/css/bootstrap.min.css" />"
	rel="stylesheet">
</head>
<body>
	<div class="col-md-4">
		<div class="thumbnail">
			<div class="row">
				<div class="col-lg-12">
					<div class="alert alert-info alert-dismissable">
						<i class="fa fa-table"></i> <strong>공지사항 보기</strong>
					</div>
				</div>
			</div>
			<table class="table">
				<tbody>
					<tr>
						<th bgcolor="#EEEAF8"><center>작성자</center></th>
						<td>${ board.author }</td>
						<td>
							<button type="button"
								onclick="location.href='javascript:window.close()' "
								class="btn btn-warning" style="width: 100%;">창닫기</button>
						</td>
					</tr>
					<tr>
						<th bgcolor="#EEEAF8"><center>작성일</center></th>
						<td colspan="2"><fmt:formatDate
								value="${ board.register_date }" pattern="yyyy-MM-dd HH:mm" /></td>
					</tr>
					<tr>
						<th bgcolor="#EEEAF8"><center>제목</center></th>
						<td colspan="2">${ board.title }</td>
					</tr>
					<tr>
						<td colspan="3" height="73px"><textarea class="form-control"
								rows="4" readonly>${ board.content }</textarea></td>
					</tr>
				</tbody>
			</table>
			<div class="panel-heading">첨부파일</div>
			<div class="panel-body">
				<table>
					<c:forEach var="file" items="${files }">
						<tr>
							<th><a
								href="<c:url value="/download.action?name=${file.save_name}"/>">${ file.real_name }</a></th>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
	</div>
	</div>
</body>
</html>