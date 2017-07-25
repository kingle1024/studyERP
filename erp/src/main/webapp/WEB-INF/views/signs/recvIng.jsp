<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page pageEncoding="utf-8" session="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
	<html>
<head>
<title>받은 문서</title>
</head>
<body>
	<div class="jumbotron" id="subNav">
		<font size="6">받은 문서</font>- 받은 문서함 입니다.
	</div>
	<div class="container">
		<ul class="nav nav-tabs">
  			<li class="active"><a href="#">진행</a></li>
		  	<li><a href="#">대기</a></li>
			<li><a href="#">승인</a></li>
		  	<li><a href="#">반려</a></li>
		</ul>
		<table class="table table-striped">
    <thead>
      <tr>
        <th>Firstname</th>
        <th>Lastname</th>
        <th>Email</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>John</td>
        <td>Doe</td>
        <td>john@example.com</td>
      </tr>
      <tr>
        <td>Mary</td>
        <td>Moe</td>
        <td>mary@example.com</td>
      </tr>
      <tr>
        <td>July</td>
        <td>Dooley</td>
        <td>july@example.com</td>
      </tr>
    </tbody>
  </table>
	</div>
	
</body>
</html>