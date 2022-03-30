<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="main.css" type="text/css">
<title>Submit Reimbursement</title>
</head>
<body>
	<h1>Submit Reimbursement</h1>
	<form action="subReimbResult.jsp" method="post">
		<table>
			<tr>
				<td>Type:</td>
				<td>
					<input type="radio" id="lodging" name="type" value="lodging" checked>
					<label for="lodging">Lodging</label>
					
					<input type="radio" id="travel" name="type" value="travel" checked>
					<label for="travel">Travel</label>
					
					<input type="radio" id="food" name="type" value="food" checked>
					<label for="food">Food</label>
					
					<input type="radio" id="other" name="type" value="other" checked>
					<label for="other">Other</label>
				</td>
			</tr>
			<tr>
				<td>Amount:</td>
				<td><input type="text" name="amount" required="required" /></td>
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