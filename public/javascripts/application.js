$(document).ready(function() {
	
	$('#query').focus();
	
	$("#query_tweets_body .query_tweets_row").live('click', function() {
		$("#query_tweets_body .query_tweets_row").removeClass("active");
		$(this).addClass("active");
	});
	
	$("#query_main_body .query_main_row").live('click', function() {
		$("#query_main_body .query_main_row").removeClass("active");
		$(this).addClass("active");
	});
	
	$("#query").autocomplete('/searches/autocomplete.js', {
        max: 11,
    })
	
	$("#notice").live('click', function() {
		$("#notice").text('');
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

function addCustomClass(selector, customClass)
{
	$('#' + selector).addClass(customClass);
}