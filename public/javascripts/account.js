$(document).ready(function() {
	$("#nav_tab_account").live('click', function() {
		var display = $("#account").css("display");
		
		if( display == "block" )
			$("#account").remove();
	});
});

function hideElement(selector)
{
	$("#" + selector).remove();
}
