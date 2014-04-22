var quiz = {};
var questions = [];
var questionCount = 0;


pageLoadFunctions();

function pageLoadFunctions(){
	$(function() {
		
		
		// initialize questions
		
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
			    url: 'getUnsavedQuiz.json'
			});
		
		/**
		 * Quuiz UI
		 */
		/*$("#add_chk_box_question").fancybox({
				'scrolling' : 'auto',
				'titleShow' : false,
				'autoScale' : 'true',
				'onClosed' : function() {
					
				}
		});*/
		 
		 $( "#check_box_question_form_content" ).dialog({
				autoOpen: false,
				height: 420,
				width: 650,
				modal: true,
				buttons: {
					"Save": function() {
						//alert("Add New question");
						addNewChkBoxQuestion();
						$( this ).dialog( "close" );
					},
					Cancel: function() {
						$( this ).dialog( "close" );
					}
				},
				close: function() {
					//allFields.val( "" );
				}
			});
		 

		 $( "#edit_check_box_question_form_content" ).dialog({
				autoOpen: false,
				height: 420,
				width: 650,
				modal: true,
				buttons: {
					"Save": function() {
						editChkQuestions();
						$( this ).dialog( "close" );
					},
					Cancel: function() {
						$( this ).dialog( "close" );
					}
				},
				close: function() {
					
				}
			});
		 
		 
		 $( "#title_form_content" ).dialog({
				autoOpen: false,
				height: 250,
				width: 600,
				modal: true,
				buttons: {
					"Save": function() {
						$( this ).dialog( "close" );
					},
					Cancel: function() {
						$( this ).dialog( "close" );
					}
				},
				close: function() {
					//allFields.val( "" );
				}
			});
		 
		 
		 $( "#type_form_content" ).dialog({
				autoOpen: false,
				height: 250,
				width: 600,
				modal: true,
				buttons: {
					"Save": function() {
						$( this ).dialog( "close" );
					},
					Cancel: function() {
						$( this ).dialog( "close" );
					}
				},
				close: function() {
					//allFields.val( "" );
				}
			});
		 

		 
		 
		 $( "#quiz_complete_dialog" ).dialog({
				autoOpen: false,
				height: 'auto',
				width: 'auto',
				modal: true,
				buttons: {
					"OK": function() {
						
						$( this ).dialog( "close" );
						window.location.replace("myQuizzes");
					},
		 			"Create Another Quiz":function(){
		 				window.location.replace(document.URL);
		 			}
					
				},
				close: function() {
					window.location.replace(document.URL);
				}
			});
		
		
		
		
		$("#create_question")
			.button()
			.click(function() {
					$( "#check_box_question_form_content" ).dialog( "open" );
		});
		


		
		$("#save_quiz").click(function() {
			 quiz.title = $('#create_quiz_title').val();
			 quiz.type = $('#create_quiz_type').val();
			 quiz.id = 	$('#quiz_id').val();
			 createQuiz(quiz);
		});
		
		$("#cancel_quiz").click(function() {
			 cancelQuiz();
		});
		

		$("#complete_quiz").click(function() {
			//alert("complete");
			completeQuiz();
		});
		
	});
}


function showQuestionDialogBox(){
		$( "#check_box_question_form_content" ).dialog( "open" );

}


function showTitleDialogBox(){
	$( "#title_form_content" ).dialog( "open" );

}


function showTypeDialogBox(){
	$( "#type_form_content" ).dialog( "open" );

}

function addNewChkBoxQuestion(){
	
		 quiz.title = $('#create_quiz_title').val();
		 quiz.type = $('#create_quiz_type').val();
		 quiz.id = 	$('#quiz_id').val();
		
		 var question = {
				 	"title":$('#chk_question_title').val(),
				 	"answers":[],
				 	"type":"multi"
				 };
		 
		 questionCount++;
		
		$('#check_box_question_set textarea').each(
			    function(index){ 
			    	
			    	var answers = [];
			        var input = $(this);
			        var id = input.attr("id");
			        var number = id.split("_")[3];//id.substr(id.length - 1);
			      
			        var correct = false;
			        var answer = {
			        		"title": input.val(),
			        		"id" : number,
			        		"correct":false
			        };
			        
			        input.val("");
			        
			        try{
			        	answer.correct = $("#check_box_question_set #chk_answer_correct_" + number).is(":checked");
			        	$("#check_box_question_set #chk_answer_correct_" + number).prop("checked", false);
			        }catch(err){
			        	alert(err);
			        }
			        
			        question.answers.push(answer);
			       
			    }
			);
		quiz.questions.push(question);
		$('#chk_question_title').val("");
		
		createQuiz(quiz);
	
}






/** Create Quiz Ajax Function**/
function createQuiz(jsonQuizObject){
	
	$.ajax({
	    contentType: 'application/json',
	    data:JSON.stringify(jsonQuizObject),
	    dataType: 'json',
	    success: function(data){
	    	updateUI(data);
	    },
	    error: function(){
	 
	    },
	    processData: false,
	    type: 'POST',
	    url: 'createQuizJson.json'
	});
}

function updateUI(questionData){
	
	if(questionData!=null){
		 quiz = questionData;
		 $('#create_quiz_title').val(questionData.title);
		 $('#create_quiz_type').val(questionData.type);
		 $('#quiz_id').val(questionData.id);
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
				 questionContent += ' <table>';
				
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
				 questionContent += '<button id="edit_question_' + qId + '" title="Edit" onclick="openEditDialog('+ qId +')"> Edit </button>';
				 questionContent += '<button id="delete_question_' + qId + '" title="Delete" onclick="deleteQuestion('+questionData.id+','+qId+')"> Delete </button>';
				 questionContent += '';
				    
				 questionContent +=  '</div>';
				// questionContent += '</fieldset>';
				 questionContent += '</form>';
				 questionContent += '</div>';
			 });
			 
		 }
		 
		 $('#question_details_content').html(questionContent);
		 
		 
	}
	
}

