<%@ page pageEncoding="utf-8" session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>엑셀 업로드</title>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>

<script type="text/javascript" src="<c:url value="/js/jquery.timepicker.js" /> "></script>
<link rel="stylesheet" type="text/css" href="<c:url value="/css/jquery.timepicker.css" /> "/>
        
<script>
//숫자만 입력과  특수문자('-','.',...)도 허용한다.
function onlyNumber() {
   if((event.keyCode > 31) && (event.keyCode < 45) || (event.keyCode > 57)) {
      event.returnValue = false;
   }
}
</script>
<script>
$(document).ready(function(){
	$("#ReadingInfoSelectBtn").click(function(){
		var formData = $("#dataForm").serialize();
		$.ajax({
			type : "POST",
			url : "${pageContext.request.contextPath}/workspaces/uploadTest",
			cache : false,
			data : formData,
			success : function(json, status){
				alert('성공 했습니다');
			},
			error : function(request,status,error){
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
		});
	});
});
</script>
</head>
<body>
<%-- <form name="inputForm"  id="ReadingInfoSelectForm" method="post"  > --%>
<%-- <form:form name="inputForm"  id="ReadingInfoSelectForm" method="post" modelAttribute="MultiExcel" > --%>
<%-- <form:form method="post"  modelAttribute="contactForm"> --%>

<form:form commandName="dataForm" name="dataForm" id="dataForm" onsubmit="return validateForm()" >
	<table border="1" id="table">
		<c:forEach var="headerList" items="${testList }">
		<tr>
			<c:forEach var="listL" items="${headerList }" varStatus="status" >
				<td>${listL }</td>
			</c:forEach>
		</tr>
		</c:forEach>
		<tr>
			<c:forEach var="obj" items="${listA}">
				<td> ${ obj } </td>
			</c:forEach>
		</tr>
	</table>
	<input type="hidden" value="test" name="test">
	<input type="button"  id="ReadingInfoSelectBtn" value="제출">
</form:form>
<script>
// $('#dataForm').validate({
// 	onfocusout: false,
// 	rules: {
// 		excelList[0].workDate: {
// 			required : true,
// 			minlength : 2
// 		}
// 	}, messages: {
// 		name :{
// 			required:"이름을 입력하세요.",
// 			$.validator.format("이름은 최소 {0} 글자 이상 입력하세요.")
// 		}
// 	}, errorPlacement : function(error, element){
		
// 	}, invalidHandler : function(form, validator){
// 		var errors = validator.numberOfInvalids();
// 		if(errors){
// 			alert(validator.errorList[0].message);
// 			validator.errorList[0].element.focus();
// 		}
// 	}, submitHandler:function(form){
// 		var formData = $("#dataForm").serialize();
// 		$.ajax({
// 			type : "POST",
// 			url : "${pageContext.request.contextPath}/workspaces/uploadTest",
// 			cache : false,
// 			data : formData,
// 			success : function(json, status){
// 				alert('성공 했습니다');
// 			},
// 			error : function(request,status,error){
// 				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
// 			}
// 		});
// 	}
// });
</script>

<script src="<c:url value="/js/commonBack.js" /> " ></script>
</body>
</html>