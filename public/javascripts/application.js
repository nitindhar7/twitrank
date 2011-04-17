$(document).ready(function() {
	

	
});

function toggleNewQueryForm()
{
	$("#new_query_form").slideToggle('fast');
	$("#new_query_form .field").val('');
	$("#new_query_form .field:first").focus();
}