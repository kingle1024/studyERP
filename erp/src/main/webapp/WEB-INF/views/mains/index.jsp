<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page pageEncoding="utf-8" session="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>홈</title>
<script>
function viewDoc(num){
	window.open("${pageContext.request.contextPath}/signs/docView?Doc="+num, "네이버새창", "width=800, height=700, toolbar=no, menubar=no, scrollbars=yes, resizable=yes" );  
}  
</script>
<!-- http://morrisjs.github.io/morris.js/ -->
<link rel="stylesheet"
	href="//cdnjs.cloudflare.com/ajax/libs/morris.js/0.5.1/morris.css">
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/morris.js/0.5.1/morris.min.js"></script>

<link href="http://fonts.googleapis.com/css?family=Open+Sans:300"
	rel="stylesheet">
<style>
/* http://kottenator.github.io/jquery-circle-progress/ */
.new-tab-link {
	padding-right: 14px;
	background:
		url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAkAAAAJCAYAAADgkQYQAAAACXBIWXMAAAsTAAALEwEAmpwYAAAAB3RJTUUH3ggXDSIzCeRHfQAAABl0RVh0Q29tbWVudABDcmVhdGVkIHdpdGggR0lNUFeBDhcAAAA9SURBVBjTY2RAA/+XMvxHF2NkwAOwacCq4P9Shv8suFQzRiNsYUEXwKoJ2VhkNrIaJgYiAAs2N2BVRMirAD6JHi10MCdVAAAAAElFTkSuQmCC)
		no-repeat right center;
}

.page-title {
	font: 400 40px/1.5 Open Sans, sans-serif;
	text-align: center;
}

.circles {
	margin-bottom: -10px;
}

.circle {
	width: 100px;
	margin: 6px 6px 20px;
	display: inline-block;
	position: relative;
	text-align: center;
	line-height: 1.2;
}

.circle canvas {
	vertical-align: top;
}

.circle strong {
	position: absolute;
	top: 30px;
	left: 0;
	width: 100%;
	text-align: center;
	line-height: 40px;
	font-size: 30px;
}

.circle strong i {
	font-style: normal;
	font-size: 0.6em;
	font-weight: normal;
}

.circle span {
	display: block;
	color: #aaa;
	margin-top: 12px;
}

/* p { */
/*   margin: 40px 0; */
/* } */
.install {
	display: inline-block;
}

.install a {
	display: block;
	width: auto;
	vertical-align: middle;
	padding: 6px 12px;
	line-height: 20px;
	background-color: #111;
	color: #fff;
	border-radius: 3px;
	text-decoration: none;
	margin: 5px auto;
	transition: all .3s;
}

.install code {
	padding: 6px 12px;
	display: block;
	font: 13px/20px Courier New, Liberation Mono, monospase;
	background-color: #333333;
	border-radius: 4px;
	margin: 5px 0;
	white-space: nowrap;
}

.install a:hover {
	background-color: #222;
}

.credits {
	color: #aaa;
	position: fixed;
	left: 0;
	bottom: 0;
	width: 100%;
}

.credits img {
	margin-left: 4px;
	border-radius: 4px;
	vertical-align: middle;
}

