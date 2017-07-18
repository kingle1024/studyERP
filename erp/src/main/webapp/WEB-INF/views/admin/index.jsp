<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page pageEncoding="utf-8" session="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>

<body>
<div class="jumbotron" id="subNav">
	<font size="6">관리자 페이지</font> - 회원을 관리할 수 있습니다.
</div>
<div class="container">
<table class="table table-striped">
	
    <thead>
        <tr>
            <th>사용자</th>
            <th>권한</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach var="user" items="${ users }">
            <tr>
                <td width="30%">${ user.email }</td>
                <td width="">
                    <c:forEach var="authority" items="${ user.authorities }">
                        ${ authority.authority } / 
                    </c:forEach>
                </td>
                  <td width="21%">
                    <p>
                        <c:url var="changeRolePath" value="/admin/role/${ user.id }" />
                        <a href="${ changeRolePath }/admin" class="btn btn-default <c:if test="${ user.hasRole('ADMIN') }">btn-primary</c:if>">관리자</a>
                        <a href="${ changeRolePath }/manager" class="btn btn-default <c:if test="${ user.hasRole('MANAGER') }">btn-primary</c:if>">매니저</a>
                        <a href="${ changeRolePath }/user" class="btn btn-default <c:if test="${ user.hasRole('USER') }">btn-primary</c:if>">사용자</a>
                    </p>
                </td>
                <td width="6%">
                	<a href="<c:url value="/admin/delete/${ user.id }" />" class="btn btn-default btn-danger" onclick="if(!confirm('삭제 하시겠습니까?')){return false;}">삭제</a>
                </td>
            </tr>
        </c:forEach>
    </tbody>
</table>
</div>
</body>
</html>