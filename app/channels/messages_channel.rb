class MessagesChannel < ApplicationCable::Channel
  #include UsersHelper
  
  def subscribed   
    stream_from "messages_#{params[:chat_id]}"    
  end


  
end