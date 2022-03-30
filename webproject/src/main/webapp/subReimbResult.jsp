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
<title>Result</title>
</head>
<body>
	<%
		String sessionID = (String) session.getAttribute("id");
		String sessionUN = (String) session.getAttribute("uname");
		String sessionPW = (String) session.getAttribute("pwd");
	
		String type = request.getParameter("type");
		String amount = request.getParameter("amount");

		LocalDateTime time = LocalDateTime.now();
		
		try{
			int status = 0;
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/revature", "root", "password");
			PreparedStatement ps = con.prepareStatement("insert into reimb (amount,submitted,author,status,type) values (?,?,?,?,?)");
			ps.setString(1, amount);
			ps.setObject(2, time.toString());
			//ps.setString(3, sessionUN);
			ps.setString(3, sessionID);
			ps.setString(4, "pending");
			ps.setString(5, type);
			status = ps.executeUpdate();
			if (status > 0) {
				out.print("reimbursement submitted successfully!!!<br></br>");
			}
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	%>
	<a href="empHome.html">back to Menu</a>
</body>
</html>