<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
	HttpSession s = request.getSession(false);
	RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
	
	if(s==null){
		request.setAttribute("message", "Vous devriez vous identifiez d'abord avant de faire cette opération");
		rd.forward(request, response);
	}
	else{
		
		s.invalidate();
		response.sendRedirect("index.jsp");
		
	}
	
%>