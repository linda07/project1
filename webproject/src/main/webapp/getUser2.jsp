<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="main.css" type="text/css">
<title>New User Info</title>
</head>
<body>
	Please input new user info.<br></br>
	<form action="updateInfo.jsp" method="post">
		<table align="left">
			<tr>
				<td>(new) Name:</td>
				<td><input type="text" name="n" required="required" /></td>
			</tr>
			<tr>
				<td>(new) Email:</td>
				<td><input type="email" name="e" required="required" onblur="sendInfo()" /></td>
			</tr>
			<tr>
				<td>(new) Username:</td>
				<td><input type="text" name="u" required="required" /></td>
			</tr>
			<tr>
				<td>(new) Password:</td>
				<td><input type="password" name="p" required="required" /></td>
			</tr>
			<tr>
				<td align="center"><input type="reset" value="Clear"></td>
				<td align="center"><input type="submit" value="Submit"
					required="required" /></td>
			</tr>
		</table>
	</form>
</body>
</html>