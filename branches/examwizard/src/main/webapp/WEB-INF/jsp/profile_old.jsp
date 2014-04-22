<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en-US">
<head>
  	<meta charset="utf-8">
  	<meta http-equiv="Content-Type" content="text/html">
  	<title>User Profile</title>
  	<link rel="icon" href="${pageContext.request.contextPath}/favicon.ico">  
  	<link rel="stylesheet" type="text/css" media="all" href="${pageContext.request.contextPath}/resources/css/styles_profile.css">  
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
  <div id="topbar">
  <p id="error"></p>
  </div>
  
    <div id="w">
    <div id="content" class="clearfix">
      <div id="userphoto"><img src="${pageContext.request.contextPath}/resources/images/avatar.png" alt="default avatar"></div>
      <h1>${user.firstName} &nbsp; ${user.lastName}</h1>

      <div id="tabs">
        <ul>
    		<li><a href="#tab-prof">profile</a></li>
    		<li><a href="#tab-quizes">Stats</a></li>
    		<li><a href="#tab-activities">Activities</a></li>
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
      	
      <div id="tab-activities">
        <p  class="activity_heading">Most recently taken quiz:</p>        
        <p class="activity">@10:15PM - Submitted a news article</p>        
        <p class="activity">@9:50PM - Submitted a news article</p>        
        <p class="activity">@8:15PM - Posted a comment</p>        
        <p class="activity">@4:30PM - Added <strong>someusername</strong> as a friend</p>        
        <p class="activity">@12:30PM - Submitted a news article</p>		
		<br>		
		<p  class="activity_heading">Most recently created quiz:</p>        
        <p class="activity">@10:15PM - Submitted a news article</p>        
        <p class="activity">@9:50PM - Submitted a news article</p>        
        <p class="activity">@8:15PM - Posted a comment</p>        
        <p class="activity">@4:30PM - Added <strong>someusername</strong> as a friend</p>        
        <p class="activity">@12:30PM - Submitted a news article</p>
      </div>
             
      </div> <!-- end of tabs -->    
    </div><!-- @end #content -->
  </div><!-- @end #w -->
</body>
</html>