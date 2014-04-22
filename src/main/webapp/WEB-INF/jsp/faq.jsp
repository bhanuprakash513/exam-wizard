<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html class="uk-notouch" dir="ltr" lang="en-gb">
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>FAQ</title>
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
 .FAQ {
cursor: pointer;
border: 1px solid #CCC;
width: 600px;
margin-top: 10px;
padding: 10px;
color: #8B7777;
}
 .ANS {
display: none;
margin-top: 7px;
font-weight: normal;
font-size: 11pt;
}

div#faq_question {
margin-top: 120px;
font-size: 12pt;
font-weight: bold;
color: rgb(100, 80, 80);
}
</style>
<script type="text/javascript">
function toggle(Info) {
  var CState = document.getElementById(Info);
  CState.style.display = (CState.style.display != 'block')
                       ? 'block' : 'none';
}
</script>
</head>

<body>

<div id="headdiv" class="uk-container uk-container-center uk-margin-top uk-margin-large-bottom">
<%@ include file="header.jsp" %>

	</div>
	
	
		<div id="faq_question">
			<DIV class="FAQ" onclick="toggle('faq1')">
			 1. Users: Getting started
			 <div id="faq1" class="ANS">ClassMarker's web-based tests can be made available to both registered and unregistered users. It's all down to how you Assign (distribute) your test. 

Assigning tests via Groups: This means your registered users will be able to log into ClassMarker.com and take tests as well as review their results at any time. 

Assigning tests via Links: This means that you can send a direct link (URL) to users and/or embed code within your website to have the test appear within one of your website pages. This makes the test available to non-registered users. You can define public or private access with these links.</div>
			</DIV>
			
			<DIV class="FAQ" onclick="toggle('faq2')">
			 2. Do I have to pre-register test takers?
			 <div id="faq2" class="ANS">No. ClassMarker's web-based tests can be made available to both registered and unregistered users. It's all down to how you Assign your test. 

Assigning tests via Groups: This means your registered users will be able to log into ClassMarker and take tests as well as review their results at any time. 

Assigning tests via Links: This means that you can send a direct link (URL) to anyone and/or embed code within your website to have the test appear within one of your website pages. This makes the test available to non-registered users. You can provide public or private access to these links.</div>
			</DIV>
			
			<DIV class="FAQ" onclick="toggle('faq3')">
			 3. How do I delete Groups or Links?
			 <div id="faq3" class="ANS">To delete a Group:
Go to the Groups section, expand the Group you would like to delete and select 'Members'.
Select the 'Delete Options' link
Choose which option you require, enter your username and password and select Delete now.
Remember: Delete actions are permanent so please ensure you are certain you want to delete the results and the group.

To delete a Link:
Delete any results associated with this group first.
Go to the Links section, expand the Link you would like to delete and select 'Settings'.
Select the 'Delete Link' option.
As long as there are no results associated with this group you can delete it.</div>
			</DIV>
			<DIV class="FAQ" onclick="toggle('faq4')">
			 4. How many users can take my tests?
			 <div id="faq4" class="ANS">There is no limit to how many users can take your tests.

Tests that have been assigned via Link are for non-registered users. (You can implement public or private options for tests that have been assigned via Link.)

Tests can also be assigned to Groups where you can pre-register your users who will login via the ClassMarker homepage to take your online tests you have assigned to their Group.</div>
			</DIV>
						<DIV class="FAQ" onclick="toggle('faq5')">
			 5. Do my users need their own email addresses?
			 <div id="faq5" class="ANS">No, users can take your online quizzes without registering an email address.</div>
			</DIV>
						
						<DIV class="FAQ" onclick="toggle('faq6')">
			6. Can I import a batch of users?
			 <div id="faq6" class="ANS">To import users for Groups:
Go to the Groups section.
Create a new Group.
Expand the 'Add users' section.
Copy/paste a batch of users here, ensuring the format is first name, last name, email OR last name, first name, email. Each user must be on a new line.
If you want to give users access to tests assigned via Link, you can limit who can take the test by creating an Access list.
Go to the Links > Access List section.
Create a new Access list.
Enter the unique identifiers as per the instructions. Make sure to identify what format you're providing the data in (ie, one item per line, comma separated, etc).</div>
			</DIV>
		</div>
</div>


	<div id="social_network">
			<div id="facebook">
				<div id="fb-root"></div>
				<script>(function(d, s, id) {
				  var js, fjs = d.getElementsByTagName(s)[0];
				  if (d.getElementById(id)) return;
				  js = d.createElement(s); js.id = id;
				  js.src = "//connect.facebook.net/en_US/all.js#xfbml=1";
				  fjs.parentNode.insertBefore(js, fjs);
				}(document, 'script', 'facebook-jssdk'));</script>
				
				<div class="fb-like" data-href="https://developers.facebook.com/docs/plugins/" data-layout="standard" data-action="like" data-show-faces="true" data-share="true"></div>
							
			</div>
			<div id="twitter">
				<a href="https://twitter.com/share" class="twitter-share-button" data-lang="en">Tweet</a>
				<script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0];if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src="https://platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs");</script>
			</div>
			<div id="googleShare">
				<script src="https://apis.google.com/js/plusone.js"></script>
				<g:plus action="share"></g:plus>
			</div>
		
		</div>

<%@ include file="footer.jsp" %>		
		
</body>

</html>