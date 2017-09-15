<%@ page pageEncoding="utf-8" session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Bootstrap Core CSS -->
<link href="<c:url value="/theme/css/bootstrap.min.css" />"
	rel="stylesheet">

<!-- Custom CSS -->
<link href="<c:url value="/theme/css/sb-admin.css" />" rel="stylesheet">

<!-- Morris Charts CSS -->
<link href="<c:url value="/theme/css/plugins/morris.css" />"
	rel="stylesheet">

<!-- Custom Fonts -->
<link href="<c:url value="/theme/font-awesome/css/font-awesome.min.css" />"
	rel="stylesheet" type="text/css">

</head>
<body>
	<div id="wrapper">
		<tiles:insertAttribute name="header" />
		<tiles:insertAttribute name="content" />
	</div>
	<%--         <tiles:insertAttribute name="footer" /> --%>
	<!-- jQuery -->
	<script src="<c:url value="/theme/js/jquery.js" />"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="<c:url value="/theme/js/bootstrap.min.js" />"></script>

	<!-- Morris Charts JavaScript -->
	<script src="<c:url value="/theme/js/plugins/morris/raphael.min.js" />"></script>
	<script src="<c:url value="/theme/js/plugins/morris/morris.min.js" />"></script>
	<script src="<c:url value="/theme/js/plugins/morris/morris-data.js" />"></script>
</body>
</html>