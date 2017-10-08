<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page pageEncoding="utf-8" session="false"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>문서 보기</title>
<%
	Object Doc = request.getParameter("Doc");
%>
<style>
.setPadding {
	padding: 10px;
}

.setDiv {
	padding-top: 50px;
}

.mask {
	position: absolute;
	left: 0;
	top: 0;
	z-index: 9999;
	background-color: #000;
	display: none;
}

.window {
	display: none;
	background-color: #ffffff;
	height: auto;
	z-index: 99999;
}
table { 
}  
</style>
</head>
<body>
	<div class="row">
		<div class="row">
			<div class="col-lg-13">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">
							<i class="fa fa-paper-plane fa-fw"></i>
							<c:choose>
							<c:when test="${ approval.type_code eq 1000}">  
								비정형문서
							</c:when>
							<c:when test="${ approval.type_code eq 1100 }">
								고장 신청 문서
							</c:when>
							<c:when test="${ approval.type_code eq 1200 }">
								장학금 신청 문서
							</c:when>
							</c:choose>
						</h3>
					</div>
					<div class="panel-body">
						<div style="float: right">
							<table cellpadding="20px" border="1">
								<c:set var="approvalState" value="${ approval.state }" />
								<c:set var="approvalName" value="${ approval.recv_id}" />
								<c:set var="principal" value="${ principal  }" />
								<tr>
									<td rowspan="2" bgcolor="#EEEAF8">결<br>재
									</td>
									<c:forEach var="approvalsystem" items="${ approvalSystem }"
										varStatus="status">
										<td class="setPadding">${ approvalsystem.manager }</td>
										<!-- 표시 -->
									</c:forEach>
								</tr>
								<tr>
									<c:forEach var="i" begin="1"
										end="${ approvalSystem[0].lastStep }" step="1">
										<td class="setPadding">
											<!-- 해당 계정이 몇번째 ing인지 가져온다. 그리고 step이랑 ing랑 같으면 표시한다 --> <c:choose>
												<c:when
													test="${ approvalState eq 0 and principal eq approvalName and currentIng eq i}">
													<button onclick="moduleApprovalReject(1,<%=Doc%>)"
														class="btn btn-success">
														<i class="fa fa-circle-o" aria-hidden="true">승인</i>
													</button>
													<%-- 								<a href="#" onclick="check(1,<%=Doc%>)"><img src="<c:url value="/image/approval.png" />" width="80%" height="60%" ></a> --%>
													<br />
													<button onclick="moduleApprovalReject(2,<%=Doc%>)"
														class="btn btn-danger">
														<i class="fa fa-times" aria-hidden="true">반려</i>
													</button>
													<%-- 								<a href="#" onclick="check(2,<%=Doc%>)"><img src="<c:url value="/image/reject.png" />" width="80%" height="60%"></a> --%>
												</c:when>
												<c:otherwise>
												<c:choose>
														<c:when test="${approvalSub[i-1].state eq '1' }">
												승인
											</c:when>
														<c:when test="${approvalSub[i-1].state eq '2' }">
												반려
											</c:when>
													</c:choose>
													<br />
													<fmt:formatDate value="${approvalSub[i-1].update_date }"
														pattern="MM-dd HH:mm" />
												</c:otherwise>
											</c:choose> &nbsp;
										</td>
									</c:forEach>
								</tr>
							</table>
						</div>
						<br> <br> <br> <br> <br> <br> <br>
						<table border="0">
							<tr>
								<td width="" align="center" bgcolor="#EEEAF8" nowrap>제 목</td>
								<td colspan="3">${approval.title }</td>
							</tr>
							<tr>
								<td width="" align="center" bgcolor="#EEEAF8" nowrap>작 성 자</td>
								<td>${sendName }(${approval.send_id })</td>
								<!-- 			<td width="" align="center" bgcolor="#EEEAF8" nowrap>문서 번호</td> -->
								<%-- 			<td>기안 - ${approval.no }</td> --%>
							</tr>
							<tr>
								<td width="" align="center" bgcolor="#EEEAF8">기 안 일</td>
								<td>${approval.register_date }</td>
								<!-- 			<td width="" align="center" bgcolor="#EEEAF8" nowrap>문서 양식</td> -->
								<!-- 			<td nowrap>비정형 문서</td> -->
							</tr>
							<tr>
								<td style="border: hidden;">&nbsp;</td>
							</tr>
							<tr>
								<td style="border: hidden;">&nbsp;</td>
							</tr>
							<c:set var="data" value="${ map }" />
							<c:if test="${data ne 'errorCase' }">
								<c:forEach var="entry" items="${map}" varStatus="status">
									<tr>
										<td align="center" bgcolor="#EEEAF8" nowrap>${entry.key }</td>
										<td>${entry.value }</td>
									</tr>
								</c:forEach>
							</c:if>
							<tr>
								<td width="100px" align="center" bgcolor="#EEEAF8">내용</td>
								<td><textarea cols="78" rows="6" readonly>${approval.content }</textarea></td>
							</tr>
							<tr>
								<td width="100px" align="center" bgcolor="#EEEAF8">기타</td>
								<td><textarea cols="78" rows="3" readonly>${approval.etc }</textarea></td>
							</tr>
							<c:if test="${!empty mywork }">
							<tr>
								<td>
									<br>
									<a href="#" class="showMask">근무일지 확인</a>
								<div class="mask"></div>
								<div class="window">
									<div class="panel panel-default">
										<div class="panel-heading">
											<h3 class="panel-title">
												<i class="fa fa-paper-plane fa-fw"></i> 장학금 신청 문서
											</h3>
										</div>
										<div class="panel-body">
										<table class="table">
											<tr>
												<td>번호</td>
												<td>날짜</td>
												<td>근무시작</td>
												<td>근무종료</td>
												<td>근무시간</td>
												<td>내용</td>
											</tr>
											<c:forEach var="mywork" items="${ mywork }" varStatus="status">
												<tr>
													<td>${ status.count }</td>
													<td>${ mywork.workDate }</td>
													<td>${ mywork.startTime }</td>
													<td>${ mywork.endTime }</td>
													<td>${ mywork.endSubStart }<td>${ mywork.content }</td>
												</tr>
											</c:forEach>
										</table>
										</div>	
										</div>
										</div>
								</td>
							</tr>
							</c:if>
							
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
function moduleApprovalReject(state, Doc){
	$.ajax({  
		  type: 'POST',  
		  url: '${pageContext.request.contextPath}/signs/moduleApprovalReject',  
		  data: {"state":state, "Doc":Doc},  
		  success:function(data){			  
			  alert("성공");
			  window.close();
		  },
		  error:function(jqXHR, testStatus, errorThrown){
			  alert("에러 발생!!");
		  }
	});  
}
</script>
<script type="text/javascript">
	function wrapWindowByMask() {
		// 화면의 높이와 너비를 변수로 만듭니다.
		var maskHeight = $(document).height();
		var maskWidth = $(window).width();

		// 마스크의 높이와 너비를 화면의 높이와 너비 변수로 설정합니다.
		$('.mask').css({
			'width' : maskWidth,
			'height' : maskHeight
		});

		// fade 애니메이션 : 1초 동안 검게 됐다가 80%의 불투명으로 변합니다.
		$('.mask').fadeIn(1000);
		$('.mask').fadeTo("slow", 0.8);

		// 레이어 팝업을 가운데로 띄우기 위해 화면의 높이와 너비의 가운데 값과 스크롤 값을 더하여 변수로 만듭니다.
		var left = ($(window).scrollLeft() + ($(window).width() - $('.window')
				.width()) / 2);
		var top = ($(window).scrollTop() + ($(window).height() - $('.window')
				.height()) / 2);

		// css 스타일을 변경합니다.
		$('.window').css({
			'left' : left,
			'top' : top,
			'position' : 'absolute'
		});
		// 레이어 팝업을 띄웁니다.
		$('.window').show();
	}

	$(document).ready(function() {
		// showMask를 클릭시 작동하며 검은 마스크 배경과 레이어 팝업을 띄웁니다.
		$('.showMask').click(function(e) {
			// preventDefault는 href의 링크 기본 행동을 막는 기능입니다.
			e.preventDefault();
			wrapWindowByMask();
		});

		// 닫기(close)를 눌렀을 때 작동합니다.
		$('.window .close').click(function(e) {
			e.preventDefault();
			$('.mask, .window').hide();
		});

		// 뒤 검은 마스크를 클릭시에도 모두 제거하도록 처리합니다.
		$('.mask').click(function() {
			$(this).hide();
			$('.window').hide();
		});
	});
</script>
</body>
</html>