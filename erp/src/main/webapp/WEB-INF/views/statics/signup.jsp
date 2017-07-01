<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form"%>
<%@ page pageEncoding="utf-8" %>
<script>
function checkPwd(){
	  var f1 = document.forms["search"];	  
	  var pw1 = f1.password.value;
	  var pw2 = f1.passwordCheck.value;
	  if(pw1!=pw2){
		  document.getElementById('checkPwd').style.color = "red";
		  document.getElementById('checkPwd').innerHTML = "동일한 암호를 입력하세요."; 
	  }else{
		  document.getElementById('checkPwd').style.color = "green";
		  document.getElementById('checkPwd').innerHTML = "암호가 확인 되었습니다."; 
	  }
}

</script>
<div class="jumbotron">
    <h1>가입하기</h1>
</div>
<c:url var="signUpPath" value="/signup" />
<f:form modelAttribute="user" action="${ signUpPath }" method="post" name="search">
<input type="hidden" id="idChk" value="N" /><!-- ID체크 했는지, 안했는지. -->
    <div class="form-group form-group-lg">
        <div class="form-group">
            <label>이메일</label>
            <f:input path="email" cssClass="form-control" placeholder="이메일" value="${user.email }"/>
            <f:errors path="email" element="div" cssClass="alert text-danger"/>
        <span id="duplicateResult">
            <c:out value="${duplicateUserId}"/>
        </span>
        </div>
        
        <div class="form-group">
            <label>비밀번호</label>
            <f:password path="password" cssClass="form-control" placeholder="비밀번호"/>
            <f:errors path="password" element="div" cssClass="alert text-danger" value="${ user.password }"/>
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
        
        <div class="form-action">
            <s:csrfInput />
            <input type="submit" class="btn btn-primary btn-lg btn-block" value="회원 가입">
        </div>
    </div>
</f:form>