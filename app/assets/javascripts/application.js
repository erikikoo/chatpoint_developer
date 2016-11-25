// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs

//= require moment
//= require bootstrap-datetimepicker
//= require twitter/bootstrap/modal
//= require turbolinks
//= require bootstrap-toggle
//= require_tree .
//= require_tree ./channels

$(document).on('ready page:change', function() {
  $('input[type="checkbox"].toggle').bootstrapToggle(); // assumes the checkboxes have the class "toggle"


});

jQuery(document).ready(function($) {
	
	var local = window.location.pathname;
	var temp = local.slice(-6);
	
	if (temp == '/chats') {
		setInterval(function(){
			getUserOnline();
		},5000);
	}
});

function getUserOnline() {
	$.ajax({
		url: '/user-online',		
	})
	.done(function(data) {
		console.log("sucesso");
	})
	.fail(function() {
		console.log("error");
	})
	.always(function() {
		console.log("complete");
	});
	
}




