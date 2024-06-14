<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<h1>Header</h1>
<%
	String email = (String) session.getAttribute("email");
	if (email != null) {
		out.print("<h1>Hello " + email + "</h1>");
	}
%>