<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<%@ page pageEncoding="utf-8" %>
<style>
.colorgraph {
  height: 5px;
  border-top: 0;
  background: #c4e17f;
  border-radius: 5px;
  background-image: -webkit-linear-gradient(left, #c4e17f, #c4e17f 12.5%, #f7fdca 12.5%, #f7fdca 25%, #fecf71 25%, #fecf71 37.5%, #f0776c 37.5%, #f0776c 50%, #db9dbe 50%, #db9dbe 62.5%, #c49cde 62.5%, #c49cde 75%, #669ae1 75%, #669ae1 87.5%, #62c2e4 87.5%, #62c2e4);
  background-image: -moz-linear-gradient(left, #c4e17f, #c4e17f 12.5%, #f7fdca 12.5%, #f7fdca 25%, #fecf71 25%, #fecf71 37.5%, #f0776c 37.5%, #f0776c 50%, #db9dbe 50%, #db9dbe 62.5%, #c49cde 62.5%, #c49cde 75%, #669ae1 75%, #669ae1 87.5%, #62c2e4 87.5%, #62c2e4);
  background-image: -o-linear-gradient(left, #c4e17f, #c4e17f 12.5%, #f7fdca 12.5%, #f7fdca 25%, #fecf71 25%, #fecf71 37.5%, #f0776c 37.5%, #f0776c 50%, #db9dbe 50%, #db9dbe 62.5%, #c49cde 62.5%, #c49cde 75%, #669ae1 75%, #669ae1 87.5%, #62c2e4 87.5%, #62c2e4);
  background-image: linear-gradient(to right, #c4e17f, #c4e17f 12.5%, #f7fdca 12.5%, #f7fdca 25%, #fecf71 25%, #fecf71 37.5%, #f0776c 37.5%, #f0776c 50%, #db9dbe 50%, #db9dbe 62.5%, #c49cde 62.5%, #c49cde 75%, #669ae1 75%, #669ae1 87.5%, #62c2e4 87.5%, #62c2e4);
}
</style>
<div class="container">
<hr class="colorgraph">

<div class="jumbotron">
    <h1>로그인</h1>
</div>
<c:url var="loginProcessingUrl" value='/user/login' />
<c:url var="signUpPath" value="/signup"/>
<form action="${ loginProcessingUrl }" method="post" name="loginForm">
    <div class="form-group form-group-lg">
        <div class="form-group">
<!--             <label>아이디</label> -->
            <input type="text" name="email" class="form-control" placeholder="이메일 형식의 아이디" autocomplete="off">
        </div>
        <div class="form-group">
<!--             <label>비밀번호</label> -->
            <input type="password" name="password" class="form-control" placeholder="비밀번호">
        </div>
        <div class="form-action">
            <sec:csrfInput />
            <input type="submit" class="btn btn-primary btn-lg" value="로그인">
            <a href="${ signUpPath }" class="btn btn-default btn-lg">회원 가입</a>
        </div>
    </div>
</form>
<hr class="colorgraph">
</div>