var oTable;
var users;
var totalUsers = 0;
var pageSize = 10;
var selectedUser;

$(document).ready(function() {
	loadUsers(0, 'id');
	$('#dialog').dialog({
		title : "User Info",
		autoOpen : false,
		height : 350,
		width : 350,
		modal : true,
	});
	$("#activate").click(function(){setUserStaus(1);});
	$("#dectivate").click(function(){setUserStaus(0);});
	$("#resetPass").click(function(){resetPass();});	
});

function showUserInfo() {
	var sRow = fnGetSelected();
	var userId = sRow[0].childNodes[0].childNodes[0].nodeValue;
	var user = getUser(userId);
	selectedUser=user;
	$("#userInfo").empty();
	$("#userInfo").append('<tr><td>Id</td><td>' + user.id + '</td></tr>');
	$("#userInfo").append(
			'<tr><td> Email </td><td>' + user.email + '</td></tr>');
	$("#userInfo").append(
			'<tr><td> First Name </td><td>' + user.firstName + '</td></tr>');
	$("#userInfo").append(
			'<tr><td> Last Name </td><td>' + user.lastName + '</td></tr>');
	$("#userInfo").append(
			'<tr><td> AddessL1 </td><td>' + user.addLine1 + '</td></tr>');
	$("#userInfo").append(
			'<tr><td> AddessL2 </td><td>' + user.addLine2 + '</td></tr>');
	$("#userInfo").append('<tr><td> City </td><td>' + user.city + '</td></tr>');
	$("#userInfo").append(
			'<tr><td> PostalCode </td><td>' + user.postalCode + '</td></tr>');
	$("#userInfo").append(
			'<tr><td> Country </td><td>' + user.country + '</td></tr>');
	$("#userInfo").append(
			'<tr><td> Status </td><td class="uStats">' + user.status + '</td></tr>');
	var btnCaption;
	if (user.status == '1'){
		$("#activate").hide();
		$("#dectivate").show();
	}
	else{
		$("#dectivate").hide();
		$("#activate").show();
	}
	$('#dialog').dialog("open");
}

function resetPass()
{
	$('#dialog').block({ message: 'Processing...' });
	$.ajax({
		type : 'POST',
		data : {'userId':selectedUser.userId},
		url : 'resetPass.json',
		success : function(data) {
			$('#dialog').unblock();
			alert('Password reset successfuly. Please check your mail for new password');
		},
		error : function(e) {
			alert('Internal error');
		},
	});
}

function setUserStaus(status)
{
	$('#dialog').block({ message: 'Processing...' });
	$.ajax({
		type : 'POST',
		data : {'userId':selectedUser.userId,
			'status':status
			},
		url : 'setUserState.json',
		success : function(data) {
			$('#dialog').unblock();
			updateUIStatus(status);
		},
		error : function(e) {
			alert('Internal error');			
		},
	});
}

function updateUIStatus(status){
	$("#userInfo .uStats").text(status);
	if(status=='0'){
		$("#dectivate").hide();			
		$("#activate").show();					
	}else{
		$("#activate").hide();
		$("#dectivate").show();					
	}	
	var sel = fnGetSelected();
	sel[0].childNodes[10].childNodes[0].nodeValue=status;
}

function getUser(userId) {
	for ( var i = 0; i < users.length; i++) {
		if (users[i].id == userId)
			return users[i];
	}
}

function loadUsers(page, orderField) {
	$.ajax({
		contentType : 'application/json',
		dataType : 'json',
		processData : false,
		type : 'GET',
		data : 'offset=' + page * pageSize + '&count=' + pageSize + '&orderBy='
				+ orderField,
		url : 'getUsers.json',

		success : function(data) {
			users = data.users;
			updateUI();
			SetHandler();
		},
		error : function(e) {
			alert('Internal error');
		},
	});
}

function SetHandler() {

	/* Add a click handler to the rows - this could be used as a callback */
	$("#userListTable tbody").click(function(event) {
		$(oTable.fnSettings().aoData).each(function() {
			$(this.nTr).removeClass('row_selected');
		});
		$(event.target.parentNode).addClass('row_selected');
		showUserInfo();
	});
}

/* Get the rows which are currently selected */
function fnGetSelected() {
	var aReturn = new Array();
	var aTrs = oTable.fnGetNodes();

	for ( var i = 0; i < aTrs.length; i++) {
		if ($(aTrs[i]).hasClass('row_selected')) {
			aReturn.push(aTrs[i]);
		}
	}
	return aReturn;
}

function updateUI() {
	// alert(alert(JSON.stringify(data.users)));
	oTable = $('#userListTable').dataTable({
		"sEcho" : 1,
		"iTotalRecords" : users.count,
		"iTotalDisplayRecords" : pageSize,
		"bProcessing" : true,
		"aaData" : users,
		"aoColumns" : [ {
			"mData" : "id",
			"sTitle" : "Id"
		}, {
			"mData" : "userId",
			"sTitle" : "UserId"
		}, {
			"mData" : "email",
			"sTitle" : "Email"
		}, {
			"mData" : "firstName",
			"sTitle" : "First Name"
		}, {
			"mData" : "lastName",
			"sTitle" : "Last Name"
		}, {
			"mData" : "addLine1",
			"sTitle" : "AddessL1"
		}, {
			"mData" : "addLine2",
			"sTitle" : "AddessL2"
		}, {
			"mData" : "city",
			"sTitle" : "City"
		}, {
			"mData" : "postalCode",
			"sTitle" : "PostalCode"
		}, {
			"mData" : "country",
			"sTitle" : "Country"
		}, {
			"mData" : "status",
			"sTitle" : "Status"
		}, ],
		"oTableTools" : {
			"sRowSelect" : "single",
		}
	});

}