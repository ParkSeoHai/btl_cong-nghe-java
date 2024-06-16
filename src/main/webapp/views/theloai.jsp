<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>
<%
var title = request.getParameter("title");
	if (title == null) {
		out.print("Thể loại");
	} else {
		out.print(title);
	}
%>
</title>
</head>
<body>

</body>
</html>