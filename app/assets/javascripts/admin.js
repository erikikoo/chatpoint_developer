jQuery(document).ready(function($) {
	$('#client_cliente').blur(function(event) {
		 var cliente = $(this).value();
		// var url = window.location.pathname +"/"+cliente;
		// $("#client_url").attr('disabled', 'disabled').value(url);
		alert(cliente);

	});
	
});
