<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Administrator</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/uikit/uikit.css">
<!-- <script
	src="${pageContext.request.contextPath}/resources/jquery/jquery.js"></script> -->

	

<script type="text/javascript" src="${pageContext.request.contextPath}/resources/jquery/jquery-1.10.2.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/jquery/jquery.mousewheel-3.0.6.pack.js"></script>
<script src="${pageContext.request.contextPath}/resources/uikit/uikit.js"></script> 
<script src="${pageContext.request.contextPath}/resources/uikit/sticky.js"></script> 
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/fancybox/jquery.fancybox.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/fancybox/jquery.fancybox.css" media="screen" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/fancybox/helpers/jquery.fancybox-buttons.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/jquery.dataTables.css" />
<script type="text/javascript" 	src="${pageContext.request.contextPath}/resources/fancybox/helpers/jquery.fancybox-buttons.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/fancybox/helpers/jquery.fancybox-thumbs.css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/fancybox/helpers/jquery.fancybox-thumbs.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/fancybox/helpers/jquery.fancybox-media.js"></script>

<script src="${pageContext.request.contextPath}/resources/uikit/uikit.js"></script> 
<script src="${pageContext.request.contextPath}/resources/uikit/sticky.js"></script> 

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
	<script src="${pageContext.request.contextPath}/resources/jquery/jquery.blockUI.js"></script>
	<script src="${pageContext.request.contextPath}/resources/jquery/jquery.dataTables.min.js"></script>

<script src="${pageContext.request.contextPath}/resources/js/adminListUser.js"></script> 
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/menu.css">


<style type="text/css">
		.fancybox-custom .fancybox-skin {
			box-shadow: 0 0 50px #222;
		}
		
.ex_highlight #example tbody tr.even:hover, #example tbody tr.even td.highlighted {
	background-color: #ECFFB3;
}

.ex_highlight #example tbody tr.odd:hover, #example tbody tr.odd td.highlighted {
	background-color: #E6FF99;
}

.ex_highlight_row #example tr.even:hover {
	background-color: #ECFFB3;
}

.ex_highlight_row #example tr.even:hover td.sorting_1 {
	background-color: #DDFF75;
}

.ex_highlight_row #example tr.even:hover td.sorting_2 {
	background-color: #E7FF9E;
}

.ex_highlight_row #example tr.even:hover td.sorting_3 {
	background-color: #E2FF89;
}

.ex_highlight_row #example tr.odd:hover {
	background-color: #E6FF99;
}

.ex_highlight_row #example tr.odd:hover td.sorting_1 {
	background-color: #D6FF5C;
}

.ex_highlight_row #example tr.odd:hover td.sorting_2 {
	background-color: #E0FF84;
}

.ex_highlight_row #example tr.odd:hover td.sorting_3 {
	background-color: #DBFF70;
}

table.display tr.even.row_selected td {
	background-color: #B0BED9;
}

table.display tr.odd.row_selected td {
	background-color: #9FAFD1;
}

	
</style>

</head>
<body>


<script src="${pageContext.request.contextPath}/resources/js/paypal-button.min.js"></script> 

<sec:authorize access="hasRole('ROLE_ADMIN')">
   	<div id="log_btn_div">Hi <sec:authentication property="principal.username" />!!!&nbsp;&nbsp;
       	<a href="${pageContext.request.contextPath}/<c:url value="j_spring_security_logout" />" class="log_btn">Logout</a>
    </div>       
</sec:authorize>
	<div id="logo">
		<a href=${pageContext.request.contextPath}><img alt="MCQ" src="${pageContext.request.contextPath}/resources/images/quizcomm_logo.png"></a> 
	</div>
	<div id="dialog" title="Dialog Title">
		<table id="userInfo"></table>
		<br>
		<button id="activate">Activate</button>
		<button id="dectivate">Deactivate</button>	
		<button id="resetPass">Reset Password</button>		
	</div>
	
	<div class="container">
  	<div class="userList">
  	<table id="userListTable">
  	</table>
  	</div>
  
</div>
<%@ include file="footer.jsp" %>		

</body>
</html>