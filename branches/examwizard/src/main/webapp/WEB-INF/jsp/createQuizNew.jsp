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
	

<script src="${pageContext.request.contextPath}/resources/js/quiz.js"></script> 

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/menu.css">

<style type="text/css">
		.fancybox-custom .fancybox-skin {
			box-shadow: 0 0 50px #222;
		}
</style>


<style>

#quiz_title {
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

#chk_question_title{
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
font-size: 14pt;
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

		<div class="uk-grid" class="data-uk-grid-margin">
		<div class="uk-width-medium-1-4">
		<a href="javascript:showQuestionDialogBox();" class="question_btn">Multiple Choice Questions</a>
		<a href="javascript:showQuestionDialogBox();" class="question_btn">Checkbox Questions</a>
		</div>
			<div class="uk-width-medium-3-4">
				<input type="hidden" name="quiz_id" id="quiz_id">
				
				<a href="javascript:showTitleDialogBox()"><div id="quiz_title">Click to enter the Title</div></a>
				<a href="javascript:showTypeDialogBox()"><div id="quiz_type">Click to select the Type</div></a>
				<button id="save_quiz">Save</button>
				<button id="complete_quiz">Complete</button>
				<button id="cancel_quiz">Cancel</button>
				
				

				<div id="question_details_content">
					
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
	<!-- <div style="display: none"> -->
	<div id="check_box_question_form_content" title="Create Question">
		<form id="check_box_question_form" onsubmit="return false;" >
				<fieldset>
			        <legend>Question Title</legend>
			        <input type="hidden" name="check_question_id" id="check_question_id">
			        <input type="hidden" name="check_operation_type" id="check_operation_type">
			        <div > <textarea rows="3" cols="69" id="chk_question_title" name="chk_question_title"></textarea> </div>
			        <div id="check_box_question_set">
				       		<legend>Answers</legend>
					        <div class="check_question_options">
					        	<input type="checkbox" id="chk_answer_correct_1" name="chk_answer_correct_1"> 
								<textarea rows="1" cols="66" id="chk_answer_text_1" name="chk_answer_text_1"></textarea>
							</div>
					        <div class="check_question_options">
					        	<input type="checkbox" id="chk_answer_correct_2" name="chk_answer_correct_2"> 
								<textarea rows="1" cols="66" id="chk_answer_text_2" name="chk_answer_text_2"></textarea>
							</div>
					        <div class="check_question_options">
					        	<input type="checkbox" id="chk_answer_correct_3" name="chk_answer_correct_3"> 
								<textarea rows="1" cols="66" id="chk_answer_text_3" name="chk_answer_text_3"></textarea>
							</div>
					        <div class="check_question_options">
					        	<input type="checkbox" id="chk_answer_correct_4" name="chk_answer_correct_4"> 
								<textarea rows="1" cols="66" id="chk_answer_text_4" name="chk_answer_text_4"></textarea>
							</div>
					        <div class="check_question_options">
					        	<input type="checkbox" id="chk_answer_correct_5" name="chk_answer_correct_5"> 
								<textarea rows="1" cols="66" id="chk_answer_text_5" name="chk_answer_text_5"></textarea>
							</div>
					 </div>
			    </fieldset>
		</form>
	</div>
	 
	<!-- <div style="display: none"> -->
<div id="edit_check_box_question_form_content" title="Edit Question">
		<form id="edit_check_box_question_form" onsubmit="return false;" >
				<fieldset>
			        <legend>Question Title</legend>
			        <input type="hidden" name="edit_check_question_id" id="edit_check_question_id">
			        <input type="hidden" name="edit_check_operation_type" id="edit_check_operation_type">
			        <div class="uk-form-row"> <textarea rows="5" cols="10" id="edit_chk_question_title" name="edit_chk_question_title"></textarea> </div>
			        <div id="edit_check_box_question_set">
				       		<legend>Answers</legend>
					        <div class="uk-form-row">
					        	<input type="checkbox" id="edit_chk_answer_correct_1" name="edit_chk_answer_correct_1"> 
								<textarea rows="1" cols="75" id="edit_chk_answer_text_1" name="edit_chk_answer_text_1"></textarea>
							</div>
							 <div class="uk-form-row">
					        	<input type="checkbox" id="edit_chk_answer_correct_2" name="edit_chk_answer_correct_2"> 
								<textarea rows="1" cols="75" id="edit_chk_answer_text_2" name="edit_chk_answer_text_2"></textarea>
							</div>
							 <div class="uk-form-row">
					        	<input type="checkbox" id="edit_chk_answer_correct_3" name="edit_chk_answer_correct_3"> 
								<textarea rows="1" cols="75" id="edit_chk_answer_text_3" name="edit_chk_answer_text_3"></textarea>
							</div>
							 <div class="uk-form-row">
					        	<input type="checkbox" id="edit_chk_answer_correct_4" name="edit_chk_answer_correct_4"> 
								<textarea rows="1" cols="75" id="edit_chk_answer_text_4" name="edit_chk_answer_text_4"></textarea>
							</div>
							<div class="uk-form-row">
					        	<input type="checkbox" id="edit_chk_answer_correct_5" name="edit_chk_answer_correct_5"> 
								<textarea rows="1" cols="75" id="edit_chk_answer_text_5" name="edit_chk_answer_text_5"></textarea>
							</div>
					 </div>
					
			    </fieldset>
		</form>
	</div>
	
	
	
	
		<!--  Title forms -->
	<div id="title_form_content" title="Enter the Title">
		<form id="title_form" onsubmit="return false;" >
				<fieldset>
			        <legend>Enter the Quiz Title</legend>
					<div > <textarea rows="3" cols="69" id="title_content" name="title_content"></textarea> </div>
					
			    </fieldset>
		</form>
	</div>
	
	
	
			<!--  Type forms -->
	<div id="type_form_content" title="Select the Type">
		<form id="type_form" onsubmit="return false;" >
				<fieldset>
			        <legend>Select the Type</legend>
					<div > <textarea rows="3" cols="69" id="type_content" name="type_content"></textarea> </div>
					
			    </fieldset>
		</form>
	</div>
	
	
	<!-- <div style="display: none"> -->
<div id="quiz_complete_dialog" title="Quiz Complete">
		<form id="complete_quiz" onsubmit="return false;" >
				
					  <input type="hidden" name="quiz_complete" id="quiz_complete">
					  <div id="quiz_complete_title"></div>
					  <div id="quiz_type"></div>
			   
		</form>
	</div>
<%@ include file="footer.jsp" %>		

</body>

</html>