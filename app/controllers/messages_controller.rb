class MessagesController < ApplicationController
  

  def create
    message = Message.new(message_params)
    
    _user_to = Subscription.find_by('chat_id = ? AND NOT user_id = ?', message.chat_id, current_user)
    message.user_to = _user_to.user_id
        
    if _user_to.active.eql?('1')
        message.status = '2'
    
    else
        message.status = '1'    
    end 

    if message.save
      

      
     
      ActionCable.server.broadcast( "messages_#{message_params[:chat_id]}",
      #broadcasting out to messages channel, which all chats are linked to messages channel
      message: message.content,
      user: message.user.username,
      user_id: message.user_id,
      current_user: current_user.id
      
      )
    else
      redirect_to chats_path
    end
  end

  private
    def message_params
      params.require(:message).permit(:content, :chat_id, :user_id, :user_to)
    end

    
end

