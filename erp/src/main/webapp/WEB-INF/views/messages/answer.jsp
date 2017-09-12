<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page pageEncoding="utf-8" session="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> -->
<title>쪽지 답장하기</title>
</head>
<body>
<div id="page-wrapper">
 <div class="row">
           <div class="col-lg-12">
               <div class="alert alert-info alert-dismissable">
                   <i class="fa fa-comments"></i><strong>쪽지 답장하기</strong> 
               </div>
           </div>
       </div>
<form action="<c:url value="/messages" />" method="post">
			<input name="recv_id" type="hidden" value="${ recv }">
			<div class="form-group form-group-lg">
				<label class="control-label">받는이</label>
					${recvName} (${ recv })
			</div>
			
			<div class="form-group form-group-lg">
				<label class="control-label">제목</label>
				<input name="title" id="title" type="text" class="form-control" placeholder="제목을 입력하세요">
			</div>
			
			<div class="form-group form-group-lg">
				<label class="control-label">보낼 내용</label>
				<textarea rows="10" cols="30" class="form-control" id="content" name="content" placeholder="내용을 입력하세요"></textarea>
			</div>
		
		<input type="hidden" name="${ _csrf.parameterName }" value="${ _csrf.token }"/>
			<button type="submit" class="btn btn-lg btn-primary">전송</button>
		</form>
</div>
  <script>
	$(document).ready(function(){
		$("form").submit(function(){
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