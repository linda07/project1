<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="main.css" type="text/css">
<title>Check Register</title>
</head>
<body>
<!-- 	<a href="login.jsp">Login</a> &nbsp;&nbsp; -->
<!-- 	<a href="register.html">Register</a> -->
	<%
		String type = request.getParameter("type");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String username = request.getParameter("uname");
		String password = request.getParameter("pwd");
		
// 		if (email == null || email.trim().equals("")) {
// 			out.print("Please enter email ID :");
// 		} else {
// 			// 		int id = Integer.parseInt(s);
// 			// 		out.print(id);

			try {
			int status = 0;
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/revature", "root", "password");
			PreparedStatement ps = con.prepareStatement("select * from people where email=? or username=?");
			ps.setString(1, email);
			ps.setString(2, username);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				out.print("Already registered!!!");
			} 
			else {
				ps = con.prepareStatement("insert into people (name,email,username,password,type) values (?,?,?,?,?)");
				ps.setString(1, name);
				ps.setString(2, email);
				ps.setString(3, username);
				ps.setString(4, password);
				ps.setString(5, type);		
				status = ps.executeUpdate();
				if (status > 0) {
					out.print("Registered successfully!!!");
				}
			}
			con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
//	}
	%>
	<br></br>
	<a href="login.jsp">back to Login</a>
</body>
</html>