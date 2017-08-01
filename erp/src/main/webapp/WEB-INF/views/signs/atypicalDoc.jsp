<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="utf-8" session="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>결재 하기</title>
</head>
<body>
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
// 향후 개선 사항_ ajax json 통신
// function formSubmit() {
// 	var params = $('#formname1').serialize().replace(/%/g,'%25');
//     jQuery.ajax({
//         url: 'signs/atypicalDoc',
//         type: 'POST',
//         data : params,
//         dataType: 'text',
//         contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
//         timeout: 10000, 
//         success: function (result) {
//             if (result){
//                 // 데이타 성공일때 이벤트 작성
//                 alert(params);
//             }else{
//             	alert('bye'+params);
//             }
//                 location.reload();
//         },
//         error:function(jqXHR, textStatus, errorThrown){
//         	alert('에러 발생~~\n'+params);
//         }
//     });
// }
</script>
<script>
// var data2 = {userId : userid, name: name, password: password };
// var data = JSON.stringify(data2);
</script>
		<div class="jumbotron" >
		<h1>비정형 문서</h1>
		<form id="formname1" method="post" action="<c:url value="/signs/atypicalDoc" /> ">
			<table>				
				<tr>
					<td>받는이:근장장</td>
				</tr>						
				<tr>
					<td width="100px">제목</td><td width="90%"><input type="text" class="form-control" name="title"></td>
				</tr>
			</table>
			<br><br>				
			<table>
				<tr>
					<td width="100px">내용</td>
					<td width="100px"><textarea cols="110" rows="10" name="content"></textarea></td>
				</tr>
				<tr>
				</tr>
				<tr>
					<td width="100px">기타</td>
					<td width="100px"><input type="text" class="form-control" name="etc"></td>
				</tr>
			</table>	
			<input type="hidden" name="${ _csrf.parameterName }" value="${ _csrf.token }"/>
			<input type="hidden" name="type_code" value="1000">
			<input type="submit" class="btn btn-lg btn-primary" style="width:100%" value="전송">		
		</form>
		</div>

</body>
</html>