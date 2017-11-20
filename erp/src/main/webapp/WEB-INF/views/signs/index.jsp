<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="utf-8" session="false"%>
<!DOCTYPE html>
<html>
<head>
<title>결재 하기</title>
</head>
<body>
	<div id="page-wrapper">
 <div class="row">
           <div class="col-lg-12">
               <div class="alert alert-info alert-dismissable">
                   <i class="fa fa-paper-plane"></i>  <strong>결재하기</strong> 
               </div>
           </div>
       </div>
       
       <div class="col-lg-4">
	       <div class="panel panel-default">
		       <div class="panel-heading">
		          <h3>비정형 문서</h3>
		       </div>
		       <div class="panel-body">
		          <p>
		          	정해지지 않는 형식의 문서입니다.<br><br>
		            결재 단계 : 1차<br>
		            결재자 : 근장장
					</p>
		          <p><a class="btn btn-primary" onclick="window.open('<c:url value="/signs/signDoc?docType=atypicalDoc"/>', '_blank', 'width=1300 height=750')" role="button">결재하기</a></p>
		        </div>
	        </div>
        </div>
        
	        <div class="col-lg-4">
	        	<div class="panel panel-default">
		       		<div class="panel-heading">
	          			<h3>실습실 고장 문서</h3>
	          		</div>
	          		<div class="panel-body">
	          			<p>
	          			실습실에서 고장난 것이 있을 때 사용하는 문서입니다.<br><br>
	          			결재 단계 : 2차<br>
	          			결재자 : 근장장, 관리자
	          			</p>
	          			<p><a class="btn btn-primary" onclick="window.open('<c:url value="/signs/signDoc?docType=breakDownDoc"/>', '_blank', 'width=1300 height=750')" role="button">결재하기</a></p>
	          		</div>
	          	</div>
     	   </div>
     	   
     	   
        <div class="col-lg-4">
        	<div class="panel panel-default">
		    	<div class="panel-heading">
          			<h3>장학금 신청 문서</h3>
          		</div>
          		<div class="panel-body">
          			<p>
          			내 작업대에서 작성한 근무일지를 바탕으로 장학금을 신청하는 문서입니다.<br>
		          	결재 단계 : 3차<br>
          			결재자 : 근장장, 관리자, 학교
          			</p>
			          <p><a class="btn btn-primary" onclick="window.open('<c:url value="/signs/signDoc?docType=scholarshipDoc"/>', '_blank', 'width=1300 height=750')" role="button">결재하기</a></p>
          		</div>
          	</div>
        </div>
<%-- 		<a href="#" onclick="window.open('<c:url value="/signs/signDoc?docType=atypicalDoc"/>', '_blank', 'width=1300 height=750')" class="btn btn-lg btn-primary" >비정형 문서</a> --%>
<%-- 		<a href="#" onclick="window.open('<c:url value="/signs/signDoc?docType=breakDownDoc"/>', '_blank', 'width=1300 height=750')" class="btn btn-lg btn-primary" >실습실 고장 문서</a> --%>
<%-- 		<a href="#" onclick="window.open('<c:url value="/signs/signDoc?docType=scholarshipDoc"/>', '_blank', 'width=1300 height=750')" class="btn btn-lg btn-primary">장학금 신청 문서</a> --%>
	</div>
</body>
</html>