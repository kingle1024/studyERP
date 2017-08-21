<%@page import="com.mycompany.vo.Message"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page pageEncoding="utf-8" session="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
#jumbo {
	padding-top: 20px;
	padding-bottom: 20px;
}
</style>
<script type="text/javascript" src="<c:url value="/js/map.js" />"></script>
<script>
<!-- jquery로 파일 첨부 추가 -->
$(document).ready(function() {
    //add more file components if Add is clicked
    $('#addFile').click(function() {
        var fileIndex = $('#fileview tr').children().length;      
        $('#fileview').append( // append로 화면에 추가
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

<script>
function delFile(e) {
    var formName = e.id;
    map.put(e.id, e.id);
    $(e).parents('tr').remove();
    $.ajax({
		type : "GET",
		url:"${pageContext.request.contextPath}/testUploadRemoveaaa",
		data:fd,
		success:function(data){
			if(data){
				alert("성공");
			}else{
				alert("실패");
			}
		}
	});
}
</script>
<script>
var fileValues = [];
var fileNo = [];
		
var ajaxExample = function(no){
	var fileValues = new Array();
	var fileNo = new Array();
		$("input[name='filename']").each(function(i){ // name이 filename인 모든 값을 가져와서 배열에 저장
			fileValues.push($(this).val());
		});
		$("input[name='fileno']").each(function(i){ // name이 fileno인 모든 값을 가져와서 배열에 저장
			fileNo.push($(this).val());
		});
		
		var allData = [fileNo, fileValues, no];

		function sendPlz(){
			$.ajax({
				url:"${pageContext.request.contextPath}/notice/updateUpdate",
				type:'POST',
				data:allData,
				success:function(data){
					alert("완료");
				},
				error:function(jqXHR, testStatus, errorThrown){
					alert("에러 발생~~");
				}
			});
		}
}
</script>
<script>
var test = new Array();
var allData = {"testArray":test };
var testArray = new Array();
var tempDel = function(no){
		test.push(no);
// 		testArray.push(no);
		$.ajax({
			url:"${pageContext.request.contextPath}/testUploadRemove/",
			type:'GET',
			data:allData,
			success:function(data){
				alert("삭제 완료~");
			},
			error:function(jqXHR, testStatus, errorThrown){
				alert("에러 발생~~ㅋㅋㅋ쿠ㅜㅜㅠㅠㅠㅠ");
			}
		});
	}
</script>
<script>
	var arr = new Array();
</script>
<script>
	function inputNum(no){
		arr.push(no);
		alert(arr);
	}
</script>
<script>
	
</script>
<title>수정 페이지</title>
</head>
<body>
	<div class="jumbotron" id="subNav">
		<font size="6">공지사항 수정</font>-공지사항 수정을 수행할 수 있습니다.
	</div>
	<div class="container">
		<form action="<c:url value='/notice/update' />" method="post"
			name="inputForm" enctype="multipart/form-data">
		<input type="hidden" name="page" value="${page }"> <!-- 없으면 없다고 오류남 -->
			<div class="form-group form-group-lg">
				<label class="control-label">제목</label> <input name="title"
					type="text" class="form-control" value="${ board.title }">
			</div>
			<!--     <div class="form-group form-group-lg"> -->
			<!--         <label class="control-label">글쓴이</label> -->
			<input name="author" type="hidden" class="form-control"
				value="${ board.author }">
			<!--     </div> -->
			<div class="form-group form-group-lg">
				<label class="control-label">내용</label>
				<textarea rows="15" cols="30" id="text" class="form-control"
					name="content">${ board.content }</textarea>
				<%--         <input name="content" type="text" class="form-control" value="${ board.content }"> --%>
			</div>
			<input name="id" type="hidden" value="${ board.id }">
			<div class="panel panel-default">
				<div class="panel-heading">첨부파일</div>
				<div class="panel-body">
					<table id="fileTable">	
						<c:forEach var="file" items="${files }" varStatus="status">
							<tr>
								<th>
									<ul class="list-group">
										<li class="list-group-item" style="width: 100%">
											${file.real_name } <%-- 		    				<input type="text" name="filename" value="${file.real_name }" readonly> --%>
											<%-- 		    				<input type="text" name="fileno" value="${file.no }" readonly> --%>
											<%-- 		    				<input type="text" value="${status.count }" readonly> --%>
											<input type="button" value="삭제" class="btn btn-danger"
											id='${file.save_name }' onclick='tempDel(${file.no})'>
											<%-- 	    					<input type="button" value="삭제" id='${file.save_name }' onclick='ajaxExample(${file.no})' > --%>
										</li>
									</ul>
								</th>
								<td></td>
							</tr>
						</c:forEach>
						<tr>
							<td></td>
						</tr>
					</table>
				</div>
			</div>
			<script> // 화면상에서 tr 삭제하기
							$("input[type=button]").click(function() { 
							   $(this).parents('tr').remove();
							})
			</script>
			<script>
							function checkcheck(){
								alert('수정되었습니다.'+arr);
								return true;
							}
						</script>
			<br>
				<div class="panel panel-default">
				<div class="panel-heading">파일 첨부</div>
				<div class="panel-body">
<!-- 					Upload Directory : <input type="hidden" name="upDir" value="c:/Spring/upload/"/><br><br> 업로드 경로 -->
				    <input id="addFile" type="button" value="File Add" />    
				    <table id="fileview">
				        <tr>
				            <td><input name="files[0]" type="file" /></td>
			    	    </tr>        
			    	</table>
				</div>
				</div>
				<span style="float:right;">
					<button onclick="javascript:history.back();" class="btn btn-lg btn-primary ">이전</button>
					<button type="submit" class="btn btn-lg btn-primary"
					onclick='return checkcheck()'>수정</button>
				</span>
		</form>
		<!-- <input type="submit" class="btn btn-lg btn-primary" style="width:100%;" value="전송"> -->
	</div>
<script src="<c:url value="/js/commonBack.js" /> " ></script>
</body>
</html>
