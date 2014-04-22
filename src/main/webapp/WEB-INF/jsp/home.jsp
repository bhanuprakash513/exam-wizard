<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html class="uk-notouch" dir="ltr" lang="en-gb">
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>QuizComm</title>
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
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/home.css">

<style type="text/css">
		.fancybox-custom .fancybox-skin {
			box-shadow: 0 0 50px #222;
		}
</style>


</head>

<body>

<div id="headdiv" class="uk-container uk-container-center uk-margin-top uk-margin-large-bottom">
<%@ include file="header.jsp" %>
	</div>
	
	<div>
		<form id="searchForm" action="${pageContext.request.contextPath}/">
			<input type="text" name="term" id="term" placeholder="Enter the keyword to search">
			 <input type="submit" id="search_btn" value="Search">
		</form>
		<div id="quizList">
			<table id="gradient-style" summary="Meeting Results">
			    <thead>
			    	<tr>
			        	<th scope="col">Quiz Title</th>
			            <th scope="col">Quiz Type</th>
			            <th scope="col">Created By</th>
			            <th scope="col">Created On</th>
			        </tr>
			    </thead>
			    <tbody>
			    	<c:if test="${quizList!=null && quizList.size()>0}">
						<c:forEach items="${quizList}" var="quiz">
							<tr>
								<td><a href="${pageContext.request.contextPath}/quiz/viewTest/${quiz.id}">${quiz.title}</a><br></td>
					            <td>${quiz.type}</td>
					            <td>${quiz.owner.userId}</td>
					            <td>${quiz.createdDate.time}</td>
				  	  		</tr>
						</c:forEach>
					</c:if>
			    </tbody>
			</table>
					<!--  Pagination  -->
			<div id="pagination">
				<div id="page_next">
					<c:if test="${prev}">
						<a  class="next_page" href="${pageContext.request.contextPath}/?term=${term}&page=${prevPage}">Prev</a>
					</c:if>
				</div>
			
				<div  id="page_prev">
					<c:if test="${next}">
						<a  class="next_page" href="${pageContext.request.contextPath}/?term=${term}&page=${nextPage}">Next</a>
					</c:if>
				</div>
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
		
	<div class="howitwork">
		<div id="howitworks">How it works?</div>
		<div class="create_a_quiz">
			<div class="circle">1</div>
				<h4 class="heading_howtowork">Create A Quiz</h4>
				<div class="Qdesc-pad" style="">
					<ul>
						<li>Make tests, exams &amp; quizzes</li>
						<li>Over 6 types of quiz questions</li>
						<li>Add videos, images &amp; media</li>
						<li>Brand with your logo/colors</li>
						<li>Security options</li>
					</ul>
				</div>
				<br>
				<div class="image_create" style="">
				</div>
			</div>
		<div class="share_a_quiz">
			<div class="circle">2</div>
			<h4 class="heading_howtowork">Share Your Quiz</h4>
			<div class="Qdesc-pad" style="">
				<ul>
					<li>Share on Facebook/Twitter</li>
					<li>Embed on your website</li>
					<li>Post on blogs</li>
					<li>Link to your quiz</li>
					<li>Email / Print Quizzes</li>
				</ul>
			</div>
			<br>
			<div class="image_share">
			</div>
		</div>
		<div class="analyis_result">
			<div class="circle">3</div>
			<h4 class="heading_howtowork">Analyze Results</h4>
			<div class="Qdesc-pad">
				<ul>
					<li>Quiz Stats &amp; Reports</li>
					<li>Instant grading</li>
					<li>Download result</li>
					<li>Track quiz takers</li>
					<li>Issue certificates</li>
				</ul>
			</div>
			<br>
			<div class="image_analyze">
			</div>
		</div>
	</div>
	
	
	</div>
	
	
</div>

<%@ include file="footer.jsp" %>		
</body>

</html>