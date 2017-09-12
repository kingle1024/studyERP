<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page pageEncoding="utf-8" session="false"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script>
<!-- jquery로 파일 첨부 추가 -->
$(document).ready(function() {
    //add more file components if Add is clicked
    $('#addFile').click(function() {
        var fileIndex = $('#fileview tr').children().length;      
        $('#fileview').append(
                '<tr><td>'+
                '   <input type="file" name="files['+ fileIndex +']" />'+
                '</td></tr>');
    });     
});
</script>
<script>
	$(function() {
		$('#btn').click(function() {
			var dbTxt = $('#src').html();
			dbTxt = dbTxt.replace(/<br>/g, '\n');
			$('#trg textarea').text(dbTxt);
		});
	});
</script>
<title>게시글 생성</title>
</head>
<body>
	<div id="page-wrapper">
 <div class="row">
           <div class="col-lg-12">
               <div class="alert alert-info alert-dismissable">
                   <i class="fa fa-table"></i>  <strong>공지사항 작성</strong> 
               </div>
           </div>
       </div>
			<form action="<c:url value="/notice" />" method="post" name="inputForm" enctype="multipart/form-data">
			 <input type="hidden" name="${ _csrf.parameterName }" value="${ _csrf.token }" />
				<div class="form-group form-group-lg">
					<label class="control-label">제목</label>					
					<input name="title" id="title" type="text" class="form-control">				
				</div>
				<div class="form-gorup form-group-lg">
					<label class="control-label">내용</label>
<!-- 					<input name="content" type="text" class="form-control">				 -->
					<textarea rows="15" cols="30" id="content" class="form-control" name="content" ></textarea>
				</div>
				<br>
				<div class="panel panel-default">
				<div class="panel-heading">파일 첨부</div>
				<div class="panel-body">
<!-- 					Upload Directory : <input type="hidden" name="upDir" value="c:/Spring/upload/"/><br><br> 업로드 경로 -->
				    <input id="addFile" type="button" value="더 추가" />    
				    <table id="fileview">
				        <tr>
				            <td><input name="files[0]" type="file" /></td>
			    	    </tr>        
			    	</table>
			    	<br/> 	
				</div>
				</div>
				<input name="author" type="hidden" value="${ username }" />
				<span style="float: right;">
				<button onclick="javascript:history.back();" class="btn btn-lg btn-primary ">이전</button>
				<button type="submit" class="btn btn-lg btn-primary ">등록</button>
				</span>
			</form>
	</div>
	<script src="<c:url value="/js/commonBack.js" /> " ></script>
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
			alert("등록되었습니다");
			return true;
		});
	});  	
  </script>
</body>
</html>