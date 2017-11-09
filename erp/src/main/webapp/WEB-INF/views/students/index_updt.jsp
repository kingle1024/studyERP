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

	function actionModify() {
		$("#frm").submit();
	}



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

	function goUpdt() {
		alert("upload");
		$("#frm").submit();
	}
</script>
<script src="<c:url value="/resources/css/freelancer.min.js"/>"></script>
<script src="<c:url value="/js/lightbox/js/lightbox.js"/>"></script>
<link href="<c:url value="/js/lightbox/css/lightbox.min.css"/>"
	rel="stylesheet">

<title>실습실 관리</title>
<!-- Bootstrap Core CSS -->
<link href="<c:url value ="/resources//css/bootstrap.min.css"/>"
	rel="stylesheet">
<%-- <link href="<c:url value ="/resources//css/freelancer.min.css"/>" rel="stylesheet">
<link href="<c:url value ="/resources/css/font-awesome.min.css"/>" rel="stylesheet" type="text/css"> --%>


<!-- <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
	
	<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
	
	<link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css">
	
	<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css"> 
	 -->



<!-- Custom Fonts -->
<%--     <link href="<c:url value="/css/font-awesome.min.css" />" rel="stylesheet" type="text/css">
 --%>


<!-- <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic"
	rel="stylesheet" type="text/css">
 -->
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
					<form id="frm" name="frm" method="post"
						action="<c:url value='/studentsUpdt'/>"
						enctype="multipart/form-data">
						<input type="hidden" name="no" value="${pno}">
						<div class="col-lg-6 text-center">
							<h3>${pno}실습실근로장학생</h3>
							<hr style="border: solid 1.5px grey">
							<input type="file" name="img1_org"> <input type="file"
								name="img2_org"> <input type="file" name="img3_org">
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
						<input type="file" name="img4_org"> <img
							src="/uploadImage/${pv.img4_fake}"
							onerror="this.src='<c:url value="/image/emptyContent.gif"/>'"
							width="250px" height="350px">
						<script>
							// box 옵션 설정
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
		<!-- Portfolio Modals -->
		<div class="portfolio-modal modal fade" id="portfolioModal1"
			tabindex="-1" role="dialog" aria-hidden="true">
			<div class="modal-content">
				<div class="close-modal" data-dismiss="modal">
					<div class="lr">
						<div class="rl"></div>
					</div>
				</div>

				<div class="container">
					<div class="row">
						<div class="col-lg-8 col-lg-offset-2">
							<div class="modal-body">
								<h2>Project Title</h2>
								<hr class="star-primary">
								<img src="<c:url value ="/image/table.png"/>"
									class="img-responsive img-centered" alt="" width="400px"
									height="650px">
								<!-- 		<ul class="list-inline item-details">
							<li>Client: <strong><a
									href="http://startbootstrap.com">Start Bootstrap</a> </strong>
							</li>
							<li>Date: <strong><a
									href="http://startbootstrap.com">April 2014</a> </strong>
							</li>
							<li>Service: <strong><a
									href="http://startbootstrap.com">Web Development</a> </strong>
							</li>
						</ul> -->
								<button type="button" class="btn btn-default"
									data-dismiss="modal">
									<i class="fa fa-times"></i> Close
								</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="container">
			<div class="row">
				<div class="col-lg-8 text-center">
					<h2>강의실 상세정보</h2>
					<hr style="border: solid 1.5px grey">

				</div>
			</div>
		</div>

	</div>
	<div class="container">
		<div class="col-lg-8 text-center">
		<table class="table table-striped table-bordered table-hover" height="110px">
			<tr>
				<th width="70px"> 
			강의실 : ${pv.no} </th>
			</tr>
			<tr>
			<th>	
			
			컴퓨터 수 :  <input type="text" id="information" name="information" value="${pv.information}">
			</th>
			</tr>
			<tr>
			<th>
			설치프로그램 : <input type="text" id="program" name="program" value="${pv.program}">
			</th></tr></table>
		</div>
	
	<sec:authorize access="hasRole('ADMIN')">
	<%-- <a href="<c:url value="/students?no=${pv.no}" />" class="btn btn-lg btn-primary" >수정완료</a>	 --%>
	<a href="javascript:actionModify()" class="btn btn-lg btn-primary" >수정완료</a>
	</sec:authorize>
	
	</div>

	
		
		
<!-- 			 jQuery
    <script src="vendor/jquery/jquery.min.js"></script>

    Bootstrap Core JavaScript
    <script src="vendor/bootstrap/js/bootstrap.min.js"></script>
=======
		<div class="container">
			<div class="col-lg-10 text-center">
				<table class="table table-striped table-bordered table-hover"
					height="110px">
					<tr>
						<th width="70px">강의실 : ${pno}</th>
					</tr>
					<tr>
						<th>컴퓨터 수 : <input type="text" id="information"
							name="information" value="${pv.information}">
						</th>
					</tr>
					<tr>
						<th>설치프로그램 : <input type="text" id="program" name="program"
							value="${pv.program}">
						</th>
					</tr>
				</table>
			</div>
			<sec:authorize access="hasRole('ADMIN')">
				<%-- <a href="<c:url value="/students?no=${pv.no}" />" class="btn btn-lg btn-primary" >수정완료</a>	 --%>
				<a href="javascript:actionModify()" class="btn btn-lg btn-primary">수정완료</a>
			</sec:authorize>
		</div>
		<sec:authorize access="hasRole('ADMIN')">
			<a href="<c:url value="/students/new" />"
				class="btn btn-lg btn-primary" style="width: 100%;"> 글쓰기</a>
		</sec:authorize>
		</form>
		<script src="js/bootstrap.min.js"></script>
>>>>>>> 66cfa88bd18252e75ab43c1fc988c98cc727b0a7

		<!-- 			 jQuery
   <script src="vendor/jquery/jquery.min.js"></script>

   Bootstrap Core JavaScript
   <script src="vendor/bootstrap/js/bootstrap.min.js"></script>

   Plugin JavaScript
   <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>

   Contact Form JavaScript
   <script src="js/jqBootstrapValidation.js"></script>
   <script src="js/contact_me.js"></script>

   Theme JavaScript
   <script src="js/freelancer.min.js"></script> -->
		<!-- jQuery -->
		<!--     <script src="jquery.min.js"></script> -->

		<!-- Bootstrap Core JavaScript -->
		<!--     Plugin JavaScript
   <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>

   Contact Form JavaScript
   <script src="js/jqBootstrapValidation.js"></script>
   <script src="js/contact_me.js">	</script>

   Theme JavaScript
   <script src="js/freelancer.min.js"></script> -->
</body>

</html>



