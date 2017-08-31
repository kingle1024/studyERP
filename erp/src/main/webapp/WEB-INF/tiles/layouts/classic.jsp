<%@ page pageEncoding="utf-8" session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        
        <script src="https://npmcdn.com/tether@1.2.4/dist/js/tether.min.js"></script>
        
        <c:url var="bootstrap" value="/css/bootstrap.min.css" />
        <link href="${ bootstrap }" rel="stylesheet">
        
        <c:url var="custom" value="/css/custom.css" />
        <link href="${ custom }" rel="stylesheet">
        
        <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
        
        <script src="<c:url value="/js/jquery-3.2.0.min.js" /> " ></script>
        
	    <script src="http://cdn.rawgit.com/twbs/bootstrap/v4-dev/dist/js/bootstrap.js"></script> <!--  없으면 drop-down 안됨 그리고 이 위치에 있어야 함-->
    </head>
    <body>
    
<!--         <div class="container"> -->
            <tiles:insertAttribute name="header" />
            <tiles:insertAttribute name="content" />
            <tiles:insertAttribute name="footer" />
<!--         </div> -->
    </body>
</html>