function openEditDialog(qid){
	
	var qType = $('#chk_question_type_'+qid).val();
	$('#edit_check_question_id').val(qid);
	$('#edit_chk_question_title').val($('#chk_question_title_'+qid).val());
	$('#edit_check_operation_type').val(qType);
	
	var answerContent = '<table>';
	
	$('#check_box_question_set_'+qid+' textarea').each(
		    function(index){ 
		    		
		    	 	var input = $(this);
		    	 	
			        var id = input.attr("id");
			        var number = id.split("_")[3]; //id.substr(id.length - 1);
			        
			        var isChecked =  $('#check_box_question_set_'+qid+' #chk_answer_correct_' + number).is(':checked');
	
		   
			        answerContent += '<tr><td>';
					 if(qType=='single'){
						 answerContent +=	'<input type="radio" id="edit_chk_answer_correct_'+ number +'"  name="edit_chk_answer_correct_'+ number +'"';
					 }else{
						 answerContent +=	'<input type="checkbox" id="edit_chk_answer_correct_'+ number +'"  name="edit_chk_answer_correct_'+ number +'"';
					 }
					 
					 if(isChecked){
						 answerContent += ' checked';
					 }
					 answerContent += '></td>';
					 answerContent +=	'<td><textarea rows="1" cols="66" id="edit_chk_answer_text_'+ number +'" name="edit_chk_answer_text_'+ number +'" >'+input.val()+'</textarea></td>';
					 answerContent += '</tr>';
				
		    }
		);
	
	answerContent += "</table>";
	
	
	$('#edit_check_box_question_set').html(answerContent);
	$( '#edit_check_box_question_form_content' ).dialog( 'open' );
	
}

function editChkQuestions(){
	
	var questionId = $('#edit_check_question_id').val();
	 quiz.title = $('#create_quiz_title').val();
	 quiz.type = $('#create_quiz_type').val();
	 quiz.id = 	$('#quiz_id').val();
	
	 var editQuestion = {
			 	"title":$('#edit_chk_question_title').val(),
			 	"answers":[],
			 	"type":"multi",
			 	"questionId":questionId
			 };
	
	$('#edit_check_box_question_set textarea').each(
		    function(index){ 
		    	
		        var input = $(this);
		        var id = input.attr("id");
		        var number = id.split("_")[4];// id.substr(id.length - 1);
		        
		        var answer = {
		        		"title": input.val(),
		        		"id" : number,
		        		"correct":false
		        };
		        
		       
		        
		        try{
		        	var chk_id = "#edit_chk_answer_correct_" + number;
		        	answer.correct = $(chk_id).is(":checked");
		        	$(chk_id).prop("checked", false);
		        }catch(err){
		        	alert(err);
		        }
		        input.val("");
		       // console.log(answer);
		        editQuestion.answers.push(answer);
		    }
		);
	
	$('#edit_chk_question_title').val("");
	var questionsToEdit = quiz.questions;
	var indexToRemove = -1;
	//console.log(editQuestion);
	
	for(var p=0;p<questionsToEdit.length;p++){
		if(questionId==questionsToEdit[p].questionId){
			indexToRemove = p;
			break;
		}
	}
	if(indexToRemove>-1){
		quiz.questions.splice(indexToRemove, 1, editQuestion);
	}
	createQuiz(quiz);
}

function deleteQuestion(quizId,questionId){

	$.ajax({
	    contentType: 'application/json',
	    data:JSON.stringify(
	    		{
	    			"questionId":questionId,
	    			"quizIdentifier":quizId
	    		}
	    ),
	    dataType: 'json',
	    success: function(data){
	    	updateUI(data);
	    },
	    error: function(){
	 
	    },
	    processData: false,
	    type: 'POST',
	    url: 'deleteQuestion.json'
	});
}
	

function completeQuiz(){
	 quiz.title = $('#create_quiz_title').val();
	 quiz.type = $('#create_quiz_type').val();
	 quiz.id = 	$('#quiz_id').val();
	if(quiz==null) return;
	if(quiz.title==null || !quiz.title.trim())return;
	if(quiz.id==null)return;
	if(quiz.questions==null || quiz.questions.length <= 0)return;
	$.ajax({
	    contentType: 'application/json',
	    data:JSON.stringify(
	    		quiz
	    ),
	    dataType: 'json',
	    success: function(data){
	    	//console.log(data);
	    	//alert($("#quiz_complete_title").html());
	    	
	    	if("COMPLETE" === data.status){
	    		$("#quiz_complete_title").html(data.title + " Created");
		    	//$("#quiz_type").html(data.type);
	    		$( '#quiz_complete_dialog' ).dialog( 'open' );
	    	}else{
	    		alert("There was problem completing the quiz");
	    	}
	    },
	    error: function(){
	 
	    },
	    processData: false,
	    type: 'POST',
	    url: 'completeQuizJson.json'
	});
}

function cancelQuiz(){
	$.ajax({
	    contentType: 'application/json',
	    data:JSON.stringify(
	    		quiz
	    ),
	    dataType: 'json',
	    success: function(data){
	    	console.log(data);
	   	 	$('#question_details_content').html('');
	    },
	    error: function(){
	 
	    },
	    processData: false,
	    type: 'POST',
	    url: 'cancelQuizJson.json'
	});
}






