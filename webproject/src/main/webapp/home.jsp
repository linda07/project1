<%@page import="org.apache.naming.HandlerRef"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="main.css" type="text/css">
<title>Home Page</title>
</head>
<body>
	<%
	
		String username = request.getParameter("uname");
		String password = request.getParameter("pwd");
		
		if (username == null || username.trim().equals("")) {
			response.sendRedirect("login.jsp");
		} else {

	session.setAttribute("uname", username);
	session.setAttribute("pwd", password);
	
	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/revature", "root", "password");
		PreparedStatement ps = con.prepareStatement("select * from people where username=? and password=?");
		ps.setString(1, username);
		ps.setString(2, password);
		ResultSet rs = ps.executeQuery();
		if(rs.next()) {
			out.print("Login Successful!!!<br>");
			
			String id = rs.getString("id");
			session.setAttribute("id", id);

			String type2 = rs.getString("type");
			if (type2.equals("employee")){
				response.sendRedirect("empHome.html");
			}
			else if (type2.equals("manager")){
				response.sendRedirect("manHome.html");
			}
		}
		else {
			out.print("Invalid credentials!!! Please try again....");
		}
		con.close();
	} catch (Exception e) {
		e.printStackTrace();
	}
	}
	%>
	<br></br>
	<a href="login.jsp">back to Login</a>
</body>
</html>