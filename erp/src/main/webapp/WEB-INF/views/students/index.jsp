<%@page import="com.mycompany.vo.Message"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page pageEncoding="utf-8" session="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<style>
#jumbo {
	padding-top: 20px;
	padding-bottom: 20px;
}
</style>
<script type="text/javascript">
	function resizeImg2(osrc) {
		var bdiv = document.createElement('DIV');
		document.body.appendChild(bdiv);
		bdiv.setAttribute("id", "bdiv");
		bdiv.style.position = 'absolute';
		bdiv.style.top = 0;
		bdiv.style.left = 0;
		bdiv.style.zIndex = 0;
		bdiv.style.width = document.body.scrollWidth;
		bdiv.style.height = document.body.scrollHeight;
		bdiv.style.background = 'gray';
		//bdiv.style.filter = "alpha(opacity=75)";
		bdiv.style.opacity = '0.5';
		//bdiv.style.mozOpacity = '0.5'; 
		var odiv = document.createElement('DIV');
		document.body.appendChild(odiv);
		odiv.style.zIndex = 1;
		odiv.setAttribute("id", "odiv");
		odiv.innerHTML = "<a href='javascript:void(closeImg())'><img id='oimg' src='" + osrc + "' border='0' width='1000' height='800'/></a>";
		var img = document.all['oimg'];
		var owidth = (document.body.clientWidth) / 2 - (img.width) / 2;
		var oheight = (document.body.clientHeight) / 2 - (img.height) / 2;
		odiv.style.position = 'absolute';
		odiv.style.top = oheight + document.body.scrollTop;
		odiv.style.left = owidth;
		scrollImg();
	}
	function scrollImg() {
		var odiv = document.all['odiv'];
		var img = document.all['oimg'];
		var oheight = (document.body.clientHeight) / 2 - (img.height) / 2 + document.body.scrollTop;
		odiv.style.top = oheight;
		settime = setTimeout(scrollImg, 100);
	}
	function closeImg() {
		document.body.removeChild(odiv);
		document.body.removeChild(bdiv);
		clearTimeout(settime);
	}
</script>
<script src="<c:url value="/resources/css/freelancer.min.js"/>"></script>
<script src="<c:url value="/js/lightbox/js/lightbox.js"/>"></script>
<link href="<c:url value="/js/lightbox/css/lightbox.min.css"/>"
	rel="stylesheet">

<title>실습실 관리</title>
<!-- Bootstrap Core CSS -->
<link href="<c:url value ="/resources/css/bootstrap.min.css"/>"
	rel="stylesheet">

</head>
<body>
	<div id="page-wrapper">
		<div class="row">
			<div class="col-lg-12">
				<div class="alert alert-info alert-dismissable">
					<i class="fa fa-comments"></i> <strong>실습실 관리 - ${ pno }
						강의실</strong>
				</div>
			</div>
		</div>

		<div class="container">
			<div class="row">
				<div class="col">
					<div class="col-lg-6 text-center">
						<h3>${pno}실습실근로장학생</h3>
						<hr style="border: solid 1.5px grey">
						<img src="/uploadImage/${pv.img1_fake}"
							onerror="this.src='<c:url value="/image/student.png"/>'"
							class="img-circle" width="150px" height="150px"> <img
							src="/uploadImage/${pv.img2_fake}"
							onerror="this.src='<c:url value="/image/student.png"/>'"
							class="img-circle" width="150px" height="150px"> <img
							src="/uploadImage/${pv.img3_fake}"
							onerror="this.src='<c:url value="/image/student.png"/>'"
							class="img-circle" width="150px" height="150px">
					</div>
				</div>
				<div class="col">
					<div class="col-lg-6 text-center">
						<h3>${pno}시간표</h3>
						<hr style="border: solid 1.5px grey">
						<a href="/uploadImage/${pv.img4_fake}" data-lightbox="image-1"
							data-title="시간표"><img src="/uploadImage/${pv.img4_fake}"
							onerror="this.src='<c:url value="/image/emptyContent.gif"/>'"
							width="250px" height="350px"> </a>
						<script>
							lightbox.option({
								'resizeDuration' : 200,
								'wrapAround' : true,
								maxWidth : 1000,
								maxHeight : 800
							})
						</script>
					</div>
				</div>
			</div>
		</div>

		<div class="container">
			<div class="col-lg-8 text-center">
				<h2>강의실 상세정보</h2>
				<hr style="border: solid 1.5px grey">
				<table class="table table-striped table-bordered table-hover"
					height="110px">
					<tr>
						<th width="70px">강의실 : ${pno }</th>
					</tr>
					<tr>
						<th>컴퓨터 수 : ${pv.information }</th>
					</tr>
					<tr>
						<th>설치프로그램 : ${pv.program }</th>
					</tr>
				</table>
			</div>
			<sec:authorize access="hasRole('ADMIN')">
				<a href="<c:url value="/studentsUpdt?no=${pno}" />"
					class="btn btn-lg btn-primary"> 수정</a>
			</sec:authorize>
		</div>

		<div class="container">
			<br> <br>
			<div class="col-lg-10 text-center">
				<h2>건의게시판</h2>
				<table class="table table-striped">
					<thead>
						<tr>
							<th width="1%" nowrap>번호</th>
							<th>제목</th>
							<th width="1%" nowrap>작성자</th>
							<th width="1%" nowrap>강의실</th>
							<th width="12%" nowrap>날짜</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="studentboard" items="${studentboards}"
							varStatus="status">
							<tr>
								<th>${status.count}</th>
								<th><a
									href="<c:url value="/students/view/${studentboard.uniqueID}" /> ">
										${ studentboard.title } </a></th>
								<th>${studentboard.userID}</th>
								<th>${studentboard.lectureRoom}</th>
								<th><fmt:formatDate value="${ studentboard.date }"
										pattern="MM-dd HH:mm" /></th>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<div class="text-center">
					<ul class="pagination">
						<li class="active"><a href="#">1</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
<%-- 	<tbody>
					<c:forEach var="studentboard" items="${studentboards}"
						varStatus="status">
						<tr>
							<th>${ studentboard.id }</th>
							<th><a
								href="<c:url value="/students/view/${ studentboard.id }" /> ">
									${ studentboard.title } </a></th>
							<th>${ studentboard.author }</th>
							<th><fmt:formatDate value="${ studentboard.register_date }"
									pattern="yyyy-MM-dd HH:mm" /></th>
							<th>${ studentboard.hit }</th>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div class="text-center">
				<ul class="pagination">
					<li class="active"><a href="#">1</a></li>
					<li><a href="#">2</a></li>
					<li><a href="#">3</a></li>
					<li><a href="#">4</a></li>
					<li><a href="#">5</a></li>
				</ul>
			</div>
		</div>
				<sec:authorize access="hasRole('ADMIN')">
					<a href="<c:url value="/students/new" />" class="btn btn-lg btn-primary" style="width:100%;">
					글쓰기</a>	
				</sec:authorize>

    <script src="js/bootstrap.min.js"></script> --%>
