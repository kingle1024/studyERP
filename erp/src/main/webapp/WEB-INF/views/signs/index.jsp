<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="utf-8" session="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>결재 하기</title>
</head>
<body>
	<div class="jumbotron" id="subNav">
		<font size="6">결재하기</font>-결재 기능을 수행할 수 있습니다.
	</div>
	<div class="container">
		<a href="#" onclick="window.open('<c:url value="/signs/atypicalDoc"/>', '_blank', 'width=1300 height=750')" class="btn btn-lg btn-primary" >비정형 문서</a>
		<a href="#" onclick="window.open('<c:url value="/signs/breakdownDoc"/>', '_blank', 'width=1300 height=750')" class="btn btn-lg btn-primary" >실습실 고장 문서</a>
<%-- 		<a href="#" onclick="window.open('<c:url value="/signs/scholarshipDoc"/>', '_blank', 'width=1300 height=750')" class="btn btn-lg btn-primary">장학금 신청 문서</a> --%>
	</div>
</body>
</html>