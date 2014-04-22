<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Quiz</title>
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
	

<script src="${pageContext.request.contextPath}/resources/js/takeQuiz.js"></script> 

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/uikit/uikit.css">

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/menu.css">


<style type="text/css">
		

#create_quiz_title {
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


<input type="hidden" id="quizId" name="quizId" value="${quizId}">

<div id="create_quiz_title"></div>


<div id="question_details_content"></div>

<div id="complete_section">
	<button id="complete"> Complete </button>
</div>
	<%@ include file="footer.jsp" %>	
</div>
</body>
</html>