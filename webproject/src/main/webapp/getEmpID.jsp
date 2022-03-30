<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="main.css" type="text/css">
<title>Get Employee ID</title>
</head>
<body>
	Input Employee ID to view their reimbursement requests.
	<form action="viewEmpReqs.jsp" method="post">
		<table align="right">
			<tr>
				<td>ID:</td>
				<td><input type="text" name="id" required="required" /></td>
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