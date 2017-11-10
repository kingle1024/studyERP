<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script>
	$(function() {
		$('#btn').click(function() {
			var dbTxt = $('#src').html();
			dbTxt = dbTxt.replace(/<br>/g, '\n');
			$('#trg textarea').text(dbTxt);
		});
	});
</script>
<title>댓글 수정</title>
</head>
<body>
	<div id="page-wrapper">
		<div class="row">
			<div class="col-lg-12">
				<div class="alert alert-info alert-dismissable">
					<i class="fa fa-table"></i> <strong>댓글 수정</strong>
				</div>
			</div>
		</div>
	</div>
	<form action="<c:url value="/commentEdit/${board_no }/${comment.no }?page=${page }"/>" method="POST">
	<table class="table">
		<tr>
			<td width="80%">
				<textarea class="form-control" rows="5" name="comment">${ comment.comment }</textarea>
			</td>
		</tr>
		<tr>
			<td>
				<input type="submit" class="btn btn-block btn-primary" value="수정" width="100%" >
			</td>
		</tr>
	</table>
	<input type="hidden" name="${ _csrf.parameterName }" value="${ _csrf.token }" />
	</form>
</body>
</html>