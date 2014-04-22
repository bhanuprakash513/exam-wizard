$(document).ready(function() {
	     $('.edit').editInPlace({
	    	 url: "updateField",
	    	 show_buttons: true,
	    	 error:errorFunc, 
	    	 value_required:true,	    	 
		});
	     
	     $("#avatar_dialog" ).dialog({
	    		autoOpen: false,
	    		height: 200,
				width: 350,
				modal: true,
	    		buttons: {
	    			"Cancel": function() {	    				
	    				$( this ).dialog( "close" );
	    			}
	    			
	    		},
	    		close: function() {
	    			
	    		}
	    	});
	     $("#submit_image" ).click(function() {
	    	 $( '#avatar_dialog' ).dialog( 'close' );
	     });
	     
	     $("#userphoto" ).click(function() {
	    	 $( '#avatar_dialog' ).dialog( 'open' );
	     });
	     
	 });

function errorFunc() {
	
	$('#error').html("Error : Failed to update profile");
}