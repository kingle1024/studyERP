<%@page import="com.mycompany.vo.Message"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page pageEncoding="utf-8" session="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
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
 
       
 
        function resizeImg2(osrc)
 
        {
 
            var bdiv =document.createElement('DIV');
 
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
 
            odiv.innerHTML = "<a href='javascript:void(closeImg())'><img id='oimg' src='"+osrc+"' border='0' width='1000' height='800'/></a>";
 
            var img = document.all['oimg'];
 
            var owidth = (document.body.clientWidth)/2 - (img.width)/2;
 
            var oheight = (document.body.clientHeight)/2 - (img.height)/2;
 
            odiv.style.position = 'absolute';
 
            odiv.style.top = oheight + document.body.scrollTop;
 
            odiv.style.left = owidth;
 
            scrollImg();
 
        }
 
        function scrollImg()
 
        {
 
            var odiv = document.all['odiv'];
 
            var img = document.all['oimg'];
 
            var oheight = (document.body.clientHeight)/2 - (img.height)/2 + document.body.scrollTop;
 
            odiv.style.top = oheight;
 
            settime = setTimeout(scrollImg, 100);
 
        }
 
        function closeImg()
 
        {
 
            document.body.removeChild(odiv);
 
            document.body.removeChild(bdiv);
 
            clearTimeout(settime);
 
        }
 
    </script>
<script src="<c:url value="/resources/css/freelancer.min.js"/>" ></script>
<script src="<c:url value="/js/lightbox/js/lightbox.js"/>"></script>
<link href="<c:url value="/js/lightbox/css/lightbox.min.css"/>" rel="stylesheet">

<title>실습실 관리</title>
<!-- Bootstrap Core CSS -->
<link href="<c:url value ="/resources//css/bootstrap.min.css"/>" rel="stylesheet">
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

	<div class="jumbotron" id="subNav">
		<font size="6">실습실 관리</font> -실습실 현황을 볼 수 있습니다.<font size="5">-강의실
			${pv.no}</font>
	</div>

	<div style="float: left; width: 30%; margin-left: 450px">
		<div class="row">
			<div class="col-lg-10 text-center">
				`
				<h2>${pv.no} 실습실 근로장학생</h2>
				<hr style="border: solid 1.5px grey">
			</div>
		</div>
		<img src="/uploadImage/${pv.img1_fake}" class="img-circle" width="150px" height="150px"> 
			<img src="/uploadImage/${pv.img2_fake}" class="img-circle" width="150px" height="150px">
			<img src="/uploadImage/${pv.img3_fake}"  class="img-circle" width="150px" height="150px"> 
	</div>
	<div style="float: right; width: 30%;">
		<div class="row">
			<div class="col-lg-8 text-center">
				
				<h2>${pv.no} 시간표</h2>
				<hr style="border: solid 1.5px grey">	
				<%-- <img src="<c:url value ="/image/table1.png"/>"onclick="resizeImg2(this.src)" class="img-responsive" alt=" " > --%>
				<a href="/uploadImage/${pv.img4_fake}"
					data-lightbox="image-1" data-title="시간표"><img src="/uploadImage/${pv.img4_fake}"  class="img-circle" width="150px" height="150px"> </a>
				<script>
				    lightbox.option({
				      'resizeDuration': 200,
				      'wrapAround': true,
				       maxWidth : 1000,
				       maxHeight: 800
				    })
				</script>				
				
				<%-- <hr style="border: solid 1.5px grey">
				<div class="col-sm-4 portfolio-item">
					<a href="#portfolioModal1" class="portfolio-link" data-toggle="modal">
						<div class="caption">
							<div class="caption-content">
								<i class="fa fa-search-plus fa-3x"></i>
							</div>
						
						</div> 
					</a>
				</div> --%>
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
							<img src="<c:url value ="/image/table.png"/>"class="img-responsive img-centered" alt="" width="400px"height="650px"> 
								
						
							
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
	<div class="container">
		<div class="col-lg-8 text-center">
		<table class="table table-striped table-bordered table-hover" height="110px">
			<tr>
				<th width="70px"> 
			강의실 : ${pv.no } </th>
			</tr>
			<tr>
			<th>	
			
			컴퓨터 수 :  ${pv.information }</th>
			</tr>
			<tr>
			<th>
			설치프로그램 : ${pv.program }
			</th></tr></table>
		</div>
	<sec:authorize access="hasRole('ADMIN')">

	<a href="<c:url value="/studentsUpdt?no=${pv.no}" />" class="btn btn-lg btn-primary" >
					수정</a>	
					</sec:authorize>
	
	<div class="container">
		<!-- <div class="jumbotron" id="jumbo"> -->
		<br>
		<br>
		<div class="col-lg-10 text-center">
			<h2>건의게시판</h2>
			<table class="table table-striped">
				<thread>
				<tr>
					<th width="70px">번호</th>
					<th>제목</th>
					<th width="70px">작성자</th>
					<th width="150px">날짜</th>
					<th width="70px">조회수</th>
				</tr>
				</thread>
				<tbody>
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
				<sec:authorize access="hasRole('ADMIN')">
					<a href="<c:url value="/students/new" />" class="btn btn-lg btn-primary" style="width:100%;">
					글쓰기</a>	
				</sec:authorize>

    <!-- jQuery -->
<!--     <script src="jquery.min.js"></script> -->

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>

<!--     Plugin JavaScript
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>

    Contact Form JavaScript
    <script src="js/jqBootstrapValidation.js"></script>
    <script src="js/contact_me.js">	</script>

    Theme JavaScript
    <script src="js/freelancer.min.js"></script> -->

</body>

</html>



