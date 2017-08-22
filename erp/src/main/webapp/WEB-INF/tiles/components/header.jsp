<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="s"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>
 @import url(//fonts.googleapis.com/earlyaccess/nanumpenscript.css);
      h1 { font-family: 'Nanum Pen Script', cursive; }
</style>
<nav class="navbar navbar-default" id="setPostion">
	<!-- Brand and toggle get grouped for better mobile display -->
	<div class="navbar-header">
		<button type="button" class="navbar-toggle collapsed"
			data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
			aria-expanded="false">
			<span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span>
			<span class="icon-bar"></span> <span class="icon-bar"></span>
		</button>

	</div>
	<!-- Collect the nav links, forms, and other content for toggling -->
	<div class="collapse navbar-collapse" id="">
		<ul class="nav navbar-nav">
			<li>${sessionUserName}님 접속중</li>
		</ul>
			
		<!-- 로그인 버튼 -->
		<sec:authorize access="isAnonymous()">
			<c:url var="loginUrl" value="/login" />
			<ul class="nav navbar-nav navbar-right">
				<li><a href="${ loginUrl }">로그인</a>
			</ul>
		</sec:authorize>		
		<!-- 로그아웃 버튼 -->
		<sec:authorize access="isAuthenticated()">
			<c:url var="logoutUrl" value="/logout" />
			<form action="${ logoutUrl }" method="post" class="navar-form navbar-right">
				<button type="submit" class="btn btn-default">로그아웃</button>
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
			</form> 
		</sec:authorize>				
<%-- 		<a href="<c:url value="/logout" />">Logout</a> --%>
		<form class="navbar-form navbar-right">
			<div class="form-group">
				<input type="text" class="form-control" placeholder="Search">
			</div>
			<button type="submit" class="btn btn-default">Submit</button>
		</form>
	</div>
</nav>
<div class="nav-side-menu">
<!--     <div class="brand"> -->
<%--     <img src="<c:url value="/image/center.png" />"><br> --%>
  	 	<div style="text-align:center;"><h1>실 습 실  관리 센터</h1></div>
<!--     </div> -->
    <i class="fa fa-bars fa-2x toggle-btn" data-toggle="collapse" data-target="#menu-content"></i>
  
        <div class="menu-list">
            <ul id="menu-content" class="menu-content collapse out">
                <li>
                  <a href="<c:url value="/" />">
                  <i class="fa fa-home fa-lg"></i> <font size="3" >홈</font>
                  </a>
                </li>
                
				<li>
                  <a href="<c:url value="/messages" />">
                  <i class="fa fa-envelope fa-lg"></i> 쪽지함</a>
                  
                  </li>

                <li>
                  <a href="<c:url value="/notices" />"><i class="fa fa-newspaper-o fa-lg"></i> 공지사항 </a>
                </li>

                <li data-toggle="collapse" data-target="#service" class="collapsed">
                  <a href="#"><i class="fa fa-database fa-lg"></i> 실습실 관리 <span class="arrow"></span></a>
                </li>  
	                <ul class="sub-menu collapse" id="service">
	                  <li>18302</li>
	                  <li>18412</li>
	                  <li>18520</li>
	                </ul>


                <li data-toggle="collapse" data-target="#new" class="collapsed">
                  <a href="#"><i class="fa fa-paper-plane fa-lg"></i> 결재<span class="arrow"></span></a>
                </li>
                <ul class="sub-menu collapse" id="new">
                  <li class="active"><a href="<c:url value="/signs/" />" >결재</a></li>
                  <li><a href="<c:url value="/signs/recv" />">받은문서함</a></li>
                  <li><a href="<c:url value="/signs/send" />">보낸문서함</a></li>
                </ul>
                 <li>
                  <a href="<c:url value="/mywork" /> ">
                  <i class="fa fa-folder-open fa-lg"></i> 내 작업대
                  </a>
                </li>
                <s:authorize access="hasRole('ADMIN')">
<!--                  <li> -->
<%--                   <a href="<c:url value="/books/test"/>"> --%>
<!--                   <i class="fa fa-users fa-lg"></i> 테스트공간 -->
<!--                   </a> -->
<!--                 </li> -->
                <li>
                  <a href="<c:url value="/admin"/>">
                  <i class="fa fa-users fa-lg"></i> 회원 관리
                  </a>
                </li>
                </s:authorize>
            </ul>
     </div>
</div>
