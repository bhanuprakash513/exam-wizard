var quiz = {};
var questions = [];
var questionCount = 0;
var contextPath = "%=request.getContextPath()%>";


pageLoadFunctions();

function pageLoadFunctions(){
	$(function() {
		 questionCount = 0;
		
		 quiz = {
				"title":$('#create_quiz_title').val(),
				"type":$('#create_quiz_type').val(),
				"id":$('#quiz_id').val(),
				"questions":[]
			 };
		 
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
			    url: '../getTestQuiz/' + $('#quizId').val() + '.json'
			});
		 
		 
		 $("#complete").click(function(){
			 completeQuiz();
		 });
		
		
	});
}





function updateUI(quizDataWrapper){
	quizData = quizDataWrapper.quiz;
	quiz = quizData;
	//console.log(quizData);
	//console.log(quizData.title);
	//console.log(quizData.questions);
	
	if(quizData!=null){
		 //quiz = quizData;
		 $('#create_quiz_title').html(quizData.title);
		 $('#create_quiz_type').val(quizData.type);
		 $('#quiz_id').val(quizData.id);
		 questionCount = quizData.questions.length;
		 
		 var questionContent = "";
		 
		 if(questionCount>0){
			 var idx = 0;
			 quizData.questions.forEach(function(question) {
				 idx++;
				 var qId = question.questionId;
				
				 questionContent += '<div id="created_question_container_' + qId + '" >';
				 questionContent += '<form id="created_question_form_'+ qId + '" onsubmit="return false;" >';
				 questionContent += '<input type="hidden" name="question_id_' + qId + '" id="chk_question_id_'+ qId +'" value="'+qId+'">';
				 questionContent += '<input type="hidden" name="question_type_' + qId + '" id="chk_question_type_'+ qId +'" value="'+question.type+'">';
				 questionContent += '<fieldset>';
				 questionContent += '<legend>'+idx+'</legend>';
				 questionContent += '<div> <textarea disabled rows="2" cols="75" id="chk_question_title_'+ qId +'" name="chk_question_title_'+ qId +'">'+ question.title +'</textarea> </div>';
				 questionContent += '<div id="check_box_question_set_'+ qId +'">';
				// questionContent += '<legend>Answers</legend>';
				
				 questionContent += '<table>';
				 question.answers.forEach(function(answer) {
					 questionContent += '<tr><td>';
					 if(question.type=='single'){
						 questionContent +=	'<input type="radio" id="chk_answer_correct_'+ answer.id +'" name="chk_answer_correct_'+ answer.id +'"';
					 }else{
						 questionContent +=	'<input type="checkbox" id="chk_answer_correct_'+ answer.id +'" name="chk_answer_correct_'+ answer.id +'"';
					 }
					 
					 if(answer.correct){
						// questionContent += ' checked';
					 }
					 
					 questionContent += '></td><td>';
					 questionContent +=	'<textarea disabled rows="1" cols="66" id="chk_answer_text_'+ answer.id +'" name="chk_answer_text_'+ answer.id +'">'+answer.title+'</textarea>';
					 questionContent += '</td></tr>';
				 });
				
				    
				 questionContent += '</table>';
				    
				 questionContent +=  '</div>';
				 questionContent += '</fieldset>';
				 questionContent += '</form>';
				 questionContent += '</div>';
			 });
			 
		 }
		 
		 $('#question_details_content').html(questionContent);
		 
	}
	
}

function completeQuiz(){
	var questions = [];
	$('#question_details_content form').each(
		    function(index){ 
		    	 var input = $(this);
			     var id = input.attr("id");
			
			     var q_number = id.split("_")[3];
			     

		    	 var question = {
		 			 	"answers":[],
		 			 	"questionId":q_number
		 			 };
		    	
		     
		    	$('#'+id+' input:checkbox').each(function(answerIdx){
		    		var c_input = $(this);
		    		var c_id  = c_input.attr("id");
		    		var c_num = c_id.split("_")[3];
		    		var answer = {
				        		"id" : c_num,
				        		"userAnswer":c_input.is(":checked")
				        };
		    		
		    		question.answers.push(answer);
		    		
		    	});
		    	
		    	 
		        
		        
		    	questions.push(question);
		        
		      
		       
		    }
		);
	
	 completedQuiz = {
				"id":$('#quizId').val(),
				"questions":questions
			};
	 console.log(completedQuiz);
	 
	 $.ajax({
		    contentType: 'application/json',
		    data:JSON.stringify(completedQuiz),
		    dataType: 'json',
		    success: function(data){
		    	//console.log(data);
		    	window.location.replace("../viewResult/" + data);
		    },
		    error: function(){
		 
		    },
		    processData: false,
		    type: 'POST',
		    url: '../completeTest.json'
		});
	 
	 
}





