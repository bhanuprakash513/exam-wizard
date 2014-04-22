<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

	

<script type="text/javascript" src="${pageContext.request.contextPath}/resources/jquery/jquery-1.10.1.min.js"></script>

<script type="text/javascript"src="${pageContext.request.contextPath}/resources/jquery/jquery.mousewheel-3.0.6.pack.js"></script>
<script type="text/javascript"src="${pageContext.request.contextPath}/resources/fancybox/jquery.fancybox.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/fancybox/jquery.fancybox.css" media="screen" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/fancybox/helpers/jquery.fancybox-buttons.css" />
<script type="text/javascript" 	src="${pageContext.request.contextPath}/resources/fancybox/helpers/jquery.fancybox-buttons.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/fancybox/helpers/jquery.fancybox-thumbs.css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/fancybox/helpers/jquery.fancybox-thumbs.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/fancybox/helpers/jquery.fancybox-media.js"></script>

<script>

$("#add_chk_box_question").fancybox({
	'scrolling' : 'auto',
	'titleShow' : false,
	'autoScale' : 'true',
	'onClosed' : function() {
	}
});

</script> 


<style type="text/css">
		.fancybox-custom .fancybox-skin {
			box-shadow: 0 0 50px #222;
		}
</style>

</head>

<body>

	<div
		class="uk-container uk-container-center uk-margin-top uk-margin-large-bottom">

		<nav class="uk-navbar uk-margin-large-bottom">
			<a class="uk-navbar-brand uk-hidden-small"
				href="http://getuikit.com/docs/layouts_frontpage.html">Brand</a>
			<ul class="uk-navbar-nav uk-hidden-small">
				<li><a href="/home">Home</a></li>
				<li><a href="/user/profile">Profile</a></li>
				<li><a href="/myquiz">My Quiz</a></li>
				<li><a href="/quiz/createQuiz">Create Quiz</a></li>
				<li><a href="/logout">Logout</a></li>
			</ul>
			<a href="#offcanvas" class="uk-navbar-toggle uk-visible-small"
				data-uk-offcanvas=""></a>
			<div class="uk-navbar-brand uk-navbar-center uk-visible-small">Brand</div>
		</nav>



		<div class="uk-grid" data-uk-grid-margin="">
			<div class="uk-width-medium-3-4">
				<h3>Create Quiz</h3>
				<input type="hidden" name="quiz_id" id="quiz_id">
				<table class="uk-table">
					<tbody>
						<tr>
							<td><code>Title</code></td>
							<td><input type="text" name="title" id="create_quiz_title"></td>
						</tr>
						<tr>
							<td><code>Type</code></td>
							<td><input type="text" name="type" id="create_quiz_type"></td>
						</tr>
						<tr>
							<td>
							    <code>
									<button id="create_quiz_submit">Create</button>
								</code>
							</td>
						</tr>
					</tbody>
				</table>
				
				

				<p class="h">
					<span>5.</span> Display question form <a id="add_chk_box_question" title="Add Question" href="#check_box_question_form">Try now</a>
				<p>

				<div class="uk-width-large-1-2" id="question_details_content">
					
				</div>


				<div class="uk-width-medium-1-4">

					<div style="height: 270px;" class="uk-sticky" id="sticky-s7261">
						<div style="" class="uk-panel uk-panel-box"
							data-uk-sticky="{top:35}">
							<ul class="uk-nav uk-nav-side"
								data-uk-scrollspy-nav="{closest:'li', smoothscroll:true}">
								<li class="uk-nav-header">Quiz Details</li>
							</ul>
						</div>
					</div>

				</div>
			</div>
		</div>

	</div>



	<!--  Question forms -->
	<div style="display: none">
		<form id="check_box_question_form" onsubmit="return false;" >
		
				<fieldset>
			        <legend>Question Title</legend>
			        <div class="uk-form-row"> <textarea rows="5" cols="10" id="question_title" name="question_title"></textarea> </div>
			        <div id="check_box_question_set">
				       		<legend>Answers</legend>
					        <div class="uk-form-row">
					        	<input type="checkbox" id="chk_answer_correct_1" name="chk_answer_correct_1"> 
								<textarea rows="1" cols="75" id="chk_answer_text_1" name="chk_answer_text_1" class="uk-form-width-large"></textarea>
							</div>
							 <div class="uk-form-row">
					        	<input type="checkbox" id="chk_answer_correct_2" name="chk_answer_correct_2"> 
								<textarea rows="1" cols="75" id="chk_answer_text_2" name="chk_answer_text_2" class="uk-form-width-medium"></textarea>
							</div>
							 <div class="uk-form-row">
					        	<input type="checkbox" id="chk_answer_correct_3" name="chk_answer_correct_3"> 
								<textarea rows="1" cols="75" id="chk_answer_text_3" name="chk_answer_text_3" class="uk-form-width-medium"></textarea>
							</div>
							 <div class="uk-form-row">
					        	<input type="checkbox" id="chk_answer_correct_4" name="chk_answer_correct_4"> 
								<textarea rows="1" cols="75" id="chk_answer_text_4" name="chk_answer_text_4" class="uk-form-width-medium"></textarea>
							</div>
							<div class="uk-form-row">
					        	<input type="checkbox" id="chk_answer_correct_5" name="chk_answer_correct_5"> 
								<textarea rows="1" cols="75" id="chk_answer_text_5" name="chk_answer_text_5" class="uk-form-width-medium"></textarea>
							</div>
					 </div>
					 <div class="uk-form-row">
			        	<button id="add_more_check_box_question" class="uk-button"> Add </button> 
			        	<button id="save_check_box_question" class="uk-button"> Save </button> 
					</div>
					
			    </fieldset>
		</form>
	</div>

	


</body>

</html>