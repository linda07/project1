<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="main.css" type="text/css">
<title>Get Pending ID</title>
</head>
<body>
	Input ID of pending request to approve/deny.
	<form action="pendApproveDeny.jsp" method="post">
		<table align="right">
			<tr>
				<td>ID:</td>
				<td><input type="text" name="id" required="required" /></td>
			</tr>
			<tr>
				<td>Action:</td>
				<td>
					<input type="radio" id="approve" name="action" value="approve" checked>
					<label for="approve">Approve</label>
					
					<input type="radio" id="deny" name="action" value="deny" checked>
					<label for="deny">Deny</label>
				</td>
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