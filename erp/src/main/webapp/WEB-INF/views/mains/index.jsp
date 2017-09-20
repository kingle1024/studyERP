<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page pageEncoding="utf-8" session="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>홈</title>
<script>
function viewDoc(num){
	window.open("${pageContext.request.contextPath}/signs/docView?Doc="+num, "네이버새창", "width=800, height=700, toolbar=no, menubar=no, scrollbars=yes, resizable=yes" );  
}  
</script>
</head>
<body>
<div id="page-wrapper">
	<div class="container-fluid">
		<div class="row">
           <div class="col-lg-12">
               <div class="alert alert-info alert-dismissable">
                   <i class="fa fa-home"></i>  <strong>홈</strong> 
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
								<div class="huge">26</div>
								<div>New Comments!</div>
							</div>
						</div>
					</div>
					<a href="<c:url value="/messages" />">
						<div class="panel-footer">
							<span class="pull-left">더보기</span> <span
								class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
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
								<div class="huge">12</div>
								<div>New Tasks!</div>
							</div>
						</div>
					</div>
					<a href="<c:url value="/notices" />">
						<div class="panel-footer">
							<span class="pull-left">더보기</span> <span
								class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
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
								<div class="huge">124</div>
								<div>New Orders!</div>
							</div>
						</div>
					</div>
					<a href="<c:url value="/signs/recv" />">
						<div class="panel-footer">
							<span class="pull-left">더보기</span> <span
								class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
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
								<div class="huge">13</div>
								<div>Support Tickets!</div>
							</div>
						</div>
					</div>
					<a href="<c:url value="/mywork"/>">
						<div class="panel-footer">
							<span class="pull-left">더보기</span> <span
								class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
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
							<c:forEach var="myMessage" items="${myMessages}" varStatus="status">
								<a href="#" onclick="window.open('<c:url value="/messages/view/${ myMessage.no }/2" />', '_blank', 'status=no, height=400, width=700, left='+ popupX + ', top='+ popupY + ', screenX='+ popupX + ', screenY= '+ popupY)" class="list-group-item"> <span class="badge badge-info">${ messageTime[status.index]}</span>
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
								<a href="#" onclick="window.open('<c:url value="/notice/view/${board.id }/2?page=1" />', '_blank', 'status=no, height=400, width=700, left='+ popupX + ', top='+ popupY + ', screenX='+ popupX + ', screenY= '+ popupY)" class="list-group-item"><span class="badge badge-success" style="float:right;">${ noticeTime[status.index]}</span> 
									<i class="fa fa-fw fa-table"></i>${ board.title }
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
							<i class="fa fa-paper-plane fa-fw"></i> 받은문서함
						</h3>
					</div>
					<div class="panel-body">
						<div class="list-group">
							<c:forEach var="approval" items="${approval }"
								varStatus="status">
								<a href="#" onclick="viewDoc(${approval.no })" class="list-group-item"> <span class="badge badge-warning"> ${ approvalTime[status.index] } </span> 
									<i class="fa fa-fw fa-paper-plane"></i>${approval.title }
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
							<i class="fa fa-clock-o fa-fw"></i> 내 작업대
						</h3>
					</div>
					<div class="panel-body">
						<div class="list-group">
							<c:forEach var="approval" items="${approval }"
								varStatus="status">
								<a href="#" onclick="viewDoc(${approval.no })" class="list-group-item"> <span class="badge badge-error"> ${ approvalTime[status.index] } </span> 
									<i class="fa fa-fw fa-comment"></i>${approval.title }
								</a>
							</c:forEach>
						</div>
					</div>
				</div>
			</div>
                </div>
		</div>
</body>
</html>