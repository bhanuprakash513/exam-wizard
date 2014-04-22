<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html class="uk-notouch" dir="ltr" lang="en-gb">
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Create Quiz</title>
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
	


<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/menu.css">

<style type="text/css">
		.fancybox-custom .fancybox-skin {
			box-shadow: 0 0 50px #222;
		}
</style>


<style type="text/css">
#contact {
width: 430px;
background: #FFFFFF;
border: 1px solid #363636;
-moz-box-shadow: 0px 0px 8px #444;
-webkit-box-shadow: 0px 0px 8px #000;
margin: 0 auto;
margin-top: 120px;
}

h1 {
font-size: 35px;
color: #505050;
text-transform: uppercase;
text-align: center;
margin: 0 0 35px 0;
text-shadow: 0px 1px 0px #292727;
font-weight: bold;
}
label {
float: left;
clear: left;
margin: 11px 20px 0 0;
width: 95px;
text-align: right;
font-size: 16px;
color: #353535;
text-transform: uppercase;
text-shadow: 0px 1px 0px #424242;
font-weight: bold;
}

input {
width: 260px;
height: 35px;
padding: 5px 20px 0px 20px;
margin: 0 0 20px 0;
background: rgb(243, 242, 242);
border-radius: 5px;
-moz-border-radius: 5px;
-webkit-border-radius: 5px;
-moz-box-shadow: 0px 1px 0px #f2f2f2;
-webkit-box-shadow: 0px 1px 0px #E0DCDC;
font-family: sans-serif;
font-size: 14px;
color: #3A3939;
text-transform: uppercase;
text-shadow: 0px -1px 0px #7C7C7C;
}


textarea {
width: 260px;
height: 170px;
padding: 12px 20px 0px 20px;
margin: 0 0 20px 0;
background: rgb(243, 242, 242);
border-radius: 5px;
-moz-border-radius: 5px;
-webkit-border-radius: 5px;
-moz-box-shadow: 0px 1px 0px #f2f2f2;
-webkit-box-shadow: 0px 1px 0px #f2f2f2;
font-family: sans-serif;
font-size: 14px;
color: #3A3939;
text-transform: uppercase;
text-shadow: 0px -1px 0px #7C7C7C;
}	

input:focus, textarea:focus {
background: #FFFFFF;
background: -moz-linear-gradient(top, #668099 0%, #728eaa 20%);
background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#CAC8C8), color-stop(20%,#FFFFFF));
color: rgb(255, 224, 224);
color: rgb(80, 70, 70);
}

input[type=submit] {
width: 185px;
height: 52px;
float: right;
margin: 0 105px 0 0;
-webkit-box-shadow: 0px 0px 5px #999;
border: 1px solid #556f8c;
background: rgb(243, 242, 242);
cursor: pointer;
font-size: 14pt;
</style>
<script type="text/javascript">
function toggle(Info) {
  var CState = document.getElementById(Info);
  CState.style.display = (CState.style.display != 'block')
                       ? 'block' : 'none';
}

div.successMsg {
	margin-bottom: 2%;
	font-size: 11pt;
	margin-left: 2%;
	color: rgb(151, 51, 243);
	font-weight: bold;
	}
</script>
</head>

<body>

<div id="headdiv" class="uk-container uk-container-center uk-margin-top uk-margin-large-bottom">
<%@ include file="header.jsp" %>

	</div>
	
	
		<div id="contact">
			<h1>Send an email</h1>
			<form action="${pageContext.request.contextPath}/triggerEmail" method="post">
				<fieldset>
					<label for="name">Name:</label>
					<input type="text" id="name"  name="name" placeholder="Enter your full name" />
					
					<label for="email">Email:</label>
					<input type="email" id="email"  name="email"  placeholder="Enter your email address" />
					
					<label for="message">Message:</label>
					<textarea id="message"  name="message"  placeholder="What's on your mind?"></textarea>
					
					<input type="submit" value="Send message" />
					
				</fieldset>
			</form>
			<c:if test="${not empty mailsent}">
				<div class="successMsg">
					Thanks for contacting. Your comments are valuable for us!!!
				</div>
			</c:if>
		</div>
</div>

<%@ include file="footer.jsp" %>		

		
</body>

</html>