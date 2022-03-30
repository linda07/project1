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
<title>View Info</title>
</head>
<body>
	<%
	
	String sessionUN = (String) session.getAttribute("uname");
	String sessionPW = (String) session.getAttribute("pwd");
	
	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/revature", "root", "password");
		PreparedStatement ps = con.prepareStatement("select * from people where username=? and password=?");
		ps.setString(1, sessionUN);
		ps.setString(2, sessionPW);
		ResultSet rs = ps.executeQuery();
		if(rs.next()) {
			String id = rs.getString("id");
			String name = rs.getString("name");
			String email = rs.getString("email");
			
			out.print("ID: " + id + "<br>");
			out.print("Name: " + name + "<br>");
			out.print("Email: " + email + "<br>");
			out.print("Username: " + sessionUN + "<br>");
			out.print("Password: " + sessionPW + "<br><br>");
		}
		else {
			out.print("Invalid credentials!!! Pls try again....<br></br>");
		}
		con.close();
	} catch (Exception e) {
		e.printStackTrace();
	}
	%>
	<a href="empHome.html">back to Menu</a>
</body>
</html>