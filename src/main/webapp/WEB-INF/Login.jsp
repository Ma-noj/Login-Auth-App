<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</head>
<body>
		<%!
		private static Connection con;
		private static PreparedStatement pstmt;
		private static ResultSet resultSet;
		%>
		
		<%
			response.setContentType("text/html");
			Class.forName("com.mysql.cj.jdbc.Driver");
			String url = "jdbc:mysql://localhost:3306/authentication?user=root&password=root";
			con  = DriverManager.getConnection(url);
			
			String sql = "SELECT * from user_info where u_mailid = ? and u_psw = ?";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, request.getParameter("uemail"));
			pstmt.setString(2, request.getParameter("psw"));
			resultSet = pstmt.executeQuery();
			if(resultSet.next())
			{
				String msg = "Hi "+resultSet.getString(2)+" Welcome To User Page Have A Nice Day!! ";
				sql = "insert into user_msg values(?,?,?)";
				
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, (int)(Math.random()*100));
				pstmt.setInt(2, resultSet.getInt(1));
				pstmt.setString(3, msg);
				pstmt.executeUpdate();
				out.println(msg);
			} 
			else 
			{
				out.println("Invalied Credentials");
			}
		
		%>
		
</body>
</html>