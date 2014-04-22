<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html class="uk-notouch" dir="ltr" lang="en-gb">
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Create Quiz</title>



	

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
	

<script src="${pageContext.request.contextPath}/resources/js/quiz.js"></script> 

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/uikit/uikit.css">

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/menu.css">


<style type="text/css">
		

#quiz_complete_title {
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

		<div class="uk-grid" class="data-uk-grid-margin">
		<div class="uk-width-medium-1-4">
		<a href="javascript:showQuestionDialogBox();" class="question_btn">Multiple Choice Questions</a>
		<a href="javascript:showQuestionDialogBox();" class="question_btn">Checkbox Questions</a>
		</div>
			<div class="uk-width-medium-3-4">
				<input type="hidden" name="quiz_id" id="quiz_id">
				<table class="uk-table">
					<tbody>
						<tr>
							<td>Title</td>
							<td><input type="text" name="title" id="create_quiz_title" size=100></td>
						</tr>
						<tr>
							<td>Type</td>
							<td><input type="text" name="type" id="create_quiz_type" size=100></td>
						</tr>
						
					</tbody>
				</table>
				

				

				<div id="question_details_content">
					
				</div>

				<button id="save_quiz">Save</button>
				<button id="complete_quiz">Complete</button>
				<button id="cancel_quiz">Cancel</button>
				
				
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
			        <div> <textarea rows="3" cols="69" id="chk_question_title" name="chk_question_title" class="chk_question_title_style"></textarea> </div>
			        <div id="check_box_question_set">
				       		<legend>Answers</legend>
					        	<table>
				       			<tr>	
				       				<td>
				       					<input type="checkbox" id="chk_answer_correct_1" name="chk_answer_correct_1"> 
				       				</td>
				       				<td>
				       					<textarea rows="1" cols="66" id="chk_answer_text_1" name="chk_answer_text_1"></textarea>
				       				</td>
				       			</tr>
				       			<tr>	
				       				<td>
				       					<input type="checkbox" id="chk_answer_correct_2" name="chk_answer_correct_2"> 
				       				</td>
				       				<td>
				       					<textarea rows="1" cols="66" id="chk_answer_text_2" name="chk_answer_text_2"></textarea>
				       				</td>
				       			</tr>
				       			<tr>	
				       				<td>
				       					<input type="checkbox" id="chk_answer_correct_3" name="chk_answer_correct_3"> 
				       				</td>
				       				<td>
				       					<textarea rows="1" cols="66" id="chk_answer_text_3" name="chk_answer_text_3"></textarea>
				       				</td>
				       			</tr>
				       			<tr>	
				       				<td>
				       					<input type="checkbox" id="chk_answer_correct_4" name="chk_answer_correct_4"> 
				       				</td>
				       				<td>
				       					<textarea rows="1" cols="66" id="chk_answer_text_4" name="chk_answer_text_4"></textarea>
				       				</td>
				       			</tr>
				       			<tr>	
				       				<td>
				       					<input type="checkbox" id="chk_answer_correct_5" name="chk_answer_correct_5"> 
				       				</td>
				       				<td>
				       					<textarea rows="1" cols="66" id="chk_answer_text_5" name="chk_answer_text_5"></textarea>
				       				</td>
				       			</tr>
				       		</table>
					 </div>
					 <!--  
					 <div class="uk-form-row">
			        	<button id="add_more_check_box_question" class="uk-button"> Add </button> 
			        	<button id="save_check_box_question" class="uk-button"> Save </button> 
					</div>
					-->
					
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
			        <div> <textarea rows="3" cols="69" id="edit_chk_question_title" name="edit_chk_question_title"></textarea> </div>
			        <div id="edit_check_box_question_set">
				       		<legend>Answers</legend>
				       		<table>
						        <tr>	
				       				<td>
						        		<input type="checkbox" id="edit_chk_answer_correct_1" name="edit_chk_answer_correct_1"> 
						        	</td>
						        	<td>
										<textarea rows="1" cols="66" id="edit_chk_answer_text_1" name="edit_chk_answer_text_1"></textarea>
									</td>
								</tr>
								
								  <tr>	
				       				<td>
						        		<input type="checkbox" id="edit_chk_answer_correct_2" name="edit_chk_answer_correct_2"> 
						        	</td>
						        	<td>
										<textarea rows="1" cols="66" id="edit_chk_answer_text_2" name="edit_chk_answer_text_2"></textarea>
									</td>
								</tr>
								 <tr>	
				       				<td>
						        		<input type="checkbox" id="edit_chk_answer_correct_3" name="edit_chk_answer_correct_3"> 
						        	</td>
						        	<td>
										<textarea rows="1" cols="66" id="edit_chk_answer_text_3" name="edit_chk_answer_text_3"></textarea>
									</td>
								</tr>
								
								 <tr>	
				       				<td>
						        		<input type="checkbox" id="edit_chk_answer_correct_4" name="edit_chk_answer_correct_4"> 
						        	</td>
						        	<td>
										<textarea rows="1" cols="66" id="edit_chk_answer_text_4" name="edit_chk_answer_text_4"></textarea>
									</td>
								</tr>
								<tr>
									<td>
						        		<input type="checkbox" id="edit_chk_answer_correct_5" name="edit_chk_answer_correct_5">
						        	</td>
						        	<td> 
										<textarea rows="1" cols="66" id="edit_chk_answer_text_5" name="edit_chk_answer_text_5"></textarea>
									</td>
								</tr>
							</table>
					 </div>
					
			    </fieldset>
		</form>
	</div>
	
	
	<!-- <div style="display: none"> -->
<div id="quiz_complete_dialog" title="Quiz Complete">
		<form id="complete_quiz" onsubmit="return false;" >
				
					  <input type="hidden" name="quiz_complete" id="quiz_complete">
					 
					  <div id="quiz_complete_title"></div>
					 
			   
		</form>
	</div>
<%@ include file="footer.jsp" %>		

</body>

</html>