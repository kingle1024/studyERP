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
<form action="<c:url value="/messages" />" method="post" name="messageForm">
			<input name="send_id" type="hidden" value="${ username }">
			
			<div class="form-group form-group-lg">
				<label class="control-label">받는이</label>
				<input id="recv_id" name="recv_id" type="text" class="form-control" placeholder="email@email.com">
			</div>
			
			<div class="form-group form-group-lg">
				<label class="control-label">제목</label>
				<input name="title" id="title" type="text" class="form-control" placeholder="제목을 입력하세요">
			</div>
			
			<div class="form-group form-group-lg">
				<label class="control-label">보낼 내용</label>
<!-- 				<input name="content" type="text" class="form-control"> -->
				<textarea rows="10" cols="30" class="form-control" name="content" id="content" placeholder="내용을 입력하세요"></textarea>
			</div>
		
			<input type="hidden" name="${ _csrf.parameterName }" value="${ _csrf.token }"/>
			<button type="submit" class="btn btn-lg btn-primary">전송</button>
		</form>
</div>
 <script>
	$('#recv_id').autocomplete({
		serviceUrl: '${pageContext.request.contextPath}/getTags',
		paramName: "tagName",
		delimiter: ",",
	   transformResult: function(response) {
		return {
		  // json을 js로 바꿔야 한다
		  suggestions: $.map($.parseJSON(response), function(item) {
		      return { value: item.email, data: item.id };
		   })
		 };
            }
	 });
  </script>
  <script>
	$(document).ready(function(){
// 		var RegexRecvId = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/i; //이메일 요휴성검사
		$("form").submit(function(){
// 			if(!RegexRecvId.test($.trim($("#recv_id").val()))){
			if($("#recv_id").val() == ""){
				alert("받는이의 이메일을 입력하세요");
				$("#recv_id").focus();
				return false;
			}
			if($("#title").val() == ""){
				alert("제목을 입력하세요");
				$("#title").focus();
				return false;
			}
			if($("#content").val() == ""){
				alert("내용을 입력하세요");
				$("#content").focus();
				return false;
			}
			alert("전송되었습니다");
			return true;
		});
	});  	
  </script>
</body>
</html>