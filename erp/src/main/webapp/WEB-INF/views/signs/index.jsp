<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="utf-8" session="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>결재 하기</title>
</head>
<body>
	<div id="page-wrapper">
 <div class="row">
           <div class="col-lg-12">
               <div class="alert alert-info alert-dismissable">
                   <i class="fa fa-info-circle"></i>  <strong>결재하기</strong> 
               </div>
           </div>
       </div>
		<a href="#" onclick="window.open('<c:url value="/signs/atypicalDoc"/>', '_blank', 'width=1300 height=750')" class="btn btn-lg btn-primary" >비정형 문서</a>
		<a href="#" onclick="window.open('<c:url value="/signs/breakdownDoc"/>', '_blank', 'width=1300 height=750')" class="btn btn-lg btn-primary" >실습실 고장 문서</a>
<%-- 		<a href="#" onclick="window.open('<c:url value="/signs/scholarshipDoc"/>', '_blank', 'width=1300 height=750')" class="btn btn-lg btn-primary">장학금 신청 문서</a> --%>
	</div>
</body>
</html>