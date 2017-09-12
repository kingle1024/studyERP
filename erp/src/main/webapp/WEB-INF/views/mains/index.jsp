<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page pageEncoding="utf-8" session="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>홈</title>
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
							<i class="fa fa-clock-o fa-fw"></i> 쪽지
						</h3>
					</div>
					<div class="panel-body">
						<div class="list-group">
							<c:forEach var="myMessage" items="${myMessages}" varStatus="status">
								<a href="#" class="list-group-item"> <span class="badge">${ messageTime[status.index]}</span>
									<i class="fa fa-fw fa-comments"></i>${ myMessage.title }
								</a>
							</c:forEach>
						</div>
						<div class="text-right">
							<a href="#">쪽지 더보기 <i class="fa fa-arrow-circle-right"></i></a>
						</div>
					</div>
				</div>
			</div>
			<div class="col-lg-3">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">
							<i class="fa fa-money fa-fw"></i> 공지사항
						</h3>
					</div>
					<div class="panel-body">
						<div class="table-responsive">
							<table class="table table-bordered table-hover table-striped">
								<thead>
									<tr>
										<th>제목</th>
										<th nowrap width="17%">시간</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="board" items="${boards }" varStatus="status">
										<tr>
											<td>${ board.title }</td>
											<td nowrap>${ noticeTime[status.index]}</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
						<div class="text-right">
							<a href="#">공지사항 더보기 <i class="fa fa-arrow-circle-right"></i></a>
						</div>
					</div>
				</div>
			</div>
			<div class="col-lg-3">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">
							<i class="fa fa-clock-o fa-fw"></i> 받은문서함
						</h3>
					</div>
					<div class="panel-body">
						<div class="list-group">
							<c:forEach var="approval" items="${approval }"
								varStatus="status">
								<a href="#" class="list-group-item"> <span class="badge">
								</span> <i class="fa fa-fw fa-comment"></i>${approval.title }
								</a>
							</c:forEach>
						</div>
						<div class="text-right">
							<a href="#">받은문서 더보기 <i class="fa fa-arrow-circle-right"></i></a>
						</div>
					</div>
				</div>
			</div>
			<div class="col-lg-3">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">
							<i class="fa fa-clock-o fa-fw"></i> 받은문서함
						</h3>
					</div>
					<div class="panel-body">
						<div class="list-group">
							<c:forEach var="approval" items="${approval }"
								varStatus="status">
								<a href="#" class="list-group-item"> <span class="badge">
								</span> <i class="fa fa-fw fa-comment"></i>${approval.title }
								</a>
							</c:forEach>
						</div>
						<div class="text-right">
							<a href="#">내작업대 더보기 <i class="fa fa-arrow-circle-right"></i></a>
						</div>
					</div>
				</div>
			</div>
		</div>
</body>
</html>