<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page pageEncoding="utf-8" session="false"%>
<html>
<head>
<link href="<c:url value="/css/bootstrap.min.css" />" rel="stylesheet">
<title>Home</title>
</head>
<body>
    <div class="container">
        <div class="jumbotron">
            <h1>Hello world!</h1>
            <p>The time on the server is ${serverTime}.</p>
        </div>
    </div>
</body>
</html>