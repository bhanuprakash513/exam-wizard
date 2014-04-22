<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Results</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/jquery/jquery-1.10.2.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/jquery/jquery.mousewheel-3.0.6.pack.js"></script>





<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/jquery/themes/base/jquery.ui.all.css">

	<script src="${pageContext.request.contextPath}/resources/jquery/ui/jquery.ui.core.js"></script>
	<script src="${pageContext.request.contextPath}/resources/jquery/ui/jquery.ui.widget.js"></script>
	<script src="${pageContext.request.contextPath}/resources/jquery/ui/jquery.ui.mouse.js"></script>
	<script src="${pageContext.request.contextPath}/resources/jquery/ui/jquery.ui.button.js"></script>
	<script src="${pageContext.request.contextPath}/resources/jquery/ui/jquery.ui.draggable.js"></script>
	<script src="${pageContext.request.contextPath}/resources/jquery/ui/jquery.ui.position.js"></script>
	<script src="${pageContext.request.contextPath}/resources/jquery/ui/jquery.ui.resizable.js"></script>
	<script src="${pageContext.request.contextPath}/resources/jquery/ui/jquery.ui.button.js"></script>
	<script src="${pageContext.request.contextPath}/resources/jquery/ui/jquery.ui.dialog.js"></script>
	<script src="${pageContext.request.contextPath}/resources/jquery/ui/jquery.ui.effect.js"></script>
	

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/uikit/uikit.css">

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/menu.css">


<style type="text/css">
		

#quizTitle {
	width: 700px;
	background-color: rgb(187, 187, 187);
	margin-top: 100px;
	margin-bottom: 20px;
	height: 50px;
	text-align: center;
	line-height: 50px;
	font-size: 13pt;
	font-weight: bold;
	color: rgb(58, 56, 56);
}


#quiz_type {
	width: 700px;
	background-color: rgb(187, 187, 187);
	margin-top: 20px;
	margin-bottom: 20px;
	height: 50px;
	text-align: center;
	line-height: 50px;
	font-size: 13pt;
	font-weight: bold;
	color: rgb(58, 56, 56);
}



.check_question_options{
	margin-bottom: 5px;
}



.check_question_options > textarea{
	width: 530px;
	height: 36px;
	border: 3px solid #cccccc;
	padding: 5px;
	font-family: Tahoma, sans-serif;
	background-position: bottom right;
	background-repeat: no-repeat;
}

#chk_question_title,#edit_chk_question_title{
	width: 550px;
	height: 90px;
	border: 3px solid #cccccc;
	padding: 5px;
	font-family: Tahoma, sans-serif;
	background-position: bottom right;
	background-repeat: no-repeat;
}



.chk_question_title_inline {
	font-weight: bold;
	font-size: 12pt;
	margin-bottom: 10px;
	color: black;
}

.chk_question_options_inline {
	font-size: 12pt;
	font-weight: bold;
	font-style: oblique;
	margin-left: 10px;
	margin-bottom: 10px;
}


.edit_question_button_inline{
	margin-left: 10px;
	margin-top: 10px;
}

.delete_question_button_inline{
	margin-left: 10px;
	margin-top: 10px;
}

</style>
</head>
<body>
	<div id="headdiv" class="uk-container uk-container-center uk-margin-top uk-margin-large-bottom">
<%@ include file="header.jsp" %>

	</div>
	
	<c:if test="${result.userAnswers!=null && result.userAnswers.size()>0}">
		<div id="quizTitle"> <c:out value="${result.quiz.title}"/></div>
		<div id="questionCount"> <b>Total Questions: </b><c:out value="${result.totalQuestions}"/></div>
		<div id="questionCorrect"><b> Correct Answers:</b> <c:out value="${result.totalCorrect}"/></div>
		<div id="questionCorrect"> <b>Wrong Answers: </b><c:out value="${result.totalQuestions-result.totalCorrect}"/></div>
		<c:forEach items="${result.userAnswers}" var="ans" varStatus="aCount">
		  	<c:choose>
  	  			<c:when test="${ans.correct}"> <div class="correctAnswerWhole"> <img id="right_img" alt="MCQ" src="${pageContext.request.contextPath}/resources/images/right_1.jpg"></c:when>
  	  			<c:otherwise> <div class="wrongAnswerWhole"><img id="wrong_img" alt="MCQ" src="${pageContext.request.contextPath}/resources/images/wrong.png"></c:otherwise>
  	  		</c:choose>
  	  			<div id="question_title_${ans.question.questionId}"> <b><c:out value="${aCount.count}"/>.  <c:out value="${ans.question.title}"/> </b> </div>
  	  			 
  	  			<c:forEach items="${ans.question.answers}" var="choice"  varStatus="cCount">
  	  				<c:choose>
  	  					<c:when test="${choice.correct}"> <div class="choiceCorrect"> </c:when>
  	  					<c:otherwise><div class="choiceWrong"></c:otherwise>
  	  				</c:choose>
  	  				<c:choose>
  	  					<c:when test="${choice.userAnswer}"> 
  	  						<div><input type="checkbox" checked><c:out value="${choice.title}"/></input></div>

  	  					</c:when>
  	  					<c:otherwise><div><input type="checkbox"><c:out value="${choice.title}"/></input></div> </c:otherwise>
  	  				</c:choose>
	  	  		  		
	  	  		  	</div><!-- choice div -->
  	  		  	</c:forEach>
  	  		
  	  		</div> <!-- whole answer div -->
		</c:forEach>
	</c:if>
	
	
</body>
<%@ include file="footer.jsp" %>		

</html>