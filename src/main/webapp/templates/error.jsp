<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<%@ include file='./templates/icon.jsp' %>
	<title>Error</title>
</head>
<body>
	<jsp:include page="./templates/header.jsp">
	<%
		String message = (String) request.getAttribute("error");
		if(message!=null){
	%>
	<p style='font-size: 200%; font-weight: bold; margin: 50%'><%= message%></p>
</body>
</html>