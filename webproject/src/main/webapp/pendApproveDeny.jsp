<%@page import="java.time.LocalDateTime"%>
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
<title>Approve or Deny</title>
</head>
<body>
	<%
	String sessionUN = (String) session.getAttribute("uname");
	String id = request.getParameter("id");
	String action = request.getParameter("action");
	
	LocalDateTime time = LocalDateTime.now();
	
	try {
		int status = 0;
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/revature", "root", "password");
		PreparedStatement ps = con.prepareStatement("select * from reimb where id=?");
		ps.setString(1, id);
		ResultSet rs = ps.executeQuery();
		if (rs.next()){
			String stat = rs.getString("status");
			if (stat.equalsIgnoreCase("pending")){
				ps = con.prepareStatement("update reimb set resolved=?, resolver=?, status=? where id=?");
				ps.setObject(1, time.toString());
				ps.setString(2, sessionUN);
				ps.setString(3, action);
				ps.setString(4, id);
				status = ps.executeUpdate();
				if (status > 0) {
					out.print("changed Successfully!!!");
				}
			}
		}
		else {
			out.print("please input correct ID of a pending request.");
		}
	} catch (Exception e) {
		e.printStackTrace();
	}
	%>
	<br></br>
	<a href="manHome.html">back to Menu</a>
</body>
</html>