<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page pageEncoding="utf-8" session="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<style>
pre {
	border: 0;
	background-color: #ffffff;
}
</style>
<title>공지사항 보기</title>
</head>
<body>
	<div id="page-wrapper">
		<div class="row">
			<div class="col-lg-12">
				<div class="alert alert-info alert-dismissable">
					<i class="fa fa-table"></i> <strong>공지사항 보기</strong>
				</div>
			</div>
		</div>
	</div>
	<span style="float: right;"><a
		href="<c:url value="/notices?page=${page }&lastPage=${lastPage }&word=${word }"/>"
		class="btn btn-lg btn-primary">목록</a></span>
	<table border="0" class="table table-inverse">
		<tr>
			<th bgcolor="#EEEAF8" width="10%" nowrap><center>번호</center></th>
			<th width="">${ board.id }</th>
			<th bgcolor="#EEEAF8" width="10%" nowrap><center>작성자</center></th>
			<th width="">${ board.author }</th>
		</tr>
		<tr>
			<th bgcolor="#EEEAF8" nowrap><center>작성일</center></th>
			<th><fmt:formatDate value="${ board.register_date }"
					pattern="yyyy-MM-dd hh:mm" /></th>
			<th bgcolor="#EEEAF8" nowrap><center>수정일</center></th>
			<th><fmt:formatDate value="${ board.update_date }"
					pattern="yyyy-MM-dd hh:mm" /></th>
		</tr>
		<tr>
			<th bgcolor="#EEEAF8" width=""><center>제목</center></th>
			<th width="" colspan="3">${ board.title }</th>
		</tr>
		<tr>
			<th colspan="4" height=""><textarea class="form-control"
					rows="20" readonly>${ board.content }</textarea></th>
		</tr>

	</table>
	<div class="panel panel-default">
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
	<!-- 관리자 권한 부분 -->
	<sec:authorize access="hasRole('ADMIN')">

	</sec:authorize>
	<div class="jumbotron">
		<table class="table table-stripeed">
			<thead>
				<tr>
					<th width="10%" nowrap>작성자</th>
					<th width="">내용</th>
					<th width="16%">날짜</th>
					<th width="2%"></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="comment" items="${comments }">
					<tr>
						<td>${ comment.author }</td>
						<td>${ comment.comment }</td>
						<td><fmt:formatDate value="${ comment.register_date }"
								pattern="MM-dd HH:mm" /></td>
						<td><a
							href="<c:url value="/commentDelete/${board.id }/${comment.no }?page=${page }" />"
							class="btn btn-block btn-danger">삭제</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<c:url var="commentsPath" value="/comments" />
		<f:form modelAttribute="comment" action="${ commentsPath }"
			method="post">
			<input type="hidden" name="page" value="${page }">
			<c:forEach var="error" items="${ fieldErrors }">
				<div class="alert alert-warning">
					<strong>${ error.getField() }</strong>: ${ error.getDefaultMessage() }
				</div>
			</c:forEach>
			<f:textarea path="comment" cssClass="form-control" rows="2"
				id="reviewContent" />
			<!-- path는 이름 -->
			<f:hidden path="board_no" />
			<button class="btn btn-block btn-primary" type="submit">댓글
				등록</button>
			<input name="author" type="hidden" value="${ username }" />
			<!-- Controller에서 username을 받아온다 -->
		</f:form>
	</div>
	<span style="float: right;"> <a
		href="<c:url value="/notice/edit/${ board.id }?page=${page }" />"
		class="btn btn-lg btn-primary">수정</a> <a
		href="<c:url value="/notice/delete/${ board.id }" />"
		class="btn btn-lg btn-primary"
		onclick="if(!confirm('삭제 하시겠습니까?')){return false;}">삭제</a> <a
		href="<c:url value="/notices?page=${page }&lastPage=${lastPage }&word=${word }"/>"
		class="btn btn-lg btn-primary">목록</a>
	</span>
<script>
	$(document).ready(function() {
		$("form").submit(function() {
			if ($("#reviewContent").val() == "") {
				alert("내용을 입력하세요");
				$("#reviewContent").focus();
				return false;
			}

		});
	});
</script>
	
</body>
</html>