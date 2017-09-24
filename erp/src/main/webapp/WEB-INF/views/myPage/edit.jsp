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
<script type="text/javascript">
	$(function() {
		$("#profileImgFile").on('change', function() {
			readURL(this);
		});
	});
	function readURL(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();
			reader.onload = function(e) {
				$('#profile').attr('src', e.target.result);
			}
			reader.readAsDataURL(input.files[0]);
		}
	}
</script>
<style>
input.hidden {
	position: absolute;
	left: -9999px;
}

#profile {
	cursor: pointer;
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
<form action="<c:url value="/myInfoEdit" />" method="post" name="uploadForm" enctype="multipart/form-data" >
	<!-- https://bootsnipp.com/snippets/nPvnk  -->
	<div id="page-wrapper">
		<div class="row">
			<div class="col-md-7 ">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h4><i class="fa fa-fw fa-user"></i>사용자 프로필 수정</h4>
					</div>
					<div class="panel-body">
						<div class="box box-info">
							<div class="box-body">
								<div class="col-sm-5">
									<div align="center">
										<input type='file' name="files[0]"  style="display:none;" id="profileImgFile" > 
										<input type="text" name="profileImgFileText" id="profileImgFileText" style="display:none;">
										<c:set var="filePath" value="" />
										<c:if test="${!empty user.profileImagePath }">
											<c:set var="filePath" value="image/profileImage/${ user.profileImagePath}" />
										</c:if>
																				
										<img id="profile" alt="User Pic" src="${ filePath }" onerror="this.src='<c:url value="/image/student.png"/>'" border='0' onclick="document.all.profileImgFile.click(); document.all.profileImgFileText.value=document.all.profileImgFile.value" class="img-circle img-responsive">
										<div style="color: #999;">클릭해서 프로필 사진을 바꿀 수 있습니다</div>
										<!--Upload Image Js And Css-->
									</div>
									<br>
									<!-- /input-group -->
								</div>
								<div class="col-sm-6">
									<h4 style="color: #00b1b1;">사용자 권한</h4>
									<span>
										<p>
											<c:set var="doneLoop" value="false" />
											<c:forEach var="authority" items="${ user.authorities }">
												<c:if test="${not doneLoop}">
													<c:if test="${ authority.authority == 'ROLE_ADMIN'}">관리자 <c:set
															var="doneLoop" value="true" />
													</c:if>
													<c:if test="${ authority.authority == 'ROLE_MANAGER'}">근장 <c:set
															var="doneLoop" value="true" />
													</c:if>
													<c:if test="${ authority.authority == 'ROLE_USER'}">학생 <c:set
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
								<div class="col-sm-3 col-xs-6 "><input type="text" name="name" value="${user.name }" class="form-control"></div>
								<div class="clearfix"></div>
								<div class="bot-border"></div>

								<div class="col-sm-5 col-xs-6 tital ">생년월일</div>
								<div class="col-sm-3"><input type="text" name="socialNumFront" value="${user.socialNumFront }" class="form-control"></div>
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
								<input type="submit" value="수정" class="btn btn-info" style="width: 100%;">
							</div>
							<!-- /.box -->

						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</form>
</body>
</html>