$(document).ready(function() {
	$("#login form .field:first").focus();
	
	$("#login").live({
		mouseenter:
			function() {
				$(this).animate({ backgroundColor: '#333' }, 500, function() {});
			},
		mouseleave:
			function() {
				$(this).animate({ backgroundColor: '#111' }, 500, function() {});
			}
	});
	
	$("#signup").live({
		mouseenter:
			function() {
				$(this).animate({ backgroundColor: '#333' }, 500, function() {});
			},
		mouseleave:
			function() {
				$(this).animate({ backgroundColor: '#111' }, 500, function() {});
			}
	});
	
	$("#topics .topic").live({
		mouseenter:
			function() {
				$(this).animate({ backgroundColor: '#333' }, 500, function() {});
			},
		mouseleave:
			function() {
				$(this).animate({ backgroundColor: '#111' }, 500, function() {});
			}
	});
});

function expandSignup()
{
	$("#logo").animate({ marginTop: '0px' }, 200, function() {});
	$("#authentication").animate({ height: '540px' }, 200, function() {});
	$("#signup").animate({ height: '500px' }, 200, function() {});
}
