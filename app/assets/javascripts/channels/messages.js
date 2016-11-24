function createMessageChannel() {
	var style = '';
	
	
	App.messages = App.cable.subscriptions.create({
		channel: 'MessagesChannel', chat_id: parseInt($("#message_chat_id").val())
	},
	{
		received: function(data) {
			$("#messages").removeClass('hidden');
			
			var current_id = $("#message_user_id").val();			
			
			if (current_id == data.user_id) {								
				style = 'content_ballon_user_current';					
			} else {
				
				style = 'content_ballon';	
			}			
			
			return $('#messages').append(this.renderMessage(data));
		},

		renderMessage: function(data) {					
			return "<ul class='messages'> <li class='"+style+"'>"+ data.message +"</li></ul>";
		}
	});

	return App.messages;
}
