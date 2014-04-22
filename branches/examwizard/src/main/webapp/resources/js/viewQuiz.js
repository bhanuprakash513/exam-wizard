var quiz = {};
var questions = [];
var questionCount = 0;


pageLoadFunctions();

function pageLoadFunctions(){
	$(function() {
		
		
		
		 $.ajax({
			    contentType: 'application/json',
			    //data:JSON.stringify(jsonQuizObject),
			    dataType: 'json',
			    success: function(data){
			    	updateUI(data);
			    },
			    error: function(){
			 
			    },
			    processData: false,
			    type: 'POST',
			    url: '../loadQuizView/' + $('#quizId').val() + '.json'
			});
		
			
		
		
	});
}






function updateUI(quizDataWrapper){
	questionData = quizDataWrapper.quiz;
		//quiz = quizData;
	if(questionData!=null){
		 quiz = questionData;
		 $('#create_quiz_title').html(questionData.title);
		// $('#create_quiz_type').val(questionData.type);
		 //$('#quiz_id').val(questionData.id);
		 questionCount = questionData.questions.length;
		 
		 var questionContent = "";
		 
		 if(questionCount>0){
			 var qNum = 0;
			 questionData.questions.forEach(function(question) {
				 var qId = question.questionId;
				 qNum++;
				
				 questionContent += '<div id="created_question_container_' + qId + '" >';
				 questionContent += '<form id="created_question_form_'+ qId + '" onsubmit="return false;" >';
				 questionContent += '<input type="hidden" name="question_id_' + qId + '" id="chk_question_id_'+ qId +'" value="'+qId+'">';
				 questionContent += '<input type="hidden" name="question_type_' + qId + '" id="chk_question_type_'+ qId +'" value="'+question.type+'">';
				 //questionContent += '<fieldset>';
				 //questionContent += '<legend>Question Title</legend>';
				 questionContent += '<div><table><tr><td>' +qNum+ '.</td><td> <textarea disabled rows="1" cols="75" id="chk_question_title_'+ qId +'" name="chk_question_title_'+ qId +'">'+ question.title +'</textarea> </td></tr></table></div>';
				 questionContent += '<div id="check_box_question_set_'+ qId +'">';
				 questionContent += '<legend>Answers</legend> <table>';
				
				 question.answers.forEach(function(answer) {
					 questionContent += '<tr><td>';
					 if(question.type=='single'){
						 questionContent +=	'<input disbaled type="radio" id="chk_answer_correct_'+ answer.id +'" name="chk_answer_correct_'+ answer.id +'"';
					 }else{
						 questionContent +=	'<input disabled type="checkbox" id="chk_answer_correct_'+ answer.id +'" name="chk_answer_correct_'+ answer.id +'"';
					 }
					 
					 if(answer.correct){
						 questionContent += ' checked';
					 }
					 
					 questionContent += '></td>';
					 questionContent +=	'<td><textarea disabled rows="1" cols="75" id="chk_answer_text_'+ answer.id +'" name="chk_answer_text_'+ answer.id +'" class="uk-form-width-large">'+answer.title+'</textarea>';
					 questionContent += '</td>';
				 });
				
				    
				 questionContent += '</table>';
				 
				    
				 questionContent +=  '</div>';
				// questionContent += '</fieldset>';
				 questionContent += '</form>';
				 questionContent += '</div> <br/>';
			 });
			 
		 }
		 
		 $('#question_details_content').html(questionContent);
		 
		 
	}
	
}

