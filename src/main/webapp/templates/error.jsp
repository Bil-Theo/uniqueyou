<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	 <link rel='icon' href='./assets/images/systeme/logo.JPG'/>
	<title>Error</title>
</head>
<body>
	<jsp:include page="header.jsp">
	<%
		String message = (String) request.getAttribute("error");
		if(message!=null){
	%>
	<p style='font-size: 200%; font-weight: bold; margin: 50%'><%= message%></p>
	<%} %>
</body>
</html>