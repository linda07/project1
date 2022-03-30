<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="main.css" type="text/css">
<title>Login Page</title>
</head>
<body>
	<h1>Welcome!</h1>
	If new user, please
	<a href="register.html">Register.</a><br></br>
	<form action="home.jsp" method="post">
		<table align="right">
			<tr>
				<td>Username:</td>
				<td><input type="text" name="uname" required="required" /></td>
			</tr>
			<tr>
				<td>Password:</td>
				<td><input type="password" name="pwd" required="required" /></td>
			</tr>
			<tr>
				<td align="center"><input type="reset" value="Clear"></td>
				<td align="center"><input type="submit" value="Login"
					required="required" /></td>
			</tr>
		</table>
	</form>
</body>
</html>