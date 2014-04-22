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

	<link rel="stylesheet" type="text/css" media="all" href="${pageContext.request.contextPath}/resources/css/styles_myquiz.css">  
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/jquery/jquery-1.10.2.js"></script>  	
	<script src="${pageContext.request.contextPath}/resources/jquery/ui/jquery-ui.js"></script>
	<script src="${pageContext.request.contextPath}/resources/jquery/jquery.editinplace.js"></script>
  	<script src="${pageContext.request.contextPath}/resources/js/profile.js"></script>
  <script>
  $(function() {
    $( "#tabs" ).tabs();
  });  
  </script>
</head>

<body>

<div id="headdiv" class="uk-container uk-container-center uk-margin-top uk-margin-large-bottom">

<%@ include file="header.jsp" %>

	</div>


 <div id="w">
    <div id="content" class="clearfix">
      <div id="tabs">
        <ul id="profile_tabs">
    		<li><a href="#tab-prof">Quiz Creatd by you</a></li>
    		<li><a href="#tab-quizes">Quiz Taken by you</a></li>
  		</ul>
  		
  	 <div id="tab-prof">        
  	 <p class="prof"><span class="caption">Username</span><spanid="userId"> ${user.userId}</span></p>
        <p class="prof"><span class="caption">First Name</span><span class="edit" id="firstName"> ${user.firstName}</span></p>
        <p class="prof"><span class="caption">Last Name</span><span class="edit" id="lastName">${user.lastName}</span></p>
        <p class="prof"><span class="caption">E-mail Address</span><span class="edit" id="email">${user.email}</span></p>
        <p class="prof"><span class="caption">Adress Line 1</span><span class="edit" id="addLine1">${user.addLine1}</span></p>
        <p class="prof"><span class="caption">Adress Line 2</span><span class="edit" id="addLine2">${user.addLine2}</span></p>
        <p class="prof"><span class="caption">City</span><span class="edit" id="city">${user.city}</span></p>
        <p class="prof"><span class="caption">Postal Code</span><span class="edit" id="postalCode">${user.postalCode}</span></p>
        <p class="prof"><span class="caption">Country</span><span class="edit" id="country">${user.country}</span></p>
      </div>
      
      <div id="tab-quizes">
      	<p> list of quizes taken and created </p>  
      </div>
      	
             
      </div> <!-- end of tabs -->    
    </div><!-- @end #content -->
  </div><!-- @end #w -->
</div>


<%@ include file="footer.jsp" %>		
		
</body>

</html>