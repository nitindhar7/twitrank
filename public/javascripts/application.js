$(document).ready(function() {
	
	//floatHeaderBar();
	
	$("#searchbar .field").focus();
	
	$("#query_tweets h1 input").live('click', function() {
		var is_checked = $(this).attr("checked");
		
		if (is_checked)
			$('#query_tweets_header').addClass("hoverable");
		else 
			$('#query_tweets_header').removeClass("hoverable");
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

function floatHeaderBar()
{
	$(window).scroll(function() {
		$('#query_tweets_header').css("top", $(window).scrollTop());
	});
}
