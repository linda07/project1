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
<title>View All Employees</title>
</head>
<body>
	<%
	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/revature", "root", "password");
		PreparedStatement ps = con.prepareStatement("select * from people where type=?");
		ps.setString(1, "employee");
		ResultSet rs = ps.executeQuery();
		%><table border=1 align=center style="text-align:center">
		<thead>
          <tr>
             <th>id</th>
             <th>name</th>
             <th>email</th>
             <th>username</th>
          </tr>
      	</thead>
      	<tbody>
        <%while(rs.next())
        {
            %>
            <tr>
                <td><%=rs.getString("id") %></td>
                <td><%=rs.getString("name") %></td>
                <td><%=rs.getString("email") %></td>
                <td><%=rs.getString("username") %></td>
            </tr>
            <%}%>
           </tbody>
		</table><br>
	<%} catch (Exception e) {
		e.printStackTrace();
	}
	%>
	<a href="manHome.html">back to Menu</a>
</body>
</html>