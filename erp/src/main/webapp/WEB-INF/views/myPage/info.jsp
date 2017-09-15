<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>내 정보 수정</title>
<style>

</style>
<script src="<c:url value="/js/jquery.1.10.2.min.js"/>"></script>
<script src="<c:url value="/js/jquery-3.2.0.min.js"/>"></script>
<style>
input.hidden {
	position: absolute;
	left: -9999px;
}

#profile-image1 {
	width: 55%;
	height: 20%;
}

.tital {
	font-size: 16px;
	font-weight: 500;
}

.bot-border {
	border-bottom: 1px #f8f8f8 solid;
	margin: 5px 0 5px 0
}
</style>
</head>
<body>
	<!-- https://bootsnipp.com/snippets/nPvnk  -->
	<div id="page-wrapper">
		<div class="row">
			<div class="col-md-7 ">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h4><i class="fa fa-fw fa-user"></i>사용자 프로필</h4>
					</div>
					<div class="panel-body">
						<div class="box box-info">
							<div class="box-body">
								<div class="col-sm-5">
									<div align="center">
										<form action="<c:url value="/myInfoEdit" />" method="post" name="uploadForm" enctype="multipart/form-data">
											<img id="profile-image1" src="/imgTom/${user.profileImagePath }" onerror="this.src='<c:url value="/image/student.png"/>'" border='0'  class="img-circle img-responsive">
										</form>
										<!--Upload Image Js And Css-->
									</div>
									<br>
									<!-- /input-group -->
								</div>
								<div class="col-sm-6">
									<h2 style="color: #00b1b1;">사용자 권한</h2>
									<span>
										<p>
											<c:set var="doneLoop" value="false" />
											<c:forEach var="authority" items="${ user.authorities }">
												<c:if test="${not doneLoop}">
													<c:if test="${ authority.authority == 'ROLE_ADMIN'}"><strong>관리자</strong> <c:set
															var="doneLoop" value="true" />
													</c:if>
													<c:if test="${ authority.authority == 'ROLE_MANAGER'}"><strong>근장</strong> <c:set
															var="doneLoop" value="true" />
													</c:if>
													<c:if test="${ authority.authority == 'ROLE_USER'}"><strong>학생</strong> <c:set
															var="doneLoop" value="true" />
													</c:if>
												</c:if>
											</c:forEach>
										</p>
									</span>
								</div>
								<div class="clearfix"></div>
								<hr style="margin: 5px 0 5px 0;">


								<div class="col-sm-5 col-xs-6 tital ">이름</div>
								<div class="col-sm-7 col-xs-6 "> ${user.name }</div>
								<div class="clearfix"></div>
								<div class="bot-border"></div>

								<div class="col-sm-5 col-xs-6 tital ">생년월일</div>
								<div class="col-sm-7">${user.socialNumFront }</div>
								<div class="clearfix"></div>
								<div class="bot-border"></div>

								<div class="col-sm-5 col-xs-6 tital ">가입한 날짜</div>
								<div class="col-sm-7"><fmt:formatDate value="${ user.register_date }"
								pattern="yyyy-MM-dd" /></div>
								<div class="clearfix"></div>
								<div class="bot-border"></div>

								<div class="col-sm-5 col-xs-6 tital ">담당 실습실</div>
								<div class="col-sm-7">18419</div>
								<div class="clearfix"></div>
								<div class="bot-border"></div>

								<!-- /.box-body -->
							<a href="<c:url value="/myInfoEdit"/>" class="btn btn-info" style="width: 100%;">수정 모드</a>
							</div>
							<!-- /.box -->
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>