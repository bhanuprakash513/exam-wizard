<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<form action="search">
		<input type="text" name="term" id="term">
		 <input type="submit" value="search" >
	</form>
	
	<c:if test="${quizList!=null && quizList.size()>0}">
		<c:forEach items="${quizList}" var="quiz">
  	  		${quiz.title}<br>
		</c:forEach>
	</c:if>
	
	

	<!--  Pagination  -->

	<c:if test="${prev}">
		<a href="search?term=${term}&page=${prevPage}">Prev</a>
	</c:if>

	<c:if test="${next}">
		<a href="search?term=${term}&page=${nextPage}">Next</a>
	</c:if>
</body>
</html>