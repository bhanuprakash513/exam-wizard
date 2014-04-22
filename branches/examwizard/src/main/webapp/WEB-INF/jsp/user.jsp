<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
	<title>User Registration</title>
	<style type="text/css">
		body {
			font-family: sans-serif;
		}
		.data, .data td {
			border-collapse: collapse;
			width: 100%;
			border: 1px solid #aaa;
			margin: 2px;
			padding: 2px;
		}
		.data th {
			font-weight: bold;
			background-color: #5C82FF;
			color: white;
		}
	</style>
</head>
<body>

<h2>User Registration</h2>

<form:form method="post" action="user/add.html" commandName="user">
	<table>
	<tr>
		<td>User Id</td>
		<td><form:input path="userId" /></td> 
	</tr>
	<tr>
		<td>Name</td>
		<td><form:input path="name" /></td>
	</tr>
	<tr>
		<td colspan="2">
			<input type="submit" value="Sign Up!"/>
		</td>
	</tr>
</table>	
</form:form>


</body>
</html>