@media ( max-height : 600px) , ( max-width : 480px) {
	.credits {
		position: inherit;
	}
}
</style>
</head>
<body>
	<div id="page-wrapper">
		<div class="container-fluid">
			<div class="row">
				<div class="col-lg-12">
					<div class="alert alert-info alert-dismissable">
						<i class="fa fa-home"></i> <strong>홈</strong>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-3 col-md-6">
					<div class="panel panel-primary">
						<div class="panel-heading">
							<div class="row">
								<div class="col-xs-3">
									<i class="fa fa-comments fa-5x"></i>
								</div>
								<div class="col-xs-9 text-right">
									<div class="huge">${messageTotal}</div>
									<div>New Comments!</div>
								</div>
							</div>
						</div>
						<a href="<c:url value="/messages" />">
							<div class="panel-footer">
								<span class="pull-left">더보기</span> <span class="pull-right"><i
									class="fa fa-arrow-circle-right"></i></span>
								<div class="clearfix"></div>
							</div>
						</a>
					</div>
				</div>
				<div class="col-lg-3 col-md-6">
					<div class="panel panel-green">
						<div class="panel-heading">
							<div class="row">
								<div class="col-xs-3">
									<i class="fa fa-table fa-5x"></i>
								</div>
								<div class="col-xs-9 text-right">
									<div class="huge">${noticeTotal }</div>
									<div>New Tasks!</div>
								</div>
							</div>
						</div>
						<a href="<c:url value="/notices" />">
							<div class="panel-footer">
								<span class="pull-left">더보기</span> <span class="pull-right"><i
									class="fa fa-arrow-circle-right"></i></span>
								<div class="clearfix"></div>
							</div>
						</a>
					</div>
				</div>
				<div class="col-lg-3 col-md-6">
					<div class="panel panel-yellow">
						<div class="panel-heading">
							<div class="row">
								<div class="col-xs-3">
									<i class="fa fa-paper-plane fa-5x"></i>
								</div>
								<div class="col-xs-9 text-right">
									<div class="huge">${approvalTotal }</div>
									<div>New Orders!</div>
								</div>
							</div>
						</div>
						<a href="<c:url value="/signs/recv" />">
							<div class="panel-footer">
								<span class="pull-left">더보기</span> <span class="pull-right"><i
									class="fa fa-arrow-circle-right"></i></span>
								<div class="clearfix"></div>
							</div>
						</a>
					</div>
				</div>
				<div class="col-lg-3 col-md-6">
					<div class="panel panel-red">
						<div class="panel-heading">
							<div class="row">
								<div class="col-xs-3">
									<i class="fa fa-folder-open fa-5x"></i>
								</div>
								<div class="col-xs-9 text-right">
									<div class="huge">${myworkTotalCount }</div>
									<div>New Works!</div>
								</div>
							</div>
						</div>
						<a href="<c:url value="/mywork"/>">
							<div class="panel-footer">
								<span class="pull-left">더보기</span> <span class="pull-right"><i
									class="fa fa-arrow-circle-right"></i></span>
								<div class="clearfix"></div>
							</div>
						</a>
					</div>
				</div>
			</div>
			<!-- /.row -->

			<div class="row">
				<div class="col-lg-3">
					<div class="panel panel-default">
						<div class="panel-heading">
							<h3 class="panel-title">
								<i class="fa fa-comments fa-fw"></i> 쪽지
							</h3>
						</div>
						<div class="panel-body">
							<div class="list-group">
								<script>
							var popupX = (window.screen.width / 2) - (200 / 2);
							// 만들 팝업창 좌우 크기의 1/2 만큼 보정값으로 빼주었음
			
							var popupY= (window.screen.height /2) - (300 / 2);
							// 만들 팝업창 상하 크기의 1/2 만큼 보정값으로 빼주었음
						</script>
								<c:forEach var="myMessage" items="${myMessages}"
									varStatus="status">
									<a href="#"
										onclick="window.open('<c:url value="/messages/view/${ myMessage.no }/2" />', '_blank', 'status=no, height=400, width=700, left='+ popupX + ', top='+ popupY + ', screenX='+ popupX + ', screenY= '+ popupY)"
										class="list-group-item"> <span class="badge badge-info">${ messageTime[status.index]}</span>
										<i class="fa fa-fw fa-comments"></i>${ myMessage.title }
									</a>
								</c:forEach>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-3">
					<div class="panel panel-default">
						<div class="panel-heading">
							<h3 class="panel-title">
								<i class="fa fa-table fa-fw"></i> 공지사항
							</h3>
						</div>
						<div class="panel-body">
							<div class="table-responsive">
								<c:forEach var="board" items="${boards }" varStatus="status">
									<a href="#"
										onclick="window.open('<c:url value="/notice/view/${board.id }/?page=${page }&state=2" />', '_blank', 'status=no, height=400, width=700, left='+ popupX + ', top='+ popupY + ', screenX='+ popupX + ', screenY= '+ popupY)"
										class="list-group-item"><span class="badge badge-success"
										style="float: right;">${ noticeTime[status.index]}</span> <i
										class="fa fa-fw fa-table"></i>${ board.title } </a>
								</c:forEach>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-3">
					<div class="panel panel-default">
						<div class="panel-heading">
							<h3 class="panel-title">
								<i class="fa fa-paper-plane fa-fw"></i> 받은문서함
							</h3>
						</div>
						<div class="panel-body">
							<div class="list-group">
								<c:forEach var="approval" items="${approval }"
									varStatus="status">
									<a href="#" onclick="viewDoc(${approval.no })"
										class="list-group-item"> <span class="badge badge-warning">
											${ approvalTime[status.index] } </span> <i
										class="fa fa-fw fa-paper-plane"></i>${approval.title }
									</a>
								</c:forEach>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-3">
					<div class="panel panel-default">
						<div class="panel-heading">
							<h3 class="panel-title">
								<i class="fa fa-folder-open fa-fw"></i> 내 작업대
							</h3>
						</div>
						<div class="panel-body">
							<div class="list-group">
								<c:forEach var="mywork" items="${mywork }" varStatus="status">
									<a href="#" class="list-group-item"> <span
										class="badge badge-error"> ${myworkTime[status.index]}</span>
										<i class="fa fa-fw fa-clock-o"></i> ${mywork.startTime }~${mywork.endTime }
										(${mywork.endSubStart })
									</a>
								</c:forEach>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-6">
					<div class="panel panel-default">
						<div class="panel-heading">
							<h3 class="panel-title">
								<i class="fa fa-folder-open fa-fw"></i> 방문자 통계
							</h3>
						</div>
						<div class="panel-body">
							<div class="list-group">
								<div class="row">
									<div id="morrisChart" style="height: 250px; width: 90%;"></div>
									<!-- JavaScript -->
									<!-- html -->
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-6">
					<div class="panel panel-default">
						<div class="panel-heading">
							<h3 class="panel-title">
								<i class="fa fa-folder-open fa-fw"></i> 통계
							</h3>
						</div>
						<div class="panel-body">
							<div class="list-group">
								<div class="row">
									<div class="second circle">
										<strong></strong> <span>처리 현황</span>
									</div>
									<!-- JavaScript -->
									<!-- html -->
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<h1>${todayCount }</h1>

	<script type="text/javascript">
		$(document).ready(function(){
			var grpah = ${morrisData}.graph;
			var morrisData = [];
			$.each(grpah, function(idx, value){
				morrisData.push({'period':value.date, 'value' :value.visitCount});
			});
			console.log('morrisData:');
			console.log(morrisData);
		
		new Morris.Line({
			  // ID of the element in which to draw the chart.
			  element: 'morrisChart',
			  // Chart data records -- each entry in this array corresponds to a point on
			  // the chart.
			  data:morrisData,
			  // The name of the data record attribute that contains x-values.
			  xkey: 'period',
			  // A list of names of data record attributes that contain y-values.
			  ykeys: ['value'],
			  // Labels for the ykeys -- will be displayed when you hover over the
			  // chart.
			  labels: ['방문자']
			});
		})
	</script>
	<script
		src="https://rawgit.com/kottenator/jquery-circle-progress/1.2.2/dist/circle-progress.js"></script>
	<script>
	 
	 /* Examples */
	 (function($) {
	   /*
	    * Example 1:
	    *
	    * - no animation
	    * - custom gradient
	    *
	    * By the way - you may specify more than 2 colors for the gradient
	    */
	   $('.first.circle').circleProgress({
	     value: 0.35,
	     animation: false,
	     fill: {gradient: ['#ff1e41', '#ff5f43']}
	   });

	   /*
	    * Example 2:
	    *
	    * - default gradient
	    * - listening to `circle-animation-progress` event and display the animation progress: from 0 to 100%
	    */
	   $('.second.circle').circleProgress({
	     value: 0.9
	   }).on('circle-animation-progress', function(event, progress) {
	     $(this).find('strong').html(Math.round(90 * progress) + '<i>%</i>');
	   });

	   /*
	    * Example 3:
	    *
	    * - very custom gradient
	    * - listening to `circle-animation-progress` event and display the dynamic change of the value: from 0 to 0.8
	    */
	   $('.third.circle').circleProgress({
	     value: 0.75,
	     fill: {gradient: [['#0681c4', .5], ['#4ac5f8', .5]], gradientAngle: Math.PI / 4}
	   }).on('circle-animation-progress', function(event, progress, stepValue) {
	     $(this).find('strong').text(stepValue.toFixed(2).substr(1));
	   });

	   /*
	    * Example 4:
	    *
	    * - solid color fill
	    * - custom start angle
	    * - custom line cap
	    * - dynamic value set
	    */
	   var c4 = $('.forth.circle');

	   c4.circleProgress({
	     startAngle: -Math.PI / 4 * 3,
	     value: 0.5,
	     lineCap: 'round',
	     fill: {color: '#ffa500'}
	   });

	   // Let's emulate dynamic value update
	   setTimeout(function() { c4.circleProgress('value', 0.7); }, 1000);
	   setTimeout(function() { c4.circleProgress('value', 1.0); }, 1100);
	   setTimeout(function() { c4.circleProgress('value', 0.5); }, 2100);

	   /*
	    * Example 5:
	    *
	    * - image fill; image should be squared; it will be stretched to SxS size, where S - size of the widget
	    * - fallback color fill (when image is not loaded)
	    * - custom widget size (default is 100px)
	    * - custom circle thickness (default is 1/14 of the size)
	    * - reverse drawing mode
	    * - custom animation start value
	    * - usage of "data-" attributes
	    */
	   $('.fifth.circle').circleProgress({
	     value: 0.7
	     // all other config options were taken from "data-" attributes
	     // options passed in config object have higher priority than "data-" attributes
	     // "data-" attributes are taken into account only on init (not on update/redraw)
	     // "data-fill" (and other object options) should be in valid JSON format
	   });
	 })(jQuery);
	 </script>

</body>
</html>