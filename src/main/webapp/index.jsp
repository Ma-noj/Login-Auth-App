<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>StudentManagementSystem</title>
</head>
<body>
	 <%-- <%
		response.setContentType("text/html");
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/navbar.html");
		dispatcher.include(request, response);
	%>  --%>
	<jsp:include page="/navbar.html"></jsp:include>
	<jsp:include page="/signin.html"></jsp:include>
	
</body>
</html>