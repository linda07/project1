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
<title>View All Pending</title>
</head>
<body>
	<%
	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/revature", "root", "password");
		PreparedStatement ps = con.prepareStatement("select * from reimb where status=?");
		ps.setString(1, "pending");
		ResultSet rs = ps.executeQuery();
		%><table border=1 align=center style="text-align:center">
		<thead>
          <tr>
             <th>id</th>
             <th>amount</th>
             <th>submitted</th>
             <th>resolved</th>
             <th>description</th>
             <th>receipt</th>
             <th>author</th>
             <th>resolver</th>
             <th>status</th>
             <th>type</th>
          </tr>
      	</thead>
      	<tbody>
        <%while(rs.next())
        {
            %>
            <tr>
                <td><%=rs.getString("id") %></td>
                <td><%=rs.getString("amount") %></td>
                <td><%=rs.getString("submitted") %></td>
                <td><%=rs.getString("resolved") %></td>
                <td><%=rs.getString("description") %></td>
                <td><%=rs.getString("receipt") %></td>
                <td><%=rs.getString("author") %></td>
                <td><%=rs.getString("resolver") %></td>
                <td><%=rs.getString("status") %></td>
                <td><%=rs.getString("type") %></td>
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