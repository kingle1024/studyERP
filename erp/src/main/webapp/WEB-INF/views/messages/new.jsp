<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page pageEncoding="utf-8" session="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> -->
<title>쪽지 보내기</title>
<script src="<c:url value="/js/jquery.1.10.2.min.js" />"></script>
<script src="<c:url value="/js/jquery.autocomplete.min.js" />"></script>
<script>
	$(function() {
		$('#btn').click(function() {
			var dbTxt = $('#src').html();
			dbTxt = dbTxt.replace(/<br>/g, '\n');
			$('#trg textarea').text(dbTxt);
		});
	});
</script>
<style>
.autocomplete-suggestions { border: 1px solid #999; background: #FFF; overflow: auto; }
.autocomplete-suggestion { padding: 5px 5px; white-space: nowrap; overflow: hidden; font-size:22px}
.autocomplete-selected { background: #F0F0F0; }
.autocomplete-suggestions strong { font-weight: bold; color: #3399FF; }
</style>
</head>

<body>
<div class="jumbotron" id="subNav">
	<font size="6">쪽지 보내기</font> - 쪽지를 보낼 수 있습니다.
</div>
<div class="containerRegulate">
<form action="<c:url value="/messages" />" method="post">
			<input name="send_id" type="hidden" value="${ username }">
			
			<div class="form-group form-group-lg">
				<label class="control-label">받는 이</label>
				<input id="w-input-search" name="recv_id" type="text" class="form-control">
			</div>
			
			<div class="form-group form-group-lg">
				<label class="control-label">제목</label>
				<input name="title" type="text" class="form-control">
			</div>
			
			<div class="form-group form-group-lg">
				<label class="control-label">보낼 내용</label>
<!-- 				<input name="content" type="text" class="form-control"> -->
				<textarea rows="10" cols="30" id="text" class="form-control" name="content" ></textarea>
			</div>
		
		<input type="hidden" name="${ _csrf.parameterName }" value="${ _csrf.token }"/>
			<button type="submit" class="btn btn-lg btn-primary">전송</button>
		</form>
</div>
 <script>
	$('#w-input-search').autocomplete({
		serviceUrl: '${pageContext.request.contextPath}/getTags',
		paramName: "tagName",
		delimiter: ",",
	   transformResult: function(response) {
		return {
		  //must convert json to javascript object before process
		  suggestions: $.map($.parseJSON(response), function(item) {
		      return { value: item.tagName, data: item.id };
		   })
		 };
            }
	 });
  </script>
</body>
</html>