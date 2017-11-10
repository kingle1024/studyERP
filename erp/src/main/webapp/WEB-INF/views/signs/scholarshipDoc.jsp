<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="utf-8" session="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>장학금 신청 문서</title>
<!-- http://vucket.com/index.php/topic/view/65 -->
<style>
.setPadding {
	padding: 10px;
}

.setDiv {
	padding-top: 50px;
	text-align: center;
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
html, body, input, textarea, select, button, table, pre, xmp, plaintext, listing{
	font-family : '맑은 고딕';
	font-size : 12px;
}
</style>
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
	<script src="<c:url value="/js/approvalModule.js" />"></script>
	<div class="panel panel-default">
		<div class="panel-heading">
			<h3 class="panel-title">
				<i class="fa fa-paper-plane fa-fw"></i> 장학금 신청 문서
			</h3>
		</div>
		<div class="panel-body">
			<div style="float: right;">
				<table cellpadding="20px" border="1">
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
						<c:forEach var="approvalsystem" items="${ approvalSystem }"
							varStatus="status">
							<td class="setPadding">&nbsp;</td>
						</c:forEach>
					</tr>
				</table>
			</div>
			<br /> <br /> <br /> <br /> <br /> <br />
			<form id="formname1" method="post">
				<table cellpadding="1" class="table table-hover">
					<tr>
						<td width="10%" align="center" bgcolor="#EEEAF8">제목</td>
						<td width=""><input type="text" class="form-control"
							name="title"></td>
					</tr>
				</table>
				<br> <br>
				<table cellpadding="1" class="table table-hover">
					<tr>
						<td width="10%" align="center" bgcolor="#EEEAF8">내용</td>
						<td><textarea cols="110" rows="10" name="content"></textarea></td>
					</tr>
					<tr>
					</tr>
					<tr>
						<td align="center" bgcolor="#EEEAF8">기타</td>
						<td><input type="text" class="form-control"
							name="etc"></td>
					</tr>
					<tr>
						<td>
							<a href="#" class="showMask">내 근무일지 확인</a>
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
								<input type="button" href="#" style="width: 100%;" class="close" value="닫기" />
								</div>
							</div>		
							</td>
						</tr>
					</table>
					<br>
					<br>
				<br> <input type="button" id="ReadingInfoSelectBtn"
					name="ReadingInfoSelectBtn" class="btn btn-lg btn-info"
					style="width: 100%" value="결재 하기"> <input type="hidden"
					name="${ _csrf.parameterName }" value="${ _csrf.token }" /> <input
					type="hidden" name="type_code" value="1200">
			</form>
		</div>
	</div>
</body>
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
</html>