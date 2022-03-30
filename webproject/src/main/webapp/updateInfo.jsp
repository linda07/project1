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
<title>Update Info</title>
</head>
<body>
	<%
	String sessionUN = (String) session.getAttribute("uname");
	String sessionPW = (String) session.getAttribute("pwd");
	
	String newN = request.getParameter("n");
	String newE = request.getParameter("e");
	String newUN = request.getParameter("u");
	String newPW = request.getParameter("p");
	
	session.setAttribute("uname", newUN);
	session.setAttribute("pwd", newPW);

	try {
			int status = 0;
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/revature", "root", "password");
			PreparedStatement ps = con.prepareStatement("select * from people where username=? and password=?");
			ps.setString(1, sessionUN);
			ps.setString(2, sessionPW);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				String query = "update people set name=?, email=?, username=?, password=? where id=?";
				try {
					ps = con.prepareStatement(query);
					ps.setString(1, newN);
					ps.setString(2, newE);
					ps.setString(3, newUN);
					ps.setString(4, newPW);
					ps.setInt(5, rs.getInt("id"));
					status = ps.executeUpdate();
					if (status > 0) {
						out.print("Updated successfully!!!");
					}
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
	%>
	<br></br>
	<a href="empHome.html">back to Menu</a>
</body>
</html>