$(document).ready(function() {
	
	$(window).scroll(function() {
		//$('#query_tweets_header').css("top", $(window).scrollTop());
	});
	
	$("#query_tweets_body .query_tweets_row").live('click', function() {
		$("#query_tweets_body .query_tweets_row").removeClass("active");
		$(this).addClass("active");
	});
	
	$("#query_main_body .query_main_row").live('click', function() {
		$("#query_main_body .query_main_row").removeClass("active");
		$(this).addClass("active");
	});
	
});

function toggleNewQueryForm()
{
	$("#new_query_form").slideToggle('fast');
	$("#new_query_form .field").val('');
	$("#new_query_form .field:first").focus();
}

function toggleQueryControls(dropdown, query_controls_id)
{
	var display = $('#' + query_controls_id).css('display');
	
	if( display == 'none')
		$('#' + dropdown).text('▲');
	else
		$('#' + dropdown).text('▼');
	
	$('#' + query_controls_id).slideToggle('fast');
}

function hideElement(selector)
{
	$('#' + selector).slideToggle('fast');
}

function showElement(selector)
{
	$('#' + selector).slideToggle('fast');
}