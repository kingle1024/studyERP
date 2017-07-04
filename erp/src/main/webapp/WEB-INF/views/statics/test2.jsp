<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ page import="java.util.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script src="/myapp/js/jquery-3.2.0.min.js"></script>
</head>
<body>
<p>

<% 

 String number = request.getParameter("number");

 String id = request.getParameter("id");

 String comment = request.getParameter("comment");

 

 HashMap<String,String> map = new HashMap<String,String>();

	map.put("number",number);

	map.put("id",id);

	map.put("comment",comment);

%>

  글번호:<%=map.get("number")%><br>

  아이디:<%=map.get("id")%><br>

  코멘트:<%=map.get("comment")%><br>

<%



%>

</p>



</body>
</html>