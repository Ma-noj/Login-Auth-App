<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Sign-Up</title>
</head>
<body>
	<%!
		private static Connection con;
		private static PreparedStatement pstmt;
		private static ResultSet resultSet;
	%>
	<%
		int result = 0;
		response.setContentType("text/html");
		//Logic to Insert to DB
		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			String url = "jdbc:mysql://localhost:3306/authentication?user=root&password=root";
			con  = DriverManager.getConnection(url);
			
			String sql = "insert into user_info VALUES(?,?,?,?,?)";
			pstmt  = con.prepareStatement(sql);
			
			pstmt.setInt(1, Integer.parseInt(request.getParameter("id")));
			pstmt.setString(2, request.getParameter("name"));
			pstmt.setString(3, request.getParameter("email"));
			pstmt.setLong(4, Long.parseLong(request.getParameter("phno")));
			pstmt.setString(5, request.getParameter("psw"));
			result = pstmt.executeUpdate();
			if(result==1)
			{
				out.println("<h1>Registered Successfully</h1>");
			}
			else
			{
				out.println("<h1>Not Registered Successfully</h1>");
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	
	%>
</body>
</html>