<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form"%>
<%@ page pageEncoding="utf-8" %>
<title>회원가입 페이지 </title>
<script src="${pageContext.request.contextPath}/js/jquery-3.2.0.min.js"></script>
<script>
function checkPwd(){
	  var f1 = document.forms["search"];	  
	  var pw1 = f1.password.value;
	  var pw2 = f1.passwordCheck.value;
	  if(pw1.length < 4){
		  document.getElementById('Pwd').style.color="red";
		  document.getElementById('Pwd').innerHTML = "4자 이상 입력해 주세요";
	  }
	  else if(pw1!=pw2 ){
		  document.getElementById('checkPwd').style.color = "red";
		  document.getElementById('checkPwd').innerHTML = "동일한 암호를 입력하세요.";
		  document.getElementById('check').value = "N";
	  }else{
		  document.getElementById('checkPwd').style.color = "green";
		  document.getElementById('checkPwd').innerHTML = "암호가 확인 되었습니다.";
		  document.getElementById('check').value = "Y";
	  }
}
</script>
<script>
$(document).ready(function() {
	$(".submit").click(function(event) {
		var pwd = $("#password").val();
		var pwd1 = $("#passwordCheck").val();
		if( pwd != pwd1 ) {	//	비밀번호 와 비밀번호 확인이 다르다면 ... 
			$("#passwordCheck").next().html("비밀번호를 잘못입력하였습니다.");
			//	이벤트 중지하기
			alert('stop');
			event.preventDefault();
		}
	})	;	
});
</script>

<script type="text/javascript">
function checkEmail(){
$("#email").keyup(function() {	
	$.ajax({
		url : "${pageContext.request.contextPath}/duplicationCheck.do",
		type : "post",
		data : $("form").serialize(),
		success : function(data) {
			document.getElementById('check').value = "N"; // 초깃값을 N 으로 해놓는다
			if (data.length > 0) {
// 			document.getElementById("duplicateResult").value = "이미 해당 아이디로 가입된 회원가 있습니다.";
			document.getElementById('duplicateResult').style.color = "red";
			document.getElementById('duplicateResult').innerHTML = "이미 해당 아이디로 가입된 회원 아이디가 있습니다.";
			} else {
				if ( $("#email").val().length < 5 || $("#email").val().indexOf("@") == -1){
					document.getElementById('duplicateResult').style.color = "red";
// 				document.getElementById("duplicateResult").value = "아이디를 5자 이상 입력해주세요.";
				document.getElementById('duplicateResult').innerHTML = "아이디를 5자 이상 이메일 형식으로 입력해주세요.";
				} else {
// 					document.getElementById("duplicateResult").value = "사용 가능한 아이디입니다.";
					document.getElementById('duplicateResult').style.color = "green";
					document.getElementById('duplicateResult').innerHTML = "사용 가능한 아이디입니다.";
					document.getElementById('check').value = "Y";
				}
			}
		},
		error : function(error) {
// 			alert(error.statusText);
			document.getElementById('duplicateResult').innerHTML = "에러가 생겼다"+data;
		}
	});
	return false;
});
}
  </script>

<div class="jumbotron">
    <h1>가입하기</h1>
</div>
<c:url var="signUpPath" value="/signup" />
      <article class="container">
<f:form modelAttribute="user" action="${ signUpPath }" method="post" name="search" onsubmit="return check()">
    <div class="form-group form-group-lg">
        <div class="form-group">
			<input type="hidden" id="check" name="check" value="N" readonly>
            <label>이메일</label>
            <f:input path="email" cssClass="form-control" placeholder="email@email.com" value="${user.email }" onkeyup="checkEmail()"/>
            <f:errors path="email" element="div" cssClass="alert text-danger"/>
	        <div id="duplicateResult">
	            <c:out value="${duplicateUserId}"/>
	        </div>
        </div>
        
        <div class="form-group">
            <label>비밀번호</label>
            <f:password path="password" cssClass="form-control" placeholder="비밀번호"/>
            <f:errors path="password" element="div" cssClass="alert text-danger" value="${ user.password }"/>
            <div id="Pwd"></div>
        </div>
        
        <div class="form-group">
        	<label>비밀번호 확인</label>
        	<f:password path="passwordCheck" cssClass="form-control" placeholder="비밀번호 확인" onkeyup="checkPwd()"/>
        	<f:errors path="passwordCheck" element="div" cssClass="alert text-danger" />
        	<div id="checkPwd"></div>
        	
        </div>
                
        <div class="form-group">
            <label>이름</label>
            <f:input path="name" cssClass="form-control" placeholder="이름" value="${ user.name }"/>
            <f:errors path="name" element="div" cssClass="alert text-danger"/>
        </div>
   		<label for="ex1">주민등록번호</label><div>
   		<input type="text" placeholder="앞자리" size="10" name="socialNumFront">
   			<span>-</span>
       	<input type="text"size="10" readonly >
       	</div>
       <div class="form-group">
                <label>약관 동의</label>
              <div data-toggle="buttons">
              <label class="btn btn-primary active">
                  <span class="fa fa-check"></span>
                  <input id="agree" type="checkbox" autocomplete="off" checked>
              </label>
              <a href="#">이용약관</a>에 동의합니다.
              </div>
       </div>
          <div class="form-group text-center">
            <s:csrfInput />
              <button type="submit" class="btn btn-info" onclick="return check()" onkeyPress="if (event.keyCode==13){return false;}">회원가입<i class="fa fa-check spaceLeft"></i></button>
              <button type="button" class="btn btn-warning" onclick="location.href='<c:url value="/" />' ">가입취소<i class="fa fa-times spaceLeft"></i></button>
            </div>
    </div>
</f:form>
</article>
<script>
function check(){	
	if(search.password.value !=""){
		alert('hi~');
		return false;
	}else{
		alert('bye');
		return false;
	}
	return false;
}
</script>