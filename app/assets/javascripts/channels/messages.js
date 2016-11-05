function createMessageChannel() {
	App.messages = App.cable.subscriptions.create({
		channel: 'MessagesChannel', chat_id: parseInt($("#message_chat_id").val())
	},
	{
		received: function(data) {
			$("#messages").removeClass('hidden')
			var teste = function () {
				$("#teste").html('1');
			$('#messages').append(this.renderMessage(data));
			}
			return teste;
		},

		renderMessage: function(data) {
			return "<p> <b>" + data.user + ": </b>" + data.message + "</p>";
		}
	});

	return App.messages;
}