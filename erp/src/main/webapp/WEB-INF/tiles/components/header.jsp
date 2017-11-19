<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="s"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
	#profileHeader{
		width:60px;
		height:28%;
	}
	html, body, input, textarea, select, button, table, pre, xmp, plaintext, listing{
	font-family : '맑은 고딕';
	font-size : 12px;
}
</style>

<!-- Navigation -->
<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
	<!-- Brand and toggle get grouped for better mobile display -->
	<div class="navbar-header">
		<button type="button" class="navbar-toggle" data-toggle="collapse"
			data-target=".navbar-ex1-collapse">
			<span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span>
			<span class="icon-bar"></span> <span class="icon-bar"></span>
		</button>
		<a class="navbar-brand" href="<c:url value="/index"/>">실습실 관리센터</a>
	</div>
	<!-- Top Menu Items -->
	<ul class="nav navbar-right top-nav">
		<li class="dropdown"><a href="#" class="dropdown-toggle"
			data-toggle="dropdown"><i class="fa fa-envelope"></i> <b
				class="caret"></b></a>
			<ul class="dropdown-menu message-dropdown">
				<c:forEach var="myMessage" items="${sessionMyMessages}"
					varStatus="status">
					<li class="message-preview"><a href="#">
							<div class="media">
								<span class="pull-left"> <c:set var="filePath" value="" />
									<c:if
										test="${!empty sessionSendUserProfileImagePath[status.index] }">
										<c:set var="filePath"
											value="image/profileImage/${ sessionSendUserProfileImagePath[status.index]}" />
									</c:if> <img id="profileHeader" src="${ filePath }"
									onerror="this.src='<c:url value="/image/student.png"/>'"
									border='0'
									onclick="document.all.profileImgFile.click(); document.all.profileImgFileText.value=document.all.profileImgFile.value"
									class="img-circle img-responsive">
								</span>
								<div class="media-body">
									<h5 class="media-heading">
										<strong>${ myMessage.send_id }</strong>
									</h5>
									<p class="small text-muted">
										<i class="fa fa-clock-o"></i>
										<fmt:formatDate value="${ myMessage.send_date }"
											pattern="MM-dd HH:mm" />
									</p>
									<p>${ myMessage.content }</p>
								</div>
							</div>
					</a></li>
				</c:forEach>
				<li class="message-footer"><a
					href="<c:url value="/messages" />">쪽지함으로 이동</a></li>
			</ul></li>
<!-- 		<li class="dropdown"><a href="#" class="dropdown-toggle" -->
<!-- 			data-toggle="dropdown"><i class="fa fa-bell"></i> <b -->
<!-- 				class="caret"></b></a> -->
<!-- 			<ul class="dropdown-menu alert-dropdown"> -->
<%-- 				<li><a href="#">Alert Name <span --%>
<%-- 						class="label label-default">Alert Badge</span></a></li> --%>
<%-- 				<li><a href="#">Alert Name <span --%>
<%-- 						class="label label-primary">Alert Badge</span></a></li> --%>
<%-- 				<li><a href="#">Alert Name <span --%>
<%-- 						class="label label-success">Alert Badge</span></a></li> --%>
<%-- 				<li><a href="#">Alert Name <span class="label label-info">Alert --%>
<%-- 							Badge</span></a></li> --%>
<%-- 				<li><a href="#">Alert Name <span --%>
<%-- 						class="label label-warning">Alert Badge</span></a></li> --%>
<%-- 				<li><a href="#">Alert Name <span class="label label-danger">Alert --%>
<%-- 							Badge</span></a></li> --%>
<!-- 				<li class="divider"></li> -->
<!-- 				<li><a href="#">View All</a></li> -->
<!-- 			</ul></li> -->
		<li class="dropdown"><a href="#" class="dropdown-toggle"
			data-toggle="dropdown"><i class="fa fa-user"></i>
				${sessionUserName} 님<b class="caret"></b></a>
			<ul class="dropdown-menu">
				<li><a href="<c:url value="/myInfo" />"><i
						class="fa fa-fw fa-user"></i> 프로필</a></li>
<!-- 				<li><a href="#"><i class="fa fa-fw fa-envelope"></i> Inbox</a> -->
<!-- 				</li> -->
<!-- 				<li><a href="#"><i class="fa fa-fw fa-gear"></i> Settings</a></li> -->
				<li class="divider"></li>
				<li><sec:authorize access="isAuthenticated()">
						<c:url var="logoutUrl" value="/logout" />
						<a href="${ logoutUrl }"><i class="fa fa-fw fa-power-off"></i>
							로그아웃</a>
						<input type="hidden" name="${_csrf.parameterName}"
							value="${_csrf.token}" />
					</sec:authorize></li>
			</ul></li>
	</ul>
	<!-- Sidebar Menu Items - These collapse to the responsive navigation menu on small screens -->
	<div class="collapse navbar-collapse navbar-ex1-collapse">
		<ul class="nav navbar-nav side-nav">
			<li class=""><a href="<c:url value="/" />"><i
					class="fa fa-fw fa-home"></i> 홈</a></li>
			<li><a href="<c:url value="/messages" />"><i
					class="fa fa-fw fa-comments"></i> 쪽지함</a></li>
			<li><a href="<c:url value="/notices" />"><i
					class="fa fa-fw fa-table"></i> 공지사항</a></li>
			<li><a href="javascript:;" data-toggle="collapse"
				data-target="#students"><i class="fa fa-fw fa-database"></i> 실습실관리<span
					style="float: right;"><i class="fa fa-fw fa-arrows-v"></i></span></a>
				<ul id="students" class="collapse">
					<li <c:if test="${pno == '18512'}"> class="active"</c:if>><a
						href="<c:url value="/students?no=18512" />">18512</a></li>
					<li <c:if test="${pno == '18419'}"> class="active"</c:if>><a
						href="<c:url value="/students?no=18419" />">18419</a></li>
					<li <c:if test="${pno == '18312'}"> class="active"</c:if>><a
						href="<c:url value="/students?no=18312" />">18312</a></li>
				</ul></li>
			<li><a href="javascript:;" data-toggle="collapse"
				data-target="#approvals"><i class="fa fa-fw fa-paper-plane"></i> 결재<span
					style="float: right;"><i class="fa fa-fw fa-arrows-v"></i></span></a>
				<ul id="approvals" class="collapse">
					<li class="active"><a href="<c:url value="/signs/" />">결재</a></li>
					<li><a href="<c:url value="/signs/recv" />">받은문서함</a></li>
					<li><a href="<c:url value="/signs/send" />">보낸문서함</a></li>
				</ul></li>
			<li><a href="<c:url value="/mywork"/>"><i
					class="fa fa-fw fa-folder-open"></i> 내 작업대</a></li>
			<sec:authorize access="hasRole('ADMIN')">
			<li><a href="<c:url value="/admin"/>"><i
					class="fa fa-fw fa-users"></i> 회원 관리</a></li>
			</sec:authorize>
		</ul>
	</div>
	<!-- /.navbar-collapse -->
</nav>